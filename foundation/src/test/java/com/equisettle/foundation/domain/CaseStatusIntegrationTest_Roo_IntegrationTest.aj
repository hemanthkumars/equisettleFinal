// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseStatus;
import com.equisettle.foundation.domain.CaseStatusDataOnDemand;
import com.equisettle.foundation.domain.CaseStatusIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CaseStatusIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CaseStatusIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CaseStatusIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CaseStatusIntegrationTest: @Transactional;
    
    @Autowired
    CaseStatusDataOnDemand CaseStatusIntegrationTest.dod;
    
    @Test
    public void CaseStatusIntegrationTest.testCountCaseStatuses() {
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to initialize correctly", dod.getRandomCaseStatus());
        long count = CaseStatus.countCaseStatuses();
        Assert.assertTrue("Counter for 'CaseStatus' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CaseStatusIntegrationTest.testFindCaseStatus() {
        CaseStatus obj = dod.getRandomCaseStatus();
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to initialize correctly", obj);
        Integer id = obj.getCaseStatusId();
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to provide an identifier", id);
        obj = CaseStatus.findCaseStatus(id);
        Assert.assertNotNull("Find method for 'CaseStatus' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'CaseStatus' returned the incorrect identifier", id, obj.getCaseStatusId());
    }
    
    @Test
    public void CaseStatusIntegrationTest.testFindAllCaseStatuses() {
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to initialize correctly", dod.getRandomCaseStatus());
        long count = CaseStatus.countCaseStatuses();
        Assert.assertTrue("Too expensive to perform a find all test for 'CaseStatus', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<CaseStatus> result = CaseStatus.findAllCaseStatuses();
        Assert.assertNotNull("Find all method for 'CaseStatus' illegally returned null", result);
        Assert.assertTrue("Find all method for 'CaseStatus' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CaseStatusIntegrationTest.testFindCaseStatusEntries() {
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to initialize correctly", dod.getRandomCaseStatus());
        long count = CaseStatus.countCaseStatuses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<CaseStatus> result = CaseStatus.findCaseStatusEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'CaseStatus' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'CaseStatus' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CaseStatusIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to initialize correctly", dod.getRandomCaseStatus());
        CaseStatus obj = dod.getNewTransientCaseStatus(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'CaseStatus' identifier to be null", obj.getCaseStatusId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'CaseStatus' identifier to no longer be null", obj.getCaseStatusId());
    }
    
    @Test
    public void CaseStatusIntegrationTest.testRemove() {
        CaseStatus obj = dod.getRandomCaseStatus();
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to initialize correctly", obj);
        Integer id = obj.getCaseStatusId();
        Assert.assertNotNull("Data on demand for 'CaseStatus' failed to provide an identifier", id);
        obj = CaseStatus.findCaseStatus(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'CaseStatus' with identifier '" + id + "'", CaseStatus.findCaseStatus(id));
    }
    
}
