Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKPdb-0002Vd-FT
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 10:30:40 +0000
Received: by mail-we0-f177.google.com with SMTP id w62so8916114wes.8
 for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2014 03:30:11 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: bcm53xxspiflash: new driver for SPI flahes on Broadcom
 ARM SoCs
Date: Thu, 21 Aug 2014 12:30:00 +0200
Message-Id: <1408617000-2678-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Broadcom ARM SoCs often include SPI controller, it's used to attach
flash chip. It's registered as "bcm53xxspiflash" SPI device.
This patch adds SPI driver that handles such flashes. It uses spi-nor
framework to share some code and devices database.

Support for wait_till_ready is not implemented yet, so it's disabled
(depends on BROKEN) right now. We'll be able to enable it once we clean
the wait_till_ready.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
This driver was succesfully tested with two ARM routers, one with
"w25q128" and the other one with "mx25l25635f" chips. Support for the
"mx25l25635f" is currently not included, as it needs some cleaning
before I can push it.

This driver doesn't work for flash found in Netgear R6250. It replies
with 0xFF all the time, so it may be some bug in controller driver.
---
 drivers/mtd/spi-nor/Kconfig           |   6 +
 drivers/mtd/spi-nor/Makefile          |   1 +
 drivers/mtd/spi-nor/bcm53xxspiflash.c | 241 ++++++++++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/bcm53xxspiflash.c

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index abab223..f99f717 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -28,4 +28,10 @@ config SPI_FSL_QUADSPI
 	  This enables support for the Quad SPI controller in master mode.
 	  We only connect the NOR to this controller now.
 
+config MTD_SPI_BCM53XXSPIFLASH
+	tristate "SPI-NOR flashes connected to the Broadcom ARM SoC"
+	depends on MTD_SPI_NOR && BROKEN
+	help
+	  SPI driver for flashes used on Broadcom ARM SoCs.
+
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6a7ce14..703712a 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
+obj-$(CONFIG_MTD_SPI_BCM53XXSPIFLASH)	+= bcm53xxspiflash.o
diff --git a/drivers/mtd/spi-nor/bcm53xxspiflash.c b/drivers/mtd/spi-nor/bcm53xxspiflash.c
new file mode 100644
index 0000000..81bb9f3
--- /dev/null
+++ b/drivers/mtd/spi-nor/bcm53xxspiflash.c
@@ -0,0 +1,241 @@
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/spi/spi.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/cfi.h>
+
+static const char * const probes[] = { "bcm47xxpart", NULL };
+
+struct bcm53xxsf {
+	struct spi_device *spi;
+	struct mtd_info mtd;
+	struct spi_nor nor;
+};
+
+/**************************************************
+ * spi-nor API
+ **************************************************/
+
+static int bcm53xxspiflash_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
+				   int len)
+{
+	struct bcm53xxsf *b53sf = nor->priv;
+
+	return spi_write_then_read(b53sf->spi, &opcode, 1, buf, len);
+}
+
+static int bcm53xxspiflash_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
+				     int len, int write_enable)
+{
+	struct bcm53xxsf *b53sf = nor->priv;
+	u8 *cmd = kzalloc(len + 1, GFP_KERNEL);
+	int err;
+
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd[0] = opcode;
+	memcpy(&cmd[1], buf, len);
+	err = spi_write(b53sf->spi, cmd, len + 1);
+
+	kfree(cmd);
+
+	return err;
+}
+
+static int bcm53xxspiflash_read(struct spi_nor *nor, loff_t from, size_t len,
+				size_t *retlen, u_char *buf)
+{
+	struct bcm53xxsf *b53sf = nor->priv;
+	struct spi_message m;
+	struct spi_transfer t[2] = { { 0 }, { 0 } };
+	unsigned char cmd[5];
+	int cmd_len = 0;
+	int err;
+
+	spi_message_init(&m);
+
+	cmd[cmd_len++] = SPINOR_OP_READ;
+	if (b53sf->mtd.size > 0x1000000)
+		cmd[cmd_len++] = (from & 0xFF000000) >> 24;
+	cmd[cmd_len++] = (from & 0x00FF0000) >> 16;
+	cmd[cmd_len++] = (from & 0x0000FF00) >> 8;
+	cmd[cmd_len++] = (from & 0x000000FF) >> 0;
+
+	t[0].tx_buf = cmd;
+	t[0].len = cmd_len;
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].rx_buf = buf;
+	t[1].len = len;
+	spi_message_add_tail(&t[1], &m);
+
+	err = spi_sync(b53sf->spi, &m);
+	if (err)
+		return err;
+
+	if (retlen && m.actual_length > cmd_len)
+		*retlen = m.actual_length - cmd_len;
+
+	return 0;
+}
+
+static void bcm53xxspiflash_write(struct spi_nor *nor, loff_t to, size_t len,
+				  size_t *retlen, const u_char *buf)
+{
+	struct bcm53xxsf *b53sf = nor->priv;
+	struct spi_message m;
+	struct spi_transfer t = { 0 };
+	u8 *cmd = kzalloc(len + 5, GFP_KERNEL);
+	int cmd_len = 0;
+	int err;
+
+	if (!cmd)
+		return;
+
+	spi_message_init(&m);
+
+	cmd[cmd_len++] = nor->program_opcode;
+	if (b53sf->mtd.size > 0x1000000)
+		cmd[cmd_len++] = (to & 0xFF000000) >> 24;
+	cmd[cmd_len++] = (to & 0x00FF0000) >> 16;
+	cmd[cmd_len++] = (to & 0x0000FF00) >> 8;
+	cmd[cmd_len++] = (to & 0x000000FF) >> 0;
+	memcpy(&cmd[cmd_len], buf, len);
+
+	t.tx_buf = cmd;
+	t.len = cmd_len + len;
+	spi_message_add_tail(&t, &m);
+
+	err = spi_sync(b53sf->spi, &m);
+	if (err)
+		goto out;
+
+	if (retlen && m.actual_length > cmd_len)
+		*retlen += m.actual_length - cmd_len;
+
+out:
+	kfree(cmd);
+}
+
+static int bcm53xxspiflash_erase(struct spi_nor *nor, loff_t offs)
+{
+	struct bcm53xxsf *b53sf = nor->priv;
+	unsigned char cmd[5];
+	int i;
+
+	i = 0;
+	cmd[i++] = nor->erase_opcode;
+	if (b53sf->mtd.size > 0x1000000)
+		cmd[i++] = (offs & 0xFF000000) >> 24;
+	cmd[i++] = ((offs & 0x00FF0000) >> 16);
+	cmd[i++] = ((offs & 0x0000FF00) >> 8);
+	cmd[i++] = ((offs & 0x000000FF) >> 0);
+
+	return spi_write(b53sf->spi, cmd, i);
+}
+
+static const struct spi_device_id *bcm53xxspiflash_read_id(struct spi_nor *nor)
+{
+	struct bcm53xxsf *b53sf = nor->priv;
+	struct device *dev = &b53sf->spi->dev;
+	const struct spi_device_id *id;
+	unsigned char cmd[4];
+	unsigned char resp[2];
+	char *name = NULL;
+	int err;
+
+	/* SST and Winbond/NexFlash specific command */
+	cmd[0] = 0x90; /* Read Manufacturer / Device ID */
+	cmd[1] = 0;
+	cmd[2] = 0;
+	cmd[3] = 0;
+	err = spi_write_then_read(b53sf->spi, cmd, 4, resp, 2);
+	if (err < 0) {
+		dev_err(dev, "error reading SPI flash id\n");
+		return ERR_PTR(-EBUSY);
+	}
+	switch (resp[0]) {
+	case 0xef: /* Winbond/NexFlash */
+		switch (resp[1]) {
+		case 0x17:
+			name = "w25q128";
+			break;
+		}
+		if (!name) {
+			dev_err(dev, "Unknown Winbond/NexFlash flash: %02X %02X\n",
+				resp[0], resp[1]);
+			return ERR_PTR(-ENOTSUPP);
+		}
+		goto found_name;
+	}
+
+	/* TODO: Try more ID commands */
+
+	return ERR_PTR(-ENODEV);
+
+found_name:
+	id = spi_nor_match_id(name);
+	if (!id) {
+		dev_err(dev, "No matching entry for %s flash\n", name);
+		return ERR_PTR(-ENOENT);
+	}
+
+	return id;
+}
+
+/**************************************************
+ * SPI driver
+ **************************************************/
+
+static int bcm53xxspiflash_probe(struct spi_device *spi)
+{
+	struct bcm53xxsf *b53sf;
+	int err;
+
+	b53sf = devm_kzalloc(&spi->dev, sizeof(*b53sf), GFP_KERNEL);
+	if (!b53sf)
+		return -ENOMEM;
+	spi_set_drvdata(spi, b53sf);
+
+	b53sf->spi = spi;
+
+	b53sf->mtd.priv = &b53sf->nor;
+
+	b53sf->nor.mtd = &b53sf->mtd;
+	b53sf->nor.dev = &spi->dev;
+	b53sf->nor.read_reg = bcm53xxspiflash_read_reg;
+	b53sf->nor.write_reg = bcm53xxspiflash_write_reg;
+	b53sf->nor.read = bcm53xxspiflash_read;
+	b53sf->nor.write = bcm53xxspiflash_write;
+	b53sf->nor.erase = bcm53xxspiflash_erase;
+	b53sf->nor.read_id = bcm53xxspiflash_read_id;
+	b53sf->nor.priv = b53sf;
+
+	err = spi_nor_scan(&b53sf->nor, NULL, SPI_NOR_NORMAL);
+	if (err)
+		return err;
+
+	err = mtd_device_parse_register(&b53sf->mtd, probes, NULL, NULL, 0);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int bcm53xxspiflash_remove(struct spi_device *spi)
+{
+	return 0;
+}
+
+static struct spi_driver bcm53xxspiflash_driver = {
+	.driver = {
+		.name	= "bcm53xxspiflash",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= bcm53xxspiflash_probe,
+	.remove		= bcm53xxspiflash_remove,
+};
+
+module_spi_driver(bcm53xxspiflash_driver);
-- 
1.8.4.5
