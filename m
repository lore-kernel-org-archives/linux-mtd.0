Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pex26-0007U7-JY
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2011 21:54:39 +0000
Received: by fxm19 with SMTP id 19so6531033fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jan 2011 13:54:37 -0800 (PST)
Subject: [PATCH v2 2/3] UBIFS: introduce mounting flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <1295301189.2470.27.camel@koala>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala>  <4D33FB78.5010208@nokia.com>
	<1295301189.2470.27.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 Jan 2011 23:54:24 +0200
Message-ID: <1295301264.2470.28.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a preparational patch which removes the 'c->always_chk_crc' which was
set during mounting and remounting to R/W mode and introduces 'c->mounting'
flag which is set when mounting. Now the 'c->always_chk_crc' flag is the
same as 'c->remounting_rw && c->mounting'.

This patch is a preparation for the next one which will need to know when we
are mounting and remounting to R/W mode, which is exactly what
'c->always_chk_crc' effectively is, but its name does not suite the
next patch. The other possibility would be to just re-name it, but then
we'd end up with less logical flags coverage.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c    |   12 ++++++++----
 fs/ubifs/super.c |   11 ++---------
 fs/ubifs/tnc.c   |   10 +++++++---
 fs/ubifs/ubifs.h |    5 ++---
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index d821731..d1fe562 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -88,8 +88,12 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
  * This function may skip data nodes CRC checking if @c->no_chk_data_crc is
  * true, which is controlled by corresponding UBIFS mount option. However, if
  * @must_chk_crc is true, then @c->no_chk_data_crc is ignored and CRC is
- * checked. Similarly, if @c->always_chk_crc is true, @c->no_chk_data_crc is
- * ignored and CRC is checked.
+ * checked. Similarly, if @c->mounting or @c->remounting_rw is true (we are
+ * mounting or re-mounting to R/W mode), @c->no_chk_data_crc is ignored and CRC
+ * is checked. This is because during mounting or re-mounting from R/O mode to
+ * R/W mode we may read journal nodes (when replying the journal or doing the
+ * recovery) and the journal nodes may potentially be corrupted, so checking is
+ * required.
  *
  * This function returns zero in case of success and %-EUCLEAN in case of bad
  * CRC or magic.
@@ -131,8 +135,8 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 		   node_len > c->ranges[type].max_len)
 		goto out_len;
 
-	if (!must_chk_crc && type == UBIFS_DATA_NODE && !c->always_chk_crc &&
-	     c->no_chk_data_crc)
+	if (!must_chk_crc && type == UBIFS_DATA_NODE && !c->mounting &&
+	    !c->remounting_rw && c->no_chk_data_crc)
 		return 0;
 
 	crc = crc32(UBIFS_CRC32_INIT, buf + 8, node_len - 8);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 91fac54..703a621 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1194,11 +1194,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (c->bulk_read == 1)
 		bu_init(c);
 
-	/*
-	 * We have to check all CRCs, even for data nodes, when we mount the FS
-	 * (specifically, when we are replaying).
-	 */
-	c->always_chk_crc = 1;
+	c->mounting = 1;
 
 	err = ubifs_read_superblock(c);
 	if (err)
@@ -1374,7 +1370,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_infos;
 
-	c->always_chk_crc = 0;
+	c->mounting = 0;
 
 	ubifs_msg("mounted UBI device %d, volume %d, name \"%s\"",
 		  c->vi.ubi_num, c->vi.vol_id, c->vi.name);
@@ -1535,7 +1531,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	mutex_lock(&c->umount_mutex);
 	dbg_save_space_info(c);
 	c->remounting_rw = 1;
-	c->always_chk_crc = 1;
 
 	err = check_free_space(c);
 	if (err)
@@ -1642,7 +1637,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	dbg_gen("re-mounted read-write");
 	c->ro_mount = 0;
 	c->remounting_rw = 0;
-	c->always_chk_crc = 0;
 	err = dbg_check_space_info(c);
 	mutex_unlock(&c->umount_mutex);
 	return err;
@@ -1659,7 +1653,6 @@ out:
 	c->ileb_buf = NULL;
 	ubifs_lpt_free(c, 1);
 	c->remounting_rw = 0;
-	c->always_chk_crc = 0;
 	mutex_unlock(&c->umount_mutex);
 	return err;
 }
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index ad9cf01..de48597 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -447,8 +447,11 @@ static int tnc_read_node_nm(struct ubifs_info *c, struct ubifs_zbranch *zbr,
  *
  * Note, this function does not check CRC of data nodes if @c->no_chk_data_crc
  * is true (it is controlled by corresponding mount option). However, if
- * @c->always_chk_crc is true, @c->no_chk_data_crc is ignored and CRC is always
- * checked.
+ * @c->mounting or @c->remounting_rw is true (we are mounting or re-mounting to
+ * R/W mode), @c->no_chk_data_crc is ignored and CRC is checked. This is
+ * because during mounting or re-mounting from R/O mode to R/W mode we may read
+ * journal nodes (when replying the journal or doing the recovery) and the
+ * journal nodes may potentially be corrupted, so checking is required.
  */
 static int try_read_node(const struct ubifs_info *c, void *buf, int type,
 			 int len, int lnum, int offs)
@@ -476,7 +479,8 @@ static int try_read_node(const struct ubifs_info *c, void *buf, int type,
 	if (node_len != len)
 		return 0;
 
-	if (type == UBIFS_DATA_NODE && !c->always_chk_crc && c->no_chk_data_crc)
+	if (type == UBIFS_DATA_NODE && c->no_chk_data_crc && !c->mounting &&
+	    !c->remounting_rw)
 		return 1;
 
 	crc = crc32(UBIFS_CRC32_INIT, buf + 8, node_len - 8);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index d1efa37..d182354 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1169,9 +1169,8 @@ struct ubifs_debug_info;
  * @empty: %1 if the UBI device is empty
  * @need_recovery: %1 if the file-system needs recovery
  * @replaying: %1 during journal replay
+ * @mounting: %1 while mounting
  * @remounting_rw: %1 while re-mounting from R/O mode to R/W mode
- * @always_chk_crc: always check CRCs (while mounting and remounting to R/W
- *                  mode)
  * @replay_tree: temporary tree used during journal replay
  * @replay_list: temporary list used during journal replay
  * @replay_buds: list of buds to replay
@@ -1405,8 +1404,8 @@ struct ubifs_info {
 	unsigned int empty:1;
 	unsigned int need_recovery:1;
 	unsigned int replaying:1;
+	unsigned int mounting:1;
 	unsigned int remounting_rw:1;
-	unsigned int always_chk_crc:1;
 	struct rb_root replay_tree;
 	struct list_head replay_list;
 	struct list_head replay_buds;
-- 
1.7.3.4
