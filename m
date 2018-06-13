Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFi-0004ua-Nu
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/14] ubi: fastmap: Change a WARN_ON() to ubi_err()
Date: Wed, 13 Jun 2018 23:23:40 +0200
Message-Id: <20180613212344.11608-11-richard@nod.at>
In-Reply-To: <20180613212344.11608-1-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This WARN_ON() was used while development of fastmap, now
it can be a regular ubi_err().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index dabeb01af24a..d5506152c9f7 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -949,14 +949,16 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	ubi_assert(list_empty(&free));
 
 	/*
-	 * If fastmap is leaking PEBs (must not happen), raise a
-	 * fat warning and fall back to scanning mode.
-	 * We do this here because in ubi_wl_init() it's too late
-	 * and we cannot fall back to scanning.
+	 * The orginal purpose of this check was detecting fastmap bugs were
+	 * it missed blocks. Now it helps to detect mis-flashed UBIs.
+	 * E.g. when a fastmap enabled UBI is copied to another target with
+	 * different bad blocks.
 	 */
-	if (WARN_ON(count_fastmap_pebs(ai) != ubi->peb_count -
-		    ai->bad_peb_count - fm->used_blocks))
+	if (count_fastmap_pebs(ai) != ubi->peb_count - ai->bad_peb_count -
+		fm->used_blocks) {
+		ubi_err(ubi, "number of PEBs referenced by fastmap does not match MTD!");
 		goto fail_bad;
+	}
 
 	return 0;
 
-- 
2.13.6
