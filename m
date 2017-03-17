Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGd-0004KL-Pn
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:46:07 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 4/6] mtd: m25p80: implement read_xfer and write_xfer
Date: Fri, 17 Mar 2017 18:13:54 +0530
Message-ID: <1489754636-21461-5-git-send-email-rahul.bedarkar@imgtec.com>
In-Reply-To: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
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

Implement read_xfer and write_xfer interfaces provided by SPI-NOR.
These will be used in upcoming OTP support in SPI-NOR to read/write
OTP area.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/devices/m25p80.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8368249..a3ba907 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -186,6 +186,83 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	return ret;
 }
 
+static ssize_t m25p80_read_xfer(struct spi_nor *nor,
+				struct spi_nor_xfer_cfg *cfg,
+				u8 *buf, size_t len)
+{
+	struct m25p *flash = nor->priv;
+	struct spi_device *spi = flash->spi;
+	struct spi_transfer t[2] = {};
+	struct spi_message m;
+	unsigned int dummy = cfg->dummy_cycles;
+	ssize_t ret;
+
+	/* convert the dummy cycles to the number of bytes */
+	dummy /= 8;
+
+	spi_message_init(&m);
+
+	flash->command[0] = cfg->cmd;
+	m25p_addr2cmd(cfg->addr, cfg->addr_width, flash->command);
+
+	t[0].tx_buf = flash->command;
+	t[0].len = m25p_cmdsz(cfg->addr_width) + dummy;
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].rx_buf = buf;
+	t[1].rx_nbits = m25p80_rx_nbits(cfg->mode);
+	t[1].len = len;
+	spi_message_add_tail(&t[1], &m);
+
+	ret = spi_sync(spi, &m);
+	if (ret)
+		return ret;
+
+	ret = m.actual_length - m25p_cmdsz(cfg->addr_width) - dummy;
+	if (ret < 0)
+		return -EIO;
+	return ret;
+}
+
+static ssize_t m25p80_write_xfer(struct spi_nor *nor,
+				 struct spi_nor_xfer_cfg *cfg,
+				 u8 *buf, size_t len)
+{
+	struct m25p *flash = nor->priv;
+	struct spi_device *spi = flash->spi;
+	struct spi_transfer t[2] = {};
+	struct spi_message m;
+	unsigned int dummy = cfg->dummy_cycles;
+	ssize_t ret;
+
+	/* convert the dummy cycles to the number of bytes */
+	dummy /= 8;
+
+	spi_message_init(&m);
+
+	flash->command[0] = cfg->cmd;
+	m25p_addr2cmd(cfg->addr, cfg->addr_width, flash->command);
+
+	t[0].tx_buf = flash->command;
+	t[0].len = m25p_cmdsz(cfg->addr_width) + dummy;
+	spi_message_add_tail(&t[0], &m);
+
+	if (len) {
+		t[1].tx_buf = buf;
+		t[1].len = len;
+		spi_message_add_tail(&t[1], &m);
+	}
+
+	ret = spi_sync(spi, &m);
+	if (ret)
+		return ret;
+
+	ret = m.actual_length - m25p_cmdsz(cfg->addr_width) - dummy;
+	if (ret < 0)
+		return -EIO;
+	return ret;
+}
+
 /*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
@@ -213,6 +290,8 @@ static int m25p_probe(struct spi_device *spi)
 	nor->write = m25p80_write;
 	nor->write_reg = m25p80_write_reg;
 	nor->read_reg = m25p80_read_reg;
+	nor->read_xfer = m25p80_read_xfer;
+	nor->write_xfer = m25p80_write_xfer;
 
 	nor->dev = &spi->dev;
 	spi_nor_set_flash_node(nor, spi->dev.of_node);
-- 
2.6.2
