// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseDocument;
import com.equisettle.foundation.domain.CaseDocumentDataOnDemand;
import com.equisettle.foundation.domain.CaseDocumentIntegrationTest;
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

privileged aspect CaseDocumentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CaseDocumentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CaseDocumentIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CaseDocumentIntegrationTest: @Transactional;
    
    @Autowired
    CaseDocumentDataOnDemand CaseDocumentIntegrationTest.dod;
    
    @Test
    public void CaseDocumentIntegrationTest.testCountCaseDocuments() {
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to initialize correctly", dod.getRandomCaseDocument());
        long count = CaseDocument.countCaseDocuments();
        Assert.assertTrue("Counter for 'CaseDocument' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CaseDocumentIntegrationTest.testFindCaseDocument() {
        CaseDocument obj = dod.getRandomCaseDocument();
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to initialize correctly", obj);
        Integer id = obj.getCaseDocumentId();
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to provide an identifier", id);
        obj = CaseDocument.findCaseDocument(id);
        Assert.assertNotNull("Find method for 'CaseDocument' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'CaseDocument' returned the incorrect identifier", id, obj.getCaseDocumentId());
    }
    
    @Test
    public void CaseDocumentIntegrationTest.testFindAllCaseDocuments() {
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to initialize correctly", dod.getRandomCaseDocument());
        long count = CaseDocument.countCaseDocuments();
        Assert.assertTrue("Too expensive to perform a find all test for 'CaseDocument', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<CaseDocument> result = CaseDocument.findAllCaseDocuments();
        Assert.assertNotNull("Find all method for 'CaseDocument' illegally returned null", result);
        Assert.assertTrue("Find all method for 'CaseDocument' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CaseDocumentIntegrationTest.testFindCaseDocumentEntries() {
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to initialize correctly", dod.getRandomCaseDocument());
        long count = CaseDocument.countCaseDocuments();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<CaseDocument> result = CaseDocument.findCaseDocumentEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'CaseDocument' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'CaseDocument' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CaseDocumentIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to initialize correctly", dod.getRandomCaseDocument());
        CaseDocument obj = dod.getNewTransientCaseDocument(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'CaseDocument' identifier to be null", obj.getCaseDocumentId());
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
        Assert.assertNotNull("Expected 'CaseDocument' identifier to no longer be null", obj.getCaseDocumentId());
    }
    
    @Test
    public void CaseDocumentIntegrationTest.testRemove() {
        CaseDocument obj = dod.getRandomCaseDocument();
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to initialize correctly", obj);
        Integer id = obj.getCaseDocumentId();
        Assert.assertNotNull("Data on demand for 'CaseDocument' failed to provide an identifier", id);
        obj = CaseDocument.findCaseDocument(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'CaseDocument' with identifier '" + id + "'", CaseDocument.findCaseDocument(id));
    }
    
}
