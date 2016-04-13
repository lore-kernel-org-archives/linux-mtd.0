Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqJb1-0002EW-Iv
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 12:08:37 +0000
Received: by mail-lf0-x229.google.com with SMTP id e190so66608091lfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 05:08:14 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 0/9] mtd: nand: set ECC algorithm explicitly (part 2)
Date: Wed, 13 Apr 2016 14:06:53 +0200
Message-Id: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This follow process of using enum nand_ecc_algo in order to clean
nand_ecc_modes_t.

All patches were compile-tested.

This work is based on the nand/next branch.

Rafał Miłecki (9):
  mtd: nand: omap2: set ECC algorithm explicitly
  mtd: nand: s3c2410: set ECC algorithm explicitly
  mtd: nand: sh_flctl: set ECC algorithm explicitly
  mtd: nand: au1550nd: set ECC algorithm explicitly
  mtd: nand: mpc5121_nfc: set ECC algorithm explicitly
  mtd: nand: cmx270: set ECC algorithm explicitly
  mtd: nand: fsl_upm: set ECC algorithm explicitly
  mtd: nand: fsl_ifc: set ECC algorithm explicitly
  mtd: nand: fsl_elbc: set ECC algorithm explicitly

 drivers/mtd/nand/au1550nd.c      | 1 +
 drivers/mtd/nand/cmx270_nand.c   | 1 +
 drivers/mtd/nand/fsl_elbc_nand.c | 1 +
 drivers/mtd/nand/fsl_ifc_nand.c  | 1 +
 drivers/mtd/nand/fsl_upm.c       | 1 +
 drivers/mtd/nand/mpc5121_nfc.c   | 1 +
 drivers/mtd/nand/omap2.c         | 1 +
 drivers/mtd/nand/s3c2410.c       | 1 +
 drivers/mtd/nand/sh_flctl.c      | 1 +
 9 files changed, 9 insertions(+)

-- 
1.8.4.5
