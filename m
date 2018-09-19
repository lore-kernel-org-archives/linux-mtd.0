Received: from mail-eopbgr30055.outbound.protection.outlook.com ([40.107.3.55]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2UTM-00081W-P5
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 04:52:55 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 boris.brezillon@bootlin.com, computersforpeace@gmail.com,
 frieder.schrempf@exceet.de, linux-kernel@vger.kernel.org,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [RESEND PATCH 0/2] mtd: spi-nor: add entry for mt35xu512aba flash
Date: Wed, 19 Sep 2018 10:20:06 +0530
Message-Id: <1537332608-19561-1-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add MFR_ID information, 0x002C, related to the Micron flash.
Currently, MFR_ID 0x0020 is being specified as Micron flash ID but
these are actually CFI ID of STMicro flashes.

Rename SNOR_MFR_MICRON to SNOR_MFR_ST and add entry for
SNOR_MFR_MICRON having CFI ID value of Micron flash.
Add entry of mt35xu512aba flash in spi_nor_ids table.

Yogesh Gaur (2):
  mtd: spi-nor: add macros related to MICRON flash
  mtd: spi-nor: add entry for mt35xu512aba flash

 drivers/mtd/spi-nor/spi-nor.c | 12 +++++++++---
 include/linux/mtd/cfi.h       |  1 +
 include/linux/mtd/spi-nor.h   |  3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

-- 
1.9.1
