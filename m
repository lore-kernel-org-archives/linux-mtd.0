Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OmCc-0004tX-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 20:16:46 +0100
Received: from [209.64.46.121] (helo=phoenix.bmedesign.com ident=mdj)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13OmCa-0004tR-00
	for mtd@infradead.org; Tue, 15 Aug 2000 20:16:44 +0100
Received: from localhost (mdj@localhost)
	by phoenix.bmedesign.com (8.8.7/8.8.7) with ESMTP id NAA30957
	for <mtd@infradead.org>; Tue, 15 Aug 2000 13:20:50 -0600
Date: Tue, 15 Aug 2000 13:20:38 -0600 (MDT)
From: Mark Jackson <mdj@phoenix.bmedesign.com>
To: mtd@infradead.org
Subject: Patches to compile on redhat 6.2 with downloaded kernel src
Message-ID: <Pine.LNX.4.04.10008151317260.30949-100000@phoenix.bmedesign.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I was able to get the mtd version in cvs to compile on my RedHat 6.2 box
against the linux-2.2.13.tar.gz linux kernel tarball source with the
following patches applied (cvs diff 8/15/2000)

Regards,

Mark


? file
Index: include/linux/mtd/compatmac.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/compatmac.h,v
retrieving revision 1.5
diff -r1.5 compatmac.h
20c20
< #include <linux/compatmac.h>
---
> //#include <linux/compatmac.h>
Index: include/linux/mtd/flashchip.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/flashchip.h,v
retrieving revision 1.6
diff -r1.6 flashchip.h
21a22,23
> #define wait_queue_head_t struct wait_queue *
> 
Index: kernel/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/kernel/cfi_cmdset_0001.c,v
retrieving revision 1.31
diff -r1.31 cfi_cmdset_0001.c
26a27,28
> #define DECLARE_WAITQUEUE(name,task) struct wait_queue (name) = {(task),NULL}
> 
Index: kernel/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/kernel/cfi_cmdset_0002.c,v
retrieving revision 1.5
diff -r1.5 cfi_cmdset_0002.c
31a32,33
> #define DECLARE_WAITQUEUE(name,task) struct wait_queue (name) = {(task),NULL}
> 
Index: kernel/doc1000.c
===================================================================
RCS file: /home/cvs/mtd/kernel/doc1000.c,v
retrieving revision 1.8
diff -r1.8 doc1000.c
38a39,40
> #define wait_queue_head_t struct wait_queue *
> 
Index: kernel/mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/kernel/mtdchar.c,v
retrieving revision 1.8
diff -r1.8 mtdchar.c
15a16,18
> #define wait_queue_head_t struct wait_queue *
> #define DECLARE_WAITQUEUE(name,task) struct wait_queue (name) = {(task),NULL}
> 
Index: kernel/mtdcore.c
===================================================================
RCS file: /home/cvs/mtd/kernel/mtdcore.c,v
retrieving revision 1.14
diff -r1.14 mtdcore.c
89a90
> #define DECLARE_MUTEX(name) struct semaphore (name) = MUTEX

--
Mark Jackson
Senior Engineer
BME Design, LLC.
724 Whalers Way Bldg H Suite 200
Ft. Collins, CO 80525
Phone: (970) 377-4134
email mdj@phoenix.bmedesign.com

-- The ideas expressed in this email do not necessarily reflect those
of my employer.  Come to think of it, they don't really reflect mine 
either!




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
