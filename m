Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1057DC47092
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 04:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88B361263
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 04:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88B361263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmwywnzP6w2SAT2pmnFD9qaGE5u9rW0Gk5nE4z6jtR8=; b=pKihTnDJWAR5ZO
	QTRJEkSPaorRf27rQwZONWd+KTvU0bONEHmXQjoRyDZLcxzDLFEjP6f+NdvLtfrVhKJXEnYz5Kd0O
	t95RaG+/dYv2T79GZAEuu5qvxiLTM2ZRTCeOa/QqXsUUrxhAe9N9Tei3iHgpipR7hyH/dUxAddFxU
	JKvFUKXc6/8aAnQh6QPWTTE3aNN0vDjS82rgsCtMH/MZKXNY4cWTLHjD47w9JZNn4aseLNRzaS/Tt
	IV63z6tidykFZb1yp5Paw4RRMQxDqAJ2/mffTYdEvbmp5nP+8hYekcFLYjS/mzRoUzH/zMhJBFDIL
	CMISFQjgq1wxYXs1Odiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnw8a-00EaBD-Ch; Tue, 01 Jun 2021 04:36:20 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnw8J-00Ea8a-UF
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 04:36:06 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2CB9A82EA8;
 Tue,  1 Jun 2021 06:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622522162;
 bh=ZkHzhrasxpvFHE7BFBr7rthtfXTKBlsjmhz4PeSVJxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S1qzijovT1eCUwwYBQcY2bPIpMnYODMVipoIIKOpbH7fuKB52nbgOEE6U8hzsx4Gt
 5uXmfpTr8ZsyP4K86VypU/CanB/k5OW4H9mh0F+fMZeujvBGUhlNu+mHRFoW9niu5r
 n4SwEmw7BCvTJIlNjfMdZAyvLeELt4848kOnQymskttzalC6jQ+sE15gr3ZCCjxF/y
 mnaOo89W9tBW4AwrqAn+g3sxsEs6AAKwQSDoeihJheVwAtejNjNB5raECHDYf+B7pl
 raErH8ie8D3XDqk89pA11jGlVp87jED+qUv107tiDf3UIJ5ZQ0NMXx1bDt8QZH1nUB
 Kg/GrFdgvkbTA==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 5C420184CCC;
 Tue,  1 Jun 2021 06:35:48 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 532931A8BB4; Tue,  1 Jun 2021 06:35:48 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@denx.de>,
 kernel test robot <lkp@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] mtd: devices: add support for microchip 48l640 EERAM
Date: Tue,  1 Jun 2021 06:35:46 +0200
Message-Id: <20210601043546.1345704-3-hs@denx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601043546.1345704-1-hs@denx.de>
References: <20210601043546.1345704-1-hs@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_213604_310564_5860114E 
X-CRM114-Status: GOOD (  32.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Microchip 48l640 is a 8KByte EERAM connected via SPI.

Signed-off-by: Heiko Schocher <hs@denx.de>
Tested-by: Fabio Estevam <festevam@denx.de>
Reported-by: kernel test robot <lkp@intel.com>

---
I tried to use drivers/mtd/devices/mchp23k256.c but this
driver does not use any status register and there seems
slight differences in registers (no write enable register
for example), so I decided to make a new driver.

This driver sets the continuous mode bit in Status register,
which states you can write continuous ... but after writting
32 bytes the chip goes into an undefined state, so driver now
writes data in 32 byte chunks.

I also tried to use regmap, but it leads in a lot of more code,
and as this chip has only spi interface it makes no sense, or?

Tested  this driver on board imx8mp-phyboard-pollux-rdk
board, which is already in mainline.

Made some tbot tests, which write at random offset random
length bytes with dd and and random content. Reread the data
after a reboot and compare with the written data. Works fine.

Changes in v3:
drop dev_dbg() in mchp48l640_read() as not really needed to
fix warning which kernel test robot found for
config: arc-allyesconfig (attached as .config)
compiler: arceb-elf-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
add Reported-by: kernel test robot <lkp@intel.com>
add Fabio to cc

Changes in v2:
- fix build warnings
- add Fabios Tested-by

 drivers/mtd/devices/Kconfig      |   6 +
 drivers/mtd/devices/Makefile     |   1 +
 drivers/mtd/devices/mchp48l640.c | 373 +++++++++++++++++++++++++++++++
 3 files changed, 380 insertions(+)
 create mode 100644 drivers/mtd/devices/mchp48l640.c

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 0f4c2d823de84..79cb981ececc9 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -89,6 +89,12 @@ config MTD_MCHP23K256
 	  platform data, or a device tree description if you want to
 	  specify device partitioning
 
+config MTD_MCHP48L640
+	tristate "Microchip 48L640 EERAM"
+	depends on SPI_MASTER
+	help
+	  This enables access to Microchip 48L640 EERAM chips, using SPI.
+
 config MTD_SPEAR_SMI
 	tristate "SPEAR MTD NOR Support through SMI controller"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index 991c8d12c0160..0362cf6bdc67f 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MTD_LART)		+= lart.o
 obj-$(CONFIG_MTD_BLOCK2MTD)	+= block2mtd.o
 obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
 obj-$(CONFIG_MTD_MCHP23K256)	+= mchp23k256.o
+obj-$(CONFIG_MTD_MCHP48L640)	+= mchp48l640.o
 obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
 obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
 obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
new file mode 100644
index 0000000000000..efc2003bd13a4
--- /dev/null
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Microchip 48L640 64 Kb SPI Serial EERAM
+ *
+ * Copyright Heiko Schocher <hs@denx.de>
+ *
+ * datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/20006055B.pdf
+ *
+ * we set continuous mode but reading/writing more bytes than
+ * pagesize seems to bring chip into state where readden values
+ * are wrong ... no idea why.
+ *
+ */
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mutex.h>
+#include <linux/sched.h>
+#include <linux/sizes.h>
+#include <linux/spi/flash.h>
+#include <linux/spi/spi.h>
+#include <linux/of_device.h>
+
+struct mchp48_caps {
+	unsigned int size;
+	unsigned int page_size;
+};
+
+struct mchp48l640_flash {
+	struct spi_device	*spi;
+	struct mutex		lock;
+	struct mtd_info		mtd;
+	const struct mchp48_caps	*caps;
+};
+
+#define MCHP48L640_CMD_WREN		0x06
+#define MCHP48L640_CMD_WRDI		0x04
+#define MCHP48L640_CMD_WRITE		0x02
+#define MCHP48L640_CMD_READ		0x03
+#define MCHP48L640_CMD_WRSR		0x01
+#define MCHP48L640_CMD_RDSR		0x05
+
+#define MCHP48L640_STATUS_RDY		0x01
+#define MCHP48L640_STATUS_WEL		0x02
+#define MCHP48L640_STATUS_BP0		0x04
+#define MCHP48L640_STATUS_BP1		0x08
+#define MCHP48L640_STATUS_SWM		0x10
+#define MCHP48L640_STATUS_PRO		0x20
+#define MCHP48L640_STATUS_ASE		0x40
+
+#define MCHP48L640_TIMEOUT		100
+
+#define MAX_CMD_SIZE			0x10
+
+#define to_mchp48l640_flash(x) container_of(x, struct mchp48l640_flash, mtd)
+
+static int mchp48l640_mkcmd(struct mchp48l640_flash *flash, u8 cmd, loff_t addr, char *buf)
+{
+	buf[0] = cmd;
+	buf[1] = addr >> 8;
+	buf[2] = addr;
+
+	return 3;
+}
+
+static int mchp48l640_read_status(struct mchp48l640_flash *flash, int *status)
+{
+	unsigned char cmd[2];
+	int ret;
+
+	cmd[0] = MCHP48L640_CMD_RDSR;
+	cmd[1] = 0x00;
+	mutex_lock(&flash->lock);
+	ret = spi_write_then_read(flash->spi, &cmd[0], 1, &cmd[1], 1);
+	mutex_unlock(&flash->lock);
+	if (!ret)
+		*status = cmd[1];
+	dev_dbg(&flash->spi->dev, "read status ret: %d status: %x", ret, *status);
+
+	return ret;
+}
+
+static int mchp48l640_waitforbit(struct mchp48l640_flash *flash, int bit, bool set)
+{
+	int ret, status;
+	unsigned long deadline;
+
+	deadline = jiffies + msecs_to_jiffies(MCHP48L640_TIMEOUT);
+	do {
+		ret = mchp48l640_read_status(flash, &status);
+		dev_dbg(&flash->spi->dev, "read status ret: %d bit: %x %sset status: %x",
+			ret, bit, (set ? "" : "not"), status);
+		if (ret)
+			return ret;
+
+		if (set) {
+			if ((status & bit) == bit)
+				return 0;
+		} else {
+			if ((status & bit) == 0)
+				return 0;
+		}
+
+		usleep_range(1000, 2000);
+	} while (!time_after_eq(jiffies, deadline));
+
+	dev_err(&flash->spi->dev, "Timeout waiting for bit %x %s set in status register.",
+		bit, (set ? "" : "not"));
+	return -ETIMEDOUT;
+}
+
+static int mchp48l640_write_prepare(struct mchp48l640_flash *flash, bool enable)
+{
+	unsigned char cmd[2];
+	int ret;
+
+	if (enable)
+		cmd[0] = MCHP48L640_CMD_WREN;
+	else
+		cmd[0] = MCHP48L640_CMD_WRDI;
+
+	mutex_lock(&flash->lock);
+	ret = spi_write(flash->spi, cmd, 1);
+	mutex_unlock(&flash->lock);
+
+	if (ret)
+		dev_err(&flash->spi->dev, "write %sable failed ret: %d",
+			(enable ? "en" : "dis"), ret);
+
+	dev_dbg(&flash->spi->dev, "write %sable success ret: %d",
+		(enable ? "en" : "dis"), ret);
+	if (enable)
+		return mchp48l640_waitforbit(flash, MCHP48L640_STATUS_WEL, true);
+
+	return ret;
+}
+
+static int mchp48l640_set_mode(struct mchp48l640_flash *flash)
+{
+	unsigned char cmd[2];
+	int ret;
+
+	ret = mchp48l640_write_prepare(flash, true);
+	if (ret)
+		return ret;
+
+	cmd[0] = MCHP48L640_CMD_WRSR;
+	cmd[1] = MCHP48L640_STATUS_PRO;
+
+	mutex_lock(&flash->lock);
+	ret = spi_write(flash->spi, cmd, 2);
+	mutex_unlock(&flash->lock);
+	if (ret)
+		dev_err(&flash->spi->dev, "Could not set continuous mode ret: %d", ret);
+
+	return mchp48l640_waitforbit(flash, MCHP48L640_STATUS_PRO, true);
+}
+
+static int mchp48l640_wait_rdy(struct mchp48l640_flash *flash)
+{
+	return mchp48l640_waitforbit(flash, MCHP48L640_STATUS_RDY, false);
+};
+
+static int mchp48l640_write_page(struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, const unsigned char *buf)
+{
+	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
+	unsigned char *cmd;
+	int ret;
+	int cmdlen;
+
+	cmd = kmalloc((3 + len), GFP_KERNEL | GFP_DMA);
+	if (!cmd)
+		return -ENOMEM;
+
+	ret = mchp48l640_wait_rdy(flash);
+	if (ret)
+		goto fail;
+
+	ret = mchp48l640_write_prepare(flash, true);
+	if (ret)
+		goto fail;
+
+	mutex_lock(&flash->lock);
+	cmdlen = mchp48l640_mkcmd(flash, MCHP48L640_CMD_WRITE, to, cmd);
+	memcpy(&cmd[cmdlen], buf, len);
+	ret = spi_write(flash->spi, cmd, cmdlen + len);
+	mutex_unlock(&flash->lock);
+	if (!ret)
+		*retlen += len;
+	else
+		goto fail;
+
+	ret = mchp48l640_waitforbit(flash, MCHP48L640_STATUS_WEL, false);
+	if (ret)
+		goto fail;
+
+	kfree(cmd);
+	return 0;
+fail:
+	kfree(cmd);
+	dev_err(&flash->spi->dev, "write fail with: %d", ret);
+	return ret;
+};
+
+static int mchp48l640_write(struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, const unsigned char *buf)
+{
+	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
+	int ret;
+	size_t wlen = 0;
+	loff_t woff = to;
+	size_t ws;
+	size_t page_sz = flash->caps->page_size;
+
+	/*
+	 * we set PRO bit (page rollover), but writing length > page size
+	 * does result in total chaos, so write in 32 byte chunks.
+	 */
+	while (wlen < len) {
+		ws = min((len - wlen), page_sz);
+		ret = mchp48l640_write_page(mtd, woff, ws, retlen, &buf[wlen]);
+		if (ret)
+			return ret;
+		wlen += ws;
+		woff += ws;
+	}
+
+	return ret;
+}
+
+static int mchp48l640_read_page(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, unsigned char *buf)
+{
+	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
+	unsigned char *cmd;
+	int ret;
+	int cmdlen;
+
+	cmd = kmalloc((3 + len), GFP_KERNEL | GFP_DMA);
+	if (!cmd)
+		return -ENOMEM;
+
+	ret = mchp48l640_wait_rdy(flash);
+	if (ret)
+		goto fail;
+
+	mutex_lock(&flash->lock);
+	cmdlen = mchp48l640_mkcmd(flash, MCHP48L640_CMD_READ, from, cmd);
+	ret = spi_write_then_read(flash->spi, cmd, cmdlen, buf, len);
+	mutex_unlock(&flash->lock);
+	if (!ret)
+		*retlen += len;
+
+	return ret;
+
+fail:
+	kfree(cmd);
+	dev_err(&flash->spi->dev, "read fail with: %d", ret);
+	return ret;
+}
+
+static int mchp48l640_read(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, unsigned char *buf)
+{
+	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
+	int ret;
+	size_t wlen = 0;
+	loff_t woff = from;
+	size_t ws;
+	size_t page_sz = flash->caps->page_size;
+
+	/*
+	 * we set PRO bit (page rollover), but if read length > page size
+	 * does result in total chaos in result ...
+	 */
+	while (wlen < len) {
+		ws = min((len - wlen), page_sz);
+		ret = mchp48l640_read_page(mtd, woff, ws, retlen, &buf[wlen]);
+		if (ret)
+			return ret;
+		wlen += ws;
+		woff += ws;
+	}
+
+	return ret;
+};
+
+static const struct mchp48_caps mchp48l640_caps = {
+	.size = SZ_8K,
+	.page_size = 32,
+};
+
+static int mchp48l640_probe(struct spi_device *spi)
+{
+	struct mchp48l640_flash *flash;
+	struct flash_platform_data *data;
+	int err;
+	int status;
+
+	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
+	if (!flash)
+		return -ENOMEM;
+
+	flash->spi = spi;
+	mutex_init(&flash->lock);
+	spi_set_drvdata(spi, flash);
+
+	err = mchp48l640_read_status(flash, &status);
+	if (err)
+		return err;
+
+	err = mchp48l640_set_mode(flash);
+	if (err)
+		return err;
+
+	data = dev_get_platdata(&spi->dev);
+
+	flash->caps = of_device_get_match_data(&spi->dev);
+	if (!flash->caps)
+		flash->caps = &mchp48l640_caps;
+
+	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
+	flash->mtd.dev.parent	= &spi->dev;
+	flash->mtd.type		= MTD_RAM;
+	flash->mtd.flags	= MTD_CAP_RAM;
+	flash->mtd.writesize	= flash->caps->page_size;
+	flash->mtd.size		= flash->caps->size;
+	flash->mtd._read	= mchp48l640_read;
+	flash->mtd._write	= mchp48l640_write;
+
+	err = mtd_device_register(&flash->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int mchp48l640_remove(struct spi_device *spi)
+{
+	struct mchp48l640_flash *flash = spi_get_drvdata(spi);
+
+	return mtd_device_unregister(&flash->mtd);
+}
+
+static const struct of_device_id mchp48l640_of_table[] = {
+	{
+		.compatible = "microchip,48l640",
+		.data = &mchp48l640_caps,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
+
+static struct spi_driver mchp48l640_driver = {
+	.driver = {
+		.name	= "mchp48l640",
+		.of_match_table = of_match_ptr(mchp48l640_of_table),
+	},
+	.probe		= mchp48l640_probe,
+	.remove		= mchp48l640_remove,
+};
+
+module_spi_driver(mchp48l640_driver);
+
+MODULE_DESCRIPTION("MTD SPI driver for Microchip 48l640 EERAM chips");
+MODULE_AUTHOR("Heiko Schocher <hs@denx.de>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:mchp48l640");
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
