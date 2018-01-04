Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX1Vi-00064b-LB
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 09:08:28 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] spi-nor: intel-spi: Remove unused preopcodes field
Date: Thu,  4 Jan 2018 12:07:44 +0300
Message-Id: <20180104090744.67654-3-mika.westerberg@linux.intel.com>
In-Reply-To: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This field is not used in the driver anymore so remove it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/intel-spi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index bba762aa0c8d..8d54da46da30 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -138,7 +138,6 @@
  * @erase_64k: 64k erase supported
  * @opcodes: Opcodes which are supported. This are programmed by BIOS
  *           before it locks down the controller.
- * @preopcodes: Preopcodes which are supported.
  */
 struct intel_spi {
 	struct device *dev;
@@ -155,7 +154,6 @@ struct intel_spi {
 	bool swseq_erase;
 	bool erase_64k;
 	u8 opcodes[8];
-	u8 preopcodes[2];
 };
 
 static bool writeable;
@@ -400,10 +398,6 @@ static int intel_spi_init(struct intel_spi *ispi)
 				ispi->opcodes[i] = opmenu0 >> i * 8;
 				ispi->opcodes[i + 4] = opmenu1 >> i * 8;
 			}
-
-			val = readl(ispi->sregs + PREOP_OPTYPE);
-			ispi->preopcodes[0] = val;
-			ispi->preopcodes[1] = val >> 8;
 		}
 	}
 
-- 
2.15.1
