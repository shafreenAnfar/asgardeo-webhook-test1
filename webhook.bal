import ballerinax/trigger.asgardeo;
import ballerina/http;
import ballerina/io;
import ballerina/log;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:RegistrationService on webhookListener {
  
    remote function onAddUser(asgardeo:AddUserEvent event ) returns error? {
      io:println("Add user message received");
      log:printInfo("Add user message received");
    }
    remote function onConfirmSelfSignup(asgardeo:GenericEvent event ) returns error? {
      io:println("On Confirm Self Signup message received");
      log:printInfo("On Confirm Self Signup message received");
    }
    remote function onAcceptUserInvite(asgardeo:GenericEvent event ) returns error? {
      io:println("On Accept User Invite message received");
      log:printInfo("On Accept User Invite message received");
    }
}

service /ignore on httpListener {}