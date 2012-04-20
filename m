From: Hong Xu <hong.xu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
Subject: [PATCH v4 2/2] MTD: AT91: Update atmel_nand_data to support PMECC
Date: Fri, 20 Apr 2012 15:26:28 +0800
Message-Id: <1334906788-18704-2-git-send-email-hong.xu@atmel.com>
In-Reply-To: <1334906788-18704-1-git-send-email-hong.xu@atmel.com>
References: <1334906788-18704-1-git-send-email-hong.xu@atmel.com>
Cc: plagnioj@jcrosoft.com, Hong Xu <hong.xu@atmel.com>, nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added two items,
* correction_cap: PMECC correction capability
* sector_size:    Sector size for PMECC

Signed-off-by: Hong Xu <hong.xu@atmel.com>
---
 include/linux/platform_data/atmel.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
index b0f2c56..4d9bfd5 100644
--- a/include/linux/platform_data/atmel.h
+++ b/include/linux/platform_data/atmel.h
@@ -20,6 +20,8 @@ struct atmel_nand_data {
 	u8		bus_width_16;		/* buswidth is 16 bit */
 	u8		ecc_mode;		/* ecc mode */
 	u8		on_flash_bbt;		/* bbt on flash */
+	u8		correction_cap;		/* PMECC capability */
+	u16		sector_size;		/* Sector size for PMECC */
 	struct mtd_partition *parts;
 	unsigned int	num_parts;
 };
-- 
1.7.10
