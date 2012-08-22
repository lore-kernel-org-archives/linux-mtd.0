Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T47Ec-0004X1-2B
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 09:28:23 +0000
Received: by weyr3 with SMTP id r3so481279wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 02:28:21 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS 2/5] dtype parameter is obsolete
Date: Wed, 22 Aug 2012 11:27:57 +0200
Message-Id: <1345627680-8166-3-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kernel commit a65a0eb6d198e058687a9214683bd1c418f20d39 set the dtype
parameter as obsolete.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 mkfs.ubifs/lpt.c           |   10 +++++-----
 mkfs.ubifs/mkfs.ubifs.c    |   35 +++++++++++++++--------------------
 mkfs.ubifs/mkfs.ubifs.h    |    2 +-
 ubi-utils/include/libubi.h |    3 +--
 ubi-utils/libubi.c         |    3 +--
 5 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
index 60002ff..f6d4352 100644
--- a/mkfs.ubifs/lpt.c
+++ b/mkfs.ubifs/lpt.c
@@ -410,7 +410,7 @@ int create_lpt(struct ubifs_info *c)
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
+			err = write_leb(lnum++, alen, buf);
 			if (err)
 				goto out;
 			p = buf;
@@ -452,7 +452,7 @@ int create_lpt(struct ubifs_info *c)
 				set_ltab(c, lnum, c->leb_size - alen,
 					    alen - len);
 				memset(p, 0xff, alen - len);
-				err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
+				err = write_leb(lnum++, alen, buf);
 				if (err)
 					goto out;
 				p = buf;
@@ -499,7 +499,7 @@ int create_lpt(struct ubifs_info *c)
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
+			err = write_leb(lnum++, alen, buf);
 			if (err)
 				goto out;
 			p = buf;
@@ -522,7 +522,7 @@ int create_lpt(struct ubifs_info *c)
 		alen = ALIGN(len, c->min_io_size);
 		set_ltab(c, lnum, c->leb_size - alen, alen - len);
 		memset(p, 0xff, alen - len);
-		err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
+		err = write_leb(lnum++, alen, buf);
 		if (err)
 			goto out;
 		p = buf;
@@ -542,7 +542,7 @@ int create_lpt(struct ubifs_info *c)
 
 	/* Write remaining buffer */
 	memset(p, 0xff, alen - len);
-	err = write_leb(lnum, alen, buf, UBI_SHORTTERM);
+	err = write_leb(lnum, alen, buf);
 	if (err)
 		goto out;
 
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index bb25dc3..751e348 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -774,16 +774,15 @@ static void prepare_node(void *node, int len)
  * @lnum: LEB number
  * @len: length of data in the buffer
  * @buf: buffer (must be at least c->leb_size bytes)
- * @dtype: expected data type
  */
-int write_leb(int lnum, int len, void *buf, int dtype)
+int write_leb(int lnum, int len, void *buf)
 {
 	off64_t pos = (off64_t)lnum * c->leb_size;
 
 	dbg_msg(3, "LEB %d len %d", lnum, len);
 	memset(buf + len, 0xff, c->leb_size - len);
 	if (out_ubi)
-		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size, dtype))
+		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size))
 			return sys_err_msg("ubi_leb_change_start failed");
 
 	if (lseek64(out_fd, pos, SEEK_SET) != pos)
@@ -800,11 +799,10 @@ int write_leb(int lnum, int len, void *buf, int dtype)
 /**
  * write_empty_leb - copy the image of an empty LEB to the output target.
  * @lnum: LEB number
- * @dtype: expected data type
  */
-static int write_empty_leb(int lnum, int dtype)
+static int write_empty_leb(int lnum)
 {
-	return write_leb(lnum, 0, leb_buf, dtype);
+	return write_leb(lnum, 0, leb_buf);
 }
 
 /**
@@ -851,9 +849,8 @@ static int do_pad(void *buf, int len)
  * @node: node
  * @len: node length
  * @lnum: LEB number
- * @dtype: expected data type
  */
-static int write_node(void *node, int len, int lnum, int dtype)
+static int write_node(void *node, int len, int lnum)
 {
 	prepare_node(node, len);
 
@@ -861,7 +858,7 @@ static int write_node(void *node, int len, int lnum, int dtype)
 
 	len = do_pad(leb_buf, len);
 
-	return write_leb(lnum, len, leb_buf, dtype);
+	return write_leb(lnum, len, leb_buf);
 }
 
 /**
@@ -973,7 +970,7 @@ static int flush_nodes(void)
 	if (!head_offs)
 		return 0;
 	len = do_pad(leb_buf, head_offs);
-	err = write_leb(head_lnum, len, leb_buf, UBI_UNKNOWN);
+	err = write_leb(head_lnum, len, leb_buf);
 	if (err)
 		return err;
 	set_lprops(head_lnum, head_offs, head_flags);
@@ -1901,7 +1898,7 @@ static int set_gc_lnum(void)
 	int err;
 
 	c->gc_lnum = head_lnum++;
-	err = write_empty_leb(c->gc_lnum, UBI_LONGTERM);
+	err = write_empty_leb(c->gc_lnum);
 	if (err)
 		return err;
 	set_lprops(c->gc_lnum, 0, 0);
@@ -1977,7 +1974,7 @@ static int write_super(void)
 	if (c->space_fixup)
 		sup.flags |= cpu_to_le32(UBIFS_FLG_SPACE_FIXUP);
 
-	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM, UBI_LONGTERM);
+	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM);
 }
 
 /**
@@ -2020,13 +2017,11 @@ static int write_master(void)
 	mst.total_dark   = cpu_to_le64(c->lst.total_dark);
 	mst.leb_cnt      = cpu_to_le32(c->leb_cnt);
 
-	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM,
-			 UBI_SHORTTERM);
+	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM);
 	if (err)
 		return err;
 
-	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM + 1,
-			 UBI_SHORTTERM);
+	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM + 1);
 	if (err)
 		return err;
 
@@ -2046,14 +2041,14 @@ static int write_log(void)
 	cs.ch.node_type = UBIFS_CS_NODE;
 	cs.cmt_no = cpu_to_le64(0);
 
-	err = write_node(&cs, UBIFS_CS_NODE_SZ, lnum, UBI_UNKNOWN);
+	err = write_node(&cs, UBIFS_CS_NODE_SZ, lnum);
 	if (err)
 		return err;
 
 	lnum += 1;
 
 	for (i = 1; i < c->log_lebs; i++, lnum++) {
-		err = write_empty_leb(lnum, UBI_UNKNOWN);
+		err = write_empty_leb(lnum);
 		if (err)
 			return err;
 	}
@@ -2074,7 +2069,7 @@ static int write_lpt(void)
 
 	lnum = c->nhead_lnum + 1;
 	while (lnum <= c->lpt_last) {
-		err = write_empty_leb(lnum++, UBI_SHORTTERM);
+		err = write_empty_leb(lnum++);
 		if (err)
 			return err;
 	}
@@ -2091,7 +2086,7 @@ static int write_orphan_area(void)
 
 	lnum = UBIFS_LOG_LNUM + c->log_lebs + c->lpt_lebs;
 	for (i = 0; i < c->orph_lebs; i++, lnum++) {
-		err = write_empty_leb(lnum, UBI_SHORTTERM);
+		err = write_empty_leb(lnum);
 		if (err)
 			return err;
 	}
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/mkfs.ubifs/mkfs.ubifs.h
index c00dce0..01161ef 100644
--- a/mkfs.ubifs/mkfs.ubifs.h
+++ b/mkfs.ubifs/mkfs.ubifs.h
@@ -129,7 +129,7 @@ extern struct ubifs_info info_;
 
 struct hashtable_itr;
 
-int write_leb(int lnum, int len, void *buf, int dtype);
+int write_leb(int lnum, int len, void *buf);
 int parse_devtable(const char *tbl_file);
 struct path_htbl_element *devtbl_find_path(const char *path);
 struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index dc03d02..45afe87 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -426,13 +426,12 @@ int ubi_update_start(libubi_t desc, int fd, long long bytes);
  * @fd: volume character device file descriptor
  * @lnum: LEB number to change
  * @bytes: how many bytes of new data will be written to the LEB
- * @dtype: data type (%UBI_LONGTERM, %UBI_SHORTTERM, %UBI_UNKNOWN)
  *
  * This function initiates atomic LEB change operation and returns %0 in case
  * of success and %-1 in case of error. he caller is assumed to write @bytes
  * data to the volume @fd afterward.
  */
-int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype);
+int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes);
 
 /**
  * ubi_set_property - set volume propety.
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index c898e36..9b0eab3 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -1106,7 +1106,7 @@ int ubi_update_start(libubi_t desc, int fd, long long bytes)
 	return 0;
 }
 
-int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype)
+int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes)
 {
 	struct ubi_leb_change_req req;
 
@@ -1114,7 +1114,6 @@ int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype)
 	memset(&req, 0, sizeof(struct ubi_leb_change_req));
 	req.lnum = lnum;
 	req.bytes = bytes;
-	req.dtype = dtype;
 
 	if (ioctl(fd, UBI_IOCEBCH, &req))
 		return -1;
-- 
1.7.2.5
