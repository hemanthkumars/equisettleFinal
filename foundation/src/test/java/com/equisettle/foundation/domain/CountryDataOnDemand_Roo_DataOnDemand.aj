// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Country;
import com.equisettle.foundation.domain.CountryDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CountryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CountryDataOnDemand: @Component;
    
    private Random CountryDataOnDemand.rnd = new SecureRandom();
    
    private List<Country> CountryDataOnDemand.data;
    
    public Country CountryDataOnDemand.getNewTransientCountry(int index) {
        Country obj = new Country();
        setCountry(obj, index);
        return obj;
    }
    
    public void CountryDataOnDemand.setCountry(Country obj, int index) {
        String country = "country_" + index;
        if (country.length() > 255) {
            country = country.substring(0, 255);
        }
        obj.setCountry(country);
    }
    
    public Country CountryDataOnDemand.getSpecificCountry(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Country obj = data.get(index);
        Integer id = obj.getCountryId();
        return Country.findCountry(id);
    }
    
    public Country CountryDataOnDemand.getRandomCountry() {
        init();
        Country obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getCountryId();
        return Country.findCountry(id);
    }
    
    public boolean CountryDataOnDemand.modifyCountry(Country obj) {
        return false;
    }
    
    public void CountryDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Country.findCountryEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Country' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Country>();
        for (int i = 0; i < 10; i++) {
            Country obj = getNewTransientCountry(i);
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
