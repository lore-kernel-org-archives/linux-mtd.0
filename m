Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcC69-0003RP-LK
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 12:13:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] UBI: Introduce ubi_schedule_fm_work()
Date: Sun, 29 Mar 2015 14:13:14 +0200
Message-Id: <1427631197-23610-2-git-send-email-richard@nod.at>
In-Reply-To: <1427631197-23610-1-git-send-email-richard@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wrap the fastmap work scheduling code into a new function
such that it can be reused.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap-wl.c |  5 +----
 drivers/mtd/ubi/ubi.h        | 12 ++++++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index b2a6653..fc0e2ff 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -237,10 +237,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
 		 * Let's fail here and refill/update it as soon as possible. */
-		if (!ubi->fm_work_scheduled) {
-			ubi->fm_work_scheduled = 1;
-			schedule_work(&ubi->fm_work);
-		}
+		ubi_schedule_fm_work(ubi);
 		return NULL;
 	}
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 11f8fb0..cb3dcd0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -881,8 +881,20 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi);
 int ubi_update_fastmap(struct ubi_device *ubi);
 int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		     int fm_anchor);
+/**
+ * ubi_schedule_fm_work - Schedule UBI fastmap work
+ * @ubi: UBI device description object
+ */
+static inline void ubi_schedule_fm_work(struct ubi_device *ubi)
+{
+	if (!ubi->fm_work_scheduled) {
+		ubi->fm_work_scheduled = 1;
+		schedule_work(&ubi->fm_work);
+	}
+}
 #else
 static inline int ubi_update_fastmap(struct ubi_device *ubi) { return 0; }
+static inline void ubi_schedule_fm_work(struct ubi_device *ubi) { }
 #endif
 
 /* block.c */
-- 
1.8.4.5
