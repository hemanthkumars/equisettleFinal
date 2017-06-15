// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseDataOnDemand;
import com.equisettle.foundation.domain.CaseDocument;
import com.equisettle.foundation.domain.CaseDocumentDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CaseDocumentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CaseDocumentDataOnDemand: @Component;
    
    private Random CaseDocumentDataOnDemand.rnd = new SecureRandom();
    
    private List<CaseDocument> CaseDocumentDataOnDemand.data;
    
    @Autowired
    CaseDataOnDemand CaseDocumentDataOnDemand.caseDataOnDemand;
    
    public CaseDocument CaseDocumentDataOnDemand.getNewTransientCaseDocument(int index) {
        CaseDocument obj = new CaseDocument();
        setAuditCreatedDtTime(obj, index);
        setCaseDocumentUrl(obj, index);
        return obj;
    }
    
    public void CaseDocumentDataOnDemand.setAuditCreatedDtTime(CaseDocument obj, int index) {
        Calendar auditCreatedDtTime = Calendar.getInstance();
        obj.setAuditCreatedDtTime(auditCreatedDtTime);
    }
    
    public void CaseDocumentDataOnDemand.setCaseDocumentUrl(CaseDocument obj, int index) {
        String caseDocumentUrl = "caseDocumentUrl_" + index;
        if (caseDocumentUrl.length() > 255) {
            caseDocumentUrl = caseDocumentUrl.substring(0, 255);
        }
        obj.setCaseDocumentUrl(caseDocumentUrl);
    }
    
    public CaseDocument CaseDocumentDataOnDemand.getSpecificCaseDocument(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CaseDocument obj = data.get(index);
        Integer id = obj.getCaseDocumentId();
        return CaseDocument.findCaseDocument(id);
    }
    
    public CaseDocument CaseDocumentDataOnDemand.getRandomCaseDocument() {
        init();
        CaseDocument obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getCaseDocumentId();
        return CaseDocument.findCaseDocument(id);
    }
    
    public boolean CaseDocumentDataOnDemand.modifyCaseDocument(CaseDocument obj) {
        return false;
    }
    
    public void CaseDocumentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CaseDocument.findCaseDocumentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CaseDocument' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CaseDocument>();
        for (int i = 0; i < 10; i++) {
            CaseDocument obj = getNewTransientCaseDocument(i);
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
            data.add(obj);
        }
    }
    
}
