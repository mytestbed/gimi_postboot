# Really really quick guide

## Create a slice

Go to portal.geni.net and log in.

Go to the list of projects. https://portal.geni.net/secure/projects.php

Click 'Create Slice' button next to a project, e.g. 'max_mystery_project'

Follow the guide, give it a name. e.g. 'lw-test-09'

Then click 'Create Slice'

Done. You will be redirected to the slice page.

## Add resources

On the slice page. Click 'Add Resources'

Follow the guide, choose an existing rspec file from the list, or, upload the file in this repo('import Rspec from file: ')

This test rspec file contains link to the post boot files.

Then choose an aggregate from the list, e.g. (GPO InstaGENI)

Click 'Reserve Resources'

Then wait..........................................................................................................

Then eventually you will see a page titled 'Creating Sliver on slice: lw-test-09'

Then wait..........................................................................................................

Then eventually you will be able to log into the resources described on the page.

If you have multiple SSH keys, check what has been uploaded to the GENI portal and use -i option, e.g.

ssh -i ~/.ssh/bob_priv_key bob@pc111115.instageni.gpolab.bbn.com -p 40200

## Change to this repo

gimibot.sh will load postboot (for InstaGENI) or postboot_exo (for ExoGENI).

prepare_rc.sh contains all the hacks to set up RC config file.

It also contains part to touch a /etc/topology.txt file. Currently it is hard coded, but should eventually be generated dynamically based on rspec.

## What are the options set for RC

It uses hostname + slicename as its unique id, i.e. pubsub topic name.

It uses amqp://gimi3.casa.umass.edu as AMQP server.

It uses tcp:srv.mytestbed.net as OML server.

It does ping to the nodes listed in /etc/topology.txt, and write to table named 'omf_rc_edges', specified by oml-domain.
