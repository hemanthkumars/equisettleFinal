// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Case;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

privileged aspect Case_Roo_ToString {
    
    public String Case.toString() {
        return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("caseDocuments", "caseNegotiations", "caseTypeId", "caseInitiatedClientId", "caseOnClientId", "caseStatusId", "clientIdWhoVowsMoney", "clientIdWhoClaimsMoney", "mediatorId").toString();
    }
    
}