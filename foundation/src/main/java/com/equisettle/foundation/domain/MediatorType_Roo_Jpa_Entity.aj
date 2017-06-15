// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.MediatorType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect MediatorType_Roo_Jpa_Entity {
    
    declare @type: MediatorType: @Entity;
    
    declare @type: MediatorType: @Table(name = "mediator_type");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MEDIATOR_TYPE_ID")
    private Integer MediatorType.mediatorTypeId;
    
    public Integer MediatorType.getMediatorTypeId() {
        return this.mediatorTypeId;
    }
    
    public void MediatorType.setMediatorTypeId(Integer id) {
        this.mediatorTypeId = id;
    }
    
}
