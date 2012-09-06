package com.neosavvy;

import com.yammer.dropwizard.Service;
import com.yammer.dropwizard.config.Environment;

public class AttachmentService extends Service<AttachmentConfiguration> {

    public static void main(String[] args) throws Exception
    {
        new AttachmentService().run(args);
    }

    private AttachmentService()
    {
        super("attachment-service");
    }


    @Override
    protected void initialize(AttachmentConfiguration userConfiguration, Environment environment) throws Exception {
        environment.addResource(new AttachmentResource( userConfiguration.getUploadDirectory() ));
    }
}
