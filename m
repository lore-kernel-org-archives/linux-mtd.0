Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JxMn-00027M-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 13:11:21 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JxMl-00027G-00
	for mtd@infradead.org; Wed, 02 Aug 2000 13:11:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000802130539.27452A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000802130539.27452A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Markus Thiesmeyer <mthi@gmx.de>, mtd@infradead.org, jffs-dev@axis.com,
  bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 Aug 2000 13:11:09 +0100
Message-ID: <11108.965218269@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  This could cause consistancy problems though, because we're not using
> the (possibly modified) mmaped data when writing directly to a file,
> we also in some way guarantee that all writes are done to the log in
> the correct order. It will also be an inefficient way to write data to
> jffs, since we have to rewrite whole pages instead of only the written
> part.

I believe that we can address both of those problems - we can write data 
directly from the page cache and we can also work out which ranges within
a page have actually been dirtied. 


alex@cendio.se said:
> All this, and the fact that the missing needed mutex around the
> writing to the log makes the jffs filesystem quite seriously borked.

This compiles. Wonder if it works...

Index: fs/jffs/intrep.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/intrep.c,v
retrieving revision 1.25
diff -u -w -r1.25 intrep.c
--- fs/jffs/intrep.c	2000/07/27 19:45:35	1.25
+++ fs/jffs/intrep.c	2000/08/02 12:08:55
@@ -377,6 +377,17 @@
 	return sum;
 }
 
+static __inline__ void jffs_fm_write_lock(struct jffs_fmcontrol *fmc)
+{
+	down(&fmc->wlock);
+}
+
+static __inline__ void jffs_fm_write_unlock(struct jffs_fmcontrol *fmc)
+{
+	up(&fmc->wlock);
+}
+
+
 /* Create and initialize a new struct jffs_file.  */
 static struct jffs_file *
 jffs_create_file(struct jffs_control *c,
@@ -1373,8 +1384,11 @@
 		  (name ? name : ""), raw_inode->ino,
 		  raw_inode->version, total_size));
 
+	jffs_fm_write_lock(fmc);
+
 	/* First try to allocate some flash memory.  */
 	if ((err = jffs_fmalloc(fmc, total_size, node, &fm)) < 0) {
+		jffs_fm_write_unlock(fmc);
 		D(printk("jffs_write_node(): jffs_fmalloc(0x%p, %u) "
 			 "failed!\n", fmc, total_size));
 		return err;
@@ -1383,14 +1397,16 @@
 		/* The jffs_fm struct that we got is not good enough.
 		   Make that space dirty.  */
 		if ((err = jffs_write_dummy_node(c, fm)) < 0) {
-			D(printk("jffs_write_node(): "
-				 "jffs_write_dummy_node(): Failed!\n"));
 			kfree(fm);
 			DJM(no_jffs_fm--);
+			jffs_fm_write_unlock(fmc);
+			D(printk("jffs_write_node(): "
+				 "jffs_write_dummy_node(): Failed!\n"));
 			return err;
 		}
 		/* Get a new one.  */
 		if ((err = jffs_fmalloc(fmc, total_size, node, &fm)) < 0) {
+			jffs_fm_write_unlock(fmc);
 			D(printk("jffs_write_node(): Second "
 				 "jffs_fmalloc(0x%p, %u) failed!\n",
 				 fmc, total_size));
@@ -1427,6 +1443,7 @@
 				    sizeof(struct jffs_raw_inode))) < 0) {
 		jffs_fmfree_partly(fmc, fm,
 				   total_name_size + total_data_size);
+		jffs_fm_write_unlock(fmc);
 		printk(KERN_ERR "JFFS: jffs_write_node: Failed to write "
 		       "raw_inode.\n");
 		return err;
@@ -1439,6 +1456,7 @@
 					    (u_char *)name,
 					    raw_inode->nsize)) < 0) {
 			jffs_fmfree_partly(fmc, fm, total_data_size);
+			jffs_fm_write_unlock(fmc);
 			printk(KERN_ERR "JFFS: jffs_write_node: Failed to "
                               "write the name.\n");
 			return err;
@@ -1451,12 +1469,13 @@
 		if ((err = flash_safe_write(fmc->mtd, pos, data,
 					    raw_inode->dsize)) < 0) {
 			jffs_fmfree_partly(fmc, fm, 0);
+			jffs_fm_write_unlock(fmc);
 			printk(KERN_ERR "JFFS: jffs_write_node: Failed to "
 			       "write the data.\n");
 			return err;
 		}
 	}
-
+	jffs_fm_write_unlock(fmc);
 	D3(printk("jffs_write_node(): Leaving...\n"));
 	return raw_inode->dsize;
 } /* jffs_write_node()  */
@@ -2211,23 +2230,28 @@
 	new_node->fm_offset = sizeof(struct jffs_raw_inode)
 			      + total_name_size;
 
+	jffs_fm_write_lock(fmc);
+
 	if ((err = jffs_fmalloc(fmc, total_size, new_node, &fm)) < 0) {
+		DJM(no_jffs_node--);
+		jffs_fm_write_unlock(fmc);
 		D(printk("jffs_rewrite_data(): Failed to allocate fm.\n"));
 		kfree(new_node);
-		DJM(no_jffs_node--);
 		return err;
 	}
 	else if (!fm->nodes) {
 		/* The jffs_fm struct that we got is not good enough.  */
 		if ((err = jffs_write_dummy_node(c, fm)) < 0) {
+			DJM(no_jffs_fm--);
+			jffs_fm_write_unlock(fmc);
 			D(printk("jffs_rewrite_data(): "
 				 "jffs_write_dummy_node() Failed!\n"));
 			kfree(fm);
-			DJM(no_jffs_fm--);
 			return err;
 		}
 		/* Get a new one.  */
 		if ((err = jffs_fmalloc(fmc, total_size, node, &fm)) < 0) {
+			jffs_fm_write_unlock(fmc);
 			D(printk("jffs_rewrite_data(): Second "
 				 "jffs_fmalloc(0x%p, %u) failed!\n",
 				 fmc, total_size));
@@ -2276,10 +2300,11 @@
 				    sizeof(struct jffs_raw_inode)
 				    - sizeof(__u32)
 				    - sizeof(__u16) - sizeof(__u16))) < 0) {
-		printk(KERN_ERR "JFFS: jffs_rewrite_data: Write error during "
-		       "rewrite. (raw inode)\n");
 		jffs_fmfree_partly(fmc, fm,
 				   total_name_size + total_data_size);
+		jffs_fm_write_unlock(fmc);
+		printk(KERN_ERR "JFFS: jffs_rewrite_data: Write error during "
+		       "rewrite. (raw inode)\n");
 		return err;
 	}
 	pos += sizeof(struct jffs_raw_inode);
@@ -2291,9 +2316,10 @@
 		if ((err = flash_safe_write(fmc->mtd, pos,
 					    (u_char *)f->name,
 					    f->nsize)) < 0) {
+			jffs_fmfree_partly(fmc, fm, total_data_size);
+			jffs_fm_write_unlock(fmc);
 			printk(KERN_ERR "JFFS: jffs_rewrite_data: Write "
 			       "error during rewrite. (name)\n");
-			jffs_fmfree_partly(fmc, fm, total_data_size);
 			return err;
 		}
 		pos += total_name_size;
@@ -2315,20 +2341,22 @@
 			__u32 s = jffs_min(size, PAGE_SIZE);
 			if ((r = jffs_read_data(f, (char *)page,
 						offset, s)) < s) {
+				free_page((unsigned long)page);
+				jffs_fmfree_partly(fmc, fm, 0);
+				jffs_fm_write_unlock(fmc);
 				printk(KERN_ERR "JFFS: jffs_rewrite_data: "
 					 "jffs_read_data() "
 					 "failed! (r = %d)\n", r);
-				free_page((unsigned long)page);
-				jffs_fmfree_partly(fmc, fm, 0);
 				return -1;
 			}
 			if ((err = flash_safe_write(fmc->mtd,
 						    pos, page, r)) < 0) {
+				free_page((unsigned long)page);
+				jffs_fmfree_partly(fmc, fm, 0);
+				jffs_fm_write_unlock(fmc);
 				printk(KERN_ERR "JFFS: jffs_rewrite_data: "
 				       "Write error during rewrite. "
 				       "(data)\n");
-				free_page((unsigned long)page);
-				jffs_fmfree_partly(fmc, fm, 0);
 				return err;
 			}
 			pos += r;
@@ -2352,14 +2380,16 @@
 				&raw_inode)[JFFS_RAW_INODE_DCHKSUM_OFFSET],
 				sizeof(__u32) + sizeof(__u16)
 				+ sizeof(__u16))) < 0) {
+		jffs_fmfree_partly(fmc, fm, 0);
+		jffs_fm_write_unlock(fmc);
 		printk(KERN_ERR "JFFS: jffs_rewrite_data: Write error during "
 		       "rewrite. (checksum)\n");
-		jffs_fmfree_partly(fmc, fm, 0);
 		return err;
 	}
 
 	/* Now make the file system aware of the newly written node.  */
 	jffs_insert_node(c, f, &raw_inode, f->name, new_node);
+	jffs_fm_write_unlock(fmc);
 
 	D3(printk("jffs_rewrite_data(): Leaving...\n"));
 	return 0;
Index: fs/jffs/jffs_fm.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/jffs_fm.c,v
retrieving revision 1.8
diff -u -w -r1.8 jffs_fm.c
--- fs/jffs/jffs_fm.c	2000/07/13 13:15:33	1.8
+++ fs/jffs/jffs_fm.c	2000/08/02 12:08:55
@@ -77,6 +77,7 @@
 	fmc->tail = 0;
 	fmc->head_extra = 0;
 	fmc->tail_extra = 0;
+	init_MUTEX(&fmc->wlock);
 	return fmc;
 }
 
Index: fs/jffs/jffs_fm.h
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/jffs_fm.h,v
retrieving revision 1.3
diff -u -w -r1.3 jffs_fm.h
--- fs/jffs/jffs_fm.h	2000/07/04 16:15:42	1.3
+++ fs/jffs/jffs_fm.h	2000/08/02 12:08:55
@@ -30,7 +30,9 @@
 /* Mark the on-flash space as obsolete when appropriate.  */
 #define JFFS_MARK_OBSOLETE 0
 
-#define CONFIG_JFFS_FS_VERBOSE 0
+#if !defined(CONFIG_JFFS_FS) && !defined(CONFIG_JFFS_FS_MODULE)
+#define CONFIG_JFFS_FS_VERBOSE 1
+#endif
 
 /* How many padding bytes should be inserted between two chunks of data
    on the flash?  */
@@ -77,6 +79,7 @@
 	struct jffs_fm *tail;
 	struct jffs_fm *head_extra;
 	struct jffs_fm *tail_extra;
+	struct semaphore wlock;
 };
 
 /* Notice the two members head_extra and tail_extra in the jffs_control



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
