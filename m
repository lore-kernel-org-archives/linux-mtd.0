Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qAdy-0006G5-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 10:22:30 +0100
Received: from mail.axisinc.com ([193.13.178.2] helo=roma.axis.se)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qAdx-0006Fy-00
	for mtd@infradead.org; Thu, 19 Apr 2001 10:22:29 +0100
Received: from godzilla.axis.se (godzilla.axis.se [10.13.9.111])
	by roma.axis.se (8.9.3/8.9.3) with ESMTP id LAA15160
	for <mtd@infradead.org>; Thu, 19 Apr 2001 11:21:46 +0200 (MEST)
Date: Thu, 19 Apr 2001 11:21:56 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: mtd@infradead.org
Subject: cramfs and mtd
Message-ID: <Pine.LNX.4.21.0104191118570.11552-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

When using cramfs directly on a ROM chip like below.. can we make
cramfs/inode.c talk to mtd to find a chip maybe instead of using direct
pointers like I do in my small patch below ? That is, would it mess up
inode.c to the degree that it would not be accepted in the mainline kernel
? :) Or is there a better way to do this ?

(Yes of course - JFFS2 - but except that, then :)

/BW

--- inode.c     2001/04/02 12:48:08     1.1.1.3
+++ inode.c     2001/04/04 14:57:00     1.9
@@ -22,6 +22,8 @@

 #include "cramfs.h"

+#define CRAMFS_AS_IMAGE 
+ 
 static struct super_operations cramfs_ops;
 static struct inode_operations cramfs_dir_inode_operations;
 static struct file_operations cramfs_directory_operations;
@@ -97,6 +99,29 @@
  * Returns a pointer to a buffer containing at least LEN bytes of
  * filesystem starting at byte offset OFFSET into the filesystem.
  */
+ 
+#ifdef CRAMFS_AS_IMAGE
+
+/* Normally, cramfs_read reads from offset and len bytes on a block
device.
+ * But if we have an attached image piggybacked on the end of the kernel
+ * (a la krom/romfs) we can use this trivial routine.
+ */
+
+extern unsigned char *romfs_start;  /* set in head.S during boot */
+extern unsigned int romfs_length;   /* dito */
+  
+/*
+ * Returns a pointer to a buffer containing at least LEN bytes of
+ * filesystem starting at byte offset OFFSET into the filesystem.
+ */
+static inline void *cramfs_read(struct super_block *sb, unsigned int
offset, unsigned int len)
+{
+       return romfs_start + offset;
+}
+
+#else /* CRAMFS_AS_IMAGE */
+
 static void *cramfs_read(struct super_block *sb, unsigned int offset,
unsigned int len)
 {
        struct buffer_head * bh_array[BLKS_PER_BUF];
@@ -146,6 +171,7 @@
        return read_buffers[buffer] + offset;
 }

+#endif

 static struct super_block * cramfs_read_super(struct super_block *sb,
void *data, int silent)
 {





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
