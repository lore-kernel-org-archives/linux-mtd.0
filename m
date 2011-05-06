Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMf6-0000RR-9s
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:09:49 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: add the fixup function
Date: Fri,  6 May 2011 18:13:40 +0300
Message-Id: <1304694820-32474-1-git-send-email-dedekind1@gmail.com>
Cc: "Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew L. Creech <mlcreech@gmail.com>

This patch adds the 'ubifs_fixup_free_space()' function which scans all LEBs in
the filesystem for those that are in-use but have one or more empty pages, then
re-maps the LEBs in order to erase the empty portions.  Afterward it removes
the "space_fixup" flag from the UBIFS superblock.

Artem: amended the commit message, massage the patch, fix few minor things
there.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/sb.c    |  152 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |    1 +
 2 files changed, 153 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 93d6928..e6c24f5 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -652,3 +652,155 @@ out:
 	kfree(sup);
 	return err;
 }
+
+/**
+ * fixup_leb_free_space - fixup/unmap an LEB containing free space.
+ * @c: UBIFS file-system description object
+ * @lnum: LEB number
+ * @len: number of used bytes in LEB (starting at offset 0)
+ *
+ * This function reads the contents of the given LEB number @lnum, then fixes
+ * it up, so that any empty min. I/O units are actually erased on flash (rather
+ * than being just all-0xff real data). If the LEB is completely empty, it is
+ * simply unmapped.
+ */
+static int fixup_leb_free_space(struct ubifs_info *c, int lnum, int len)
+{
+	int err;
+	void *sbuf = c->sbuf;
+
+	ubifs_assert(len >= 0);
+	ubifs_assert(len % c->min_io_size == 0);
+	ubifs_assert(len < c->leb_size);
+
+	if (len == 0) {
+		dbg_mnt("unmap empty LEB %d", lnum);
+		return ubi_leb_unmap(c->ubi, lnum);
+	}
+
+	dbg_mnt("fixup LEB %d, data len %d", lnum, len);
+	err = ubi_read(c->ubi, lnum, sbuf, 0, len);
+	if (err && err != -EBADMSG)
+		return err;
+
+	return ubi_leb_change(c->ubi, lnum, sbuf, len, UBI_UNKNOWN);
+}
+
+/**
+ * fixup_free_space - find & remap all LEBs containing free space.
+ * @c: UBIFS file-system description object
+ *
+ * This function walks through all LEBs in the filesystem and fiexes up those
+ * containing free/empty space.
+ */
+static int fixup_free_space(struct ubifs_info *c)
+{
+	int lnum, err = 0;
+	struct ubifs_lprops *lprops;
+
+	ubifs_get_lprops(c);
+
+	/* Fixup LEBs in the master area */
+	for (lnum = UBIFS_MST_LNUM; lnum < UBIFS_LOG_LNUM; lnum++) {
+		err = fixup_leb_free_space(c, lnum,
+					   c->mst_offs + c->mst_node_alsz);
+		if (err)
+			goto out;
+	}
+
+	/* Unmap unused log LEBs */
+	lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+	while (lnum != c->ltail_lnum) {
+		err = fixup_leb_free_space(c, lnum, 0);
+		if (err)
+			goto out;
+		lnum = ubifs_next_log_lnum(c, lnum);
+	}
+
+	/* Fixup the current log head */
+	err = fixup_leb_free_space(c, c->lhead_lnum, c->lhead_offs);
+	if (err)
+		goto out;
+
+	/* Fixup LEBs in the LPT area */
+	for (lnum = c->lpt_first; lnum <= c->lpt_last; lnum++) {
+		int free = c->ltab[lnum - c->lpt_first].free;
+
+		if (free > 0) {
+			err = fixup_leb_free_space(c, lnum, c->leb_size - free);
+			if (err)
+				goto out;
+		}
+	}
+
+	/* Unmap LEBs in the orphans area */
+	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
+		err = fixup_leb_free_space(c, lnum, 0);
+		if (err)
+			goto out;
+	}
+
+	/* Fixup LEBs in the main area */
+	for (lnum = c->main_first; lnum < c->leb_cnt; lnum++) {
+		lprops = ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(lprops)) {
+			err = PTR_ERR(lprops);
+			goto out;
+		}
+
+		if (lprops->free > 0) {
+			err = fixup_leb_free_space(c, lnum,
+						   c->leb_size - lprops->free);
+			if (err)
+				goto out;
+		}
+	}
+
+out:
+	ubifs_release_lprops(c);
+	return err;
+}
+
+/**
+ * ubifs_fixup_free_space - find & fix all LEBs with free space.
+ * @c: UBIFS file-system description object
+ *
+ * This function fixes up LEBs containing free space on first mount, if the
+ * appropriate flag was set when the FS was created. Each LEB with one or more
+ * empty min. I/O unit(i.e. free-space-count > 0) is re-written, to make sure
+ * the free space is actually erased. E.g., this is necessary for some NAND
+ * chips, since the free space may have been programmed like real "0xff" data
+ * (generating a non-0xff ECC), causing future writes to the not-really-erased
+ * NAND pages to behave badly. After fixup, the superblock space fixup flag is
+ * cleared, so that this is skipped for all future mounts.
+ */
+int ubifs_fixup_free_space(struct ubifs_info *c)
+{
+	int err;
+	struct ubifs_sb_node *sup;
+
+	ubifs_assert(c->space_fixup);
+	ubifs_assert(!c->ro_mount);
+
+	ubifs_msg("start fixing up free space");
+
+	err = fixup_free_space(c);
+	if (err)
+		return err;
+
+	sup = ubifs_read_sb_node(c);
+	if (IS_ERR(sup))
+		return PTR_ERR(sup);
+
+	/* Free-space fixup is no longer required */
+	c->space_fixup = 0;
+	sup->flags &= cpu_to_le32(~UBIFS_FLG_SPACE_FIXUP);
+
+	err = ubifs_write_sb_node(c, sup);
+	kfree(sup);
+	if (err)
+		return err;
+
+	ubifs_msg("free space fixup complete");
+	return err;
+}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 6f0bfa9..43b3195 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1635,6 +1635,7 @@ int ubifs_write_master(struct ubifs_info *c);
 int ubifs_read_superblock(struct ubifs_info *c);
 struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
+int ubifs_fixup_free_space(struct ubifs_info *c);
 
 /* replay.c */
 int ubifs_validate_entry(struct ubifs_info *c,
-- 
1.7.2.3
