Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb0-0001gB-P1
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:01 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/23] UBI: Fastmap: Write a fastmap also at detaching
Date: Fri,  1 Jun 2012 17:16:25 +0200
Message-Id: <1338563804-85990-5-git-send-email-richard@nod.at>
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

If we attach a UBI device and make no modifications we
end up with a device without a fastmap.
So UBI will fall back to scanning mode next time.
To avoid an unnecessary full scan we write a fastmap also
while detaching.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 51113cb..7cc2a37 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1044,6 +1044,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi_assert(ubi_num == ubi->ubi_num);
 	ubi_notify_all(ubi, UBI_VOLUME_REMOVED, NULL);
 	dbg_msg("detaching mtd%d from ubi%d", ubi->mtd->index, ubi_num);
+	ubi_update_fastmap(ubi);
 
 	/*
 	 * Before freeing anything, we have to stop the background thread to
@@ -1060,6 +1061,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 
 	ubi_debugfs_exit_dev(ubi);
 	uif_close(ubi);
+
 	ubi_wl_close(ubi);
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
-- 
1.7.6.5
