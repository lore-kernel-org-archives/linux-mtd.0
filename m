Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCjSs-0007BS-Vu
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 08:12:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/7] ubi: Check whether the Fastmap anchor matches the super
 block
Date: Tue, 14 Jun 2016 10:12:16 +0200
Message-Id: <1465891938-4063-5-git-send-email-richard@nod.at>
In-Reply-To: <1465891938-4063-1-git-send-email-richard@nod.at>
References: <1465891938-4063-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This helps to detect cases where an user copies an UBI image to
another target with different bad blocks.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 12bdb09..b66cb3e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -975,6 +975,13 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			goto free_hdr;
 		}
 
+		if (i == 0 && pnum != fm_anchor) {
+			ubi_err(ubi, "Fastmap anchor PEB mismatch: PEB: %i vs. %i",
+				pnum, fm_anchor);
+			ret = UBI_BAD_FASTMAP;
+			goto free_hdr;
+		}
+
 		ret = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
 		if (ret && ret != UBI_IO_BITFLIPS) {
 			ubi_err(ubi, "unable to read fastmap block# %i EC (PEB: %i)",
-- 
2.7.3
