Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKHMu-0005fv-H4
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 10:23:19 -0400
Message-ID: <41767593.9030004@inf.u-szeged.hu>
Date: Wed, 20 Oct 2004 16:26:27 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,  jffs-dev@axis.com,
 dwmw2@infradead.org
Content-Type: multipart/mixed; boundary="------------020509080808010306000504"
Cc: 
Subject: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020509080808010306000504
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dear All,

Here is the latest version of our mount time improvement.

Using of it:
- apply this patch on the latest version of MTD
- compile sumtool (make command in mtd/util)
- make your JFFS2 image as before (or you can use already created images 
as well)
- run sumtool to insert summary information, for example:
   ./sumtool -i original.jffs2 -o new.jffs2 -e128KiB
- recompile your kernel with "JFFS2 inode summary support"

Jarkko made a measurement on a real NAND device: his JFFS2 image was 
120819928 (115M), after running sumtool the new image was 123338752 (117M).

Using the original mount time was 55 sec, with the new image it is only 
8.5 sec.

It works very similar as our previous improvement: stores special 
information at the end of the erase blocks, and at mount time if there 
is this kind of information the scaning of the erase block is unneccessary.

New things compared to our previous improvement:
- it was fully rewritten
- we separated the user space tool from mkfs. (sumtool)
- sumtool now not only inserts the summary information but also make 
some node-reordering. There will be two kind of erase blocks: in the 
"first type" there will be only jffs2_raw_inodes, and all other node 
(jffs2_raw_dirent) will be stored in the "second type". It generates 
summary at the end of all "fist type" eraseblock. (the "second type" 
will be scanned as before, because all information is needed in 
jffs_raw_dirent at mount time)

Ceratinly all of these things are optional (as you can see above you 
have to select it from kernel config). The JFFS2 image produced by 
sumtool is also usable with previous kernel because the summary node is 
JFFS2_FEATURE_RWCOMPAT_DELETE.

I think it can be usefull not only for us. David, may I commit it to the 
CVS?

Regards,
Ferenc

--------------020509080808010306000504
Content-Type: text/x-patch;
 name="jffs2-summary.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2-summary.patch"

diff --unified --recursive --new-file mtd2/fs/Kconfig mtd/fs/Kconfig
--- mtd2/fs/Kconfig	2004-07-16 17:20:59.000000000 +0200
+++ mtd/fs/Kconfig	2004-10-20 15:10:42.000000000 +0200
@@ -68,6 +68,19 @@
 	  Say 'N' unless you have NAND flash and you are willing to test and
 	  develop JFFS2 support for it.
 
+config JFFS2_FS_SUMMARY
+	bool "JFFS2 inode summary support (EXPERIMENTAL)" 
+	depends on JFFS2_FS
+	default n
+        help
+          This feature makes it possible to use inode summary information
+          for faster filesystem mount - specially on NAND.
+
+          The summary information can be inserted into a filesystem image 
+          by the utility 'sumtool'.
+
+	  If unsure, say 'N'.
+          
 config JFFS2_COMPRESSION_OPTIONS
 	bool "Advanced compression options for JFFS2"
 	default n
diff --unified --recursive --new-file mtd2/fs/jffs2/scan.c mtd/fs/jffs2/scan.c
--- mtd2/fs/jffs2/scan.c	2004-09-12 11:56:13.000000000 +0200
+++ mtd/fs/jffs2/scan.c	2004-10-20 15:44:25.000000000 +0200
@@ -4,6 +4,8 @@
  * Copyright (C) 2001-2003 Red Hat, Inc.
  *
  * Created by David Woodhouse <dwmw2@redhat.com>
+ * Inode summary support by Zoltan Sogor, Ferenc Havasi, Patrik Kluba
+ *                          University of Szeged, Hungary
  *
  * For licensing information, see the file 'LICENCE' in this directory.
  *
@@ -58,6 +60,11 @@
 static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_dirent *rd, uint32_t ofs);
 
+
+#ifdef CONFIG_JFFS2_FS_SUMMARY
+static struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
+#endif
+
 #define BLK_STATE_ALLFF		0
 #define BLK_STATE_CLEAN		1
 #define BLK_STATE_PARTDIRTY	2
@@ -292,6 +299,25 @@
 #ifdef CONFIG_JFFS2_FS_NAND
 	int cleanmarkerfound = 0;
 #endif
+#ifdef CONFIG_JFFS2_FS_SUMMARY
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_raw_node_ref *cache_ref;
+	struct jffs2_inode_cache *ic;
+		
+	typedef struct sum_marker {
+		jint32_t offset;
+		jint32_t magic;
+	} sum_marker;
+	
+	sum_marker *sm;	
+	int i;
+	int sumsize;
+	uint32_t ino;
+	uint32_t crc;
+	struct jffs2_inode_sum_node *summary;
+	struct jffs2_inode_sum_record *sum_rec;
+	int bad_sum = 0;
+#endif
 
 	ofs = jeb->offset;
 	prevofs = jeb->offset - 1;
@@ -314,10 +340,217 @@
 		}
 	}
 #endif
+
+#ifdef CONFIG_JFFS2_FS_SUMMARY
+	/* Looking for summary marker */
+	sm = (sum_marker *)kmalloc(sizeof(*sm), GFP_KERNEL);
+	if (!sm) {
+	        return -ENOMEM;
+	}
+	
+	err = jffs2_fill_scan_buf(c, (unsigned char *) sm, jeb->offset + c->sector_size - 8, 8);
+	
+	if (err) {
+	        return err;
+	}
+	
+	if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
+		ofs = je32_to_cpu(sm->offset);
+		sumsize = c->sector_size - ofs;
+		ofs += jeb->offset;
+		
+		D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Inode summary information found at 0x%x (%d bytes)\n", ofs, sumsize));
+		
+		summary = (struct jffs2_inode_sum_node *) kmalloc(sumsize, GFP_KERNEL);
+			
+		if (!summary) {
+				kfree(sm);
+				return -ENOMEM;
+		}
+		
+		err = jffs2_fill_scan_buf(c, (unsigned char *)summary, ofs, sumsize);
+		
+		if (err) {
+				kfree(sm);
+				kfree(summary);
+				return err;
+		}
+  
+		/* OK, now check for node validity and CRC */
+		crcnode.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+		crcnode.nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE_SUM);
+		crcnode.totlen = summary->totlen;
+		hdr_crc = crc32(0, &crcnode, sizeof(crcnode)-4);
+		
+		if (je32_to_cpu(summary->hdr_crc) != hdr_crc) {
+				D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node header is corrupt (bad CRC or no summary at all)\n"));
+				bad_sum = 1;
+		}
+		
+		if ((!bad_sum) && (je32_to_cpu(summary->totlen) != sumsize)) {
+				D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node is corrupt (wrong erasesize?)\n"));
+				bad_sum = 1;
+		}
+		
+		crc = crc32(0, summary, sizeof(struct jffs2_inode_sum_node)-8);
+			
+		if ((!bad_sum) && (je32_to_cpu(summary->node_crc) != crc)) {
+				D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node is corrupt (bad CRC)\n"));
+				bad_sum = 1;
+		}
+		
+		sum_rec = (struct jffs2_inode_sum_record *) &(summary->sum[0]);
+		crc = crc32(0, sum_rec, sumsize - sizeof(struct jffs2_inode_sum_node));
+  
+		if ((!bad_sum) && (je32_to_cpu(summary->sum_crc) != crc)) {
+				D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node data is corrupt (bad CRC)\n"));
+				bad_sum = 1;
+		}
+		
+		if (!bad_sum) {
+			
+			if ( je32_to_cpu(summary->cln_mkr) ){
+				
+				D1(printk(KERN_DEBUG "Summary : CLEANMARKER node \n"));
+				
+				if (je32_to_cpu(summary->cln_mkr) != c->cleanmarker_size) {
+					printk(KERN_DEBUG "CLEANMARKER node has totlen 0x%x != normal 0x%x\n", 
+					   je32_to_cpu(summary->cln_mkr), c->cleanmarker_size);
+					UNCHECKED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
+				} 
+				else if (jeb->first_node) {
+					printk(KERN_DEBUG "CLEANMARKER node not first node in block (0x%08x)\n", jeb->offset);
+					UNCHECKED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
+				} 
+				else {
+					struct jffs2_raw_node_ref *marker_ref = jffs2_alloc_raw_node_ref();
+						
+					if (!marker_ref) {
+						printk(KERN_NOTICE "Failed to allocate node ref for clean marker\n");
+						return -ENOMEM;
+					}
+					
+					marker_ref->next_in_ino = NULL;
+					marker_ref->next_phys = NULL;
+					marker_ref->flash_offset = jeb->offset | REF_NORMAL;
+					marker_ref->__totlen = je32_to_cpu(summary->cln_mkr);
+					jeb->first_node = jeb->last_node = marker_ref;
+				
+					USED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
+									
+				}
+			}
+			
+			for(i = 0; i < je16_to_cpu(summary->sum_num); i++) {
+				
+				D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Processing summary information %d\n", i));
+				
+				//JFFS2_NODETYPE_INODE:
+				ino = je32_to_cpu(sum_rec->inode);
+				D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Inode at 0x%08x\n", jeb->offset + je32_to_cpu(sum_rec->offset)));
+				raw = jffs2_alloc_raw_node_ref();
+				if (!raw) {
+						printk(KERN_NOTICE "jffs2_scan_eraseblock(): allocation of node reference failed\n");
+						kfree(sm);
+						kfree(summary);
+						return -ENOMEM;
+				}
+
+				ic = jffs2_get_ino_cache(c, ino);
+				if (!ic) {
+						ic = jffs2_scan_make_ino_cache(c, ino);
+						if (!ic) {
+								printk(KERN_NOTICE "jffs2_scan_eraseblock(): scan_make_ino_cache failed\n");
+								jffs2_free_raw_node_ref(raw);
+							kfree(sm);
+							kfree(summary);
+							return -ENOMEM;
+						}
+				}
+
+				raw->flash_offset = (jeb->offset + je32_to_cpu(sum_rec->offset)) | REF_UNCHECKED;
+				raw->__totlen = PAD(je32_to_cpu(sum_rec->totlen));
+				raw->next_phys = NULL;
+				raw->next_in_ino = ic->nodes;
+
+				ic->nodes = raw;
+				if (!jeb->first_node)
+						jeb->first_node = raw;
+				if (jeb->last_node)
+						jeb->last_node->next_phys = raw;
+				jeb->last_node = raw;
+
+				/* do we need this? this requires storing another 4 bytes per record in the cache or an expensive reading */
+				pseudo_random += je32_to_cpu(sum_rec->version);
+
+				UNCHECKED_SPACE(PAD(je32_to_cpu(sum_rec->totlen)));
+				
+				sum_rec++;
+			}
+			
+			kfree(sm);
+			kfree(summary);
+
+			/* for ACCT_PARANOIA_CHECK */
+			cache_ref = jffs2_alloc_raw_node_ref();
+			
+			if (!cache_ref) {
+				printk(KERN_NOTICE "Failed to allocate node ref for cache\n");
+				return -ENOMEM;
+			}
+			
+			cache_ref->next_in_ino = NULL;
+			cache_ref->next_phys = NULL;
+			cache_ref->flash_offset = ofs | REF_NORMAL;
+			cache_ref->__totlen = sumsize;
+			
+			if (!jeb->first_node)
+				jeb->first_node = cache_ref;
+			if (jeb->last_node)
+				jeb->last_node->next_phys = cache_ref;
+			jeb->last_node = cache_ref;
+			
+			USED_SPACE(sumsize);
+			
+			/* somebody check this and all of space accounting in summary support */
+	
+			if ((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size) && !jeb->dirty_size 
+				&& (!jeb->first_node || !jeb->first_node->next_in_ino) ) { 
+					return BLK_STATE_CLEANMARKER; 
+				}		
+			/* move blocks with max 4 byte dirty space to cleanlist */	
+			else if (!ISDIRTY(c->sector_size - (jeb->used_size + jeb->unchecked_size))) {
+				c->dirty_size -= jeb->dirty_size;
+				c->wasted_size += jeb->dirty_size; 
+				jeb->wasted_size += jeb->dirty_size;
+				jeb->dirty_size = 0;
+				return BLK_STATE_CLEAN;
+			}
+			else if (jeb->used_size || jeb->unchecked_size) { 
+					return BLK_STATE_PARTDIRTY; 
+			}
+			else { 
+					return BLK_STATE_ALLDIRTY; 
+			}
+		}   
+	}
+	D1(printk(KERN_DEBUG "Summary end\n"));
+	
+	ofs = jeb->offset;
+	prevofs = jeb->offset - 1;
+
+#endif
+
 	buf_ofs = jeb->offset;
 
 	if (!buf_size) {
 		buf_len = c->sector_size;
+#ifdef CONFIG_JFFS2_FS_SUMMARY
+		/* must reread because of summary test */
+		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
+		if (err)
+			return err;
+#endif
 	} else {
 		buf_len = EMPTY_SCAN_SIZE;
 		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
diff --unified --recursive --new-file mtd2/include/linux/jffs2.h mtd/include/linux/jffs2.h
--- mtd2/include/linux/jffs2.h	2004-05-25 13:31:55.000000000 +0200
+++ mtd/include/linux/jffs2.h	2004-10-20 14:53:52.000000000 +0200
@@ -28,6 +28,9 @@
 #define JFFS2_EMPTY_BITMASK 0xffff
 #define JFFS2_DIRTY_BITMASK 0x0000
 
+/* Summary node MAGIC marker */
+#define JFFS2_SUM_MAGIC	0x02851885 
+
 /* We only allow a single char for length, and 0xFF is empty flash so
    we don't want it confused with a real length. Hence max 254.
 */
@@ -61,6 +64,7 @@
 #define JFFS2_NODETYPE_INODE (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 2)
 #define JFFS2_NODETYPE_CLEANMARKER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 #define JFFS2_NODETYPE_PADDING (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 4)
+#define JFFS2_NODETYPE_INODE_SUM (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 6)
 
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
@@ -148,10 +152,31 @@
 	uint8_t data[0];
 } __attribute__((packed));
 
+struct jffs2_inode_sum_node{
+    jint16_t magic;
+	jint16_t nodetype; /* = JFFS2_NODETYPE_INODE_SUM */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint16_t sum_num;	/* number of sum entries*/
+	jint32_t cln_mkr;	/* clean marker size, 0 = no cleanmarker */
+	jint32_t sum_crc;	/* summary information crc */
+	jint32_t node_crc; 	/* node crc */
+	jint32_t sum[0]; 	/* inode summary info */
+} __attribute__((packed));
+
+struct jffs2_inode_sum_record{
+	jint32_t inode;
+	jint32_t version;
+	jint32_t offset;
+	jint32_t totlen; 
+} __attribute__((packed));
+
+
 union jffs2_node_union {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
 	struct jffs2_unknown_node u;
+	struct jffs2_inode_sum_node s;
 };
 
 #endif /* __LINUX_JFFS2_H__ */
diff --unified --recursive --new-file mtd2/util/Makefile mtd/util/Makefile
--- mtd2/util/Makefile	2004-07-13 19:49:43.000000000 +0200
+++ mtd/util/Makefile	2004-10-19 15:11:02.000000000 +0200
@@ -13,7 +13,7 @@
 TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	mkfs.jffs ftl_check mkfs.jffs2 flash_lock flash_unlock \
 	flash_info mtd_debug flashcp nandwrite jffs2dump \
-	nftldump nftl_format docfdisk #jffs2reader
+	nftldump nftl_format docfdisk sumtool #jffs2reader
 
 SYMLINKS = compr_lzari.c compr_lzo.c
 
@@ -48,6 +48,9 @@
 jffs2dump: jffs2dump.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
+sumtool: sumtool.o crc32.o
+	$(CC) $(LDFLAGS) -o $@ $^
+
 install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m0755 -oroot -groot ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --unified --recursive --new-file mtd2/util/jffs2dump.c mtd/util/jffs2dump.c
--- mtd2/util/jffs2dump.c	2004-06-19 00:11:48.000000000 +0200
+++ mtd/util/jffs2dump.c	2004-10-20 14:55:28.000000000 +0200
@@ -3,7 +3,7 @@
  *
  *  Copyright (C) 2003 Thomas Gleixner (tglx@linutronix.de)
  *
- * $Id: jffs2dump.c,v 1.6 2004/06/18 22:11:48 gleixner Exp $
+ * $Id: jffs2dump.c,v 1.1 2004/10/19 07:19:55 weth Exp $
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -277,7 +277,63 @@
 
 			p += PAD(je32_to_cpu (node->d.totlen));						
 			break;
-	
+
+		case JFFS2_NODETYPE_INODE_SUM:{
+			
+			int i;
+			jint32_t *offset,*magic;
+			
+			printf ("%8s Inode Sum  node at 0x%08x, totlen 0x%08x, sum_num  %5d, cleanmarker size %5d\n",
+					obsolete ? "Obsolete" : "",
+					p - data,
+					je32_to_cpu (node->s.totlen),
+					je16_to_cpu (node->s.sum_num),
+					je32_to_cpu (node->s.cln_mkr));
+
+			crc = crc32 (0, node, sizeof (struct jffs2_inode_sum_node) - 8);
+			if (crc != je32_to_cpu (node->s.node_crc)) {
+				printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.node_crc), crc);
+				p += PAD(je32_to_cpu (node->s.totlen));
+				dirty += PAD(je32_to_cpu (node->s.totlen));;
+				continue;
+			}
+			
+			crc = crc32(0, p + sizeof (struct jffs2_inode_sum_node),  je32_to_cpu (node->s.totlen) - sizeof(struct jffs2_inode_sum_node));
+			if (crc != je32_to_cpu(node->s.sum_crc)) {
+				printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.sum_crc), crc);
+				p += PAD(je32_to_cpu (node->s.totlen));
+				dirty += PAD(je32_to_cpu (node->s.totlen));;
+				continue;
+			}
+
+			if(verbose){
+				for(i = 0; i < je16_to_cpu (node->s.sum_num); i++){
+					struct jffs2_inode_sum_record *sp;
+					sp = (struct jffs2_inode_sum_record *) (p + sizeof (struct jffs2_inode_sum_node));
+						
+					printf ("%14s #ino  %5d,  version %5d, offset %8d, totlen 0x%08x\n",
+						"",
+						je32_to_cpu (sp[i].inode),
+						je32_to_cpu (sp[i].version),
+						je32_to_cpu (sp[i].offset), 
+						je32_to_cpu (sp[i].totlen));
+					
+				}
+				
+				offset = (jint32_t *)((char *)p + je32_to_cpu(node->s.totlen) - 8);
+				magic = (jint32_t *)((char *)p + je32_to_cpu(node->s.totlen) - 4);
+				
+				printf("%14s Sum Node Offset  0x%08x,  Magic 0x%08x\n",
+					"",
+					je32_to_cpu(*offset),
+					je32_to_cpu(*magic));
+			}
+			
+			p += PAD(je32_to_cpu (node->s.totlen));
+			break;
+			
+		}
+			
 		case JFFS2_NODETYPE_CLEANMARKER:
 			if (verbose) {
 				printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n", 
@@ -418,9 +474,9 @@
 
 			write (fd, &newnode, sizeof (struct jffs2_raw_dirent));
 			write (fd, p + sizeof (struct jffs2_raw_dirent), PAD (je32_to_cpu (node->d.totlen) -  sizeof (struct jffs2_raw_dirent)));
-			p += PAD(je32_to_cpu (node->d.totlen));						
+			p += PAD(je32_to_cpu (node->d.totlen));
 			break;
-	
+	                        
 		case JFFS2_NODETYPE_CLEANMARKER:
 		case JFFS2_NODETYPE_PADDING:
 			newnode.u.magic = cnv_e16 (node->u.magic);
diff --unified --recursive --new-file mtd2/util/sumtool.c mtd/util/sumtool.c
--- mtd2/util/sumtool.c	1970-01-01 01:00:00.000000000 +0100
+++ mtd/util/sumtool.c	2004-10-20 11:56:08.000000000 +0200
@@ -0,0 +1,800 @@
+/*
+ *  sumtool.c
+ *
+ *  Copyright (C) 2004 Zoltan Sogor <weth@inf.u-szeged.hu>,
+ *                     Ferenc Havasi <havasi@inf.u-szeged.hu>,
+ *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
+ *                     University of Szeged, Hungary
+ *
+ * $Id: sumtool.c,v 1.2 2004/10/20 09:56:08 hafy Exp $
+ * 
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+ *
+ * Overview:
+ *   This is a utility to reorder nodes and insert inode summary information
+ *   into JFFS2 image for faster mount time - specially on NAND.
+ *
+ */
+
+#include <errno.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <time.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/param.h>
+#include <asm/types.h>
+#include <dirent.h>
+#include <mtd/jffs2-user.h>
+#include <endian.h>
+#include <byteswap.h>
+#include <getopt.h>
+#include "crc32.h"
+
+#define PAD(x) (((x)+3)&~3)
+
+#define SINODE 0	/* Inode Type*/
+#define SONODE 1  	/* Other type*/
+
+static const char *const app_name = "sumtool";
+
+typedef struct sum_storage {
+	jint32_t inode;
+	jint32_t version;
+	jint32_t offset;
+	jint32_t totlen;
+	struct sum_storage *next;
+} sum_storage;
+
+static sum_storage *sum_collected = NULL;	/* summary info list */
+static int sum_records = 0;					/* number of sumary records */
+
+
+static int verbose = 0;
+static int add_cleanmarkers = 1;			/* add cleanmarker to output */
+static int use_input_cleanmarker_size = 1;	/* use input file's cleanmarker size (default) */
+static int found_cleanmarkers = 0;			/* cleanmarker found in input file */
+static struct jffs2_unknown_node cleanmarker;
+static int cleanmarker_size = sizeof(cleanmarker);
+static const char *short_options = "o:i:e:hvVblnc:";
+static int erase_block_size = 65536;
+static int target_endian = __BYTE_ORDER;
+static int out_fd = -1;
+static int in_fd = -1;
+
+static uint8_t *inode_buffer = NULL; 	/* buffer for inodes */
+static unsigned int ino_ofs = 0;	 	/* inode buffer offset */
+
+static uint8_t *dirent_buffer = NULL;	/* buffer for directory entries and other (symlink, spec. device files, etc.)*/ 
+static unsigned int dent_ofs = 0;		/* directory enrty buffer offset*/	
+
+static uint8_t *file_buffer = NULL;		/* file buffer contains the actual erase block*/
+static unsigned int file_ofs = 0;		/* position in the buffer */
+
+static struct option long_options[] = {
+	{"output", 1, NULL, 'o'},
+	{"input", 1, NULL, 'i'},
+	{"eraseblock", 1, NULL, 'e'},
+	{"help", 0, NULL, 'h'},
+	{"verbose", 0, NULL, 'v'},
+	{"version", 0, NULL, 'V'},
+	{"bigendian", 0, NULL, 'b'},
+	{"littleendian", 0, NULL, 'l'},	
+	{"no-cleanmarkers", 0, NULL, 'n'},
+	{"cleanmarker", 1, NULL, 'c'},
+	{NULL, 0, NULL, 0}
+};
+
+static char *helptext =
+	"Usage: sumtool [OPTIONS] -i inputfile -o outputfile\n"
+	"Convert the input JFFS2 file to a SUM-ed JFFS2 file\n\n"
+	"Options:\n"
+	"  -e, --eraseblock=SIZE     Use erase block size SIZE (default: 64KiB)\n"
+	"                            (usually 16KiB on NAND)\n"
+	"  -c, --cleanmarker=SIZE    Size of cleanmarker (default 12).\n"
+	"                            (usually 16 bytes on NAND, and will be set to\n"
+	"                            this value if left at the default 12). Will be\n"
+	"                            stored in OOB after each physical page composing\n"
+	"                            a physical erase block.\n"
+	"  -n, --no-cleanmarkers     Don't add a cleanmarker to every eraseblock\n"
+	"  -o, --output=FILE         Output to FILE \n"
+	"  -i, --input=FILE          Input from FILE \n"
+	"  -b, --bigendian	     Image is big endian\n"
+	"  -l  --littleendian        Image is little endian\n"
+	"  -h, --help                Display this help text\n"
+	"  -v, --verbose             Verbose operation\n"
+	"  -V, --version             Display version information\n\n";
+
+
+static char *revtext = "$Revision: 1.2 $";
+
+static unsigned char ffbuf[16] = {
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
+};
+
+static void verror_msg(const char *s, va_list p) {
+	fflush(stdout);
+	fprintf(stderr, "%s: ", app_name);
+	vfprintf(stderr, s, p);
+}
+
+static void error_msg_and_die(const char *s, ...) {
+	va_list p;
+
+	va_start(p, s);
+	verror_msg(s, p);
+	va_end(p);
+	putc('\n', stderr);
+	exit(EXIT_FAILURE);
+}
+
+static void vperror_msg(const char *s, va_list p) {
+	int err = errno;
+
+	if (s == 0)
+		s = "";
+	verror_msg(s, p);
+	if (*s)
+		s = ": ";
+	fprintf(stderr, "%s%s\n", s, strerror(err));
+}
+
+static void perror_msg_and_die(const char *s, ...) {
+	va_list p;
+
+	va_start(p, s);
+	vperror_msg(s, p);
+	va_end(p);
+	exit(EXIT_FAILURE);
+}
+
+
+
+static void full_write(void *target_buff, const void *buf, int len, int nd);
+
+void setup_cleanmarker() {
+
+	cleanmarker.magic    = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
+	cleanmarker.totlen   = cpu_to_je32(cleanmarker_size);
+	cleanmarker.hdr_crc  = cpu_to_je32(crc32(0, &cleanmarker, sizeof(struct jffs2_unknown_node)-4));
+}
+
+void process_options (int argc, char **argv){
+	int opt,c;
+	
+	while ((opt = getopt_long(argc, argv, short_options, long_options, &c)) >= 0) 
+	{
+		switch (opt) 
+		{
+			case 'o':
+				if (out_fd != -1) {
+					error_msg_and_die("output filename specified more than once");
+				}
+				out_fd = open(optarg, O_CREAT | O_TRUNC | O_RDWR, 0644);
+				if (out_fd == -1) {
+					perror_msg_and_die("open output file");
+				}
+				break;
+				
+			case 'i':
+				if (in_fd != -1) {
+					error_msg_and_die("input filename specified more than once");
+				}
+				in_fd = open(optarg, O_RDONLY);
+				if (in_fd == -1) {
+					perror_msg_and_die("open input file");
+				}
+				break;
+			case 'b':
+				target_endian = __BIG_ENDIAN;
+				break;
+			case 'l':
+				target_endian = __LITTLE_ENDIAN;
+				break;	
+			case 'h':
+			case '?':
+				error_msg_and_die(helptext);
+	
+			case 'v':
+				verbose = 1;
+				break;
+	
+			case 'V':
+				error_msg_and_die("revision %.*s\n",
+						(int) strlen(revtext) - 13, revtext + 11);
+	
+			case 'e': {
+				char *next;
+				unsigned units = 0;
+				erase_block_size = strtol(optarg, &next, 0);
+				if (!erase_block_size)
+					error_msg_and_die("Unrecognisable erase size\n");
+	
+				if (*next) {
+					if (!strcmp(next, "KiB")) {
+						units = 1024;
+					} else if (!strcmp(next, "MiB")) {
+						units = 1024 * 1024;
+					} else {
+						error_msg_and_die("Unknown units in erasesize\n");
+					}
+				} else {
+					if (erase_block_size < 0x1000)
+						units = 1024;
+					else
+						units = 1;
+				}
+				erase_block_size *= units;
+	
+				/* If it's less than 8KiB, they're not allowed */
+				if (erase_block_size < 0x2000) {
+					fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
+						erase_block_size);
+					erase_block_size = 0x2000;
+				}
+				break;
+			}
+
+			case 'n':
+				add_cleanmarkers = 0;
+				break;
+			case 'c':
+				cleanmarker_size = strtol(optarg, NULL, 0);
+			
+				if (cleanmarker_size < sizeof(cleanmarker)) {
+					error_msg_and_die("cleanmarker size must be >= 12");
+				}
+				if (cleanmarker_size >= erase_block_size) {
+					error_msg_and_die("cleanmarker size must be < eraseblock size");
+				}
+				
+				use_input_cleanmarker_size = 0;
+				found_cleanmarkers = 1;
+				setup_cleanmarker();
+				
+				break;
+			
+		}
+	}
+}
+
+
+void init_buffers() {
+	
+	inode_buffer = malloc(erase_block_size);
+	
+	if (!inode_buffer) {
+		perror("out of memory");
+		close (in_fd);
+		close (out_fd);
+		exit(1);
+	}
+		
+	dirent_buffer = malloc(erase_block_size);
+	
+	if (!dirent_buffer) {
+		perror("out of memory");
+		close (in_fd);
+		close (out_fd);
+		exit(1);
+	}
+		
+	file_buffer = malloc(erase_block_size);
+	
+	if (!file_buffer) {
+		perror("out of memory");
+		close (in_fd);
+		close (out_fd);
+		exit(1);
+	}
+}
+
+void clean_buffers() {
+	
+	if (inode_buffer) 
+		free(inode_buffer);
+	if (dirent_buffer)
+		free(dirent_buffer);
+	if (file_buffer)
+		free(file_buffer);
+}
+
+int load_next_block() {
+	
+	int ret;
+	ret = read(in_fd, file_buffer, erase_block_size);
+	file_ofs = 0;
+	
+	if(verbose)
+		printf("Load next block : %d bytes read\n",ret);
+	
+	return ret;
+}
+
+void write_buff_to_file(int nd) {
+	
+	int ret;
+	int len = erase_block_size;
+	uint8_t *buf = NULL;
+	
+	if (!nd) {
+		buf = inode_buffer;
+		while (len > 0) {
+			ret = write(out_fd, buf, len);
+	
+			if (ret < 0)
+				perror_msg_and_die("write");
+	
+			if (ret == 0)
+				perror_msg_and_die("write returned zero");
+	
+			len -= ret;
+			buf += ret;
+		}
+		ino_ofs = 0;
+	}
+	else {
+		buf = dirent_buffer;
+		while (len > 0) {
+			ret = write(out_fd, buf, len);
+	
+			if (ret < 0)
+				perror_msg_and_die("write");
+	
+			if (ret == 0)
+				perror_msg_and_die("write returned zero");
+	
+			len -= ret;
+			buf += ret;
+		}
+		dent_ofs = 0;
+	}
+}
+
+void dump_sum_records() {
+	
+    struct jffs2_inode_sum_node isum;
+    struct sum_storage *temp;
+	jint32_t offset;
+	jint32_t *wpage;
+	int datasize;
+	int infosize;
+	int padsize;
+	jint32_t magic = cpu_to_je32(JFFS2_SUM_MAGIC);
+	
+	if (!sum_records) 
+		return; 
+	
+	datasize = sum_records * sizeof(struct jffs2_inode_sum_record) + 8;
+	infosize = sizeof(struct jffs2_inode_sum_node) + datasize;
+	padsize = erase_block_size - ino_ofs - infosize;
+	infosize += padsize; datasize += padsize;
+	offset = cpu_to_je32(ino_ofs);
+	jint32_t *tpage = (jint32_t *) malloc(datasize);
+	
+	if(!tpage)
+		error_msg_and_die("Can't allocate memory to dump summary information!\n");
+	
+	memset(tpage, 0xff, datasize);
+	memset(&isum, 0, sizeof(isum));
+	
+	isum.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	isum.nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE_SUM);
+	isum.totlen = cpu_to_je32(infosize);
+	isum.hdr_crc = cpu_to_je32(crc32(0, &isum, sizeof(struct jffs2_unknown_node) - 4));
+		
+	if (add_cleanmarkers && found_cleanmarkers) {
+		isum.cln_mkr = cpu_to_je32(cleanmarker_size);	
+	}
+	else{
+		isum.cln_mkr = cpu_to_je32(0);
+	}
+	
+	isum.sum_num = cpu_to_je16(sum_records);
+	wpage = tpage;
+	
+	while (sum_records) {
+		*(wpage++) = sum_collected->inode;
+		*(wpage++) = sum_collected->version;
+		*(wpage++) = sum_collected->offset;
+		*(wpage++) = sum_collected->totlen;
+		temp = sum_collected;
+		sum_collected = sum_collected->next;
+		free(temp);
+		sum_records--;
+	}
+	
+	((char *)wpage) += padsize;
+	*(wpage++) = offset;
+	*(wpage++) = magic;
+	isum.sum_crc = cpu_to_je32(crc32(0, tpage, datasize));
+	isum.node_crc = cpu_to_je32(crc32(0, &isum, sizeof(isum) - 8));
+	
+	full_write(inode_buffer + ino_ofs, &isum, sizeof(isum), SINODE);
+	full_write(inode_buffer + ino_ofs, tpage, datasize, SINODE);
+	
+	free(tpage);
+}
+
+static void full_write(void *target_buff, const void *buf, int len, int nd) {
+	memcpy(target_buff, buf, len);
+	
+	if (!nd)
+		ino_ofs += len;
+	else 
+		dent_ofs += len;
+}
+
+static void pad(int req, int nd) {
+	if (!nd) {
+		
+		while (req) {
+			if (req > sizeof(ffbuf)) {
+				full_write(inode_buffer + ino_ofs, ffbuf, sizeof(ffbuf), nd);
+				req -= sizeof(ffbuf);
+			} else {
+				full_write(inode_buffer + ino_ofs, ffbuf, req, nd);
+				req = 0;
+			}
+		}
+	} 
+	else {
+		while (req) {
+			if (req > sizeof(ffbuf)) {
+				full_write(dirent_buffer + dent_ofs, ffbuf, sizeof(ffbuf), nd);
+				req -= sizeof(ffbuf);
+			} 
+			else {
+				full_write(dirent_buffer + dent_ofs, ffbuf, req, nd);
+				req = 0;
+			}
+		}
+	}
+}
+
+static inline void padword(int nd) {
+	
+	if (!nd){
+		if (ino_ofs % 4) {
+			full_write(inode_buffer + ino_ofs, ffbuf, 4 - (ino_ofs % 4), nd);
+		}
+	} 
+	else {
+		if (dent_ofs % 4) {
+			full_write(dirent_buffer + dent_ofs, ffbuf, 4 - (dent_ofs % 4), nd);
+		}
+	}
+}
+
+static inline void pad_block_if_less_than(int req, int nd) {
+    if (!nd) {
+	    int datasize = ((sum_records + 1) * sizeof(struct jffs2_inode_sum_record)) + sizeof(struct jffs2_inode_sum_node) + 8;
+	    datasize += (4 - (datasize % 4)) % 4;
+	    if (ino_ofs + req > erase_block_size - datasize) {
+	        dump_sum_records();
+			write_buff_to_file(nd);
+	    }
+		
+		if (add_cleanmarkers && found_cleanmarkers) {
+			if (!ino_ofs) {
+				full_write(inode_buffer, &cleanmarker, sizeof(cleanmarker), nd);
+				pad(cleanmarker_size - sizeof(cleanmarker), nd);
+				padword(nd);
+			}
+		}
+			
+    }
+	else {
+	    if (dent_ofs + req > erase_block_size)  {
+	        pad(erase_block_size - dent_ofs, nd);
+			write_buff_to_file(nd);
+	    }
+		
+		if (add_cleanmarkers && found_cleanmarkers) {
+			if (!dent_ofs) {
+				full_write(dirent_buffer, &cleanmarker, sizeof(cleanmarker), nd);
+				pad(cleanmarker_size - sizeof(cleanmarker), nd);
+				padword(nd);
+			}
+    	}
+	}	
+}
+
+void flush_buffers() {
+	
+	if ((add_cleanmarkers == 1) && (found_cleanmarkers == 1)) { /* CLEANMARKER */
+		if (ino_ofs != cleanmarker_size) {	/* INODE BUFFER */
+			
+		    int datasize = ((sum_records + 1) * sizeof(struct jffs2_inode_sum_record)) + sizeof(struct jffs2_inode_sum_node) + 8;
+		    datasize += (4 - (datasize % 4)) % 4;
+			
+			/* If we have a full inode buffer, then write out inode and summary data  */
+		    if (ino_ofs + sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN > erase_block_size - datasize) {
+		        dump_sum_records();
+				write_buff_to_file(SINODE);
+		    }
+			/* else just write out inode data */
+			else{
+				pad(erase_block_size - ino_ofs, SINODE);
+				write_buff_to_file(SINODE);
+			}
+		}
+		
+		if (dent_ofs != cleanmarker_size) { /* DIRENT AND OTHERS BUFFER */
+			pad(erase_block_size - dent_ofs, SONODE);
+			write_buff_to_file(SONODE);
+		}
+		
+	}
+	else { /* NO CLEANMARKER */
+		if (ino_ofs != 0) { /* INODE BUFFER */
+			
+		    int datasize = ((sum_records + 1) * sizeof(struct jffs2_inode_sum_record)) + sizeof(struct jffs2_inode_sum_node) + 8;
+		    datasize += (4 - (datasize % 4)) % 4;
+			
+			/* If we have a full inode buffer, then write out inode and summary data */
+		    if (ino_ofs + sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN > erase_block_size - datasize) {
+		        dump_sum_records();
+				write_buff_to_file(SINODE);
+		    }
+			/* Else just write out inode data */
+			else{
+				pad(erase_block_size - ino_ofs, SINODE);
+				write_buff_to_file(SINODE);
+			}
+		}
+		
+		if (dent_ofs != 0) { /* DIRENT AND OTHER BUFFER */
+			pad(erase_block_size - dent_ofs, SONODE);
+			write_buff_to_file(SONODE);
+		}
+	}
+}
+
+
+void write_dirent_to_buff(union jffs2_node_union *node) {
+	
+	pad_block_if_less_than(je32_to_cpu (node->d.totlen), SONODE);
+	full_write(dirent_buffer + dent_ofs, &(node->d), je32_to_cpu (node->d.totlen), SONODE);
+	padword(SONODE);	
+}
+
+void add_sum_entry(union jffs2_node_union *node) {
+	
+	sum_storage *walk;
+	sum_storage *temp = (sum_storage *) malloc(sizeof(sum_storage));
+	
+	if (!temp)
+		error_msg_and_die("Can't allocate memory for summary information!\n");
+	
+	temp->inode = node->i.ino;
+	temp->version = node->i.version;
+	temp->offset = cpu_to_je32(ino_ofs); 
+	temp->totlen = node->i.totlen;
+	temp->next = NULL;
+	
+	if (!sum_collected) {
+	    sum_collected = temp;
+	} 
+	else {
+	    walk = sum_collected;
+		
+	    while (walk->next) {
+			walk = walk->next;
+	    }
+		walk->next = temp;
+	}
+	sum_records++;
+}
+
+void write_inode_to_buff(union jffs2_node_union *node) {
+	
+	pad_block_if_less_than(je32_to_cpu (node->i.totlen), SINODE);  
+	add_sum_entry(node);	/* Add inode summary entry to summary list */
+	full_write(inode_buffer + ino_ofs, &(node->i), je32_to_cpu (node->i.totlen), SINODE);	/* Write out the inode to inode_buffer */
+	padword(SINODE);
+	
+}
+
+
+void create_summed_image(int inp_size) {
+	uint8_t		*p = file_buffer;
+	union jffs2_node_union 	*node;
+	uint32_t	crc;
+	uint16_t	type;
+	int		bitchbitmask = 0;
+	int		obsolete;
+	
+	char	name[256];
+	
+	while ( p < (file_buffer + inp_size)) {
+		
+		node = (union jffs2_node_union*) p;
+		
+		/* Skip empty space */
+		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
+			p += 4;
+			continue;
+		}
+		
+		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
+			if (!bitchbitmask++)
+    			    printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+			p += 4;
+			continue;
+		}
+		
+		bitchbitmask = 0;
+		
+		type = je16_to_cpu(node->u.nodetype);
+		if ((type & JFFS2_NODE_ACCURATE) != JFFS2_NODE_ACCURATE) {
+			obsolete = 1;
+			type |= JFFS2_NODE_ACCURATE;
+		} else
+			obsolete = 0;
+		
+		node->u.nodetype = cpu_to_je16(type);
+	    
+		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
+		if (crc != je32_to_cpu (node->u.hdr_crc)) {
+			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
+			p += 4;
+			continue;
+		}
+		
+		switch(je16_to_cpu(node->u.nodetype)) {
+		
+			case JFFS2_NODETYPE_INODE:
+				if(verbose)
+					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
+						je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize), 
+						je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
+	
+				crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
+				if (crc != je32_to_cpu (node->i.node_crc)) {
+					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
+					p += PAD(je32_to_cpu (node->i.totlen));
+					continue;
+				}
+				
+				crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
+				if (crc != je32_to_cpu(node->i.data_crc)) {
+					printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
+					p += PAD(je32_to_cpu (node->i.totlen));
+					continue;
+				}
+				
+				write_inode_to_buff(node);
+				
+				p += PAD(je32_to_cpu (node->i.totlen));
+				break;
+				
+			case JFFS2_NODETYPE_DIRENT:
+				memcpy (name, node->d.name, node->d.nsize);
+				name [node->d.nsize] = 0x0;
+			
+				if(verbose)
+					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
+						je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino), 
+						node->d.nsize, name);
+	
+				crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
+				if (crc != je32_to_cpu (node->d.node_crc)) {
+					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
+					p += PAD(je32_to_cpu (node->d.totlen));
+					continue;
+				}
+				
+				crc = crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
+				if (crc != je32_to_cpu(node->d.name_crc)) {
+					printf ("Wrong name_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
+					p += PAD(je32_to_cpu (node->d.totlen));
+					continue;
+				}
+	
+				write_dirent_to_buff(node);
+				
+				p += PAD(je32_to_cpu (node->d.totlen));						
+				break;
+		
+			case JFFS2_NODETYPE_CLEANMARKER:
+				if (verbose) {
+					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				if(!found_cleanmarkers){
+					found_cleanmarkers = 1;
+					
+					if(add_cleanmarkers == 1 && use_input_cleanmarker_size == 1){
+						cleanmarker_size = je32_to_cpu (node->u.totlen);
+						setup_cleanmarker();
+					}
+				}			
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+				break;
+		
+			case JFFS2_NODETYPE_PADDING:
+				if (verbose) {
+					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}		
+				p += PAD(je32_to_cpu (node->u.totlen));						
+				break;
+				
+			case 0xffff:
+				p += 4;
+				break;
+				
+			default:	
+				if (verbose) {
+					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				write_dirent_to_buff(node);
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+		}	
+	}
+}
+
+int main(int argc, char **argv) {
+	
+	int ret;
+	
+	process_options(argc,argv);
+	
+	if ((in_fd == -1) || (out_fd == -1))	{
+		
+		if(in_fd != -1)
+			close(in_fd);
+		if(out_fd != -1)
+			close(out_fd);
+		
+		error_msg_and_die("You must specify input and output files!\n");
+	}
+	
+	init_buffers();
+	
+	while ((ret = load_next_block())) {
+		create_summed_image(ret);	
+	}
+
+	flush_buffers();
+	clean_buffers();
+	
+	if (in_fd != -1)
+		close(in_fd);
+	if (out_fd != -1)
+		close(out_fd);
+	
+	return 0;
+}

--------------020509080808010306000504--
