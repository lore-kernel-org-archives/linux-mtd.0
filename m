Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147yzQ-0002uK-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 12:02:00 +0000
Message-ID: <3A3DFE39.2FC5303E@arcom.co.uk>
Date: Mon, 18 Dec 2000 12:08:25 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: JFFS: deleted files still appear in directory
References: <Pine.LNX.4.30.0012180937270.21997-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I think this problem is fixed by this patch.

David Vrabel.

Index: inode-v22.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/inode-v22.c,v
retrieving revision 1.54
diff -u -r1.54 inode-v22.c
--- inode-v22.c	2000/12/05 16:03:41	1.54
+++ inode-v22.c	2000/12/18 11:59:42
@@ -575,6 +575,7 @@
 	struct jffs_control *c = (struct jffs_control
*)inode->i_sb->u.generic_sbp;
 	int j;
 	int ddino;
+
 	D3(printk (KERN_NOTICE "readdir(): down biglock\n"));
 	down(&c->fmc->biglock);
 
@@ -604,10 +605,13 @@
 		filp->f_pos++;
 	}
 	f = ((struct jffs_file *)inode->u.generic_ip)->children;
-	for (j = 2; (j < filp->f_pos) && f; j++) {
-	        f = f->sibling_next;
+
+	j=2;
+	while(f && (f->deleted || j++ < filp->f_pos )) {
+		f = f->sibling_next;
 	}
-	for (; f ; f = f->sibling_next) {
+
+	while (f) {
 		D3(printk("jffs_readdir(): \"%s\" ino: %u\n",
 			  (f->name ? f->name : ""), f->ino));
 		if (filldir(dirent, f->name, f->nsize,
@@ -617,6 +621,9 @@
 			return 0;
 		}
 		filp->f_pos++;
+		do {
+			f = f->sibling_next;
+		} while(f && f->deleted);
 	}
 	D3(printk (KERN_NOTICE "readdir(): up biglock\n"));
 	up(&c->fmc->biglock);
Index: inode-v23.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/inode-v23.c,v
retrieving revision 1.51
diff -u -r1.51 inode-v23.c
--- inode-v23.c	2000/12/05 16:03:41	1.51
+++ inode-v23.c	2000/12/18 11:59:47
@@ -598,10 +598,13 @@
 		filp->f_pos++;
 	}
 	f = ((struct jffs_file *)inode->u.generic_ip)->children;
-	for (j = 2; (j < filp->f_pos) && f; j++) {
-	        f = f->sibling_next;
+
+	j=2;
+	while(f && (f->deleted || j++ < filp->f_pos )) {
+		f = f->sibling_next;
 	}
-	for (; f ; f = f->sibling_next) {
+
+	while (f) {
 		D3(printk("jffs_readdir(): \"%s\" ino: %u\n",
 			  (f->name ? f->name : ""), f->ino));
 		if (filldir(dirent, f->name, f->nsize,
@@ -611,6 +614,9 @@
 			return 0;
 		}
 		filp->f_pos++;
+		do {
+			f = f->sibling_next;
+		} while(f && f->deleted);
 	}
 	D3(printk (KERN_NOTICE "readdir(): up biglock\n"));
 	up(&c->fmc->biglock);
Index: intrep.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/intrep.c,v
retrieving revision 1.82
diff -u -r1.82 intrep.c
--- intrep.c	2000/12/09 03:29:36	1.82
+++ intrep.c	2000/12/18 11:59:56
@@ -1059,12 +1059,11 @@
 		f->atime = raw_inode->atime;
 		f->mtime = raw_inode->mtime;
 		f->ctime = raw_inode->ctime;
-		f->deleted = raw_inode->deleted;
 	}
 	else if ((f->highest_version < node->version)
 		 || (node->version == 0)) {
 		/* Insert at the end of the list.  I.e. this node is the
-		   oldest one so far.  */
+		   newest one so far.  */
 		node->version_prev = f->version_tail;
 		node->version_next = 0;
 		f->version_tail->version_next = node;
@@ -1078,7 +1077,6 @@
 		f->atime = raw_inode->atime;
 		f->mtime = raw_inode->mtime;
 		f->ctime = raw_inode->ctime;
-		f->deleted = raw_inode->deleted;
 	}
 	else if (f->version_head->version > node->version) {
 		/* Insert at the bottom of the list.  */
@@ -1089,9 +1087,6 @@
 		if (!f->name) {
 			update_name = 1;
 		}
-		if (raw_inode->deleted) {
-			f->deleted = raw_inode->deleted;
-		}
 	}
 	else {
 		struct jffs_node *n;
@@ -1115,6 +1110,12 @@
 		}
 	}
 
+	/* Deletion is irreversible. If any 'deleted' node is ever
+	   written, the file is deleted */
+	if (raw_inode->deleted) {
+		f->deleted = raw_inode->deleted;
+	}
+
 	/* Perhaps update the name.  */
 	if (raw_inode->nsize && update_name && name && *name && (name !=
f->name)) {
 		if (f->name) {
@@ -1647,6 +1648,9 @@
 		printk(KERN_ERR "JFFS: jffs_write_node: Failed to write, "
 		       "requested %i, wrote %i\n", total_size, err);
 		goto retry;
+	}
+	if (raw_inode->deleted) {
+		f->deleted = 1;
 	}
 
 	jffs_fm_write_unlock(fmc);



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
