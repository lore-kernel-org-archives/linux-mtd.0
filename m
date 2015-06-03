Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0GL0-0003jM-Uc
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 21:36:41 +0000
Date: 3 Jun 2015 21:26:40 -0000
Message-Id: <d96c00e9007a13819719af96094b258d77df4bde.1433364398.git.hramrach@gmail.com>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 02/11] mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
  Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>,
  Kukjin Kim <kgene@kernel.org>,
  Krzysztof Kozlowski <k.kozlowski@samsung.com>,
  Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>,
  "Rafał Miłecki" <zajec5@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Knut Wohlrab <knut.wohlrab@de.bosch.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
  linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This 1.8V SPI NOR flash is found on ARM Chromebook XE303C and reads
something like 25LQ32VIG in the middle.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..7bcc584 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -552,6 +552,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
 
-- 
2.1.4
