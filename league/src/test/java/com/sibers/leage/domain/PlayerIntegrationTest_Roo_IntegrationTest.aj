// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sibers.leage.domain;

import com.sibers.leage.domain.PlayerDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PlayerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PlayerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PlayerIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: PlayerIntegrationTest: @Transactional;
    
    @Autowired
    private PlayerDataOnDemand PlayerIntegrationTest.dod;
    
    @Test
    public void PlayerIntegrationTest.testCountPlayers() {
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", dod.getRandomPlayer());
        long count = com.sibers.leage.domain.Player.countPlayers();
        org.junit.Assert.assertTrue("Counter for 'Player' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PlayerIntegrationTest.testFindPlayer() {
        com.sibers.leage.domain.Player obj = dod.getRandomPlayer();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Player.findPlayer(id);
        org.junit.Assert.assertNotNull("Find method for 'Player' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Player' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PlayerIntegrationTest.testFindAllPlayers() {
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", dod.getRandomPlayer());
        long count = com.sibers.leage.domain.Player.countPlayers();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Player', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.sibers.leage.domain.Player> result = com.sibers.leage.domain.Player.findAllPlayers();
        org.junit.Assert.assertNotNull("Find all method for 'Player' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Player' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PlayerIntegrationTest.testFindPlayerEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", dod.getRandomPlayer());
        long count = com.sibers.leage.domain.Player.countPlayers();
        if (count > 20) count = 20;
        java.util.List<com.sibers.leage.domain.Player> result = com.sibers.leage.domain.Player.findPlayerEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Player' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Player' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PlayerIntegrationTest.testFlush() {
        com.sibers.leage.domain.Player obj = dod.getRandomPlayer();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Player.findPlayer(id);
        org.junit.Assert.assertNotNull("Find method for 'Player' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPlayer(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Player' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PlayerIntegrationTest.testMerge() {
        com.sibers.leage.domain.Player obj = dod.getRandomPlayer();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Player.findPlayer(id);
        boolean modified =  dod.modifyPlayer(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.sibers.leage.domain.Player merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Player' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PlayerIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", dod.getRandomPlayer());
        com.sibers.leage.domain.Player obj = dod.getNewTransientPlayer(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Player' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Player' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PlayerIntegrationTest.testRemove() {
        com.sibers.leage.domain.Player obj = dod.getRandomPlayer();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Player' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Player.findPlayer(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Player' with identifier '" + id + "'", com.sibers.leage.domain.Player.findPlayer(id));
    }
    
}
