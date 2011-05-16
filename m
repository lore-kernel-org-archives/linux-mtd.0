Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dK-HE
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:40 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTAq011099
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/20] UBIFS: add the fixup function
Date: Mon, 16 May 2011 10:44:38 +0300
Message-Id: <1305531879-19311-20-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew L. Creech <mlcreech@gmail.com>

This patch adds the 'ubifs_fixup_free_space()' function which scans all
LEBs in the filesystem for those that are in-use but have one or more
empty pages, then re-maps the LEBs in order to erase the empty portions.
Afterward it removes the "space_fixup" flag from the UBIFS superblock.

Artem: massaged the patch

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/sb.c    |  149 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |    1 +
 2 files changed, 150 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 93d6928..c606f01 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -652,3 +652,152 @@ out:
 	kfree(sup);
 	return err;
 }
+
+/**
+ * fixup_leb - fixup/unmap an LEB containing free space.
+ * @c: UBIFS file-system description object
+ * @lnum: the LEB number to fix up
+ * @len: number of used bytes in LEB (starting at offset 0)
+ *
+ * This function reads the contents of the given LEB number @lnum, then fixes
+ * it up, so that empty min. I/O units in the end of LEB are actually erased on
+ * flash (rather than being just all-0xff real data). If the LEB is completely
+ * empty, it is simply unmapped.
+ */
+static int fixup_leb(struct ubifs_info *c, int lnum, int len)
+{
+	int err;
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
+	err = ubi_read(c->ubi, lnum, c->sbuf, 0, len);
+	if (err)
+		return err;
+
+	return ubi_leb_change(c->ubi, lnum, c->sbuf, len, UBI_UNKNOWN);
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
+		err = fixup_leb(c, lnum, c->mst_offs + c->mst_node_alsz);
+		if (err)
+			goto out;
+	}
+
+	/* Unmap unused log LEBs */
+	lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+	while (lnum != c->ltail_lnum) {
+		err = fixup_leb(c, lnum, 0);
+		if (err)
+			goto out;
+		lnum = ubifs_next_log_lnum(c, lnum);
+	}
+
+	/* Fixup the current log head */
+	err = fixup_leb(c, c->lhead_lnum, c->lhead_offs);
+	if (err)
+		goto out;
+
+	/* Fixup LEBs in the LPT area */
+	for (lnum = c->lpt_first; lnum <= c->lpt_last; lnum++) {
+		int free = c->ltab[lnum - c->lpt_first].free;
+
+		if (free > 0) {
+			err = fixup_leb(c, lnum, c->leb_size - free);
+			if (err)
+				goto out;
+		}
+	}
+
+	/* Unmap LEBs in the orphans area */
+	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
+		err = fixup_leb(c, lnum, 0);
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
+			err = fixup_leb(c, lnum, c->leb_size - lprops->free);
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
+ * empty min. I/O unit (i.e. free-space-count > 0) is re-written, to make sure
+ * the free space is actually erased. E.g., this is necessary for some NAND
+ * chips, since the free space may have been programmed like real "0xff" data
+ * (generating a non-0xff ECC), causing future writes to the not-really-erased
+ * NAND pages to behave badly. After the space is fixed up, the superblock flag
+ * is cleared, so that this is skipped for all future mounts.
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
index 8e27553..93d1412 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1633,6 +1633,7 @@ int ubifs_write_master(struct ubifs_info *c);
 int ubifs_read_superblock(struct ubifs_info *c);
 struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
+int ubifs_fixup_free_space(struct ubifs_info *c);
 
 /* replay.c */
 int ubifs_validate_entry(struct ubifs_info *c,
-- 
1.7.2.3
