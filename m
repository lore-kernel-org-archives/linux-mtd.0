Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb0-0001g9-Rs
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:05 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/23] UBI: Fastmap: Introduce fm_mutex
Date: Fri,  1 Jun 2012 17:16:23 +0200
Message-Id: <1338563804-85990-3-git-send-email-richard@nod.at>
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

ubi_update_fastmap() has to be serialized.
Currently it can happen that ubi_update_fastmap() gets called in parallel
if the fastmap pool runs out of free PEBs and a volume is changed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c   |    1 +
 drivers/mtd/ubi/fastmap.c |   43 +++++++++++++++++++++++++------------------
 drivers/mtd/ubi/ubi.h     |    2 ++
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index bd3fa14..51113cb 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -902,6 +902,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	mutex_init(&ubi->buf_mutex);
 	mutex_init(&ubi->ckvol_mutex);
 	mutex_init(&ubi->device_mutex);
+	mutex_init(&ubi->fm_mutex);
 	spin_lock_init(&ubi->volumes_lock);
 
 	ubi_msg("attaching mtd%d to ubi%d", mtd->index, ubi_num);
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 56479df..75e067b 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1152,6 +1152,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		}
 	}
 
+	mutex_lock(&ubi->fm_mutex);
+
 	ubi->old_fm = ubi->fm;
 	ubi->fm = NULL;
 
@@ -1167,9 +1169,9 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 			if (!ec_hdr) {
-				kfree(new_fm);
+				ret = -ENOMEM;
 
-				return -ENOMEM;
+				goto err;
 			}
 
 			/* we have to erase the block by hand */
@@ -1178,40 +1180,38 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				ec_hdr, 0);
 			if (ret) {
 				ubi_err("Unable to read EC header");
-				kfree(new_fm);
 				kfree(ec_hdr);
 
-				return ret;
+				goto err;;
 			}
 
 			ret = ubi_io_sync_erase(ubi, ubi->old_fm->e[0]->pnum,
 				0);
 			if (ret < 0) {
 				ubi_err("Unable to erase old SB");
-				kfree(new_fm);
 				kfree(ec_hdr);
 
-				return ret;
+				goto err;
 			}
 
 			ec = be64_to_cpu(ec_hdr->ec);
 			ec += ret;
 			if (ec > UBI_MAX_ERASECOUNTER) {
 				ubi_err("Erase counter overflow!");
-				kfree(new_fm);
 				kfree(ec_hdr);
+				ret = -EINVAL;
 
-				return -EINVAL;
+				goto err;
 			}
 
+			ec_hdr->ec = cpu_to_be64(ec);
 			ret = ubi_io_write_ec_hdr(ubi, ubi->old_fm->e[0]->pnum,
 				ec_hdr);
 			kfree(ec_hdr);
 			if (ret) {
 				ubi_err("Unable to write new EC header");
-				kfree(new_fm);
 
-				return ret;
+				goto err;
 			}
 
 			new_fm->e[0]->pnum = ubi->old_fm->e[0]->pnum;
@@ -1228,18 +1228,18 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	} else {
 		if (new_fm->e[0]->pnum < 0) {
 			ubi_err("Could not find an early PEB");
-			kfree(new_fm);
+			ret = -ENOSPC;
 
-			return -ENOSPC;
+			goto err;
 		}
 		new_fm->e[0]->ec = get_ec(ubi, new_fm->e[0]->pnum);
 	}
 
 	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
 		ubi_err("Fastmap too large");
-		kfree(new_fm);
+		ret = -ENOSPC;
 
-		return -ENOSPC;
+		goto err;
 	}
 
 	/* give the wl subsystem a chance to produce some free blocks */
@@ -1257,10 +1257,9 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				ubi_wl_put_fm_peb(ubi, new_fm->e[i]->pnum, 0);
 				kfree(new_fm->e[i]);
 			}
+			ret = -ENOSPC;
 
-			kfree(new_fm);
-
-			return -ENOSPC;
+			goto err;
 		}
 
 		new_fm->e[i]->ec = get_ec(ubi, new_fm->e[i]->pnum);
@@ -1274,5 +1273,13 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		ubi->old_fm = NULL;
 	}
 
-	return ubi_write_fastmap(ubi, new_fm);
+	ret = ubi_write_fastmap(ubi, new_fm);
+out_unlock:
+	mutex_unlock(&ubi->fm_mutex);
+
+	return ret;
+
+err:
+	kfree(new_fm);
+	goto out_unlock;
 }
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index e5fe951..7fe1469 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -383,6 +383,7 @@ struct ubi_wl_entry;
  * @old_fm: in-memory data structure old fastmap.
  *	    (only valid while writing a new one)
  * @fm_pool: in-memory data structure of the fastmap pool
+ * @fm_mutex: serializes ubi_update_fastmap()
  * @attached_by_scanning: this UBI device was attached by the old scanning
  *			  methold. All fastmap volumes have to be deleted.
  *
@@ -481,6 +482,7 @@ struct ubi_device {
 	struct ubi_fastmap_layout *fm;
 	struct ubi_fastmap_layout *old_fm;
 	struct ubi_fm_pool fm_pool;
+	struct mutex fm_mutex;
 	int attached_by_scanning;
 
 	/* Wear-leveling sub-system's stuff */
-- 
1.7.6.5
