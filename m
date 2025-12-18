Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0983CD6E2D2
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwFGAjxhZ9fTb1mrYv+mLlec7KcmgzDm5eusA3aM0Tg=; b=GzQu9QDWHKikaY
	T3JSPaDyXP5XfDfQbNRZabyKdSKDoAL+wkDxR3LCQIKEPNr+EM6Vu62fHoF92Nmfeaga88wIYhb0k
	bpR57jZtHx+93Lr2aWKpW1fnFD+VVADwJEwGqImXWyYeWSFzatXK4rIIb1ReiF0UlYafg9Ahs44Xi
	cRma5zGzBU8l359/v64nTHcsqee5XSS5tmEKREtkGDiPTqAAwaLOox1vo1zDy2TdTs18x3ZndKukv
	f6xe3kZTCL4IMvqJSOOlp9n/RKUW4bNsKeFko8inTlnDGfmsnm1d8lc3XGm+UdTffkhpToKdbOYiE
	TP4ubzVr8mhOjs7HeHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIME-00000008yHF-1ksv;
	Thu, 18 Dec 2025 18:04:10 +0000
Received: from bg1.exmail.qq.com ([114.132.64.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIMA-00000008yFn-4C3T
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 18:04:09 +0000
X-QQ-mid: esmtpgz12t1766080959t18399a9e
X-QQ-Originating-IP: HRY41DCVJM6ztJQhG5rRVPrgnrnvSTWL8ryX4p9C0vg=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 02:02:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10201982189096493261
EX-QQ-RecipientCnt: 16
From: Junhao Xie <bigfoot@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Junhao Xie <bigfoot@radxa.com>,
	Xilin Wu <sophon@radxa.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
Date: Fri, 19 Dec 2025 02:02:05 +0800
Message-ID: <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218180205.930961-1-bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N2dNga98lfCamzpaZeQsg+F7CAJB01w0FU8Y/gCzYXOtbbip99Gc5rZY
	zEU44CRI73Th6H6iS/q3u8Aqd1aOyLTCpgJYq+KTcEcNrvuijXOw3Rfxe2ztzOqoHbTSoza
	7h+7ZVvRJ8PyvaluhD5IrtouZOzZbSmZIt7FIR6VWX6YLK3/T7hIANq19usnoQPB4ZHfkRq
	VXlJf+Jb6jL5cA8Mbok8/7t4607rQrAAw9/WqU3MezhSzNKnPVI6IW9746XUpW7HEQaWItE
	jkdTtxTuoqAHNc8M9luRS9cHGUy4HfLkYxbj/Ze9ClM/JxKSBSFopCN6Hrj4OLOJ5U94ote
	GetyjVX+pWeeaUpF1aJ0UGD/myQ3l+4gGM7qVD45s15AM4xAD4RfdL7RBypcWXVHSZEwXL8
	QDvFXHhALVmJTxoI19d18e7MRA/VWLcm+zVI6Bx8A2FH493jGUV0W1/fN6yi2GKDupjKQ3t
	RZmOjCrm9H7R0Mqr0KYf8UF0DXhzRaAK53afL9JNbepGgWrPbmTmo4vZgez3dimKctl4YOR
	CdEyVjm48QgFY3l6EmRbEts+3R2GE80nxEnXvWoXPVE1vns3Sb9xihmQ/K+e5qHFDccfmhd
	seKmpxHtneKLn5SnsKGsfIXpNJIbp+kfU/VX99Tu/nCRoKnkOwPzDjdTn9QhvKbLVAv6CbU
	U1OvAh+Wd9DWBlKEFTDK1N3mBC7oVDEEytS16ilkFS4zKcoqbedeu/8YInXJk33xy82EIlj
	AHiWZ8I5Gb/UGCdgu8GCDWp2E+xEYE7xMzybAKQ7n+HFcunG1PPxTghxk8vlybigf7tbzN9
	TJRIucRXC3Ws5itdSUFT2JiORUhy0gJNx1uphPt8jVgk+rExffXZZGwj69MysiTw3jUiuVY
	D+dRNC5BiiZw9zIQjxqS5hg0WhrmVGiGDfnHsg41GSdEiXa8pITJqOBq1RY/nI56OMSD+2s
	l0MpyqDby1przAQ3oeQjE4J50RE0OGtHPEvUkQWzkRye9Lr21iFmv3jpYfAM0STPQ2xGx7/
	4HIPGJR7ylXVXXzCjAlNAMCDe3PHB0r1NkjRa5jV0bZfWyiV+j
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_100408_085259_F101C5B0 
X-CRM114-Status: GOOD (  25.92  )
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
 drivers/mtd/devices/Kconfig            |  17 ++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 256 +++++++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 drivers/mtd/devices/qcom_scm_storage.c

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index e518dfeee6542..4f73e89a11947 100644
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
index 9fe4ce9cffde9..d71d07f811fa2 100644
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
index 0000000000000..bf5a9f423ed7c
--- /dev/null
+++ b/drivers/mtd/devices/qcom_scm_storage.c
@@ -0,0 +1,256 @@
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
+	struct qcom_scm_storage *host =
+		container_of(mtd, struct qcom_scm_storage, mtd);
+
+	if (instr->addr % host->info.block_size ||
+	    instr->len % host->info.block_size)
+		return -EINVAL;
+
+	guard(mutex)(&host->lock);
+
+	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					 QCOM_SCM_STORAGE_ERASE,
+					 instr->addr / host->info.block_size,
+					 0, instr->len);
+}
+
+static int qcom_scm_storage_read(struct mtd_info *mtd,
+				 loff_t from, size_t len,
+				 size_t *retlen, u_char *buf)
+{
+	struct qcom_scm_storage *host =
+		container_of(mtd, struct qcom_scm_storage, mtd);
+	size_t block_size = host->info.block_size;
+	loff_t block_start, block_off, lba;
+	size_t chunk, to_read;
+	int ret = 0;
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
+	struct qcom_scm_storage *host =
+		container_of(mtd, struct qcom_scm_storage, mtd);
+	size_t block_size = host->info.block_size;
+	loff_t block_start, block_off, lba;
+	size_t chunk, to_write;
+	int ret = 0;
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
+	if (!host->info.block_size || !host->info.total_blocks)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid storage geometry\n");
+
+	if (host->info.block_size > host->buffer_size)
+		return dev_err_probe(dev, -EINVAL,
+				     "block size %u exceeds buffer size\n",
+				     host->info.block_size);
+
+	host->mtd.name = dev_name(dev);
+	host->mtd.owner = THIS_MODULE;
+	host->mtd.dev.parent = dev;
+	host->mtd.size = host->info.total_blocks * host->info.block_size;
+	host->mtd.erasesize = host->info.block_size;
+	host->mtd.writesize = host->info.block_size;
+	host->mtd.writebufsize = host->info.block_size;
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
+		 host->info.serial_num, host->mtd.size);
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
2.51.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
