Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 145nrh-0000he-00
	for mtd-list@infradead.org; Tue, 12 Dec 2000 11:45:01 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 145nrg-0000hY-00
	for mtd@infradead.org; Tue, 12 Dec 2000 11:45:01 +0000
Message-ID: <3A361133.1E32268A@arcom.co.uk>
Date: Tue, 12 Dec 2000 11:51:15 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: MTD + kernel 2.2.18
Content-Type: multipart/mixed;
 boundary="------------E6584CEBEF1B91687AD15859"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------E6584CEBEF1B91687AD15859
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I'm trying out MTD with kernel 2.2.18 and there appear to be some
problems with include/linux/mtd/compatmac.h.  I wasn't entirely sure
what was required so find a patch attached to review.

Also some of the init functions (eg in cfi_probe.c) are incorrect.  Are
they supposed to look like the ones in mtdcore.c?

David Vrabel
--------------E6584CEBEF1B91687AD15859
Content-Type: text/plain; charset=us-ascii;
 name="compatmac.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="compatmac.h.patch"

Index: compatmac.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/compatmac.h,v
retrieving revision 1.10
diff -u -r1.10 compatmac.h
--- compatmac.h	2000/11/30 16:39:19	1.10
+++ compatmac.h	2000/12/12 11:40:38
@@ -221,9 +221,12 @@
 #include <linux/init.h>
 #endif
 
-#if LINUX_VERSION_CODE < 0x20300
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,18)
 #define init_MUTEX(x) do {*(x) = MUTEX;} while (0)
 #define init_MUTEX_LOCKED(x) do {*(x) = MUTEX_LOCKED;} while (0)
+#endif /* ERM? */
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
 #define RQFUNC_ARG void
 #define blkdev_dequeue_request(req) do {CURRENT = req->next;} while (0)
 #else
@@ -244,11 +247,15 @@
 
 
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,18)
 
 #define DECLARE_WAIT_QUEUE_HEAD(x) struct wait_queue *x = NULL
 #define init_waitqueue_head init_waitqueue
 
+#endif
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
+
 static inline int try_inc_mod_count(struct module *mod)
 {
 #ifdef CONFIG_MODULES
@@ -329,7 +336,7 @@
 #include <linux/spinlock.h>
 #endif
 
-#if LINUX_VERSION_CODE < 0x20300
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,18)
 #define set_current_state(state_value)                        \
         do { current->state = (state_value); } while (0)
 #endif

--------------E6584CEBEF1B91687AD15859--




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
