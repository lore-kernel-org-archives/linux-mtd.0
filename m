Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141XM0-0007Se-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 17:18:40 +0000
Message-ID: <44632C76B97BD211AF6B00805FADCAB202D738E9@exchange.saltaire.pace.co.uk>
From: Simon Wood <Simon.Wood@pace.co.uk>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: M-System DOC Millennium with MTD. 
Date: Thu, 30 Nov 2000 17:18:08 -0000
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello again David,
I've updated my patch to your latest CVS (mtd-patch-2.2.17-20001130) and built that, but alas still no joy.

Just to re-iterate what I have and am doing.
I have a DoC Millennium (don't know how different this is to the 2000) eval board with a single MD-2810-D08 fitted. Jumpers are set to JP1 3,4 (0xD000) and JP2 3,4 (No connect, No wait state disabled).

Following the instructions below I get the same response as before, from /var/log/messages (I have set debug level to 3 but doesn't seem to produce anything extra):
	Nov 30 15:28:16 leper syslogd 1.3-3: restart.
	Nov 30 15:28:19 leper kernel: klogd 1.3-3, log source = /proc/kmsg started.
	Nov 30 15:28:19 leper kernel: Cannot find map file.
	Nov 30 15:28:19 leper kernel: Loaded 58 symbols from 2 modules.
	Nov 30 15:28:19 leper /usr/sbin/cron[155]: (CRON) STARTUP (fork ok) 
	Nov 30 15:34:04 leper kernel: Initializing MTD Layer
	Nov 30 15:34:23 leper kernel: M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.

And /proc/mtd is empty

However if I use the DoC1000 driver I get more of a response...
	Nov 30 15:35:34 leper kernel: mtd: Giving out device 0 to M-Systems DiskOnChip 1000
	Nov 30 15:35:44 leper kernel: M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.

And /proc/mtd reports 'mtd0: 00100000 "M-Systems DiskOnChip 1000"' - which it most definately is not !!

If nobody else can come up with a suggestion tomorrow I'll try reflashing the device's boot code from DOS. Any way it's time to wander off home now.
Simon Wood

Hardware Engineer 
Pace Micro Technology plc
Victoria Road, Saltaire, Shipley
West Yorkshire, BD18 3LF
Tel : +44(0)1274 532000  Fax: +44(0)1274 532029

This E-Mail and any attachments hereto are strictly confidential and intended solely for the addressee. If you are not the intended addressee please notify the sender by return and delete the message. You must not disclose, forward or copy this E-mail or attachments to any third party without the prior consent of the sender.

> -----Original Message-----
> From:	David Woodhouse [SMTP:dwmw2@infradead.org]
> Sent:	Thursday, November 30, 2000 11:00 AM
> To:	Simon Wood
> Subject:	Re: M-System DOC Millennium with MTD. 
> 
> 
> Build the stuff you want as modules.
> 
> Load mtdcore.o
> Load docecc.o 
> Load doc2001.o
> Load docprobe.o
> 
> You should see it say something about detecting a DiskOnChip. 
> 'cat /proc/mtd' at this stage should then produce one line of text.
> 
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
