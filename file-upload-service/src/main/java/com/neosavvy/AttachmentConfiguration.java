package com.neosavvy;

import com.yammer.dropwizard.config.Configuration;

public class AttachmentConfiguration extends Configuration {

    private String uploadDirectory;

    public String getUploadDirectory() {
        return uploadDirectory;
    }

    public void setUploadDirectory(String uploadDirectory) {
        this.uploadDirectory = uploadDirectory;
    }
}
