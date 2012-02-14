Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxPOu-0002CN-T6
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 20:55:03 +0000
From: Richard Weinberger <rw@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 5/7] MTD: UBI: Make process_eb() checkpoint aware
Date: Tue, 14 Feb 2012 21:06:44 +0100
Message-Id: <1329250006-22944-6-git-send-email-rw@linutronix.de>
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Cc: tglx@linutronix.de, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Richard Weinberger <rw@linutronix.de>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If CONFIG_MTD_UBI_CHECKPOINT is not set, process_eb has to
remove all checkpointing volumes.

Signed-off-by: Richard Weinberger <rw@linutronix.de>
---
 drivers/mtd/ubi/scan.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 0cb17d9..1d01fdc 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -1011,7 +1011,15 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	}
 
 	vol_id = be32_to_cpu(vidh->vol_id);
-	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
+#ifdef CONFIG_MTD_UBI_CHECKPOINT
+	if (vol_id > UBI_MAX_VOLUMES &&
+		vol_id != UBI_LAYOUT_VOLUME_ID &&
+		vol_id != UBI_CP_SB_VOLUME_ID &&
+		vol_id != UBI_CP_DATA_VOLUME_ID)
+#else
+	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID)
+#endif
+	{
 		int lnum = be32_to_cpu(vidh->lnum);
 
 		/* Unsupported internal volume */
-- 
1.7.7
