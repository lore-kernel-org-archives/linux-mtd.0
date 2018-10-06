Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8odW-0001yo-V1
 for linux-mtd@lists.infradead.org; Sat, 06 Oct 2018 15:37:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id 206-v6so4337538wmb.5
 for <linux-mtd@lists.infradead.org>; Sat, 06 Oct 2018 08:36:48 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH] mtd: spinand: winbond: Add support for W25N01GV
Date: Sat,  6 Oct 2018 17:36:42 +0200
Message-Id: <20181006153642.10376-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

W25N01GV is a single die version of the already supported
W25M02GV with half the capacity. Everything else is the
same so introduce support for W25N01GV.

Datasheet:http://www.winbond.com/resource-files/w25n01gv%20revl%20050918%20unsecured.pdf

Tested on 8devices Jalapeno dev board under OpenWrt running 4.19-rc5.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/mtd/nand/spi/winbond.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -84,6 +84,14 @@ static const struct spinand_info winbond
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
+	SPINAND_INFO("W25N01GV", 0xAA,
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 };
 
 /**
