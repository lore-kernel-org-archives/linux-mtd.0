Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1falZc-0006Ca-Ni
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 17:28:14 +0000
Received: by mail-pf0-x242.google.com with SMTP id s21-v6so3149786pfm.6
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2018 10:28:01 -0700 (PDT)
Date: Wed, 4 Jul 2018 10:27:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: Use 2-factor allocator calls
Message-ID: <20180704172759.GA33591@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As already done treewide, switch from open-coded multiplication to using
2-factor allocator helpers.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/spi/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17d207a49cb9..fed9211c6f19 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -159,9 +159,9 @@ static int spinand_init_cfg_cache(struct spinand_device *spinand)
 	unsigned int target;
 	int ret;
 
-	spinand->cfg_cache = devm_kzalloc(dev,
-					  sizeof(*spinand->cfg_cache) *
+	spinand->cfg_cache = devm_kcalloc(dev,
 					  nand->memorg.ntargets,
+					  sizeof(*spinand->cfg_cache),
 					  GFP_KERNEL);
 	if (!spinand->cfg_cache)
 		return -ENOMEM;
-- 
2.17.1


-- 
Kees Cook
Pixel Security
