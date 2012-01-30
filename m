Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrutz-00051S-Es
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 17:20:24 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: Fix error handling in ubi_scan()
Date: Mon, 30 Jan 2012 18:20:13 +0100
Message-Id: <1327944013-18944-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, stable@kernel.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two bad things can happen in ubi_scan():
1. If kmem_cache_create() fails we jump to out_si and call
   ubi_scan_destroy_si() which calls kmem_cache_destroy().
   But si->scan_leb_slab is NULL.
2. If process_eb() fails we jump to out_vidh, call
   kmem_cache_destroy() and ubi_scan_destroy_si() which calls
   again kmem_cache_destroy().

Signed-off-by: Richard Weinberger <richard@nod.at>
CC: stable@kernel.org
---
 drivers/mtd/ubi/scan.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 0cb17d9..b99318e 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -1174,7 +1174,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
-		goto out_slab;
+		goto out_si;
 
 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vidh)
@@ -1235,8 +1235,6 @@ out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
 out_ech:
 	kfree(ech);
-out_slab:
-	kmem_cache_destroy(si->scan_leb_slab);
 out_si:
 	ubi_scan_destroy_si(si);
 	return ERR_PTR(err);
@@ -1325,7 +1323,9 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 		}
 	}
 
-	kmem_cache_destroy(si->scan_leb_slab);
+	if (si->scan_leb_slab)
+		kmem_cache_destroy(si->scan_leb_slab);
+
 	kfree(si);
 }
 
-- 
1.7.8.3
