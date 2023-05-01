Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEE6C77B61
	for <linux-mtd@archiver.kernel.org>; Mon,  1 May 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kSoZA8CMV2wx8xdJW57jUE6w0/8mRBKTLpRH1bCDeak=; b=H56hUDtJ8m9vjb
	/aSkI06MDle8oz7C6KOuLX/Friqqilt9xy1lqTzSjhX/QBcWQPTjrV5dMl9UQtxGBlU7FGGhjcIpb
	5waQc67iPZLyOsUmFZJvFBLkQAb7MlhQB6er/SAQx2ZGY5L9SuVOBbCw9XJPBctrPjEmTj1/K3VIx
	LCQVSqaaQhsb7puUCafeUxQm/VnVxiYx7NF+pKXR2cpk74oRYb3bFP2KAh/bv02Tu0c7Ll1ZQ6uwD
	HzuekpqceWwFi5DPwyMOjlkX6Ldb8JMB3b1KsmZFy1bIuhrk8QNfEV446om6V+DWjvCavZVTnoYNa
	1WPLqYRi0lgOJLK0v2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptTN9-00G3sQ-1E;
	Mon, 01 May 2023 13:15:19 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptTN5-00G3qK-0l
	for linux-mtd@lists.infradead.org;
	Mon, 01 May 2023 13:15:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 526A65FD14;
	Mon,  1 May 2023 16:15:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682946906;
	bh=CLzqYTcujARq4NJQtsx22VCX1wovz6DLx4a2PMX1RH8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CKSDHDYIbx0CfnsXKFUMJ5n8v+4d/FVIeHvuvwyL9N7UeFQgBDae/Hu5qkUcZ9LrI
	 vteyRI/tMxuH3ENgqFy3aoigHck4Pn2gFaxUKGG7hgnxNvW8HUB4ZbumbZHlRpR3q+
	 LCmtT8hbloPhJSGIWZMOpOm+RD7kG4vM2sKzXphpFYipJCf22WP9ZFWioRI1n07her
	 W6KZjpqxGI06GRKi5mLKCECRuz9WvZBa+cWhmpC6v+njFoo12ZUhk5LMPVUuTBcnfK
	 qgrsYTPeqFssXVu/zE4Wi/OKOs0EMaxvJ3yGiBSH8BGO/hQt2J4U3q0SXagupWL21s
	 73jyj1w6SNqtw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  1 May 2023 16:15:03 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Date: Mon, 1 May 2023 16:10:21 +0300
Message-ID: <20230501131025.754958-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/01 09:34:00 #21199322
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_061515_997260_80026DA9 
X-CRM114-Status: GOOD (  19.30  )
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

This adds support for OTP area access on MX30LFxG18AC chip series.

Changelog:
  v1 -> v2:
  * Add slab.h include due to kernel test robot error.
  v2 -> v3:
  * Use 'uint64_t' as input argument for 'do_div()' instead
    of 'unsigned long' due to kernel test robot error.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/nand_macronix.c | 213 +++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 1472f925f386..2301f990678e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -6,6 +6,7 @@
  * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
+#include <linux/slab.h>
 #include "linux/delay.h"
 #include "internals.h"
 
@@ -31,6 +32,20 @@
 
 #define MXIC_CMD_POWER_DOWN 0xB9
 
+#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP	0x90
+#define MACRONIX_30LFXG18AC_OTP_START_PAGE	0
+#define MACRONIX_30LFXG18AC_OTP_PAGES		30
+#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE	2112
+#define MACRONIX_30LFXG18AC_OTP_START_BYTE	\
+	(MACRONIX_30LFXG18AC_OTP_START_PAGE *	\
+	 MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
+#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES	\
+	(MACRONIX_30LFXG18AC_OTP_PAGES *	\
+	 MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
+
+#define MACRONIX_30LFXG18AC_OTP_EN		BIT(0)
+#define MACRONIX_30LFXG18AC_OTP_LOCKED		BIT(1)
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -316,6 +331,203 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
 	chip->ops.resume = mxic_nand_resume;
 }
 
+static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, size_t len,
+					    size_t *retlen,
+					    struct otp_info *buf)
+{
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	/* Don't know how to check that OTP is locked. */
+	buf->locked = 0;
+	buf->start = MACRONIX_30LFXG18AC_OTP_START_BYTE;
+	buf->length = MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
+
+	*retlen = sizeof(*buf);
+
+	return 0;
+}
+
+static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
+{
+	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
+
+	feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN;
+	return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
+				 feature_buf);
+}
+
+static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
+{
+	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
+
+	return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
+				 feature_buf);
+}
+
+static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
+					loff_t offs_in_flash,
+					size_t len, size_t *retlen,
+					u_char *buf, bool write)
+{
+	struct nand_chip *nand;
+	size_t bytes_handled;
+	off_t offs_in_page;
+	uint64_t page;
+	void *dma_buf;
+	int ret;
+
+	/* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
+	 * so allocate properly aligned memory for it. This is
+	 * needed because cross page accesses may lead to unaligned
+	 * buffer address for DMA.
+	 */
+	dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	nand = mtd_to_nand(mtd);
+	nand_select_target(nand, 0);
+
+	ret = macronix_30lfxg18ac_otp_enable(nand);
+	if (ret)
+		goto out_otp;
+
+	page = offs_in_flash;
+	/* 'page' will be result of division. */
+	offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
+	bytes_handled = 0;
+
+	while (bytes_handled < len &&
+	       page < MACRONIX_30LFXG18AC_OTP_PAGES) {
+		size_t bytes_to_handle;
+
+		bytes_to_handle = min_t(size_t, len - bytes_handled,
+					MACRONIX_30LFXG18AC_OTP_PAGE_SIZE -
+					offs_in_page);
+
+		if (write) {
+			memcpy(dma_buf, &buf[bytes_handled], bytes_to_handle);
+			ret = nand_prog_page_op(nand, page, offs_in_page,
+						dma_buf, bytes_to_handle);
+		} else {
+			ret = nand_read_page_op(nand, page, offs_in_page,
+						dma_buf, bytes_to_handle);
+			if (!ret)
+				memcpy(&buf[bytes_handled], dma_buf,
+				       bytes_to_handle);
+		}
+		if (ret)
+			goto out_otp;
+
+		bytes_handled += bytes_to_handle;
+		offs_in_page = 0;
+		page++;
+	}
+
+	*retlen = bytes_handled;
+
+out_otp:
+	if (ret)
+		dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
+
+	ret = macronix_30lfxg18ac_otp_disable(nand);
+	WARN(ret, "failed to leave OTP mode after %s\n",
+	     write ? "write" : "read");
+	nand_deselect_target(nand);
+	kfree(dma_buf);
+
+	return ret;
+}
+
+static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t to,
+					 size_t len, size_t *rlen,
+					 const u_char *buf)
+{
+	return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char *)buf,
+					    true);
+}
+
+static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_t from,
+					size_t len, size_t *rlen,
+					u_char *buf)
+{
+	return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, false);
+}
+
+static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_t from,
+					size_t len)
+{
+	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
+	struct nand_chip *nand;
+	int ret;
+
+	if (from != MACRONIX_30LFXG18AC_OTP_START_BYTE ||
+	    len != MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
+		return -EINVAL;
+
+	dev_dbg(&mtd->dev, "locking OTP\n");
+
+	nand = mtd_to_nand(mtd);
+	nand_select_target(nand, 0);
+
+	feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN |
+			 MACRONIX_30LFXG18AC_OTP_LOCKED;
+	ret = nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
+				feature_buf);
+	if (ret) {
+		dev_err(&mtd->dev,
+			"failed to lock OTP (set features): %i\n", ret);
+		nand_deselect_target(nand);
+		return ret;
+	}
+
+	/* Do dummy page prog with zero address. */
+	feature_buf[0] = 0;
+	ret = nand_prog_page_op(nand, 0, 0, feature_buf, 1);
+	if (ret)
+		dev_err(&mtd->dev,
+			"failed to lock OTP (page prog): %i\n", ret);
+
+	ret = macronix_30lfxg18ac_otp_disable(nand);
+	WARN(ret, "failed to leave OTP mode after lock\n");
+
+	nand_deselect_target(nand);
+
+	return ret;
+}
+
+static void macronix_nand_setup_otp(struct nand_chip *chip)
+{
+	static const char * const supported_otp_models[] = {
+		"MX30LF1G18AC",
+		"MX30LF2G18AC",
+		"MX30LF4G18AC",
+	};
+	struct mtd_info *mtd;
+
+	if (!chip->parameters.supports_set_get_features)
+		return;
+
+	if (match_string(supported_otp_models,
+			 ARRAY_SIZE(supported_otp_models),
+			 chip->parameters.model) < 0)
+		return;
+
+	bitmap_set(chip->parameters.get_feature_list,
+		   ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
+	bitmap_set(chip->parameters.set_feature_list,
+		   ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
+
+	mtd = nand_to_mtd(chip);
+	mtd->_get_fact_prot_info = macronix_30lfxg18ac_get_otp_info;
+	mtd->_read_fact_prot_reg = macronix_30lfxg18ac_read_otp;
+	mtd->_get_user_prot_info = macronix_30lfxg18ac_get_otp_info;
+	mtd->_read_user_prot_reg = macronix_30lfxg18ac_read_otp;
+	mtd->_write_user_prot_reg = macronix_30lfxg18ac_write_otp;
+	mtd->_lock_user_prot_reg = macronix_30lfxg18ac_lock_otp;
+}
+
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -325,6 +537,7 @@ static int macronix_nand_init(struct nand_chip *chip)
 	macronix_nand_onfi_init(chip);
 	macronix_nand_block_protection_support(chip);
 	macronix_nand_deep_power_down_support(chip);
+	macronix_nand_setup_otp(chip);
 
 	return 0;
 }
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
