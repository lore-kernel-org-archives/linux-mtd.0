Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1444wE-00035b-00
	for mtd-list@infradead.org; Thu, 07 Dec 2000 17:34:34 +0000
Received: from cr53988-a.rchrd1.on.wave.home.com
	([24.112.95.30] helo=thegravitywell.dhs.org ident=michealk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1444wC-00035V-00
	for mtd@infradead.org; Thu, 07 Dec 2000 17:34:32 +0000
Received: from morpheus.espial.com (espial.com [209.47.49.78])
	by thegravitywell.dhs.org (8.10.1/8.10.1) with SMTP id eB7H9fe18152
	for <mtd@infradead.org>; Thu, 7 Dec 2000 12:09:42 -0500 (EST)
From: Micheal Kelly <michealk@thegravitywell.dhs.org>
Reply-To: michealk@thegravitywell.dhs.org
Date: Thu, 7 Dec 2000 12:34:30 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: MTD & JFFS on Arcom SBC
MIME-Version: 1.0
Message-Id: <0012071234300I.24907@morpheus.espial.com>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all,

I've got an Arcom MediaGX board here that I'm trying to get working w/Linux 
2.4-test12pre7 ...  Has anyone else tried the latest MTD source from CVS with 
this board?

It boots, loads the kernel, and it *does* identify the onboard flash - it 
even seems able to *read* from the flash (a JFFS filesystem)... but when a 
write occurs, the screen fills with errors - they go scrolling by too quickly 
to see, but they're something along the lines of:

Chip not ready for buffer write ...  XStatus = 30  bstatus = 0

and

flash_safe_write returned 5

After a few seconds, the screen fills with:

jffs_garbage_collect_thread():  free size == 0 This is BAD.

:)

Also,
I inadvertently compiled the latest MTD sources from CVS with the JFFS 
included in the 2.4 sources and while I still couldn't write to the flash, I 
wouldn't get clobbered by 1000's of errors - I'd get one "Chip not ready", 
and then get the # prompt back....

Anyone have this working with 2.4?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
