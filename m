Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Z9Up-0006aM-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 11:10:27 +0100
Received: from wizball.ivistar.de ([212.42.243.2])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Z9Uo-0006ZN-00
	for mtd@infradead.org; Wed, 13 Sep 2000 11:10:26 +0100
Received: from bomberman.ivistar.de (IDENT:root@bomberman.ivistar.de [212.42.243.7])
	by wizball.ivistar.de (8.9.3/8.9.3) with ESMTP id MAA14274
	for <mtd@infradead.org>; Wed, 13 Sep 2000 12:10:24 +0200
Received: (from ami@localhost)
	by bomberman.ivistar.de (8.9.3/8.9.3) id MAA00985
	for mtd@infradead.org; Wed, 13 Sep 2000 12:10:03 +0200
Date: Wed, 13 Sep 2000 12:10:03 +0200
From: Andreas Micklei <ami@ivistar.de>
To: mtd@infradead.org
Subject: Custom Boot loader
Message-ID: <20000913121003.A908@bomberman.ivistar.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi everyone,

I am in the process of writing a custom boot loader for an embedded PC which
boots from flash ROM. This thing already has a Boot-ROM which initializes the
hardware, puts the processor into protected mode and lets me download a kernel
image into Flash via FTP. Unfortunately it does not have a BIOS, so LILO or
GRUB are of no use to me (I suppose).

Has anyone some good pointers, or even example code, on how to set up kernel
parameters and jump into the kernel? I already looked at LILO or the Linux
Bootsector, but something far simpler and less flexible with compiled-in
parameters would be sufficient. Surely someone has done this before?!?

I hope that this list is the right place to ask.

  bye...
        Andreas Micklei

-- 
Andreas Micklei
IVISTAR Kommunikationssysteme AG
Ehrenbergstr. 19 / 10245 Berlin
http://www.ivistar.de


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
