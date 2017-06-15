// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Case;
import com.equisettle.foundation.domain.Mediator;
import com.equisettle.foundation.domain.MediatorType;
import java.util.Calendar;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Mediator_Roo_DbManaged {
    
    @OneToMany(mappedBy = "mediatorId")
    private Set<Case> Mediator.case1s;
    
    @ManyToOne
    @JoinColumn(name = "MEDIATOR_TYPE_ID", referencedColumnName = "MEDIATOR_TYPE_ID")
    private MediatorType Mediator.mediatorTypeId;
    
    @Column(name = "MEDIATOR_NAME", length = 255)
    private String Mediator.mediatorName;
    
    @Column(name = "MEDIATOR_ADDRESS", length = 255)
    private String Mediator.mediatorAddress;
    
    @Column(name = "AUDIT_CRATED_DT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Mediator.auditCratedDtTime;
    
    public Set<Case> Mediator.getCase1s() {
        return case1s;
    }
    
    public void Mediator.setCase1s(Set<Case> case1s) {
        this.case1s = case1s;
    }
    
    public MediatorType Mediator.getMediatorTypeId() {
        return mediatorTypeId;
    }
    
    public void Mediator.setMediatorTypeId(MediatorType mediatorTypeId) {
        this.mediatorTypeId = mediatorTypeId;
    }
    
    public String Mediator.getMediatorName() {
        return mediatorName;
    }
    
    public void Mediator.setMediatorName(String mediatorName) {
        this.mediatorName = mediatorName;
    }
    
    public String Mediator.getMediatorAddress() {
        return mediatorAddress;
    }
    
    public void Mediator.setMediatorAddress(String mediatorAddress) {
        this.mediatorAddress = mediatorAddress;
    }
    
    public Calendar Mediator.getAuditCratedDtTime() {
        return auditCratedDtTime;
    }
    
    public void Mediator.setAuditCratedDtTime(Calendar auditCratedDtTime) {
        this.auditCratedDtTime = auditCratedDtTime;
    }
    
}