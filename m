Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X6Zg-0003a0-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 18:06:44 +0000
Received: from router.alerton.com ([206.63.253.200] helo=ls.alerton.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12X6Zd-0003Zu-00
	for mtd@infradead.org; Mon, 20 Mar 2000 18:06:42 +0000
Received: from alerton.com (IDENT:roman@songdog.alerton.com [192.168.1.47])
	by ls.alerton.com (8.9.3/8.9.3) with ESMTP id KAA32709
	for <mtd@infradead.org>; Mon, 20 Mar 2000 10:06:38 -0800
Message-ID: <38D668AD.BBB356B2@alerton.com>
Date: Mon, 20 Mar 2000 10:06:37 -0800
From: Bill Roman <roman@alerton.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: Re: Questions about MTD
References: <E12WPTl-0007TN-00@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:
> 
> 3.  erase seg faults.  Is erase supposed to do what docpmap /e
> does?

You can supply a block number on the command line, and/or apply this patch:

diff -ur mtd-20000131.orig/util/erase.c mtd-20000131/util/erase.c
--- mtd-20000131.orig/util/erase.c      Tue Aug 17 15:57:08 1999
+++ mtd-20000131/util/erase.c   Wed Feb 23 10:23:19 2000
@@ -35,7 +35,7 @@
       erase.length = meminfo.erasesize;
       printf("Erasesize 0x%lx\n", meminfo.erasesize);
 
-      if (argc >= 2)
+      if (argc > 2)
              erase.start = atoi(argv[2]);
       else
              erase.start = 0;

Also, if you'd like nftl_format not to print gibberish for a usage message:

diff -ur mtd-20000131.orig/util/nftl_format.c mtd-20000131/util/nftl_format.c
--- mtd-20000131.orig/util/nftl_format.c        Fri Aug 20 08:31:01 1999
+++ mtd-20000131/util/nftl_format.c     Wed Feb 16 11:45:10 2000
@@ -107,7 +107,8 @@
        struct mtd_oob_buf oob = {0, 16, oobbuf};
 
    if (argc < 2) {
-          fprintf(stderr,"Usage: %s <mtddevice> [<start offset> [<size>]]\n");
+          fprintf(stderr,"Usage: %s <mtddevice> [<start offset> [<size>]]\n",
+                  argv[0]);
           return 1;
    }


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
