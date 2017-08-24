Received: from regular1.263xmail.com ([211.150.99.141])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dklux-0001jm-2w
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 06:47:05 +0000
From: Andy Yan <andy.yan@rock-chips.com>
To: cyrille.pitchen@wedev4u.fr
Cc: boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 computersforpeace@gmail.com, richard@nod.at, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 1/2] mtd: spi-nor: add a quad_enable callback in struct
 flash_info
Date: Thu, 24 Aug 2017 14:46:19 +0800
Message-Id: <1503557179-11261-1-git-send-email-andy.yan@rock-chips.com>
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

Some manufacturers may use different bit to set QE on
different memories.

The GD25Q256 from GigaDevice is a example, which uses S6(bit 6
of the Status Register-1) to set QE, which is different with
other supported memories from GigaDevice that use S9(bit 1 of
the Status Register-2). This makes it is impossible to select
the quald enable methd by distinguish the MFR，So this patch
introduce a quad_enable function which can be set per memory
in the flash_info list table.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v6:
- split the quad_enable callback to a single patch
- adjust the columns per line of the commit message.

Changes in v5:
- set quad_enable in flash_info list, thanks the guidance by Cyrille.

Changes in v4:
- add SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB

Changes in v3:
- rebase on top of spi-nor tree
- add SPI_NOR_4B_OPCODES flag

Changes in v2:
- drop one line unnecessary modification

 drivers/mtd/spi-nor/spi-nor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cf1d4a1..3b94308 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -89,6 +89,8 @@ struct flash_info {
 #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
+
+	int	(*quad_enable)(struct spi_nor *nor);
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -2388,6 +2390,15 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			params->quad_enable = spansion_quad_enable;
 			break;
 		}
+
+		/*
+		 * Some manufacturer like GigaDevice may use different
+		 * bit to set QE on different memories, so the MFR can't
+		 * indicate the quad_enable method for this case, we need
+		 * set it in flash info list.
+		 */
+		if (info->quad_enable)
+			params->quad_enable = info->quad_enable;
 	}
 
 	/* Override the parameters with data read from SFDP tables. */
-- 
2.7.4
