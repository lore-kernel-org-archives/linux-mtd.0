Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4m-0007UO-TY
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vwb0031822
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:58 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/7] UBI: kill debugging buffer
Date: Tue, 15 Mar 2011 11:00:32 +0200
Message-Id: <1300179636-12183-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
References: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch kills the 'ubi->dbg_peb_buf' debugging buffer and the
associated mutex, because all users of this buffer are now gone.
We are killing this buffer because we are going to switch to
dynamic debugging control, just like in UBIFS, which means that
CONFIG_MTD_UBI_DEBUG_PARANOID will be removed. In this case we'd
end up always allocating 'ubi->dbg_peb_buf', which is rather large
(128KiB or more), and this would be wasteful. Thus, we are just
killing it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |   13 -------------
 drivers/mtd/ubi/ubi.h   |    6 ------
 2 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ec0ad19..3a04719 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -939,13 +939,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	if (!ubi->peb_buf2)
 		goto out_free;
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
-	mutex_init(&ubi->dbg_buf_mutex);
-	ubi->dbg_peb_buf = vmalloc(ubi->peb_size);
-	if (!ubi->dbg_peb_buf)
-		goto out_free;
-#endif
-
 	err = attach_by_scanning(ubi);
 	if (err) {
 		dbg_err("failed to attach by scanning, error %d", err);
@@ -1011,9 +1004,6 @@ out_detach:
 out_free:
 	vfree(ubi->peb_buf1);
 	vfree(ubi->peb_buf2);
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
-	vfree(ubi->dbg_peb_buf);
-#endif
 	if (ref)
 		put_device(&ubi->dev);
 	else
@@ -1084,9 +1074,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	put_mtd_device(ubi->mtd);
 	vfree(ubi->peb_buf1);
 	vfree(ubi->peb_buf2);
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
-	vfree(ubi->dbg_peb_buf);
-#endif
 	ubi_msg("mtd%d is detached from ubi%d", ubi->mtd->index, ubi->ubi_num);
 	put_device(&ubi->dev);
 	return 0;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0b0149c..d6e4ad0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -387,8 +387,6 @@ struct ubi_wl_entry;
  * @peb_buf2: another buffer of PEB size used for different purposes
  * @buf_mutex: protects @peb_buf1 and @peb_buf2
  * @ckvol_mutex: serializes static volume checking when opening
- * @dbg_peb_buf: buffer of PEB size used for debugging
- * @dbg_buf_mutex: protects @dbg_peb_buf
  */
 struct ubi_device {
 	struct cdev cdev;
@@ -470,10 +468,6 @@ struct ubi_device {
 	void *peb_buf2;
 	struct mutex buf_mutex;
 	struct mutex ckvol_mutex;
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
-	void *dbg_peb_buf;
-	struct mutex dbg_buf_mutex;
-#endif
 };
 
 extern struct kmem_cache *ubi_wl_entry_slab;
-- 
1.7.2.3
