Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10mKG0-0001FZ-00
	for mtd@imladris.demon.co.uk; Tue, 25 May 1999 17:40:48 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Tue, 25 May 1999 17:40:48 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 927650404:20:23484:3; Tue, 25 May 99 16:40:04 GMT
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@imladris.demon.co.uk
	id 10mKEk-0008Vd-00; Tue, 25 May 1999 17:39:30 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@imladris.demon.co.uk
	id 10mKEk-0006fk-00; Tue, 25 May 1999 17:39:30 +0100
To: mtd@imladris.demon.co.uk
Subject: RFC: Disk-On-Chip filesystem. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 May 1999 17:39:30 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10mKEk-0006fk-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


>From looking at the data stored in the 4Mb device I've got here, it doesn't 
look like M-Systems' latest 'TrueFFS' is in fact a form of FTL.

So I'm a little lost as to what to do with the device. Offhand, I can identify 
two options:

1. Reformat the device with FTL.
 Pros:	It works immediately (well, as soon as I work out how to physically
		write to the device, anyway).

 Cons:	FTL is patented in some legally-backward parts of the world.
	The built-in BIOS code stops working -> we have to write our own
		bootloader that runs from the flash.


2. Try to decipher the format that's actually used.
 Pros:	Data will be interchangeable between DOS and Linux on the devices.
	Standard bootloaders will work, via the BIOS.

 Cons:	It may prove difficult and slow to reverse-engineer the filesystem.
	It may turn out to be a FAT-specific hack, rather than the general
		block-device that FTL provides.


Comments / Suggestions / Enlightenment?

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
