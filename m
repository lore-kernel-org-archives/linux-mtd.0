Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpGs-0001lU-M4
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:50:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/15] UBI: Fastmap: Write a fastmap also while detaching.
Date: Thu, 21 Jun 2012 23:50:08 +0200
Message-Id: <1340315408-27375-16-git-send-email-richard@nod.at>
In-Reply-To: <1340315408-27375-1-git-send-email-richard@nod.at>
References: <UBI fastmap updates>
 <1340315408-27375-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, shmulik.ladkani@gmail.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To ensure that fastmap knows all EC values we have to do this.
Otherwise fastmap my miss EC updates.
E.g: If the WL sub-system moves data from PEB A to PEB B.
It picks B from the WL pool, moves the data to it an eraes A.
If we detach now (or a power cut happens) the new EC value is lost.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 186bc19..611d0c4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1051,6 +1051,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi_notify_all(ubi, UBI_VOLUME_REMOVED, NULL);
 	dbg_msg("detaching mtd%d from ubi%d", ubi->mtd->index, ubi_num);
 
+	ubi_update_fastmap(ubi);
+
 	/*
 	 * Before freeing anything, we have to stop the background thread to
 	 * prevent it from doing anything on this device while we are freeing.
@@ -1058,10 +1060,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	if (ubi->bgt_thread)
 		kthread_stop(ubi->bgt_thread);
 
-	/* If no fastmap is present on the FLASH write one. */
-	if (!ubi->fm)
-		ubi_update_fastmap(ubi);
-
 	/*
 	 * Get a reference to the device in order to prevent 'dev_release()'
 	 * from freeing the @ubi object.
-- 
1.7.6.5
