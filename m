Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14oJQM-00071K-00
	for mtd-list@infradead.org; Sat, 14 Apr 2001 07:20:46 +0100
Received: from comet.pacifier.com ([199.2.117.155])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14oJQK-00071E-00
	for mtd@infradead.org; Sat, 14 Apr 2001 07:20:44 +0100
Date: Fri, 13 Apr 2001 23:20:39 -0700 (PDT)
From: Manatee <manatee@pacifier.com>
To: Alessandro Staltari <a_staltari@yahoo.it>
cc: <mtd@infradead.org>
Subject: Re: R: mtd on linux
In-Reply-To: <001f01c0c46b$d810d360$010110ac@archimede>
Message-ID: <Pine.BSO.4.33.0104132314430.7495-100000@shell.pacifier.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Sat, 14 Apr 2001, Alessandro Staltari wrote:

> It seems original DOC firmware interfere with lilo. M-sys provides an
> alternate DOC firmware to allow linux boot from hard drive but I prefer
> booting from a floppy by copying the kernel image to it (cp zImage
> /dev/fd0).
>
> I hope this helps

Yes, thank you.

So you are saying that all I have to do is boot my Linux kernel from a
floppy and then I can talk to my disk on chip?

So once I have booted up, using a floppy, then how do I access the disk
on chip? Do I mount it, then cd to it, and then do a 'ls' to see what is
there, etc.?

Manatee



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
