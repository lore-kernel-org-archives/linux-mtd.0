Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTbA-0001je-Pt
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 20/23] UBI: Fastmap: Write fastmap only at detach time if none
 is present
Date: Fri,  1 Jun 2012 17:16:41 +0200
Message-Id: <1338563804-85990-21-git-send-email-richard@nod.at>
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

Write a fastmap only if currently no fastmap is present on the FLASH.
Also write it after the UBI thread has stopped.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 4a8688a..2acfe5b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1045,7 +1045,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi_assert(ubi_num == ubi->ubi_num);
 	ubi_notify_all(ubi, UBI_VOLUME_REMOVED, NULL);
 	dbg_msg("detaching mtd%d from ubi%d", ubi->mtd->index, ubi_num);
-	ubi_update_fastmap(ubi);
 
 	/*
 	 * Before freeing anything, we have to stop the background thread to
@@ -1054,6 +1053,10 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	if (ubi->bgt_thread)
 		kthread_stop(ubi->bgt_thread);
 
+	/* If no fastmap is present on the FLASH write one. */
+	if (!ubi->fm)
+		ubi_update_fastmap(ubi);
+
 	/*
 	 * Get a reference to the device in order to prevent 'dev_release()'
 	 * from freeing the @ubi object.
-- 
1.7.6.5
