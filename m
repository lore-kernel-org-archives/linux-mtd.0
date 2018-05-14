Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIBbC-0003cd-R0
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 11:25:09 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 7/8] ubi: fastmap: Relax size check
Date: Mon, 14 May 2018 13:24:21 +0200
Message-Id: <20180514112422.23988-8-richard@nod.at>
In-Reply-To: <20180514112422.23988-1-richard@nod.at>
References: <20180514112422.23988-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While attaching via fastmap we verify whether the found fastmap
is as large as we have computed.
With preseeded Fastmaps this assumtion can fail since ubinize cannot
know the total size of the MTD and uses the number if used PEBs for
the calculation.
Therefore the found fastmap might be smaller than the kernel expects.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 5ec14fd70c13..262497996954 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1120,7 +1120,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	}
 
 	fm_size = ubi->leb_size * used_blocks;
-	if (fm_size != ubi->fm_size) {
+	if (fm_size > ubi->fm_size) {
 		ubi_err(ubi, "bad fastmap size: %zi, expected: %zi",
 			fm_size, ubi->fm_size);
 		ret = UBI_BAD_FASTMAP;
-- 
2.13.6
