Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb0-0001gD-To
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:05 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/23] UBI: Fastmap: Serialize ubi_wl_get_peb()
Date: Fri,  1 Jun 2012 17:16:27 +0200
Message-Id: <1338563804-85990-7-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c |    1 +
 drivers/mtd/ubi/ubi.h   |    2 ++
 drivers/mtd/ubi/wl.c    |    4 ++++
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7cc2a37..4a8688a 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -902,6 +902,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	mutex_init(&ubi->buf_mutex);
 	mutex_init(&ubi->ckvol_mutex);
 	mutex_init(&ubi->device_mutex);
+	mutex_init(&ubi->fm_pool_mutex);
 	mutex_init(&ubi->fm_mutex);
 	spin_lock_init(&ubi->volumes_lock);
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 7fe1469..c19131f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -383,6 +383,7 @@ struct ubi_wl_entry;
  * @old_fm: in-memory data structure old fastmap.
  *	    (only valid while writing a new one)
  * @fm_pool: in-memory data structure of the fastmap pool
+ * @fm_pool_mutex: serializes ubi_wl_get_peb()
  * @fm_mutex: serializes ubi_update_fastmap()
  * @attached_by_scanning: this UBI device was attached by the old scanning
  *			  methold. All fastmap volumes have to be deleted.
@@ -483,6 +484,7 @@ struct ubi_device {
 	struct ubi_fastmap_layout *old_fm;
 	struct ubi_fm_pool fm_pool;
 	struct mutex fm_mutex;
+	struct mutex fm_pool_mutex;
 	int attached_by_scanning;
 
 	/* Wear-leveling sub-system's stuff */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7d34495..5bd7d99 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -520,6 +520,8 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 	struct ubi_fm_pool *pool = &ubi->fm_pool;
 	int ret;
 
+	mutex_lock(&ubi->fm_pool_mutex);
+
 	/* pool contains no free blocks, create a new one
 	 * and write a fastmap */
 	if (pool->used == pool->size || !pool->size) {
@@ -534,10 +536,12 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 		ret = ubi_update_fastmap(ubi);
 		if (ret) {
 			ubi_ro_mode(ubi);
+			mutex_unlock(&ubi->fm_pool_mutex);
 
 			return ret > 0 ? -EINVAL : ret;
 		}
 	}
+	mutex_unlock(&ubi->fm_pool_mutex);
 
 	/* we got not a single free PEB */
 	if (!pool->size)
-- 
1.7.6.5
