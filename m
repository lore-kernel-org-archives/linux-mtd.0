Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12qd0Y-0004v3-00
	for mtd-list@infradead.org; Sat, 13 May 2000 15:35:10 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12qd0Y-0004ux-00
	for cvs-notify@infradead.org; Sat, 13 May 2000 15:35:10 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdchar.c mtdcore.c Config.in Makefile mtd.c'
Message-Id: <E12qd0Y-0004ux-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 13 May 2000 15:35:10 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv18889/kernel

Modified Files:
	Config.in Makefile 
Added Files:
	mtdchar.c mtdcore.c 
Removed Files:
	mtd.c 
Log Message:
Separate the chardevice access from the MTD core routines. As chardevice
access is only really used for formatting, you don't necessarily want it
always present in production systems. It's now a separately loadable 
module. Now the combination of 'mtdcore.o' and 'mtdchar.o' provide all
the same functionality as 'mtd.o' used to provide.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
