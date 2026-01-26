Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9512CF65DB
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBWbOnUc4gRUIVUFf7J5cZ5Tsrs6yBl9dWrdTdd+cws=; b=e2rsrws2V680G1
	TIOitUqgOXzcYIK6WYfgnPBBh2CykT3Bpv5OnRHqkMEXsj7CkesL7RGCUuCutNQa7f8nbmZABctVx
	ADKa3JlYr6rxqGoHG4r+AgJrjq23TKIJ8DjPz0tUHgQP3K/XU253Nxpqw4r29UNQ1AKF01A0piDn7
	tHag7oqKqMrioPPj+ct1L1UXSo5xsTWC/nK2z1Ab+ZHHveyM5dvNMfJJp+DkBuJxjXkkoSO600EXa
	iZUVyhzJs6WEmmuwo8cpasQIHpYWaJtQJHjGAxjHIWRrSYMA/cedvK8uSoYfTW18xen84+H80z/Ar
	2MLsjfifHI7xhZpzrFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL4G-0000000CSyN-2nXl;
	Mon, 26 Jan 2026 11:47:40 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL4C-0000000CSSs-2VLA
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 11:47:39 +0000
X-QQ-mid: zesmtpgz1t1769427934t1f0ecabc
X-QQ-Originating-IP: kNj2rKUaFapOMqL8WyA1fFTWQeTO1h3ALWK/ovGas3s=
Received: from [127.0.1.1] ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 19:45:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 793247866761747800
EX-QQ-RecipientCnt: 10
From: Junhao Xie <bigfoot@radxa.com>
Date: Mon, 26 Jan 2026 19:44:52 +0800
Subject: [PATCH v2 2/2] mtd: devices: Add Qualcomm SCM storage driver
MIME-Version: 1.0
Message-Id: <20260126-scm-storage-v2-v2-2-fa045c7e7699@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>, 
 Junhao Xie <bigfoot@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769427928; l=9323;
 i=bigfoot@radxa.com; s=20251219; h=from:subject:message-id;
 bh=xv5hI5i8Spz479SHAGBAWIJ0ldJdMF3MSWUhT5gnxRo=;
 b=/tqQF1n+ioszbYxAx1ecrmkqIOD/3xZXdJksmGdc2ri1tBsc6C4HFkE6+umqWlBHQDtCUioF2
 ux0Wwi7BBsQCqWasB7yyDywsRWVPc3zzulDd/h4/XyhWcrxPPremi6s
X-Developer-Key: i=bigfoot@radxa.com; a=ed25519;
 pk=aP5LX0jneuAa4pTVEww/6IbMlyp5VzzCwzcbMt1cpeI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Ma7K3O/gF9R327bI1RuQaiJpJdppIeVtM3kFdJb9RskZFKZh7fCZfBSg
	7IO2kYpJ9OJPO2a+dZXBJo5dfwPfABoZ6MOEeNsXs6/UfR50rBEy9A2egHx+ZN1KJMtiIBc
	tB+ZXWE/4Fqv00V0xIYB8uvNMw3xJbJxv99IEsGgX7jZOOvjW+6XZklQwuXmwY+jHG81nUc
	WFgRtK2DEHJ0YBIU+2SyT1atA4uoervbkHTn9SNd675C1lUTzbKBNAZeU4s29fs2lUDzWfb
	cgHw2AeaKfK/DrQ6YA4L9fYDtt6gtlgDQwAgyF9g5TCME5CIeCgx+FZ4HB/XlgHyWq8D8lh
	2oANzASwt5E1oYxCSiUN/K130ewiUK0yzx4NX3Z1LzA8WiTeF20KeyQzGNRsDTT2/7zJGnN
	WtcWmXAC3yO6DF24riWDT1wa0ynEBprlbF7jL3b3vKamivJUwfQFylarUUIqM72Dgba+6kV
	xo8ek1xQOeqKGYK99aPgHzGPjhI1uAOM6uP+A2aOVCu6GNXW1MfAr9VoBmK/c7WTTcmk7Aj
	9qbP+dlXzdlNGdiCdnyxS9z7/km7Oa5T/BO2wJAmb512WpIc30ZUeEpFIlVCf1UxdLL4wS+
	33lsCmwtlpqxUtziyiMSrHgsRr9jHKg1zlO5NXYlq09RoPeTHA7+lp4zH9esMsc7lP/H1R5
	4BX9rYQrRNjzZl+L6B5is44Ro7NHSQjWM9JRYoQEwNcirRPuEAVqgEThl+ZIy6p53G8eI9O
	zTqyUBrcTwzyDnD3qwaKG+U2rbXJDwq9bshuAcZ3rlXtg3rSy/PRJKAUMQg6DGI/QXilrlu
	OLqnAMEi4eQOl3wi8ITQNbKgG+sKM0CxQk2yN23vsslA7wJSZpTwlF1MLYCfzrR2L1M6/br
	FBEwkdsWbHGjUgKTe3G4d4Q2fid07eRDgG3EWF6NRWP9qL5JT55UBCg0vU5pqbidN35Gw8I
	8LHN+hrNKk0lU7P9GD0QfAwwChIcPpfr47lmJVaDjuZAngfaSAPV9OZEsodQ6pzO1bT/boS
	V8lN8vb5P5cP+Q4ibFWzPskNAcQ+tp876i5InrLOvpcm7OiORKAs0LdNAhnX2o/ALUUGtT4
	O0mdVmT5K33Nkrj4hyE0MXs3ANG7cPsSCiIq3Di6WDZsJWWL0g4P2pbt6zhEHK5hR/dz/GL
	aWMaw6E7p2Ursgc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034737_522421_1AAB7588 
X-CRM114-Status: GOOD (  24.34  )
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

Add MTD driver for accessing storage devices managed by Qualcomm's
TrustZone firmware. On some platforms, BIOS/firmware storage (typically
SPI NOR flash) is not directly accessible from the non-secure world and
all operations must go through SCM (Secure Channel Manager) calls.

Signed-off-by: Junhao Xie <bigfoot@radxa.com>
Tested-by: Xilin Wu <sophon@radxa.com>
---
 drivers/mtd/devices/Kconfig            |  17 +++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
 3 files changed, 283 insertions(+)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index e518dfeee..4f73e89a1 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -194,6 +194,23 @@ config MTD_INTEL_DG
 	  To compile this driver as a module, choose M here: the module
 	  will be called mtd-intel-dg.
 
+config MTD_QCOM_SCM_STORAGE
+	tristate "Qualcomm TrustZone protected storage MTD driver"
+	depends on MTD
+	depends on QCOM_SCM || COMPILE_TEST
+	help
+	  This provides an MTD device to access storage (typically SPI NOR
+	  flash) that is managed by Qualcomm's TrustZone firmware. On some
+	  platforms, the firmware storage is not directly accessible from
+	  the non-secure world and all operations must go through secure
+	  monitor calls.
+
+	  This driver is only functional on devices where the bootloader
+	  has configured TrustZone to expose the storage interface.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called qcom_scm_storage.
+
 comment "Disk-On-Chip Device Drivers"
 
 config MTD_DOCG3
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index 9fe4ce9cf..d71d07f81 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
 obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
 obj-$(CONFIG_MTD_POWERNV_FLASH)	+= powernv_flash.o
 obj-$(CONFIG_MTD_INTEL_DG)	+= mtd_intel_dg.o
+obj-$(CONFIG_MTD_QCOM_SCM_STORAGE)	+= qcom_scm_storage.o
 
 
 CFLAGS_docg3.o			+= -I$(src)
diff --git a/drivers/mtd/devices/qcom_scm_storage.c b/drivers/mtd/devices/qcom_scm_storage.c
new file mode 100644
index 000000000..bc3f40424
--- /dev/null
+++ b/drivers/mtd/devices/qcom_scm_storage.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm TrustZone SCM Storage Flash driver
+ *
+ * Copyright (c) 2025 Junhao Xie <bigfoot@radxa.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <linux/firmware/qcom/qcom_scm.h>
+
+/*
+ * This driver provides MTD access to storage devices managed by Qualcomm's
+ * TrustZone firmware. The storage (typically SPI NOR flash) is not directly
+ * accessible from the non-secure world and all operations must go through
+ * SCM (Secure Channel Manager) calls.
+ *
+ * A bounce buffer is required because the interface requires
+ * block-aligned addresses and sizes
+ */
+struct qcom_scm_storage {
+	struct device *dev;
+	struct mutex lock;	/* Protects SCM storage operations */
+	struct mtd_info mtd;
+	struct qcom_scm_storage_info info;
+	size_t buffer_size;
+	u8 *buffer;
+};
+
+static int qcom_scm_storage_erase(struct mtd_info *mtd,
+				  struct erase_info *instr)
+{
+	struct qcom_scm_storage *host = mtd->priv;
+	size_t block_size;
+
+	if (instr->addr % host->mtd.erasesize ||
+	    instr->len % host->mtd.erasesize)
+		return -EINVAL;
+
+	block_size = le32_to_cpu(host->info.block_size);
+
+	guard(mutex)(&host->lock);
+
+	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					 QCOM_SCM_STORAGE_ERASE,
+					 instr->addr / block_size,
+					 0, instr->len);
+}
+
+static int qcom_scm_storage_read(struct mtd_info *mtd,
+				 loff_t from, size_t len,
+				 size_t *retlen, u_char *buf)
+{
+	struct qcom_scm_storage *host = mtd->priv;
+	loff_t block_start, block_off, lba;
+	size_t block_size, chunk, to_read;
+	int ret;
+
+	if (retlen)
+		*retlen = 0;
+
+	if (from + len > mtd->size)
+		return -EINVAL;
+
+	if (len == 0)
+		return 0;
+
+	block_size = le32_to_cpu(host->info.block_size);
+
+	guard(mutex)(&host->lock);
+
+	while (len > 0) {
+		block_start = round_down(from, block_size);
+		block_off = from - block_start;
+		lba = block_start / block_size;
+
+		if (block_off || len < block_size) {
+			chunk = min_t(size_t, block_size - block_off, len);
+			to_read = block_size;
+		} else {
+			chunk = round_down(len, block_size);
+			chunk = min_t(size_t, chunk, host->buffer_size);
+			to_read = chunk;
+		}
+
+		ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+						QCOM_SCM_STORAGE_READ,
+						lba, host->buffer,
+						to_read);
+		if (ret)
+			return ret;
+
+		memcpy(buf, host->buffer + block_off, chunk);
+
+		buf += chunk;
+		from += chunk;
+		len -= chunk;
+		if (retlen)
+			*retlen += chunk;
+	}
+
+	return 0;
+}
+
+static int qcom_scm_storage_write(struct mtd_info *mtd,
+				  loff_t to, size_t len,
+				  size_t *retlen, const u_char *buf)
+{
+	struct qcom_scm_storage *host = mtd->priv;
+	loff_t block_start, block_off, lba;
+	size_t block_size, chunk, to_write;
+	int ret;
+
+	if (retlen)
+		*retlen = 0;
+
+	if (to + len > mtd->size)
+		return -EINVAL;
+
+	if (len == 0)
+		return 0;
+
+	block_size = le32_to_cpu(host->info.block_size);
+
+	guard(mutex)(&host->lock);
+
+	while (len > 0) {
+		block_start = round_down(to, block_size);
+		block_off = to - block_start;
+		lba = block_start / block_size;
+
+		if (block_off || len < block_size) {
+			chunk = min_t(size_t, block_size - block_off, len);
+			to_write = block_size;
+
+			ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+							QCOM_SCM_STORAGE_READ,
+							lba, host->buffer,
+							block_size);
+			if (ret)
+				return ret;
+		} else {
+			chunk = round_down(len, block_size);
+			chunk = min_t(size_t, chunk, host->buffer_size);
+			to_write = chunk;
+		}
+
+		memcpy(host->buffer + block_off, buf, chunk);
+
+		ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+						QCOM_SCM_STORAGE_WRITE,
+						lba, host->buffer,
+						to_write);
+		if (ret)
+			return ret;
+
+		buf += chunk;
+		to += chunk;
+		len -= chunk;
+		if (retlen)
+			*retlen += chunk;
+	}
+
+	return 0;
+}
+
+static int qcom_scm_storage_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qcom_scm_storage *host;
+	u64 total_blocks, serial_num;
+	u32 block_size;
+	int ret;
+
+	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, host);
+	host->dev = dev;
+
+	ret = devm_mutex_init(dev, &host->lock);
+	if (ret)
+		return ret;
+
+	host->buffer_size = SZ_256K;
+	host->buffer = devm_kzalloc(dev, host->buffer_size, GFP_KERNEL);
+	if (!host->buffer)
+		return -ENOMEM;
+
+	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					QCOM_SCM_STORAGE_GET_INFO,
+					0, &host->info,
+					sizeof(host->info));
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to get storage info\n");
+
+	total_blocks = le64_to_cpu(host->info.total_blocks);
+	serial_num = le64_to_cpu(host->info.serial_num);
+	block_size = le32_to_cpu(host->info.block_size);
+
+	if (!block_size || !total_blocks)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid storage geometry\n");
+
+	if (block_size > host->buffer_size)
+		return dev_err_probe(dev, -EINVAL,
+				     "block size %u exceeds buffer size\n",
+				     block_size);
+
+	host->mtd.priv = host;
+	host->mtd.name = dev_name(dev);
+	host->mtd.owner = THIS_MODULE;
+	host->mtd.dev.parent = dev;
+	host->mtd.size = total_blocks * block_size;
+	host->mtd.erasesize = block_size;
+	host->mtd.writesize = block_size;
+	host->mtd.writebufsize = block_size;
+	host->mtd.type = MTD_NORFLASH;
+	host->mtd.flags = MTD_WRITEABLE;
+	host->mtd._erase = qcom_scm_storage_erase;
+	host->mtd._read = qcom_scm_storage_read;
+	host->mtd._write = qcom_scm_storage_write;
+
+	ret = mtd_device_register(&host->mtd, NULL, 0);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "scm storage 0x%llx registered with size %llu bytes\n",
+		 serial_num, host->mtd.size);
+
+	return 0;
+}
+
+static void qcom_scm_storage_remove(struct platform_device *pdev)
+{
+	struct qcom_scm_storage *host = platform_get_drvdata(pdev);
+
+	WARN_ON(mtd_device_unregister(&host->mtd));
+}
+
+static const struct platform_device_id qcom_scm_storage_ids[] = {
+	{ "qcom_scm_storage", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, qcom_scm_storage_ids);
+
+static struct platform_driver qcom_scm_storage_driver = {
+	.probe	= qcom_scm_storage_probe,
+	.remove	= qcom_scm_storage_remove,
+	.driver = {
+		.name	= "qcom_scm_storage",
+	},
+	.id_table = qcom_scm_storage_ids,
+};
+module_platform_driver(qcom_scm_storage_driver);
+
+MODULE_AUTHOR("Junhao Xie <bigfoot@radxa.com>");
+MODULE_DESCRIPTION("Qualcomm TrustZone SCM Storage Flash driver");
+MODULE_LICENSE("GPL");

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
