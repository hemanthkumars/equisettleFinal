// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.MediatorType;
import com.equisettle.foundation.domain.MediatorTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect MediatorTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MediatorTypeDataOnDemand: @Component;
    
    private Random MediatorTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<MediatorType> MediatorTypeDataOnDemand.data;
    
    public MediatorType MediatorTypeDataOnDemand.getNewTransientMediatorType(int index) {
        MediatorType obj = new MediatorType();
        setMediatorType(obj, index);
        return obj;
    }
    
    public void MediatorTypeDataOnDemand.setMediatorType(MediatorType obj, int index) {
        String mediatorType = "mediatorType_" + index;
        if (mediatorType.length() > 255) {
            mediatorType = mediatorType.substring(0, 255);
        }
        obj.setMediatorType(mediatorType);
    }
    
    public MediatorType MediatorTypeDataOnDemand.getSpecificMediatorType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        MediatorType obj = data.get(index);
        Integer id = obj.getMediatorTypeId();
        return MediatorType.findMediatorType(id);
    }
    
    public MediatorType MediatorTypeDataOnDemand.getRandomMediatorType() {
        init();
        MediatorType obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getMediatorTypeId();
        return MediatorType.findMediatorType(id);
    }
    
    public boolean MediatorTypeDataOnDemand.modifyMediatorType(MediatorType obj) {
        return false;
    }
    
    public void MediatorTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = MediatorType.findMediatorTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'MediatorType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<MediatorType>();
        for (int i = 0; i < 10; i++) {
            MediatorType obj = getNewTransientMediatorType(i);
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
