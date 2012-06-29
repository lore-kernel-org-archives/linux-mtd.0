Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkcuA-0006Qx-FH
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/11] UBI: Fastmap: Move fastmap specific code into
 ubi_scan_fastmap()
Date: Fri, 29 Jun 2012 17:14:22 +0200
Message-Id: <1340982869-77042-5-git-send-email-richard@nod.at>
In-Reply-To: <1340982869-77042-1-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
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
 drivers/mtd/ubi/attach.c  |    9 ---------
 drivers/mtd/ubi/fastmap.c |    4 ++++
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index e88521b..1b62d54 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1384,15 +1384,6 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (err)
 		goto out_ai;
 
-	/* TODO: Hmm why this code is not hidden in 'ubi_scan_fastmap()' ? */
-	if (ubi->fm) {
-		ubi->fm_pool.max_size = ubi->fm->max_pool_size;
-		ubi->fm_wl_pool.max_size = ubi->fm->max_wl_pool_size;
-
-		ubi_msg("fastmap pool size: %d", ubi->fm_pool.max_size);
-		ubi_msg("fastmap WL pool size: %d", ubi->fm_wl_pool.max_size);
-	}
-
 	err = ubi_wl_init(ubi, ai);
 	if (err)
 		goto out_vtbl;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 2c7c350..9b4fd34 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1096,6 +1096,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	}
 
 	ubi->fm = fm;
+	ubi->fm_pool.max_size = ubi->fm->max_pool_size;
+	ubi->fm_wl_pool.max_size = ubi->fm->max_wl_pool_size;
+	ubi_msg("fastmap pool size: %d", ubi->fm_pool.max_size);
+	ubi_msg("fastmap WL pool size: %d", ubi->fm_wl_pool.max_size);
 
 free_hdr:
 	ubi_free_vid_hdr(ubi, vh);
-- 
1.7.6.5
