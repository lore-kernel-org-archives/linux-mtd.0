Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSMd-0006Ve-CX
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:28:36 +0000
From: Mark Brown <broonie@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Date: Wed, 29 Oct 2014 12:27:32 +0000
Message-Id: <1414585652-31543-1-git-send-email-broonie@kernel.org>
Subject: [PATCH] mtd: dataflash: Remove use of tx_dma
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are trying to remove the legacy tx_dma and rx_dma fields from the
spi_transfer structure. Currently dataflash uses tx_dma but only to make
sure that it's set to 0 so we can remove this use by replacing with a
zero initialisation of the entire spi_transfer struct.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mtd/devices/mtd_dataflash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index dd22ce2cc9ad..0099aba72a8b 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -149,7 +149,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct dataflash	*priv = mtd->priv;
 	struct spi_device	*spi = priv->spi;
-	struct spi_transfer	x = { .tx_dma = 0, };
+	struct spi_transfer	x = { };
 	struct spi_message	msg;
 	unsigned		blocksize = priv->page_size << 3;
 	uint8_t			*command;
@@ -235,7 +235,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			       size_t *retlen, u_char *buf)
 {
 	struct dataflash	*priv = mtd->priv;
-	struct spi_transfer	x[2] = { { .tx_dma = 0, }, };
+	struct spi_transfer	x[2] = { };
 	struct spi_message	msg;
 	unsigned int		addr;
 	uint8_t			*command;
@@ -301,7 +301,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 {
 	struct dataflash	*priv = mtd->priv;
 	struct spi_device	*spi = priv->spi;
-	struct spi_transfer	x[2] = { { .tx_dma = 0, }, };
+	struct spi_transfer	x[2] = { };
 	struct spi_message	msg;
 	unsigned int		pageaddr, addr, offset, writelen;
 	size_t			remaining = len;
-- 
2.1.1
