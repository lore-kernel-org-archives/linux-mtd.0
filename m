Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13snfN-00076o-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 14:54:33 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13snfM-00076X-00
	for mtd@infradead.org; Mon, 06 Nov 2000 14:54:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10011061235070.697-100000@xanadu.gn.com> 
References: <Pine.LNX.4.10.10011061235070.697-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Nov 2000 14:54:13 +0000
Message-ID: <18972.973522453@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Try this:

Index: mtdblock.c
===================================================================
RCS file: /home/cvs/mtd/kernel/mtdblock.c,v
retrieving revision 1.29
diff -u -r1.29 mtdblock.c
--- mtdblock.c	2000/11/03 04:59:01	1.29
+++ mtdblock.c	2000/11/06 14:54:06
@@ -58,6 +58,11 @@
 #define blkdev_dequeue_request(req) do {CURRENT = req->next;} while (0)
 #else
 #define RQFUNC_ARG request_queue_t *q
+static void mtdblock_plug_device(request_queue_t *q, kdev_t dev)
+{
+	/* Do nothing. We don't want plugging */
+	return;
+}
 #endif
 
 
@@ -616,6 +621,7 @@
 	blk_dev[MAJOR_NR].request_fn = mtdblock_request;
 #else
 	blk_init_queue(BLK_DEFAULT_QUEUE(MAJOR_NR), &mtdblock_request);
+	blk_queue_pluggable(BLK_DEFAULT_QUEUE(MAJOR_NR), &mtdblock_plug_device)
 #endif
 	kernel_thread (mtdblock_thread, NULL, CLONE_FS|CLONE_FILES|CLONE_SIGHAND);
 	return 0;


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
