Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13r2C3-0006nM-00
	for mtd-list@infradead.org; Wed, 01 Nov 2000 18:00:59 +0000
Received: from dawnmail.dawning.com ([24.93.23.251])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13r2C0-0006nG-00
	for mtd@infradead.org; Wed, 01 Nov 2000 18:00:58 +0000
Received: from [192.168.0.142] by dawnmail.dawning.com (NTMail 4.30.0013/NY3896.00.832c5e1f) with ESMTP id umrfaaaa for <mtd@infradead.org>; Wed, 1 Nov 2000 13:01:33 -0500
Message-ID: <3A005A52.E95F536@dawning.com>
Date: Wed, 01 Nov 2000 13:00:51 -0500
From: Gregory Schallert <gschallert@dawning.com>
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: mtdblock module & I'm Back again 
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm back again with a couple of more generic questions...  As a reminder
this is my project.

I am currently working on a project that (will) store the linux
kernel/os on
flash.  We are using the ElanSC400 chip and a board that has 3 pairs of
AM29F016EC Flash Chips arranged such that the high byte of the data goes
to
one chip and the low byte goes to the other. I've been able to configure
the windows on the SC400 to allow me to see what is on the chips by
using the mmap() function.  I would like for the flash to emulate a
block device so I've started playing around with the mtdblock.c file.
My questions are these:

1)  when I compile the mtdblock.c file I get a referenced symbol
"invalidate_buffers"  Any Ideas why?

I have currently have a MTD release that is about a month old.  I'm
going to download the new one and see if I still get the same problem.

2)  What does mtdblock.c actually do? If I load mtd.o, mapped.o, and
mtdblock.o  what additional functionality do I need to program to get a
minix file system on the flash chips?

Thanx

Gregory Schallert
Dawning Technologies, Inc.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
