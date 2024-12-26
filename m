Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DF2E77195
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2024 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0Ut691qDzmUaImNGM7A3Vezd000CHr5+RAO4JXfxGc=; b=w+J9tc0x/3dtZS
	OV3AV6jkXwlCunDhH+s1BgIqGXBjzQYa0FQpcYAoCR/dtfGXafHRncmXOsIIAT135Dasj2JCoH9ax
	k+PuqkGT/jmf4Yo/9AbUPKph96ECveRKO+Dr0QivEei6fikFp30FGN8x5kPH8LDSYPvHIEs7lP4RP
	BqCxrECAgCf3tisRwYZmufDO5xFgGuAIPrije+PEAF1P+GRR5PGHJ6PfmbVquG/3JMv+CaiVpf+hk
	Lmo34XoRu5bsnZb6GnxvQv+7PAwvLILwQ+PsVp+/34qf78k9YJJDg4pxt6CqVwdgN+nJUPlIoJh3w
	9jQqp60eihs+NRFGxgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoN4-0000000FrdS-2gGj;
	Thu, 26 Dec 2024 13:57:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoM2-0000000FrMo-3XgN
	for linux-mtd@lists.infradead.org;
	Thu, 26 Dec 2024 13:56:50 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8CEDD100008;
	Thu, 26 Dec 2024 16:56:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8CEDD100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735221396;
	bh=XTST6i6yTc9vLtzNPts6dg52V/B9tBq1q3P3PLwGUxU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=nnltGPHa9D8raZL8j65dUOeS04QyGw9PZvfRIGIc/eCmRlx3r+58MQfFF5s5v0+RY
	 ikL8iQhfgA9gqsPkc9WOQ9Ede5+7sOp0+LkcdTRn2tJJ2bagPCW784ie11qc6pEZ4v
	 YWiCIr04djYV1jg1La4THwe0zXRNev+I46k3UqhMHDlW0WUAehzPHD8Q4SWzqWbLd6
	 MHgz1PTwo0a+LqqPTe7cYb51IwEiZ3Vik9+n81rL0NDGYW9X/3RC670vyxSFzJedJQ
	 tFuNXV7r1m7LZB869a+KP+C6934/J8C3pLEeBGyivKUBpn7hYMiKOkFbeMouPaAIWD
	 9G8oPxRzh12Cw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 26 Dec 2024 16:56:36 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Alexey Romanov
	<avromanov@salutedevices.com>, Frieder Schrempf <frieder.schrempf@kontron.de>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v3 2/7] mtd: spinand: add OTP support
Date: Thu, 26 Dec 2024 16:55:47 +0300
Message-ID: <20241226135623.43098-3-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
References: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.224.140]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190075 [Dec 26 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/26 12:50:00 #26919000
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_055647_697402_F4259ECE 
X-CRM114-Status: GOOD (  26.07  )
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

The MTD subsystem already supports accessing two OTP areas: user and
factory. User areas can be written by the user. This patch only adds
support for the user areas.

In this patch the OTP_INFO macro is provided to add parameters to
spinand_info.
To implement OTP operations, the client (flash driver) is provided with
5 callbacks: .read(), .write(), .info(), .lock(), .erase().

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/Makefile |   3 +-
 drivers/mtd/nand/spi/core.c   |   7 ++
 drivers/mtd/nand/spi/otp.c    | 169 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  52 +++++++++++
 4 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/otp.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 19cc77288ebbc..60d2e830ffc6b 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
+spinand-objs := core.o otp.o
+spinand-objs += alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
 spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4b394eace2d09..d12f09b28e371 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1111,6 +1111,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
+		spinand->otp = &table[i].otp;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1292,6 +1293,12 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 	mtd->_resume = spinand_mtd_resume;
 
+	if (spinand_otp_size(spinand)) {
+		ret = spinand_set_mtd_otp_ops(spinand);
+		if (ret)
+			goto err_cleanup_ecc_engine;
+	}
+
 	if (nand->ecc.engine) {
 		ret = mtd_ooblayout_count_freebytes(mtd);
 		if (ret < 0)
diff --git a/drivers/mtd/nand/spi/otp.c b/drivers/mtd/nand/spi/otp.c
new file mode 100644
index 0000000000000..3650ff336db14
--- /dev/null
+++ b/drivers/mtd/nand/spi/otp.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Martin Kurbanov <mmkurbanov@salutedevices.com>
+ */
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/spinand.h>
+
+/**
+ * spinand_otp_size() - Get SPI-NAND OTP area size
+ * @spinand: the spinand device
+ *
+ * Return: the OTP size.
+ */
+size_t spinand_otp_size(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	size_t otp_pagesize = nanddev_page_size(nand) +
+			      nanddev_per_page_oobsize(nand);
+
+	return spinand->otp->layout.npages * otp_pagesize;
+}
+
+static int spinand_otp_check_bounds(struct spinand_device *spinand, loff_t ofs,
+				    size_t len)
+{
+	if (ofs < 0 || ofs + len > spinand_otp_size(spinand))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int spinand_mtd_otp_info(struct mtd_info *mtd, size_t len,
+				size_t *retlen, struct otp_info *buf)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	*retlen = 0;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->info(spinand, len, buf, retlen);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+static int spinand_mtd_otp_read(struct mtd_info *mtd, loff_t ofs, size_t len,
+				size_t *retlen, u8 *buf)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	*retlen = 0;
+
+	if (!len)
+		return 0;
+
+	ret = spinand_otp_check_bounds(spinand, ofs, len);
+	if (ret)
+		return ret;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->read(spinand, ofs, len, retlen, buf);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+static int spinand_mtd_otp_write(struct mtd_info *mtd, loff_t ofs, size_t len,
+				 size_t *retlen, const u8 *buf)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	*retlen = 0;
+
+	if (!len)
+		return 0;
+
+	ret = spinand_otp_check_bounds(spinand, ofs, len);
+	if (ret)
+		return ret;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->write(spinand, ofs, len, retlen, buf);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+static int spinand_mtd_otp_erase(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	if (!len)
+		return 0;
+
+	ret = spinand_otp_check_bounds(spinand, ofs, len);
+	if (ret)
+		return ret;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->erase(spinand, ofs, len);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+static int spinand_mtd_otp_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	if (!len)
+		return 0;
+
+	ret = spinand_otp_check_bounds(spinand, ofs, len);
+	if (ret)
+		return ret;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->lock(spinand, ofs, len);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+/**
+ * spinand_set_mtd_otp_ops() - Setup OTP methods
+ * @spinand: the spinand device
+ *
+ * Setup OTP methods.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int spinand_set_mtd_otp_ops(struct spinand_device *spinand)
+{
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+
+	if (!ops)
+		return -EINVAL;
+
+	if (ops->info)
+		mtd->_get_user_prot_info = spinand_mtd_otp_info;
+
+	if (ops->read)
+		mtd->_read_user_prot_reg = spinand_mtd_otp_read;
+
+	if (ops->write)
+		mtd->_write_user_prot_reg = spinand_mtd_otp_write;
+
+	if (ops->lock)
+		mtd->_lock_user_prot_reg = spinand_mtd_otp_lock;
+
+	if (ops->erase)
+		mtd->_erase_user_prot_reg = spinand_mtd_otp_erase;
+
+	return 0;
+}
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 555846517faf6..a9ad286de2902 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -322,6 +322,43 @@ struct spinand_ondie_ecc_conf {
 	u8 status;
 };
 
+/**
+ * struct spinand_otp_layout - structure to describe the SPI NAND OTP area
+ * @npages: number of pages in the OTP
+ */
+struct spinand_otp_layout {
+	unsigned int npages;
+};
+
+/**
+ * struct spinand_otp_ops - SPI NAND OTP methods
+ * @info: get the OTP area information
+ * @lock: lock an OTP region
+ * @erase: erase an OTP region
+ * @read: read from the SPI NAND OTP area
+ * @write: write to the SPI NAND OTP area
+ */
+struct spinand_otp_ops {
+	int (*info)(struct spinand_device *spinand, size_t len,
+		    struct otp_info *buf, size_t *retlen);
+	int (*lock)(struct spinand_device *spinand, loff_t from, size_t len);
+	int (*erase)(struct spinand_device *spinand, loff_t from, size_t len);
+	int (*read)(struct spinand_device *spinand, loff_t from, size_t len,
+		    size_t *retlen, u8 *buf);
+	int (*write)(struct spinand_device *spinand, loff_t from, size_t len,
+		     size_t *retlen, const u8 *buf);
+};
+
+/**
+ * struct spinand_otp - SPI NAND OTP grouping structure
+ * @layout: OTP region layout
+ * @ops: OTP access ops
+ */
+struct spinand_otp {
+	const struct spinand_otp_layout layout;
+	const struct spinand_otp_ops *ops;
+};
+
 /**
  * struct spinand_info - Structure used to describe SPI NAND chips
  * @model: model name
@@ -354,6 +391,7 @@ struct spinand_info {
 	} op_variants;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
+	struct spinand_otp otp;
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -379,6 +417,14 @@ struct spinand_info {
 #define SPINAND_SELECT_TARGET(__func)					\
 	.select_target = __func,
 
+#define SPINAND_OTP_INFO(__npages, __ops)				\
+	.otp = {							\
+		.layout = {						\
+			.npages = __npages,				\
+		},							\
+		.ops = __ops,						\
+	}
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -422,6 +468,7 @@ struct spinand_dirmap {
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
  * @manufacturer: SPI NAND manufacturer information
+ * @otp: SPI NAND OTP info.
  * @priv: manufacturer private data
  */
 struct spinand_device {
@@ -450,6 +497,7 @@ struct spinand_device {
 	u8 *oobbuf;
 	u8 *scratchbuf;
 	const struct spinand_manufacturer *manufacturer;
+	const struct spinand_otp *otp;
 	void *priv;
 };
 
@@ -525,4 +573,8 @@ int spinand_read_page(struct spinand_device *spinand,
 int spinand_write_page(struct spinand_device *spinand,
 		       const struct nand_page_io_req *req);
 
+size_t spinand_otp_size(struct spinand_device *spinand);
+
+int spinand_set_mtd_otp_ops(struct spinand_device *spinand);
+
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
