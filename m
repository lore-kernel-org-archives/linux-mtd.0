Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rgpi-0005U4-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 14:56:54 +0100
Received: from pbmx1.mis.semi.harris.com ([132.158.202.81])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rgph-0005Tw-00
	for mtd@infradead.org; Mon, 23 Apr 2001 14:56:53 +0100
Message-ID: <716A7F62A194D41195AB001083FC3AE4426A62@inlmx1.inl.intersil.com>
From: "Brenk, Rudger van" <rudger.van.brenk@intersil.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Problems using fast write in cfi_cmdset_0002.c
Date: Mon, 23 Apr 2001 09:55:37 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

While building a uClinux environment using MTD and JFFS on an AMD AM29DL323
device (Kernel 2.0.38). I encountered some problems using the cfi_cmdset_0002.c,
when ever the fast write option is used the flash is put in a 'unlock bypass
mode' and starts writing bytes to flash. 

This is OK but in between byte writes the chip state is set back to FL_READY,
and available for other threads to access. If an other threads accesses the
flash chip it's still in 'unlock bypass mode' and will not accept other
commands/or even worse when this thread schedules out the byte write program
will continue when the device isn't anymore in 'unlock bypass mode'!!

Is there anybody else experiencing problems like this?

Thanks,

Rudger 


Rudger.van.Brenk@intersil.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
