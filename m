Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ejPj-0007Bz-00
	for mtd-list@infradead.org; Thu, 28 Sep 2000 20:32:15 +0100
Received: from cr934547-a.flfrd1.on.wave.home.com
	([24.112.247.163] helo=mokona.furryterror.org ident=mail)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ejPi-0007Bt-00
	for mtd@infradead.org; Thu, 28 Sep 2000 20:32:15 +0100
From: jitvrlcw@umail.furryterror.org (Amy Fong)
Subject: mtdchar.c
Date: 28 Sep 2000 15:31:18 -0400
Message-ID: <8r06a6$vvs$1@mokona.furryterror.org>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mtd/kernel/mtdchar.c hasn't been able to compile with 2.2 series since
1.9 - in static struct file_operations mtd_fops, the field owner should
be conditionally compiled.

static struct file_operations mtd_fops = {
#if LINUX_VERSION_CODE > 0x20300
        owner:          THIS_MODULE,
#endif
...


afong@ifurita:~/mtd/2.2.18/linux/drivers/mtd$ diff mtdchar.c ~/mtd/mtd/kernel/mtdchar.c 

379d378
< #if LINUX_VERSION_CODE > 0x20300
381d379
< #endif

--
We Suzaku no seishi are too stupid to give up!
                           (Tasuki - Fushigi Yuugi)

              Amy Fong (afong@furryterror.org)


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
