Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGLc-0001Io-IB
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 08:32:53 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2] mtd: gpmi: fix the ecc regression
Date: Thu, 24 Oct 2013 16:14:44 +0800
Message-ID: <1382602484-12023-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, tharvey@gateworks.com, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The legacy ecc layout is to use all the OOB area by computing the ecc strength
and ecc step size ourselves.

The patch "2febcdf mtd: gpmi: set the BCHs geometry with the ecc info"
makes the gpmi to use the ECC info(ecc strength and ecc step size)
provided by the MTD code, and creates a different NAND ecc layout
for the BCH , and use the new ecc layout, this brings a regression to us:
   We can not mount the ubifs which was created by the old NAND ecc layout.

This patch fixes this issue by use the legacy ecc layout firstly, if it fails
we try to use the new ecc layout.

Signed-off-by: Huang Shijie <b32955@freescale.com>
Cc: stable@vger.kernel.org
---
v1 --> v2:
	[0] remove the DT binding.
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 6807d7c..f9ee7e5 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -352,7 +352,7 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
-	return set_geometry_by_ecc_info(this) ? 0 : legacy_set_geometry(this);
+	return legacy_set_geometry(this) ? set_geometry_by_ecc_info(this) : 0;
 }
 
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
-- 
1.7.2.rc3
