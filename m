Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cPi1-0006AD-00
	for mtd-list@infradead.org; Fri, 22 Sep 2000 11:05:33 +0100
Received: from elch.de.uu.net ([192.76.144.55])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cPi0-0006A6-00
	for mtd@infradead.org; Fri, 22 Sep 2000 11:05:32 +0100
Received: from Saturn (pec-8-179.tnt3.m2.uunet.de [149.225.8.179])
	by elch.de.uu.net (5.5.5/5.5.5) with SMTP id MAA24423
	for <mtd@infradead.org>; Fri, 22 Sep 2000 12:00:43 +0200 (MET DST)
Message-Id: <3.0.6.32.20000922120218.007c5650@eurodsn.de>
Date: Fri, 22 Sep 2000 12:02:18 +0200
To: mtd@infradead.org
From: Juergen Beisert <jbeisert@eurodsn.de>
Subject: Choosing DiskOnChip driver
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello all,

I develop a small PC board with a DiskOnChip Millenium chip. Because it should be an embedded system I do not want use a standard BIOS like desktop pc (I need a very fast boot). Instead I want load linux direct with a small ROM routine from the DiskOnChip (this small routine do the system initializing, too). So my question:

Is this possible with the MTD software? Which parts of grub and mtd I have to use to solve it? Can anybody help me?

Thanks in advance.

Juergen Beisert


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
