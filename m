Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EiPDJ-0003Xs-CK
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 23:41:40 -0500
Message-ID: <43912158.7050204@kaigai.gr.jp>
Date: Sat, 03 Dec 2005 13:38:48 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>	<433A57D8.9030501@ak.jp.nec.com>	<20050929074500.GA16687@wohnheim.fh-wedel.de>	<435647A8.6090103@ak.jp.nec.com>	<20051019142438.GA32362@wohnheim.fh-wedel.de>	<43895906.3040705@ak.jp.nec.com>	<43897FDB.50405@ak.jp.nec.com>
	<4389D4B2.2050001@yandex.ru>
In-Reply-To: <4389D4B2.2050001@yandex.ru>
Content-Type: multipart/mixed; boundary="------------060706060003090900050300"
Cc: James Morris <jmorris@redhat.com>, KaiGai Kohei <kaigai@ak.jp.nec.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, lorenzohgh@gmail.com,
	Stephen Smalley <sds@tycho.nsa.gov>, Andreas Gruenbacher <agruen@suse.de>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060706060003090900050300
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello, Aterm.

This patch replaces any warning messages by raw-printk()
with JFFS2_WARNING()/JFFS2_NOTICE() macros, and any debugging messages
are replaced by dbg_xattr() which is newly defined in debug.h.

Please apply this patch after 'jffs2_xattr_take-4.patch' which
I posted at 27-Nov 2005.
Since the whole of those implementation is a bit massive, I post
only difference with last time.
If you hope to get the whole of this implementation already patched,
please visit http://www.kaigai.gr.jp/ and download 'jffs2_xattr_take-4.1.patch'.

[JFFS2] Provide XATTR and POSIX ACL support on JFFS2
        - http://www.kaigai.gr.jp/patch/jffs2_xattr_take-4.1.patch
[JFFS2] Provide --with-{xattr|selinux|posix-acl} options for mkfs.jffs2
        - http://www.kaigai.gr.jp/patch/mkfs.jffs2-xattr.patch

Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

Thanks,


Artem B. Bityutskiy wrote:
> Hello KaiGai,
> 
> to ease JFFS2 debugging I split debugging messages by subsystems and one 
> may enable/disable debugging messages from each subsystem separately. I 
> wonder, if it is possible to add DBG_XATTR() or the like instead of 
> using D1()? It really makes bugs hunting easier. Please, glance at debug.h.
> 
> Thanks.

-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>

--------------060706060003090900050300
Content-Type: text/plain;
 name="jffs2_xattr_dbgmsg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_xattr_dbgmsg.patch"

diff -prNU3 mtd-20051127.xattr/fs/jffs2/acl.c mtd-20051127.xattr-dbg/fs/jffs2/acl.c
--- mtd-20051127.xattr/fs/jffs2/acl.c	2005-12-02 12:14:28.000000000 -0500
+++ mtd-20051127.xattr-dbg/fs/jffs2/acl.c	2005-11-29 10:42:16.000000000 -0500
@@ -53,14 +53,16 @@ static struct posix_acl *jffs2_acl_from_
 {
 	const char *end = (char *)value + size;
 	struct posix_acl *acl;
+	uint32_t ver;
 	int i, count;
 
 	if (!value)
 		return NULL;
 	if (size < sizeof(jffs2_acl_header))
 		return ERR_PTR(-EINVAL);
-	if (je32_to_cpu(((jffs2_acl_header *)value)->a_version) != JFFS2_ACL_VERSION) {
-		D1(printk(KERN_NOTICE "%s:%d invalid ACL version.\n", __FUNCTION__, __LINE__));
+	ver = je32_to_cpu(((jffs2_acl_header *)value)->a_version);
+	if (ver != JFFS2_ACL_VERSION) {
+		JFFS2_WARNING("Invalid ACL version. (=%u)\n", ver);
 		return ERR_PTR(-EINVAL);
 	}
 
diff -prNU3 mtd-20051127.xattr/fs/jffs2/debug.h mtd-20051127.xattr-dbg/fs/jffs2/debug.h
--- mtd-20051127.xattr/fs/jffs2/debug.h	2005-11-07 20:02:14.000000000 -0500
+++ mtd-20051127.xattr-dbg/fs/jffs2/debug.h	2005-12-02 12:20:43.000000000 -0500
@@ -171,6 +171,12 @@
 #define dbg_memalloc(fmt, ...)
 #endif
 
+/* Watch the XATTR subsystem */
+#ifdef JFFS2_DBG_XATTR_MESSAGES
+#define dbg_xattr(fmt, ...)  JFFS2_DEBUG(fmt, ##__VA_ARGS__)
+#else
+#define dbg_xattr(fmt, ...)
+#endif 
 
 /* "Sanity" checks */
 void
diff -prNU3 mtd-20051127.xattr/fs/jffs2/scan.c mtd-20051127.xattr-dbg/fs/jffs2/scan.c
--- mtd-20051127.xattr/fs/jffs2/scan.c	2005-12-02 12:14:28.000000000 -0500
+++ mtd-20051127.xattr-dbg/fs/jffs2/scan.c	2005-12-02 10:38:13.000000000 -0500
@@ -329,27 +329,27 @@ static int jffs2_scan_xattr_node(struct 
 
 	crc = crc32(0, rx, sizeof(struct jffs2_raw_xattr)-8);
 	if (crc != je32_to_cpu(rx->node_crc)) {
-		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
-		       "Read 0x%08x, calculated 0x%08x\n",
-		       __FUNCTION__, ofs, je32_to_cpu(rx->node_crc), crc);
+		JFFS2_WARNING("node CRC failed on node at 0x%08x: "
+			      "Read 0x%08x, calculated 0x%08x\n",
+			      ofs, je32_to_cpu(rx->node_crc), crc);
 		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
 		return 0;
 	}
 
 	xd = jffs2_find_xattr_datum(c, je32_to_cpu(rx->xid));
 	if (xd) {
-		printk(KERN_NOTICE "%s() duplicate xid=%u found. "
-		       "on node at 0x%08x, later one is ignored.\n",
-		       __FUNCTION__, je32_to_cpu(rx->xid), ofs);
+		JFFS2_WARNING("duplicate xid=%u found. "
+			      "on node at 0x%08x, later one is ignored.\n",
+			      je32_to_cpu(rx->xid), ofs);
 		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
 		return 0;
 	}
 
 	crc = crc32(0, rx->data, rx->name_len + 1 + je16_to_cpu(rx->value_len));
 	if (crc != je32_to_cpu(rx->data_crc)) {
-		printk(KERN_NOTICE "%s data CRC failed on node at 0x%08x: "
-		       "Read 0x%08x, calculated 0x%08x\n",
-		       __FUNCTION__, ofs, je32_to_cpu(rx->data_crc), crc);
+		JFFS2_WARNING("data CRC failed on node at 0x%08x: "
+			      "Read 0x%08x, calculated 0x%08x\n",
+			      ofs, je32_to_cpu(rx->data_crc), crc);
 		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
 		return 0;
 	}
@@ -388,6 +388,9 @@ static int jffs2_scan_xattr_node(struct 
 
 	jffs2_attach_xattr_datum(c, xd);
 
+	D2(dbg_xattr("scan JFFS2_NODETYPE_XATTR at %#08x (xid=%u, xprefix=%d)\n",
+		     ofs, xd->xid, xd->xprefix));
+
 	return 0;
 }
 
@@ -400,9 +403,9 @@ static int jffs2_scan_xref_node(struct j
 
 	crc = crc32(0, rr, sizeof(*rr)-4);
 	if (crc != je32_to_cpu(rr->node_crc)) {
-		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
-		       "Read 0x%08x, calculated 0x%08x\n",
-		       __FUNCTION__, ofs, je32_to_cpu(rr->node_crc), crc);
+		JFFS2_WARNING("node CRC failed on node at 0x%08x: "
+			      "Read 0x%08x, calculated 0x%08x\n",
+			      ofs, je32_to_cpu(rr->node_crc), crc);
 		dirty_space(c, jeb, je32_to_cpu(rr->totlen));
 		return 0;
 	}
@@ -448,6 +451,9 @@ static int jffs2_scan_xref_node(struct j
 
 	list_add_tail(&ref->ilist, &c->xattr_temp);
 
+	D2(dbg_xattr("scan JFFS2_NODETYPE_XREF at %#08x (xid=%u, ino=%u)\n",
+		     ofs, ref->xid, ref->ino));
+
 	return 0;
 }
 #endif
diff -prNU3 mtd-20051127.xattr/fs/jffs2/xattr.c mtd-20051127.xattr-dbg/fs/jffs2/xattr.c
--- mtd-20051127.xattr/fs/jffs2/xattr.c	2005-12-02 12:14:28.000000000 -0500
+++ mtd-20051127.xattr-dbg/fs/jffs2/xattr.c	2005-11-29 10:39:44.000000000 -0500
@@ -239,7 +239,7 @@ void jffs2_build_xattr_subsystem(struct 
 	struct jffs2_xattr_ref *ref, *_ref;
 	struct jffs2_xattr_datum *xd, *_xd;
 	struct jffs2_inode_cache *ic;
-	int i;
+	int i, count = 0;
 
 	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
 
@@ -251,8 +251,8 @@ void jffs2_build_xattr_subsystem(struct 
 		xd = jffs2_find_xattr_datum(c, ref->xid);
 		ic = jffs2_get_ino_cache(c, ref->ino);
 		if (!xd || !ic) {
-			printk(KERN_NOTICE "building xref {ino=%u, xid=%u} is not found.\n",
-			       ref->xid, ref->ino);
+			JFFS2_WARNING("can not bind xref(ino=%u, xid=%u), xattr or inode "
+				      "was not found\n", ref->xid, ref->ino);
 			ref->node->next_in_ino = NULL;
 			jffs2_mark_node_obsolete(c, ref->node);
 			jffs2_free_xattr_ref(ref);
@@ -262,7 +262,8 @@ void jffs2_build_xattr_subsystem(struct 
 		ref->ic = ic;
 		xd->refcnt++;
 		list_add_tail(&ref->ilist, &ic->ilist);
-		D1(printk(KERN_NOTICE "bind XREF{ino=%u, xid=%u}\n", ic->ino, xd->xid));
+		count++;
+		D1(dbg_xattr("bind xref(ino=%u, xid=%u)\n", ic->ino, xd->xid));
 	}
 	/* After this, ref->xid/ino are never used. */
 
@@ -271,13 +272,13 @@ void jffs2_build_xattr_subsystem(struct 
 		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
 			list_del_init(&xd->xindex);
 			if (!xd->refcnt) {
-				printk(KERN_NOTICE "unrefered xattr_datum found xid=%u\n", xd->xid);
+				JFFS2_WARNING("unrefered xattr found xid=%u\n", xd->xid);
 				delete_xattr_datum(c, xd);
 			}
 		}
 	}
 	/* build complete */
-	D1(printk(KERN_NOTICE "%s complete.\n", __FUNCTION__));
+	D1(dbg_xattr("complete binding %d of JFFS2_NODETYPE_XREFs\n", count));
 }
 
 struct jffs2_xattr_datum *jffs2_find_xattr_datum(struct jffs2_sb_info *c, uint32_t xid)
@@ -328,8 +329,8 @@ static void reclaim_xattr_datum(struct j
 		index = (index+1) % XATTRINDEX_HASHSIZE;
 	}
  out:
-	printk(KERN_NOTICE "JFFS2: reclaim_xattr_cache() before: %d Byte  after: %d Byte\n",
-			   before, c->xdatum_mem_usage);
+	JFFS2_NOTICE("xdatum_mem_usage from %u byte to %u byte (%u byte reclaimed)\n",
+		     before, c->xdatum_mem_usage, before - c->xdatum_mem_usage);
 }
 
 static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
@@ -340,7 +341,7 @@ static int do_load_xattr_datum(struct jf
 	uint32_t crc, length;
 	int i, ret, retry = 0;
 
-	D1(printk(KERN_NOTICE "%s xid=%u xprefix=%d\n", __FUNCTION__, xd->xid, xd->xprefix));
+	D1(dbg_xattr("xid=%u xprefix=%d\n", xd->xid, xd->xprefix));
  retry:
 	length = xd->name_len + 1 + xd->value_len;
 	data = kmalloc(length, GFP_KERNEL);
@@ -352,8 +353,8 @@ static int do_load_xattr_datum(struct jf
 			       length, &readlen, data);
 
 	if (ret || length!=readlen) {
-		printk(KERN_WARNING "jffs2_flash_read()=%d, request: %d, readlen: %d, at 0x%08x\n",
-		       ret, length, readlen, ref_offset(xd->node));
+		JFFS2_WARNING("jffs2_flash_read() returned %d, request=%d, readlen=%d, at %#08x\n",
+			      ret, length, readlen, ref_offset(xd->node));
 		kfree(data);
 		return ret ? ret : -EIO;
 	}
@@ -361,9 +362,9 @@ static int do_load_xattr_datum(struct jf
 	data[xd->name_len] = '\0';
 	crc = crc32(0, data, length);
 	if (crc != xd->data_crc) {
-		printk(KERN_WARNING "node CRC failed (JFFS2_NODETYPE_XREF)"
-				    " at 0x%08x, read: 0x%08x calculated: 0x%08x\n",
-				    ref_offset(xd->node), xd->data_crc, crc);
+		JFFS2_WARNING("node CRC failed (JFFS2_NODETYPE_XREF)"
+			      " at %#08x, read: 0x%08x calculated: 0x%08x\n",
+			      ref_offset(xd->node), xd->data_crc, crc);
 		kfree(data);
 		return -EIO;
 	}
@@ -416,7 +417,7 @@ static inline int load_xattr_datum(struc
 static void unload_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
 {
 	/* must be called under down_write(xattr_sem) */
-	D1(printk(KERN_NOTICE "%s xid=%u xprefix=%d\n", __FUNCTION__, xd->xid, xd->xprefix));
+	D1(dbg_xattr("xid=%u xprefix=%d\n", xd->xid, xd->xprefix));
 
 	if (xd->xname) {
 		c->xdatum_mem_usage -= (xd->name_len + 1 + xd->value_len);
@@ -471,8 +472,8 @@ static int save_xattr_datum(struct jffs2
 
 	ret = jffs2_flash_writev(c, vecs, 2, phys_ofs, &length, 0);
 	if (ret || totlen!=length) {
-		printk(KERN_NOTICE "%s:%d Write of %d bytes at 0x%08x failed. returned %d, retlen %d\n",
-		       __FILE__, __LINE__, totlen, phys_ofs, ret, length);
+		JFFS2_WARNING("jffs2_flash_writev() returned %d, totlen=%u, retlen=%u, at %#08x\n",
+			      ret, totlen, length, phys_ofs);
 		ret = ret ? ret : -EIO;
 		if (length) {
 			raw->flash_offset |= REF_OBSOLETE;
@@ -609,8 +610,8 @@ static int save_xattr_ref(struct jffs2_s
 
 	ret = jffs2_flash_write(c, phys_ofs, sizeof(rr), &length, (char *)&rr);
 	if (ret || sizeof(rr)!=length) {
-		printk(KERN_NOTICE "%s:%d Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
-		       __FILE__, __LINE__, sizeof(rr), phys_ofs, ret, length);
+		JFFS2_WARNING("jffs2_flash_write() returned %d, request=%u, retlen=%u, at %#08x\n",
+			      ret, sizeof(rr), length, phys_ofs);
 		ret = ret ? ret : -EIO;
 		if (length) {
 			raw->flash_offset |= REF_OBSOLETE;
@@ -688,6 +689,8 @@ static void delete_xattr_ref(struct jffs
 
 void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
 {
+	/* It's called from jffs2_clear_inode() on inode removing.
+	   When an inode with XATTR is removed, those XATTRs must be removed. */
 	struct jffs2_xattr_ref *ref, *_ref;
 
 	if (!ic || ic->nlink > 0)
@@ -701,7 +704,7 @@ void jffs2_xattr_delete_inode(struct jff
 
 void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
 {
-	/* It's called from jffs2_free_ino_caches() */
+	/* It's called from jffs2_free_ino_caches() until unmounting FS. */
 	struct jffs2_xattr_datum *xd;
 	struct jffs2_xattr_ref *ref, *_ref;
 
@@ -860,10 +863,11 @@ int do_jffs2_setxattr(struct inode *inod
 		return ret;
 
 	request = PAD(sizeof(*xd) + strlen(xname) + 1 + size);
-	ret = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
+	ret = jffs2_reserve_space(c, request, &phys_ofs, &length,
+				  ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
 	if (ret) {
-		printk(KERN_NOTICE "%s:%d jffs2_reserve_space()=%d length=%d request=%d at 0x%08x\n",
-		       __FILE__, __LINE__, ret, length, request, phys_ofs);
+		JFFS2_WARNING("jffs2_reserve_space() returned %d, request=%u, length=%u at %#08x\n",
+			      ret, request, length, phys_ofs);
 		return ret;
 	}
 
@@ -907,10 +911,11 @@ int do_jffs2_setxattr(struct inode *inod
 
 	/* create xattr_ref */
 	request = PAD(sizeof(*nref));
-	ret = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
+	ret = jffs2_reserve_space(c, request, &phys_ofs, &length,
+				  ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
 	if (ret) {
-		printk(KERN_NOTICE "%s:%d jffs2_reserve_space()=%d length=%d request=%d at 0x%08x\n",
-		       __FILE__, __LINE__, ret, length, request, phys_ofs);
+		JFFS2_WARNING("jffs2_reserve_space() returned %d, request=%u, length=%u at %#08x\n",
+			      ret, request, length, phys_ofs);
 		down_write(&c->xattr_sem);
 		xd->refcnt--;
 		if (!xd->refcnt)
@@ -951,9 +956,8 @@ static int jffs2_garbage_collect_xattr_d
 
 	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length, JFFS2_SUMMARY_NOSUM_SIZE);
 	if (ret || length < totlen) {
-		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d "
-				    "request: %d byte reserved: %d byte",
-				    ret, totlen, length);
+		JFFS2_WARNING("jffs2_reserve_space_gc()=%d, request=%u, reserved=%u, at %#08x\n",
+			      ret, totlen, length, phys_ofs);
 		return ret ? ret : -EBADFD;
 	}
 
@@ -979,8 +983,8 @@ static int jffs2_garbage_collect_xattr_r
 
 	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length, JFFS2_SUMMARY_NOSUM_SIZE);
 	if (ret || length < totlen) {
-		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d"
-		       " request: %d byte reserved: %d byte", ret, totlen, length);
+		JFFS2_WARNING("jffs2_reserve_space_gc()=%d, request=%u, reserved=%u, at %#08x\n",
+			      ret, totlen, length, phys_ofs);
 		return ret ? ret : -EBADFD;
 	}
 

--------------060706060003090900050300--
