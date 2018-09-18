Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Fhb-0003xa-UW
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 13:06:18 +0000
Received: by mail-pf1-x443.google.com with SMTP id s13-v6so1001756pfi.7
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2018 06:05:53 -0700 (PDT)
From: Andrew Worsley <amworsley@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org (open list:UNSORTED BLOCK IMAGES (UBI)),
 linux-kernel@vger.kernel.org (open list)
Cc: Andrew Worsley <amworsley@gmail.com>
Subject: [PATCH] Round UBI average erase count up to next integer
Date: Tue, 18 Sep 2018 23:05:21 +1000
Message-Id: <20180918130521.22880-2-amworsley@gmail.com>
In-Reply-To: <20180918130521.22880-1-amworsley@gmail.com>
References: <20180918130521.22880-1-amworsley@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use a slightly larger than average EC so these PEBs will be
reinitialised with erase counts that make them less likely to
be reused than other (perhaps less worn or error-prone) PEBs

We have more frequent ECC failures on reads of page 0 of some PEBs
which manifest itself commonly during ubiattach. We believe this is due to
"program disturb" and want those PEB to be re-used later than average.

Signed-off-by: Andrew Worsley <amworsley@gmail.com>
---
 drivers/mtd/ubi/attach.c  | 2 +-
 drivers/mtd/ubi/fastmap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 93ceea4f27d5..f97e2ba56fb2 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1414,7 +1414,7 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 	/* Calculate mean erase counter */
 	if (ai->ec_count)
-		ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
+		ai->mean_ec = div_u64(ai->ec_sum+ai->ec_count-1, ai->ec_count);
 
 	err = late_analysis(ubi, ai);
 	if (err)
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 462526a10537..91e513788f38 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -684,7 +684,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			be32_to_cpu(fmec->ec), 1);
 	}
 
-	ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
+	ai->mean_ec = div_u64(ai->ec_sum+ai->ec_count-1, ai->ec_count);
 	ai->bad_peb_count = be32_to_cpu(fmhdr->bad_peb_count);
 
 	/* Iterate over all volumes and read their EBA table */
-- 
2.11.0
