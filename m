Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D2BC41513
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYT1d59EgmQQieDphY7VljxMnOX/8WQ0hVbqxsZor7A=; b=uJNz2+XbrpQF1L
	1r/vycCAtIPnHZl7wmSOlGlulNQHxUhDCUvwWESgGn+ZmZCw4UqLUn3XspBSTeS/vE0pxpU7agqzr
	VrCZzTbolnBd1pm8fg8jYyH4jBN1DWcA2sNncMXAjpNUWk31fTJWNUCL2xNtXBgNNDGVgmMF8IiTV
	QVfbhrcptFrpcL7/wEP+TBQUVCxas2ZyFxYSHon0943rU/cS3cNuS7LzGjP8fbPBCbZyDmnjJz1gO
	eXsVeQcuv9TO+vxpsddGvT0G29TCK23IZQfcKa7mCrdO/rslTE0jA7ctNb92oN66afVr/Q9pb6VBc
	3T9tyNnjWzjJQo3RYbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCWD-0000000Asef-0gQy;
	Mon, 17 Jun 2024 13:35:33 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCW8-0000000Asao-3OAp
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 13:35:31 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B942412000B;
	Mon, 17 Jun 2024 16:35:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B942412000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718631322;
	bh=WcL5BZZJWEHlfSbXCMuvF0QCupxulygIhNPX45T5o3s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UTCLUCTBoM1LCdwkUwSeYKSgzkZGnZR6ckMCJiHtPJiOmcIXhLiPxexwxyS+277QL
	 AhuKHtCO30NzKNX72/k8dVQuGOcb/9FUp7Ki1WfaYMIGaChxPBWE5cFbiK92OznQLK
	 GXL/LERi4tZ+y58WiSGVA484xOvXUEtO7ifIY3vcXfQpHigY2fn1u9Z9tDqsvQqUvc
	 y3IOMgxCWPhwiJI9TdtTWsT6f9RKlmhBCHAxCpOEu46gPeh6yv+ugZwetYV2f8uYUZ
	 F02RT+jw18S1J9f5Lt5YXGtQUfnpm/H1qd7+D+lOJAhaBDtMTydpmKFFDndKPY8I0G
	 P5YiXBU74fmSg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 17 Jun 2024 16:35:22 +0300 (MSK)
Received: from CAB-WSD-0004828.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 17 Jun 2024 16:35:22 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, Mark
 Brown <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, Md Sadre
 Alam <quic_mdalam@quicinc.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1 2/5] mtd: spinand: add OTP support
Date: Mon, 17 Jun 2024 16:34:54 +0300
Message-ID: <20240617133504.179705-3-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240617133504.179705-1-mmkurbanov@salutedevices.com>
References: <20240617133504.179705-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185966 [Jun 17 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/17 12:47:00 #25641689
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_063529_276142_EDC01A80 
X-CRM114-Status: GOOD (  30.38  )
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
 drivers/mtd/nand/spi/core.c   |   3 +
 drivers/mtd/nand/spi/otp.c    | 219 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  56 +++++++++
 4 files changed, 280 insertions(+), 1 deletion(-)
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
index 807c24b0c7c4f..2cb825edd49d0 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1111,6 +1111,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
+		spinand->otp = &table[i].otp;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1292,6 +1293,8 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 	mtd->_resume = spinand_mtd_resume;
 
+	spinand_set_mtd_otp_ops(spinand);
+
 	if (nand->ecc.engine) {
 		ret = mtd_ooblayout_count_freebytes(mtd);
 		if (ret < 0)
diff --git a/drivers/mtd/nand/spi/otp.c b/drivers/mtd/nand/spi/otp.c
new file mode 100644
index 0000000000000..e1f96b1898dcb
--- /dev/null
+++ b/drivers/mtd/nand/spi/otp.c
@@ -0,0 +1,219 @@
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
+static size_t spinand_otp_size(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	size_t otp_pagesize = nanddev_page_size(nand) +
+			      nanddev_per_page_oobsize(nand);
+
+	return spinand->otp->layout.npages * otp_pagesize;
+}
+
+static unsigned int spinand_otp_npages(const struct spinand_device *spinand)
+{
+	return spinand->otp->layout.npages;
+}
+
+static int spinand_otp_rw(struct spinand_device *spinand, loff_t from,
+			  size_t len, u8 *buf, size_t *retlen, bool is_write)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct nand_page_io_req req = { 0 };
+	unsigned long long page;
+	size_t copied = 0;
+	size_t otp_pagesize = nanddev_page_size(nand) +
+			      nanddev_per_page_oobsize(nand);
+	int ret = 0;
+
+	page = from;
+	req.dataoffs = do_div(page, otp_pagesize);
+	req.pos.page = page;
+	req.type = is_write ? NAND_PAGE_WRITE : NAND_PAGE_READ;
+	req.mode = MTD_OPS_RAW;
+	req.databuf.in = buf;
+
+	while (copied < len && req.pos.page < spinand_otp_npages(spinand)) {
+		req.datalen = min_t(unsigned int,
+				    otp_pagesize - req.dataoffs,
+				    len - copied);
+
+		if (is_write)
+			ret = spinand_write_page(spinand, &req);
+		else
+			ret = spinand_read_page(spinand, &req);
+
+		if (ret < 0)
+			break;
+
+		req.dataoffs = 0;
+		copied += req.datalen;
+		req.pos.page++;
+	}
+
+	*retlen = copied;
+
+	return ret;
+}
+
+/**
+ * spinand_otp_read() - Read from OTP area
+ * @spinand: the spinand device
+ * @from: the offset to read
+ * @len: the number of data bytes to read
+ * @buf: the buffer to store the read data
+ * @retlen: the pointer to variable to store the number of read bytes
+ *
+ * Return: 0 on success, an error code otherwise.
+ */
+int spinand_otp_read(struct spinand_device *spinand, loff_t from, size_t len,
+		     u8 *buf, size_t *retlen)
+{
+	return spinand_otp_rw(spinand, from, len, buf, retlen, false);
+}
+
+/**
+ * spinand_otp_write() - Write to OTP area
+ * @spinand:  the spinand device
+ * @from: the offset to write to
+ * @len: the number of bytes to write
+ * @buf: the buffer with data to write
+ * @retlen: the pointer to variable to store the number of written bytes
+ *
+ * Return: 0 on success, an error code otherwise.
+ */
+int spinand_otp_write(struct spinand_device *spinand, loff_t from, size_t len,
+		      const u8 *buf, size_t *retlen)
+{
+	return spinand_otp_rw(spinand, from, len, (u8 *)buf, retlen, true);
+}
+
+static int spinand_mtd_otp_info(struct mtd_info *mtd, size_t len,
+				size_t *retlen, struct otp_info *buf)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->info(spinand, len, buf, retlen);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+static int spinand_mtd_otp_rw(struct mtd_info *mtd, loff_t ofs, size_t len,
+			      size_t *retlen, u8 *buf, bool is_write)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	size_t total_len = len;
+	int ret;
+
+	if (ofs < 0 || ofs + len > spinand_otp_size(spinand))
+		return -EINVAL;
+
+	total_len = min_t(size_t, total_len, spinand_otp_size(spinand) - ofs);
+	if (!total_len)
+		return 0;
+
+	mutex_lock(&spinand->lock);
+
+	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, CFG_OTP_ENABLE);
+	if (ret)
+		goto out_unlock;
+
+	if (is_write)
+		ret = ops->write(spinand, ofs, len, buf, retlen);
+	else
+		ret = ops->read(spinand, ofs, len, buf, retlen);
+
+	if (spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0)) {
+		WARN(1, "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+out_unlock:
+	mutex_unlock(&spinand->lock);
+	return ret;
+}
+
+static int spinand_mtd_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
+				size_t *retlen, u8 *buf)
+{
+	return spinand_mtd_otp_rw(mtd, from, len, retlen, buf, false);
+}
+
+static int spinand_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
+				 size_t *retlen, const u8 *buf)
+{
+	return spinand_mtd_otp_rw(mtd, to, len, retlen, (u8 *)buf, true);
+}
+
+static int spinand_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	if (!ops->erase)
+		return -EOPNOTSUPP;
+
+	if (!len)
+		return 0;
+
+	if (from < 0 || (from + len) > spinand_otp_size(spinand))
+		return -EINVAL;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->erase(spinand, from, len);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+static int spinand_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	const struct spinand_otp_ops *ops = spinand->otp->ops;
+	int ret;
+
+	if (!ops->lock)
+		return -EOPNOTSUPP;
+
+	if (from < 0 || (from + len) > spinand_otp_size(spinand))
+		return -EINVAL;
+
+	mutex_lock(&spinand->lock);
+	ret = ops->lock(spinand, from, len);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+/**
+ * spinand_set_mtd_otp_ops() - Set up OTP methods
+ * @spinand: the spinand device
+ *
+ * Set up OTP methods.
+ */
+void spinand_set_mtd_otp_ops(struct spinand_device *spinand)
+{
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+
+	if (!spinand->otp->ops)
+		return;
+
+	mtd->_get_user_prot_info = spinand_mtd_otp_info;
+	mtd->_read_user_prot_reg = spinand_mtd_otp_read;
+	mtd->_write_user_prot_reg = spinand_mtd_otp_write;
+	mtd->_lock_user_prot_reg = spinand_mtd_otp_lock;
+	mtd->_erase_user_prot_reg = spinand_mtd_otp_erase;
+}
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 555846517faf6..a0d42a9be333f 100644
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
+ * @info: Get the OTP area information
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
+		    u8 *buf, size_t *retlen);
+	int (*write)(struct spinand_device *spinand, loff_t from, size_t len,
+		     const u8 *buf, size_t *retlen);
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
 
@@ -525,4 +573,12 @@ int spinand_read_page(struct spinand_device *spinand,
 int spinand_write_page(struct spinand_device *spinand,
 		       const struct nand_page_io_req *req);
 
+void spinand_set_mtd_otp_ops(struct spinand_device *spinand);
+
+int spinand_otp_read(struct spinand_device *spinand, loff_t from, size_t len,
+		     u8 *buf, size_t *retlen);
+
+int spinand_otp_write(struct spinand_device *spinand, loff_t from, size_t len,
+		      const u8 *buf, size_t *retlen);
+
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
