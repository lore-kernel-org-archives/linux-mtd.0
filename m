Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11y3j3-0003Gv-00
	for mtd-list@infradead.org; Wed, 15 Dec 1999 01:59:33 +0000
Received: from mail2.fw-sj.sony.com ([198.93.2.18])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11y3iz-0003Gp-00
	for mtd@infradead.org; Wed, 15 Dec 1999 01:59:29 +0000
Received: from tophat.itvd.sel.sony.com (tophat.itvd.sel.sony.com [43.134.39.1])
	by mail2.fw-sj.sony.com (8.8.8/8.8.8) with ESMTP id CAA21117
	for <mtd@infradead.org>; Wed, 15 Dec 1999 02:01:53 GMT
Message-ID: <38568695.468F14FF@itvd.sel.sony.com>
Date: Tue, 14 Dec 1999 18:04:05 +0000
From: "George Williams" <george@itvd.sel.sony.com>
MIME-Version: 1.0
To: "Brian K. Michalk" <michalk@awpi.com>
CC: mtd@infradead.org
Subject: Re: Beginner with DoC
References: <199912142231.QAA08264@sisko.awpi.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Brian,

> So, what nodes am I supposed to make?

I ran MAKEDEV in the util directory (it creates a lot of nodes).

> insmod mtd -- cool
> insmod doc2000 -- cool

insmod nftl.o

Now you should be able to mount /dev/nftla1 provided it has a filesystem
on it.

You can run fdisk on /dev/nftla to create partitions, etc.

Look at /dev/mtd0 (I captured it with dd) and you can see the start of
the firmware bios extension (0x55aa).

>         I get a compile error for the various utilities.

I also had trouble building the utils.  It goes wrong with

../include/linux/mtd/mtd.h:6: parse error

My kernel sources are in /usr/src/linux and I think this is where the
Makefile expects them.

> Eventually I want to be able to boot off of the DoC, but for now,
> I'll settle for making the kernel modules work. 

Same here.  Now I'm doing what some others on this list have suggested
and using syslinux to boot the kernel with an initial ramdisk.

George

-- 
George Williams
Sony Electronics
3300 Zanker Road SJ-1A6
San Jose CA 95134
+1 408 955 4918


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
