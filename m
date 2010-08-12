Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjNV8-00014E-Hk
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 02:26:39 +0000
Date: Thu, 12 Aug 2010 10:24:10 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 4/5]nand/denali: Add a page check in denali_read_page &
	denali_read_page_raw
Message-ID: <20100812022410.GD25657@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


=46rom 6bcf2a5704eafa810a843c4cedf50d44d5ce9f27 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Wed, 11 Aug 2010 18:19:23 +0800
Subject: [PATCH 4/5] nand/denali: Add a page check in denali_read_page & de=
nali_read_page_raw

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 5f7c8c8..017cde4 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1149,6 +1149,13 @@ static int denali_read_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
 			    INTR_STATUS0__ECC_ERR;
 	bool check_erased_page =3D false;
=20
+	if (page !=3D denali->page) {
+		dev_err(&denali->dev->dev, "IN %s: page %d is not"
+				" equal to denali->page %d, investigate!!",
+				__func__, page, denali->page);
+		BUG();
+	}
+
 	setup_ecc_for_xfer(denali, true, false);
=20
 	denali_enable_dma(denali, true);
@@ -1193,6 +1200,13 @@ static int denali_read_page_raw(struct mtd_info *mtd=
, struct nand_chip *chip,
 	uint32_t irq_status =3D 0;
 	uint32_t irq_mask =3D INTR_STATUS0__DMA_CMD_COMP;
=20
+	if (page !=3D denali->page) {
+		dev_err(&denali->dev->dev, "IN %s: page %d is not"
+				" equal to denali->page %d, investigate!!",
+				__func__, page, denali->page);
+		BUG();
+	}
+
 	setup_ecc_for_xfer(denali, false, true);
 	denali_enable_dma(denali, true);
=20
--=20
1.6.6.1
