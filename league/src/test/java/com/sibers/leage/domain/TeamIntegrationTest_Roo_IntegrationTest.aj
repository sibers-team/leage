// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sibers.leage.domain;

import com.sibers.leage.domain.TeamDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TeamIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TeamIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TeamIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TeamIntegrationTest: @Transactional;
    
    @Autowired
    private TeamDataOnDemand TeamIntegrationTest.dod;
    
    @Test
    public void TeamIntegrationTest.testCountTeams() {
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", dod.getRandomTeam());
        long count = com.sibers.leage.domain.Team.countTeams();
        org.junit.Assert.assertTrue("Counter for 'Team' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TeamIntegrationTest.testFindTeam() {
        com.sibers.leage.domain.Team obj = dod.getRandomTeam();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Team.findTeam(id);
        org.junit.Assert.assertNotNull("Find method for 'Team' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Team' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TeamIntegrationTest.testFindAllTeams() {
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", dod.getRandomTeam());
        long count = com.sibers.leage.domain.Team.countTeams();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Team', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.sibers.leage.domain.Team> result = com.sibers.leage.domain.Team.findAllTeams();
        org.junit.Assert.assertNotNull("Find all method for 'Team' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Team' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TeamIntegrationTest.testFindTeamEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", dod.getRandomTeam());
        long count = com.sibers.leage.domain.Team.countTeams();
        if (count > 20) count = 20;
        java.util.List<com.sibers.leage.domain.Team> result = com.sibers.leage.domain.Team.findTeamEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Team' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Team' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TeamIntegrationTest.testFlush() {
        com.sibers.leage.domain.Team obj = dod.getRandomTeam();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Team.findTeam(id);
        org.junit.Assert.assertNotNull("Find method for 'Team' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTeam(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Team' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TeamIntegrationTest.testMerge() {
        com.sibers.leage.domain.Team obj = dod.getRandomTeam();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Team.findTeam(id);
        boolean modified =  dod.modifyTeam(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.sibers.leage.domain.Team merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Team' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TeamIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", dod.getRandomTeam());
        com.sibers.leage.domain.Team obj = dod.getNewTransientTeam(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Team' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Team' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TeamIntegrationTest.testRemove() {
        com.sibers.leage.domain.Team obj = dod.getRandomTeam();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Team' failed to provide an identifier", id);
        obj = com.sibers.leage.domain.Team.findTeam(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Team' with identifier '" + id + "'", com.sibers.leage.domain.Team.findTeam(id));
    }
    
}
