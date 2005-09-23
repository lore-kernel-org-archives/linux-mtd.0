Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIbIZ-0000Vz-93
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 20:21:39 -0400
Received: from pgrayson1.inrealm.net (unknown [66.239.3.2])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by ba.realmsys.com (Spam Firewall) with ESMTP id ACD50155D7
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Sep 2005 18:05:48 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-qwQr02qgLCZeTk4FpL21"
Date: Thu, 22 Sep 2005 18:05:49 -0600
Message-Id: <1127433949.6937.30.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [PATCH] jffs2 whitespace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qwQr02qgLCZeTk4FpL21
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm not sure if anyone else really cares about these kind of cleanup
changes, but just in case someone does, here is a patch that fixes up
several whitespace issues in the jffs2 code.

I believe all of these changes are consistent with what the mtd
developers like to see in the code. There seems to be a lot of precedent
for all of these changes.

There are no functional changes in this patch.

Here are the specific issues addressed:

* Remove all trailing whitespace
* Use tab-indentation consistently (there was some space indentation)
* Consistent placement of parenthesis for "if", "for", "while", and
"switch" expressions (i.e. "if (a == b)" instead of "if( a == b )")
* Space follows all commas
* Space around binary operators (i.e. "a = b + c;" instead of "a=b+c;")
* Opening brace of function definition on its own line
* Put the "else" on the same line as the preceding and following braces

This is a rather large patch, but the changes are trivial. If this patch
goes over well, I would be happy to create a similar patch for the rest
of the mtd code.

Pete

--=-qwQr02qgLCZeTk4FpL21
Content-Disposition: attachment; filename=jffs2-whitespace.patch
Content-Type: text/x-patch; name=jffs2-whitespace.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

[JFFS2] Whitespace cleanup

Remove all trailing whitespace.
Use tab-indentation consistently.
Changed "if( ... )" to "if (...)", same for "for" and "while".
Always have a space after a comma ",..." to ", ...".
Use whitespace around binary operators "x+3" to "x + 3".
No space after function name "int foo (char bar)" to "int foo(char bar)".
Opening brace for function on its own line.
"else" on same line as preceding and following braces.

[From: Peter Grayson <pgrayson@realmsys.com>]
diff -uNr mtd/fs/jffs2/background.c mtd-whitespace/fs/jffs2/background.c
--- mtd/fs/jffs2/background.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/background.c	2005-09-22 16:01:33.849198784 -0600
@@ -17,14 +17,13 @@
 #include <linux/completion.h>
 #include "nodelist.h"
 
-
 static int jffs2_garbage_collect_thread(void *);
 
 void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
 {
 	spin_lock(&c->erase_completion_lock);
-        if (c->gc_task && jffs2_thread_should_wake(c))
-                send_sig(SIGHUP, c->gc_task, 1);
+	if (c->gc_task && jffs2_thread_should_wake(c))
+		send_sig(SIGHUP, c->gc_task, 1);
 	spin_unlock(&c->erase_completion_lock);
 }
 
@@ -50,7 +49,7 @@
 		D1(printk(KERN_DEBUG "JFFS2: Garbage collect thread is pid %d\n", pid));
 		wait_for_completion(&c->gc_thread_start);
 	}
- 
+
 	return ret;
 }
 
@@ -100,7 +99,7 @@
 
 		cond_resched();
 
-		/* Put_super will send a SIGKILL and then wait on the sem. 
+		/* Put_super will send a SIGKILL and then wait on the sem.
 		 */
 		while (signal_pending(current)) {
 			siginfo_t info;
diff -uNr mtd/fs/jffs2/build.c mtd-whitespace/fs/jffs2/build.c
--- mtd/fs/jffs2/build.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/build.c	2005-09-22 16:56:23.434105864 -0600
@@ -55,7 +55,7 @@
 	dbg_fsbuild("building directory inode #%u\n", ic->ino);
 
 	/* For each child, increase nlink */
-	for(fd = ic->scan_dents; fd; fd = fd->next) {
+	for (fd = ic->scan_dents; fd; fd = fd->next) {
 		struct jffs2_inode_cache *child_ic;
 		if (!fd->ino)
 			continue;
@@ -129,10 +129,10 @@
 	for_each_inode(i, c, ic) {
 		if (ic->nlink)
 			continue;
-			
+
 		jffs2_build_remove_unlinked_inode(c, ic, &dead_fds);
 		cond_resched();
-	} 
+	}
 
 	dbg_fsbuild("pass 2a starting\n");
 
@@ -149,10 +149,10 @@
 
 	dbg_fsbuild("pass 2a complete\n");
 	dbg_fsbuild("freeing temporary data structures\n");
-	
+
 	/* Finally, we can scan again and free the dirent structs */
 	for_each_inode(i, c, ic) {
-		while(ic->scan_dents) {
+		while (ic->scan_dents) {
 			fd = ic->scan_dents;
 			ic->scan_dents = fd->next;
 			jffs2_free_full_dirent(fd);
@@ -161,7 +161,7 @@
 		cond_resched();
 	}
 	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
-	
+
 	dbg_fsbuild("FS build complete\n");
 
 	/* Rotate the lists by some number to ensure wear levelling */
@@ -172,7 +172,7 @@
 exit:
 	if (ret) {
 		for_each_inode(i, c, ic) {
-			while(ic->scan_dents) {
+			while (ic->scan_dents) {
 				fd = ic->scan_dents;
 				ic->scan_dents = fd->next;
 				jffs2_free_full_dirent(fd);
@@ -191,7 +191,7 @@
 	struct jffs2_full_dirent *fd;
 
 	dbg_fsbuild("removing ino #%u with nlink == zero.\n", ic->ino);
-	
+
 	raw = ic->nodes;
 	while (raw != (void *)ic) {
 		struct jffs2_raw_node_ref *next = raw->next_in_ino;
@@ -204,7 +204,7 @@
 		int whinged = 0;
 		dbg_fsbuild("inode #%u was a directory which may have children...\n", ic->ino);
 
-		while(ic->scan_dents) {
+		while (ic->scan_dents) {
 			struct jffs2_inode_cache *child_ic;
 
 			fd = ic->scan_dents;
@@ -220,7 +220,7 @@
 				whinged = 1;
 
 			dbg_fsbuild("removing child \"%s\", ino #%u\n", fd->name, fd->ino);
-			
+
 			child_ic = jffs2_get_ino_cache(c, fd->ino);
 			if (!child_ic) {
 				dbg_fsbuild("cannot remove child \"%s\", ino #%u, because it doesn't exist\n",
@@ -229,11 +229,11 @@
 				continue;
 			}
 
-			/* Reduce nlink of the child. If it's now zero, stick it on the 
+			/* Reduce nlink of the child. If it's now zero, stick it on the
 			   dead_fds list to be cleaned up later. Else just free the fd */
 
 			child_ic->nlink--;
-			
+
 			if (!child_ic->nlink) {
 				dbg_fsbuild("inode #%u (\"%s\") has now got zero nlink, adding to dead_fds list.\n",
 					  fd->ino, fd->name);
@@ -248,7 +248,7 @@
 	}
 
 	/*
-	   We don't delete the inocache from the hash list and free it yet. 
+	   We don't delete the inocache from the hash list and free it yet.
 	   The erase code will do that, when all the nodes are completely gone.
 	*/
 }
@@ -262,7 +262,7 @@
 	   because there's not enough free space... */
 	c->resv_blocks_deletion = 2;
 
-	/* Be conservative about how much space we need before we allow writes. 
+	/* Be conservative about how much space we need before we allow writes.
 	   On top of that which is required for deletia, require an extra 2%
 	   of the medium to be available, for overhead caused by nodes being
 	   split across blocks, etc. */
@@ -277,13 +277,13 @@
 
 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;
 
-	/* When do we allow garbage collection to merge nodes to make 
+	/* When do we allow garbage collection to merge nodes to make
 	   long-term progress at the expense of short-term space exhaustion? */
 	c->resv_blocks_gcmerge = c->resv_blocks_deletion + 1;
 
 	/* When do we allow garbage collection to eat from bad blocks rather
 	   than actually making progress? */
-	c->resv_blocks_gcbad = 0;//c->resv_blocks_deletion + 2;
+	c->resv_blocks_gcbad = 0; //c->resv_blocks_deletion + 2;
 
 	/* If there's less than this amount of dirty space, don't bother
 	   trying to GC to make more space. It'll be a fruitless task */
@@ -303,7 +303,7 @@
 		  c->resv_blocks_gcbad, c->resv_blocks_gcbad*c->sector_size/1024);
 	dbg_fsbuild("Amount of dirty space required to GC: %d bytes\n",
 		  c->nospc_dirty_size);
-} 
+}
 
 int jffs2_do_mount_fs(struct jffs2_sb_info *c)
 {
@@ -320,7 +320,7 @@
 		c->blocks = kmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks, GFP_KERNEL);
 	if (!c->blocks)
 		return -ENOMEM;
-	for (i=0; i<c->nr_blocks; i++) {
+	for (i = 0; i < c->nr_blocks; i++) {
 		INIT_LIST_HEAD(&c->blocks[i].list);
 		c->blocks[i].offset = i * c->sector_size;
 		c->blocks[i].free_size = c->sector_size;
@@ -358,7 +358,7 @@
 #ifndef __ECOS
 		if (jffs2_blocks_use_vmalloc(c))
 			vfree(c->blocks);
-		else 
+		else
 #endif
 			kfree(c->blocks);
 
diff -uNr mtd/fs/jffs2/compr.c mtd-whitespace/fs/jffs2/compr.c
--- mtd/fs/jffs2/compr.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr.c	2005-09-22 17:13:24.938813544 -0600
@@ -24,151 +24,150 @@
 static int jffs2_compression_mode = JFFS2_COMPR_MODE_PRIORITY;
 
 /* Statistics for blocks stored without compression */
-static uint32_t none_stat_compr_blocks=0,none_stat_decompr_blocks=0,none_stat_compr_size=0;
+static uint32_t none_stat_compr_blocks = 0, none_stat_decompr_blocks = 0, none_stat_compr_size = 0;
 
 /* jffs2_compress:
  * @data: Pointer to uncompressed data
  * @cdata: Pointer to returned pointer to buffer for compressed data
  * @datalen: On entry, holds the amount of data available for compression.
- *	On exit, expected to hold the amount of data actually compressed.
+ *      On exit, expected to hold the amount of data actually compressed.
  * @cdatalen: On entry, holds the amount of space available for compressed
- *	data. On exit, expected to hold the actual size of the compressed
- *	data.
+ *      data. On exit, expected to hold the actual size of the compressed
+ *      data.
  *
  * Returns: Lower byte to be stored with data indicating compression type used.
- * Zero is used to show that the data could not be compressed - the 
+ * Zero is used to show that the data could not be compressed - the
  * compressed version was actually larger than the original.
  * Upper byte will be used later. (soon)
  *
  * If the cdata buffer isn't large enough to hold all the uncompressed data,
- * jffs2_compress should compress as much as will fit, and should set 
+ * jffs2_compress should compress as much as will fit, and should set
  * *datalen accordingly to show the amount of data which were compressed.
  */
 uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-			     unsigned char *data_in, unsigned char **cpage_out, 
-			     uint32_t *datalen, uint32_t *cdatalen)
+			unsigned char *data_in, unsigned char **cpage_out,
+			uint32_t *datalen, uint32_t *cdatalen)
 {
 	int ret = JFFS2_COMPR_NONE;
-        int compr_ret;
-        struct jffs2_compressor *this, *best=NULL;
-        unsigned char *output_buf = NULL, *tmp_buf;
-        uint32_t orig_slen, orig_dlen;
-        uint32_t best_slen=0, best_dlen=0;
-
-        switch (jffs2_compression_mode) {
-        case JFFS2_COMPR_MODE_NONE:
-                break;
-        case JFFS2_COMPR_MODE_PRIORITY:
-                output_buf = kmalloc(*cdatalen,GFP_KERNEL);
-                if (!output_buf) {
-                        printk(KERN_WARNING "JFFS2: No memory for compressor allocation. Compression failed.\n");
-                        goto out;
-                }
-                orig_slen = *datalen;
-                orig_dlen = *cdatalen;
-                spin_lock(&jffs2_compressor_list_lock);
-                list_for_each_entry(this, &jffs2_compressor_list, list) {
-                        /* Skip decompress-only backwards-compatibility and disabled modules */
-                        if ((!this->compress)||(this->disabled))
-                                continue;
-
-                        this->usecount++;
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        *datalen  = orig_slen;
-                        *cdatalen = orig_dlen;
-                        compr_ret = this->compress(data_in, output_buf, datalen, cdatalen, NULL);
-                        spin_lock(&jffs2_compressor_list_lock);
-                        this->usecount--;
-                        if (!compr_ret) {
-                                ret = this->compr;
-                                this->stat_compr_blocks++;
-                                this->stat_compr_orig_size += *datalen;
-                                this->stat_compr_new_size  += *cdatalen;
-                                break;
-                        }
-                }
-                spin_unlock(&jffs2_compressor_list_lock);
-                if (ret == JFFS2_COMPR_NONE) kfree(output_buf);
-                break;
-        case JFFS2_COMPR_MODE_SIZE:
-                orig_slen = *datalen;
-                orig_dlen = *cdatalen;
-                spin_lock(&jffs2_compressor_list_lock);
-                list_for_each_entry(this, &jffs2_compressor_list, list) {
-                        /* Skip decompress-only backwards-compatibility and disabled modules */
-                        if ((!this->compress)||(this->disabled))
-                                continue;
-                        /* Allocating memory for output buffer if necessary */
-                        if ((this->compr_buf_size<orig_dlen)&&(this->compr_buf)) {
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                kfree(this->compr_buf);
-                                spin_lock(&jffs2_compressor_list_lock);
-                                this->compr_buf_size=0;
-                                this->compr_buf=NULL;
-                        }
-                        if (!this->compr_buf) {
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                tmp_buf = kmalloc(orig_dlen,GFP_KERNEL);
-                                spin_lock(&jffs2_compressor_list_lock);
-                                if (!tmp_buf) {
-                                        printk(KERN_WARNING "JFFS2: No memory for compressor allocation. (%d bytes)\n",orig_dlen);
-                                        continue;
-                                }
-                                else {
-                                        this->compr_buf = tmp_buf;
-                                        this->compr_buf_size = orig_dlen;
-                                }
-                        }
-                        this->usecount++;
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        *datalen  = orig_slen;
-                        *cdatalen = orig_dlen;
-                        compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen, NULL);
-                        spin_lock(&jffs2_compressor_list_lock);
-                        this->usecount--;
-                        if (!compr_ret) {
-                                if ((!best_dlen)||(best_dlen>*cdatalen)) {
-                                        best_dlen = *cdatalen;
-                                        best_slen = *datalen;
-                                        best = this;
-                                }
-                        }
-                }
-                if (best_dlen) {
-                        *cdatalen = best_dlen;
-                        *datalen  = best_slen;
-                        output_buf = best->compr_buf;
-                        best->compr_buf = NULL;
-                        best->compr_buf_size = 0;
-                        best->stat_compr_blocks++;
-                        best->stat_compr_orig_size += best_slen;
-                        best->stat_compr_new_size  += best_dlen;
-                        ret = best->compr;
-                }
-                spin_unlock(&jffs2_compressor_list_lock);
-                break;
-        default:
-                printk(KERN_ERR "JFFS2: unknow compression mode.\n");
-        }
+	int compr_ret;
+	struct jffs2_compressor *this, *best = NULL;
+	unsigned char *output_buf = NULL, *tmp_buf;
+	uint32_t orig_slen, orig_dlen;
+	uint32_t best_slen = 0, best_dlen = 0;
+
+	switch (jffs2_compression_mode) {
+	case JFFS2_COMPR_MODE_NONE:
+		break;
+	case JFFS2_COMPR_MODE_PRIORITY:
+		output_buf = kmalloc(*cdatalen, GFP_KERNEL);
+		if (!output_buf) {
+			printk(KERN_WARNING "JFFS2: No memory for compressor allocation. Compression failed.\n");
+			goto out;
+		}
+		orig_slen = *datalen;
+		orig_dlen = *cdatalen;
+		spin_lock(&jffs2_compressor_list_lock);
+		list_for_each_entry(this, &jffs2_compressor_list, list) {
+			/* Skip decompress-only backwards-compatibility and disabled modules */
+			if ((!this->compress)||(this->disabled))
+				continue;
+
+			this->usecount++;
+			spin_unlock(&jffs2_compressor_list_lock);
+			*datalen  = orig_slen;
+			*cdatalen = orig_dlen;
+			compr_ret = this->compress(data_in, output_buf, datalen, cdatalen, NULL);
+			spin_lock(&jffs2_compressor_list_lock);
+			this->usecount--;
+			if (!compr_ret) {
+				ret = this->compr;
+				this->stat_compr_blocks++;
+				this->stat_compr_orig_size += *datalen;
+				this->stat_compr_new_size  += *cdatalen;
+				break;
+			}
+		}
+		spin_unlock(&jffs2_compressor_list_lock);
+		if (ret == JFFS2_COMPR_NONE)
+			kfree(output_buf);
+		break;
+	case JFFS2_COMPR_MODE_SIZE:
+		orig_slen = *datalen;
+		orig_dlen = *cdatalen;
+		spin_lock(&jffs2_compressor_list_lock);
+		list_for_each_entry(this, &jffs2_compressor_list, list) {
+			/* Skip decompress-only backwards-compatibility and disabled modules */
+			if ((!this->compress)||(this->disabled))
+				continue;
+			/* Allocating memory for output buffer if necessary */
+			if ((this->compr_buf_size < orig_dlen)&&(this->compr_buf)) {
+				spin_unlock(&jffs2_compressor_list_lock);
+				kfree(this->compr_buf);
+				spin_lock(&jffs2_compressor_list_lock);
+				this->compr_buf_size = 0;
+				this->compr_buf = NULL;
+			}
+			if (!this->compr_buf) {
+				spin_unlock(&jffs2_compressor_list_lock);
+				tmp_buf = kmalloc(orig_dlen, GFP_KERNEL);
+				spin_lock(&jffs2_compressor_list_lock);
+				if (!tmp_buf) {
+					printk(KERN_WARNING "JFFS2: No memory for compressor allocation. (%d bytes)\n", orig_dlen);
+					continue;
+				} else {
+					this->compr_buf = tmp_buf;
+					this->compr_buf_size = orig_dlen;
+				}
+			}
+			this->usecount++;
+			spin_unlock(&jffs2_compressor_list_lock);
+			*datalen  = orig_slen;
+			*cdatalen = orig_dlen;
+			compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen, NULL);
+			spin_lock(&jffs2_compressor_list_lock);
+			this->usecount--;
+			if (!compr_ret) {
+				if ((!best_dlen) || (best_dlen > *cdatalen)) {
+					best_dlen = *cdatalen;
+					best_slen = *datalen;
+					best = this;
+				}
+			}
+		}
+		if (best_dlen) {
+			*cdatalen = best_dlen;
+			*datalen  = best_slen;
+			output_buf = best->compr_buf;
+			best->compr_buf = NULL;
+			best->compr_buf_size = 0;
+			best->stat_compr_blocks++;
+			best->stat_compr_orig_size += best_slen;
+			best->stat_compr_new_size  += best_dlen;
+			ret = best->compr;
+		}
+		spin_unlock(&jffs2_compressor_list_lock);
+		break;
+	default:
+		printk(KERN_ERR "JFFS2: unknow compression mode.\n");
+	}
  out:
-        if (ret == JFFS2_COMPR_NONE) {
-	        *cpage_out = data_in;
-	        *datalen = *cdatalen;
-                none_stat_compr_blocks++;
-                none_stat_compr_size += *datalen;
-        }
-        else {
-                *cpage_out = output_buf;
-        }
+	if (ret == JFFS2_COMPR_NONE) {
+		*cpage_out = data_in;
+		*datalen = *cdatalen;
+		none_stat_compr_blocks++;
+		none_stat_compr_size += *datalen;
+	} else {
+		*cpage_out = output_buf;
+	}
 	return ret;
 }
 
 int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-		     uint16_t comprtype, unsigned char *cdata_in, 
+		     uint16_t comprtype, unsigned char *cdata_in,
 		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen)
 {
-        struct jffs2_compressor *this;
-        int ret;
+	struct jffs2_compressor *this;
+	int ret;
 
 	/* Older code had a bug where it would write non-zero 'usercompr'
 	   fields. Deal with it. */
@@ -185,26 +184,25 @@
 		memset(data_out, 0, datalen);
 		break;
 	default:
-                spin_lock(&jffs2_compressor_list_lock);
-                list_for_each_entry(this, &jffs2_compressor_list, list) {
-                        if (comprtype == this->compr) {
-                                this->usecount++;
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                ret = this->decompress(cdata_in, data_out, cdatalen, datalen, NULL);
-                                spin_lock(&jffs2_compressor_list_lock);
-                                if (ret) {
-                                        printk(KERN_WARNING "Decompressor \"%s\" returned %d\n", this->name, ret);
-                                }
-                                else {
-                                        this->stat_decompr_blocks++;
-                                }
-                                this->usecount--;
-                                spin_unlock(&jffs2_compressor_list_lock);
-                                return ret;
-                        }
-                }
+		spin_lock(&jffs2_compressor_list_lock);
+		list_for_each_entry(this, &jffs2_compressor_list, list) {
+			if (comprtype == this->compr) {
+				this->usecount++;
+				spin_unlock(&jffs2_compressor_list_lock);
+				ret = this->decompress(cdata_in, data_out, cdatalen, datalen, NULL);
+				spin_lock(&jffs2_compressor_list_lock);
+				if (ret) {
+					printk(KERN_WARNING "Decompressor \"%s\" returned %d\n", this->name, ret);
+				} else {
+					this->stat_decompr_blocks++;
+				}
+				this->usecount--;
+				spin_unlock(&jffs2_compressor_list_lock);
+				return ret;
+			}
+		}
 		printk(KERN_WARNING "JFFS2 compression type 0x%02x not available.\n", comprtype);
-                spin_unlock(&jffs2_compressor_list_lock);
+		spin_unlock(&jffs2_compressor_list_lock);
 		return -EIO;
 	}
 	return 0;
@@ -212,60 +210,60 @@
 
 int jffs2_register_compressor(struct jffs2_compressor *comp)
 {
-        struct jffs2_compressor *this;
+	struct jffs2_compressor *this;
 
-        if (!comp->name) {
-                printk(KERN_WARNING "NULL compressor name at registering JFFS2 compressor. Failed.\n");
-                return -1;
-        }
-        comp->compr_buf_size=0;
-        comp->compr_buf=NULL;
-        comp->usecount=0;
-        comp->stat_compr_orig_size=0;
-        comp->stat_compr_new_size=0;
-        comp->stat_compr_blocks=0;
-        comp->stat_decompr_blocks=0;
-        D1(printk(KERN_DEBUG "Registering JFFS2 compressor \"%s\"\n", comp->name));
-
-        spin_lock(&jffs2_compressor_list_lock);
-
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (this->priority < comp->priority) {
-                        list_add(&comp->list, this->list.prev);
-                        goto out;
-                }
-        }
-        list_add_tail(&comp->list, &jffs2_compressor_list);
+	if (!comp->name) {
+		printk(KERN_WARNING "NULL compressor name at registering JFFS2 compressor. Failed.\n");
+		return -1;
+	}
+	comp->compr_buf_size = 0;
+	comp->compr_buf = NULL;
+	comp->usecount = 0;
+	comp->stat_compr_orig_size = 0;
+	comp->stat_compr_new_size = 0;
+	comp->stat_compr_blocks = 0;
+	comp->stat_decompr_blocks = 0;
+	D1(printk(KERN_DEBUG "Registering JFFS2 compressor \"%s\"\n", comp->name));
+
+	spin_lock(&jffs2_compressor_list_lock);
+
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (this->priority < comp->priority) {
+			list_add(&comp->list, this->list.prev);
+			goto out;
+		}
+	}
+	list_add_tail(&comp->list, &jffs2_compressor_list);
 out:
-        D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
-                printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
-        })
+	D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
+		printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
+	})
 
-        spin_unlock(&jffs2_compressor_list_lock);
+	spin_unlock(&jffs2_compressor_list_lock);
 
-        return 0;
+	return 0;
 }
 
 int jffs2_unregister_compressor(struct jffs2_compressor *comp)
 {
-        D2(struct jffs2_compressor *this;)
+	D2(struct jffs2_compressor *this;)
 
-        D1(printk(KERN_DEBUG "Unregistering JFFS2 compressor \"%s\"\n", comp->name));
+		D1(printk(KERN_DEBUG "Unregistering JFFS2 compressor \"%s\"\n", comp->name));
 
-        spin_lock(&jffs2_compressor_list_lock);
+	spin_lock(&jffs2_compressor_list_lock);
+
+	if (comp->usecount) {
+		spin_unlock(&jffs2_compressor_list_lock);
+		printk(KERN_WARNING "JFFS2: Compressor modul is in use. Unregister failed.\n");
+		return -1;
+	}
+	list_del(&comp->list);
 
-        if (comp->usecount) {
-                spin_unlock(&jffs2_compressor_list_lock);
-                printk(KERN_WARNING "JFFS2: Compressor modul is in use. Unregister failed.\n");
-                return -1;
-        }
-        list_del(&comp->list);
-
-        D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
-                printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
-        })
-        spin_unlock(&jffs2_compressor_list_lock);
-        return 0;
+	D2(list_for_each_entry(this, &jffs2_compressor_list, list) {
+		printk(KERN_DEBUG "Compressor \"%s\", prio %d\n", this->name, this->priority);
+	})
+	spin_unlock(&jffs2_compressor_list_lock);
+	return 0;
 }
 
 #ifdef CONFIG_JFFS2_PROC
@@ -274,184 +272,184 @@
 
 char *jffs2_list_compressors(void)
 {
-        struct jffs2_compressor *this;
-        char *buf, *act_buf;
+	struct jffs2_compressor *this;
+	char *buf, *act_buf;
 
-        act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE,GFP_KERNEL);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                act_buf += sprintf(act_buf, "%10s priority:%d ", this->name, this->priority);
-                if ((this->disabled)||(!this->compress))
-                        act_buf += sprintf(act_buf,"disabled");
-                else
-                        act_buf += sprintf(act_buf,"enabled");
-                act_buf += sprintf(act_buf,"\n");
-        }
-        return buf;
+	act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE, GFP_KERNEL);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		act_buf += sprintf(act_buf, "%10s priority:%d ", this->name, this->priority);
+		if ((this->disabled)||(!this->compress))
+			act_buf += sprintf(act_buf, "disabled");
+		else
+			act_buf += sprintf(act_buf, "enabled");
+		act_buf += sprintf(act_buf, "\n");
+	}
+	return buf;
 }
 
 char *jffs2_stats(void)
 {
-        struct jffs2_compressor *this;
-        char *buf, *act_buf;
+	struct jffs2_compressor *this;
+	char *buf, *act_buf;
+
+	act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE, GFP_KERNEL);
+
+	act_buf += sprintf(act_buf, "JFFS2 compressor statistics:\n");
+	act_buf += sprintf(act_buf, "%10s   ", "none");
+	act_buf += sprintf(act_buf, "compr: %d blocks (%d)  decompr: %d blocks\n", none_stat_compr_blocks,
+			none_stat_compr_size, none_stat_decompr_blocks);
+	spin_lock(&jffs2_compressor_list_lock);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		act_buf += sprintf(act_buf, "%10s ", this->name);
+		if ((this->disabled)||(!this->compress))
+			act_buf += sprintf(act_buf, "- ");
+		else
+			act_buf += sprintf(act_buf, "+ ");
+		act_buf += sprintf(act_buf, "compr: %d blocks (%d/%d)  decompr: %d blocks ", this->stat_compr_blocks,
+				this->stat_compr_new_size, this->stat_compr_orig_size,
+				this->stat_decompr_blocks);
+		act_buf += sprintf(act_buf, "\n");
+	}
+	spin_unlock(&jffs2_compressor_list_lock);
+
+	return buf;
+}
 
-        act_buf = buf = kmalloc(JFFS2_STAT_BUF_SIZE,GFP_KERNEL);
+char *jffs2_get_compression_mode_name(void)
+{
+	switch (jffs2_compression_mode) {
+	case JFFS2_COMPR_MODE_NONE:
+		return "none";
+	case JFFS2_COMPR_MODE_PRIORITY:
+		return "priority";
+	case JFFS2_COMPR_MODE_SIZE:
+		return "size";
+	}
+	return "unkown";
+}
 
-        act_buf += sprintf(act_buf,"JFFS2 compressor statistics:\n");
-        act_buf += sprintf(act_buf,"%10s   ","none");
-        act_buf += sprintf(act_buf,"compr: %d blocks (%d)  decompr: %d blocks\n", none_stat_compr_blocks, 
-                           none_stat_compr_size, none_stat_decompr_blocks);
-        spin_lock(&jffs2_compressor_list_lock);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                act_buf += sprintf(act_buf,"%10s ",this->name);
-                if ((this->disabled)||(!this->compress))
-                        act_buf += sprintf(act_buf,"- ");
-                else
-                        act_buf += sprintf(act_buf,"+ ");
-                act_buf += sprintf(act_buf,"compr: %d blocks (%d/%d)  decompr: %d blocks ", this->stat_compr_blocks, 
-                                   this->stat_compr_new_size, this->stat_compr_orig_size, 
-                                   this->stat_decompr_blocks);
-                act_buf += sprintf(act_buf,"\n");
-        }
-        spin_unlock(&jffs2_compressor_list_lock);
-
-        return buf;
-}
-
-char *jffs2_get_compression_mode_name(void) 
-{
-        switch (jffs2_compression_mode) {
-        case JFFS2_COMPR_MODE_NONE:
-                return "none";
-        case JFFS2_COMPR_MODE_PRIORITY:
-                return "priority";
-        case JFFS2_COMPR_MODE_SIZE:
-                return "size";
-        }
-        return "unkown";
-}
-
-int jffs2_set_compression_mode_name(const char *name) 
-{
-        if (!strcmp("none",name)) {
-                jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
-                return 0;
-        }
-        if (!strcmp("priority",name)) {
-                jffs2_compression_mode = JFFS2_COMPR_MODE_PRIORITY;
-                return 0;
-        }
-        if (!strcmp("size",name)) {
-                jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
-                return 0;
-        }
-        return 1;
+int jffs2_set_compression_mode_name(const char *name)
+{
+	if (!strcmp("none", name)) {
+		jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
+		return 0;
+	}
+	if (!strcmp("priority", name)) {
+		jffs2_compression_mode = JFFS2_COMPR_MODE_PRIORITY;
+		return 0;
+	}
+	if (!strcmp("size", name)) {
+		jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
+		return 0;
+	}
+	return 1;
 }
 
 static int jffs2_compressor_Xable(const char *name, int disabled)
 {
-        struct jffs2_compressor *this;
-        spin_lock(&jffs2_compressor_list_lock);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (!strcmp(this->name, name)) {
-                        this->disabled = disabled;
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        return 0;                        
-                }
-        }
-        spin_unlock(&jffs2_compressor_list_lock);
-        printk(KERN_WARNING "JFFS2: compressor %s not found.\n",name);
-        return 1;
+	struct jffs2_compressor *this;
+	spin_lock(&jffs2_compressor_list_lock);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (!strcmp(this->name, name)) {
+			this->disabled = disabled;
+			spin_unlock(&jffs2_compressor_list_lock);
+			return 0;
+		}
+	}
+	spin_unlock(&jffs2_compressor_list_lock);
+	printk(KERN_WARNING "JFFS2: compressor %s not found.\n", name);
+	return 1;
 }
 
 int jffs2_enable_compressor_name(const char *name)
 {
-        return jffs2_compressor_Xable(name, 0);
+	return jffs2_compressor_Xable(name, 0);
 }
 
 int jffs2_disable_compressor_name(const char *name)
 {
-        return jffs2_compressor_Xable(name, 1);
+	return jffs2_compressor_Xable(name, 1);
 }
 
 int jffs2_set_compressor_priority(const char *name, int priority)
 {
-        struct jffs2_compressor *this,*comp;
-        spin_lock(&jffs2_compressor_list_lock);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (!strcmp(this->name, name)) {
-                        this->priority = priority;
-                        comp = this;
-                        goto reinsert;
-                }
-        }
-        spin_unlock(&jffs2_compressor_list_lock);
-        printk(KERN_WARNING "JFFS2: compressor %s not found.\n",name);        
-        return 1;
+	struct jffs2_compressor *this, *comp;
+	spin_lock(&jffs2_compressor_list_lock);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (!strcmp(this->name, name)) {
+			this->priority = priority;
+			comp = this;
+			goto reinsert;
+		}
+	}
+	spin_unlock(&jffs2_compressor_list_lock);
+	printk(KERN_WARNING "JFFS2: compressor %s not found.\n", name);
+	return 1;
 reinsert:
-        /* list is sorted in the order of priority, so if
-           we change it we have to reinsert it into the
-           good place */
-        list_del(&comp->list);
-        list_for_each_entry(this, &jffs2_compressor_list, list) {
-                if (this->priority < comp->priority) {
-                        list_add(&comp->list, this->list.prev);
-                        spin_unlock(&jffs2_compressor_list_lock);
-                        return 0;
-                }
-        }
-        list_add_tail(&comp->list, &jffs2_compressor_list);
-        spin_unlock(&jffs2_compressor_list_lock);
-        return 0;
+	/* list is sorted in the order of priority, so if
+	   we change it we have to reinsert it into the
+	   good place */
+	list_del(&comp->list);
+	list_for_each_entry(this, &jffs2_compressor_list, list) {
+		if (this->priority < comp->priority) {
+			list_add(&comp->list, this->list.prev);
+			spin_unlock(&jffs2_compressor_list_lock);
+			return 0;
+		}
+	}
+	list_add_tail(&comp->list, &jffs2_compressor_list);
+	spin_unlock(&jffs2_compressor_list_lock);
+	return 0;
 }
 
 #endif
 
 void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig)
 {
-        if (orig != comprbuf)
-                kfree(comprbuf);
+	if (orig != comprbuf)
+		kfree(comprbuf);
 }
 
-int jffs2_compressors_init(void) 
+int jffs2_compressors_init(void)
 {
 /* Registering compressors */
 #ifdef CONFIG_JFFS2_ZLIB
-        jffs2_zlib_init();
+	jffs2_zlib_init();
 #endif
 #ifdef CONFIG_JFFS2_RTIME
-        jffs2_rtime_init();
+	jffs2_rtime_init();
 #endif
 #ifdef CONFIG_JFFS2_RUBIN
-        jffs2_rubinmips_init();
-        jffs2_dynrubin_init();
+	jffs2_rubinmips_init();
+	jffs2_dynrubin_init();
 #endif
 /* Setting default compression mode */
 #ifdef CONFIG_JFFS2_CMODE_NONE
-        jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
-        D1(printk(KERN_INFO "JFFS2: default compression mode: none\n");)
+	jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
+	D1(printk(KERN_INFO "JFFS2: default compression mode: none\n");)
 #else
 #ifdef CONFIG_JFFS2_CMODE_SIZE
-        jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
-        D1(printk(KERN_INFO "JFFS2: default compression mode: size\n");)
+	jffs2_compression_mode = JFFS2_COMPR_MODE_SIZE;
+	D1(printk(KERN_INFO "JFFS2: default compression mode: size\n");)
 #else
-        D1(printk(KERN_INFO "JFFS2: default compression mode: priority\n");)
+	D1(printk(KERN_INFO "JFFS2: default compression mode: priority\n");)
 #endif
 #endif
-        return 0;
+	return 0;
 }
 
-int jffs2_compressors_exit(void) 
+int jffs2_compressors_exit(void)
 {
 /* Unregistering compressors */
 #ifdef CONFIG_JFFS2_RUBIN
-        jffs2_dynrubin_exit();
-        jffs2_rubinmips_exit();
+	jffs2_dynrubin_exit();
+	jffs2_rubinmips_exit();
 #endif
 #ifdef CONFIG_JFFS2_RTIME
-        jffs2_rtime_exit();
+	jffs2_rtime_exit();
 #endif
 #ifdef CONFIG_JFFS2_ZLIB
-        jffs2_zlib_exit();
+	jffs2_zlib_exit();
 #endif
-        return 0;
+	return 0;
 }
diff -uNr mtd/fs/jffs2/compr.h mtd-whitespace/fs/jffs2/compr.h
--- mtd/fs/jffs2/compr.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr.h	2005-09-22 15:11:04.477733248 -0600
@@ -4,7 +4,7 @@
  * Copyright (C) 2004 Ferenc Havasi <havasi@inf.u-szeged.hu>,
  *                    University of Szeged, Hungary
  *
- * For licensing information, see the file 'LICENCE' in the 
+ * For licensing information, see the file 'LICENCE' in the
  * jffs2 directory.
  *
  * $Id: compr.h,v 1.8 2005/07/26 13:24:40 havasi Exp $
@@ -42,22 +42,22 @@
 #define JFFS2_COMPR_MODE_SIZE       2
 
 struct jffs2_compressor {
-        struct list_head list;
-        int priority;              /* used by prirority comr. mode */
-        char *name;
-        char compr;                /* JFFS2_COMPR_XXX */
-        int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
-                        uint32_t *srclen, uint32_t *destlen, void *model);
-        int (*decompress)(unsigned char *cdata_in, unsigned char *data_out,
-                        uint32_t cdatalen, uint32_t datalen, void *model);
-        int usecount;
-        int disabled;              /* if seted the compressor won't compress */
-        unsigned char *compr_buf;  /* used by size compr. mode */
-        uint32_t compr_buf_size;   /* used by size compr. mode */
-        uint32_t stat_compr_orig_size;
-        uint32_t stat_compr_new_size;
-        uint32_t stat_compr_blocks;
-        uint32_t stat_decompr_blocks;
+	struct list_head list;
+	int priority;              /* used by prirority comr. mode */
+	char *name;
+	char compr;                /* JFFS2_COMPR_XXX */
+	int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
+			uint32_t *srclen, uint32_t *destlen, void *model);
+	int (*decompress)(unsigned char *cdata_in, unsigned char *data_out,
+			uint32_t cdatalen, uint32_t datalen, void *model);
+	int usecount;
+	int disabled;              /* if seted the compressor won't compress */
+	unsigned char *compr_buf;  /* used by size compr. mode */
+	uint32_t compr_buf_size;   /* used by size compr. mode */
+	uint32_t stat_compr_orig_size;
+	uint32_t stat_compr_new_size;
+	uint32_t stat_compr_blocks;
+	uint32_t stat_decompr_blocks;
 };
 
 int jffs2_register_compressor(struct jffs2_compressor *comp);
@@ -67,12 +67,12 @@
 int jffs2_compressors_exit(void);
 
 uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-                             unsigned char *data_in, unsigned char **cpage_out,
-                             uint32_t *datalen, uint32_t *cdatalen);
+			unsigned char *data_in, unsigned char **cpage_out,
+			uint32_t *datalen, uint32_t *cdatalen);
 
 int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-                     uint16_t comprtype, unsigned char *cdata_in,
-                     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
+		     uint16_t comprtype, unsigned char *cdata_in,
+		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
 
 void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig);
 
diff -uNr mtd/fs/jffs2/compr_rtime.c mtd-whitespace/fs/jffs2/compr_rtime.c
--- mtd/fs/jffs2/compr_rtime.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_rtime.c	2005-09-22 16:56:29.945116040 -0600
@@ -24,8 +24,8 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/string.h> 
-#include <linux/jffs2.h> 
+#include <linux/string.h>
+#include <linux/jffs2.h>
 #include "compr.h"
 
 /* _compress returns the compressed size, -1 if bigger */
@@ -36,23 +36,23 @@
 {
 	short positions[256];
 	int outpos = 0;
-	int pos=0;
+	int pos = 0;
+
+	memset(positions, 0, sizeof(positions));
 
-	memset(positions,0,sizeof(positions)); 
-	
 	while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
-		int backpos, runlen=0;
+		int backpos, runlen = 0;
 		unsigned char value;
-		
+
 		value = data_in[pos];
 
 		cpage_out[outpos++] = data_in[pos++];
-		
+
 		backpos = positions[value];
-		positions[value]=pos;
-		
+		positions[value] = pos;
+
 		while ((backpos < pos) && (pos < (*sourcelen)) &&
-		       (data_in[pos]==data_in[backpos++]) && (runlen<255)) {
+		       (data_in[pos] == data_in[backpos++]) && (runlen < 255)) {
 			pos++;
 			runlen++;
 		}
@@ -63,13 +63,12 @@
 		/* We failed */
 		return -1;
 	}
-	
+
 	/* Tell the caller how much we managed to compress, and how much space it took */
 	*sourcelen = pos;
 	*dstlen = outpos;
 	return 0;
-}		   
-
+}
 
 static int jffs2_rtime_decompress(unsigned char *data_in,
 				  unsigned char *cpage_out,
@@ -78,55 +77,55 @@
 {
 	short positions[256];
 	int outpos = 0;
-	int pos=0;
-	
-	memset(positions,0,sizeof(positions)); 
-	
-	while (outpos<destlen) {
+	int pos = 0;
+
+	memset(positions, 0, sizeof(positions));
+
+	while (outpos < destlen) {
 		unsigned char value;
 		int backoffs;
 		int repeat;
-		
+
 		value = data_in[pos++];
 		cpage_out[outpos++] = value; /* first the verbatim copied byte */
 		repeat = data_in[pos++];
 		backoffs = positions[value];
-		
-		positions[value]=outpos;
+
+		positions[value] = outpos;
 		if (repeat) {
 			if (backoffs + repeat >= outpos) {
-				while(repeat) {
+				while (repeat) {
 					cpage_out[outpos++] = cpage_out[backoffs++];
 					repeat--;
 				}
 			} else {
-				memcpy(&cpage_out[outpos],&cpage_out[backoffs],repeat);
-				outpos+=repeat;		
+				memcpy(&cpage_out[outpos], &cpage_out[backoffs], repeat);
+				outpos += repeat;
 			}
 		}
 	}
-        return 0;
-}		   
+	return 0;
+}
 
 static struct jffs2_compressor jffs2_rtime_comp = {
-    .priority = JFFS2_RTIME_PRIORITY,
-    .name = "rtime",
-    .compr = JFFS2_COMPR_RTIME,
-    .compress = &jffs2_rtime_compress,
-    .decompress = &jffs2_rtime_decompress,
+	.priority = JFFS2_RTIME_PRIORITY,
+	.name = "rtime",
+	.compr = JFFS2_COMPR_RTIME,
+	.compress = &jffs2_rtime_compress,
+	.decompress = &jffs2_rtime_decompress,
 #ifdef JFFS2_RTIME_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int jffs2_rtime_init(void)
 {
-    return jffs2_register_compressor(&jffs2_rtime_comp);
+	return jffs2_register_compressor(&jffs2_rtime_comp);
 }
 
 void jffs2_rtime_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_rtime_comp);
+	jffs2_unregister_compressor(&jffs2_rtime_comp);
 }
diff -uNr mtd/fs/jffs2/compr_rubin.c mtd-whitespace/fs/jffs2/compr_rubin.c
--- mtd/fs/jffs2/compr_rubin.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_rubin.c	2005-09-22 16:43:33.651130664 -0600
@@ -11,7 +11,7 @@
  *
  */
 
- 
+
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/jffs2.h>
@@ -20,27 +20,25 @@
 #include "compr.h"
 
 static void init_rubin(struct rubin_state *rs, int div, int *bits)
-{	
+{
 	int c;
 
 	rs->q = 0;
 	rs->p = (long) (2 * UPPER_BIT_RUBIN);
 	rs->bit_number = (long) 0;
 	rs->bit_divider = div;
-	for (c=0; c<8; c++)
+	for (c = 0; c < 8; c++)
 		rs->bits[c] = bits[c];
 }
 
-
 static int encode(struct rubin_state *rs, long A, long B, int symbol)
 {
-
 	long i0, i1;
 	int ret;
 
 	while ((rs->q >= UPPER_BIT_RUBIN) || ((rs->p + rs->q) <= UPPER_BIT_RUBIN)) {
 		rs->bit_number++;
-		
+
 		ret = pushbit(&rs->pp, (rs->q & UPPER_BIT_RUBIN) ? 1 : 0, 0);
 		if (ret)
 			return ret;
@@ -66,10 +64,8 @@
 	return 0;
 }
 
-
 static void end_rubin(struct rubin_state *rs)
-{				
-
+{
 	int i;
 
 	for (i = 0; i < RUBIN_REG_SIZE; i++) {
@@ -79,10 +75,9 @@
 	}
 }
 
-
 static void init_decode(struct rubin_state *rs, int div, int *bits)
 {
-	init_rubin(rs, div, bits);		
+	init_rubin(rs, div, bits);
 
 	/* behalve lower */
 	rs->rec_q = 0;
@@ -156,22 +151,20 @@
 	return symbol;
 }
 
-
-
 static int out_byte(struct rubin_state *rs, unsigned char byte)
 {
 	int i, ret;
 	struct rubin_state rs_copy;
 	rs_copy = *rs;
 
-	for (i=0;i<8;i++) {
-		ret = encode(rs, rs->bit_divider-rs->bits[i],rs->bits[i],byte&1);
+	for (i = 0; i < 8; i++) {
+		ret = encode(rs, rs->bit_divider-rs->bits[i], rs->bits[i], byte&1);
 		if (ret) {
 			/* Failed. Restore old state */
 			*rs = rs_copy;
 			return ret;
 		}
-		byte=byte>>1;
+		byte = byte >> 1;
 	}
 	return 0;
 }
@@ -186,48 +179,48 @@
 	return result;
 }
 
-
-
-static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in, 
+static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in,
 		      unsigned char *cpage_out, uint32_t *sourcelen, uint32_t *dstlen)
 	{
 	int outpos = 0;
-	int pos=0;
+	int pos = 0;
 	struct rubin_state rs;
 
 	init_pushpull(&rs.pp, cpage_out, *dstlen * 8, 0, 32);
 
 	init_rubin(&rs, bit_divider, bits);
-	
+
 	while (pos < (*sourcelen) && !out_byte(&rs, data_in[pos]))
 		pos++;
-	
+
 	end_rubin(&rs);
 
 	if (outpos > pos) {
 		/* We failed */
 		return -1;
 	}
-	
-	/* Tell the caller how much we managed to compress, 
+
+	/* Tell the caller how much we managed to compress,
 	 * and how much space it took */
-	
+
 	outpos = (pushedbits(&rs.pp)+7)/8;
-	
+
 	if (outpos >= pos)
 		return -1; /* We didn't actually compress */
 	*sourcelen = pos;
 	*dstlen = outpos;
 	return 0;
-}		   
+}
+
 #if 0
 /* _compress returns the compressed size, -1 if bigger */
-int jffs2_rubinmips_compress(unsigned char *data_in, unsigned char *cpage_out, 
+int jffs2_rubinmips_compress(unsigned char *data_in, unsigned char *cpage_out,
 		   uint32_t *sourcelen, uint32_t *dstlen, void *model)
 {
 	return rubin_do_compress(BIT_DIVIDER_MIPS, bits_mips, data_in, cpage_out, sourcelen, dstlen);
 }
 #endif
+
 static int jffs2_dynrubin_compress(unsigned char *data_in,
 				   unsigned char *cpage_out,
 				   uint32_t *sourcelen, uint32_t *dstlen,
@@ -246,11 +239,11 @@
 		return -1;
 
 	memset(histo, 0, 256);
-	for (i=0; i<mysrclen; i++) {
+	for (i = 0; i < mysrclen; i++) {
 		histo[data_in[i]]++;
 	}
 	memset(bits, 0, sizeof(int)*8);
-	for (i=0; i<256; i++) {
+	for (i = 0; i < 256; i++) {
 		if (i&128)
 			bits[7] += histo[i];
 		if (i&64)
@@ -269,15 +262,17 @@
 			bits[0] += histo[i];
 	}
 
-	for (i=0; i<8; i++) {
+	for (i = 0; i < 8; i++) {
 		bits[i] = (bits[i] * 256) / mysrclen;
-		if (!bits[i]) bits[i] = 1;
-		if (bits[i] > 255) bits[i] = 255;
+		if (!bits[i])
+			bits[i] = 1;
+		if (bits[i] > 255)
+			bits[i] = 255;
 		cpage_out[i] = bits[i];
 	}
 
 	ret = rubin_do_compress(256, bits, data_in, cpage_out+8, &mysrclen, &mydstlen);
-	if (ret) 
+	if (ret)
 		return ret;
 
 	/* Add back the 8 bytes we took for the probabilities */
@@ -293,19 +288,19 @@
 	return 0;
 }
 
-static void rubin_do_decompress(int bit_divider, int *bits, unsigned char *cdata_in, 
+static void rubin_do_decompress(int bit_divider, int *bits, unsigned char *cdata_in,
 			 unsigned char *page_out, uint32_t srclen, uint32_t destlen)
 {
 	int outpos = 0;
 	struct rubin_state rs;
-	
+
 	init_pushpull(&rs.pp, cdata_in, srclen, 0, 0);
 	init_decode(&rs, bit_divider, bits);
-	
+
 	while (outpos < destlen) {
 		page_out[outpos++] = in_byte(&rs);
 	}
-}		   
+}
 
 
 static int jffs2_rubinmips_decompress(unsigned char *data_in,
@@ -314,7 +309,7 @@
 				      void *model)
 {
 	rubin_do_decompress(BIT_DIVIDER_MIPS, bits_mips, data_in, cpage_out, sourcelen, dstlen);
-        return 0;
+	return 0;
 }
 
 static int jffs2_dynrubin_decompress(unsigned char *data_in,
@@ -325,55 +320,55 @@
 	int bits[8];
 	int c;
 
-	for (c=0; c<8; c++)
+	for (c = 0; c < 8; c++)
 		bits[c] = data_in[c];
 
 	rubin_do_decompress(256, bits, data_in+8, cpage_out, sourcelen-8, dstlen);
-        return 0;
+	return 0;
 }
 
 static struct jffs2_compressor jffs2_rubinmips_comp = {
-    .priority = JFFS2_RUBINMIPS_PRIORITY,
-    .name = "rubinmips",
-    .compr = JFFS2_COMPR_DYNRUBIN,
-    .compress = NULL, /*&jffs2_rubinmips_compress,*/
-    .decompress = &jffs2_rubinmips_decompress,
+	.priority = JFFS2_RUBINMIPS_PRIORITY,
+	.name = "rubinmips",
+	.compr = JFFS2_COMPR_DYNRUBIN,
+	.compress = NULL, /*&jffs2_rubinmips_compress,*/
+	.decompress = &jffs2_rubinmips_decompress,
 #ifdef JFFS2_RUBINMIPS_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int jffs2_rubinmips_init(void)
 {
-    return jffs2_register_compressor(&jffs2_rubinmips_comp);
+	return jffs2_register_compressor(&jffs2_rubinmips_comp);
 }
 
 void jffs2_rubinmips_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_rubinmips_comp);
+	jffs2_unregister_compressor(&jffs2_rubinmips_comp);
 }
 
 static struct jffs2_compressor jffs2_dynrubin_comp = {
-    .priority = JFFS2_DYNRUBIN_PRIORITY,
-    .name = "dynrubin",
-    .compr = JFFS2_COMPR_RUBINMIPS,
-    .compress = jffs2_dynrubin_compress,
-    .decompress = &jffs2_dynrubin_decompress,
+	.priority = JFFS2_DYNRUBIN_PRIORITY,
+	.name = "dynrubin",
+	.compr = JFFS2_COMPR_RUBINMIPS,
+	.compress = jffs2_dynrubin_compress,
+	.decompress = &jffs2_dynrubin_decompress,
 #ifdef JFFS2_DYNRUBIN_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int jffs2_dynrubin_init(void)
 {
-    return jffs2_register_compressor(&jffs2_dynrubin_comp);
+	return jffs2_register_compressor(&jffs2_dynrubin_comp);
 }
 
 void jffs2_dynrubin_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_dynrubin_comp);
+	jffs2_unregister_compressor(&jffs2_dynrubin_comp);
 }
diff -uNr mtd/fs/jffs2/compr_rubin.h mtd-whitespace/fs/jffs2/compr_rubin.h
--- mtd/fs/jffs2/compr_rubin.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_rubin.h	2005-09-22 15:16:40.537644376 -0600
@@ -6,13 +6,13 @@
 #include "pushpull.h"
 
 #define RUBIN_REG_SIZE   16
-#define UPPER_BIT_RUBIN    (((long) 1)<<(RUBIN_REG_SIZE-1))
-#define LOWER_BITS_RUBIN   ((((long) 1)<<(RUBIN_REG_SIZE-1))-1)
+#define UPPER_BIT_RUBIN    (((long) 1) << (RUBIN_REG_SIZE - 1))
+#define LOWER_BITS_RUBIN   ((((long) 1) << (RUBIN_REG_SIZE - 1)) - 1)
 
 
 struct rubin_state {
-	unsigned long p;		
-	unsigned long q;	
+	unsigned long p;
+	unsigned long q;
 	unsigned long rec_q;
 	long bit_number;
 	struct pushpull pp;
diff -uNr mtd/fs/jffs2/comprtest.c mtd-whitespace/fs/jffs2/comprtest.c
--- mtd/fs/jffs2/comprtest.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/comprtest.c	2005-09-22 17:00:46.768073016 -0600
@@ -265,21 +265,22 @@
 static unsigned char comprbuf[TESTDATA_LEN];
 static unsigned char decomprbuf[TESTDATA_LEN];
 
-int jffs2_decompress(unsigned char comprtype, unsigned char *cdata_in, 
+int jffs2_decompress(unsigned char comprtype, unsigned char *cdata_in,
 		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
-unsigned char jffs2_compress(unsigned char *data_in, unsigned char *cpage_out, 
+
+unsigned char jffs2_compress(unsigned char *data_in, unsigned char *cpage_out,
 			     uint32_t *datalen, uint32_t *cdatalen);
 
-int init_module(void ) {
+int init_module(void) {
 	unsigned char comprtype;
 	uint32_t c, d;
 	int ret;
 
 	printk("Original data: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-	       testdata[0],testdata[1],testdata[2],testdata[3], 
-	       testdata[4],testdata[5],testdata[6],testdata[7], 
-	       testdata[8],testdata[9],testdata[10],testdata[11], 
-	       testdata[12],testdata[13],testdata[14],testdata[15]); 
+	       testdata[0], testdata[1], testdata[2], testdata[3],
+	       testdata[4], testdata[5], testdata[6], testdata[7],
+	       testdata[8], testdata[9], testdata[10], testdata[11],
+	       testdata[12], testdata[13], testdata[14], testdata[15]);
 	d = TESTDATA_LEN;
 	c = TESTDATA_LEN;
 	comprtype = jffs2_compress(testdata, comprbuf, &d, &c);
@@ -287,18 +288,18 @@
 	printk("jffs2_compress used compression type %d. Compressed size %d, uncompressed size %d\n",
 	       comprtype, c, d);
 	printk("Compressed data: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-	       comprbuf[0],comprbuf[1],comprbuf[2],comprbuf[3], 
-	       comprbuf[4],comprbuf[5],comprbuf[6],comprbuf[7], 
-	       comprbuf[8],comprbuf[9],comprbuf[10],comprbuf[11], 
-	       comprbuf[12],comprbuf[13],comprbuf[14],comprbuf[15]); 
+	       comprbuf[0], comprbuf[1], comprbuf[2], comprbuf[3],
+	       comprbuf[4], comprbuf[5], comprbuf[6], comprbuf[7],
+	       comprbuf[8], comprbuf[9], comprbuf[10], comprbuf[11],
+	       comprbuf[12], comprbuf[13], comprbuf[14], comprbuf[15]);
 
 	ret = jffs2_decompress(comprtype, comprbuf, decomprbuf, c, d);
 	printk("jffs2_decompress returned %d\n", ret);
 	printk("Decompressed data:  %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-	       decomprbuf[0],decomprbuf[1],decomprbuf[2],decomprbuf[3], 
-	       decomprbuf[4],decomprbuf[5],decomprbuf[6],decomprbuf[7], 
-	       decomprbuf[8],decomprbuf[9],decomprbuf[10],decomprbuf[11], 
-	       decomprbuf[12],decomprbuf[13],decomprbuf[14],decomprbuf[15]); 
+	       decomprbuf[0], decomprbuf[1], decomprbuf[2], decomprbuf[3],
+	       decomprbuf[4], decomprbuf[5], decomprbuf[6], decomprbuf[7],
+	       decomprbuf[8], decomprbuf[9], decomprbuf[10], decomprbuf[11],
+	       decomprbuf[12], decomprbuf[13], decomprbuf[14], decomprbuf[15]);
 	if (memcmp(decomprbuf, testdata, d))
 		printk("Compression and decompression corrupted data\n");
 	else
diff -uNr mtd/fs/jffs2/compr_zlib.c mtd-whitespace/fs/jffs2/compr_zlib.c
--- mtd/fs/jffs2/compr_zlib.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/compr_zlib.c	2005-09-22 16:56:42.600192176 -0600
@@ -24,11 +24,11 @@
 #include "nodelist.h"
 #include "compr.h"
 
-	/* Plan: call deflate() with avail_in == *sourcelen, 
-		avail_out = *dstlen - 12 and flush == Z_FINISH. 
-		If it doesn't manage to finish,	call it again with
+	/* Plan: call deflate() with avail_in == *sourcelen,
+		avail_out = *dstlen - 12 and flush == Z_FINISH.
+		If it doesn't manage to finish, call it again with
 		avail_in == 0 and avail_out set to the remaining 12
-		bytes for it to clean up. 
+		bytes for it to clean up.
 	   Q: Is 12 bytes sufficient?
 	*/
 #define STREAM_END_SPACE 12
@@ -66,7 +66,7 @@
 }
 #else
 #define alloc_workspaces() (0)
-#define free_workspaces() do { } while(0)
+#define free_workspaces() do { } while (0)
 #endif /* __KERNEL__ */
 
 static int jffs2_zlib_compress(unsigned char *data_in,
@@ -89,7 +89,7 @@
 
 	def_strm.next_in = data_in;
 	def_strm.total_in = 0;
-	
+
 	def_strm.next_out = cpage_out;
 	def_strm.total_out = 0;
 
@@ -99,7 +99,7 @@
 		D1(printk(KERN_DEBUG "calling deflate with avail_in %d, avail_out %d\n",
 			  def_strm.avail_in, def_strm.avail_out));
 		ret = zlib_deflate(&def_strm, Z_PARTIAL_FLUSH);
-		D1(printk(KERN_DEBUG "deflate returned with avail_in %d, avail_out %d, total_in %ld, total_out %ld\n", 
+		D1(printk(KERN_DEBUG "deflate returned with avail_in %d, avail_out %d, total_in %ld, total_out %ld\n",
 			  def_strm.avail_in, def_strm.avail_out, def_strm.total_in, def_strm.total_out));
 		if (ret != Z_OK) {
 			D1(printk(KERN_DEBUG "deflate in loop returned %d\n", ret));
@@ -150,7 +150,7 @@
 	inf_strm.next_in = data_in;
 	inf_strm.avail_in = srclen;
 	inf_strm.total_in = 0;
-	
+
 	inf_strm.next_out = cpage_out;
 	inf_strm.avail_out = destlen;
 	inf_strm.total_out = 0;
@@ -159,7 +159,7 @@
 	   we can tell zlib to skip the adler32 check. */
 	if (srclen > 2 && !(data_in[1] & PRESET_DICT) &&
 	    ((data_in[0] & 0x0f) == Z_DEFLATED) &&
-	    !(((data_in[0]<<8) + data_in[1]) % 31)) {
+	    !(((data_in[0] << 8) + data_in[1]) % 31)) {
 
 		D2(printk(KERN_DEBUG "inflate skipping adler32\n"));
 		wbits = -((data_in[0] >> 4) + 8);
@@ -177,46 +177,46 @@
 		return 1;
 	}
 
-	while((ret = zlib_inflate(&inf_strm, Z_FINISH)) == Z_OK)
+	while ((ret = zlib_inflate(&inf_strm, Z_FINISH)) == Z_OK)
 		;
 	if (ret != Z_STREAM_END) {
 		printk(KERN_NOTICE "inflate returned %d\n", ret);
 	}
 	zlib_inflateEnd(&inf_strm);
 	up(&inflate_sem);
-        return 0;
+	return 0;
 }
 
 static struct jffs2_compressor jffs2_zlib_comp = {
-    .priority = JFFS2_ZLIB_PRIORITY,
-    .name = "zlib",
-    .compr = JFFS2_COMPR_ZLIB,
-    .compress = &jffs2_zlib_compress,
-    .decompress = &jffs2_zlib_decompress,
+	.priority = JFFS2_ZLIB_PRIORITY,
+	.name = "zlib",
+	.compr = JFFS2_COMPR_ZLIB,
+	.compress = &jffs2_zlib_compress,
+	.decompress = &jffs2_zlib_decompress,
 #ifdef JFFS2_ZLIB_DISABLED
-    .disabled = 1,
+	.disabled = 1,
 #else
-    .disabled = 0,
+	.disabled = 0,
 #endif
 };
 
 int __init jffs2_zlib_init(void)
 {
-    int ret;
-
-    ret = alloc_workspaces();
-    if (ret)
-        return ret;
+	int ret;
 
-    ret = jffs2_register_compressor(&jffs2_zlib_comp);
-    if (ret)
-        free_workspaces();
+	ret = alloc_workspaces();
+	if (ret)
+		return ret;
+
+	ret = jffs2_register_compressor(&jffs2_zlib_comp);
+	if (ret)
+		free_workspaces();
 
-    return ret;
+	return ret;
 }
 
 void jffs2_zlib_exit(void)
 {
-    jffs2_unregister_compressor(&jffs2_zlib_comp);
-    free_workspaces();
+	jffs2_unregister_compressor(&jffs2_zlib_comp);
+	free_workspaces();
 }
diff -uNr mtd/fs/jffs2/crc32.h mtd-whitespace/fs/jffs2/crc32.h
--- mtd/fs/jffs2/crc32.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/crc32.h	2005-09-22 15:18:57.745785568 -0600
@@ -9,13 +9,13 @@
 
 /* Return a 32-bit CRC of the contents of the buffer. */
 
-static inline uint32_t 
+static inline uint32_t
 crc32(uint32_t val, const void *ss, int len)
 {
 	const unsigned char *s = ss;
-        while (--len >= 0)
-                val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
-        return val;
+	while (--len >= 0)
+		val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+	return val;
 }
 
 #endif
diff -uNr mtd/fs/jffs2/debug.c mtd-whitespace/fs/jffs2/debug.c
--- mtd/fs/jffs2/debug.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/debug.c	2005-09-22 16:56:49.511141552 -0600
@@ -67,7 +67,7 @@
 	__jffs2_dbg_fragtree_paranoia_check_nolock(f);
 	up(&f->sem);
 }
-	
+
 void
 __jffs2_dbg_fragtree_paranoia_check_nolock(struct jffs2_inode_info *f)
 {
@@ -95,14 +95,14 @@
 			if (frag->ofs & (PAGE_CACHE_SIZE-1) && frag_prev(frag)
 					&& frag_prev(frag)->size < PAGE_CACHE_SIZE && frag_prev(frag)->node) {
 				JFFS2_ERROR("REF_PRISTINE node at 0x%08x had a previous non-hole frag in the same page. Tell dwmw2.\n",
-					ref_offset(fn->raw));
+						ref_offset(fn->raw));
 				bitched = 1;
 			}
 
 			if ((frag->ofs+frag->size) & (PAGE_CACHE_SIZE-1) && frag_next(frag)
 					&& frag_next(frag)->size < PAGE_CACHE_SIZE && frag_next(frag)->node) {
 				JFFS2_ERROR("REF_PRISTINE node at 0x%08x (%08x-%08x) had a following non-hole frag in the same page. Tell dwmw2.\n",
-				       ref_offset(fn->raw), frag->ofs, frag->ofs+frag->size);
+						ref_offset(fn->raw), frag->ofs, frag->ofs+frag->size);
 				bitched = 1;
 			}
 		}
@@ -165,7 +165,7 @@
 	__jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
 	spin_unlock(&c->erase_completion_lock);
 }
-	
+
 void
 __jffs2_dbg_acct_paranoia_check_nolock(struct jffs2_sb_info *c,
 				       struct jffs2_eraseblock *jeb)
@@ -183,8 +183,8 @@
 			JFFS2_ERROR("node_ref %#08x shouldn't be in block at %#08x.\n",
 				ref_offset(ref2), jeb->offset);
 			goto error;
-
 		}
+
 		if (ref_flags(ref2) == REF_UNCHECKED)
 			my_unchecked_size += totlen;
 		else if (!ref_obsolete(ref2))
@@ -237,7 +237,7 @@
 	__jffs2_dbg_dump_jeb_nolock(jeb);
 	__jffs2_dbg_dump_block_lists_nolock(c);
 	BUG();
-	
+
 }
 #endif /* JFFS2_DBG_PARANOIA_CHECKS */
 
@@ -321,7 +321,7 @@
 __jffs2_dbg_dump_block_lists_nolock(struct jffs2_sb_info *c)
 {
 	printk(JFFS2_DBG_MSG_PREFIX " dump JFFS2 blocks lists:\n");
-	
+
 	printk(JFFS2_DBG "flash_size: %#08x\n",		c->flash_size);
 	printk(JFFS2_DBG "used_size: %#08x\n",		c->used_size);
 	printk(JFFS2_DBG "dirty_size: %#08x\n",		c->dirty_size);
@@ -332,7 +332,7 @@
 	printk(JFFS2_DBG "bad_size: %#08x\n",		c->bad_size);
 	printk(JFFS2_DBG "sector_size: %#08x\n",	c->sector_size);
 	printk(JFFS2_DBG "jffs2_reserved_blocks size: %#08x\n",
-				c->sector_size * c->resv_blocks_write);
+			c->sector_size * c->resv_blocks_write);
 
 	if (c->nextblock)
 		printk(JFFS2_DBG "nextblock: %#08x (used %#08x, dirty %#08x, wasted %#08x, unchecked %#08x, free %#08x)\n",
@@ -546,7 +546,7 @@
 	int buggy = 0;
 
 	printk(JFFS2_DBG_MSG_PREFIX " dump fragtree of ino #%u\n", f->inocache->ino);
-	while(this) {
+	while (this) {
 		if (this->node)
 			printk(JFFS2_DBG "frag %#04x-%#04x: %#08x(%d) on flash (*%p), left (%p), right (%p), parent (%p)\n",
 				this->ofs, this->ofs+this->size, ref_offset(this->node->raw),
@@ -577,15 +577,15 @@
 {
 	int skip;
 	int i;
-	
+
 	printk(JFFS2_DBG_MSG_PREFIX " dump from offset %#08x to offset %#08x (%x bytes).\n",
 		offs, offs + len, len);
 	i = skip = offs % JFFS2_BUFDUMP_BYTES_PER_LINE;
 	offs = offs & ~(JFFS2_BUFDUMP_BYTES_PER_LINE - 1);
-	
+
 	if (skip != 0)
 		printk(JFFS2_DBG "%#08x: ", offs);
-	
+
 	while (skip--)
 		printk("   ");
 
@@ -598,7 +598,7 @@
 		}
 
 		printk("%02x ", buf[i]);
-		
+
 		i += 1;
 	}
 
@@ -616,7 +616,7 @@
 	size_t retlen;
 	uint32_t crc;
 	int ret;
-	
+
 	printk(JFFS2_DBG_MSG_PREFIX " dump node at offset %#08x.\n", ofs);
 
 	ret = jffs2_flash_read(c, ofs, len, &retlen, (unsigned char *)&node);
@@ -630,13 +630,13 @@
 	printk(JFFS2_DBG "nodetype:\t%#04x\n", je16_to_cpu(node.u.nodetype));
 	printk(JFFS2_DBG "totlen:\t%#08x\n", je32_to_cpu(node.u.totlen));
 	printk(JFFS2_DBG "hdr_crc:\t%#08x\n", je32_to_cpu(node.u.hdr_crc));
-	
+
 	crc = crc32(0, &node.u, sizeof(node.u) - 4);
 	if (crc != je32_to_cpu(node.u.hdr_crc)) {
 		JFFS2_ERROR("wrong common header CRC.\n");
 		return;
 	}
-	
+
 	if (je16_to_cpu(node.u.magic) != JFFS2_MAGIC_BITMASK &&
 		je16_to_cpu(node.u.magic) != JFFS2_OLD_MAGIC_BITMASK)
 	{
@@ -668,7 +668,7 @@
 		printk(JFFS2_DBG "data_crc:\t%#08x\n", je32_to_cpu(node.i.data_crc));
 		printk(JFFS2_DBG "node_crc:\t%#08x\n", je32_to_cpu(node.i.node_crc));
 
-		crc = crc32(0, &node.i, sizeof(node.i) - 8); 
+		crc = crc32(0, &node.i, sizeof(node.i) - 8);
 		if (crc != je32_to_cpu(node.i.node_crc)) {
 			JFFS2_ERROR("wrong node header CRC.\n");
 			return;
@@ -686,11 +686,11 @@
 		printk(JFFS2_DBG "type:\t%#02x\n", node.d.type);
 		printk(JFFS2_DBG "node_crc:\t%#08x\n", je32_to_cpu(node.d.node_crc));
 		printk(JFFS2_DBG "name_crc:\t%#08x\n", je32_to_cpu(node.d.name_crc));
-		
+
 		node.d.name[node.d.nsize] = '\0';
 		printk(JFFS2_DBG "name:\t\"%s\"\n", node.d.name);
 
-		crc = crc32(0, &node.d, sizeof(node.d) - 8); 
+		crc = crc32(0, &node.d, sizeof(node.d) - 8);
 		if (crc != je32_to_cpu(node.d.node_crc)) {
 			JFFS2_ERROR("wrong node header CRC.\n");
 			return;
diff -uNr mtd/fs/jffs2/debug.h mtd-whitespace/fs/jffs2/debug.h
--- mtd/fs/jffs2/debug.h	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/debug.h	2005-09-22 16:56:54.845330632 -0600
@@ -24,7 +24,7 @@
 #define JFFS2_DBG_PARANOIA_CHECKS
 #define JFFS2_DBG_DUMPS
 
-/* 
+/*
  * By defining/undefining the below macros one may select debugging messages
  * fro specific JFFS2 subsystems.
  */
@@ -45,7 +45,7 @@
 /* Sanity checks are supposed to be light-weight and enabled by default */
 #define JFFS2_DBG_SANITY_CHECKS
 
-/* 
+/*
  * Dx() are mainly used for debugging messages, they must go away and be
  * superseded by nicer dbg_xxx() macros...
  */
@@ -83,30 +83,30 @@
 		printk(JFFS2_ERR_MSG_PREFIX				\
 			" (%d) %s: " fmt, current->pid,			\
 			__FUNCTION__, ##__VA_ARGS__);			\
-	} while(0)
+	} while (0)
 
 #define JFFS2_WARNING(fmt, ...)						\
 	do {								\
 		printk(JFFS2_WARN_MSG_PREFIX				\
 			" (%d) %s: " fmt, current->pid,			\
 			__FUNCTION__, ##__VA_ARGS__);			\
-	} while(0)
-			
+	} while (0)
+
 #define JFFS2_NOTICE(fmt, ...)						\
 	do {								\
 		printk(JFFS2_NOTICE_MSG_PREFIX				\
 			" (%d) %s: " fmt, current->pid,			\
 			__FUNCTION__, ##__VA_ARGS__);			\
-	} while(0)
+	} while (0)
 
 #define JFFS2_DEBUG(fmt, ...)						\
 	do {								\
 		printk(JFFS2_DBG_MSG_PREFIX				\
 			" (%d) %s: " fmt, current->pid,			\
 			__FUNCTION__, ##__VA_ARGS__);			\
-	} while(0)
+	} while (0)
 
-/* 
+/*
  * We split our debugging messages on several parts, depending on the JFFS2
  * subsystem the message belongs to.
  */
@@ -187,7 +187,7 @@
 __jffs2_dbg_fragtree_paranoia_check_nolock(struct jffs2_inode_info *f);
 void
 __jffs2_dbg_acct_paranoia_check(struct jffs2_sb_info *c,
-			   	struct jffs2_eraseblock *jeb);
+				struct jffs2_eraseblock *jeb);
 void
 __jffs2_dbg_acct_paranoia_check_nolock(struct jffs2_sb_info *c,
 				       struct jffs2_eraseblock *jeb);
@@ -206,7 +206,7 @@
 __jffs2_dbg_dump_block_lists_nolock(struct jffs2_sb_info *c);
 void
 __jffs2_dbg_dump_node_refs(struct jffs2_sb_info *c,
-		 	   struct jffs2_eraseblock *jeb);
+			   struct jffs2_eraseblock *jeb);
 void
 __jffs2_dbg_dump_node_refs_nolock(struct jffs2_sb_info *c,
 				  struct jffs2_eraseblock *jeb);
@@ -225,9 +225,9 @@
 #define jffs2_dbg_fragtree_paranoia_check_nolock(f)		\
 	__jffs2_dbg_fragtree_paranoia_check_nolock(f)
 #define jffs2_dbg_acct_paranoia_check(c, jeb)			\
-	__jffs2_dbg_acct_paranoia_check(c,jeb)
+	__jffs2_dbg_acct_paranoia_check(c, jeb)
 #define jffs2_dbg_acct_paranoia_check_nolock(c, jeb)		\
-	__jffs2_dbg_acct_paranoia_check_nolock(c,jeb)
+	__jffs2_dbg_acct_paranoia_check_nolock(c, jeb)
 #define jffs2_dbg_prewrite_paranoia_check(c, ofs, len)		\
 	__jffs2_dbg_prewrite_paranoia_check(c, ofs, len)
 #else
diff -uNr mtd/fs/jffs2/dir.c mtd-whitespace/fs/jffs2/dir.c
--- mtd/fs/jffs2/dir.c	2005-09-07 13:04:12.000000000 -0600
+++ mtd-whitespace/fs/jffs2/dir.c	2005-09-22 16:48:37.533933456 -0600
@@ -24,18 +24,18 @@
 
 static int jffs2_readdir (struct file *, void *, filldir_t);
 
-static int jffs2_create (struct inode *,struct dentry *,int,
+static int jffs2_create (struct inode *, struct dentry *, int,
 			 struct nameidata *);
-static struct dentry *jffs2_lookup (struct inode *,struct dentry *,
+static struct dentry *jffs2_lookup (struct inode *, struct dentry *,
 				    struct nameidata *);
-static int jffs2_link (struct dentry *,struct inode *,struct dentry *);
-static int jffs2_unlink (struct inode *,struct dentry *);
-static int jffs2_symlink (struct inode *,struct dentry *,const char *);
-static int jffs2_mkdir (struct inode *,struct dentry *,int);
-static int jffs2_rmdir (struct inode *,struct dentry *);
-static int jffs2_mknod (struct inode *,struct dentry *,int,dev_t);
+static int jffs2_link (struct dentry *, struct inode *, struct dentry *);
+static int jffs2_unlink (struct inode *, struct dentry *);
+static int jffs2_symlink (struct inode *, struct dentry *, const char *);
+static int jffs2_mkdir (struct inode *, struct dentry *, int);
+static int jffs2_rmdir (struct inode *, struct dentry *);
+static int jffs2_mknod (struct inode *, struct dentry *, int, dev_t);
 static int jffs2_rename (struct inode *, struct dentry *,
-                        struct inode *, struct dentry *);
+			 struct inode *, struct dentry *);
 
 struct file_operations jffs2_dir_operations =
 {
@@ -45,7 +45,6 @@
 	.fsync =	jffs2_fsync
 };
 
-
 struct inode_operations jffs2_dir_inode_operations =
 {
 	.create =	jffs2_create,
@@ -60,11 +59,8 @@
 	.setattr =	jffs2_setattr,
 };
 
-/***********************************************************************/
-
-
 /* We keep the dirent list sorted in increasing order of name hash,
-   and we use the same hash function as the dentries. Makes this 
+   and we use the same hash function as the dentries. Makes this
    nice and simple
 */
 static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
@@ -85,7 +81,7 @@
 
 	/* NB: The 2.2 backport will need to explicitly check for '.' and '..' here */
 	for (fd_list = dir_f->dents; fd_list && fd_list->nhash <= target->d_name.hash; fd_list = fd_list->next) {
-		if (fd_list->nhash == target->d_name.hash && 
+		if (fd_list->nhash == target->d_name.hash &&
 		    (!fd || fd_list->version > fd->version) &&
 		    strlen(fd_list->name) == target->d_name.len &&
 		    !strncmp(fd_list->name, target->d_name.name, target->d_name.len)) {
@@ -108,9 +104,6 @@
 	return NULL;
 }
 
-/***********************************************************************/
-
-
 static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 {
 	struct jffs2_inode_info *f;
@@ -140,14 +133,14 @@
 		offset++;
 	}
 
-	curofs=1;
+	curofs = 1;
 	down(&f->sem);
 	for (fd = f->dents; fd; fd = fd->next) {
 
 		curofs++;
 		/* First loop: curofs = 2; offset = 2 */
 		if (curofs < offset) {
-			D2(printk(KERN_DEBUG "Skipping dirent: \"%s\", ino #%u, type %d, because curofs %ld < offset %ld\n", 
+			D2(printk(KERN_DEBUG "Skipping dirent: \"%s\", ino #%u, type %d, because curofs %ld < offset %ld\n",
 				  fd->name, fd->ino, fd->type, curofs, offset));
 			continue;
 		}
@@ -167,9 +160,6 @@
 	return 0;
 }
 
-/***********************************************************************/
-
-
 static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 			struct nameidata *nd)
 {
@@ -182,7 +172,7 @@
 	ri = jffs2_alloc_raw_inode();
 	if (!ri)
 		return -ENOMEM;
-	
+
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
 	D1(printk(KERN_DEBUG "jffs2_create()\n"));
@@ -203,7 +193,7 @@
 	f = JFFS2_INODE_INFO(inode);
 	dir_f = JFFS2_INODE_INFO(dir_i);
 
-	ret = jffs2_do_create(c, dir_f, f, ri, 
+	ret = jffs2_do_create(c, dir_f, f, ri,
 			      dentry->d_name.name, dentry->d_name.len);
 
 	if (ret) {
@@ -223,9 +213,6 @@
 	return 0;
 }
 
-/***********************************************************************/
-
-
 static int jffs2_unlink(struct inode *dir_i, struct dentry *dentry)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(dir_i->i_sb);
@@ -234,7 +221,7 @@
 	int ret;
 	uint32_t now = get_seconds();
 
-	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name, 
+	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name,
 			      dentry->d_name.len, dead_f, now);
 	if (dead_f->inocache)
 		dentry->d_inode->i_nlink = dead_f->inocache->nlink;
@@ -242,8 +229,6 @@
 		dir_i->i_mtime = dir_i->i_ctime = ITIME(now);
 	return ret;
 }
-/***********************************************************************/
-
 
 static int jffs2_link (struct dentry *old_dentry, struct inode *dir_i, struct dentry *dentry)
 {
@@ -263,7 +248,8 @@
 
 	/* XXX: This is ugly */
 	type = (old_dentry->d_inode->i_mode & S_IFMT) >> 12;
-	if (!type) type = DT_REG;
+	if (!type)
+		type = DT_REG;
 
 	now = get_seconds();
 	ret = jffs2_do_link(c, dir_f, f->inocache->ino, type, dentry->d_name.name, dentry->d_name.len, now);
@@ -279,8 +265,6 @@
 	return ret;
 }
 
-/***********************************************************************/
-
 static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char *target)
 {
 	struct jffs2_inode_info *f, *dir_f;
@@ -303,11 +287,11 @@
 
 	if (!ri)
 		return -ENOMEM;
-	
+
 	c = JFFS2_SB_INFO(dir_i->i_sb);
-	
-	/* Try to reserve enough space for both node and dirent. 
-	 * Just the node will do for now, though 
+
+	/* Try to reserve enough space for both node and dirent.
+	 * Just the node will do for now, though
 	 */
 	namelen = dentry->d_name.len;
 	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &phys_ofs, &alloclen,
@@ -338,7 +322,7 @@
 	ri->compr = JFFS2_COMPR_NONE;
 	ri->data_crc = cpu_to_je32(crc32(0, target, targetlen));
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
-	
+
 	fn = jffs2_write_dnode(c, f, ri, target, targetlen, phys_ofs, ALLOC_NORMAL);
 
 	jffs2_free_raw_inode(ri);
@@ -364,7 +348,7 @@
 	memcpy(f->target, target, targetlen + 1);
 	D1(printk(KERN_DEBUG "jffs2_symlink: symlink's target '%s' cached\n", (char *)f->target));
 
-	/* No data here. Only a metadata node, which will be 
+	/* No data here. Only a metadata node, which will be
 	   obsoleted by the first data write
 	*/
 	f->metadata = fn;
@@ -407,7 +391,7 @@
 	fd = jffs2_write_dirent(c, dir_f, rd, dentry->d_name.name, namelen, phys_ofs, ALLOC_NORMAL);
 
 	if (IS_ERR(fd)) {
-		/* dirent failed to write. Delete the inode normally 
+		/* dirent failed to write. Delete the inode normally
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_dirent(rd);
@@ -431,7 +415,6 @@
 	return 0;
 }
 
-
 static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 {
 	struct jffs2_inode_info *f, *dir_f;
@@ -450,11 +433,11 @@
 	ri = jffs2_alloc_raw_inode();
 	if (!ri)
 		return -ENOMEM;
-	
+
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
-	/* Try to reserve enough space for both node and dirent. 
-	 * Just the node will do for now, though 
+	/* Try to reserve enough space for both node and dirent.
+	 * Just the node will do for now, though
 	 */
 	namelen = dentry->d_name.len;
 	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL,
@@ -482,7 +465,7 @@
 
 	ri->data_crc = cpu_to_je32(0);
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
-	
+
 	fn = jffs2_write_dnode(c, f, ri, NULL, 0, phys_ofs, ALLOC_NORMAL);
 
 	jffs2_free_raw_inode(ri);
@@ -494,7 +477,7 @@
 		jffs2_clear_inode(inode);
 		return PTR_ERR(fn);
 	}
-	/* No data here. Only a metadata node, which will be 
+	/* No data here. Only a metadata node, which will be
 	   obsoleted by the first data write
 	*/
 	f->metadata = fn;
@@ -508,7 +491,7 @@
 		jffs2_clear_inode(inode);
 		return ret;
 	}
-	
+
 	rd = jffs2_alloc_raw_dirent();
 	if (!rd) {
 		/* Argh. Now we treat it like a normal delete */
@@ -535,9 +518,9 @@
 	rd->name_crc = cpu_to_je32(crc32(0, dentry->d_name.name, namelen));
 
 	fd = jffs2_write_dirent(c, dir_f, rd, dentry->d_name.name, namelen, phys_ofs, ALLOC_NORMAL);
-	
+
 	if (IS_ERR(fd)) {
-		/* dirent failed to write. Delete the inode normally 
+		/* dirent failed to write. Delete the inode normally
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_dirent(rd);
@@ -599,16 +582,16 @@
 	ri = jffs2_alloc_raw_inode();
 	if (!ri)
 		return -ENOMEM;
-	
+
 	c = JFFS2_SB_INFO(dir_i->i_sb);
-	
+
 	if (S_ISBLK(mode) || S_ISCHR(mode)) {
 		dev = cpu_to_je16(old_encode_dev(rdev));
 		devlen = sizeof(dev);
 	}
-	
-	/* Try to reserve enough space for both node and dirent. 
-	 * Just the node will do for now, though 
+
+	/* Try to reserve enough space for both node and dirent.
+	 * Just the node will do for now, though
 	 */
 	namelen = dentry->d_name.len;
 	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen,
@@ -638,7 +621,7 @@
 	ri->compr = JFFS2_COMPR_NONE;
 	ri->data_crc = cpu_to_je32(crc32(0, &dev, devlen));
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
-	
+
 	fn = jffs2_write_dnode(c, f, ri, (char *)&dev, devlen, phys_ofs, ALLOC_NORMAL);
 
 	jffs2_free_raw_inode(ri);
@@ -650,7 +633,7 @@
 		jffs2_clear_inode(inode);
 		return PTR_ERR(fn);
 	}
-	/* No data here. Only a metadata node, which will be 
+	/* No data here. Only a metadata node, which will be
 	   obsoleted by the first data write
 	*/
 	f->metadata = fn;
@@ -694,9 +677,9 @@
 	rd->name_crc = cpu_to_je32(crc32(0, dentry->d_name.name, namelen));
 
 	fd = jffs2_write_dirent(c, dir_f, rd, dentry->d_name.name, namelen, phys_ofs, ALLOC_NORMAL);
-	
+
 	if (IS_ERR(fd)) {
-		/* dirent failed to write. Delete the inode normally 
+		/* dirent failed to write. Delete the inode normally
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_dirent(rd);
@@ -730,7 +713,7 @@
 	uint8_t type;
 	uint32_t now;
 
-	/* The VFS will check for us and prevent trying to rename a 
+	/* The VFS will check for us and prevent trying to rename a
 	 * file over a directory and vice versa, but if it's a directory,
 	 * the VFS can't check whether the victim is empty. The filesystem
 	 * needs to do that for itself.
@@ -752,18 +735,19 @@
 	}
 
 	/* XXX: We probably ought to alloc enough space for
-	   both nodes at the same time. Writing the new link, 
+	   both nodes at the same time. Writing the new link,
 	   then getting -ENOSPC, is quite bad :)
 	*/
 
 	/* Make a hard link */
-	
+
 	/* XXX: This is ugly */
 	type = (old_dentry->d_inode->i_mode & S_IFMT) >> 12;
-	if (!type) type = DT_REG;
+	if (!type)
+		type = DT_REG;
 
 	now = get_seconds();
-	ret = jffs2_do_link(c, JFFS2_INODE_INFO(new_dir_i), 
+	ret = jffs2_do_link(c, JFFS2_INODE_INFO(new_dir_i),
 			    old_dentry->d_inode->i_ino, type,
 			    new_dentry->d_name.name, new_dentry->d_name.len, now);
 
@@ -782,13 +766,13 @@
 		}
 	}
 
-	/* If it was a directory we moved, and there was no victim, 
+	/* If it was a directory we moved, and there was no victim,
 	   increase i_nlink on its new parent */
 	if (S_ISDIR(old_dentry->d_inode->i_mode) && !victim_f)
 		new_dir_i->i_nlink++;
 
 	/* Unlink the original */
-	ret = jffs2_do_unlink(c, JFFS2_INODE_INFO(old_dir_i), 
+	ret = jffs2_do_unlink(c, JFFS2_INODE_INFO(old_dir_i),
 			      old_dentry->d_name.name, old_dentry->d_name.len, NULL, now);
 
 	/* We don't touch inode->i_nlink */
diff -uNr mtd/fs/jffs2/ecos/cdl/jffs2.cdl mtd-whitespace/fs/jffs2/ecos/cdl/jffs2.cdl
--- mtd/fs/jffs2/ecos/cdl/jffs2.cdl	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/cdl/jffs2.cdl	2005-09-22 13:39:06.375612280 -0600
@@ -70,7 +70,7 @@
     requires       CYGPKG_LINUX_COMPAT
     requires       CYGPKG_CRC
 
-    implements     CYGINT_IO_FILEIO_FS      
+    implements     CYGINT_IO_FILEIO_FS
 
     compile        -library=libextras.a fs-ecos.c
     compile        build.c scan.c malloc-ecos.c nodelist.c nodemgmt.c readinode.c dir-ecos.c read.c compr.c debug.c
@@ -84,11 +84,11 @@
 	compile         gcthread.c
  	requires        CYGPKG_KERNEL
         description     "
-            Enable background garbage collection thread, for making 
-	    free space ahead of time. Leave this off till it's been 
+            Enable background garbage collection thread, for making
+	    free space ahead of time. Leave this off till it's been
 	   implemented. And don't implement it till icache locking has
 	 been made thread-safe.
-	"	
+	"
 
 
         cdl_option CYGNUM_JFFS2_GC_THREAD_PRIORITY {
@@ -108,7 +108,7 @@
                 This option sets the size of the stack used
                 for jffs2 garbage collect thread"
         }
-        
+
         cdl_option CYGNUM_JFFS2_GS_THREAD_TICKS {
             display       "ticks between each garbage collect"
             flavor        data
@@ -117,7 +117,7 @@
                 This option sets how many clock ticks there will be between
                 each garbage collect operation triggered by the background
                 thread"
-        }    
+        }
     }
 
     cdl_option CYGOPT_FS_JFFS2_WRITE {
@@ -182,7 +182,7 @@
             compile         compr_rtime.c
             default_value   1
             description     "
-                Use the rtime algorithm for compression of data. This 
+                Use the rtime algorithm for compression of data. This
                 simple algorithm often manages to squeeze and extra few
                 bytes from data already compressed with gzip."
         }
@@ -194,7 +194,7 @@
             requires        CYGOPT_FS_JFFS2_COMPRESS
             compile         compr_rubin.c
             description     "
-                Use the rubin algorithm for compression of data. This 
+                Use the rubin algorithm for compression of data. This
                 simple algorithm is faster than zlib but not quite as
                 effective."
         }
@@ -205,10 +205,10 @@
             legal_values    { "NONE" "PRIORITY" "SIZE" }
             define          CONFIG_JFFS2_CMODE
             description     "
-                You can set here the default compression mode of JFFS2 from 
+                You can set here the default compression mode of JFFS2 from
                 the avaiable compression modes. NONE causes no compression to
                 be performed. PRIORITY tries the compressors in a predefined
-                order and chooses the first successfull one. SIZE tries all 
+                order and chooses the first successfull one. SIZE tries all
                 compressors and chooses the one which has the smallest result"
         }
     }
@@ -262,10 +262,10 @@
 	no_define
 	calculated { "tests/jffs2_1 tests/jffs2_2 tests/jffs2_3" }
             description   "
-                This option specifies the set of tests for the JFFS2    
+                This option specifies the set of tests for the JFFS2
                 FS package."
         }
-    
+
 }
 
 # End of jffs2.cdl
diff -uNr mtd/fs/jffs2/ecos/ChangeLog mtd-whitespace/fs/jffs2/ecos/ChangeLog
--- mtd/fs/jffs2/ecos/ChangeLog	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/ChangeLog	2005-09-22 13:39:06.302623376 -0600
@@ -13,23 +13,23 @@
 
 2005-02-08  Estelle HAMMACHE <estelle.hammache@st.com>
 
-	* src/fs-ecos.c 
+	* src/fs-ecos.c
 	* src/dir-ecos.c: Fixed the sign of the return codes in various
 	places. iput the inode only after we have finished with
 	it etc.
-	
+
 2005-01-22  Andrew Lunn  <andrew.lunn@ascom.ch>
 
 	* Merge from public MTD.
-	
+
 2004-11-14  Per Hedblom  <perhedblom@abem.se>
-            Andrew Lunn  <andrew.lunn@ascom.ch> 
-	
+            Andrew Lunn  <andrew.lunn@ascom.ch>
+
  	* src/os-ecos.h: Added gc tread support
  	* src/fs-ecos.c: Removed some includes
  	* cdl/jffs2.cdl: Added gc thread support
 	* tests/jffs2_3.c: New text to exersise the garbage collect code.
-	
+
 2004-12-13  John Dallaway  <jld@ecoscentric.com>
 
 	* tests/fileio1.c: Rename to jffs2_1.c. eCos test names should be
@@ -46,12 +46,12 @@
 2004-11-11  Andrew Lunn <andrew.lunn@ascom.ch>
 
 	* Merge from public MTD.
-	
+
 2004-11-11  Andrew Lunn <andrew.lunn@ascom.ch>
 
-	* src/build.c: Removed Oyvind Harboe's patch from 2004-04-19 
+	* src/build.c: Removed Oyvind Harboe's patch from 2004-04-19
 	since it was rejected upstream.
-	
+
 2004-10-20  Per Hedblom  <perhedblom@abem.se>
 
 	* src/fs-ecos.c (jffs2_open): Call iput on dir node if
@@ -69,7 +69,7 @@
 
 	* cdl/jffs2.cdl: Fixed outdated definitions for compression options.
 	* src/fs-ecos.c: Added missing calls for jffs2_compressors_init()
-        and jffs2_compressors_exit() 
+        and jffs2_compressors_exit()
 
 2004-08-13  Andrew Lunn  <andrew.lunn@ascom.ch>
 
@@ -79,12 +79,12 @@
 	    Gary Thomas <gary@mlbassoc.com>
 
 	* Merge from public MTD.
-	
+
 2004-04-19  Oyvind Harboe <oyvind.harboe@zylin.com>
-	
+
 	* src/build.c: JFFS2 can now be used as a write-once, read many mode
 	for really small flash disks, e.g. configuration parameters.
-	
+
 2004-04-21  Gary Thomas  <gary@mlbassoc.com>
 
 	* src/fs-ecos.c: Merge from public MTD - verify file position
@@ -96,29 +96,29 @@
 	* src/fs-ecos.c (jffs2_fo_lseek): Allow seeking past EOF.
 	* tests/fseek1.c (main): fseek and simple test of a hole in a file
 	* cdl/jffs2.cdl: Added new test program fseek1.
-	
+
 2004-03-31  David Woodhouse  <dwmw2@infradead.org>
 
 	* src/fs-ecos.c (jffs2_fo_write): Set ri.isize so that non-append
 	writes don't truncate the file.
-	
+
 2004-03-03  Thomas Koeller  <thomas.koeller@baslerweb.com>
 
-        * src/fs-ecos.c: 
+        * src/fs-ecos.c:
 	Make JFFS2 honor O_TRUNC flag (again) when opening files with read
 	Access.
 
 2004-03-17  Oyvind Harboe <oyvind.harboe@zylin.com>
 
-	* src/fs-ecos.c: 
+	* src/fs-ecos.c:
 	With CYGOPT_FS_JFFS2_WRITE=1, file creation failed. The problem
 	was introduced in fs-ecos.c 1.20
-	
+
 2004-03-11  Oyvind Harboe <oyvind.harboe@zylin.com>
-	
+
 	* src/fs-ecos.c:
 	  Fixed umount memory leak. root->jffs2_i.dents where not freed.
-	
+
 2004-02-20  Vincent Catros  <Vincent.Catros@elios-informatique.fr>
 
 	* src/fs-ecos.c :
@@ -139,13 +139,13 @@
 2004-02-17  David Woodhouse  <dwmw2@infradead.org>
 
 	* src/fs-ecos.c:
-	Don't re-initialise the already-locked f->sem. It makes eCos unhappy. 
+	Don't re-initialise the already-locked f->sem. It makes eCos unhappy.
 
 2004-01-27  David Woodhouse  <dwmw2@infradead.org>
 
-	* src/write.c: 
-	Fix bug noted by Howard Gray; dirents belong to, and should dirty, 
-	the _parent_inode, not the child (which may be zero in the case 
+	* src/write.c:
+	Fix bug noted by Howard Gray; dirents belong to, and should dirty,
+	the _parent_inode, not the child (which may be zero in the case
 	of an unlink).
 
 2004-01-09  Thomas Koeller  <thomas.koeller@baslerweb.com>
@@ -156,7 +156,7 @@
 
 	* cdl/jffs2.cdl: Re-added CYGPKG_FS_JFFS2_CFLAGS_REMOVE that had been
 	removed by previous change.
-	
+
 2003-11-26  David Woodhouse  <dwmw2@infradead.org>
 
 	JFFS2 cleanup and import of newer code. Remove last vestiges of
@@ -193,15 +193,15 @@
 
         * Rearrangement of the compression code into a cleaner API
 	which can be disabled under control from CDL.
-	
+
 2003-10-14  Thomas Koeller  <thomas.koeller@baslerweb.com>
 
         * src/os-ecos.h: Made definition of CONFIG_JFFS2_FS_DEBUG
         conditional, so it can be overwritten by a -D compiler
         option.
-                                                                               
+
 2003-09-23  Thomas Koeller  <thomas.koeller@baslerweb.com>
-                                                                               
+
         * src/fs-ecos.c: Another umount() fix.
 
 2003-09-23  Andrew Lunn  <andrew.lunn@ascom.ch>
@@ -211,11 +211,11 @@
 2003-09-23  Thomas Koeller  <thomas.koeller@baslerweb.com>
 
         * src/fs-ecos.c: Fixed broken hard link creation.
-        
+
 2003-09-23  Andrew Lunn     <andrew.lunn@ascom.ch>
 
         * src/fs-ecos.c: Minor optimization of previous patch.
-        
+
 2003-09-21  Thomas Koeller  <thomas.koeller@baslerweb.com>
             Andrew Lunn     <andrew.lunn@ascom.ch>
 
@@ -236,13 +236,13 @@
         import.
 
 2003-07-27  Michael Checky  <Michael_Checky@ThermoKing.com>
- 
+
         * src/fs-ecos.c: Changed the return error code to be negative as
         expected by jffs2_flash_read() and jffs2_flash_write().
-        
+
 2003-04-23  Bob Koninckx  <bob.koninckx@mech.kuleuven.ac.be>
 
-        * src/fs-ecos.c: mtab -> cyg_mtab. Ditto cyg_mtab_end. 
+        * src/fs-ecos.c: mtab -> cyg_mtab. Ditto cyg_mtab_end.
 
 2003-03-25  Thomas Koeller  <thomas.koeller@baslerweb.com>
 
@@ -258,41 +258,41 @@
         * cdl/jffs2.cdl: Remove unused flash geometry CDL options.
 
 2003-02-04  Gary Thomas  <gary@mlbassoc.com> on behalf of
-2003-02-04  David Woodhouse <dwmw2@cambridge.redhat.com>        
+2003-02-04  David Woodhouse <dwmw2@cambridge.redhat.com>
 
-        * src/write.c: 
-        * src/scan.c: 
-        * src/readinode.c: 
-        * src/read.c: 
-        * src/pushpull.h: 
-        * src/os-ecos.h: 
-        * src/nodemgmt.c: 
-        * src/nodelist.h: 
-        * src/nodelist.c: 
-        * src/malloc-ecos.c: 
-        * src/jffs2port.h: 
-        * src/gc.c: 
-        * src/file-ecos.c: 
-        * src/erase.c: 
-        * src/dir-ecos.c: 
-        * src/compr_zlib.c: 
-        * src/compr_rubin.c: 
-        * src/compr_rtime.c: 
-        * src/compr.c: 
-        * src/build.c: 
+        * src/write.c:
+        * src/scan.c:
+        * src/readinode.c:
+        * src/read.c:
+        * src/pushpull.h:
+        * src/os-ecos.h:
+        * src/nodemgmt.c:
+        * src/nodelist.h:
+        * src/nodelist.c:
+        * src/malloc-ecos.c:
+        * src/jffs2port.h:
+        * src/gc.c:
+        * src/file-ecos.c:
+        * src/erase.c:
+        * src/dir-ecos.c:
+        * src/compr_zlib.c:
+        * src/compr_rubin.c:
+        * src/compr_rtime.c:
+        * src/compr.c:
+        * src/build.c:
         * cdl/jffs2.cdl: Update to latest public JFFS2 codebase.
 
-        * src/list.h: 
-        * src/jffs2_fs_sb.h: 
-        * src/jffs2_fs_i.h: 
-        * src/jffs2.h: 
-        * src/jffs2.c: 
-        * src/crc32.h: 
+        * src/list.h:
+        * src/jffs2_fs_sb.h:
+        * src/jffs2_fs_i.h:
+        * src/jffs2.h:
+        * src/jffs2.c:
+        * src/crc32.h:
         * src/background.c: Removed/renamed file(s).
 
-        * src/fs-ecos.c: 
-        * include/linux/jffs2_fs_sb.h: 
-        * include/linux/jffs2_fs_i.h: 
+        * src/fs-ecos.c:
+        * include/linux/jffs2_fs_sb.h:
+        * include/linux/jffs2_fs_i.h:
         * include/linux/jffs2.h: New file(s).
 
 2002-12-06  Andrew Lunn  <andrew.lunn@ascom.ch>
@@ -340,13 +340,13 @@
         * cdl/jffs2.cdl: Remove super-ecos.c
         * src/dir-ecos.c src/write.c: Increase highest_version _before_
         assigning to new node, not after.
-        
+
 2002-01-27  David Woodhouse  <dwmw2@cambridge.redhat.com>
 
         * src/read.c (jffs2_read_inode_range): Deal correctly with
-        non-page-aligned read requests. We have to deal with the 
+        non-page-aligned read requests. We have to deal with the
         case where we want to read from somewhere other than the
-        beginning of a frag. 
+        beginning of a frag.
         * src/jffs2.c (jffs2_fo_read): Use jffs2_read_inode_range
         instead of jffs2_readpage.
 
@@ -398,8 +398,8 @@
         commented out. Remove jffs2_do_{create,link,unlink} to write.c
         * src/write.c: Add jffs2_do_{create,link,unlink} as in mainline.
         * src/nodelist.h: Prototypes for the above.
-        * src/jffs2port.h: Don't include <pkgconf/kernel.h>. 
-        
+        * src/jffs2port.h: Don't include <pkgconf/kernel.h>.
+
 2002-01-23  Jonathan Larmour  <jlarmour@redhat.com>
 
         * src/jffs2.c (jffs2_mount): Allow multiple FSs, and integration
@@ -422,7 +422,7 @@
         sector and flash sizes.
         * tests/fileio1.c: mount using block device (defined by CDL).
         No need to init here - done by flash block device layer.
-        
+
 2002-01-21  David Woodhouse  <dwmw2@cambridge.redhat.com>
 
         * src/read.c: Obtain inode lock around reading symlink target.
@@ -432,13 +432,13 @@
         that the portability cleanups from v1.51 aren't yet merged.
         * src/os-ecos.h: Add jffs2_can_mark_obsolete() and the macros
         for getting at generic inode fields from a struct jffs2_inode_info*
-        * src/nodemgmt.c: Remove an #ifndef __ECOS and use 
+        * src/nodemgmt.c: Remove an #ifndef __ECOS and use
         jffs2_can_mark_obsolete() instead.
         * src/jffs2port.h: up() is cyg_drv_mutex_unlock() not _release()
         * src/gc.c: Merge portability cleanups - get rid of a lot of
         references to 'struct inode'. Also include the attempt at NAND
         support in jffs2_garbage_collect_deletion_dirent().
-        
+
 2002-01-11  David Woodhouse  <dwmw2@cambridge.redhat.com>
 
         * src/jffs2port.h: Switch semaphore emulation to cyg_drv_mutex_t,
@@ -446,11 +446,11 @@
         * cdl/jffs2.cdl: Require CYGPKG_MEMALLOC
         * src/compr_zlib.c src/compr.c: Merge changes from mainline code
         to make mkfs.jffs2 compile again.
-        
+
 2002-01-10  David Woodhouse  <dwmw2@cambridge.redhat.com>
 
         * src/jffs2.c: The 'mode' arg passed to jffs2_open() shouldn't
-        have been called 'mode'. It's 'oflags'. You have to make up a 
+        have been called 'mode'. It's 'oflags'. You have to make up a
         mode for the newly-created file yourself.
         * src/nodelist.h src/read.c: Fix jffs2_getlink() so it takes
         portable arguments, not a dentry. Move it to read.c and symlink.c
@@ -465,7 +465,7 @@
 2000-08-28  Dominic Ostrowski (dominic.ostrowski@3glab.com)
 
         * started on port of JFFS2 using ramfs as a template
-        
+
 //===========================================================================
 //####ECOSGPLCOPYRIGHTBEGIN####
 // -------------------------------------------
@@ -501,5 +501,5 @@
 // -------------------------------------------
 //####ECOSGPLCOPYRIGHTEND####
 //===========================================================================
-        
+
 
diff -uNr mtd/fs/jffs2/ecos/doc/readme.txt mtd-whitespace/fs/jffs2/ecos/doc/readme.txt
--- mtd/fs/jffs2/ecos/doc/readme.txt	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/doc/readme.txt	2005-09-22 13:39:06.537587656 -0600
@@ -1,15 +1,15 @@
 This package is a port of the JFFS2 flash filing system to eCos. It has been
 developed on the Compaq Ipaq, and has not been tested on any other device.
 
-This code is subject to the original licensing terms, and additionally it 
-should be noted that this code is still in an early stage of development. 
+This code is subject to the original licensing terms, and additionally it
+should be noted that this code is still in an early stage of development.
 
 As this code will write to flash directly, caution should be exercised in
 its use. It may cause areas of the flash chips essential to the operation of
 the device to become corrupted.
 
 
-Minor modifications are necessary to the the eCos flash drivers 
+Minor modifications are necessary to the the eCos flash drivers
 
 io/flash/current/src/flash.c
 
diff -uNr mtd/fs/jffs2/ecos/src/dir-ecos.c mtd-whitespace/fs/jffs2/ecos/src/dir-ecos.c
--- mtd/fs/jffs2/ecos/src/dir-ecos.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/src/dir-ecos.c	2005-09-22 13:39:06.485595560 -0600
@@ -36,7 +36,7 @@
 
 	/* NB: The 2.2 backport will need to explicitly check for '.' and '..' here */
 	for (fd_list = dir_f->dents; fd_list && fd_list->nhash <= hash; fd_list = fd_list->next) {
-		if (fd_list->nhash == hash && 
+		if (fd_list->nhash == hash &&
 		    (!fd || fd_list->version > fd->version) &&
 		    strlen((char *)fd_list->name) == namelen &&
 		    !strncmp((char *)fd_list->name, (char *)d_name, namelen)) {
@@ -73,7 +73,7 @@
 	ri = jffs2_alloc_raw_inode();
 	if (!ri)
 		return -ENOMEM;
-	
+
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
 	D1(printk(KERN_DEBUG "jffs2_create()\n"));
@@ -89,8 +89,8 @@
 	f = JFFS2_INODE_INFO(inode);
 	dir_f = JFFS2_INODE_INFO(dir_i);
 
-	ret = jffs2_do_create(c, dir_f, f, ri, 
-			      (const char *)d_name, 
+	ret = jffs2_do_create(c, dir_f, f, ri,
+			      (const char *)d_name,
                               strlen((char *)d_name));
 
 	if (ret) {
@@ -118,7 +118,7 @@
 	struct jffs2_inode_info *dead_f = JFFS2_INODE_INFO(d_inode);
 	int ret;
 
-	ret = jffs2_do_unlink(c, dir_f, (const char *)d_name, 
+	ret = jffs2_do_unlink(c, dir_f, (const char *)d_name,
 			       strlen((char *)d_name), dead_f);
 	if (dead_f->inocache)
 		d_inode->i_nlink = dead_f->inocache->nlink;
@@ -138,8 +138,8 @@
 	uint8_t type = (old_d_inode->i_mode & S_IFMT) >> 12;
 	if (!type) type = DT_REG;
 
-	ret = jffs2_do_link(c, dir_f, f->inocache->ino, type, 
-                            (const char * )d_name, 
+	ret = jffs2_do_link(c, dir_f, f->inocache->ino, type,
+                            (const char * )d_name,
                             strlen((char *)d_name));
 
 	if (!ret) {
@@ -168,11 +168,11 @@
 	ri = jffs2_alloc_raw_inode();
 	if (!ri)
 		return -ENOMEM;
-	
+
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
-	/* Try to reserve enough space for both node and dirent. 
-	 * Just the node will do for now, though 
+	/* Try to reserve enough space for both node and dirent.
+	 * Just the node will do for now, though
 	 */
 	namelen = strlen((char *)d_name);
 	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
@@ -194,7 +194,7 @@
 
 	ri->data_crc = cpu_to_je32(0);
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
-	
+
 	fn = jffs2_write_dnode(c, f, ri, NULL, 0, phys_ofs, ALLOC_NORMAL);
 
 	jffs2_free_raw_inode(ri);
@@ -207,7 +207,7 @@
 		jffs2_iput(inode);
 		return PTR_ERR(fn);
 	}
-	/* No data here. Only a metadata node, which will be 
+	/* No data here. Only a metadata node, which will be
 	   obsoleted by the first data write
 	*/
 	f->metadata = fn;
@@ -221,7 +221,7 @@
 		jffs2_iput(inode);
 		return ret;
 	}
-	
+
 	rd = jffs2_alloc_raw_dirent();
 	if (!rd) {
 		/* Argh. Now we treat it like a normal delete */
@@ -249,12 +249,12 @@
 	rd->name_crc = cpu_to_je32(crc32(0, d_name, namelen));
 
 	fd = jffs2_write_dirent(c, dir_f, rd, d_name, namelen, phys_ofs, ALLOC_NORMAL);
-	
+
 	jffs2_complete_reservation(c);
 	jffs2_free_raw_dirent(rd);
-	
+
 	if (IS_ERR(fd)) {
-		/* dirent failed to write. Delete the inode normally 
+		/* dirent failed to write. Delete the inode normally
 		   as if it were the final unlink() */
 		up(&dir_f->sem);
 		inode->i_nlink = 0;
@@ -291,10 +291,10 @@
 	struct jffs2_inode_info *victim_f = NULL;
 	uint8_t type;
 
-#if 0 /* FIXME -- this really doesn't belong in individual file systems. 
+#if 0 /* FIXME -- this really doesn't belong in individual file systems.
 	 The fileio code ought to do this for us, or at least part of it */
 	if (new_dentry->d_inode) {
-		if (S_ISDIR(d_inode->i_mode) && 
+		if (S_ISDIR(d_inode->i_mode) &&
 		    !S_ISDIR(new_dentry->d_inode->i_mode)) {
 			/* Cannot rename directory over non-directory */
 			return -EINVAL;
@@ -322,19 +322,19 @@
 #endif
 
 	/* XXX: We probably ought to alloc enough space for
-	   both nodes at the same time. Writing the new link, 
+	   both nodes at the same time. Writing the new link,
 	   then getting -ENOSPC, is quite bad :)
 	*/
 
 	/* Make a hard link */
-	
+
 	/* XXX: This is ugly */
 	type = (d_inode->i_mode & S_IFMT) >> 12;
 	if (!type) type = DT_REG;
 
-	ret = jffs2_do_link(c, JFFS2_INODE_INFO(new_dir_i), 
+	ret = jffs2_do_link(c, JFFS2_INODE_INFO(new_dir_i),
 			    d_inode->i_ino, type,
-			    (const char *)new_d_name, 
+			    (const char *)new_d_name,
                             strlen((char *)new_d_name));
 
 	if (ret)
@@ -352,8 +352,8 @@
 	}
 
 	/* Unlink the original */
-	ret = jffs2_do_unlink(c, JFFS2_INODE_INFO(old_dir_i), 
-                              (const char *)old_d_name, 
+	ret = jffs2_do_unlink(c, JFFS2_INODE_INFO(old_dir_i),
+                              (const char *)old_d_name,
                               strlen((char *)old_d_name), NULL);
 
 	if (ret) {
diff -uNr mtd/fs/jffs2/ecos/src/fs-ecos.c mtd-whitespace/fs/jffs2/ecos/src/fs-ecos.c
--- mtd/fs/jffs2/ecos/src/fs-ecos.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/src/fs-ecos.c	2005-09-22 13:39:06.473597384 -0600
@@ -190,7 +190,7 @@
  restart:
 	D2(printf("icache_evict\n"));
 	// If this is an absolute search path from the root,
-	// remove all cached inodes with i_count of zero (these are only 
+	// remove all cached inodes with i_count of zero (these are only
 	// held where needed for dotdot filepaths)
 	while (this) {
 		next = this->i_cache_next;
@@ -254,7 +254,7 @@
 	if (!S_ISDIR(dir->i_mode))
 		return ENOTDIR;
 
-	// Isolate the next element of the path name. 
+	// Isolate the next element of the path name.
 	while (*n != '\0' && *n != '/')
 		n++, namelen++;
 
@@ -272,10 +272,10 @@
 		default:
 			break;
 		case 2:
-			// Dot followed by not Dot, treat as any other name 
+			// Dot followed by not Dot, treat as any other name
 			if (name[1] != '.')
 				break;
-			// Dot Dot 
+			// Dot Dot
 			// Move back up the search path
 			D2(printf("find_entry found ..\n"));
 			ds->dir = ds->node;
@@ -319,7 +319,7 @@
 // Main interface to directory search code. This is used in all file
 // level operations to locate the object named by the pathname.
 
-// Returns with use count incremented on both the sought object and 
+// Returns with use count incremented on both the sought object and
 // the directory it was found in
 static int jffs2_find(jffs2_dirsearch * d)
 {
@@ -542,7 +542,7 @@
 		memset(c->inocache_list, 0, sizeof(struct jffs2_inode_cache *) * INOCACHE_HASHSIZE);
                 if (n_fs_mounted++ == 0) {
                         jffs2_create_slab_caches(); // No error check, cannot fail
-			jffs2_compressors_init(); 
+			jffs2_compressors_init();
 		}
 
 		err = jffs2_read_super(jffs2_sb);
@@ -552,7 +552,7 @@
                                 jffs2_destroy_slab_caches();
 				jffs2_compressors_exit();
 			}
-                        
+
 			free(jffs2_sb);
 			free(c->inocache_list);
 			return err;
@@ -586,7 +586,7 @@
 
 // -------------------------------------------------------------------------
 // jffs2_umount()
-// Unmount the filesystem. 
+// Unmount the filesystem.
 
 static int jffs2_umount(cyg_mtab_entry * mte)
 {
@@ -616,7 +616,7 @@
 		    cyg_cdir_dir == (cyg_dir)root &&
 		    !strcmp(mte->name, "/")) {
 			/* If we were mounted on root, there's no
-			   way for the cwd to change out and free 
+			   way for the cwd to change out and free
 			   the file system for unmounting. So we hack
 			   it -- if cwd is '/' we unset it. Perhaps
 			   we should allow chdir(NULL) to unset
@@ -664,7 +664,7 @@
 		jffs2_sb->s_mount_count--;
         }
         if (--n_fs_mounted == 0) {
-                jffs2_destroy_slab_caches();        
+                jffs2_destroy_slab_caches();
 		jffs2_compressors_exit();
 	}
 	return ENOERR;
@@ -693,7 +693,7 @@
 	if (mode & (O_CREAT|O_TRUNC|O_WRONLY))
 		return EROFS;
 #endif
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *) name);
 
 	err = jffs2_find(&ds);
@@ -728,7 +728,7 @@
 			node = ds.node;
 	}
 
-	// Finished with the directory now 
+	// Finished with the directory now
 	jffs2_iput(ds.dir);
 
 	if (err != ENOERR)
@@ -753,7 +753,7 @@
              return EROFS;
 #endif
         }
-        
+
 	// Initialise the file object
 	file->f_flag |= mode & CYG_FILE_MODE_MASK;
 	file->f_type = CYG_FILE_TYPE_FILE;
@@ -777,7 +777,7 @@
 
 	D2(printf("jffs2_ops_unlink\n"));
 
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *)name);
 
 	err = jffs2_find(&ds);
@@ -814,7 +814,7 @@
 
 	D2(printf("jffs2_ops_mkdir\n"));
 
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *)name);
 
 	err = jffs2_find(&ds);
@@ -851,7 +851,7 @@
 
 	D2(printf("jffs2_ops_rmdir\n"));
 
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *)name);
 
 	err = jffs2_find(&ds);
@@ -887,7 +887,7 @@
 
 	D2(printf("jffs2_ops_rename\n"));
 
-	init_dirsearch(&ds1, (struct _inode *) dir1, 
+	init_dirsearch(&ds1, (struct _inode *) dir1,
                        (const unsigned char *)name1);
 
 	err = jffs2_find(&ds1);
@@ -897,7 +897,7 @@
 		return err;
 	}
 
-	init_dirsearch(&ds2, (struct _inode *) dir2, 
+	init_dirsearch(&ds2, (struct _inode *) dir2,
                        (const unsigned char *)name2);
 
 	err = jffs2_find(&ds2);
@@ -969,7 +969,7 @@
 	jffs2_iput(ds1.node);
 	if (ds2.node)
 		jffs2_iput(ds2.node);
- 
+
 	return err;
 }
 
@@ -989,7 +989,7 @@
 	if (type != CYG_FSLINK_HARD)
 		return EINVAL;
 
-	init_dirsearch(&ds1, (struct _inode *) dir1, 
+	init_dirsearch(&ds1, (struct _inode *) dir1,
                        (const unsigned char *) name1);
 
 	err = jffs2_find(&ds1);
@@ -999,7 +999,7 @@
 		return err;
 	}
 
-	init_dirsearch(&ds2, (struct _inode *) dir2, 
+	init_dirsearch(&ds2, (struct _inode *) dir2,
                        (const unsigned char *) name2);
 
 	err = jffs2_find(&ds2);
@@ -1054,7 +1054,7 @@
 
 	D2(printf("jffs2_opendir\n"));
 
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *) name);
 
 	err = jffs2_find(&ds);
@@ -1099,7 +1099,7 @@
 		jffs2_dirsearch ds;
 		int err;
 
-		init_dirsearch(&ds, (struct _inode *) dir, 
+		init_dirsearch(&ds, (struct _inode *) dir,
                                (const unsigned char *) name);
 
 		err = jffs2_find(&ds);
@@ -1113,7 +1113,7 @@
                         jffs2_iput(ds.node);
 			return ENOTDIR;
                 }
-                
+
 		// Pass it out
 		*dir_out = (cyg_dir) ds.node;
 	} else {
@@ -1142,7 +1142,7 @@
 
 	D2(printf("jffs2_stat\n"));
 
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *) name);
 
 	err = jffs2_find(&ds);
@@ -1180,7 +1180,7 @@
 
 	D2(printf("jffs2_getinfo\n"));
 
-	init_dirsearch(&ds, (struct _inode *) dir, 
+	init_dirsearch(&ds, (struct _inode *) dir,
                        (const unsigned char *) name);
 
 	err = jffs2_find(&ds);
@@ -1309,7 +1309,7 @@
 	ri->compr = JFFS2_COMPR_ZERO;
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
 	ri->data_crc = cpu_to_je32(0);
-		
+
 	fn = jffs2_write_dnode(c, f, ri, NULL, 0, phys_ofs, ALLOC_NORMAL);
 	jffs2_complete_reservation(c);
 	if (IS_ERR(fn)) {
@@ -1345,13 +1345,13 @@
      struct jffs2_raw_inode *ri;
      uint32_t phys_ofs, alloclen;
      int err;
-     
+
      ri = jffs2_alloc_raw_inode();
      if (!ri) {
           return ENOMEM;
      }
      err = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
-     
+
      if (err) {
           jffs2_free_raw_inode(ri);
           return err;
@@ -1361,10 +1361,10 @@
      ri->nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE);
      ri->totlen = cpu_to_je32(sizeof(*ri));
      ri->hdr_crc = cpu_to_je32(crc32(0, ri, sizeof(struct jffs2_unknown_node)-4));
-     
+
      ri->ino = cpu_to_je32(inode->i_ino);
      ri->version = cpu_to_je32(++f->highest_version);
-     
+
      ri->uid = cpu_to_je16(inode->i_uid);
      ri->gid = cpu_to_je16(inode->i_gid);
      ri->mode = cpu_to_jemode(inode->i_mode);
@@ -1376,7 +1376,7 @@
      ri->compr = JFFS2_COMPR_NONE;
      ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
      ri->data_crc = cpu_to_je32(0);
-     new_metadata = jffs2_write_dnode(c, f, ri, NULL, 0, 
+     new_metadata = jffs2_write_dnode(c, f, ri, NULL, 0,
                                       phys_ofs, ALLOC_NORMAL);
      if (IS_ERR(new_metadata)) {
           jffs2_complete_reservation(c);
@@ -1384,7 +1384,7 @@
           up(&f->sem);
           return PTR_ERR(new_metadata);
      }
-     
+
      /* It worked. Update the inode */
      inode->i_mtime = cyg_timestamp();
      inode->i_size = 0;
@@ -1396,10 +1396,10 @@
           jffs2_free_full_dnode(old_metadata);
      }
      jffs2_free_raw_inode(ri);
-     
+
      up(&f->sem);
      jffs2_complete_reservation(c);
-     
+
      return 0;
 }
 
@@ -1455,7 +1455,7 @@
 					      pos, len, &writtenlen);
 		if (err)
 			return -err;
-		
+
 		if (writtenlen != len)
 			return ENOSPC;
 
@@ -1733,22 +1733,22 @@
 }
 
 //==========================================================================
-// 
+//
 // Called by JFFS2
 // ===============
-// 
+//
 //
 //==========================================================================
 
-unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c, 
-				   struct jffs2_inode_info *f, 
+unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
+				   struct jffs2_inode_info *f,
 				   unsigned long offset,
 				   unsigned long *priv)
 {
 	/* FIXME: This works only with one file system mounted at a time */
 	int ret;
 
-	ret = jffs2_read_inode_range(c, f, gc_buffer, 
+	ret = jffs2_read_inode_range(c, f, gc_buffer,
 				     offset & ~(PAGE_CACHE_SIZE-1), PAGE_CACHE_SIZE);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1821,7 +1821,7 @@
 	// Called in super.c jffs2_read_super, dir.c jffs2_lookup,
 	// and gc.c jffs2_garbage_collect_pass
 
-	// Must first check for cached inode 
+	// Must first check for cached inode
 	// If this fails let new_inode create one
 
 	struct _inode *inode;
@@ -1857,14 +1857,14 @@
 
 void jffs2_iput(struct _inode *i)
 {
-	// Called in jffs2_find 
+	// Called in jffs2_find
 	// (and jffs2_open and jffs2_ops_mkdir?)
 	// super.c jffs2_read_super,
 	// and gc.c jffs2_garbage_collect_pass
  recurse:
 	if (!i) {
 		printf("jffs2_iput() called with NULL inode\n");
-		// and let it fault... 
+		// and let it fault...
 	}
 
 	i->i_count--;
@@ -1874,7 +1874,7 @@
 
 	if (i->i_count)
                 return;
-        
+
 	if (!i->i_nlink) {
 		struct _inode *parent;
 
@@ -1896,7 +1896,7 @@
 
 	} else {
 		// Evict some _other_ inode with i_count zero, leaving
-		// this latest one in the cache for a while 
+		// this latest one in the cache for a while
 		icache_evict(i->i_sb->s_root, i);
 	}
 }
@@ -1939,9 +1939,9 @@
 	D1(printk(KERN_DEBUG "jffs2_new_inode(): dir_i %ld, mode 0x%x\n", dir_i->i_ino, mode));
 
 	c = JFFS2_SB_INFO(sb);
-	
+
 	inode = new_inode(sb);
-	
+
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
@@ -1959,7 +1959,7 @@
                 if (inode->i_cache_prev)
                        inode->i_cache_prev->i_cache_next = inode->i_cache_next;
                 if (inode->i_cache_next)
-                       inode->i_cache_next->i_cache_prev = inode->i_cache_prev; 
+                       inode->i_cache_next->i_cache_prev = inode->i_cache_prev;
                 up(&(f->sem));
                 jffs2_clear_inode(inode);
                 memset(inode, 0x6a, sizeof(*inode));
@@ -1993,7 +1993,7 @@
 	c = JFFS2_SB_INFO(inode->i_sb);
 
 	jffs2_init_inode_info(f);
-	
+
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
 
 	if (ret) {
@@ -2029,16 +2029,16 @@
 	struct jffs2_inode_cache *ic;
 	if (!nlink) {
 		/* The inode has zero nlink but its nodes weren't yet marked
-		   obsolete. This has to be because we're still waiting for 
+		   obsolete. This has to be because we're still waiting for
 		   the final (close() and) jffs2_iput() to happen.
 
-		   There's a possibility that the final jffs2_iput() could have 
+		   There's a possibility that the final jffs2_iput() could have
 		   happened while we were contemplating. In order to ensure
 		   that we don't cause a new read_inode() (which would fail)
 		   for the inode in question, we use ilookup() in this case
 		   instead of jffs2_iget().
 
-		   The nlink can't _become_ zero at this point because we're 
+		   The nlink can't _become_ zero at this point because we're
 		   holding the alloc_sem, and jffs2_do_unlink() would also
 		   need that while decrementing nlink on any inode.
 		*/
diff -uNr mtd/fs/jffs2/ecos/src/gcthread.c mtd-whitespace/fs/jffs2/ecos/src/gcthread.c
--- mtd/fs/jffs2/ecos/src/gcthread.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/src/gcthread.c	2005-09-22 13:39:06.429604072 -0600
@@ -23,7 +23,7 @@
 void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
 {
      struct super_block *sb=OFNI_BS_2SFFJ(c);
-     
+
      /* Wake up the thread */
      D1(printk("jffs2_garbage_collect_trigger\n"));
 
@@ -31,54 +31,54 @@
 }
 
 
-void 
+void
 jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 {
      struct super_block *sb=OFNI_BS_2SFFJ(c);
-     
+
      CYG_ASSERTC(c);
      CYG_ASSERTC(!sb->s_gc_thread_handle);
-     
+
      cyg_flag_init(&sb->s_gc_thread_flags);
      cyg_mutex_init(&sb->s_lock);
-     
+
      D1(printk("jffs2_start_garbage_collect_thread\n"));
      /* Start the thread. Doesn't matter if it fails -- it's only an
       * optimisation anyway */
      cyg_thread_create(CYGNUM_JFFS2_GC_THREAD_PRIORITY,
-                       jffs2_garbage_collect_thread, 
+                       jffs2_garbage_collect_thread,
                        (cyg_addrword_t)c,"jffs2 gc thread",
                        (void*)sb->s_gc_thread_stack,
                        sizeof(sb->s_gc_thread_stack),
-                       &sb->s_gc_thread_handle, 
+                       &sb->s_gc_thread_handle,
                        &sb->s_gc_thread);
-     
+
      cyg_thread_resume(sb->s_gc_thread_handle);
 }
 
-void 
+void
 jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c)
 {
      struct super_block *sb=OFNI_BS_2SFFJ(c);
-     
+
      CYG_ASSERTC(sb->s_gc_thread_handle);
-     
+
      D1(printk("jffs2_stop_garbage_collect_thread\n"));
      /* Stop the thread and wait for it if necessary */
-     
+
      cyg_flag_setbits(&sb->s_gc_thread_flags,GC_THREAD_FLAG_STOP);
-     
+
      D1(printk("jffs2_stop_garbage_collect_thread wait\n"));
-     
+
      cyg_flag_wait(&sb->s_gc_thread_flags,
                    GC_THREAD_FLAG_HAS_EXIT,
                    CYG_FLAG_WAITMODE_OR| CYG_FLAG_WAITMODE_CLR);
-     
+
      // Kill and free the resources ...  this is safe due to the flag
      // from the thread.
      cyg_thread_kill(sb->s_gc_thread_handle);
      cyg_thread_delete(sb->s_gc_thread_handle);
-     
+
      cyg_mutex_destroy(&sb->s_lock);
      cyg_flag_destroy(&sb->s_gc_thread_flags);
 }
@@ -91,25 +91,25 @@
      struct super_block *sb=OFNI_BS_2SFFJ(c);
      cyg_flag_value_t flag;
      cyg_mtab_entry *mte;
-     
+
      D1(printk("jffs2_garbage_collect_thread START\n"));
-     
+
      while(1) {
           flag=cyg_flag_timed_wait(&sb->s_gc_thread_flags,
                                    GC_THREAD_FLAG_TRIG|GC_THREAD_FLAG_STOP,
                                    CYG_FLAG_WAITMODE_OR| CYG_FLAG_WAITMODE_CLR,
                                    cyg_current_time()+
                                    CYGNUM_JFFS2_GS_THREAD_TICKS);
-          
+
           if (flag & GC_THREAD_FLAG_STOP)
                break;
-          
+
           D1(printk("jffs2: GC THREAD GC BEGIN\n"));
 
           mte=cyg_fs_root_lookup((cyg_dir *) sb->s_root);
           CYG_ASSERT(mte, "Bad mount point");
           cyg_fs_lock(mte, mte->fs->syncmode);
-          
+
           if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
                printf("No space for garbage collection. "
                       "Aborting JFFS2 GC thread\n");
@@ -118,7 +118,7 @@
           cyg_fs_unlock(mte, mte->fs->syncmode);
           D1(printk("jffs2: GC THREAD GC END\n"));
      }
-     
+
      D1(printk("jffs2_garbage_collect_thread EXIT\n"));
      cyg_flag_setbits(&sb->s_gc_thread_flags,GC_THREAD_FLAG_HAS_EXIT);
 }
diff -uNr mtd/fs/jffs2/ecos/src/malloc-ecos.c mtd-whitespace/fs/jffs2/ecos/src/malloc-ecos.c
--- mtd/fs/jffs2/ecos/src/malloc-ecos.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/src/malloc-ecos.c	2005-09-22 13:39:06.451600728 -0600
@@ -129,7 +129,7 @@
 struct jffs2_raw_node_ref *jffs2_alloc_raw_node_ref(void)
 {
 	struct jffs2_raw_node_ref * p;
-	
+
 	cyg_drv_mutex_lock(&mutex);
 	p = first;
 	if (p != NULL)
diff -uNr mtd/fs/jffs2/ecos/src/os-ecos.h mtd-whitespace/fs/jffs2/ecos/src/os-ecos.h
--- mtd/fs/jffs2/ecos/src/os-ecos.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/src/os-ecos.h	2005-09-22 13:39:06.386610608 -0600
@@ -56,7 +56,7 @@
 
 struct iovec {
         void *iov_base;
-        ssize_t iov_len; 
+        ssize_t iov_len;
 };
 
 static inline unsigned int full_name_hash(const unsigned char * name, unsigned int len) {
@@ -80,7 +80,7 @@
 
 #define JFFS2_INODE_INFO(i) (&(i)->jffs2_i)
 #define OFNI_EDONI_2SFFJ(f)  ((struct _inode *) ( ((char *)f) - ((char *)(&((struct _inode *)NULL)->jffs2_i)) ) )
- 
+
 #define JFFS2_F_I_SIZE(f) (OFNI_EDONI_2SFFJ(f)->i_size)
 #define JFFS2_F_I_MODE(f) (OFNI_EDONI_2SFFJ(f)->i_mode)
 #define JFFS2_F_I_UID(f) (OFNI_EDONI_2SFFJ(f)->i_uid)
@@ -131,7 +131,7 @@
 #ifdef CYGOPT_FS_JFFS2_GCTHREAD
 	cyg_mutex_t s_lock;             // Lock the inode cache
 	cyg_flag_t  s_gc_thread_flags;  // Communication with the gcthread
-	cyg_handle_t s_gc_thread_handle; 
+	cyg_handle_t s_gc_thread_handle;
 	cyg_thread s_gc_thread;
 #if (CYGNUM_JFFS2_GC_THREAD_STACK_SIZE >= CYGNUM_HAL_STACK_SIZE_MINIMUM)
         char s_gc_thread_stack[CYGNUM_JFFS2_GC_THREAD_STACK_SIZE];
@@ -163,7 +163,7 @@
 void jffs2_iput(struct _inode * i);
 void jffs2_gc_release_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f);
 struct jffs2_inode_info *jffs2_gc_fetch_inode(struct jffs2_sb_info *c, int inum, int nlink);
-unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c, struct jffs2_inode_info *f, 
+unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 				   unsigned long offset, unsigned long *priv);
 void jffs2_gc_release_page(struct jffs2_sb_info *c, unsigned char *pg, unsigned long *priv);
 
diff -uNr mtd/fs/jffs2/ecos/tests/jffs2_1.c mtd-whitespace/fs/jffs2/ecos/tests/jffs2_1.c
--- mtd/fs/jffs2/ecos/tests/jffs2_1.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/tests/jffs2_1.c	2005-09-22 13:39:06.592579296 -0600
@@ -47,12 +47,12 @@
 // Purpose:             Test fileio system
 // Description:         This test uses the testfs to check out the initialization
 //                      and basic operation of the fileio system
-//                      
-//                      
-//                      
-//                      
-//                      
-//              
+//
+//
+//
+//
+//
+//
 //
 //####DESCRIPTIONEND####
 //
@@ -127,16 +127,16 @@
     int err;
     DIR *dirp;
     int num=0;
-    
+
     diag_printf("<INFO>: reading directory %s\n",name);
-    
+
     dirp = opendir( name );
     if( dirp == NULL ) SHOW_RESULT( opendir, -1 );
 
     for(;;)
     {
         struct dirent *entry = readdir( dirp );
-        
+
         if( entry == NULL )
             break;
         num++;
@@ -153,9 +153,9 @@
                     strcat(fullname, "/" );
             }
             else fullname[0] = 0;
-            
+
             strcat(fullname, entry->d_name );
-            
+
             err = stat( fullname, &sbuf );
             if( err < 0 )
             {
@@ -196,9 +196,9 @@
 
     err = access( name, F_OK );
     if( err < 0 && errno != EACCES ) SHOW_RESULT( access, err );
-    
+
     for( i = 0; i < IOSIZE; i++ ) buf[i] = i%256;
- 
+
     fd = open( name, O_WRONLY|O_CREAT );
     if( fd < 0 ) SHOW_RESULT( open, fd );
 
@@ -206,9 +206,9 @@
     {
         ssize_t len = size;
         if ( len > IOSIZE ) len = IOSIZE;
-        
+
         wrote = write( fd, buf, len );
-        if( wrote != len ) SHOW_RESULT( write, wrote );        
+        if( wrote != len ) SHOW_RESULT( write, wrote );
 
         size -= wrote;
     }
@@ -228,24 +228,24 @@
     int i;
     int err;
     size_t size = 0;
-    
+
     diag_printf("<INFO>: create maximal file %s\n",name);
 
     err = access( name, F_OK );
     if( err < 0 && errno != EACCES ) SHOW_RESULT( access, err );
-    
+
     for( i = 0; i < IOSIZE; i++ ) buf[i] = i%256;
- 
+
     fd = open( name, O_WRONLY|O_CREAT );
     if( fd < 0 ) SHOW_RESULT( open, fd );
 
     do
     {
         wrote = write( fd, buf, IOSIZE );
-        if( wrote < 0 ) SHOW_RESULT( write, wrote );        
+        if( wrote < 0 ) SHOW_RESULT( write, wrote );
 
         size += wrote;
-        
+
     } while( wrote == IOSIZE );
 
     diag_printf("<INFO>: file size == %d\n",size);
@@ -267,7 +267,7 @@
     off_t pos = 0;
 
     diag_printf("<INFO>: check file %s\n",name);
-    
+
     err = access( name, F_OK );
     if( err != 0 ) SHOW_RESULT( access, err );
 
@@ -288,7 +288,7 @@
                             (unsigned long)pos,i,buf[i],i%256);
                 CYG_TEST_FAIL("Data read not equal to data written\n");
             }
-        
+
         pos += done;
     }
 
@@ -313,13 +313,13 @@
 
     err = access( name2, F_OK );
     if( err != 0 ) SHOW_RESULT( access, err );
-    
+
     fd1 = open( name1, O_WRONLY|O_CREAT );
     if( fd1 < 0 ) SHOW_RESULT( open, fd1 );
 
     fd2 = open( name2, O_RDONLY );
     if( fd2 < 0 ) SHOW_RESULT( open, fd2 );
-    
+
     for(;;)
     {
         done = read( fd2, buf, IOSIZE );
@@ -338,7 +338,7 @@
 
     err = close( fd2 );
     if( err < 0 ) SHOW_RESULT( close, err );
-    
+
 }
 
 //==========================================================================
@@ -359,13 +359,13 @@
 
     err = access( name1, F_OK );
     if( err != 0 ) SHOW_RESULT( access, err );
-    
+
     fd1 = open( name1, O_RDONLY );
     if( fd1 < 0 ) SHOW_RESULT( open, fd1 );
 
     fd2 = open( name2, O_RDONLY );
     if( fd2 < 0 ) SHOW_RESULT( open, fd2 );
-    
+
     for(;;)
     {
         done1 = read( fd1, buf1, IOSIZE );
@@ -376,7 +376,7 @@
 
         if( done1 != done2 )
             diag_printf("Files different sizes\n");
-        
+
         if( done1 == 0 ) break;
 
         for( i = 0; i < done1; i++ )
@@ -392,7 +392,7 @@
 
     err = close( fd2 );
     if( err < 0 ) SHOW_RESULT( close, err );
-    
+
 }
 
 //==========================================================================
@@ -403,7 +403,7 @@
     char *ret;
 
     ret = getcwd( cwdbuf, sizeof(cwdbuf));
-    if( ret == NULL ) SHOW_RESULT( getcwd, ret );    
+    if( ret == NULL ) SHOW_RESULT( getcwd, ret );
 
     if( strcmp( cwdbuf, cwd ) != 0 )
     {
@@ -426,13 +426,13 @@
     // --------------------------------------------------------------
 
     err = mount( CYGDAT_IO_FLASH_BLOCK_DEVICE_NAME_1, "/", "jffs2" );
-    if( err < 0 ) SHOW_RESULT( mount, err );    
+    if( err < 0 ) SHOW_RESULT( mount, err );
 
     err = chdir( "/" );
     if( err < 0 ) SHOW_RESULT( chdir, err );
 
     checkcwd( "/" );
-    
+
     listdir( "/", true, -1, &existingdirents );
     if ( existingdirents < 2 )
         CYG_TEST_FAIL("Not enough dir entries\n");
@@ -459,11 +459,11 @@
     if( err < 0 ) SHOW_RESULT( chdir, err );
 
     checkcwd( "/bar" );
-    
-    diag_printf("<INFO>: rename /foo bundy\n");    
+
+    diag_printf("<INFO>: rename /foo bundy\n");
     err = rename( "/foo", "bundy" );
     if( err < 0 ) SHOW_RESULT( rename, err );
-    
+
     listdir( "/", true, existingdirents+2, NULL );
     listdir( "" , true, 4, NULL );
 
@@ -477,47 +477,47 @@
     copyfile( LONGNAME1, LONGNAME2 );
 
     listdir( "", false, 6, NULL );
-    
-    diag_printf("<INFO>: unlink " LONGNAME1 "\n");    
+
+    diag_printf("<INFO>: unlink " LONGNAME1 "\n");
     err = unlink( LONGNAME1 );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: unlink " LONGNAME2 "\n");    
+    diag_printf("<INFO>: unlink " LONGNAME2 "\n");
     err = unlink( LONGNAME2 );
     if( err < 0 ) SHOW_RESULT( unlink, err );
-    
-    
+
+
     // --------------------------------------------------------------
 
-    diag_printf("<INFO>: unlink fee\n");    
+    diag_printf("<INFO>: unlink fee\n");
     err = unlink( "/fee" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: unlink fum\n");        
+    diag_printf("<INFO>: unlink fum\n");
     err = unlink( "fum" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: unlink /bar/bundy\n");        
+    diag_printf("<INFO>: unlink /bar/bundy\n");
     err = unlink( "/bar/bundy" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: cd /\n");        
+    diag_printf("<INFO>: cd /\n");
     err = chdir( "/" );
     if( err < 0 ) SHOW_RESULT( chdir, err );
 
     checkcwd( "/" );
-    
-    diag_printf("<INFO>: rmdir /bar\n");        
+
+    diag_printf("<INFO>: rmdir /bar\n");
     err = rmdir( "/bar" );
     if( err < 0 ) SHOW_RESULT( rmdir, err );
-    
+
     listdir( "/", false, existingdirents, NULL );
 
     // --------------------------------------------------------------
 
     diag_printf("<INFO>: mount /jffs2 \n");
     err = mount( CYGDAT_IO_FLASH_BLOCK_DEVICE_NAME_1, "/jffs2", "jffs2" );
-    if( err < 0 ) SHOW_RESULT( mount, err );    
+    if( err < 0 ) SHOW_RESULT( mount, err );
 
     createfile( "/jffs2/tinky", 456 );
     copyfile( "/jffs2/tinky", "/jffs2/laalaa" );
@@ -525,13 +525,13 @@
     checkfile( "/jffs2/laalaa");
     comparefiles( "/jffs2/tinky", "/jffs2/laalaa" );
 
-    diag_printf("<INFO>: cd /jffs2\n");    
+    diag_printf("<INFO>: cd /jffs2\n");
     err = chdir( "/jffs2" );
     if( err < 0 ) SHOW_RESULT( chdir, err );
 
     checkcwd( "/jffs2" );
-        
-    diag_printf("<INFO>: mkdir noonoo\n");    
+
+    diag_printf("<INFO>: mkdir noonoo\n");
     err = mkdir( "noonoo", 0 );
     if( err < 0 ) SHOW_RESULT( mkdir, err );
 
@@ -542,7 +542,7 @@
     if( err < 0 ) SHOW_RESULT( chdir, err );
 
     checkcwd( "/jffs2/noonoo" );
-    
+
     createfile( "tinky", 678 );
     checkfile( "tinky" );
 
@@ -554,9 +554,9 @@
 
 
     /*for(i=0;i<2048;i++) {
-        diag_printf("<INFO>: churningchurningchurning................................ITERATION = %d\n", i);    
+        diag_printf("<INFO>: churningchurningchurning................................ITERATION = %d\n", i);
         createfile( "churningchurningchurning", 4096 );
-        diag_printf("<INFO>: unlink churningchurningchurning\n");    
+        diag_printf("<INFO>: unlink churningchurningchurning\n");
         err = unlink( "churningchurningchurning" );
         if( err < 0 ) SHOW_RESULT( unlink, err );
     }*/
@@ -568,24 +568,24 @@
 
     // --------------------------------------------------------------
 
-    diag_printf("<INFO>: unlink tinky\n");    
+    diag_printf("<INFO>: unlink tinky\n");
     err = unlink( "tinky" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: unlink dipsy\n");    
+    diag_printf("<INFO>: unlink dipsy\n");
     err = unlink( "dipsy" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: unlink po\n");    
+    diag_printf("<INFO>: unlink po\n");
     err = unlink( "po" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: cd ..\n"); 
+    diag_printf("<INFO>: cd ..\n");
     err = chdir( ".." );
     if( err < 0 ) SHOW_RESULT( chdir, err );
     checkcwd( "/jffs2" );
-    
-    diag_printf("<INFO>: rmdir noonoo\n"); 
+
+    diag_printf("<INFO>: rmdir noonoo\n");
     err = rmdir( "noonoo" );
     if( err < 0 ) SHOW_RESULT( rmdir, err );
 
@@ -593,16 +593,16 @@
 
     err = mkdir( "x", 0 );
     if( err < 0 ) SHOW_RESULT( mkdir, err );
-    
+
     err = mkdir( "x/y", 0 );
     if( err < 0 ) SHOW_RESULT( mkdir, err );
-    
+
     err = mkdir( "x/y/z", 0 );
     if( err < 0 ) SHOW_RESULT( mkdir, err );
 
     err = mkdir( "x/y/z/w", 0 );
     if( err < 0 ) SHOW_RESULT( mkdir, err );
-    
+
     diag_printf("<INFO>: cd /jffs2/x/y/z/w\n");
     err = chdir( "/jffs2/x/y/z/w" );
     if( err < 0 ) SHOW_RESULT( chdir, err );
@@ -612,7 +612,7 @@
     err = chdir( ".." );
     if( err < 0 ) SHOW_RESULT( chdir, err );
     checkcwd( "/jffs2/x/y/z" );
-    
+
     diag_printf("<INFO>: cd .\n");
     err = chdir( "." );
     if( err < 0 ) SHOW_RESULT( chdir, err );
@@ -628,45 +628,45 @@
     if( err < 0 ) SHOW_RESULT( chdir, err );
     checkcwd( "/jffs2" );
 
-    diag_printf("<INFO>: rmdir x/y/z/w\n"); 
+    diag_printf("<INFO>: rmdir x/y/z/w\n");
     err = rmdir( "x/y/z/w" );
     if( err < 0 ) SHOW_RESULT( rmdir, err );
 
-    diag_printf("<INFO>: rmdir x/y/z\n"); 
+    diag_printf("<INFO>: rmdir x/y/z\n");
     err = rmdir( "x/y/z" );
     if( err < 0 ) SHOW_RESULT( rmdir, err );
 
-    diag_printf("<INFO>: rmdir x/y\n"); 
+    diag_printf("<INFO>: rmdir x/y\n");
     err = rmdir( "x/y" );
     if( err < 0 ) SHOW_RESULT( rmdir, err );
 
-    diag_printf("<INFO>: rmdir x\n"); 
+    diag_printf("<INFO>: rmdir x\n");
     err = rmdir( "x" );
     if( err < 0 ) SHOW_RESULT( rmdir, err );
-    
+
     // --------------------------------------------------------------
-    
-    diag_printf("<INFO>: unlink tinky\n");    
+
+    diag_printf("<INFO>: unlink tinky\n");
     err = unlink( "tinky" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: unlink laalaa\n");    
+    diag_printf("<INFO>: unlink laalaa\n");
     err = unlink( "laalaa" );
     if( err < 0 ) SHOW_RESULT( unlink, err );
 
-    diag_printf("<INFO>: cd /\n");    
+    diag_printf("<INFO>: cd /\n");
     err = chdir( "/" );
     if( err < 0 ) SHOW_RESULT( chdir, err );
     checkcwd( "/" );
-    
-    diag_printf("<INFO>: umount /jffs2\n");    
+
+    diag_printf("<INFO>: umount /jffs2\n");
     err = umount( "/jffs2" );
-    if( err < 0 ) SHOW_RESULT( umount, err );    
-    
-    diag_printf("<INFO>: umount /\n");    
+    if( err < 0 ) SHOW_RESULT( umount, err );
+
+    diag_printf("<INFO>: umount /\n");
     err = umount( "/" );
-    if( err < 0 ) SHOW_RESULT( umount, err );    
-    
+    if( err < 0 ) SHOW_RESULT( umount, err );
+
     CYG_TEST_PASS_FINISH("jffs2_1");
 }
 
diff -uNr mtd/fs/jffs2/ecos/tests/jffs2_2.c mtd-whitespace/fs/jffs2/ecos/tests/jffs2_2.c
--- mtd/fs/jffs2/ecos/tests/jffs2_2.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/tests/jffs2_2.c	2005-09-22 13:39:06.615575800 -0600
@@ -47,12 +47,12 @@
 // Purpose:             Test fseek on a filesystem
 // Description:         This test uses the ramfs to check out the fseek
 //                      operation on a filesystem.
-//                      
-//                      
-//                      
-//                      
-//                      
-//              
+//
+//
+//
+//
+//
+//
 //
 //####DESCRIPTIONEND####
 //
@@ -88,17 +88,17 @@
     FILE *stream;
     long pos;
     int i;
-    
+
     CYG_TEST_INIT();
 
     // --------------------------------------------------------------
 
-    CYG_TEST_INFO("mount /");    
+    CYG_TEST_INFO("mount /");
     err = mount( CYGDAT_IO_FLASH_BLOCK_DEVICE_NAME_1, "/", "jffs2" );
 
-    if( err < 0 ) SHOW_RESULT( mount, err );    
-    
-    CYG_TEST_INFO("creating /fseek");    
+    if( err < 0 ) SHOW_RESULT( mount, err );
+
+    CYG_TEST_INFO("creating /fseek");
     stream = fopen("/fseek","w+");
     if (!stream) {
       diag_printf("FAIL: fopen() returned NULL, %s\n", strerror(errno));
@@ -109,26 +109,26 @@
     for (i = 0; i < sizeof(buf); i++) {
       buf[i] = i % 256;
     }
-    
-    CYG_TEST_INFO("writing test pattern");    
+
+    CYG_TEST_INFO("writing test pattern");
     err=fwrite(buf,sizeof(buf), 1, stream);
     if ( err < 0 ) SHOW_RESULT( fwrite, err );
-    
+
     /* The current position should be the same size as the buffer */
     pos = ftell(stream);
-    
+
     if (pos < 0) SHOW_RESULT( ftell, pos );
     if (pos != sizeof(buf))
       diag_printf("<FAIL>: ftell is not telling the truth.");
-    
-    CYG_TEST_INFO("fseek()ing to beginning and writing");    
+
+    CYG_TEST_INFO("fseek()ing to beginning and writing");
 
     /* Seek back to the beginning of the file */
     err = fseek(stream, 0, SEEK_SET);
     if ( err < 0 ) SHOW_RESULT( fseek, err );
 
     pos = ftell(stream);
-    
+
     if (pos < 0) SHOW_RESULT( ftell, pos );
     if (pos != 0) CYG_TEST_FAIL("ftell is not telling the truth");
 
@@ -142,12 +142,12 @@
 
     /* Check the pointer is at 4 */
     pos = ftell(stream);
-    
+
     if (pos < 0) SHOW_RESULT( ftell, pos );
     if (pos != 4)  CYG_TEST_FAIL("ftell is not telling the truth");
 
     CYG_TEST_INFO("closing file");
-    
+
     /* Close the file, open it up again and read it back */
     err = fclose(stream);
     if (err != 0) SHOW_RESULT( fclose, err );
@@ -160,12 +160,12 @@
 
     err = fread(buf1,sizeof(buf1),1, stream);
     if (err != 1) SHOW_RESULT( fread, err );
-    
+
     CYG_TEST_INFO("Comparing contents");
     if (memcmp(buf, buf1, sizeof(buf1))) {
       CYG_TEST_FAIL("File contents inconsistent");
     }
-    
+
     CYG_TEST_INFO("closing file");
 
     err = fclose(stream);
@@ -183,16 +183,16 @@
     if ( err < 0 ) SHOW_RESULT( fseek, err );
 
     pos = ftell(stream);
-    
+
     if (pos < 0) SHOW_RESULT( ftell, pos );
     if (pos != (2*sizeof(buf))) CYG_TEST_FAIL("ftell is not telling the truth");
-    
-    CYG_TEST_INFO("writing test pattern");    
+
+    CYG_TEST_INFO("writing test pattern");
     err=fwrite(buf,sizeof(buf), 1, stream);
     if ( err < 0 ) SHOW_RESULT( fwrite, err );
-    
+
     pos = ftell(stream);
-    
+
     if (pos < 0) SHOW_RESULT( ftell, pos );
     if (pos != (3*sizeof(buf))) CYG_TEST_FAIL("ftell is not telling the truth");
 
@@ -205,10 +205,10 @@
     if (!stream) {
       diag_printf("<FAIL>: fopen() returned NULL, %s\n", strerror(errno));
     }
-    
+
     err = fread(buf1,sizeof(buf1),1, stream);
     if (err != 1) SHOW_RESULT( fread, err );
-    
+
     CYG_TEST_INFO("Comparing contents");
     if (memcmp(buf, buf1, sizeof(buf1))) {
       CYG_TEST_FAIL("File contents inconsistent");
@@ -216,15 +216,15 @@
 
     err = fread(buf1,sizeof(buf1),1, stream);
     if (err != 1) SHOW_RESULT( fread, err );
-    
+
     for (i = 0; i< sizeof(buf); i++) {
       if (buf1[i] != 0)
         CYG_TEST_FAIL("Hole does not contain zeros");
     }
-    
+
     err = fread(buf1,sizeof(buf1),1, stream);
     if (err != 1) SHOW_RESULT( fread, err );
-    
+
     if (memcmp(buf, buf1, sizeof(buf1))) {
       CYG_TEST_FAIL("File contents inconsistent");
     }
@@ -234,10 +234,10 @@
     /* Close the file */
     err = fclose(stream);
     if (err != 0) SHOW_RESULT( fclose, err );
-    
-    CYG_TEST_INFO("umount /");    
+
+    CYG_TEST_INFO("umount /");
     err = umount( "/" );
-    if( err < 0 ) SHOW_RESULT( umount, err );    
-    
+    if( err < 0 ) SHOW_RESULT( umount, err );
+
     CYG_TEST_PASS_FINISH("jffs2_2");
 }
diff -uNr mtd/fs/jffs2/ecos/tests/jffs2_3.c mtd-whitespace/fs/jffs2/ecos/tests/jffs2_3.c
--- mtd/fs/jffs2/ecos/tests/jffs2_3.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ecos/tests/jffs2_3.c	2005-09-22 13:39:06.603577624 -0600
@@ -44,7 +44,7 @@
 // Purpose:             Test garbage collect on a filesystem
 // Description:         This test creates and deletes files in order
 //                      to test the garbage collection code.
-//                      
+//
 //####DESCRIPTIONEND####
 //
 //==========================================================================
@@ -80,22 +80,22 @@
   char name[16];
   cyg_uint32 j;
   int fd, err;
-  
+
   sprintf(name,"test%07d",i);
 
   fd = creat(name, S_IRWXU);
   if (fd == -1) SHOW_RESULT( creat, fd );
-  
+
   for (j=1; j < NELEM(buffer); j++) {
     buffer[j] = rand();
   }
-  
+
   buffer[0] = 0;
   buffer[0] = cyg_posix_crc32((unsigned char *)buffer, sizeof(buffer));
-  
+
   err = write(fd, buffer, sizeof(buffer));
   if (err == -1) SHOW_RESULT( write, err );
-  
+
   err = close(fd);
   if (err == -1) SHOW_RESULT( close, err );
 }
@@ -104,7 +104,7 @@
 {
   char name[16];
   int err;
-  
+
   sprintf(name,"test%07d",i);
 
   err = unlink(name);
@@ -117,18 +117,18 @@
   int err, fd;
   cyg_int32 buffer[1020];
   cyg_uint32 crc;
-  
+
   sprintf(name,"test%07d",i);
 
   fd = open(name, O_RDONLY);
   if (fd == -1) SHOW_RESULT( open, fd );
-  
+
   err = read(fd, buffer, sizeof(buffer));
   if (err == -1) SHOW_RESULT( read, fd );
-  
+
   crc = buffer[0];
   buffer[0] = 0;
-  
+
   if (crc != cyg_posix_crc32((unsigned char *)buffer, sizeof(buffer))) {
     CYG_TEST_FAIL("File corrupt");
   }
@@ -150,18 +150,18 @@
 
     // --------------------------------------------------------------
 
-    CYG_TEST_INFO("mount /");    
+    CYG_TEST_INFO("mount /");
     err = mount( CYGDAT_IO_FLASH_BLOCK_DEVICE_NAME_1, "/", "jffs2" );
-    if( err < 0 ) SHOW_RESULT( mount, err );    
-    
+    if( err < 0 ) SHOW_RESULT( mount, err );
+
     chdir ("/");
-    
+
     iteration=0;
     create_file(iteration);
     while (iteration < ITERATIONS) {
       if (!(iteration % 1000)) {
         minfo = mallinfo();
-        diag_printf("<INFO> Iteration %07d fordblks = %7d\n", 
+        diag_printf("<INFO> Iteration %07d fordblks = %7d\n",
                     iteration, minfo.fordblks);
       }
       iteration++;
@@ -170,10 +170,10 @@
       delete_file(iteration-1);
       check_file(iteration);
     }
-    
+
     CYG_TEST_INFO("umount /");
     err = umount( "/" );
-    if( err < 0 ) SHOW_RESULT( umount, err );    
-    
+    if( err < 0 ) SHOW_RESULT( umount, err );
+
     CYG_TEST_PASS_FINISH("jffs2_3");
 }
diff -uNr mtd/fs/jffs2/erase.c mtd-whitespace/fs/jffs2/erase.c
--- mtd/fs/jffs2/erase.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/erase.c	2005-09-22 17:01:01.299863848 -0600
@@ -24,7 +24,7 @@
 	struct jffs2_eraseblock *jeb;
 	struct jffs2_sb_info *c;
 };
-      
+
 #ifndef __ECOS
 static void jffs2_erase_callback(struct erase_info *);
 #endif
@@ -39,12 +39,12 @@
 	int ret;
 	uint32_t bad_offset;
 #ifdef __ECOS
-       ret = jffs2_flash_erase(c, jeb);
-       if (!ret) {
-               jffs2_erase_succeeded(c, jeb);
-               return;
-       }
-       bad_offset = jeb->offset;
+	ret = jffs2_flash_erase(c, jeb);
+	if (!ret) {
+		jffs2_erase_succeeded(c, jeb);
+		return;
+	}
+	bad_offset = jeb->offset;
 #else /* Linux */
 	struct erase_info *instr;
 
@@ -71,7 +71,7 @@
 	instr->callback = jffs2_erase_callback;
 	instr->priv = (unsigned long)(&instr[1]);
 	instr->fail_addr = 0xffffffff;
-	
+
 	((struct erase_priv_struct *)instr->priv)->jeb = jeb;
 	((struct erase_priv_struct *)instr->priv)->c = c;
 
@@ -96,7 +96,7 @@
 		return;
 	}
 
-	if (ret == -EROFS) 
+	if (ret == -EROFS)
 		printk(KERN_WARNING "Erase at 0x%08x failed immediately: -EROFS. Is the sector locked?\n", jeb->offset);
 	else
 		printk(KERN_WARNING "Erase at 0x%08x failed immediately: errno %d\n", jeb->offset, ret);
@@ -197,19 +197,19 @@
 	c->nr_erasing_blocks--;
 	spin_unlock(&c->erase_completion_lock);
 	wake_up(&c->erase_wait);
-}	 
+}
 
 #ifndef __ECOS
 static void jffs2_erase_callback(struct erase_info *instr)
 {
 	struct erase_priv_struct *priv = (void *)instr->priv;
 
-	if(instr->state != MTD_ERASE_DONE) {
+	if (instr->state != MTD_ERASE_DONE) {
 		printk(KERN_WARNING "Erase at 0x%08x finished, but state != MTD_ERASE_DONE. State is 0x%x instead.\n", instr->addr, instr->state);
 		jffs2_erase_failed(priv->c, priv->jeb, instr->fail_addr);
 	} else {
 		jffs2_erase_succeeded(priv->c, priv->jeb);
-	}	
+	}
 	kfree(instr);
 }
 #endif /* !__ECOS */
@@ -227,13 +227,13 @@
 	/* Walk the inode's list once, removing any nodes from this eraseblock */
 	while (1) {
 		if (!(*prev)->next_in_ino) {
-			/* We're looking at the jffs2_inode_cache, which is 
+			/* We're looking at the jffs2_inode_cache, which is
 			   at the end of the linked list. Stash it and continue
 			   from the beginning of the list */
 			ic = (struct jffs2_inode_cache *)(*prev);
 			prev = &ic->nodes;
 			continue;
-		} 
+		}
 
 		if (SECTOR_ADDR((*prev)->flash_offset) == jeb->offset) {
 			/* It's in the block we're erasing */
@@ -262,17 +262,17 @@
 		  jeb->offset, jeb->offset + c->sector_size, ic->ino));
 
 	D2({
-		int i=0;
+		int i = 0;
 		struct jffs2_raw_node_ref *this;
 		printk(KERN_DEBUG "After remove_node_refs_from_ino_list: \n" KERN_DEBUG);
 
 		this = ic->nodes;
-	   
-		while(this) {
-			printk( "0x%08x(%d)->", ref_offset(this), ref_flags(this));
+
+		while (this) {
+			printk("0x%08x(%d)->", ref_offset(this), ref_flags(this));
 			if (++i == 5) {
 				printk("\n" KERN_DEBUG);
-				i=0;
+				i = 0;
 			}
 			this = this->next_in_ino;
 		}
@@ -287,10 +287,10 @@
 {
 	struct jffs2_raw_node_ref *ref;
 	D1(printk(KERN_DEBUG "Freeing all node refs for eraseblock offset 0x%08x\n", jeb->offset));
-	while(jeb->first_node) {
+	while (jeb->first_node) {
 		ref = jeb->first_node;
 		jeb->first_node = ref->next_phys;
-		
+
 		/* Remove from the inode-list */
 		if (ref->next_in_ino)
 			jffs2_remove_node_refs_from_ino_list(c, ref, jeb);
@@ -307,7 +307,7 @@
 	uint32_t ofs;
 	size_t retlen;
 	int ret = -EIO;
-	
+
 	ebuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!ebuf) {
 		printk(KERN_WARNING "Failed to allocate page buffer for verifying erase at 0x%08x. Refiling\n", jeb->offset);
@@ -316,7 +316,7 @@
 
 	D1(printk(KERN_DEBUG "Verifying erase at 0x%08x\n", jeb->offset));
 
-	for (ofs = jeb->offset; ofs < jeb->offset + c->sector_size; ) {
+	for (ofs = jeb->offset; ofs < jeb->offset + c->sector_size;) {
 		uint32_t readlen = min((uint32_t)PAGE_SIZE, jeb->offset + c->sector_size - ofs);
 		int i;
 
@@ -331,7 +331,7 @@
 			printk(KERN_WARNING "Short read from newly-erased block at 0x%08x. Wanted %d, got %zd\n", ofs, readlen, retlen);
 			goto fail;
 		}
-		for (i=0; i<readlen; i += sizeof(unsigned long)) {
+		for (i = 0; i < readlen; i += sizeof(unsigned long)) {
 			/* It's OK. We know it's properly aligned */
 			unsigned long *datum = ebuf + i;
 			if (*datum + 1) {
@@ -361,7 +361,7 @@
 	case -EIO:	goto filebad;
 	}
 
-	/* Write the erase complete marker */	
+	/* Write the erase complete marker */
 	D1(printk(KERN_DEBUG "Writing erased marker to block at 0x%08x\n", jeb->offset));
 	bad_offset = jeb->offset;
 
@@ -399,7 +399,7 @@
 		vecs[0].iov_base = (unsigned char *) &marker;
 		vecs[0].iov_len = sizeof(marker);
 		ret = jffs2_flash_direct_writev(c, vecs, 1, jeb->offset, &retlen);
-		
+
 		if (ret || retlen != sizeof(marker)) {
 			if (ret)
 				printk(KERN_WARNING "Write clean marker to block at 0x%08x failed: %d\n",
@@ -416,9 +416,9 @@
 		marker_ref->next_phys = NULL;
 		marker_ref->flash_offset = jeb->offset | REF_NORMAL;
 		marker_ref->__totlen = c->cleanmarker_size;
-			
+
 		jeb->first_node = jeb->last_node = marker_ref;
-			
+
 		jeb->free_size = c->sector_size - c->cleanmarker_size;
 		jeb->used_size = c->cleanmarker_size;
 		jeb->dirty_size = 0;
@@ -430,7 +430,7 @@
 	c->free_size += jeb->free_size;
 	c->used_size += jeb->used_size;
 
-	jffs2_dbg_acct_sanity_check_nolock(c,jeb);
+	jffs2_dbg_acct_sanity_check_nolock(c, jeb);
 	jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
 
 	list_add_tail(&jeb->list, &c->free_list);
diff -uNr mtd/fs/jffs2/file.c mtd-whitespace/fs/jffs2/file.c
--- mtd/fs/jffs2/file.c	2005-09-07 13:04:13.000000000 -0600
+++ mtd-whitespace/fs/jffs2/file.c	2005-09-22 16:35:18.990330536 -0600
@@ -37,8 +37,8 @@
 
 	/* Trigger GC to flush any pending writes for this inode */
 	jffs2_flush_wbuf_gc(c, inode->i_ino);
-			
-	return 0;	
+
+	return 0;
 }
 
 struct file_operations jffs2_file_operations =
@@ -62,12 +62,12 @@
 
 struct address_space_operations jffs2_file_address_operations =
 {
-	.readpage =	jffs2_readpage,
-	.prepare_write =jffs2_prepare_write,
-	.commit_write =	jffs2_commit_write
+	.readpage =		jffs2_readpage,
+	.prepare_write =	jffs2_prepare_write,
+	.commit_write =		jffs2_commit_write
 };
 
-static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
+static int jffs2_do_readpage_nolock(struct inode *inode, struct page *pg)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
@@ -105,20 +105,19 @@
 	return ret;
 }
 
-
-static int jffs2_readpage (struct file *filp, struct page *pg)
+static int jffs2_readpage(struct file *filp, struct page *pg)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(pg->mapping->host);
 	int ret;
-	
+
 	down(&f->sem);
 	ret = jffs2_do_readpage_unlock(pg->mapping->host, pg);
 	up(&f->sem);
 	return ret;
 }
 
-static int jffs2_prepare_write (struct file *filp, struct page *pg,
-				unsigned start, unsigned end)
+static int jffs2_prepare_write(struct file *filp, struct page *pg,
+			       unsigned start, unsigned end)
 {
 	struct inode *inode = pg->mapping->host;
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
@@ -133,7 +132,7 @@
 		struct jffs2_raw_inode ri;
 		struct jffs2_full_dnode *fn;
 		uint32_t phys_ofs, alloc_len;
-		
+
 		D1(printk(KERN_DEBUG "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
 			  (unsigned int)inode->i_size, pageofs));
 
@@ -163,7 +162,7 @@
 		ri.compr = JFFS2_COMPR_ZERO;
 		ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
 		ri.data_crc = cpu_to_je32(0);
-		
+
 		fn = jffs2_write_dnode(c, f, &ri, NULL, 0, phys_ofs, ALLOC_NORMAL);
 
 		if (IS_ERR(fn)) {
@@ -190,7 +189,7 @@
 		inode->i_size = pageofs;
 		up(&f->sem);
 	}
-	
+
 	/* Read in the page if it wasn't already present, unless it's a whole page */
 	if (!PageUptodate(pg) && (start || end < PAGE_CACHE_SIZE)) {
 		down(&f->sem);
@@ -201,8 +200,8 @@
 	return ret;
 }
 
-static int jffs2_commit_write (struct file *filp, struct page *pg,
-			       unsigned start, unsigned end)
+static int jffs2_commit_write(struct file *filp, struct page *pg,
+			      unsigned start, unsigned end)
 {
 	/* Actually commit the write from the page cache page we're looking at.
 	 * For now, we write the full page out each time. It sucks, but it's simple
@@ -221,7 +220,7 @@
 	if (!start && end == PAGE_CACHE_SIZE) {
 		/* We need to avoid deadlock with page_cache_read() in
 		   jffs2_garbage_collect_pass(). So we have to mark the
-		   page up to date, to prevent page_cache_read() from 
+		   page up to date, to prevent page_cache_read() from
 		   trying to re-lock it. */
 		SetPageUptodate(pg);
 	}
@@ -255,7 +254,7 @@
 		/* There was an error writing. */
 		SetPageError(pg);
 	}
-	
+
 	/* Adjust writtenlen for the padding we did, so we don't confuse our caller */
 	if (writtenlen < (start&3))
 		writtenlen = 0;
@@ -266,7 +265,7 @@
 		if (inode->i_size < (pg->index << PAGE_CACHE_SHIFT) + start + writtenlen) {
 			inode->i_size = (pg->index << PAGE_CACHE_SHIFT) + start + writtenlen;
 			inode->i_blocks = (inode->i_size + 511) >> 9;
-			
+
 			inode->i_ctime = inode->i_mtime = ITIME(je32_to_cpu(ri->ctime));
 		}
 	}
@@ -275,13 +274,13 @@
 
 	if (start+writtenlen < end) {
 		/* generic_file_write has written more to the page cache than we've
-		   actually written to the medium. Mark the page !Uptodate so that 
+		   actually written to the medium. Mark the page !Uptodate so that
 		   it gets reread */
 		D1(printk(KERN_DEBUG "jffs2_commit_write(): Not all bytes written. Marking page !uptodate\n"));
 		SetPageError(pg);
 		ClearPageUptodate(pg);
 	}
 
-	D1(printk(KERN_DEBUG "jffs2_commit_write() returning %d\n",writtenlen?writtenlen:ret));
+	D1(printk(KERN_DEBUG "jffs2_commit_write() returning %d\n", writtenlen ? writtenlen : ret));
 	return writtenlen?writtenlen:ret;
 }
diff -uNr mtd/fs/jffs2/fs.c mtd-whitespace/fs/jffs2/fs.c
--- mtd/fs/jffs2/fs.c	2005-09-07 13:04:13.000000000 -0600
+++ mtd-whitespace/fs/jffs2/fs.c	2005-09-22 16:49:19.056621048 -0600
@@ -26,7 +26,7 @@
 
 static int jffs2_flash_setup(struct jffs2_sb_info *c);
 
-static int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
+static int jffs2_do_setattr(struct inode *inode, struct iattr *iattr)
 {
 	struct jffs2_full_dnode *old_metadata, *new_metadata;
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
@@ -40,7 +40,7 @@
 	int ret;
 	D1(printk(KERN_DEBUG "jffs2_setattr(): ino #%lu\n", inode->i_ino));
 	ret = inode_change_ok(inode, iattr);
-	if (ret) 
+	if (ret)
 		return ret;
 
 	/* Special cases - we don't want more than one data node
@@ -73,7 +73,7 @@
 			kfree(mdata);
 		return -ENOMEM;
 	}
-		
+
 	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen,
 				ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 	if (ret) {
@@ -84,7 +84,7 @@
 	}
 	down(&f->sem);
 	ivalid = iattr->ia_valid;
-	
+
 	ri->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	ri->nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE);
 	ri->totlen = cpu_to_je32(sizeof(*ri) + mdatalen);
@@ -100,7 +100,7 @@
 		if (iattr->ia_mode & S_ISGID &&
 		    !in_group_p(je16_to_cpu(ri->gid)) && !capable(CAP_FSETID))
 			ri->mode = cpu_to_jemode(iattr->ia_mode & ~S_ISGID);
-		else 
+		else
 			ri->mode = cpu_to_jemode(iattr->ia_mode);
 	else
 		ri->mode = cpu_to_jemode(inode->i_mode);
@@ -129,7 +129,7 @@
 	new_metadata = jffs2_write_dnode(c, f, ri, mdata, mdatalen, phys_ofs, ALLOC_NORMAL);
 	if (S_ISLNK(inode->i_mode))
 		kfree(mdata);
-	
+
 	if (IS_ERR(new_metadata)) {
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_inode(ri);
@@ -144,7 +144,6 @@
 	inode->i_uid = je16_to_cpu(ri->uid);
 	inode->i_gid = je16_to_cpu(ri->gid);
 
-
 	old_metadata = f->metadata;
 
 	if (ivalid & ATTR_SIZE && inode->i_size > iattr->ia_size)
@@ -167,7 +166,7 @@
 	jffs2_complete_reservation(c);
 
 	/* We have to do the vmtruncate() without f->sem held, since
-	   some pages may be locked and waiting for it in readpage(). 
+	   some pages may be locked and waiting for it in readpage().
 	   We are protected from a simultaneous write() extending i_size
 	   back past iattr->ia_size, because do_truncate() holds the
 	   generic inode semaphore. */
@@ -210,12 +209,12 @@
 
 void jffs2_clear_inode (struct inode *inode)
 {
-	/* We can forget about this inode for now - drop all 
+	/* We can forget about this inode for now - drop all
 	 *  the nodelists associated with it, etc.
 	 */
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
-	
+
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
 
 	jffs2_do_clear_inode(c, f);
@@ -234,7 +233,7 @@
 	c = JFFS2_SB_INFO(inode->i_sb);
 
 	jffs2_init_inode_info(f);
-	
+
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
 
 	if (ret) {
@@ -254,19 +253,19 @@
 
 	inode->i_blksize = PAGE_SIZE;
 	inode->i_blocks = (inode->i_size + 511) >> 9;
-	
+
 	switch (inode->i_mode & S_IFMT) {
 		jint16_t rdev;
 
 	case S_IFLNK:
 		inode->i_op = &jffs2_symlink_inode_operations;
 		break;
-		
+
 	case S_IFDIR:
 	{
 		struct jffs2_full_dirent *fd;
 
-		for (fd=f->dents; fd; fd = fd->next) {
+		for (fd = f->dents; fd; fd = fd->next) {
 			if (fd->type == DT_DIR && fd->ino)
 				inode->i_nlink++;
 		}
@@ -298,7 +297,7 @@
 			jffs2_do_clear_inode(c, f);
 			make_bad_inode(inode);
 			return;
-		}			
+		}
 
 	case S_IFSOCK:
 	case S_IFIFO:
@@ -338,7 +337,7 @@
 	jffs2_do_setattr(inode, &iattr);
 }
 
-int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
+int jffs2_remount_fs(struct super_block *sb, int *flags, char *data)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
@@ -354,17 +353,17 @@
 		down(&c->alloc_sem);
 		jffs2_flush_wbuf_pad(c);
 		up(&c->alloc_sem);
-	}	
+	}
 
 	if (!(*flags & MS_RDONLY))
 		jffs2_start_garbage_collect_thread(c);
-	
+
 	*flags |= MS_NOATIME;
 
 	return 0;
 }
 
-void jffs2_write_super (struct super_block *sb)
+void jffs2_write_super(struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 	sb->s_dirt = 0;
@@ -381,7 +380,7 @@
 
 /* jffs2_new_inode: allocate a new inode and inocache, add it to the hash,
    fill in the raw_inode while you're at it. */
-struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_inode *ri)
+struct inode *jffs2_new_inode(struct inode *dir_i, int mode, struct jffs2_raw_inode *ri)
 {
 	struct inode *inode;
 	struct super_block *sb = dir_i->i_sb;
@@ -392,9 +391,9 @@
 	D1(printk(KERN_DEBUG "jffs2_new_inode(): dir_i %ld, mode 0x%x\n", dir_i->i_ino, mode));
 
 	c = JFFS2_SB_INFO(sb);
-	
+
 	inode = new_inode(sb);
-	
+
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
@@ -458,14 +457,14 @@
 #endif
 
 	c->flash_size = c->mtd->size;
-	c->sector_size = c->mtd->erasesize; 
+	c->sector_size = c->mtd->erasesize;
 	blocks = c->flash_size / c->sector_size;
 
 	/*
 	 * Size alignment check
 	 */
 	if ((c->sector_size * blocks) != c->flash_size) {
-		c->flash_size = c->sector_size * blocks;		
+		c->flash_size = c->sector_size * blocks;
 		printk(KERN_INFO "jffs2: Flash size not aligned to erasesize, reducing to %dKiB\n",
 			c->flash_size / 1024);
 	}
@@ -532,28 +531,28 @@
 }
 
 void jffs2_gc_release_inode(struct jffs2_sb_info *c,
-				   struct jffs2_inode_info *f)
+			    struct jffs2_inode_info *f)
 {
 	iput(OFNI_EDONI_2SFFJ(f));
 }
 
 struct jffs2_inode_info *jffs2_gc_fetch_inode(struct jffs2_sb_info *c,
-						     int inum, int nlink)
+					      int inum, int nlink)
 {
 	struct inode *inode;
 	struct jffs2_inode_cache *ic;
 	if (!nlink) {
 		/* The inode has zero nlink but its nodes weren't yet marked
-		   obsolete. This has to be because we're still waiting for 
+		   obsolete. This has to be because we're still waiting for
 		   the final (close() and) iput() to happen.
 
-		   There's a possibility that the final iput() could have 
+		   There's a possibility that the final iput() could have
 		   happened while we were contemplating. In order to ensure
 		   that we don't cause a new read_inode() (which would fail)
 		   for the inode in question, we use ilookup() in this case
 		   instead of iget().
 
-		   The nlink can't _become_ zero at this point because we're 
+		   The nlink can't _become_ zero at this point because we're
 		   holding the alloc_sem, and jffs2_do_unlink() would also
 		   need that while decrementing nlink on any inode.
 		*/
@@ -600,19 +599,19 @@
 	return JFFS2_INODE_INFO(inode);
 }
 
-unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c, 
-				   struct jffs2_inode_info *f, 
+unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
+				   struct jffs2_inode_info *f,
 				   unsigned long offset,
 				   unsigned long *priv)
 {
 	struct inode *inode = OFNI_EDONI_2SFFJ(f);
 	struct page *pg;
 
-	pg = read_cache_page(inode->i_mapping, offset >> PAGE_CACHE_SHIFT, 
+	pg = read_cache_page(inode->i_mapping, offset >> PAGE_CACHE_SHIFT,
 			     (void *)jffs2_do_readpage_unlock, inode);
 	if (IS_ERR(pg))
 		return (void *)pg;
-	
+
 	*priv = (unsigned long)pg;
 	return kmap(pg);
 }
@@ -627,9 +626,10 @@
 	page_cache_release(pg);
 }
 
-static int jffs2_flash_setup(struct jffs2_sb_info *c) {
+static int jffs2_flash_setup(struct jffs2_sb_info *c)
+{
 	int ret = 0;
-	
+
 	if (jffs2_cleanmarker_oob(c)) {
 		/* NAND flash... do setup accordingly */
 		ret = jffs2_nand_flash_setup(c);
@@ -643,7 +643,7 @@
 		if (ret)
 			return ret;
 	}
-	
+
 	/* and Dataflash */
 	if (jffs2_dataflash(c)) {
 		ret = jffs2_dataflash_setup(c);
@@ -661,8 +661,8 @@
 	return ret;
 }
 
-void jffs2_flash_cleanup(struct jffs2_sb_info *c) {
-
+void jffs2_flash_cleanup(struct jffs2_sb_info *c)
+{
 	if (jffs2_cleanmarker_oob(c)) {
 		jffs2_nand_flash_cleanup(c);
 	}
@@ -671,7 +671,7 @@
 	if (jffs2_nor_ecc(c)) {
 		jffs2_nor_ecc_flash_cleanup(c);
 	}
-	
+
 	/* and DataFlash */
 	if (jffs2_dataflash(c)) {
 		jffs2_dataflash_cleanup(c);
diff -uNr mtd/fs/jffs2/gc.c mtd-whitespace/fs/jffs2/gc.c
--- mtd/fs/jffs2/gc.c	2005-09-07 13:04:13.000000000 -0600
+++ mtd-whitespace/fs/jffs2/gc.c	2005-09-22 16:58:23.945785304 -0600
@@ -21,14 +21,14 @@
 #include "nodelist.h"
 #include "compr.h"
 
-static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c, 
+static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c,
 					  struct jffs2_inode_cache *ic,
 					  struct jffs2_raw_node_ref *raw);
-static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 					struct jffs2_inode_info *f, struct jffs2_full_dnode *fd);
-static int jffs2_garbage_collect_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_garbage_collect_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 					struct jffs2_inode_info *f, struct jffs2_full_dirent *fd);
-static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 					struct jffs2_inode_info *f, struct jffs2_full_dirent *fd);
 static int jffs2_garbage_collect_hole(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				      struct jffs2_inode_info *f, struct jffs2_full_dnode *fn,
@@ -37,7 +37,7 @@
 				       struct jffs2_inode_info *f, struct jffs2_full_dnode *fn,
 				       uint32_t start, uint32_t end);
 static int jffs2_garbage_collect_live(struct jffs2_sb_info *c,  struct jffs2_eraseblock *jeb,
-			       struct jffs2_raw_node_ref *raw, struct jffs2_inode_info *f);
+				      struct jffs2_raw_node_ref *raw, struct jffs2_inode_info *f);
 
 /* Called with erase_completion_lock held */
 static struct jffs2_eraseblock *jffs2_find_gc_block(struct jffs2_sb_info *c)
@@ -55,7 +55,7 @@
 		D1(printk(KERN_DEBUG "Picking block from bad_used_list to GC next\n"));
 		nextlist = &c->bad_used_list;
 	} else if (n < 50 && !list_empty(&c->erasable_list)) {
-		/* Note that most of them will have gone directly to be erased. 
+		/* Note that most of them will have gone directly to be erased.
 		   So don't favour the erasable_list _too_ much. */
 		D1(printk(KERN_DEBUG "Picking block from erasable_list to GC next\n"));
 		nextlist = &c->erasable_list;
@@ -101,7 +101,7 @@
 		printk(KERN_WARNING "Eep. ret->gc_node for block at 0x%08x is NULL\n", ret->offset);
 		BUG();
 	}
-	
+
 	/* Have we accidentally picked a clean block with wasted space ? */
 	if (ret->wasted_size) {
 		D1(printk(KERN_DEBUG "Converting wasted_size %08x to dirty_size\n", ret->wasted_size));
@@ -136,7 +136,7 @@
 
 		/* We can't start doing GC yet. We haven't finished checking
 		   the node CRCs etc. Do it now. */
-		
+
 		/* checked_ino is protected by the alloc_sem */
 		if (c->checked_ino > c->highest_ino) {
 			printk(KERN_CRIT "Checked all inodes but still 0x%x bytes of unchecked space?\n",
@@ -178,7 +178,7 @@
 
 		case INO_STATE_READING:
 			/* We need to wait for it to finish, lest we move on
-			   and trigger the BUG() above while we haven't yet 
+			   and trigger the BUG() above while we haven't yet
 			   finished checking all its nodes */
 			D1(printk(KERN_DEBUG "Waiting for ino #%u to finish reading\n", ic->ino));
 			up(&c->alloc_sem);
@@ -218,9 +218,12 @@
 		return -EIO;
 	}
 
-	D1(printk(KERN_DEBUG "GC from block %08x, used_size %08x, dirty_size %08x, free_size %08x\n", jeb->offset, jeb->used_size, jeb->dirty_size, jeb->free_size));
+	D1(printk(KERN_DEBUG "GC from block %08x, used_size %08x, dirty_size %08x, free_size %08x\n",
+		  jeb->offset, jeb->used_size, jeb->dirty_size, jeb->free_size));
 	D1(if (c->nextblock)
-	   printk(KERN_DEBUG "Nextblock at  %08x, used_size %08x, dirty_size %08x, wasted_size %08x, free_size %08x\n", c->nextblock->offset, c->nextblock->used_size, c->nextblock->dirty_size, c->nextblock->wasted_size, c->nextblock->free_size));
+		printk(KERN_DEBUG "Nextblock at  %08x, used_size %08x, dirty_size %08x, wasted_size %08x, free_size %08x\n",
+		       c->nextblock->offset, c->nextblock->used_size, c->nextblock->dirty_size, c->nextblock->wasted_size, c->nextblock->free_size)
+	);
 
 	if (!jeb->used_size) {
 		up(&c->alloc_sem);
@@ -228,13 +231,13 @@
 	}
 
 	raw = jeb->gc_node;
-			
-	while(ref_obsolete(raw)) {
+
+	while (ref_obsolete(raw)) {
 		D1(printk(KERN_DEBUG "Node at 0x%08x is obsolete... skipping\n", ref_offset(raw)));
 		raw = raw->next_phys;
 		if (unlikely(!raw)) {
 			printk(KERN_WARNING "eep. End of raw list while still supposedly nodes to GC\n");
-			printk(KERN_WARNING "erase block at 0x%08x. free_size 0x%08x, dirty_size 0x%08x, used_size 0x%08x\n", 
+			printk(KERN_WARNING "erase block at 0x%08x. free_size 0x%08x, dirty_size 0x%08x, used_size 0x%08x\n",
 			       jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size);
 			jeb->gc_node = raw;
 			spin_unlock(&c->erase_completion_lock);
@@ -259,7 +262,7 @@
 	ic = jffs2_raw_ref_to_ic(raw);
 
 	/* We need to hold the inocache. Either the erase_completion_lock or
-	   the inocache_lock are sufficient; we trade down since the inocache_lock 
+	   the inocache_lock are sufficient; we trade down since the inocache_lock
 	   causes less contention. */
 	spin_lock(&c->inocache_lock);
 
@@ -278,14 +281,14 @@
 
 	switch(ic->state) {
 	case INO_STATE_CHECKEDABSENT:
-		/* It's been checked, but it's not currently in-core. 
+		/* It's been checked, but it's not currently in-core.
 		   We can just copy any pristine nodes, but have
 		   to prevent anyone else from doing read_inode() while
 		   we're at it, so we set the state accordingly */
 		if (ref_flags(raw) == REF_PRISTINE)
 			ic->state = INO_STATE_GC;
 		else {
-			D1(printk(KERN_DEBUG "Ino #%u is absent but node not REF_PRISTINE. Reading.\n", 
+			D1(printk(KERN_DEBUG "Ino #%u is absent but node not REF_PRISTINE. Reading.\n",
 				  ic->ino));
 		}
 		break;
@@ -298,8 +301,8 @@
 	case INO_STATE_CHECKING:
 	case INO_STATE_GC:
 		/* Should never happen. We should have finished checking
-		   by the time we actually start doing any GC, and since 
-		   we're holding the alloc_sem, no other garbage collection 
+		   by the time we actually start doing any GC, and since
+		   we're holding the alloc_sem, no other garbage collection
 		   can happen.
 		*/
 		printk(KERN_CRIT "Inode #%u already in state %d in jffs2_garbage_collect_pass()!\n",
@@ -319,21 +322,21 @@
 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_pass() waiting for ino #%u in state %d\n",
 			  ic->ino, ic->state));
 		sleep_on_spinunlock(&c->inocache_wq, &c->inocache_lock);
-		/* And because we dropped the alloc_sem we must start again from the 
+		/* And because we dropped the alloc_sem we must start again from the
 		   beginning. Ponder chance of livelock here -- we're returning success
 		   without actually making any progress.
 
-		   Q: What are the chances that the inode is back in INO_STATE_READING 
+		   Q: What are the chances that the inode is back in INO_STATE_READING
 		   again by the time we next enter this function? And that this happens
 		   enough times to cause a real delay?
 
-		   A: Small enough that I don't care :) 
+		   A: Small enough that I don't care :)
 		*/
 		return 0;
 	}
 
 	/* OK. Now if the inode is in state INO_STATE_GC, we are going to copy the
-	   node intact, and we don't have to muck about with the fragtree etc. 
+	   node intact, and we don't have to muck about with the fragtree etc.
 	   because we know it's not in-core. If it _was_ in-core, we go through
 	   all the iget() crap anyway */
 
@@ -453,12 +456,12 @@
 			if (!ret) {
 				/* Urgh. Return it sensibly. */
 				frag->node->raw = f->inocache->nodes;
-			}	
+			}
 			if (ret != -EBADFD)
 				goto upnout;
 		}
 		/* We found a datanode. Do the GC */
-		if((start >> PAGE_CACHE_SHIFT) < ((end-1) >> PAGE_CACHE_SHIFT)) {
+		if ((start >> PAGE_CACHE_SHIFT) < ((end-1) >> PAGE_CACHE_SHIFT)) {
 			/* It crosses a page boundary. Therefore, it must be a hole. */
 			ret = jffs2_garbage_collect_hole(c, jeb, f, fn, start, end);
 		} else {
@@ -467,9 +470,9 @@
 		}
 		goto upnout;
 	}
-	
+
 	/* Wasn't a dnode. Try dirent */
-	for (fd = f->dents; fd; fd=fd->next) {
+	for (fd = f->dents; fd; fd = fd->next) {
 		if (fd->raw == raw)
 			break;
 	}
@@ -494,7 +497,7 @@
 	return ret;
 }
 
-static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c, 
+static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c,
 					  struct jffs2_inode_cache *ic,
 					  struct jffs2_raw_node_ref *raw)
 {
@@ -580,7 +583,7 @@
 		}
 		break;
 	default:
-		printk(KERN_WARNING "Unknown node type for REF_PRISTINE node at 0x%08x: 0x%04x\n", 
+		printk(KERN_WARNING "Unknown node type for REF_PRISTINE node at 0x%08x: 0x%04x\n",
 		       ref_offset(raw), je16_to_cpu(node->u.nodetype));
 		goto bail;
 	}
@@ -621,8 +624,8 @@
 			retried = 1;
 
 			D1(printk(KERN_DEBUG "Retrying failed write of REF_PRISTINE node.\n"));
-			
-			jffs2_dbg_acct_sanity_check(c,jeb);
+
+			jffs2_dbg_acct_sanity_check(c, jeb);
 			jffs2_dbg_acct_paranoia_check(c, jeb);
 
 			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy, rawlen);
@@ -632,7 +635,7 @@
 			if (!ret) {
 				D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed write.\n", phys_ofs));
 
-				jffs2_dbg_acct_sanity_check(c,jeb);
+				jffs2_dbg_acct_sanity_check(c, jeb);
 				jffs2_dbg_acct_paranoia_check(c, jeb);
 
 				goto retry;
@@ -654,8 +657,8 @@
 	   for an inode which is in-core, the 'nraw' pointer is then
 	   going to be fetched from ic->nodes by our caller. */
 	spin_lock(&c->erase_completion_lock);
-        nraw->next_in_ino = ic->nodes;
-        ic->nodes = nraw;
+	nraw->next_in_ino = ic->nodes;
+	ic->nodes = nraw;
 	spin_unlock(&c->erase_completion_lock);
 
 	jffs2_mark_node_obsolete(c, raw);
@@ -669,7 +672,7 @@
 	goto out_node;
 }
 
-static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 					struct jffs2_inode_info *f, struct jffs2_full_dnode *fn)
 {
 	struct jffs2_full_dnode *new_fn;
@@ -681,10 +684,10 @@
 	int ret;
 
 	if (S_ISBLK(JFFS2_F_I_MODE(f)) ||
-	    S_ISCHR(JFFS2_F_I_MODE(f)) ) {
+	    S_ISCHR(JFFS2_F_I_MODE(f))) {
 		/* For these, we don't actually need to read the old node */
 		/* FIXME: for minor or major > 255. */
-		dev = cpu_to_je16(((JFFS2_F_I_RDEV_MAJ(f) << 8) | 
+		dev = cpu_to_je16(((JFFS2_F_I_RDEV_MAJ(f) << 8) |
 			JFFS2_F_I_RDEV_MIN(f)));
 		mdata = (char *)&dev;
 		mdatalen = sizeof(dev);
@@ -705,7 +708,7 @@
 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_metadata(): Writing %d bites of symlink target\n", mdatalen));
 
 	}
-	
+
 	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen,
 				JFFS2_SUMMARY_INODE_SIZE);
 	if (ret) {
@@ -713,7 +716,7 @@
 		       sizeof(ri)+ mdatalen, ret);
 		goto out;
 	}
-	
+
 	last_frag = frag_last(&f->fragtree);
 	if (last_frag)
 		/* Fetch the inode length from the fragtree rather then
@@ -721,7 +724,7 @@
 		ilen = last_frag->ofs + last_frag->size;
 	else
 		ilen = JFFS2_F_I_SIZE(f);
-	
+
 	memset(&ri, 0, sizeof(ri));
 	ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	ri.nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE);
@@ -760,7 +763,7 @@
 	return ret;
 }
 
-static int jffs2_garbage_collect_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_garbage_collect_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 					struct jffs2_inode_info *f, struct jffs2_full_dirent *fd)
 {
 	struct jffs2_full_dirent *new_fd;
@@ -781,12 +784,12 @@
 	   so refrain from splatting them. */
 	if (JFFS2_F_I_MTIME(f) == JFFS2_F_I_CTIME(f))
 		rd.mctime = cpu_to_je32(JFFS2_F_I_MTIME(f));
-	else 
+	else
 		rd.mctime = cpu_to_je32(0);
 	rd.type = fd->type;
 	rd.node_crc = cpu_to_je32(crc32(0, &rd, sizeof(rd)-8));
 	rd.name_crc = cpu_to_je32(crc32(0, fd->name, rd.nsize));
-	
+
 	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen,
 				JFFS2_SUMMARY_DIRENT_SIZE(rd.nsize));
 	if (ret) {
@@ -804,7 +807,7 @@
 	return 0;
 }
 
-static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 					struct jffs2_inode_info *f, struct jffs2_full_dirent *fd)
 {
 	struct jffs2_full_dirent **fdp = &f->dents;
@@ -843,7 +846,7 @@
 			if (ref_totlen(c, NULL, raw) != rawlen)
 				continue;
 
-			/* Doesn't matter if there's one in the same erase block. We're going to 
+			/* Doesn't matter if there's one in the same erase block. We're going to
 			   delete it too at the same time. */
 			if (SECTOR_ADDR(raw->flash_offset) == SECTOR_ADDR(fd->raw->flash_offset))
 				continue;
@@ -895,7 +898,7 @@
 		kfree(rd);
 	}
 
-	/* FIXME: If we're deleting a dirent which contains the current mtime and ctime, 
+	/* FIXME: If we're deleting a dirent which contains the current mtime and ctime,
 	   we should update the metadata node with those times accordingly */
 
 	/* No need for it any more. Just mark it obsolete and remove it from the list */
@@ -907,9 +910,9 @@
 		}
 		fdp = &(*fdp)->next;
 	}
-	if (!found) {
+	if (!found)
 		printk(KERN_WARNING "Deletion dirent \"%s\" not found in list for ino #%u\n", fd->name, f->inocache->ino);
-	}
+
 	jffs2_mark_node_obsolete(c, fd->raw);
 	jffs2_free_full_dirent(fd);
 	return 0;
@@ -927,13 +930,13 @@
 
 	D1(printk(KERN_DEBUG "Writing replacement hole node for ino #%u from offset 0x%x to 0x%x\n",
 		  f->inocache->ino, start, end));
-	
+
 	memset(&ri, 0, sizeof(ri));
 
-	if(fn->frags > 1) {
+	if (fn->frags > 1) {
 		size_t readlen;
 		uint32_t crc;
-		/* It's partially obsoleted by a later write. So we have to 
+		/* It's partially obsoleted by a later write. So we have to
 		   write it out again with the _same_ version as before */
 		ret = jffs2_flash_read(c, ref_offset(fn->raw), sizeof(ri), &readlen, (char *)&ri);
 		if (readlen != sizeof(ri) || ret) {
@@ -955,16 +958,16 @@
 		crc = crc32(0, &ri, sizeof(ri)-8);
 		if (crc != je32_to_cpu(ri.node_crc)) {
 			printk(KERN_WARNING "jffs2_garbage_collect_hole: Node at 0x%08x had CRC 0x%08x which doesn't match calculated CRC 0x%08x\n",
-			       ref_offset(fn->raw), 
+			       ref_offset(fn->raw),
 			       je32_to_cpu(ri.node_crc), crc);
 			/* FIXME: We could possibly deal with this by writing new holes for each frag */
-			printk(KERN_WARNING "Data in the range 0x%08x to 0x%08x of inode #%u will be lost\n", 
+			printk(KERN_WARNING "Data in the range 0x%08x to 0x%08x of inode #%u will be lost\n",
 			       start, end, f->inocache->ino);
 			goto fill;
 		}
 		if (ri.compr != JFFS2_COMPR_ZERO) {
 			printk(KERN_WARNING "jffs2_garbage_collect_hole: Node 0x%08x wasn't a hole node!\n", ref_offset(fn->raw));
-			printk(KERN_WARNING "Data in the range 0x%08x to 0x%08x of inode #%u will be lost\n", 
+			printk(KERN_WARNING "Data in the range 0x%08x to 0x%08x of inode #%u will be lost\n",
 			       start, end, f->inocache->ino);
 			goto fill;
 		}
@@ -982,7 +985,7 @@
 		ri.csize = cpu_to_je32(0);
 		ri.compr = JFFS2_COMPR_ZERO;
 	}
-	
+
 	frag = frag_last(&f->fragtree);
 	if (frag)
 		/* Fetch the inode length from the fragtree rather then
@@ -1024,13 +1027,13 @@
 		return 0;
 	}
 
-	/* 
+	/*
 	 * We should only get here in the case where the node we are
 	 * replacing had more than one frag, so we kept the same version
-	 * number as before. (Except in case of error -- see 'goto fill;' 
+	 * number as before. (Except in case of error -- see 'goto fill;'
 	 * above.)
 	 */
-	D1(if(unlikely(fn->frags <= 1)) {
+	D1(if (unlikely(fn->frags <= 1)) {
 		printk(KERN_WARNING "jffs2_garbage_collect_hole: Replacing fn with %d frag(s) but new ver %d != highest_version %d of ino #%d\n",
 		       fn->frags, je32_to_cpu(ri.version), f->highest_version,
 		       je32_to_cpu(ri.ino));
@@ -1039,7 +1042,7 @@
 	/* This is a partially-overlapped hole node. Mark it REF_NORMAL not REF_PRISTINE */
 	mark_ref_normal(new_fn->raw);
 
-	for (frag = jffs2_lookup_node_frag(&f->fragtree, fn->ofs); 
+	for (frag = jffs2_lookup_node_frag(&f->fragtree, fn->ofs);
 	     frag; frag = frag_next(frag)) {
 		if (frag->ofs > fn->size + fn->ofs)
 			break;
@@ -1057,10 +1060,10 @@
 		printk(KERN_WARNING "jffs2_garbage_collect_hole: New node has no frags!\n");
 		BUG();
 	}
-		
+
 	jffs2_mark_node_obsolete(c, fn->raw);
 	jffs2_free_full_dnode(fn);
-	
+
 	return 0;
 }
 
@@ -1070,12 +1073,12 @@
 {
 	struct jffs2_full_dnode *new_fn;
 	struct jffs2_raw_inode ri;
-	uint32_t alloclen, phys_ofs, offset, orig_end, orig_start;	
+	uint32_t alloclen, phys_ofs, offset, orig_end, orig_start;
 	int ret = 0;
 	unsigned char *comprbuf = NULL, *writebuf;
 	unsigned long pg;
 	unsigned char *pg_ptr;
- 
+
 	memset(&ri, 0, sizeof(ri));
 
 	D1(printk(KERN_DEBUG "Writing replacement dnode for ino #%u from offset 0x%x to 0x%x\n",
@@ -1087,8 +1090,8 @@
 	if (c->nr_free_blocks + c->nr_erasing_blocks > c->resv_blocks_gcmerge) {
 		/* Attempt to do some merging. But only expand to cover logically
 		   adjacent frags if the block containing them is already considered
-		   to be dirty. Otherwise we end up with GC just going round in 
-		   circles dirtying the nodes it already wrote out, especially 
+		   to be dirty. Otherwise we end up with GC just going round in
+		   circles dirtying the nodes it already wrote out, especially
 		   on NAND where we have small eraseblocks and hence a much higher
 		   chance of nodes having to be split to cross boundaries. */
 
@@ -1105,7 +1108,7 @@
 		BUG_ON(frag->ofs != start);
 
 		/* First grow down... */
-		while((frag = frag_prev(frag)) && frag->ofs >= min) {
+		while ((frag = frag_prev(frag)) && frag->ofs >= min) {
 
 			/* If the previous frag doesn't even reach the beginning, there's
 			   excessive fragmentation. Just merge. */
@@ -1122,7 +1125,7 @@
 				break;
 			} else {
 
-				/* OK, it's a frag which extends to the beginning of the page. Does it live 
+				/* OK, it's a frag which extends to the beginning of the page. Does it live
 				   in a block which is still considered clean? If so, don't obsolete it.
 				   If not, cover it anyway. */
 
@@ -1155,7 +1158,7 @@
 		/* Find last frag which is actually part of the node we're to GC. */
 		frag = jffs2_lookup_node_frag(&f->fragtree, end-1);
 
-		while((frag = frag_next(frag)) && frag->ofs+frag->size <= max) {
+		while ((frag = frag_next(frag)) && frag->ofs+frag->size <= max) {
 
 			/* If the previous frag doesn't even reach the beginning, there's lots
 			   of fragmentation. Just merge. */
@@ -1172,7 +1175,7 @@
 				break;
 			} else {
 
-				/* OK, it's a frag which extends to the beginning of the page. Does it live 
+				/* OK, it's a frag which extends to the beginning of the page. Does it live
 				   in a block which is still considered clean? If so, don't obsolete it.
 				   If not, cover it anyway. */
 
@@ -1199,14 +1202,14 @@
 				break;
 			}
 		}
-		D1(printk(KERN_DEBUG "Expanded dnode to write from (0x%x-0x%x) to (0x%x-0x%x)\n", 
+		D1(printk(KERN_DEBUG "Expanded dnode to write from (0x%x-0x%x) to (0x%x-0x%x)\n",
 			  orig_start, orig_end, start, end));
 
 		D1(BUG_ON(end > frag_last(&f->fragtree)->ofs + frag_last(&f->fragtree)->size));
 		BUG_ON(end < orig_end);
 		BUG_ON(start > orig_start);
 	}
-	
+
 	/* First, use readpage() to read the appropriate page into the page cache */
 	/* Q: What happens if we actually try to GC the _same_ page for which commit_write()
 	 *    triggered garbage collection in the first place?
@@ -1222,7 +1225,7 @@
 	}
 
 	offset = start;
-	while(offset < orig_end) {
+	while (offset < orig_end) {
 		uint32_t datalen;
 		uint32_t cdatalen;
 		uint16_t comprtype = JFFS2_COMPR_NONE;
@@ -1263,7 +1266,7 @@
 		ri.usercompr = (comprtype >> 8) & 0xff;
 		ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
 		ri.data_crc = cpu_to_je32(crc32(0, comprbuf, cdatalen));
-	
+
 		new_fn = jffs2_write_dnode(c, f, &ri, comprbuf, cdatalen, phys_ofs, ALLOC_GC);
 
 		jffs2_free_comprbuf(comprbuf, writebuf);
diff -uNr mtd/fs/jffs2/histo.h mtd-whitespace/fs/jffs2/histo.h
--- mtd/fs/jffs2/histo.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/histo.h	2005-09-22 16:35:49.853638600 -0600
@@ -1,3 +1,3 @@
 /* This file provides the bit-probabilities for the input file */
-#define BIT_DIVIDER 629 
-static int bits[9] = { 179,167,183,165,159,198,178,119,}; /* ia32 .so files */
+#define BIT_DIVIDER 629
+static int bits[9] = { 179, 167, 183, 165, 159, 198, 178, 119, }; /* ia32 .so files */
diff -uNr mtd/fs/jffs2/histo_mips.h mtd-whitespace/fs/jffs2/histo_mips.h
--- mtd/fs/jffs2/histo_mips.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/histo_mips.h	2005-09-22 16:35:57.268511368 -0600
@@ -1,2 +1,2 @@
-#define BIT_DIVIDER_MIPS 1043 
-static int bits_mips[8] = { 277,249,290,267,229,341,212,241}; /* mips32 */
+#define BIT_DIVIDER_MIPS 1043
+static int bits_mips[8] = { 277, 249, 290, 267, 229, 341, 212, 241}; /* mips32 */
diff -uNr mtd/fs/jffs2/ioctl.c mtd-whitespace/fs/jffs2/ioctl.c
--- mtd/fs/jffs2/ioctl.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/ioctl.c	2005-09-22 13:39:05.863690104 -0600
@@ -13,11 +13,11 @@
 
 #include <linux/fs.h>
 
-int jffs2_ioctl(struct inode *inode, struct file *filp, unsigned int cmd, 
+int jffs2_ioctl(struct inode *inode, struct file *filp, unsigned int cmd,
 		unsigned long arg)
 {
 	/* Later, this will provide for lsattr.jffs2 and chattr.jffs2, which
 	   will include compression support etc. */
 	return -ENOTTY;
 }
-	
+
diff -uNr mtd/fs/jffs2/LICENCE mtd-whitespace/fs/jffs2/LICENCE
--- mtd/fs/jffs2/LICENCE	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/LICENCE	2005-09-22 13:39:06.784550112 -0600
@@ -5,7 +5,7 @@
 
 JFFS2 is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free
-Software Foundation; either version 2 or (at your option) any later 
+Software Foundation; either version 2 or (at your option) any later
 version.
 
 JFFS2 is distributed in the hope that it will be useful, but WITHOUT
@@ -28,7 +28,7 @@
 This exception does not invalidate any other reasons why a work based on
 this file might be covered by the GNU General Public License.
 
-For information on obtaining alternative licences for JFFS2, see 
+For information on obtaining alternative licences for JFFS2, see
 http://sources.redhat.com/jffs2/jffs2-licence.html
 
 
diff -uNr mtd/fs/jffs2/malloc.c mtd-whitespace/fs/jffs2/malloc.c
--- mtd/fs/jffs2/malloc.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/malloc.c	2005-09-22 16:54:44.918082576 -0600
@@ -29,7 +29,7 @@
 
 int __init jffs2_create_slab_caches(void)
 {
-	full_dnode_slab = kmem_cache_create("jffs2_full_dnode", 
+	full_dnode_slab = kmem_cache_create("jffs2_full_dnode",
 					    sizeof(struct jffs2_full_dnode),
 					    0, 0, NULL, NULL);
 	if (!full_dnode_slab)
@@ -77,19 +77,19 @@
 
 void jffs2_destroy_slab_caches(void)
 {
-	if(full_dnode_slab)
+	if (full_dnode_slab)
 		kmem_cache_destroy(full_dnode_slab);
-	if(raw_dirent_slab)
+	if (raw_dirent_slab)
 		kmem_cache_destroy(raw_dirent_slab);
-	if(raw_inode_slab)
+	if (raw_inode_slab)
 		kmem_cache_destroy(raw_inode_slab);
-	if(tmp_dnode_info_slab)
+	if (tmp_dnode_info_slab)
 		kmem_cache_destroy(tmp_dnode_info_slab);
-	if(raw_node_ref_slab)
+	if (raw_node_ref_slab)
 		kmem_cache_destroy(raw_node_ref_slab);
-	if(node_frag_slab)
+	if (node_frag_slab)
 		kmem_cache_destroy(node_frag_slab);
-	if(inode_cache_slab)
+	if (inode_cache_slab)
 		kmem_cache_destroy(inode_cache_slab);
 }
 
diff -uNr mtd/fs/jffs2/nodelist.c mtd-whitespace/fs/jffs2/nodelist.c
--- mtd/fs/jffs2/nodelist.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/nodelist.c	2005-09-22 16:54:50.906172248 -0600
@@ -24,7 +24,7 @@
 void jffs2_add_fd_to_list(struct jffs2_sb_info *c, struct jffs2_full_dirent *new, struct jffs2_full_dirent **list)
 {
 	struct jffs2_full_dirent **prev = list;
-	
+
 	dbg_dentlist("add dirent \"%s\", ino #%u\n", new->name, new->ino);
 
 	while ((*prev) && (*prev)->nhash <= new->nhash) {
@@ -75,14 +75,14 @@
 	if (size == 0)
 		return;
 
-	/* 
+	/*
 	 * If the last fragment starts at the RAM page boundary, it is
 	 * REF_PRISTINE irrespective of its size.
 	 */
 	frag = frag_last(list);
 	if (frag->node && (frag->ofs & (PAGE_CACHE_SIZE - 1)) == 0) {
 		dbg_fragtree2("marking the last fragment 0x%08x-0x%08x REF_PRISTINE.\n",
-			frag->ofs, frag->ofs + frag->size); 
+			frag->ofs, frag->ofs + frag->size);
 		frag->node->raw->flash_offset = ref_offset(frag->node->raw) | REF_PRISTINE;
 	}
 }
@@ -102,7 +102,7 @@
 				ref_offset(this->node->raw), this->node->ofs, this->node->ofs+this->node->size, this->node->frags);
 			mark_ref_normal(this->node->raw);
 		}
-		
+
 	}
 	jffs2_free_node_frag(this);
 }
@@ -117,7 +117,7 @@
 	while (*link) {
 		parent = *link;
 		base = rb_entry(parent, struct jffs2_node_frag, rb);
-	
+
 		if (newfrag->ofs > base->ofs)
 			link = &base->rb.rb_right;
 		else if (newfrag->ofs < base->ofs)
@@ -137,7 +137,7 @@
 static inline struct jffs2_node_frag * new_fragment(struct jffs2_full_dnode *fn, uint32_t ofs, uint32_t size)
 {
 	struct jffs2_node_frag *newfrag;
-	
+
 	newfrag = jffs2_alloc_node_frag();
 	if (likely(newfrag)) {
 		newfrag->ofs = ofs;
@@ -155,7 +155,7 @@
  * fragment and inserts the new fragment to the fragtree.
  */
 static int no_overlapping_node(struct jffs2_sb_info *c, struct rb_root *root,
-		 	       struct jffs2_node_frag *newfrag,
+			       struct jffs2_node_frag *newfrag,
 			       struct jffs2_node_frag *this, uint32_t lastend)
 {
 	if (lastend < newfrag->node->ofs) {
@@ -169,7 +169,7 @@
 		}
 
 		if (this) {
-			/* By definition, the 'this' node has no right-hand child, 
+			/* By definition, the 'this' node has no right-hand child,
 			   because there are no frags with offset greater than it.
 			   So that's where we want to put the hole */
 			dbg_fragtree2("add hole frag %#04x-%#04x on the right of the new frag.\n",
@@ -183,13 +183,13 @@
 		rb_insert_color(&holefrag->rb, root);
 		this = holefrag;
 	}
-	
+
 	if (this) {
-		/* By definition, the 'this' node has no right-hand child, 
+		/* By definition, the 'this' node has no right-hand child,
 		   because there are no frags with offset greater than it.
 		   So that's where we want to put new fragment */
 		dbg_fragtree2("add the new node at the right\n");
-		rb_link_node(&newfrag->rb, &this->rb, &this->rb.rb_right);			
+		rb_link_node(&newfrag->rb, &this->rb, &this->rb.rb_right);
 	} else {
 		dbg_fragtree2("insert the new node at the root of the tree\n");
 		rb_link_node(&newfrag->rb, NULL, &root->rb_node);
@@ -216,7 +216,7 @@
 		dbg_fragtree2("lookup gave no frag\n");
 		lastend = 0;
 	}
-			  
+
 	/* See if we ran off the end of the fragtree */
 	if (lastend <= newfrag->ofs) {
 		/* We did */
@@ -243,7 +243,7 @@
 		this->ofs, this->ofs + this->size);
 
 	/* OK. 'this' is pointing at the first frag that newfrag->ofs at least partially obsoletes,
-	 * - i.e. newfrag->ofs < this->ofs+this->size && newfrag->ofs >= this->ofs  
+	 * - i.e. newfrag->ofs < this->ofs+this->size && newfrag->ofs >= this->ofs
 	 */
 	if (newfrag->ofs > this->ofs) {
 		/* This node isn't completely obsoleted. The start of it remains valid */
@@ -261,10 +261,10 @@
 			if (this->node)
 				dbg_fragtree2("split old frag 0x%04x-0x%04x, phys 0x%08x\n",
 					this->ofs, this->ofs+this->size, ref_offset(this->node->raw));
-			else 
+			else
 				dbg_fragtree2("split old hole frag 0x%04x-0x%04x\n",
 					this->ofs, this->ofs+this->size);
-			
+
 			/* New second frag pointing to this's node */
 			newfrag2 = new_fragment(this->node, newfrag->ofs + newfrag->size,
 						this->ofs + this->size - newfrag->ofs - newfrag->size);
@@ -284,10 +284,10 @@
 			   from newfrag to insert newfrag2. */
 			jffs2_fragtree_insert(newfrag, this);
 			rb_insert_color(&newfrag->rb, root);
-			
+
 			jffs2_fragtree_insert(newfrag2, newfrag);
 			rb_insert_color(&newfrag2->rb, root);
-			
+
 			return 0;
 		}
 		/* New node just reduces 'this' frag in size, doesn't split it */
@@ -297,13 +297,13 @@
 		jffs2_fragtree_insert(newfrag, this);
 		rb_insert_color(&newfrag->rb, root);
 	} else {
-		/* New frag starts at the same point as 'this' used to. Replace 
+		/* New frag starts at the same point as 'this' used to. Replace
 		   it in the tree without doing a delete and insertion */
 		dbg_fragtree2("inserting newfrag (*%p),%d-%d in before 'this' (*%p),%d-%d\n",
 			  newfrag, newfrag->ofs, newfrag->ofs+newfrag->size, this, this->ofs, this->ofs+this->size);
-	
+
 		rb_replace_node(&this->rb, &newfrag->rb, root);
-		
+
 		if (newfrag->ofs + newfrag->size >= this->ofs+this->size) {
 			dbg_fragtree2("obsoleting node frag %p (%x-%x)\n", this, this->ofs, this->ofs+this->size);
 			jffs2_obsolete_node_frag(c, this);
@@ -317,7 +317,7 @@
 		}
 	}
 	/* OK, now we have newfrag added in the correct place in the tree, but
-	   frag_next(newfrag) may be a fragment which is overlapped by it 
+	   frag_next(newfrag) may be a fragment which is overlapped by it
 	*/
 	while ((this = frag_next(newfrag)) && newfrag->ofs + newfrag->size >= this->ofs + this->size) {
 		/* 'this' frag is obsoleted completely. */
@@ -326,7 +326,7 @@
 		rb_erase(&this->rb, root);
 		jffs2_obsolete_node_frag(c, this);
 	}
-	/* Now we're pointing at the first frag which isn't totally obsoleted by 
+	/* Now we're pointing at the first frag which isn't totally obsoleted by
 	   the new frag */
 
 	if (!this || newfrag->ofs + newfrag->size == this->ofs)
@@ -344,7 +344,7 @@
 	return 0;
 }
 
-/* 
+/*
  * Given an inode, probably with existing tree of fragments, add the new node
  * to the fragment tree.
  */
@@ -362,8 +362,8 @@
 	newfrag->node->frags = 1;
 
 	dbg_fragtree("adding node %#04x-%#04x @0x%08x on flash, newfrag *%p\n",
-		  fn->ofs, fn->ofs+fn->size, ref_offset(fn->raw), newfrag);
-	
+			fn->ofs, fn->ofs+fn->size, ref_offset(fn->raw), newfrag);
+
 	ret = jffs2_add_frag_to_fragtree(c, &f->fragtree, newfrag);
 	if (unlikely(ret))
 		return ret;
@@ -374,14 +374,14 @@
 		struct jffs2_node_frag *prev = frag_prev(newfrag);
 
 		mark_ref_normal(fn->raw);
-		/* If we don't start at zero there's _always_ a previous */	
+		/* If we don't start at zero there's _always_ a previous */
 		if (prev->node)
 			mark_ref_normal(prev->node->raw);
 	}
 
 	if ((newfrag->ofs+newfrag->size) & (PAGE_CACHE_SIZE-1)) {
 		struct jffs2_node_frag *next = frag_next(newfrag);
-		
+
 		if (next) {
 			mark_ref_normal(fn->raw);
 			if (next->node)
@@ -397,8 +397,8 @@
  * Check the data CRC of the node.
  *
  * Returns: 0 if the data CRC is correct;
- * 	    1 - if incorrect;
- *	    error code if an error occured.
+ *          1 - if incorrect;
+ *          error code if an error occured.
  */
 static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info *tn)
 {
@@ -412,7 +412,7 @@
 
 	if (!jffs2_is_writebuffered(c))
 		goto adj_acc;
-	
+
 	/* Calculate how many bytes were already checked */
 	ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);
 	len = ofs % c->wbuf_pagesize;
@@ -424,13 +424,13 @@
 			ref_offset(ref), tn->csize, ofs);
 		goto adj_acc;
 	}
-	
+
 	ofs += len;
 	len = tn->csize - len;
-	
+
 	dbg_readinode("check node at %#08x, data length %u, partial CRC %#08x, correct CRC %#08x, data starts at %#08x, start checking from %#08x - %u bytes.\n",
 		ref_offset(ref), tn->csize, tn->partial_crc, tn->data_crc, ofs - len, ofs, len);
-	
+
 #ifndef __ECOS
 	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
 	 * adding and jffs2_flash_read_end() interface. */
@@ -445,12 +445,12 @@
 			pointed = 1; /* succefully pointed to device */
 	}
 #endif
-	
+
 	if (!pointed) {
 		buffer = kmalloc(len, GFP_KERNEL);
 		if (unlikely(!buffer))
 			return -ENOMEM;
-			
+
 		/* TODO: this is very frequent pattern, make it a separate
 		 * routine */
 		err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
@@ -458,7 +458,7 @@
 			JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
 			goto free_out;
 		}
-			
+
 		if (retlen != len) {
 			JFFS2_ERROR("short read at %#08x: %d instead of %d.\n", ofs, retlen, len);
 			err = -EIO;
@@ -468,7 +468,7 @@
 
 	/* Continue calculating CRC */
 	crc = crc32(tn->partial_crc, buffer, len);
-	if(!pointed)
+	if (!pointed)
 		kfree(buffer);
 #ifndef __ECOS
 	else
@@ -485,7 +485,7 @@
 	jeb = &c->blocks[ref->flash_offset / c->sector_size];
 	len = ref_totlen(c, jeb, ref);
 
-	/* 
+	/*
 	 * Mark the node as having been checked and fix the
 	 * accounting accordingly.
 	 */
@@ -499,7 +499,7 @@
 	return 0;
 
 free_out:
-	if(!pointed)
+	if (!pointed)
 		kfree(buffer);
 #ifndef __ECOS
 	else
@@ -516,13 +516,13 @@
 static inline int check_node(struct jffs2_sb_info *c, struct jffs2_inode_info *f, struct jffs2_tmp_dnode_info *tn)
 {
 	int ret;
-	
+
 	BUG_ON(ref_obsolete(tn->fn->raw));
 
 	/* We only check the data CRC of unchecked nodes */
 	if (ref_flags(tn->fn->raw) != REF_UNCHECKED)
 		return 0;
-	
+
 	dbg_fragtree2("check node %#04x-%#04x, phys offs %#08x.\n",
 		tn->fn->ofs, tn->fn->ofs + tn->fn->size, ref_offset(tn->fn->raw));
 
@@ -538,7 +538,7 @@
 	return ret;
 }
 
-/* 
+/*
  * Helper function for jffs2_add_older_frag_to_fragtree().
  *
  * Called when the new fragment that is being inserted
@@ -551,31 +551,31 @@
 		newfrag->ofs, newfrag->ofs + newfrag->size, hole->ofs, hole->ofs + hole->size);
 
 	if (hole->ofs == newfrag->ofs) {
-		/* 
+		/*
 		 * Well, the new fragment actually starts at the same offset as
 		 * the hole.
 		 */
 		if (hole->ofs + hole->size > newfrag->ofs + newfrag->size) {
-			/* 
+			/*
 			 * We replace the overlapped left part of the hole by
 			 * the new node.
 			 */
-			
+
 			dbg_fragtree2("insert fragment %#04x-%#04x and cut the left part of the hole\n",
 				newfrag->ofs, newfrag->ofs + newfrag->size);
 			rb_replace_node(&hole->rb, &newfrag->rb, root);
-			
+
 			hole->ofs += newfrag->size;
 			hole->size -= newfrag->size;
-			
-			/* 
+
+			/*
 			 * We know that 'hole' should be the right hand
 			 * fragment.
 			 */
 			jffs2_fragtree_insert(hole, newfrag);
 			rb_insert_color(&hole->rb, root);
 		} else {
-			/* 
+			/*
 			 * Ah, the new fragment is of the same size as the hole.
 			 * Relace the hole by it.
 			 */
@@ -586,7 +586,7 @@
 		}
 	} else {
 		/* The new fragment lefts some hole space at the left */
-		
+
 		struct jffs2_node_frag * newfrag2 = NULL;
 
 		if (hole->ofs + hole->size > newfrag->ofs + newfrag->size) {
@@ -606,7 +606,7 @@
 
 		jffs2_fragtree_insert(newfrag, hole);
 		rb_insert_color(&newfrag->rb, root);
-		
+
 		if (newfrag2) {
 			dbg_fragtree2("left the hole %#04x-%#04x at the right\n",
 				newfrag2->ofs, newfrag2->ofs + newfrag2->size);
@@ -654,18 +654,18 @@
 		lastend = this->ofs + this->size;
 	else
 		lastend = 0;
-	
+
 	/* Detect the preliminary type of node */
 	if (fn->size >= PAGE_CACHE_SIZE)
 		ref_flag = REF_PRISTINE;
 	else
 		ref_flag = REF_NORMAL;
-	
+
 	/* See if we ran off the end of the root */
 	if (lastend <= fn_ofs) {
 		/* We did */
-		
-		/* 
+
+		/*
 		 * We are going to insert the new node into the
 		 * fragment tree, so check it.
 		 */
@@ -691,21 +691,21 @@
 	fn->frags = 0;
 
 	while (1) {
-		/* 
+		/*
 		 * Here we have:
 		 * fn_ofs < this->ofs + this->size && fn_ofs >= this->ofs.
-		 * 
+		 *
 		 * Remember, 'this' has higher version, any non-hole node
 		 * which is already in the fragtree is newer then the newly
 		 * inserted.
 		 */
 		if (!this->node) {
-			/* 
+			/*
 			 * 'this' is the hole fragment, so at least the
 			 * beginning of the new fragment is valid.
 			 */
-			
-			/* 
+
+			/*
 			 * We are going to insert the new node into the
 			 * fragment tree, so check it.
 			 */
@@ -715,7 +715,7 @@
 					return err;
 				checked = 1;
 			}
-			
+
 			if (this->ofs + this->size >= fn_ofs + fn_size) {
 				/* We split the hole on two parts */
 
@@ -730,7 +730,7 @@
 				goto out_ok;
 			}
 
-			/* 
+			/*
 			 * The beginning of the new fragment is valid since it
 			 * overlaps the hole node.
 			 */
@@ -742,9 +742,9 @@
 					this->ofs + this->size - fn_ofs);
 			if (unlikely(!newfrag))
 				return -ENOMEM;
-			
+
 			if (fn_ofs == this->ofs) {
-				/* 
+				/*
 				 * The new node starts at the same offset as
 				 * the hole and supersieds the hole.
 				 */
@@ -754,21 +754,21 @@
 				rb_replace_node(&this->rb, &newfrag->rb, root);
 				jffs2_free_node_frag(this);
 			} else {
-				/* 
+				/*
 				 * The hole becomes shorter as its right part
 				 * is supersieded by the new fragment.
 				 */
 				dbg_fragtree2("reduce size of hole %#04x-%#04x to %#04x-%#04x\n",
 					this->ofs, this->ofs + this->size, this->ofs, this->ofs + this->size - newfrag->size);
-				
+
 				dbg_fragtree2("add new fragment %#04x-%#04x, refcnt %d\n", fn_ofs,
 					fn_ofs + this->ofs + this->size - fn_ofs, fn->frags);
-	
+
 				this->size -= newfrag->size;
 				jffs2_fragtree_insert(newfrag, this);
 				rb_insert_color(&newfrag->rb, root);
 			}
-			
+
 			fn_ofs += newfrag->size;
 			fn_size -= newfrag->size;
 			this = rb_entry(rb_next(&newfrag->rb),
@@ -778,7 +778,7 @@
 				this->ofs, this->ofs + this->size, this->node ? "(data)" : "(hole)");
 		}
 
-		/* 
+		/*
 		 * 'This' node is not the hole so it obsoletes the new fragment
 		 * either fully or partially.
 		 */
@@ -791,19 +791,19 @@
 			goto out_ok;
 		} else {
 			struct jffs2_node_frag *new_this;
-			
+
 			/* 'This' node obsoletes the beginning of the new node */
 			dbg_fragtree2("the beginning %#04x-%#04x is obsolete\n", fn_ofs, this->ofs + this->size);
 
 			ref_flag = REF_NORMAL;
-			
+
 			fn_size -= this->ofs + this->size - fn_ofs;
 			fn_ofs = this->ofs + this->size;
 			dbg_fragtree2("now considering %#04x-%#04x\n", fn_ofs, fn_ofs + fn_size);
-			
+
 			new_this = rb_entry(rb_next(&this->rb), struct jffs2_node_frag, rb);
 			if (!new_this) {
-				/* 
+				/*
 				 * There is no next fragment. Add the rest of
 				 * the new node as the right-hand child.
 				 */
@@ -813,7 +813,7 @@
 						return err;
 					checked = 1;
 				}
-				
+
 				fn->frags += 1;
 				newfrag = new_fragment(fn, fn_ofs, fn_size);
 				if (unlikely(!newfrag))
@@ -821,7 +821,7 @@
 
 				dbg_fragtree2("there are no more fragments, insert %#04x-%#04x\n",
 					newfrag->ofs, newfrag->ofs + newfrag->size);
-				rb_link_node(&newfrag->rb, &this->rb, &this->rb.rb_right);			
+				rb_link_node(&newfrag->rb, &this->rb, &this->rb.rb_right);
 				rb_insert_color(&newfrag->rb, root);
 				goto out_ok;
 			} else {
@@ -862,9 +862,9 @@
 
 /* During mount, this needs no locking. During normal operation, its
    callers want to do other stuff while still holding the inocache_lock.
-   Rather than introducing special case get_ino_cache functions or 
+   Rather than introducing special case get_ino_cache functions or
    callbacks, we just let the caller do the locking itself. */
-   
+
 struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c, uint32_t ino)
 {
 	struct jffs2_inode_cache *ret;
@@ -873,7 +873,7 @@
 	while (ret && ret->ino < ino) {
 		ret = ret->next;
 	}
-	
+
 	if (ret && ret->ino != ino)
 		ret = NULL;
 
@@ -907,9 +907,9 @@
 
 	dbg_inocache("del %p (ino #%u)\n", old, old->ino);
 	spin_lock(&c->inocache_lock);
-	
+
 	prev = &c->inocache_list[old->ino % INOCACHE_HASHSIZE];
-	
+
 	while ((*prev) && (*prev)->ino < old->ino) {
 		prev = &(*prev)->next;
 	}
@@ -919,7 +919,7 @@
 
 	/* Free it now unless it's in READING or CLEARING state, which
 	   are the transitions upon read_inode() and clear_inode(). The
-	   rest of the time we know nobody else is looking at it, and 
+	   rest of the time we know nobody else is looking at it, and
 	   if it's held by read_inode() or clear_inode() they'll free it
 	   for themselves. */
 	if (old->state != INO_STATE_READING && old->state != INO_STATE_CLEARING)
@@ -932,8 +932,8 @@
 {
 	int i;
 	struct jffs2_inode_cache *this, *next;
-	
-	for (i=0; i<INOCACHE_HASHSIZE; i++) {
+
+	for (i = 0; i < INOCACHE_HASHSIZE; i++) {
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
@@ -949,9 +949,9 @@
 	int i;
 	struct jffs2_raw_node_ref *this, *next;
 
-	for (i=0; i<c->nr_blocks; i++) {
+	for (i = 0; i < c->nr_blocks; i++) {
 		this = c->blocks[i].first_node;
-		while(this) {
+		while (this) {
 			next = this->next_phys;
 			jffs2_free_raw_node_ref(this);
 			this = next;
@@ -959,10 +959,10 @@
 		c->blocks[i].first_node = c->blocks[i].last_node = NULL;
 	}
 }
-	
+
 struct jffs2_node_frag *jffs2_lookup_node_frag(struct rb_root *fragtree, uint32_t offset)
 {
-	/* The common case in lookup is that there will be a node 
+	/* The common case in lookup is that there will be a node
 	   which precisely matches. So we go looking for that first */
 	struct rb_node *next;
 	struct jffs2_node_frag *prev = NULL;
@@ -972,7 +972,7 @@
 
 	next = fragtree->rb_node;
 
-	while(next) {
+	while (next) {
 		frag = rb_entry(next, struct jffs2_node_frag, rb);
 
 		if (frag->ofs + frag->size <= offset) {
@@ -992,10 +992,10 @@
 
 	if (prev)
 		dbg_fragtree2("no match. Returning frag %#04x-%#04x, closest previous\n",
-			  prev->ofs, prev->ofs+prev->size);
-	else 
+			prev->ofs, prev->ofs+prev->size);
+	else
 		dbg_fragtree2("returning NULL, empty fragtree\n");
-	
+
 	return prev;
 }
 
@@ -1010,9 +1010,9 @@
 		return;
 
 	dbg_fragtree("killing\n");
-	
+
 	frag = (rb_entry(root->rb_node, struct jffs2_node_frag, rb));
-	while(frag) {
+	while (frag) {
 		if (frag->rb.rb_left) {
 			frag = frag_left(frag);
 			continue;
@@ -1023,18 +1023,18 @@
 		}
 
 		if (frag->node && !(--frag->node->frags)) {
-			/* Not a hole, and it's the final remaining frag 
+			/* Not a hole, and it's the final remaining frag
 			   of this node. Free the node */
 			if (c)
 				jffs2_mark_node_obsolete(c, frag->node->raw);
-			
+
 			jffs2_free_full_dnode(frag->node);
 		}
 		parent = frag_parent(frag);
 		if (parent) {
 			if (frag_left(parent) == frag)
 				parent->rb.rb_left = NULL;
-			else 
+			else
 				parent->rb.rb_right = NULL;
 		}
 
diff -uNr mtd/fs/jffs2/nodelist.h mtd-whitespace/fs/jffs2/nodelist.h
--- mtd/fs/jffs2/nodelist.h	2005-09-07 13:04:13.000000000 -0600
+++ mtd-whitespace/fs/jffs2/nodelist.h	2005-09-22 16:54:58.409031640 -0600
@@ -58,7 +58,7 @@
 #define je16_to_cpu(x) (le16_to_cpu(x.v16))
 #define je32_to_cpu(x) (le32_to_cpu(x.v32))
 #define jemode_to_cpu(x) (le32_to_cpu(jffs2_to_os_mode((x).m)))
-#else 
+#else
 #error wibble
 #endif
 
@@ -68,7 +68,7 @@
 /*
   This is all we need to keep in-core for each raw node during normal
   operation. As and when we do read_inode on a particular inode, we can
-  scan the nodes which are listed for it and build up a proper map of 
+  scan the nodes which are listed for it and build up a proper map of
   which nodes are currently valid. JFFSv1 always used to keep that whole
   map in core for each inode.
 */
@@ -83,9 +83,9 @@
 	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below */
 };
 
-        /* flash_offset & 3 always has to be zero, because nodes are
-	   always aligned at 4 bytes. So we have a couple of extra bits
-	   to play with, which indicate the node's status; see below: */ 
+/* flash_offset & 3 always has to be zero, because nodes are
+   always aligned at 4 bytes. So we have a couple of extra bits
+   to play with, which indicate the node's status; see below: */
 #define REF_UNCHECKED	0	/* We haven't yet checked the CRC or built its inode */
 #define REF_OBSOLETE	1	/* Obsolete, can be completely ignored */
 #define REF_PRISTINE	2	/* Completely clean. GC without looking */
@@ -93,12 +93,12 @@
 #define ref_flags(ref)		((ref)->flash_offset & 3)
 #define ref_offset(ref)		((ref)->flash_offset & ~3)
 #define ref_obsolete(ref)	(((ref)->flash_offset & 3) == REF_OBSOLETE)
-#define mark_ref_normal(ref)    do { (ref)->flash_offset = ref_offset(ref) | REF_NORMAL; } while(0)
+#define mark_ref_normal(ref)    do { (ref)->flash_offset = ref_offset(ref) | REF_NORMAL; } while (0)
 
 /* For each inode in the filesystem, we need to keep a record of
    nlink, because it would be a PITA to scan the whole directory tree
    at read_inode() time to calculate it, and to keep sufficient information
-   in the raw_node_ref (basically both parent and child inode number for 
+   in the raw_node_ref (basically both parent and child inode number for
    dirent nodes) would take more space than this does. We also keep
    a pointer to the first physical node which is part of this inode, too.
 */
@@ -128,7 +128,7 @@
 #define INOCACHE_HASHSIZE 128
 
 /*
-  Larger representation of a raw node, kept in-core only when the 
+  Larger representation of a raw node, kept in-core only when the
   struct inode for this particular ino is instantiated.
 */
 
@@ -138,11 +138,11 @@
 	uint32_t ofs; /* The offset to which the data of this node belongs */
 	uint32_t size;
 	uint32_t frags; /* Number of fragments which currently refer
-			to this node. When this reaches zero, 
+			to this node. When this reaches zero,
 			the node is obsolete.  */
 };
 
-/* 
+/*
    Even larger representation of a raw node, kept in-core only while
    we're actually building up the original map of which nodes go where,
    in read_inode()
@@ -155,7 +155,7 @@
 	uint32_t data_crc;
 	uint32_t partial_crc;
 	uint32_t csize;
-};       
+};
 
 struct jffs2_full_dirent
 {
@@ -169,7 +169,7 @@
 };
 
 /*
-  Fragments - used to build a map of which raw node to obtain 
+  Fragments - used to build a map of which raw node to obtain
   data from for each part of the ino
 */
 struct jffs2_node_frag
@@ -209,7 +209,7 @@
 				    struct jffs2_raw_node_ref *ref)
 {
 	uint32_t ref_end;
-	
+
 	if (ref->next_phys)
 		ref_end = ref_offset(ref->next_phys);
 	else {
@@ -264,13 +264,13 @@
 #define VERYDIRTY(c, size) ((size) >= ((c)->sector_size / 2))
 
 /* check if dirty space is more than 255 Byte */
-#define ISDIRTY(size) ((size) >  sizeof (struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN) 
+#define ISDIRTY(size) ((size) >  sizeof (struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN)
 
 #define PAD(x) (((x)+3)&~3)
 
 static inline struct jffs2_inode_cache *jffs2_raw_ref_to_ic(struct jffs2_raw_node_ref *raw)
 {
-	while(raw->next_in_ino) {
+	while (raw->next_in_ino) {
 		raw = raw->next_in_ino;
 	}
 
@@ -283,7 +283,7 @@
 
 	if (!node)
 		return NULL;
-	while(node->rb_left)
+	while (node->rb_left)
 		node = node->rb_left;
 	return rb_entry(node, struct jffs2_node_frag, rb);
 }
@@ -294,7 +294,7 @@
 
 	if (!node)
 		return NULL;
-	while(node->rb_right)
+	while (node->rb_right)
 		node = node->rb_right;
 	return rb_entry(node, struct jffs2_node_frag, rb);
 }
@@ -341,7 +341,7 @@
 struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2_sb_info *c, struct jffs2_inode_info *f, struct jffs2_raw_inode *ri, const unsigned char *data, uint32_t datalen, uint32_t flash_ofs, int alloc_mode);
 struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, struct jffs2_inode_info *f, struct jffs2_raw_dirent *rd, const unsigned char *name, uint32_t namelen, uint32_t flash_ofs, int alloc_mode);
 int jffs2_write_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-			    struct jffs2_raw_inode *ri, unsigned char *buf, 
+			    struct jffs2_raw_inode *ri, unsigned char *buf,
 			    uint32_t offset, uint32_t writelen, uint32_t *retlen);
 int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, struct jffs2_inode_info *f, struct jffs2_raw_inode *ri, const char *name, int namelen);
 int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, const char *name, int namelen, struct jffs2_inode_info *dead_f, uint32_t time);
@@ -349,7 +349,7 @@
 
 
 /* readinode.c */
-int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f, 
+int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			uint32_t ino, struct jffs2_raw_inode *latest_node);
 int jffs2_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
 void jffs2_do_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f);
diff -uNr mtd/fs/jffs2/nodemgmt.c mtd-whitespace/fs/jffs2/nodemgmt.c
--- mtd/fs/jffs2/nodemgmt.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/nodemgmt.c	2005-09-22 16:58:45.211552416 -0600
@@ -20,27 +20,27 @@
 #include "debug.h"
 
 /**
- *	jffs2_reserve_space - request physical space to write nodes to flash
- *	@c: superblock info
- *	@minsize: Minimum acceptable size of allocation
- *	@ofs: Returned value of node offset
- *	@len: Returned value of allocation length
- *	@prio: Allocation type - ALLOC_{NORMAL,DELETION}
+ *  jffs2_reserve_space - request physical space to write nodes to flash
+ *  @c: superblock info
+ *  @minsize: Minimum acceptable size of allocation
+ *  @ofs: Returned value of node offset
+ *  @len: Returned value of allocation length
+ *  @prio: Allocation type - ALLOC_{NORMAL,DELETION}
  *
- *	Requests a block of physical space on the flash. Returns zero for success
- *	and puts 'ofs' and 'len' into the appriopriate place, or returns -ENOSPC
- *	or other error if appropriate.
+ *  Requests a block of physical space on the flash. Returns zero for success
+ *  and puts 'ofs' and 'len' into the appriopriate place, or returns -ENOSPC
+ *  or other error if appropriate.
  *
- *	If it returns zero, jffs2_reserve_space() also downs the per-filesystem
- *	allocation semaphore, to prevent more than one allocation from being
- *	active at any time. The semaphore is later released by jffs2_commit_allocation()
+ *  If it returns zero, jffs2_reserve_space() also downs the per-filesystem
+ *  allocation semaphore, to prevent more than one allocation from being
+ *  active at any time. The semaphore is later released by jffs2_commit_allocation()
  *
- *	jffs2_reserve_space() may trigger garbage collection in order to make room
- *	for the requested allocation.
+ *  jffs2_reserve_space() may trigger garbage collection in order to make room
+ *  for the requested allocation.
  */
 
 static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize,
-					uint32_t *ofs, uint32_t *len, uint32_t sumsize);
+				  uint32_t *ofs, uint32_t *len, uint32_t sumsize);
 
 int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs,
 			uint32_t *len, int prio, uint32_t sumsize)
@@ -58,8 +58,8 @@
 	spin_lock(&c->erase_completion_lock);
 
 	/* this needs a little more thought (true <tglx> :)) */
-	while(ret == -EAGAIN) {
-		while(c->nr_free_blocks + c->nr_erasing_blocks < blocksneeded) {
+	while (ret == -EAGAIN) {
+		while (c->nr_free_blocks + c->nr_erasing_blocks < blocksneeded) {
 			int ret;
 			uint32_t dirty, avail;
 
@@ -88,18 +88,18 @@
 				up(&c->alloc_sem);
 				return -ENOSPC;
 			}
-			
+
 			/* Calc possibly available space. Possibly available means that we
 			 * don't know, if unchecked size contains obsoleted nodes, which could give us some
 			 * more usable space. This will affect the sum only once, as gc first finishes checking
 			 * of nodes.
-			 + Return -ENOSPC, if the maximum possibly available space is less or equal than 
+			 + Return -ENOSPC, if the maximum possibly available space is less or equal than
 			 * blocksneeded * sector_size.
 			 * This blocks endless gc looping on a filesystem, which is nearly full, even if
 			 * the check above passes.
 			 */
 			avail = c->free_size + c->dirty_size + c->erasing_size + c->unchecked_size;
-			if ( (avail / c->sector_size) <= blocksneeded) {
+			if ((avail / c->sector_size) <= blocksneeded) {
 				if (prio == ALLOC_DELETION && c->nr_free_blocks + c->nr_erasing_blocks >= c->resv_blocks_deletion) {
 					D1(printk(KERN_NOTICE "jffs2_reserve_space(): Low on possibly available space, but it's a deletion. Allowing...\n"));
 					break;
@@ -118,7 +118,7 @@
 				  c->nr_free_blocks, c->nr_erasing_blocks, c->free_size, c->dirty_size, c->wasted_size, c->used_size, c->erasing_size, c->bad_size,
 				  c->free_size + c->dirty_size + c->wasted_size + c->used_size + c->erasing_size + c->bad_size, c->flash_size));
 			spin_unlock(&c->erase_completion_lock);
-			
+
 			ret = jffs2_garbage_collect_pass(c);
 			if (ret)
 				return ret;
@@ -152,10 +152,10 @@
 	D1(printk(KERN_DEBUG "jffs2_reserve_space_gc(): Requested 0x%x bytes\n", minsize));
 
 	spin_lock(&c->erase_completion_lock);
-	while(ret == -EAGAIN) {
+	while (ret == -EAGAIN) {
 		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
 		if (ret) {
-		        D1(printk(KERN_DEBUG "jffs2_reserve_space_gc: looping, ret is %d\n", ret));
+			D1(printk(KERN_DEBUG "jffs2_reserve_space_gc: looping, ret is %d\n", ret));
 		}
 	}
 	spin_unlock(&c->erase_completion_lock);
@@ -167,7 +167,6 @@
 
 static void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
-
 	/* Check, if we have a dirty block now, or if it was dirty already */
 	if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
 		c->dirty_size += jeb->wasted_size;
@@ -183,13 +182,12 @@
 			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
 			list_add_tail(&jeb->list, &c->dirty_list);
 		}
-	} else { 
+	} else {
 		D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
 		  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
 		list_add_tail(&jeb->list, &c->clean_list);
 	}
 	c->nextblock = NULL;
-
 }
 
 /* Select a new jeb for nextblock */
@@ -197,7 +195,7 @@
 static int jffs2_find_nextblock(struct jffs2_sb_info *c)
 {
 	struct list_head *next;
-	
+
 	/* Take the next block off the 'free' list */
 
 	if (list_empty(&c->free_list)) {
@@ -229,8 +227,8 @@
 		if (!c->nr_erasing_blocks) {
 			/* Ouch. We're in GC, or we wouldn't have got here.
 			   And there's no space left. At all. */
-			printk(KERN_CRIT "Argh. No free space left for GC. nr_erasing_blocks is %d. nr_free_blocks is %d. (erasableempty: %s, erasingempty: %s, erasependingempty: %s)\n", 
-				   c->nr_erasing_blocks, c->nr_free_blocks, list_empty(&c->erasable_list)?"yes":"no", 
+			printk(KERN_CRIT "Argh. No free space left for GC. nr_erasing_blocks is %d. nr_free_blocks is %d. (erasableempty: %s, erasingempty: %s, erasependingempty: %s)\n",
+				   c->nr_erasing_blocks, c->nr_free_blocks, list_empty(&c->erasable_list)?"yes":"no",
 				   list_empty(&c->erasing_list)?"yes":"no", list_empty(&c->erase_pending_list)?"yes":"no");
 			return -ENOSPC;
 		}
@@ -250,7 +248,7 @@
 	list_del(next);
 	c->nextblock = list_entry(next, struct jffs2_eraseblock, list);
 	c->nr_free_blocks--;
-	
+
 	jffs2_sum_reset_collected(c->summary); /* reset collected summary */
 
 	D1(printk(KERN_DEBUG "jffs2_find_nextblock(): new nextblock = 0x%08x\n", c->nextblock->offset));
@@ -262,21 +260,21 @@
 static int jffs2_do_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
 {
 	struct jffs2_eraseblock *jeb = c->nextblock;
-	uint32_t reserved_size; 			/* for summary information at the end of the jeb */
+	uint32_t reserved_size;				/* for summary information at the end of the jeb */
 	int ret;
 
  restart:
 	reserved_size = 0;
 
 	if (jffs2_sum_active() && (sumsize != JFFS2_SUMMARY_NOSUM_SIZE)) {
-							/* NOSUM_SIZE means not to generate summary */
+		/* NOSUM_SIZE means not to generate summary */
 
 		if (jeb) {
 			reserved_size = PAD(sumsize + c->summary->sum_size + JFFS2_SUMMARY_FRAME_SIZE);
-			dbg_summary("minsize=%d , jeb->free=%d ,"
-						"summary->size=%d , sumsize=%d\n",
-						minsize, jeb->free_size,
-						c->summary->sum_size, sumsize);
+			dbg_summary("minsize=%d , jeb->free=%d , "
+				    "summary->size=%d , sumsize=%d\n",
+				    minsize, jeb->free_size,
+				    c->summary->sum_size, sumsize);
 		}
 
 		/* Is there enough space for writing out the current node, or we have to
@@ -354,9 +352,9 @@
 
 	if (c->cleanmarker_size && jeb->used_size == c->cleanmarker_size &&
 	    !jeb->first_node->next_in_ino) {
-		/* Only node in it beforehand was a CLEANMARKER node (we think). 
+		/* Only node in it beforehand was a CLEANMARKER node (we think).
 		   So mark it obsolete now that there's going to be another node
-		   in the block. This will reduce used_size to zero but We've 
+		   in the block. This will reduce used_size to zero but We've
 		   already set c->nextblock so that jffs2_mark_node_obsolete()
 		   won't try to refile it to the dirty_list.
 		*/
@@ -370,18 +368,18 @@
 }
 
 /**
- *	jffs2_add_physical_node_ref - add a physical node reference to the list
- *	@c: superblock info
- *	@new: new node reference to add
- *	@len: length of this physical node
- *	@dirty: dirty flag for new node
+ * jffs2_add_physical_node_ref - add a physical node reference to the list
+ * @c: superblock info
+ * @new: new node reference to add
+ * @len: length of this physical node
+ * @dirty: dirty flag for new node
  *
- *	Should only be used to report nodes for which space has been allocated 
- *	by jffs2_reserve_space.
+ * Should only be used to report nodes for which space has been allocated
+ * by jffs2_reserve_space.
  *
- *	Must be called with the alloc_sem held.
+ * Must be called with the alloc_sem held.
  */
- 
+
 int jffs2_add_physical_node_ref(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *new)
 {
 	struct jffs2_eraseblock *jeb;
@@ -433,7 +431,7 @@
 		list_add_tail(&jeb->list, &c->clean_list);
 		c->nextblock = NULL;
 	}
-	jffs2_dbg_acct_sanity_check_nolock(c,jeb);
+	jffs2_dbg_acct_sanity_check_nolock(c, jeb);
 	jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
 
 	spin_unlock(&c->erase_completion_lock);
@@ -441,7 +439,6 @@
 	return 0;
 }
 
-
 void jffs2_complete_reservation(struct jffs2_sb_info *c)
 {
 	D1(printk(KERN_DEBUG "jffs2_complete_reservation()\n"));
@@ -471,7 +468,7 @@
 	int ret, addedsize;
 	size_t retlen;
 
-	if(!ref) {
+	if (!ref) {
 		printk(KERN_NOTICE "EEEEEK. jffs2_mark_node_obsolete called with NULL node\n");
 		return;
 	}
@@ -488,8 +485,8 @@
 
 	if (jffs2_can_mark_obsolete(c) && !jffs2_is_readonly(c) &&
 	    !(c->flags & (JFFS2_SB_FLAG_SCANNING | JFFS2_SB_FLAG_BUILDING))) {
-		/* Hm. This may confuse static lock analysis. If any of the above 
-		   three conditions is false, we're going to return from this 
+		/* Hm. This may confuse static lock analysis. If any of the above
+		   three conditions is false, we're going to return from this
 		   function without actually obliterating any nodes or freeing
 		   any jffs2_raw_node_refs. So we don't need to stop erases from
 		   happening, or protect against people holding an obsolete
@@ -546,17 +543,17 @@
 		D1(printk(KERN_DEBUG "Wasting\n"));
 		addedsize = 0;
 		jeb->wasted_size += ref_totlen(c, jeb, ref);
-		c->wasted_size += ref_totlen(c, jeb, ref);	
+		c->wasted_size += ref_totlen(c, jeb, ref);
 	}
 	ref->flash_offset = ref_offset(ref) | REF_OBSOLETE;
-	
+
 	jffs2_dbg_acct_sanity_check_nolock(c, jeb);
 	jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
 
 	if (c->flags & JFFS2_SB_FLAG_SCANNING) {
 		/* Flash scanning is in progress. Don't muck about with the block
 		   lists because they're not ready yet, and don't actually
-		   obliterate nodes that look obsolete. If they weren't 
+		   obliterate nodes that look obsolete. If they weren't
 		   marked obsolete on the flash at the time they _became_
 		   obsolete, there was probably a reason for that. */
 		spin_unlock(&c->erase_completion_lock);
@@ -590,7 +587,7 @@
 				   immediately reused, and we spread the load a bit. */
 				D1(printk(KERN_DEBUG "...and adding to erasable_list\n"));
 				list_add_tail(&jeb->list, &c->erasable_list);
-			}				
+			}
 		}
 		D1(printk(KERN_DEBUG "Done OK\n"));
 	} else if (jeb == c->gcblock) {
@@ -608,8 +605,8 @@
 		list_add_tail(&jeb->list, &c->very_dirty_list);
 	} else {
 		D1(printk(KERN_DEBUG "Eraseblock at 0x%08x not moved anywhere. (free 0x%08x, dirty 0x%08x, used 0x%08x)\n",
-			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size)); 
-	}			  	
+			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
+	}
 
 	spin_unlock(&c->erase_completion_lock);
 
@@ -656,11 +653,11 @@
 
 	/* Nodes which have been marked obsolete no longer need to be
 	   associated with any inode. Remove them from the per-inode list.
-	   
-	   Note we can't do this for NAND at the moment because we need 
+
+	   Note we can't do this for NAND at the moment because we need
 	   obsolete dirent nodes to stay on the lists, because of the
 	   horridness in jffs2_garbage_collect_deletion_dirent(). Also
-	   because we delete the inocache, and on NAND we need that to 
+	   because we delete the inocache, and on NAND we need that to
 	   stay around until all the nodes are actually erased, in order
 	   to stop us from giving the same inode number to another newly
 	   created inode. */
@@ -683,37 +680,37 @@
 		spin_unlock(&c->erase_completion_lock);
 	}
 
-
 	/* Merge with the next node in the physical list, if there is one
 	   and if it's also obsolete and if it doesn't belong to any inode */
 	if (ref->next_phys && ref_obsolete(ref->next_phys) &&
 	    !ref->next_phys->next_in_ino) {
 		struct jffs2_raw_node_ref *n = ref->next_phys;
-		
+
 		spin_lock(&c->erase_completion_lock);
 
 		ref->__totlen += n->__totlen;
 		ref->next_phys = n->next_phys;
-                if (jeb->last_node == n) jeb->last_node = ref;
-		if (jeb->gc_node == n) {
+                if (jeb->last_node == n)
+			jeb->last_node = ref;
+		if (jeb->gc_node == n)
 			/* gc will be happy continuing gc on this node */
-			jeb->gc_node=ref;
-		}
+			jeb->gc_node = ref;
+
 		spin_unlock(&c->erase_completion_lock);
 
 		jffs2_free_raw_node_ref(n);
 	}
-	
+
 	/* Also merge with the previous node in the list, if there is one
 	   and that one is obsolete */
-	if (ref != jeb->first_node ) {
+	if (ref != jeb->first_node) {
 		struct jffs2_raw_node_ref *p = jeb->first_node;
 
 		spin_lock(&c->erase_completion_lock);
 
 		while (p->next_phys != ref)
 			p = p->next_phys;
-		
+
 		if (ref_obsolete(p) && !ref->next_in_ino) {
 			p->__totlen += ref->__totlen;
 			if (jeb->last_node == ref) {
@@ -721,7 +718,7 @@
 			}
 			if (jeb->gc_node == ref) {
 				/* gc will be happy continuing gc on this node */
-				jeb->gc_node=p;
+				jeb->gc_node = p;
 			}
 			p->next_phys = ref->next_phys;
 			jffs2_free_raw_node_ref(ref);
@@ -753,11 +750,11 @@
 	 */
 	dirty = c->dirty_size + c->erasing_size - c->nr_erasing_blocks * c->sector_size;
 
-	if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger && 
-			(dirty > c->nospc_dirty_size)) 
+	if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger &&
+			(dirty > c->nospc_dirty_size))
 		ret = 1;
 
-	D1(printk(KERN_DEBUG "jffs2_thread_should_wake(): nr_free_blocks %d, nr_erasing_blocks %d, dirty_size 0x%x: %s\n", 
+	D1(printk(KERN_DEBUG "jffs2_thread_should_wake(): nr_free_blocks %d, nr_erasing_blocks %d, dirty_size 0x%x: %s\n",
 		  c->nr_free_blocks, c->nr_erasing_blocks, c->dirty_size, ret?"yes":"no"));
 
 	return ret;
diff -uNr mtd/fs/jffs2/os-linux.h mtd-whitespace/fs/jffs2/os-linux.h
--- mtd/fs/jffs2/os-linux.h	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/os-linux.h	2005-09-22 16:59:06.472320288 -0600
@@ -49,7 +49,7 @@
 		spin_unlock(s);					\
 		schedule();					\
 		remove_wait_queue((wq), &__wait);		\
-	} while(0)
+	} while (0)
 
 static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 {
@@ -66,7 +66,7 @@
 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
 
 #ifndef CONFIG_JFFS2_FS_WRITEBUFFER
-#define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
+#define SECTOR_ADDR(x) (((unsigned long)(x) & ~(c->sector_size-1)))
 
 #ifdef CONFIG_JFFS2_SUMMARY
 #define jffs2_can_mark_obsolete(c) (0)
@@ -76,17 +76,17 @@
 
 #define jffs2_is_writebuffered(c) (0)
 #define jffs2_cleanmarker_oob(c) (0)
-#define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
+#define jffs2_write_nand_cleanmarker(c, jeb) (-EIO)
 
 #define jffs2_flash_write(c, ofs, len, retlen, buf) jffs2_flash_direct_write(c, ofs, len, retlen, buf)
 #define jffs2_flash_read(c, ofs, len, retlen, buf) ((c)->mtd->read((c)->mtd, ofs, len, retlen, buf))
-#define jffs2_flush_wbuf_pad(c) ({ do{} while(0); (void)(c), 0; })
-#define jffs2_flush_wbuf_gc(c, i) ({ do{} while(0); (void)(c), (void) i, 0; })
-#define jffs2_write_nand_badblock(c,jeb,bad_offset) (1)
+#define jffs2_flush_wbuf_pad(c) ({ do{} while (0); (void)(c), 0; })
+#define jffs2_flush_wbuf_gc(c, i) ({ do{} while (0); (void)(c), (void) i, 0; })
+#define jffs2_write_nand_badblock(c, jeb, bad_offset) (1)
 #define jffs2_nand_flash_setup(c) (0)
-#define jffs2_nand_flash_cleanup(c) do {} while(0)
+#define jffs2_nand_flash_cleanup(c) do {} while (0)
 #define jffs2_wbuf_dirty(c) (0)
-#define jffs2_flash_writev(a,b,c,d,e,f) jffs2_flash_direct_writev(a,b,c,d,e)
+#define jffs2_flash_writev(a, b, c, d, e, f) jffs2_flash_direct_writev(a, b, c, d, e)
 #define jffs2_wbuf_timeout NULL
 #define jffs2_wbuf_process NULL
 #define jffs2_nor_ecc(c) (0)
@@ -102,14 +102,14 @@
 #else /* NAND and/or ECC'd NOR support present */
 
 #define jffs2_is_writebuffered(c) (c->wbuf != NULL)
-#define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
+#define SECTOR_ADDR(x) (((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size)
 
 #ifdef CONFIG_JFFS2_SUMMARY
 #define jffs2_can_mark_obsolete(c) (0)
 #else
 #define jffs2_can_mark_obsolete(c) \
-  ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & (MTD_ECC|MTD_PROGRAM_REGIONS))) || \
-   c->mtd->type == MTD_RAM)
+	((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & (MTD_ECC|MTD_PROGRAM_REGIONS))) || \
+	 c->mtd->type == MTD_RAM)
 #endif
 
 #define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
@@ -122,7 +122,7 @@
 int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *vecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino);
 int jffs2_flash_write(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, const u_char *buf);
 int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, u_char *buf);
-int jffs2_check_oob_empty(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,int mode);
+int jffs2_check_oob_empty(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, int mode);
 int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 int jffs2_write_nand_badblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset);
@@ -191,21 +191,21 @@
 struct jffs2_inode_info *jffs2_gc_fetch_inode(struct jffs2_sb_info *c,
 					      int inum, int nlink);
 
-unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c, 
-				   struct jffs2_inode_info *f, 
+unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
+				   struct jffs2_inode_info *f,
 				   unsigned long offset,
 				   unsigned long *priv);
 void jffs2_gc_release_page(struct jffs2_sb_info *c,
 			   unsigned char *pg,
 			   unsigned long *priv);
 void jffs2_flash_cleanup(struct jffs2_sb_info *c);
-     
+
 
 /* writev.c */
-int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs, 
-		       unsigned long count, loff_t to, size_t *retlen);
+int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
+			      unsigned long count, loff_t to, size_t *retlen);
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
-			size_t *retlen, const u_char *buf);
+			     size_t *retlen, const u_char *buf);
 
 #endif /* __JFFS2_OS_LINUX_H__ */
 
diff -uNr mtd/fs/jffs2/pushpull.h mtd-whitespace/fs/jffs2/pushpull.h
--- mtd/fs/jffs2/pushpull.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/pushpull.h	2005-09-22 17:15:34.404131824 -0600
@@ -39,10 +39,9 @@
 	}
 
 	if (bit) {
-		pp->buf[pp->ofs >> 3] |= (1<<(7-(pp->ofs &7)));
-	}
-	else {
-		pp->buf[pp->ofs >> 3] &= ~(1<<(7-(pp->ofs &7)));
+		pp->buf[pp->ofs >> 3] |= (1 << (7-(pp->ofs &7)));
+	} else {
+		pp->buf[pp->ofs >> 3] &= ~(1 << (7-(pp->ofs &7)));
 	}
 	pp->ofs++;
 
diff -uNr mtd/fs/jffs2/rbtree.c mtd-whitespace/fs/jffs2/rbtree.c
--- mtd/fs/jffs2/rbtree.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/rbtree.c	2005-09-22 17:16:10.555635960 -0600
@@ -2,7 +2,7 @@
   Red Black Trees
   (C) 1999  Andrea Arcangeli <andrea@suse.de>
   (C) 2002  David Woodhouse <dwmw2@infradead.org>
-  
+
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
@@ -28,8 +28,8 @@
 #include <linux/rbtree.h>
 
 /* This wasn't present till 2.4.11, wasn't exported till 2.4.19 */
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,11) || \
-   (LINUX_VERSION_CODE < KERNEL_VERSION(2,4,19) && defined(MODULE))
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 4, 11) || \
+   (LINUX_VERSION_CODE < KERNEL_VERSION(2, 4, 19) && defined(MODULE))
 static void __rb_rotate_left(struct rb_node * node, struct rb_root * root)
 {
 	struct rb_node * right = node->rb_right;
@@ -44,8 +44,7 @@
 			node->rb_parent->rb_left = right;
 		else
 			node->rb_parent->rb_right = right;
-	}
-	else
+	} else
 		root->rb_node = right;
 	node->rb_parent = right;
 }
@@ -64,8 +63,7 @@
 			node->rb_parent->rb_right = left;
 		else
 			node->rb_parent->rb_left = left;
-	}
-	else
+	} else
 		root->rb_node = left;
 	node->rb_parent = left;
 }
@@ -160,9 +158,7 @@
 				other->rb_color = RB_RED;
 				node = parent;
 				parent = node->rb_parent;
-			}
-			else
-			{
+			} else {
 				if (!other->rb_right ||
 				    other->rb_right->rb_color == RB_BLACK)
 				{
@@ -181,9 +177,7 @@
 				node = root->rb_node;
 				break;
 			}
-		}
-		else
-		{
+		} else {
 			other = parent->rb_left;
 			if (other->rb_color == RB_RED)
 			{
@@ -200,9 +194,7 @@
 				other->rb_color = RB_RED;
 				node = parent;
 				parent = node->rb_parent;
-			}
-			else
-			{
+			} else {
 				if (!other->rb_left ||
 				    other->rb_left->rb_color == RB_BLACK)
 				{
@@ -236,8 +228,7 @@
 		child = node->rb_right;
 	else if (!node->rb_right)
 		child = node->rb_left;
-	else
-	{
+	else {
 		struct rb_node * old = node, * left;
 
 		node = node->rb_right;
@@ -255,8 +246,7 @@
 				parent->rb_left = child;
 			else
 				parent->rb_right = child;
-		}
-		else
+		} else
 			root->rb_node = child;
 
 		if (node->rb_parent == old)
@@ -292,8 +282,7 @@
 			parent->rb_left = child;
 		else
 			parent->rb_right = child;
-	}
-	else
+	} else
 		root->rb_node = child;
 
  color:
@@ -308,9 +297,9 @@
 	/* If we have a right-hand child, go down and then left as far
 	   as we can. */
 	if (node->rb_right) {
-		node = node->rb_right; 
+		node = node->rb_right;
 		while (node->rb_left)
-			node=node->rb_left;
+			node = node->rb_left;
 		return node;
 	}
 
@@ -329,9 +318,9 @@
 struct rb_node *rb_prev(struct rb_node *node)
 {
 	if (node->rb_left) {
-		node = node->rb_left; 
+		node = node->rb_left;
 		while (node->rb_right)
-			node=node->rb_right;
+			node = node->rb_right;
 		return node;
 	}
 	while (node->rb_parent && node == node->rb_parent->rb_left)
diff -uNr mtd/fs/jffs2/read.c mtd-whitespace/fs/jffs2/read.c
--- mtd/fs/jffs2/read.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/read.c	2005-09-22 16:55:26.927696144 -0600
@@ -43,7 +43,7 @@
 	}
 	if (readlen != sizeof(*ri)) {
 		jffs2_free_raw_inode(ri);
-		printk(KERN_WARNING "Short read from 0x%08x: wanted 0x%zx bytes, got 0x%zx\n", 
+		printk(KERN_WARNING "Short read from 0x%08x: wanted 0x%zx bytes, got 0x%zx\n",
 		       ref_offset(fd->raw), sizeof(*ri), readlen);
 		return -EIO;
 	}
@@ -61,20 +61,20 @@
 	}
 	/* There was a bug where we wrote hole nodes out with csize/dsize
 	   swapped. Deal with it */
-	if (ri->compr == JFFS2_COMPR_ZERO && !je32_to_cpu(ri->dsize) && 
+	if (ri->compr == JFFS2_COMPR_ZERO && !je32_to_cpu(ri->dsize) &&
 	    je32_to_cpu(ri->csize)) {
 		ri->dsize = ri->csize;
 		ri->csize = cpu_to_je32(0);
 	}
 
-	D1(if(ofs + len > je32_to_cpu(ri->dsize)) {
+	D1(if (ofs + len > je32_to_cpu(ri->dsize)) {
 		printk(KERN_WARNING "jffs2_read_dnode() asked for %d bytes at %d from %d-byte node\n",
 		       len, ofs, je32_to_cpu(ri->dsize));
 		ret = -EINVAL;
 		goto out_ri;
 	});
 
-	
+
 	if (ri->compr == JFFS2_COMPR_ZERO) {
 		memset(buf, 0, len);
 		goto out_ri;
@@ -82,8 +82,8 @@
 
 	/* Cases:
 	   Reading whole node and it's uncompressed - read directly to buffer provided, check CRC.
-	   Reading whole node and it's compressed - read into comprbuf, check CRC and decompress to buffer provided 
-	   Reading partial node and it's uncompressed - read into readbuf, check CRC, and copy 
+	   Reading whole node and it's compressed - read into comprbuf, check CRC and decompress to buffer provided
+	   Reading partial node and it's uncompressed - read into readbuf, check CRC, and copy
 	   Reading partial node and it's compressed - read into readbuf, check checksum, decompress to decomprbuf and copy
 	*/
 	if (ri->compr == JFFS2_COMPR_NONE && len == je32_to_cpu(ri->dsize)) {
@@ -129,7 +129,7 @@
 	D2(printk(KERN_DEBUG "Data CRC matches calculated CRC %08x\n", crc));
 	if (ri->compr != JFFS2_COMPR_NONE) {
 		D2(printk(KERN_DEBUG "Decompress %d bytes from %p to %d bytes at %p\n",
-			  je32_to_cpu(ri->csize), readbuf, je32_to_cpu(ri->dsize), decomprbuf)); 
+			  je32_to_cpu(ri->csize), readbuf, je32_to_cpu(ri->dsize), decomprbuf));
 		ret = jffs2_decompress(c, f, ri->compr | (ri->usercompr << 8), readbuf, decomprbuf, je32_to_cpu(ri->csize), je32_to_cpu(ri->dsize));
 		if (ret) {
 			printk(KERN_WARNING "Error: jffs2_decompress returned %d\n", ret);
@@ -141,10 +141,10 @@
 		memcpy(buf, decomprbuf+ofs, len);
 	}
  out_decomprbuf:
-	if(decomprbuf != buf && decomprbuf != readbuf)
+	if (decomprbuf != buf && decomprbuf != readbuf)
 		kfree(decomprbuf);
  out_readbuf:
-	if(readbuf != buf)
+	if (readbuf != buf)
 		kfree(readbuf);
  out_ri:
 	jffs2_free_raw_inode(ri);
@@ -167,7 +167,7 @@
 	/* XXX FIXME: Where a single physical node actually shows up in two
 	   frags, we read it twice. Don't do that. */
 	/* Now we're pointing at the first frag which overlaps our page */
-	while(offset < end) {
+	while (offset < end) {
 		D2(printk(KERN_DEBUG "jffs2_read_inode_range: offset %d, end %d\n", offset, end));
 		if (unlikely(!frag || frag->ofs > offset)) {
 			uint32_t holesize = end - offset;
@@ -191,7 +191,7 @@
 		} else {
 			uint32_t readlen;
 			uint32_t fragofs; /* offset within the frag to start reading */
-			
+
 			fragofs = offset - frag->ofs;
 			readlen = min(frag->size - fragofs, end - offset);
 			D1(printk(KERN_DEBUG "Reading %d-%d from node at 0x%08x (%d)\n",
@@ -200,7 +200,7 @@
 			ret = jffs2_read_dnode(c, f, frag->node, buf, fragofs + frag->ofs - frag->node->ofs, readlen);
 			D2(printk(KERN_DEBUG "node read done\n"));
 			if (ret) {
-				D1(printk(KERN_DEBUG"jffs2_read_inode_range error %d\n",ret));
+				D1(printk(KERN_DEBUG"jffs2_read_inode_range error %d\n", ret));
 				memset(buf, 0, readlen);
 				return ret;
 			}
diff -uNr mtd/fs/jffs2/readinode.c mtd-whitespace/fs/jffs2/readinode.c
--- mtd/fs/jffs2/readinode.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/readinode.c	2005-09-22 17:16:48.626848256 -0600
@@ -74,7 +74,8 @@
 				this->rb_left = NULL;
 			else if (this->rb_right == &tn->rb)
 				this->rb_right = NULL;
-			else BUG();
+			else
+				BUG();
 		}
 	}
 	list->rb_node = NULL;
@@ -108,27 +109,27 @@
  * It is called every time an directory entry node is found.
  *
  * Returns: 0 on succes;
- * 	    1 if the node should be marked obsolete;
- * 	    negative error code on failure.
+ *          1 if the node should be marked obsolete;
+ *          negative error code on failure.
  */
 static inline int read_direntry(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref,
 				struct jffs2_raw_dirent *rd, uint32_t read, struct jffs2_full_dirent **fdp,
 				uint32_t *latest_mctime, uint32_t *mctime_ver)
 {
 	struct jffs2_full_dirent *fd;
-	
+
 	/* The direntry nodes are checked during the flash scanning */
 	BUG_ON(ref_flags(ref) == REF_UNCHECKED);
 	/* Obsoleted. This cannot happen, surely? dwmw2 20020308 */
 	BUG_ON(ref_obsolete(ref));
-			
+
 	/* Sanity check */
 	if (unlikely(PAD((rd->nsize + sizeof(*rd))) != PAD(je32_to_cpu(rd->totlen)))) {
 		JFFS2_ERROR("illegal nsize in node at %#08x: nsize %#02x, totlen %#04x\n",
 		       ref_offset(ref), rd->nsize, je32_to_cpu(rd->totlen));
 		return 1;
 	}
-	
+
 	fd = jffs2_alloc_full_dirent(rd->nsize + 1);
 	if (unlikely(!fd))
 		return -ENOMEM;
@@ -139,44 +140,44 @@
 	fd->type = rd->type;
 
 	/* Pick out the mctime of the latest dirent */
-	if(fd->version > *mctime_ver && je32_to_cpu(rd->mctime)) {
+	if (fd->version > *mctime_ver && je32_to_cpu(rd->mctime)) {
 		*mctime_ver = fd->version;
 		*latest_mctime = je32_to_cpu(rd->mctime);
 	}
 
-	/* 
+	/*
 	 * Copy as much of the name as possible from the raw
 	 * dirent we've already read from the flash.
 	 */
 	if (read > sizeof(*rd))
 		memcpy(&fd->name[0], &rd->name[0],
-		       min_t(uint32_t, rd->nsize, (read - sizeof(*rd)) ));
-		
+		       min_t(uint32_t, rd->nsize, (read - sizeof(*rd))));
+
 	/* Do we need to copy any more of the name directly from the flash? */
 	if (rd->nsize + sizeof(*rd) > read) {
 		/* FIXME: point() */
 		int err;
 		int already = read - sizeof(*rd);
-			
-		err = jffs2_flash_read(c, (ref_offset(ref)) + read, 
+
+		err = jffs2_flash_read(c, (ref_offset(ref)) + read,
 				rd->nsize - already, &read, &fd->name[already]);
 		if (unlikely(read != rd->nsize - already) && likely(!err))
 			return -EIO;
-			
+
 		if (unlikely(err)) {
 			JFFS2_ERROR("read remainder of name: error %d\n", err);
 			jffs2_free_full_dirent(fd);
 			return -EIO;
 		}
 	}
-	
+
 	fd->nhash = full_name_hash(fd->name, rd->nsize);
 	fd->next = NULL;
 	fd->name[rd->nsize] = '\0';
-	
+
 	/*
 	 * Wheee. We now have a complete jffs2_full_dirent structure, with
-	 * the name in it and everything. Link it into the list 
+	 * the name in it and everything. Link it into the list
 	 */
 	jffs2_add_fd_to_list(c, fd, fdp);
 
@@ -188,8 +189,8 @@
  * It is called every time an inode node is found.
  *
  * Returns: 0 on succes;
- * 	    1 if the node should be marked obsolete;
- * 	    negative error code on failure.
+ *          1 if the node should be marked obsolete;
+ *          negative error code on failure.
  */
 static inline int read_dnode(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref,
 			     struct jffs2_raw_inode *rd, struct rb_root *tnp, int rdlen,
@@ -198,7 +199,7 @@
 	struct jffs2_tmp_dnode_info *tn;
 	uint32_t len, csize;
 	int ret = 1;
-	
+
 	/* Obsoleted. This cannot happen, surely? dwmw2 20020308 */
 	BUG_ON(ref_obsolete(ref));
 
@@ -210,7 +211,7 @@
 
 	tn->partial_crc = 0;
 	csize = je32_to_cpu(rd->csize);
-	
+
 	/* If we've never checked the CRCs on this node, check them now */
 	if (ref_flags(ref) == REF_UNCHECKED) {
 		uint32_t crc;
@@ -221,7 +222,7 @@
 					ref_offset(ref), je32_to_cpu(rd->node_crc), crc);
 			goto free_out;
 		}
-		
+
 		/* Sanity checks */
 		if (unlikely(je32_to_cpu(rd->offset) > je32_to_cpu(rd->isize)) ||
 		    unlikely(PAD(je32_to_cpu(rd->csize) + sizeof(*rd)) != PAD(je32_to_cpu(rd->totlen)))) {
@@ -313,13 +314,13 @@
 		ret = -ENOMEM;
 		goto free_out;
 	}
-	
+
 	tn->version = je32_to_cpu(rd->version);
 	tn->fn->ofs = je32_to_cpu(rd->offset);
 	tn->data_crc = je32_to_cpu(rd->data_crc);
 	tn->csize = csize;
 	tn->fn->raw = ref;
-	
+
 	/* There was a bug where we wrote hole nodes out with
 	   csize/dsize swapped. Deal with it */
 	if (rd->compr == JFFS2_COMPR_ZERO && !je32_to_cpu(rd->dsize) && csize)
@@ -329,7 +330,7 @@
 
 	dbg_readinode("dnode @%08x: ver %u, offset %#04x, dsize %#04x, csize %#04x\n",
 		  ref_offset(ref), je32_to_cpu(rd->version), je32_to_cpu(rd->offset), je32_to_cpu(rd->dsize), csize);
-	
+
 	jffs2_add_tn_to_tree(tn, tnp);
 
 	return 0;
@@ -344,14 +345,14 @@
  * It is called every time an unknown node is found.
  *
  * Returns: 0 on succes;
- * 	    1 if the node should be marked obsolete;
- * 	    negative error code on failure.
+ *          1 if the node should be marked obsolete;
+ *          negative error code on failure.
  */
 static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref, struct jffs2_unknown_node *un)
 {
 	/* We don't mark unknown nodes as REF_UNCHECKED */
 	BUG_ON(ref_flags(ref) == REF_UNCHECKED);
-	
+
 	un->nodetype = cpu_to_je16(JFFS2_NODE_ACCURATE | je16_to_cpu(un->nodetype));
 
 	if (crc32(0, un, sizeof(struct jffs2_unknown_node) - 4) != je32_to_cpu(un->hdr_crc)) {
@@ -395,7 +396,7 @@
  * The function detects whether more data should be read and reads it if yes.
  *
  * Returns: 0 on succes;
- * 	    negative error code on failure.
+ *          negative error code on failure.
  */
 static int read_more(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref,
 		     int right_size, int *rdlen, unsigned char *buf, unsigned char *bufstart)
@@ -423,7 +424,7 @@
 		bufstart = buf + *rdlen;
 		len = right_size - *rdlen;
 	}
-	
+
 	dbg_readinode("read more %d bytes\n", len);
 
 	err = jffs2_flash_read(c, offs, len, &retlen, bufstart);
@@ -432,7 +433,7 @@
 			"error code: %d.\n", len, offs, err);
 		return err;
 	}
-	
+
 	if (retlen < len) {
 		JFFS2_ERROR("short read at %#08x: %d instead of %d.\n",
 				offs, retlen, len);
@@ -460,7 +461,7 @@
 	int len, err;
 
 	*mctime_ver = 0;
-	
+
 	dbg_readinode("ino #%u\n", f->inocache->ino);
 
 	if (jffs2_is_writebuffered(c)) {
@@ -487,7 +488,7 @@
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-			
+
 	spin_lock(&c->erase_completion_lock);
 	valid_ref = jffs2_first_valid_node(f->inocache->nodes);
 	if (!valid_ref && f->inocache->ino != 1)
@@ -514,7 +515,7 @@
 		 * size = JFFS2_MIN_NODE_HEADER.
 		 */
 		if (jffs2_is_writebuffered(c)) {
-			/* 
+			/*
 			 * We treat 'buf' as 2 adjacent wbufs. We want to
 			 * adjust bufstart such as it points to the
 			 * beginning of the node within this wbuf.
@@ -540,17 +541,17 @@
 			JFFS2_ERROR("can not read %d bytes from 0x%08x, " "error code: %d.\n", len, ref_offset(ref), err);
 			goto free_out;
 		}
-		
+
 		if (retlen < len) {
 			JFFS2_ERROR("short read at %#08x: %d instead of %d.\n", ref_offset(ref), retlen, len);
 			err = -EIO;
 			goto free_out;
 		}
-		
+
 		node = (union jffs2_node_union *)bufstart;
-			
+
 		switch (je16_to_cpu(node->u.nodetype)) {
-			
+
 		case JFFS2_NODETYPE_DIRENT:
 
 			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent)) {
@@ -558,21 +559,21 @@
 				if (unlikely(err))
 					goto free_out;
 			}
-			
+
 			err = read_direntry(c, ref, &node->d, retlen, &ret_fd, latest_mctime, mctime_ver);
 			if (err == 1) {
 				jffs2_mark_node_obsolete(c, ref);
 				break;
 			} else if (unlikely(err))
 				goto free_out;
-			
+
 			if (je32_to_cpu(node->d.version) > *highest_version)
 				*highest_version = je32_to_cpu(node->d.version);
 
 			break;
 
 		case JFFS2_NODETYPE_INODE:
-			
+
 			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode)) {
 				err = read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf, bufstart);
 				if (unlikely(err))
@@ -588,7 +589,7 @@
 
 			if (je32_to_cpu(node->i.version) > *highest_version)
 				*highest_version = je32_to_cpu(node->i.version);
-			
+
 			break;
 
 		default:
@@ -597,7 +598,7 @@
 				if (unlikely(err))
 					goto free_out;
 			}
-			
+
 			err = read_unknown(c, ref, &node->u);
 			if (err == 1) {
 				jffs2_mark_node_obsolete(c, ref);
@@ -625,7 +626,7 @@
 	return err;
 }
 
-static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c, 
+static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 					struct jffs2_inode_info *f,
 					struct jffs2_raw_inode *latest_node)
 {
@@ -677,7 +678,7 @@
 			ret = 0; /* Prevent freeing the metadata update node */
 		} else
 			jffs2_mark_node_obsolete(c, fn->raw);
-			
+
 		BUG_ON(rb->rb_left);
 		if (rb->rb_parent && rb->rb_parent->rb_left == rb) {
 			/* We were then left-hand child of our parent. We need
@@ -697,7 +698,8 @@
 				tn->rb.rb_parent->rb_left = repl_rb;
 			else if (tn->rb.rb_parent->rb_right == &tn->rb)
 				tn->rb.rb_parent->rb_right = repl_rb;
-			else BUG();
+			else
+				BUG();
 		} else if (tn->rb.rb_right)
 			tn->rb.rb_right->rb_parent = NULL;
 
@@ -763,7 +765,6 @@
 		}
 		break;
 
-			
 	case S_IFREG:
 		/* If it was a regular file, truncate it to the latest node's isize */
 		jffs2_truncate_fragtree(c, &f->fragtree, je32_to_cpu(latest_node->isize));
@@ -788,10 +789,10 @@
 				jffs2_do_clear_inode(c, f);
 				return -ENOMEM;
 			}
-			
+
 			ret = jffs2_flash_read(c, ref_offset(fn->raw) + sizeof(*latest_node),
 						je32_to_cpu(latest_node->csize), &retlen, (char *)f->target);
-			
+
 			if (ret  || retlen != je32_to_cpu(latest_node->csize)) {
 				if (retlen != je32_to_cpu(latest_node->csize))
 					ret = -EIO;
@@ -805,7 +806,7 @@
 			f->target[je32_to_cpu(latest_node->csize)] = '\0';
 			dbg_readinode("symlink's target '%s' cached\n", f->target);
 		}
-		
+
 		/* fall through... */
 
 	case S_IFBLK:
@@ -848,7 +849,7 @@
 }
 
 /* Scan the list of all nodes present for this ino, build map of versions, etc. */
-int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f, 
+int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			uint32_t ino, struct jffs2_raw_inode *latest_node)
 {
 	dbg_readinode("read inode #%u\n", ino);
@@ -864,7 +865,7 @@
 		case INO_STATE_CHECKEDABSENT:
 			f->inocache->state = INO_STATE_READING;
 			break;
-			
+
 		case INO_STATE_CHECKING:
 		case INO_STATE_GC:
 			/* If it's in either of these states, we need
@@ -957,9 +958,9 @@
 		kfree(f->target);
 		f->target = NULL;
 	}
-	
+
 	fds = f->dents;
-	while(fds) {
+	while (fds) {
 		fd = fds;
 		fds = fd->next;
 		jffs2_free_full_dirent(fd);
diff -uNr mtd/fs/jffs2/README.Locking mtd-whitespace/fs/jffs2/README.Locking
--- mtd/fs/jffs2/README.Locking	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/README.Locking	2005-09-22 13:39:06.905531720 -0600
@@ -34,7 +34,7 @@
 don't actually get erased until the write-buffer has been flushed to
 the medium.
 
-With the introduction of NAND flash support and the write-buffer, 
+With the introduction of NAND flash support and the write-buffer,
 the alloc_sem is also used to protect the wbuf-related members of the
 jffs2_sb_info structure. Atomically reading the wbuf_len member to see
 if the wbuf is currently holding any data is permitted, though.
@@ -64,9 +64,9 @@
 semaphore, which is obtained by the garbage collection code and also
 by the normal file system code _after_ allocation of space.
 
-Ordering constraints: 
+Ordering constraints:
 
-	1. Never attempt to allocate space or lock alloc_sem with 
+	1. Never attempt to allocate space or lock alloc_sem with
 	   any f->sem held.
 	2. Never attempt to lock two file semaphores in one thread.
 	   No ordering rules have been made for doing so.
@@ -114,9 +114,9 @@
 
 Note, the f->sem guarantees that the correspondent jffs2_inode_cache
 will not be removed. So, it is allowed to access it without locking
-the inocache_lock spinlock. 
+the inocache_lock spinlock.
 
-Ordering constraints: 
+Ordering constraints:
 
 	c->erase_completion_lock and c->inocache_lock has special ordering:
 	1. c->erase_completion_lock (must be locked first)
@@ -148,7 +148,7 @@
 This read/write semaphore protects against concurrent access to the
 write-behind buffer ('wbuf') used for flash chips where we must write
 in blocks. It protects both the contents of the wbuf and the metadata
-which indicates which flash region (if any) is currently covered by 
+which indicates which flash region (if any) is currently covered by
 the buffer.
 
 Ordering constraints:
diff -uNr mtd/fs/jffs2/scan.c mtd-whitespace/fs/jffs2/scan.c
--- mtd/fs/jffs2/scan.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/scan.c	2005-09-22 16:59:35.651884320 -0600
@@ -31,18 +31,18 @@
 			 printk(KERN_NOTICE "Further such events for this erase block will not be printed\n"); \
 		 } \
 	} \
-} while(0)
+} while (0)
 
 static uint32_t pseudo_random;
 
-static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-				  unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s);
+static int jffs2_scan_eraseblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s);
 
-/* These helper functions _must_ increase ofs and also do the dirty/used space accounting. 
+/* These helper functions _must_ increase ofs and also do the dirty/used space accounting.
  * Returning an error will abort the mount - bad checksums etc. should just mark the space
  * as dirty.
  */
-static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_inode *ri, uint32_t ofs, struct jffs2_summary *s);
 static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_dirent *rd, uint32_t ofs, struct jffs2_summary *s);
@@ -58,7 +58,8 @@
 
 }
 
-static inline uint32_t EMPTY_SCAN_SIZE(uint32_t sector_size) {
+static inline uint32_t EMPTY_SCAN_SIZE(uint32_t sector_size)
+{
 	if (sector_size < DEFAULT_EMPTY_SCAN_SIZE)
 		return sector_size;
 	else
@@ -114,7 +115,7 @@
 		memset(s, 0, sizeof(struct jffs2_summary));
 	}
 
-	for (i=0; i<c->nr_blocks; i++) {
+	for (i = 0; i < c->nr_blocks; i++) {
 		struct jffs2_eraseblock *jeb = &c->blocks[i];
 
 		/* reset summary info for next eraseblock scan */
@@ -131,8 +132,8 @@
 		/* Now decide which list to put it on */
 		switch(ret) {
 		case BLK_STATE_ALLFF:
-			/* 
-			 * Empty block.   Since we can't be sure it 
+			/*
+			 * Empty block.   Since we can't be sure it
 			 * was entirely erased, we just queue it for erase
 			 * again.  It will be marked as such when the erase
 			 * is complete.  Meanwhile we still count it as empty
@@ -234,7 +235,7 @@
 	}
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (!jffs2_can_mark_obsolete(c) && c->nextblock && (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
-		/* If we're going to start writing into a block which already 
+		/* If we're going to start writing into a block which already
 		   contains data, and the end of the data isn't page-aligned,
 		   skip a little and align it. */
 
@@ -250,9 +251,9 @@
 	}
 #endif
 	if (c->nr_erasing_blocks) {
-		if ( !c->used_size && ((c->nr_free_blocks+empty_blocks+bad_blocks)!= c->nr_blocks || bad_blocks == c->nr_blocks) ) { 
+		if (!c->used_size && ((c->nr_free_blocks+empty_blocks+bad_blocks)!= c->nr_blocks || bad_blocks == c->nr_blocks)) {
 			printk(KERN_NOTICE "Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes\n");
-			printk(KERN_NOTICE "empty_blocks %d, bad_blocks %d, c->nr_blocks %d\n",empty_blocks,bad_blocks,c->nr_blocks);
+			printk(KERN_NOTICE "empty_blocks %d, bad_blocks %d, c->nr_blocks %d\n", empty_blocks, bad_blocks, c->nr_blocks);
 			ret = -EIO;
 			goto out;
 		}
@@ -263,7 +264,7 @@
 	if (buf_size)
 		kfree(flashbuf);
 #ifndef __ECOS
-	else 
+	else
 		c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
 #endif
 	return ret;
@@ -293,7 +294,7 @@
 int jffs2_scan_classify_jeb(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
 	if ((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size) && !jeb->dirty_size
-		&& (!jeb->first_node || !jeb->first_node->next_phys) )
+		&& (!jeb->first_node || !jeb->first_node->next_phys))
 		return BLK_STATE_CLEANMARKER;
 
 	/* move blocks with max 4 byte dirty space to cleanlist */
@@ -309,8 +310,9 @@
 		return BLK_STATE_ALLDIRTY;
 }
 
-static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-				unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s) {
+static int jffs2_scan_eraseblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s)
+{
 	struct jffs2_unknown_node *node;
 	struct jffs2_unknown_node crcnode;
 	struct jffs2_sum_marker *sm;
@@ -332,16 +334,16 @@
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (jffs2_cleanmarker_oob(c)) {
 		int ret = jffs2_check_nand_cleanmarker(c, jeb);
-		D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned %d\n",ret));
+		D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned %d\n", ret));
 		/* Even if it's not found, we still scan to see
 		   if the block is empty. We use this information
 		   to decide whether to erase it or not. */
 		switch (ret) {
 		case 0:		cleanmarkerfound = 1; break;
-		case 1: 	break;
-		case 2: 	return BLK_STATE_BADBLOCK;
+		case 1:		break;
+		case 2:		return BLK_STATE_BADBLOCK;
 		case 3:		return BLK_STATE_ALLDIRTY; /* Block has failed to erase min. once */
-		default: 	return ret;
+		default:	return ret;
 		}
 	}
 #endif
@@ -359,7 +361,7 @@
 			return err;
 		}
 
-		if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
+		if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
 			err = jffs2_sum_scan_sumnode(c, jeb, je32_to_cpu(sm->offset), &pseudo_random);
 			if (err) {
 				kfree(sm);
@@ -384,19 +386,18 @@
 			if (err)
 				return err;
 		}
-
 	} else {
 		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
 		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
 		if (err)
 			return err;
 	}
-	
+
 	/* We temporarily use 'ofs' as a pointer into the buffer/jeb */
 	ofs = 0;
 
 	/* Scan only 4KiB of 0xFF before declaring it's empty */
-	while(ofs < EMPTY_SCAN_SIZE(c->sector_size) && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
+	while (ofs < EMPTY_SCAN_SIZE(c->sector_size) && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
 		ofs += 4;
 
 	if (ofs == EMPTY_SCAN_SIZE(c->sector_size)) {
@@ -404,11 +405,11 @@
 		if (jffs2_cleanmarker_oob(c)) {
 			/* scan oob, take care of cleanmarker */
 			int ret = jffs2_check_oob_empty(c, jeb, cleanmarkerfound);
-			D2(printk(KERN_NOTICE "jffs2_check_oob_empty returned %d\n",ret));
+			D2(printk(KERN_NOTICE "jffs2_check_oob_empty returned %d\n", ret));
 			switch (ret) {
 			case 0:		return cleanmarkerfound ? BLK_STATE_CLEANMARKER : BLK_STATE_ALLFF;
-			case 1: 	return BLK_STATE_ALLDIRTY;
-			default: 	return ret;
+			case 1:		return BLK_STATE_ALLDIRTY;
+			default:	return ret;
 			}
 		}
 #endif
@@ -429,10 +430,10 @@
 
 	noise = 10;
 
-	dbg_summary("no summary found in jeb 0x%08x. Apply original scan.\n",jeb->offset);
+	dbg_summary("no summary found in jeb 0x%08x. Apply original scan.\n", jeb->offset);
 
-scan_more:	
-	while(ofs < jeb->offset + c->sector_size) {
+scan_more:
+	while (ofs < jeb->offset + c->sector_size) {
 
 		jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
 
@@ -488,7 +489,7 @@
 					goto scan_more;
 				}
 
-				inbuf_ofs+=4;
+				inbuf_ofs += 4;
 				ofs += 4;
 			}
 			/* Ran off end. */
@@ -496,7 +497,7 @@
 
 			/* If we're only checking the beginning of a block with a cleanmarker,
 			   bail now */
-			if (buf_ofs == jeb->offset && jeb->used_size == PAD(c->cleanmarker_size) && 
+			if (buf_ofs == jeb->offset && jeb->used_size == PAD(c->cleanmarker_size) &&
 			    c->cleanmarker_size && !jeb->dirty_size && !jeb->first_node->next_phys) {
 				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE(c->sector_size)));
 				return BLK_STATE_CLEANMARKER;
@@ -505,7 +506,7 @@
 			/* See how much more there is to read in this eraseblock... */
 			buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
 			if (!buf_len) {
-				/* No more to read. Break out of main loop without marking 
+				/* No more to read. Break out of main loop without marking
 				   this range of empty space as dirty (because it's not) */
 				D1(printk(KERN_DEBUG "Empty flash at %08x runs to end of block. Treating as free_space\n",
 					  empty_start));
@@ -540,8 +541,8 @@
 		}
 		if (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK) {
 			/* OK. We're out of possibilities. Whinge and move on */
-			noisy_printk(&noise, "jffs2_scan_eraseblock(): Magic bitmask 0x%04x not found at 0x%08x: 0x%04x instead\n", 
-				     JFFS2_MAGIC_BITMASK, ofs, 
+			noisy_printk(&noise, "jffs2_scan_eraseblock(): Magic bitmask 0x%04x not found at 0x%08x: 0x%04x instead\n",
+				     JFFS2_MAGIC_BITMASK, ofs,
 				     je16_to_cpu(node->magic));
 			DIRTY_SPACE(4);
 			ofs += 4;
@@ -549,14 +550,14 @@
 		}
 		/* We seem to have a node of sorts. Check the CRC */
 		crcnode.magic = node->magic;
-		crcnode.nodetype = cpu_to_je16( je16_to_cpu(node->nodetype) | JFFS2_NODE_ACCURATE);
+		crcnode.nodetype = cpu_to_je16(je16_to_cpu(node->nodetype) | JFFS2_NODE_ACCURATE);
 		crcnode.totlen = node->totlen;
 		hdr_crc = crc32(0, &crcnode, sizeof(crcnode)-4);
 
 		if (hdr_crc != je32_to_cpu(node->hdr_crc)) {
 			noisy_printk(&noise, "jffs2_scan_eraseblock(): Node at 0x%08x {0x%04x, 0x%04x, 0x%08x) has invalid CRC 0x%08x (calculated 0x%08x)\n",
 				     ofs, je16_to_cpu(node->magic),
-				     je16_to_cpu(node->nodetype), 
+				     je16_to_cpu(node->nodetype),
 				     je32_to_cpu(node->totlen),
 				     je32_to_cpu(node->hdr_crc),
 				     hdr_crc);
@@ -565,7 +566,7 @@
 			continue;
 		}
 
-		if (ofs + je32_to_cpu(node->totlen) > 
+		if (ofs + je32_to_cpu(node->totlen) >
 		    jeb->offset + c->sector_size) {
 			/* Eep. Node goes over the end of the erase block. */
 			printk(KERN_WARNING "Node at 0x%08x with length 0x%08x would run over the end of the erase block\n",
@@ -597,10 +598,11 @@
 				node = (void *)buf;
 			}
 			err = jffs2_scan_inode_node(c, jeb, (void *)node, ofs, s);
-			if (err) return err;
+			if (err)
+				return err;
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
-			
+
 		case JFFS2_NODETYPE_DIRENT:
 			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
 				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
@@ -613,14 +615,15 @@
 				node = (void *)buf;
 			}
 			err = jffs2_scan_dirent_node(c, jeb, (void *)node, ofs, s);
-			if (err) return err;
+			if (err)
+				return err;
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
 
 		case JFFS2_NODETYPE_CLEANMARKER:
 			D1(printk(KERN_DEBUG "CLEANMARKER node found at 0x%08x\n", ofs));
 			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
-				printk(KERN_NOTICE "CLEANMARKER node found at 0x%08x has totlen 0x%x != normal 0x%x\n", 
+				printk(KERN_NOTICE "CLEANMARKER node found at 0x%08x has totlen 0x%x != normal 0x%x\n",
 				       ofs, je32_to_cpu(node->totlen), c->cleanmarker_size);
 				DIRTY_SPACE(PAD(sizeof(struct jffs2_unknown_node)));
 				ofs += PAD(sizeof(struct jffs2_unknown_node));
@@ -639,7 +642,7 @@
 				marker_ref->flash_offset = ofs | REF_NORMAL;
 				marker_ref->__totlen = c->cleanmarker_size;
 				jeb->first_node = jeb->last_node = marker_ref;
-			     
+
 				USED_SPACE(PAD(c->cleanmarker_size));
 				ofs += PAD(c->cleanmarker_size);
 			}
@@ -690,7 +693,7 @@
 		}
 	}
 
-	D1(printk(KERN_DEBUG "Block at 0x%08x: free 0x%08x, dirty 0x%08x, unchecked 0x%08x, used 0x%08x\n", jeb->offset, 
+	D1(printk(KERN_DEBUG "Block at 0x%08x: free 0x%08x, dirty 0x%08x, unchecked 0x%08x, used 0x%08x\n", jeb->offset,
 		  jeb->free_size, jeb->dirty_size, jeb->unchecked_size, jeb->used_size));
 
 	/* mark_node_obsolete can add to wasted !! */
@@ -730,7 +733,7 @@
 	return ic;
 }
 
-static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_inode *ri, uint32_t ofs, struct jffs2_summary *s)
 {
 	struct jffs2_raw_node_ref *raw;
@@ -740,11 +743,11 @@
 	D1(printk(KERN_DEBUG "jffs2_scan_inode_node(): Node at 0x%08x\n", ofs));
 
 	/* We do very little here now. Just check the ino# to which we should attribute
-	   this node; we can do all the CRC checking etc. later. There's a tradeoff here -- 
+	   this node; we can do all the CRC checking etc. later. There's a tradeoff here --
 	   we used to scan the flash once only, reading everything we want from it into
 	   memory, then building all our in-core data structures and freeing the extra
 	   information. Now we allow the first part of the mount to complete a lot quicker,
-	   but we have to go _back_ to the flash in order to finish the CRC checking, etc. 
+	   but we have to go _back_ to the flash in order to finish the CRC checking, etc.
 	   Which means that the _full_ amount of time to get to proper write mode with GC
 	   operational may actually be _longer_ than before. Sucks to be me. */
 
@@ -790,7 +793,7 @@
 		jeb->last_node->next_phys = raw;
 	jeb->last_node = raw;
 
-	D1(printk(KERN_DEBUG "Node is ino #%u, version %d. Range 0x%x-0x%x\n", 
+	D1(printk(KERN_DEBUG "Node is ino #%u, version %d. Range 0x%x-0x%x\n",
 		  je32_to_cpu(ri->ino), je32_to_cpu(ri->version),
 		  je32_to_cpu(ri->offset),
 		  je32_to_cpu(ri->offset)+je32_to_cpu(ri->dsize)));
@@ -806,7 +809,7 @@
 	return 0;
 }
 
-static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
+static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				  struct jffs2_raw_dirent *rd, uint32_t ofs, struct jffs2_summary *s)
 {
 	struct jffs2_raw_node_ref *raw;
@@ -840,7 +843,7 @@
 	crc = crc32(0, fd->name, rd->nsize);
 	if (crc != je32_to_cpu(rd->name_crc)) {
 		printk(KERN_NOTICE "jffs2_scan_dirent_node(): Name CRC failed on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
-		       ofs, je32_to_cpu(rd->name_crc), crc);	
+		       ofs, je32_to_cpu(rd->name_crc), crc);
 		D1(printk(KERN_NOTICE "Name for which CRC failed is (now) '%s', ino #%d\n", fd->name, je32_to_cpu(rd->ino)));
 		jffs2_free_full_dirent(fd);
 		/* FIXME: Why do we believe totlen? */
@@ -860,7 +863,7 @@
 		jffs2_free_raw_node_ref(raw);
 		return -ENOMEM;
 	}
-	
+
 	raw->__totlen = PAD(je32_to_cpu(rd->totlen));
 	raw->flash_offset = ofs | REF_PRISTINE;
 	raw->next_phys = NULL;
@@ -906,7 +909,7 @@
 	struct list_head *n = head->next;
 
 	list_del(head);
-	while(count--) {
+	while (count--) {
 		n = n->next;
 	}
 	list_add(head, n);
diff -uNr mtd/fs/jffs2/summary.c mtd-whitespace/fs/jffs2/summary.c
--- mtd/fs/jffs2/summary.c	2005-09-21 16:20:33.000000000 -0600
+++ mtd-whitespace/fs/jffs2/summary.c	2005-09-22 16:59:43.023763624 -0600
@@ -73,17 +73,17 @@
 			s->sum_size += JFFS2_SUMMARY_INODE_SIZE;
 			s->sum_num++;
 			dbg_summary("inode (%u) added to summary\n",
-						je32_to_cpu(item->i.inode));
+					je32_to_cpu(item->i.inode));
 			break;
 		case JFFS2_NODETYPE_DIRENT:
 			s->sum_size += JFFS2_SUMMARY_DIRENT_SIZE(item->d.nsize);
 			s->sum_num++;
 			dbg_summary("dirent (%u) added to summary\n",
-						je32_to_cpu(item->d.ino));
+					je32_to_cpu(item->d.ino));
 			break;
 		default:
-			JFFS2_WARNING("UNKNOWN node type %u\n", 
-					    je16_to_cpu(item->u.nodetype));
+			JFFS2_WARNING("UNKNOWN node type %u\n",
+					je16_to_cpu(item->u.nodetype));
 			return 1;
 	}
 	return 0;
@@ -174,7 +174,7 @@
 	s->sum_size = JFFS2_SUMMARY_NOSUM_SIZE;
 }
 
-int jffs2_sum_is_disabled(struct jffs2_summary *s) 
+int jffs2_sum_is_disabled(struct jffs2_summary *s)
 {
 	return (s->sum_size == JFFS2_SUMMARY_NOSUM_SIZE);
 }
@@ -245,11 +245,11 @@
 
 			switch (count) {
 				case 1:
-					memcpy(temp->name,node->d.name,node->d.nsize);
+					memcpy(temp->name, node->d.name, node->d.nsize);
 					break;
 
 				case 2:
-					memcpy(temp->name,invecs[1].iov_base,node->d.nsize);
+					memcpy(temp->name, invecs[1].iov_base, node->d.nsize);
 					break;
 
 				default:
@@ -302,7 +302,7 @@
 
 	sp = summary->sum;
 
-	for (i=0; i<je32_to_cpu(summary->sum_num); i++) {
+	for (i = 0; i < je32_to_cpu(summary->sum_num); i++) {
 		dbg_summary("processing summary index %d\n", i);
 
 		switch (je16_to_cpu(((struct jffs2_sum_unknown_flash *)sp)->nodetype)) {
@@ -482,7 +482,7 @@
 		goto crc_err;
 	}
 
-	if ( je32_to_cpu(summary->cln_mkr) ) {
+	if (je32_to_cpu(summary->cln_mkr)) {
 
 		dbg_summary("Summary : CLEANMARKER node \n");
 
@@ -509,7 +509,7 @@
 			marker_ref->__totlen = je32_to_cpu(summary->cln_mkr);
 			jeb->first_node = jeb->last_node = marker_ref;
 
-			USED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
+			USED_SPACE(PAD(je32_to_cpu(summary->cln_mkr)));
 		}
 	}
 
@@ -609,7 +609,7 @@
 				sdrnt_ptr->nsize = c->summary->sum_list_head->d.nsize;
 				sdrnt_ptr->type = c->summary->sum_list_head->d.type;
 
-				memcpy(sdrnt_ptr->name, c->summary->sum_list_head->d.name, 
+				memcpy(sdrnt_ptr->name, c->summary->sum_list_head->d.name,
 							c->summary->sum_list_head->d.nsize);
 
 				wpage += JFFS2_SUMMARY_DIRENT_SIZE(c->summary->sum_list_head->d.nsize);
@@ -687,7 +687,7 @@
 	datasize = c->summary->sum_size + sizeof(struct jffs2_sum_marker);
 	infosize = sizeof(struct jffs2_summary_node) + datasize;
 	padsize = jeb->free_size - infosize;
-	infosize += padsize; 
+	infosize += padsize;
 	datasize += padsize;
 
 	/* Is there enough space for summary? */
diff -uNr mtd/fs/jffs2/summary.h mtd-whitespace/fs/jffs2/summary.h
--- mtd/fs/jffs2/summary.h	2005-09-07 02:34:54.000000000 -0600
+++ mtd-whitespace/fs/jffs2/summary.h	2005-09-22 16:55:44.739988264 -0600
@@ -21,19 +21,19 @@
 #define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
 		c->free_size -= _x; c->dirty_size += _x; \
 		jeb->free_size -= _x ; jeb->dirty_size += _x; \
-		}while(0)
+		}while (0)
 #define USED_SPACE(x) do { typeof(x) _x = (x); \
 		c->free_size -= _x; c->used_size += _x; \
 		jeb->free_size -= _x ; jeb->used_size += _x; \
-		}while(0)
+		}while (0)
 #define WASTED_SPACE(x) do { typeof(x) _x = (x); \
 		c->free_size -= _x; c->wasted_size += _x; \
 		jeb->free_size -= _x ; jeb->wasted_size += _x; \
-		}while(0)
+		}while (0)
 #define UNCHECKED_SPACE(x) do { typeof(x) _x = (x); \
 		c->free_size -= _x; c->unchecked_size += _x; \
 		jeb->free_size -= _x ; jeb->unchecked_size += _x; \
-		}while(0)
+		}while (0)
 
 #define BLK_STATE_ALLFF		0
 #define BLK_STATE_CLEAN		1
@@ -59,7 +59,7 @@
 	jint32_t inode;		/* inode number */
 	jint32_t version;	/* inode version */
 	jint32_t offset;	/* offset on jeb */
-	jint32_t totlen; 	/* record length */
+	jint32_t totlen;	/* record length */
 } __attribute__((packed));
 
 struct jffs2_sum_dirent_flash
@@ -69,7 +69,7 @@
 	jint32_t offset;	/* offset on jeb */
 	jint32_t pino;		/* parent inode */
 	jint32_t version;	/* dirent version */
-	jint32_t ino; 		/* == zero for unlink */
+	jint32_t ino;		/* == zero for unlink */
 	uint8_t nsize;		/* dirent name size */
 	uint8_t type;		/* dirent type */
 	uint8_t name[0];	/* dirent name */
@@ -97,7 +97,7 @@
 	jint32_t inode;		/* inode number */
 	jint32_t version;	/* inode version */
 	jint32_t offset;	/* offset on jeb */
-	jint32_t totlen; 	/* record length */
+	jint32_t totlen;	/* record length */
 } __attribute__((packed));
 
 struct jffs2_sum_dirent_mem
@@ -108,7 +108,7 @@
 	jint32_t offset;	/* ofset on jeb */
 	jint32_t pino;		/* parent inode */
 	jint32_t version;	/* dirent version */
-	jint32_t ino; 		/* == zero for unlink */
+	jint32_t ino;		/* == zero for unlink */
 	uint8_t nsize;		/* dirent name size */
 	uint8_t type;		/* dirent type */
 	uint8_t name[0];	/* dirent name */
@@ -139,7 +139,7 @@
 struct jffs2_sum_marker
 {
 	jint32_t offset;	/* offset of the summary node in the jeb */
-	jint32_t magic; 	/* == JFFS2_SUM_MAGIC */
+	jint32_t magic;		/* == JFFS2_SUM_MAGIC */
 };
 
 #define JFFS2_SUMMARY_FRAME_SIZE (sizeof(struct jffs2_summary_node) + sizeof(struct jffs2_sum_marker))
@@ -170,13 +170,13 @@
 #define jffs2_sum_disable_collecting(a)
 #define jffs2_sum_is_disabled(a) (0)
 #define jffs2_sum_reset_collected(a)
-#define jffs2_sum_add_kvec(a,b,c,d) (0)
-#define jffs2_sum_move_collected(a,b)
+#define jffs2_sum_add_kvec(a, b, c, d) (0)
+#define jffs2_sum_move_collected(a, b)
 #define jffs2_sum_write_sumnode(a) (0)
-#define jffs2_sum_add_padding_mem(a,b)
-#define jffs2_sum_add_inode_mem(a,b,c)
-#define jffs2_sum_add_dirent_mem(a,b,c)
-#define jffs2_sum_scan_sumnode(a,b,c,d) (0)
+#define jffs2_sum_add_padding_mem(a, b)
+#define jffs2_sum_add_inode_mem(a, b, c)
+#define jffs2_sum_add_dirent_mem(a, b, c)
+#define jffs2_sum_scan_sumnode(a, b, c, d) (0)
 
 #endif /* CONFIG_JFFS2_SUMMARY */
 
diff -uNr mtd/fs/jffs2/super.c mtd-whitespace/fs/jffs2/super.c
--- mtd/fs/jffs2/super.c	2005-09-07 13:04:15.000000000 -0600
+++ mtd-whitespace/fs/jffs2/super.c	2005-09-22 15:55:02.753654344 -0600
@@ -62,7 +62,7 @@
 
 	down(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
-	up(&c->alloc_sem);	
+	up(&c->alloc_sem);
 	return 0;
 }
 
@@ -112,8 +112,8 @@
 }
 
 static struct super_block *jffs2_get_sb_mtd(struct file_system_type *fs_type,
-					      int flags, const char *dev_name, 
-					      void *data, struct mtd_info *mtd)
+					    int flags, const char *dev_name,
+					    void *data, struct mtd_info *mtd)
 {
 	struct super_block *sb;
 	struct jffs2_sb_info *c;
@@ -172,7 +172,7 @@
 }
 
 static struct super_block *jffs2_get_sb_mtdnr(struct file_system_type *fs_type,
-					      int flags, const char *dev_name, 
+					      int flags, const char *dev_name,
 					      void *data, int mtdnr)
 {
 	struct mtd_info *mtd;
@@ -201,7 +201,7 @@
 
 	/* The preferred way of mounting in future; especially when
 	   CONFIG_BLK_DEV is implemented - we specify the underlying
-	   MTD device by number or by name, so that we don't require 
+	   MTD device by number or by name, so that we don't require
 	   block device support to be present in the kernel. */
 
 	/* FIXME: How to do the root fs this way? */
@@ -225,7 +225,7 @@
 		} else if (isdigit(dev_name[3])) {
 			/* Mount by MTD device number name */
 			char *endptr;
-			
+
 			mtdnr = simple_strtoul(dev_name+3, &endptr, 0);
 			if (!*endptr) {
 				/* It was a valid number */
@@ -235,7 +235,7 @@
 		}
 	}
 
-	/* Try the old way - the hack where we allowed users to mount 
+	/* Try the old way - the hack where we allowed users to mount
 	   /dev/mtdblock$(n) but didn't actually _use_ the blkdev */
 
 	err = path_lookup(dev_name, LOOKUP_FOLLOW, &nd);
@@ -376,5 +376,5 @@
 
 MODULE_DESCRIPTION("The Journalling Flash File System, v2");
 MODULE_AUTHOR("Red Hat, Inc.");
-MODULE_LICENSE("GPL"); // Actually dual-licensed, but it doesn't matter for 
-		       // the sake of this tag. It's Free Software.
+MODULE_LICENSE("GPL"); /* Actually dual-licensed, but it doesn't matter for
+		        * the sake of this tag. It's Free Software. */
diff -uNr mtd/fs/jffs2/super-v24.c mtd-whitespace/fs/jffs2/super-v24.c
--- mtd/fs/jffs2/super-v24.c	2005-09-07 13:04:15.000000000 -0600
+++ mtd-whitespace/fs/jffs2/super-v24.c	2005-09-22 15:55:34.254865432 -0600
@@ -43,7 +43,6 @@
 	.dirty_inode =	jffs2_dirty_inode,
 };
 
-
 static struct super_block *jffs2_read_super(struct super_block *sb, void *data, int silent)
 {
 	struct jffs2_sb_info *c;
@@ -92,7 +91,6 @@
 
 	D2(printk(KERN_DEBUG "jffs2: jffs2_put_super()\n"));
 
-
 	if (!(sb->s_flags & MS_RDONLY))
 		jffs2_stop_garbage_collect_thread(c);
 	down(&c->alloc_sem);
@@ -112,7 +110,7 @@
 	if (c->mtd->sync)
 		c->mtd->sync(c->mtd);
 	put_mtd_device(c->mtd);
-	
+
 	D1(printk(KERN_DEBUG "jffs2_put_super returning\n"));
 }
 
@@ -134,13 +132,13 @@
 #ifdef JFFS2_OUT_OF_KERNEL
 	/* sanity checks. Could we do these at compile time? */
 	if (sizeof(struct jffs2_sb_info) > sizeof (((struct super_block *)NULL)->u)) {
-		printk(KERN_ERR "JFFS2 error: struct jffs2_sb_info (%d bytes) doesn't fit in the super_block union (%d bytes)\n", 
+		printk(KERN_ERR "JFFS2 error: struct jffs2_sb_info (%d bytes) doesn't fit in the super_block union (%d bytes)\n",
 		       sizeof(struct jffs2_sb_info), sizeof (((struct super_block *)NULL)->u));
 		return -EIO;
 	}
 
 	if (sizeof(struct jffs2_inode_info) > sizeof (((struct inode *)NULL)->u)) {
-		printk(KERN_ERR "JFFS2 error: struct jffs2_inode_info (%d bytes) doesn't fit in the inode union (%d bytes)\n", 
+		printk(KERN_ERR "JFFS2 error: struct jffs2_inode_info (%d bytes) doesn't fit in the inode union (%d bytes)\n",
 		       sizeof(struct jffs2_inode_info), sizeof (((struct inode *)NULL)->u));
 		return -EIO;
 	}
@@ -182,5 +180,5 @@
 
 MODULE_DESCRIPTION("The Journalling Flash File System, v2");
 MODULE_AUTHOR("Red Hat, Inc.");
-MODULE_LICENSE("GPL"); // Actually dual-licensed, but it doesn't matter for 
-		       // the sake of this tag. It's Free Software.
+MODULE_LICENSE("GPL"); /* Actually dual-licensed, but it doesn't matter for
+		        * the sake of this tag. It's Free Software. */
diff -uNr mtd/fs/jffs2/symlink.c mtd-whitespace/fs/jffs2/symlink.c
--- mtd/fs/jffs2/symlink.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/symlink.c	2005-09-22 17:17:33.318054160 -0600
@@ -11,7 +11,6 @@
  *
  */
 
-
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
@@ -21,7 +20,7 @@
 static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd);
 
 struct inode_operations jffs2_symlink_inode_operations =
-{	
+{
 	.readlink =	generic_readlink,
 	.follow_link =	jffs2_follow_link,
 	.setattr =	jffs2_setattr
@@ -30,7 +29,7 @@
 static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(dentry->d_inode);
-	
+
 	/*
 	 * We don't acquire the f->sem mutex here since the only data we
 	 * use is f->target.
@@ -43,7 +42,7 @@
 	 * stopped using our f->target string which we provide by means of
 	 * nd_set_link() call.
 	 */
-	
+
 	if (!f->target) {
 		printk(KERN_ERR "jffs2_follow_link(): can't find symlink taerget\n");
 		return -EIO;
@@ -51,7 +50,7 @@
 	D1(printk(KERN_DEBUG "jffs2_follow_link(): target path is '%s'\n", (char *) f->target));
 
 	nd_set_link(nd, (char *)f->target);
-	
+
 	/*
 	 * We will unlock the f->sem mutex but VFS will use the f->target string. This is safe
 	 * since the only way that may cause f->target to be changed is iput() operation.
diff -uNr mtd/fs/jffs2/symlink-v24.c mtd-whitespace/fs/jffs2/symlink-v24.c
--- mtd/fs/jffs2/symlink-v24.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/symlink-v24.c	2005-09-22 17:17:36.253607888 -0600
@@ -11,7 +11,6 @@
  *
  */
 
-
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
@@ -21,7 +20,7 @@
 int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd);
 
 struct inode_operations jffs2_symlink_inode_operations =
-{	
+{
 	.readlink =	jffs2_readlink,
 	.follow_link =	jffs2_follow_link,
 	.setattr =	jffs2_setattr
@@ -47,6 +46,6 @@
 		printk(KERN_ERR "jffs2_follow_link(): can't find symlink taerget\n");
 		return -EIO;
 	}
-	
+
 	return vfs_follow_link(nd, (char *)f->target);
 }
diff -uNr mtd/fs/jffs2/test/histo1.h mtd-whitespace/fs/jffs2/test/histo1.h
--- mtd/fs/jffs2/test/histo1.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/histo1.h	2005-09-22 13:39:05.953676424 -0600
@@ -1,2 +1,2 @@
-#define BIT_DIVIDER 755 
+#define BIT_DIVIDER 755
 static int bits[9] = { 108,125,128,93,84,89,119,94,};
diff -uNr mtd/fs/jffs2/test/histo2.h mtd-whitespace/fs/jffs2/test/histo2.h
--- mtd/fs/jffs2/test/histo2.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/histo2.h	2005-09-22 13:39:05.893685544 -0600
@@ -1,2 +1,2 @@
-#define BIT_DIVIDER 504 
+#define BIT_DIVIDER 504
 static int bits[9] = { 250,210,239,238,233,307,237,144,};
diff -uNr mtd/fs/jffs2/test/histo.cc mtd-whitespace/fs/jffs2/test/histo.cc
--- mtd/fs/jffs2/test/histo.cc	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/histo.cc	2005-09-22 13:39:05.903684024 -0600
@@ -6,23 +6,23 @@
 int histo2[256];
 int bits[8];
 int total;
-void main() 
+void main()
 {
 	FILE *file;
 	int i,i2;
 
-	int max=0; 
-	
+	int max=0;
+
 /*	file = fopen("/lib/libc-2.2.so","r"); */
 	file = fopen("bigsymb2","r");
 	assert(file!=NULL);
 	while (!feof(file)) {
 		unsigned char cr;
 		fread(&cr,1,1,file);
-		histo[cr]++;		
+		histo[cr]++;
 		if (histo[cr]>max)
 			max = histo[cr];
-	}	
+	}
 	fclose(file);
 
 	i2 = 0;
@@ -31,24 +31,24 @@
 	printf("static int xlate[257] = { ");
 
 
-	
+
 	/* Ugh slow */
-	while (max>=0) {	
-		for (i=0;i<256;i++) {	
+	while (max>=0) {
+		for (i=0;i<256;i++) {
 			if (histo[i]==max) {
 				printf("\t%i,\n",i);
 				histo2[i2++]=histo[i];
 			}
 		}
 		max--;
-	}	
+	}
 
 	printf(" };\n");
 
 	if (i2!=256)
 		printf("/* Uh oh: %i != 256 */ \n");
 #endif
-	
+
 	for (i=0;i<256;i++) {
 		if (i&128)
 			bits[7]+=histo[i];
@@ -68,13 +68,13 @@
 			bits[0]+=histo[i];
 		total+=histo[i];
 	}
-	
+
 	printf("#define BIT_DIVIDER %i \n",total>>12);
 	printf("static int bits[9] = { ");
 	for (i=0;i<8;i++)
 		if ((bits[i]>>12)>0)
 			printf("%i,",bits[i]>>12);
-		else 
+		else
 			printf("1, ");
 	printf("};\n");
 }
\ No newline at end of file
diff -uNr mtd/fs/jffs2/test/histo.h mtd-whitespace/fs/jffs2/test/histo.h
--- mtd/fs/jffs2/test/histo.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/histo.h	2005-09-22 13:39:05.974673232 -0600
@@ -1,2 +1,2 @@
-#define BIT_DIVIDER 1043 
+#define BIT_DIVIDER 1043
 static int bits[9] = { 277,249,290,267,229,341,212,241,};
diff -uNr mtd/fs/jffs2/test/histo_html.h mtd-whitespace/fs/jffs2/test/histo_html.h
--- mtd/fs/jffs2/test/histo_html.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/histo_html.h	2005-09-22 13:39:05.873688584 -0600
@@ -1,2 +1,2 @@
-#define BIT_DIVIDER 631 
+#define BIT_DIVIDER 631
 static int bits[9] = { 268,247,324,252,199,529,436,1, };
diff -uNr mtd/fs/jffs2/test/histo_text.h mtd-whitespace/fs/jffs2/test/histo_text.h
--- mtd/fs/jffs2/test/histo_text.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/histo_text.h	2005-09-22 13:39:05.883687064 -0600
@@ -1,2 +1,2 @@
-#define BIT_DIVIDER 1187 
+#define BIT_DIVIDER 1187
 static int bits[9] = { 518,418,533,414,310,1069,822,1, };
diff -uNr mtd/fs/jffs2/test/main.c mtd-whitespace/fs/jffs2/test/main.c
--- mtd/fs/jffs2/test/main.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/main.c	2005-09-22 13:39:05.963674904 -0600
@@ -5,7 +5,7 @@
 #define __u32 int
 
 /* _compress returns the compressed size, -1 if bigger */
-int rtime_compress(unsigned char *data_in, unsigned char *cpage_out, 
+int rtime_compress(unsigned char *data_in, unsigned char *cpage_out,
 		   __u32 *sourcelen, __u32 *dstlen);
 
 void rtime_decompress(unsigned char *data_in, unsigned char *cpage_out,
@@ -21,16 +21,16 @@
 	int i;
 	int len,maxlen;
 	FILE *file;
-	
+
 	memset(dest,0xA5,sizeof(dest));
-	
+
 	for (i=0;i<4096;i++)
 		source[i] = i;
-		
+
 	file=fopen("asd","r");
 	while (!feof(file)) {
 		fread(source,1,4096,file);
-	
+
 		len = 4096;
 		maxlen = 40960;
 		result = rubin_compress(source,compr,&len, &maxlen);
@@ -39,17 +39,17 @@
 			exit(0);
 		}
 		printf("Compressed to %i bytes \n",maxlen);
-		
+
 		if (maxlen>4096)
 			continue;
-	
+
 		rubin_decompress(compr,dest,4096,4096);
 		for (i=0;i<4096;i++)
 			if (source[i]!=dest[i]) {
 				printf("Mismatch at position %i: %i -> %i \n",i,source[i],dest[i]);
-			
+
 			}
-		
+
 	}
 	fclose(file);
 }
diff -uNr mtd/fs/jffs2/test/rtime.h mtd-whitespace/fs/jffs2/test/rtime.h
--- mtd/fs/jffs2/test/rtime.h	2005-08-30 15:47:52.000000000 -0600
+++ mtd-whitespace/fs/jffs2/test/rtime.h	2005-09-22 13:39:05.944677792 -0600
@@ -1,7 +1,7 @@
 #define __u32 int
 
 /* _compress returns the compressed size, -1 if bigger */
-int rtime_compress(unsigned char *data_in, unsigned char *cpage_out, 
+int rtime_compress(unsigned char *data_in, unsigned char *cpage_out,
 		   __u32 *sourcelen, __u32 *dstlen);
 
 void rtime_decompress(unsigned char *data_in, unsigned char *cpage_out,
diff -uNr mtd/fs/jffs2/TODO mtd-whitespace/fs/jffs2/TODO
--- mtd/fs/jffs2/TODO	2005-09-22 10:05:11.000000000 -0600
+++ mtd-whitespace/fs/jffs2/TODO	2005-09-22 13:39:06.017666696 -0600
@@ -10,7 +10,7 @@
  - fine-tune the allocation / GC thresholds
  - chattr support - turning on/off and tuning compression per-inode
  - checkpointing (do we need this? scan is quite fast)
- - make the scan code populate real inodes so read_inode just after 
+ - make the scan code populate real inodes so read_inode just after
 	mount doesn't have to read the flash twice for large files.
 	Make this a per-inode option, changable with chattr, so you can
 	decide which inodes should be in-core immediately after mount.
@@ -26,13 +26,13 @@
 	nodes to a different one, we can separate clean nodes from those which
 	are likely to become dirty, and end up with blocks which are each far
 	closer to 100% or 0% clean, hence speeding up later GC progress dramatically.
-   - Stop keeping name in-core with struct jffs2_full_dirent. If we keep the hash in 
+   - Stop keeping name in-core with struct jffs2_full_dirent. If we keep the hash in
      the full dirent, we only need to go to the flash in lookup() when we think we've
-     got a match, and in readdir(). 
+     got a match, and in readdir().
    - Doubly-linked next_in_ino list to allow us to free obsoleted raw_node_refs immediately?
    - Remove totlen from jffs2_raw_node_ref? Need to have totlen passed into
 	jffs2_mark_node_obsolete(). Can all callers work it out?
-   - Remove size from jffs2_raw_node_frag. 
+   - Remove size from jffs2_raw_node_frag.
 
 dedekind:
 1. __jffs2_flush_wbuf() has a strange 'pad' parameter. Eliminate.
diff -uNr mtd/fs/jffs2/wbuf.c mtd-whitespace/fs/jffs2/wbuf.c
--- mtd/fs/jffs2/wbuf.c	2005-09-21 16:20:34.000000000 -0600
+++ mtd-whitespace/fs/jffs2/wbuf.c	2005-09-22 17:18:00.441930704 -0600
@@ -29,7 +29,7 @@
 #endif
 
 /* max. erase failures before we mark a block bad */
-#define MAX_ERASE_FAILURES 	2
+#define MAX_ERASE_FAILURES	2
 
 struct jffs2_inodirty {
 	uint32_t ino;
@@ -158,7 +158,7 @@
 	jeb->free_size = 0;
 
 	jffs2_dbg_dump_block_lists_nolock(c);
-	jffs2_dbg_acct_sanity_check_nolock(c,jeb);
+	jffs2_dbg_acct_sanity_check_nolock(c, jeb);
 	jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
 }
 
@@ -183,7 +183,7 @@
 	/* Find the first node to be recovered, by skipping over every
 	   node which ends before the wbuf starts, or which is obsolete. */
 	first_raw = &jeb->first_node;
-	while (*first_raw && 
+	while (*first_raw &&
 	       (ref_obsolete(*first_raw) ||
 		(ref_offset(*first_raw)+ref_totlen(c, jeb, *first_raw)) < c->wbuf_ofs)) {
 		D1(printk(KERN_DEBUG "Skipping node at 0x%08x(%d)-0x%08x which is either before 0x%08x or obsolete\n",
@@ -232,7 +232,7 @@
 			ret = c->mtd->read_ecc(c->mtd, start, c->wbuf_ofs - start, &retlen, buf, NULL, c->oobinfo);
 		else
 			ret = c->mtd->read(c->mtd, start, c->wbuf_ofs - start, &retlen, buf);
-		
+
 		if (ret == -EBADMSG && retlen == c->wbuf_ofs - start) {
 			/* ECC recovered */
 			ret = 0;
@@ -269,15 +269,15 @@
 	if (end-start >= c->wbuf_pagesize) {
 		/* Need to do another write immediately, but it's possible
 		   that this is just because the wbuf itself is completely
-		   full, and there's nothing earlier read back from the 
-		   flash. Hence 'buf' isn't necessarily what we're writing 
+		   full, and there's nothing earlier read back from the
+		   flash. Hence 'buf' isn't necessarily what we're writing
 		   from. */
 		unsigned char *rewrite_buf = buf?:c->wbuf;
 		uint32_t towrite = (end-start) - ((end-start)%c->wbuf_pagesize);
 
 		D1(printk(KERN_DEBUG "Write 0x%x bytes at 0x%08x in wbuf recover\n",
 			  towrite, ofs));
-	  
+
 #ifdef BREAKMEHEADER
 		static int breakme;
 		if (breakme++ == 20) {
@@ -382,8 +382,7 @@
 		list_add(&jeb->list, &c->erase_pending_list);
 		c->nr_erasing_blocks++;
 		jffs2_erase_pending_trigger(c);
-	}
-	else
+	} else
 		jeb->last_node = container_of(first_raw, struct jffs2_raw_node_ref, next_phys);
 
 	jffs2_dbg_acct_sanity_check_nolock(c, jeb);
@@ -429,7 +428,7 @@
 	   this happens, if we have a change to a new block,
 	   or if fsync forces us to flush the writebuffer.
 	   if we have a switch to next page, we will not have
-	   enough remaining space for this. 
+	   enough remaining space for this.
 	*/
 	if (pad && !jffs2_dataflash(c)) {
 		c->wbuf_len = PAD(c->wbuf_len);
@@ -437,8 +436,8 @@
 		/* Pad with JFFS2_DIRTY_BITMASK initially.  this helps out ECC'd NOR
 		   with 8 byte page size */
 		memset(c->wbuf + c->wbuf_len, 0, c->wbuf_pagesize - c->wbuf_len);
-		
-		if ( c->wbuf_len + sizeof(struct jffs2_unknown_node) < c->wbuf_pagesize) {
+
+		if (c->wbuf_len + sizeof(struct jffs2_unknown_node) < c->wbuf_pagesize) {
 			struct jffs2_unknown_node *padnode = (void *)(c->wbuf + c->wbuf_len);
 			padnode->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 			padnode->nodetype = cpu_to_je16(JFFS2_NODETYPE_PADDING);
@@ -448,7 +447,7 @@
 	}
 	/* else jffs2_flash_writev has actually filled in the rest of the
 	   buffer for us, and will deal with the node refs etc. later. */
-	
+
 #ifdef BREAKME
 	static int breakme;
 	if (breakme++ == 20) {
@@ -457,9 +456,9 @@
 		c->mtd->write_ecc(c->mtd, c->wbuf_ofs, c->wbuf_pagesize,
 					&retlen, brokenbuf, NULL, c->oobinfo);
 		ret = -EIO;
-	} else 
+	} else
 #endif
-	
+
 	if (jffs2_cleanmarker_oob(c))
 		ret = c->mtd->write_ecc(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen, c->wbuf, NULL, c->oobinfo);
 	else
@@ -467,7 +466,7 @@
 
 	if (ret || retlen != c->wbuf_pagesize) {
 		if (ret)
-			printk(KERN_WARNING "jffs2_flush_wbuf(): Write failed with %d\n",ret);
+			printk(KERN_WARNING "jffs2_flush_wbuf(): Write failed with %d\n", ret);
 		else {
 			printk(KERN_WARNING "jffs2_flush_wbuf(): Write was short: %zd instead of %d\n",
 				retlen, c->wbuf_pagesize);
@@ -488,9 +487,9 @@
 		jeb = &c->blocks[c->wbuf_ofs / c->sector_size];
 
 		D1(printk(KERN_DEBUG "jffs2_flush_wbuf() adjusting free_size of %sblock at %08x\n",
-			  (jeb==c->nextblock)?"next":"", jeb->offset));
+			  (jeb == c->nextblock) ? "next" : "", jeb->offset));
 
-		/* wbuf_pagesize - wbuf_len is the amount of space that's to be 
+		/* wbuf_pagesize - wbuf_len is the amount of space that's to be
 		   padded. If there is less free space in the block than that,
 		   something screwed up */
 		if (jeb->free_size < (c->wbuf_pagesize - c->wbuf_len)) {
@@ -511,16 +510,16 @@
 	jffs2_clear_wbuf_ino_list(c);
 	spin_unlock(&c->erase_completion_lock);
 
-	memset(c->wbuf,0xff,c->wbuf_pagesize);
+	memset(c->wbuf, 0xff, c->wbuf_pagesize);
 	/* adjust write buffer offset, else we get a non contiguous write bug */
 	c->wbuf_ofs += c->wbuf_pagesize;
 	c->wbuf_len = 0;
 	return 0;
 }
 
-/* Trigger garbage collection to flush the write-buffer. 
+/* Trigger garbage collection to flush the write-buffer.
    If ino arg is zero, do it if _any_ real (i.e. not GC) writes are
-   outstanding. If ino arg non-zero, do it only if a write for the 
+   outstanding. If ino arg non-zero, do it only if a write for the
    given inode is outstanding. */
 int jffs2_flush_wbuf_gc(struct jffs2_sb_info *c, uint32_t ino)
 {
@@ -601,11 +600,11 @@
 }
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-#define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
-#define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned long)(c->wbuf_pagesize) )
+#define PAGE_DIV(x) (((unsigned long)(x) / (unsigned long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize))
+#define PAGE_MOD(x) ((unsigned long)(x) % (unsigned long)(c->wbuf_pagesize))
 #else
-#define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
-#define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
+#define PAGE_DIV(x) ((x) & (~(c->wbuf_pagesize - 1)))
+#define PAGE_MOD(x) ((x) & (c->wbuf_pagesize - 1))
 #endif
 
 int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino)
@@ -624,14 +623,14 @@
 	/* If not NAND flash, don't bother */
 	if (!jffs2_is_writebuffered(c))
 		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
-	
+
 	down_write(&c->wbuf_sem);
 
 	/* If wbuf_ofs is not initialized, set it to target address */
 	if (c->wbuf_ofs == 0xFFFFFFFF) {
 		c->wbuf_ofs = PAGE_DIV(to);
-		c->wbuf_len = PAGE_MOD(to);			
-		memset(c->wbuf,0xff,c->wbuf_pagesize);
+		c->wbuf_len = PAGE_MOD(to);
+		memset(c->wbuf, 0xff, c->wbuf_pagesize);
 	}
 
 	/* Fixup the wbuf if we are moving to a new eraseblock.  The checks below
@@ -641,13 +640,13 @@
 		if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
 			c->wbuf_ofs = PAGE_DIV(to);
 			c->wbuf_len = PAGE_MOD(to);
-			memset(c->wbuf,0xff,c->wbuf_pagesize);
+			memset(c->wbuf, 0xff, c->wbuf_pagesize);
 		}
 	}
-	
-	/* Sanity checks on target address. 
-	   It's permitted to write at PAD(c->wbuf_len+c->wbuf_ofs), 
-	   and it's permitted to write at the beginning of a new 
+
+	/* Sanity checks on target address.
+	   It's permitted to write at PAD(c->wbuf_len+c->wbuf_ofs),
+	   and it's permitted to write at the beginning of a new
 	   erase block. Anything else, and you die.
 	   New block starts at xxx000c (0-b = block header)
 	*/
@@ -665,8 +664,8 @@
 		}
 		/* set pointer to new block */
 		c->wbuf_ofs = PAGE_DIV(to);
-		c->wbuf_len = PAGE_MOD(to);			
-	} 
+		c->wbuf_len = PAGE_MOD(to);
+	}
 
 	if (to != PAD(c->wbuf_ofs + c->wbuf_len)) {
 		/* We're not writing immediately after the writebuffer. Bad. */
@@ -686,21 +685,21 @@
 	invec = 0;
 	outvec = 0;
 
-	/* Fill writebuffer first, if already in use */	
+	/* Fill writebuffer first, if already in use */
 	if (c->wbuf_len) {
 		uint32_t invec_ofs = 0;
 
-		/* adjust alignment offset */ 
+		/* adjust alignment offset */
 		if (c->wbuf_len != PAGE_MOD(to)) {
 			c->wbuf_len = PAGE_MOD(to);
 			/* take care of alignment to next page */
 			if (!c->wbuf_len)
 				c->wbuf_len = c->wbuf_pagesize;
 		}
-		
-		while(c->wbuf_len < c->wbuf_pagesize) {
+
+		while (c->wbuf_len < c->wbuf_pagesize) {
 			uint32_t thislen;
-			
+
 			if (invec == count)
 				goto alldone;
 
@@ -708,17 +707,17 @@
 
 			if (thislen >= invecs[invec].iov_len)
 				thislen = invecs[invec].iov_len;
-	
+
 			invec_ofs = thislen;
 
 			memcpy(c->wbuf + c->wbuf_len, invecs[invec].iov_base, thislen);
 			c->wbuf_len += thislen;
 			donelen += thislen;
 			/* Get next invec, if actual did not fill the buffer */
-			if (c->wbuf_len < c->wbuf_pagesize) 
+			if (c->wbuf_len < c->wbuf_pagesize)
 				invec++;
-		}			
-		
+		}
+
 		/* write buffer is full, flush buffer */
 		ret = __jffs2_flush_wbuf(c, NOPAD);
 		if (ret) {
@@ -755,7 +754,7 @@
 
 	/* totlen holds the amount of data still to be written */
 	old_totlen = totlen;
-	for ( ; invec < count; invec++,outvec++ ) {
+	for (; invec < count; invec++, outvec++) {
 		outvecs[outvec].iov_base = invecs[invec].iov_base;
 		totlen += outvecs[outvec].iov_len = invecs[invec].iov_len;
 		if (PAGE_DIV(totlen) != PAGE_DIV(old_totlen)) {
@@ -777,10 +776,10 @@
 
 		/* We did cross a page boundary, so we write some now */
 		if (jffs2_cleanmarker_oob(c))
-			ret = c->mtd->writev_ecc(c->mtd, outvecs, splitvec+1, outvec_to, &wbuf_retlen, NULL, c->oobinfo); 
+			ret = c->mtd->writev_ecc(c->mtd, outvecs, splitvec+1, outvec_to, &wbuf_retlen, NULL, c->oobinfo);
 		else
 			ret = jffs2_flash_direct_writev(c, outvecs, splitvec+1, outvec_to, &wbuf_retlen);
-		
+
 		if (ret < 0 || wbuf_retlen != PAGE_DIV(totlen)) {
 			/* At this point we have no problem,
 			   c->wbuf is empty. However refile nextblock to avoid
@@ -797,7 +796,7 @@
 			spin_unlock(&c->erase_completion_lock);
 			goto exit;
 		}
-		
+
 		donelen += wbuf_retlen;
 		c->wbuf_ofs = PAGE_DIV(outvec_to) + PAGE_DIV(totlen);
 
@@ -816,7 +815,7 @@
 	   into the wbuf */
 	wbuf_ptr = c->wbuf;
 
-	for ( ; splitvec < outvec; splitvec++) {
+	for (; splitvec < outvec; splitvec++) {
 		/* Don't copy the wbuf into itself */
 		if (outvecs[splitvec].iov_base == c->wbuf)
 			continue;
@@ -841,16 +840,16 @@
 		jffs2_wbuf_dirties_inode(c, ino);
 
 	ret = 0;
-	
+
 exit:
 	up_write(&c->wbuf_sem);
 	return ret;
 }
 
 /*
- *	This is the entry for flash write.
- *	Check, if we work on NAND FLASH, if so build an kvec and write it via vritev
-*/
+ * This is the entry for flash write.
+ * Check, if we work on NAND FLASH, if so build an kvec and write it via vritev
+ */
 int jffs2_flash_write(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, const u_char *buf)
 {
 	struct kvec vecs[1];
@@ -864,8 +863,8 @@
 }
 
 /*
-	Handle readback from writebuffer and ECC failure return
-*/
+ * Handle readback from writebuffer and ECC failure return
+ */
 int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, u_char *buf)
 {
 	loff_t	orbf = 0, owbf = 0, lwbf = 0;
@@ -881,21 +880,21 @@
 	else
 		ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
 
-	if ( (ret == -EBADMSG) && (*retlen == len) ) {
+	if ((ret == -EBADMSG) && (*retlen == len)) {
 		printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx) returned ECC error\n",
 		       len, ofs);
-		/* 
-		 * We have the raw data without ECC correction in the buffer, maybe 
+		/*
+		 * We have the raw data without ECC correction in the buffer, maybe
 		 * we are lucky and all data or parts are correct. We check the node.
 		 * If data are corrupted node check will sort it out.
 		 * We keep this block, it will fail on write or erase and the we
 		 * mark it bad. Or should we do that now? But we should give him a chance.
-		 * Maybe we had a system crash or power loss before the ecc write or  
+		 * Maybe we had a system crash or power loss before the ecc write or
 		 * a erase was completed.
 		 * So we return success. :)
 		 */
-	 	ret = 0;
-	}	
+		ret = 0;
+	}
 
 	/* if no writebuffer available or write buffer empty, return */
 	if (!c->wbuf_pagesize || !c->wbuf_len)
@@ -910,18 +909,18 @@
 		if (owbf > c->wbuf_len)		/* is read beyond write buffer ? */
 			goto exit;
 		lwbf = c->wbuf_len - owbf;	/* number of bytes to copy */
-		if (lwbf > len)	
+		if (lwbf > len)
 			lwbf = len;
-	} else {	
+	} else {
 		orbf = (c->wbuf_ofs - ofs);	/* offset in read buffer */
 		if (orbf > len)			/* is write beyond write buffer ? */
 			goto exit;
-		lwbf = len - orbf; 		/* number of bytes to copy */
-		if (lwbf > c->wbuf_len)	
+		lwbf = len - orbf;		/* number of bytes to copy */
+		if (lwbf > c->wbuf_len)
 			lwbf = c->wbuf_len;
-	}	
+	}
 	if (lwbf > 0)
-		memcpy(buf+orbf,c->wbuf+owbf,lwbf);
+		memcpy(buf+orbf, c->wbuf+owbf, lwbf);
 
 exit:
 	up_read(&c->wbuf_sem);
@@ -929,14 +928,14 @@
 }
 
 /*
- *	Check, if the out of band area is empty
+ * Check, if the out of band area is empty
  */
-int jffs2_check_oob_empty( struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, int mode)
+int jffs2_check_oob_empty(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, int mode)
 {
 	unsigned char *buf;
-	int 	ret = 0;
-	int	i,len,page;
-	size_t  retlen;
+	int	ret = 0;
+	int	i, len, page;
+	size_t	retlen;
 	int	oob_size;
 
 	/* allocate a buffer for all oob data in this sector */
@@ -947,7 +946,7 @@
 		printk(KERN_NOTICE "jffs2_check_oob_empty(): allocation of temporary data buffer for oob check failed\n");
 		return -ENOMEM;
 	}
-	/* 
+	/*
 	 * if mode = 0, we scan for a total empty oob area, else we have
 	 * to take care of the cleanmarker in the first page of the block
 	*/
@@ -956,50 +955,50 @@
 		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB failed %d for block at %08x\n", ret, jeb->offset));
 		goto out;
 	}
-	
+
 	if (retlen < len) {
 		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB return short read "
 			  "(%zd bytes not %d) for block at %08x\n", retlen, len, jeb->offset));
 		ret = -EIO;
 		goto out;
 	}
-	
+
 	/* Special check for first page */
-	for(i = 0; i < oob_size ; i++) {
+	for (i = 0; i < oob_size ; i++) {
 		/* Yeah, we know about the cleanmarker. */
-		if (mode && i >= c->fsdata_pos && 
+		if (mode && i >= c->fsdata_pos &&
 		    i < c->fsdata_pos + c->fsdata_len)
 			continue;
 
 		if (buf[i] != 0xFF) {
 			D2(printk(KERN_DEBUG "Found %02x at %x in OOB for %08x\n",
 				  buf[i], i, jeb->offset));
-			ret = 1; 
+			ret = 1;
 			goto out;
 		}
 	}
 
-	/* we know, we are aligned :) */	
+	/* we know, we are aligned :) */
 	for (page = oob_size; page < len; page += sizeof(long)) {
 		unsigned long dat = *(unsigned long *)(&buf[page]);
-		if(dat != -1) {
-			ret = 1; 
+		if (dat != -1) {
+			ret = 1;
 			goto out;
 		}
 	}
 
 out:
-	kfree(buf);	
-	
+	kfree(buf);
+
 	return ret;
 }
 
 /*
-*	Scan for a valid cleanmarker and for bad blocks
-*	For virtual blocks (concatenated physical blocks) check the cleanmarker
-*	only in the first page of the first physical block, but scan for bad blocks in all
-*	physical blocks
-*/
+ * Scan for a valid cleanmarker and for bad blocks
+ * For virtual blocks (concatenated physical blocks) check the cleanmarker
+ * only in the first page of the first physical block, but scan for bad blocks in all
+ * physical blocks
+ */
 int jffs2_check_nand_cleanmarker (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
 	struct jffs2_unknown_node n;
@@ -1020,9 +1019,9 @@
 			return 2;
 		}
 		/*
-		   *    We read oob data from page 0 and 1 of the block.
-		   *    page 0 contains cleanmarker and badblock info
-		   *    page 1 contains failure count of this block
+		 * We read oob data from page 0 and 1 of the block.
+		 * page 0 contains cleanmarker and badblock info
+		 * page 1 contains failure count of this block
 		 */
 		ret = c->mtd->read_oob (c->mtd, offset, oob_size << 1, &retlen, buf);
 
@@ -1050,7 +1049,7 @@
 			D1(if (retval == 1) {
 				printk(KERN_WARNING "jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block at %08x\n", jeb->offset);
 				printk(KERN_WARNING "OOB at %08x was ", offset);
-				for (i=0; i < oob_size; i++) {
+				for (i = 0; i < oob_size; i++) {
 					printk("%02x ", buf[i]);
 				}
 				printk("\n");
@@ -1063,16 +1062,16 @@
 
 int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
-	struct 	jffs2_unknown_node n;
-	int 	ret;
-	size_t 	retlen;
+	struct	jffs2_unknown_node n;
+	int	ret;
+	size_t	retlen;
 
 	n.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	n.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
 	n.totlen = cpu_to_je32(8);
 
 	ret = jffs2_flash_write_oob(c, jeb->offset + c->fsdata_pos, c->fsdata_len, &retlen, (unsigned char *)&n);
-	
+
 	if (ret) {
 		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): Write failed for block at %08x: error %d\n", jeb->offset, ret));
 		return ret;
@@ -1084,20 +1083,19 @@
 	return 0;
 }
 
-/* 
+/*
  * On NAND we try to mark this block bad. If the block was erased more
  * than MAX_ERASE_FAILURES we mark it finaly bad.
  * Don't care about failures. This block remains on the erase-pending
  * or badblock list as long as nobody manipulates the flash with
  * a bootloader or something like that.
  */
-
 int jffs2_write_nand_badblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
 {
-	int 	ret;
+	int	ret;
 
 	/* if the count is < max, we try to write the counter to the 2nd page oob area */
-	if( ++jeb->bad_count < MAX_ERASE_FAILURES)
+	if (++jeb->bad_count < MAX_ERASE_FAILURES)
 		return 0;
 
 	if (!c->mtd->block_markbad)
@@ -1105,7 +1103,7 @@
 
 	D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Marking bad block at %08x\n", bad_offset));
 	ret = c->mtd->block_markbad(c->mtd, bad_offset);
-	
+
 	if (ret) {
 		D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Write failed for block at %08x: error %d\n", jeb->offset, ret));
 		return ret;
@@ -1118,7 +1116,7 @@
 static struct nand_oobinfo jffs2_oobinfo_docecc = {
 	.useecc = MTD_NANDECC_PLACE,
 	.eccbytes = 6,
-	.eccpos = {0,1,2,3,4,5}
+	.eccpos = {0, 1, 2, 3, 4, 5}
 };
 
 
@@ -1129,7 +1127,7 @@
 	/* Do this only, if we have an oob buffer */
 	if (!c->mtd->oobsize)
 		return 0;
-	
+
 	/* Cleanmarker is out-of-band, so inline size zero */
 	c->cleanmarker_size = 0;
 
@@ -1155,7 +1153,7 @@
 			c->fsdata_len = NAND_JFFS2_OOB16_FSDALEN;
 			c->badblock_pos = 15;
 			break;
-	
+
 		default:
 			D1(printk(KERN_DEBUG "JFFS2 on NAND. No autoplacment info found\n"));
 			return -EINVAL;
@@ -1172,7 +1170,7 @@
 	init_rwsem(&c->wbuf_sem);
 	c->wbuf_pagesize = c->mtd->oobblock;
 	c->wbuf_ofs = 0xFFFFFFFF;
-	
+
 	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
 	if (!c->wbuf)
 		return -ENOMEM;
@@ -1196,9 +1194,10 @@
 	kfree(c->wbuf);
 }
 
-int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
+int jffs2_dataflash_setup(struct jffs2_sb_info *c)
+{
 	c->cleanmarker_size = 0;		/* No cleanmarkers needed */
-	
+
 	/* Initialize write buffer */
 	init_rwsem(&c->wbuf_sem);
 	c->wbuf_pagesize = c->sector_size;
@@ -1213,11 +1212,13 @@
 	return 0;
 }
 
-void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
+void jffs2_dataflash_cleanup(struct jffs2_sb_info *c)
+{
 	kfree(c->wbuf);
 }
 
-int jffs2_nor_ecc_flash_setup(struct jffs2_sb_info *c) {
+int jffs2_nor_ecc_flash_setup(struct jffs2_sb_info *c)
+{
 	/* Cleanmarker is actually larger on the flashes */
 	c->cleanmarker_size = 16;
 
@@ -1233,11 +1234,13 @@
 	return 0;
 }
 
-void jffs2_nor_ecc_flash_cleanup(struct jffs2_sb_info *c) {
+void jffs2_nor_ecc_flash_cleanup(struct jffs2_sb_info *c)
+{
 	kfree(c->wbuf);
 }
 
-int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c) {
+int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c)
+{
 	/* Cleanmarker currently occupies a whole programming region */
 	c->cleanmarker_size = MTD_PROGREGION_SIZE(c->mtd);
 
@@ -1253,6 +1256,7 @@
 	return 0;
 }
 
-void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c) {
+void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c)
+{
 	kfree(c->wbuf);
 }
diff -uNr mtd/fs/jffs2/write.c mtd-whitespace/fs/jffs2/write.c
--- mtd/fs/jffs2/write.c	2005-09-07 13:04:15.000000000 -0600
+++ mtd-whitespace/fs/jffs2/write.c	2005-09-22 17:00:31.748356360 -0600
@@ -37,7 +37,6 @@
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 	f->inocache->state = INO_STATE_PRESENT;
 
-
 	jffs2_add_ino_cache(c, f->inocache);
 	D1(printk(KERN_DEBUG "jffs2_do_new_inode(): Assigned ino# %d\n", f->inocache->ino));
 	ri->ino = cpu_to_je32(f->inocache->ino);
@@ -54,7 +53,7 @@
 	return 0;
 }
 
-/* jffs2_write_dnode - given a raw_inode, allocate a full_dnode for it, 
+/* jffs2_write_dnode - given a raw_inode, allocate a full_dnode for it,
    write it to the flash, link it into the existing inode/fragment list */
 
 struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2_sb_info *c, struct jffs2_inode_info *f, struct jffs2_raw_inode *ri, const unsigned char *data, uint32_t datalen, uint32_t flash_ofs, int alloc_mode)
@@ -68,11 +67,10 @@
 	int retried = 0;
 	unsigned long cnt = 2;
 
-	D1(if(je32_to_cpu(ri->hdr_crc) != crc32(0, ri, sizeof(struct jffs2_unknown_node)-4)) {
+	D1(if (je32_to_cpu(ri->hdr_crc) != crc32(0, ri, sizeof(struct jffs2_unknown_node)-4)) {
 		printk(KERN_CRIT "Eep. CRC not correct in jffs2_write_dnode()\n");
 		BUG();
-	}
-	   );
+	});
 	vecs[0].iov_base = ri;
 	vecs[0].iov_len = sizeof(*ri);
 	vecs[1].iov_base = (unsigned char *)data;
@@ -86,7 +84,7 @@
 	raw = jffs2_alloc_raw_node_ref();
 	if (!raw)
 		return ERR_PTR(-ENOMEM);
-	
+
 	fn = jffs2_alloc_full_dnode();
 	if (!fn) {
 		jffs2_free_raw_node_ref(raw);
@@ -107,20 +105,20 @@
 	raw->__totlen = PAD(sizeof(*ri)+datalen);
 	raw->next_phys = NULL;
 
-	if ((alloc_mode!=ALLOC_GC) && (je32_to_cpu(ri->version) < f->highest_version)) {
+	if ((alloc_mode != ALLOC_GC) && (je32_to_cpu(ri->version) < f->highest_version)) {
 		BUG_ON(!retried);
 		D1(printk(KERN_DEBUG "jffs2_write_dnode : dnode_version %d, "
-				"highest version %d -> updating dnode\n", 
+				"highest version %d -> updating dnode\n",
 				je32_to_cpu(ri->version), f->highest_version));
 		ri->version = cpu_to_je32(++f->highest_version);
 		ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
 	}
 
 	ret = jffs2_flash_writev(c, vecs, cnt, flash_ofs, &retlen,
-				 (alloc_mode==ALLOC_GC)?0:f->inocache->ino);
+				 (alloc_mode == ALLOC_GC)?0:f->inocache->ino);
 
 	if (ret || (retlen != sizeof(*ri) + datalen)) {
-		printk(KERN_NOTICE "Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n", 
+		printk(KERN_NOTICE "Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
 		       sizeof(*ri)+datalen, flash_ofs, ret, retlen);
 
 		/* Mark the space as dirtied */
@@ -128,10 +126,10 @@
 			/* Doesn't belong to any inode */
 			raw->next_in_ino = NULL;
 
-			/* Don't change raw->size to match retlen. We may have 
+			/* Don't change raw->size to match retlen. We may have
 			   written the node header already, and only the data will
 			   seem corrupted, in which case the scan would skip over
-			   any node we write before the original intended end of 
+			   any node we write before the original intended end of
 			   this node */
 			raw->flash_offset |= REF_OBSOLETE;
 			jffs2_add_physical_node_ref(c, raw);
@@ -148,8 +146,8 @@
 			retried = 1;
 
 			D1(printk(KERN_DEBUG "Retrying failed write.\n"));
-			
-			jffs2_dbg_acct_sanity_check(c,jeb);
+
+			jffs2_dbg_acct_sanity_check(c, jeb);
 			jffs2_dbg_acct_paranoia_check(c, jeb);
 
 			if (alloc_mode == ALLOC_GC) {
@@ -159,7 +157,7 @@
 				/* Locking pain */
 				up(&f->sem);
 				jffs2_complete_reservation(c);
-			
+
 				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &flash_ofs,
 							&dummy, alloc_mode, JFFS2_SUMMARY_INODE_SIZE);
 				down(&f->sem);
@@ -168,7 +166,7 @@
 			if (!ret) {
 				D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed write.\n", flash_ofs));
 
-				jffs2_dbg_acct_sanity_check(c,jeb);
+				jffs2_dbg_acct_sanity_check(c, jeb);
 				jffs2_dbg_acct_paranoia_check(c, jeb);
 
 				goto retry;
@@ -181,12 +179,12 @@
 		return ERR_PTR(ret?ret:-EIO);
 	}
 	/* Mark the space used */
-	/* If node covers at least a whole page, or if it starts at the 
-	   beginning of a page and runs to the end of the file, or if 
-	   it's a hole node, mark it REF_PRISTINE, else REF_NORMAL. 
+	/* If node covers at least a whole page, or if it starts at the
+	   beginning of a page and runs to the end of the file, or if
+	   it's a hole node, mark it REF_PRISTINE, else REF_NORMAL.
 	*/
 	if ((je32_to_cpu(ri->dsize) >= PAGE_CACHE_SIZE) ||
-	    ( ((je32_to_cpu(ri->offset)&(PAGE_CACHE_SIZE-1))==0) &&
+	    (((je32_to_cpu(ri->offset)&(PAGE_CACHE_SIZE-1)) == 0) &&
 	      (je32_to_cpu(ri->dsize)+je32_to_cpu(ri->offset) ==  je32_to_cpu(ri->isize)))) {
 		raw->flash_offset |= REF_PRISTINE;
 	} else {
@@ -201,12 +199,12 @@
 	spin_unlock(&c->erase_completion_lock);
 
 	D1(printk(KERN_DEBUG "jffs2_write_dnode wrote node at 0x%08x(%d) with dsize 0x%x, csize 0x%x, node_crc 0x%08x, data_crc 0x%08x, totlen 0x%08x\n",
-		  flash_ofs, ref_flags(raw), je32_to_cpu(ri->dsize), 
+		  flash_ofs, ref_flags(raw), je32_to_cpu(ri->dsize),
 		  je32_to_cpu(ri->csize), je32_to_cpu(ri->node_crc),
 		  je32_to_cpu(ri->data_crc), je32_to_cpu(ri->totlen)));
 
 	if (retried) {
-		jffs2_dbg_acct_sanity_check(c,NULL);
+		jffs2_dbg_acct_sanity_check(c, NULL);
 	}
 
 	return fn;
@@ -221,21 +219,20 @@
 	int retried = 0;
 	int ret;
 
-	D1(printk(KERN_DEBUG "jffs2_write_dirent(ino #%u, name at *0x%p \"%s\"->ino #%u, name_crc 0x%08x)\n", 
+	D1(printk(KERN_DEBUG "jffs2_write_dirent(ino #%u, name at *0x%p \"%s\"->ino #%u, name_crc 0x%08x)\n",
 		  je32_to_cpu(rd->pino), name, name, je32_to_cpu(rd->ino),
 		  je32_to_cpu(rd->name_crc)));
 
-	D1(if(je32_to_cpu(rd->hdr_crc) != crc32(0, rd, sizeof(struct jffs2_unknown_node)-4)) {
+	D1(if (je32_to_cpu(rd->hdr_crc) != crc32(0, rd, sizeof(struct jffs2_unknown_node)-4)) {
 		printk(KERN_CRIT "Eep. CRC not correct in jffs2_write_dirent()\n");
 		BUG();
-	}
-	   );
+	});
 
 	vecs[0].iov_base = rd;
 	vecs[0].iov_len = sizeof(*rd);
 	vecs[1].iov_base = (unsigned char *)name;
 	vecs[1].iov_len = namelen;
-	
+
 	jffs2_dbg_prewrite_paranoia_check(c, flash_ofs, vecs[0].iov_len + vecs[1].iov_len);
 
 	raw = jffs2_alloc_raw_node_ref();
@@ -254,7 +251,7 @@
 	fd->nhash = full_name_hash(name, strlen(name));
 	fd->type = rd->type;
 	memcpy(fd->name, name, namelen);
-	fd->name[namelen]=0;
+	fd->name[namelen] = 0;
 
  retry:
 	fd->raw = raw;
@@ -263,7 +260,7 @@
 	raw->__totlen = PAD(sizeof(*rd)+namelen);
 	raw->next_phys = NULL;
 
-	if ((alloc_mode!=ALLOC_GC) && (je32_to_cpu(rd->version) < f->highest_version)) {
+	if ((alloc_mode != ALLOC_GC) && (je32_to_cpu(rd->version) < f->highest_version)) {
 		BUG_ON(!retried);
 		D1(printk(KERN_DEBUG "jffs2_write_dirent : dirent_version %d, "
 				     "highest version %d -> updating dirent\n",
@@ -274,10 +271,10 @@
 	}
 
 	ret = jffs2_flash_writev(c, vecs, 2, flash_ofs, &retlen,
-				 (alloc_mode==ALLOC_GC)?0:je32_to_cpu(rd->pino));
+				 (alloc_mode == ALLOC_GC)?0:je32_to_cpu(rd->pino));
 	if (ret || (retlen != sizeof(*rd) + namelen)) {
-		printk(KERN_NOTICE "Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n", 
-			       sizeof(*rd)+namelen, flash_ofs, ret, retlen);
+		printk(KERN_NOTICE "Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
+				sizeof(*rd)+namelen, flash_ofs, ret, retlen);
 		/* Mark the space as dirtied */
 		if (retlen) {
 			raw->next_in_ino = NULL;
@@ -297,7 +294,7 @@
 
 			D1(printk(KERN_DEBUG "Retrying failed write.\n"));
 
-			jffs2_dbg_acct_sanity_check(c,jeb);
+			jffs2_dbg_acct_sanity_check(c, jeb);
 			jffs2_dbg_acct_paranoia_check(c, jeb);
 
 			if (alloc_mode == ALLOC_GC) {
@@ -307,7 +304,7 @@
 				/* Locking pain */
 				up(&f->sem);
 				jffs2_complete_reservation(c);
-			
+
 				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &flash_ofs,
 							&dummy, alloc_mode, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 				down(&f->sem);
@@ -315,7 +312,7 @@
 
 			if (!ret) {
 				D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed write.\n", flash_ofs));
-				jffs2_dbg_acct_sanity_check(c,jeb);
+				jffs2_dbg_acct_sanity_check(c, jeb);
 				jffs2_dbg_acct_paranoia_check(c, jeb);
 				goto retry;
 			}
@@ -336,7 +333,7 @@
 	spin_unlock(&c->erase_completion_lock);
 
 	if (retried) {
-		jffs2_dbg_acct_sanity_check(c,NULL);
+		jffs2_dbg_acct_sanity_check(c, NULL);
 	}
 
 	return fd;
@@ -346,16 +343,16 @@
    we don't have to go digging in struct inode or its equivalent. It should set:
    mode, uid, gid, (starting)isize, atime, ctime, mtime */
 int jffs2_write_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-			    struct jffs2_raw_inode *ri, unsigned char *buf, 
+			    struct jffs2_raw_inode *ri, unsigned char *buf,
 			    uint32_t offset, uint32_t writelen, uint32_t *retlen)
 {
 	int ret = 0;
 	uint32_t writtenlen = 0;
 
-       	D1(printk(KERN_DEBUG "jffs2_write_inode_range(): Ino #%u, ofs 0x%x, len 0x%x\n",
+	D1(printk(KERN_DEBUG "jffs2_write_inode_range(): Ino #%u, ofs 0x%x, len 0x%x\n",
 		  f->inocache->ino, offset, writelen));
-		
-	while(writelen) {
+
+	while (writelen) {
 		struct jffs2_full_dnode *fn;
 		unsigned char *comprbuf = NULL;
 		uint16_t comprtype = JFFS2_COMPR_NONE;
@@ -390,7 +387,7 @@
 		ri->csize = cpu_to_je32(cdatalen);
 		ri->dsize = cpu_to_je32(datalen);
 		ri->compr = comprtype & 0xff;
-		ri->usercompr = (comprtype >> 8 ) & 0xff;
+		ri->usercompr = (comprtype >> 8) & 0xff;
 		ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
 		ri->data_crc = cpu_to_je32(crc32(0, comprbuf, cdatalen));
 
@@ -451,8 +448,8 @@
 	uint32_t alloclen, phys_ofs;
 	int ret;
 
-	/* Try to reserve enough space for both node and dirent. 
-	 * Just the node will do for now, though 
+	/* Try to reserve enough space for both node and dirent.
+	 * Just the node will do for now, though
 	 */
 	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL,
 				JFFS2_SUMMARY_INODE_SIZE);
@@ -477,7 +474,7 @@
 		jffs2_complete_reservation(c);
 		return PTR_ERR(fn);
 	}
-	/* No data here. Only a metadata node, which will be 
+	/* No data here. Only a metadata node, which will be
 	   obsoleted by the first data write
 	*/
 	f->metadata = fn;
@@ -486,7 +483,7 @@
 	jffs2_complete_reservation(c);
 	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
 				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
-		
+
 	if (ret) {
 		/* Eep. */
 		D1(printk(KERN_DEBUG "jffs2_reserve_space() for dirent failed\n"));
@@ -519,9 +516,9 @@
 	fd = jffs2_write_dirent(c, dir_f, rd, name, namelen, phys_ofs, ALLOC_NORMAL);
 
 	jffs2_free_raw_dirent(rd);
-	
+
 	if (IS_ERR(fd)) {
-		/* dirent failed to write. Delete the inode normally 
+		/* dirent failed to write. Delete the inode normally
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		up(&dir_f->sem);
@@ -548,7 +545,7 @@
 	uint32_t alloclen, phys_ofs;
 	int ret;
 
-	if (1 /* alternative branch needs testing */ || 
+	if (1 /* alternative branch needs testing */ ||
 	    !jffs2_can_mark_obsolete(c)) {
 		/* We can't mark stuff obsolete on the medium. We need to write a deletion dirent */
 
@@ -570,7 +567,7 @@
 		rd->nodetype = cpu_to_je16(JFFS2_NODETYPE_DIRENT);
 		rd->totlen = cpu_to_je32(sizeof(*rd) + namelen);
 		rd->hdr_crc = cpu_to_je32(crc32(0, rd, sizeof(struct jffs2_unknown_node)-4));
-		
+
 		rd->pino = cpu_to_je32(dir_f->inocache->ino);
 		rd->version = cpu_to_je32(++dir_f->highest_version);
 		rd->ino = cpu_to_je32(0);
@@ -581,7 +578,7 @@
 		rd->name_crc = cpu_to_je32(crc32(0, name, namelen));
 
 		fd = jffs2_write_dirent(c, dir_f, rd, name, namelen, phys_ofs, ALLOC_DELETION);
-		
+
 		jffs2_free_raw_dirent(rd);
 
 		if (IS_ERR(fd)) {
@@ -600,7 +597,7 @@
 		down(&dir_f->sem);
 
 		while ((*prev) && (*prev)->nhash <= nhash) {
-			if ((*prev)->nhash == nhash && 
+			if ((*prev)->nhash == nhash &&
 			    !memcmp((*prev)->name, name, namelen) &&
 			    !(*prev)->name[namelen]) {
 				struct jffs2_full_dirent *this = *prev;
@@ -621,7 +618,7 @@
 	/* dead_f is NULL if this was a rename not a real unlink */
 	/* Also catch the !f->inocache case, where there was a dirent
 	   pointing to an inode which didn't exist. */
-	if (dead_f && dead_f->inocache) { 
+	if (dead_f && dead_f->inocache) {
 
 		down(&dead_f->sem);
 
@@ -629,9 +626,9 @@
 			while (dead_f->dents) {
 				/* There can be only deleted ones */
 				fd = dead_f->dents;
-				
+
 				dead_f->dents = fd->next;
-				
+
 				if (fd->ino) {
 					printk(KERN_WARNING "Deleting inode #%u with active dentry \"%s\"->ino #%u\n",
 					       dead_f->inocache->ino, fd->name, fd->ino);
@@ -672,7 +669,7 @@
 		jffs2_free_raw_dirent(rd);
 		return ret;
 	}
-	
+
 	down(&dir_f->sem);
 
 	/* Build a deletion node */
@@ -693,7 +690,7 @@
 	rd->name_crc = cpu_to_je32(crc32(0, name, namelen));
 
 	fd = jffs2_write_dirent(c, dir_f, rd, name, namelen, phys_ofs, ALLOC_NORMAL);
-	
+
 	jffs2_free_raw_dirent(rd);
 
 	if (IS_ERR(fd)) {
diff -uNr mtd/fs/jffs2/writev.c mtd-whitespace/fs/jffs2/writev.c
--- mtd/fs/jffs2/writev.c	2005-09-13 11:10:03.000000000 -0600
+++ mtd-whitespace/fs/jffs2/writev.c	2005-09-22 16:52:21.462891080 -0600
@@ -25,7 +25,7 @@
 	size_t totlen = 0, thislen;
 	int ret = 0;
 
-	for (i=0; i<count; i++) {
+	for (i = 0; i < count; i++) {
 		if (!vecs[i].iov_len)
 			continue;
 		ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);

--=-qwQr02qgLCZeTk4FpL21--
