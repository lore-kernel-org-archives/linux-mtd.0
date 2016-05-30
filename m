Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7LwV-00048s-KR
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 03/13] ubi: auto re-size after UBI thread is ready
Date: Mon, 30 May 2016 14:04:24 +0200
Message-Id: <1464609874-15488-4-git-send-email-richard@nod.at>
In-Reply-To: <1464609874-15488-1-git-send-email-richard@nod.at>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As all work is now done within the UBI thread
re-size cannot performed before UBI thread is ready.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ee3c833..1448f05 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -989,12 +989,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		goto out_free;
 	}
 
-	if (ubi->autoresize_vol_id != -1) {
-		err = autoresize(ubi, ubi->autoresize_vol_id);
-		if (err)
-			goto out_detach;
-	}
-
 	err = uif_init(ubi, &ref);
 	if (err)
 		goto out_detach;
@@ -1039,10 +1033,18 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 
+	if (ubi->autoresize_vol_id != -1) {
+		err = autoresize(ubi, ubi->autoresize_vol_id);
+		if (err)
+			goto out_kthread;
+	}
+
 	ubi_devices[ubi_num] = ubi;
 	ubi_notify_all(ubi, UBI_VOLUME_ADDED, NULL);
 	return ubi_num;
 
+out_kthread:
+	kthread_stop(ubi->bgt_thread);
 out_debugfs:
 	ubi_debugfs_exit_dev(ubi);
 out_uif:
-- 
2.7.3
