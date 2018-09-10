From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-mtd@lists.infradead.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: add support for sst26wf016, sst26wf032
Date: Mon, 10 Sep 2018 14:46:28 +0300
Message-Id: <20180910114628.19156-3-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds support for the SST sst26wf016 and sst26wf032
flash IC.

NOTE:
this patch is basically following mine u-boot commit port:
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a19e97157c3721ef9c4b15c68c1773467a3b4a98

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1->v2:
 * None.

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0e7c85b6002..3e7ade960c0b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1333,6 +1333,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst26wf016",  INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "sst26wf032",  INFO(0xbf2622, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-- 
2.14.4
