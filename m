Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14soMD-0003Nc-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 17:11:05 +0100
Received: from comet.pacifier.com ([199.2.117.155])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14soMB-0003NV-00
	for mtd@infradead.org; Thu, 26 Apr 2001 17:11:04 +0100
Received: from shell.pacifier.com (IDENT:manatee@shell.pacifier.com [199.2.117.66])
	by comet.pacifier.com (8.11.2/8.11.1) with ESMTP id f3QGAfi00076
	for <mtd@infradead.org>; Thu, 26 Apr 2001 09:10:41 -0700 (PDT)
Date: Thu, 26 Apr 2001 09:10:56 -0700 (PDT)
From: Manatee <manatee@pacifier.com>
To: <mtd@infradead.org>
Subject: question about mtd
Message-ID: <Pine.BSO.4.33.0104260859390.7557-100000@shell.pacifier.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I am trying to teach myself about networking and hardware.

I have a Netrunner which has a Disk on Chip and two harddrives.

What happens is that the Netrunner boots up using the Disk on Chip. It
boots up in "recovery mode" first. I used a crossover cable and attached
it to my workstation, and, using 192.168.1.1 I was able to connect to it
with a web browser.

First it does fdisk, then mkfs, then auto-RAID.

Then it give the option of installing something called all_system.tar.bz2

It seems that the chip decides on boot up whether to boot one of two
kernels: recovery or normal. I think recovery only comes up if all_system
has not been installed and "normal" comes up if all_system has been
installed. I believe it checks the harddrive before deciding.

I was wondering how the Disk on Chip would make the determination as to
which kernel to boot? Does it see something on the harddrive that triggers
it one way or another? Is it a script or some sort of flag? I'd like to
take a look at it to learn something about it.

Manatee







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
