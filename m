Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14oCNk-0004qL-00
	for mtd-list@infradead.org; Fri, 13 Apr 2001 23:49:36 +0100
Received: from mail6.galactica.it ([212.41.208.23] helo=galactica.it)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14oCNj-0004qF-00
	for mtd@infradead.org; Fri, 13 Apr 2001 23:49:35 +0100
Message-ID: <001f01c0c46b$d810d360$010110ac@archimede>
From: "Alessandro Staltari" <a_staltari@yahoo.it>
To: "Manatee" <manatee@pacifier.com>,
	<mtd@infradead.org>
References: <Pine.BSO.4.33.0104122209520.4678-100000@shell.pacifier.com>
Subject: R: mtd on linux
Date: Sat, 14 Apr 2001 00:48:21 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> I compiled the 2.4.1 kernel for Linux which has support for this device.
> Then I put the card in the PCI slot and rebooted. My harddrive was not
> recognized.
>

It seems original DOC firmware interfere with lilo. M-sys provides an
alternate DOC firmware to allow linux boot from hard drive but I prefer
booting from a floppy by copying the kernel image to it (cp zImage
/dev/fd0).

I hope this helps

Alessandro Staltari




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
