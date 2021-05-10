Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91487C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 20:22:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0270613C4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 20:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0270613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2SqddD85nz4ozF6qcPP0R/1VFtmq5wdqyVTNvXI7bhY=; b=S5AISPNoPI1//616AguNblby7c
	zUPRaMHF3rDWWHjwxevjnVWpXycDOvm/WjLEq9AiqeDk+2gipzkxkvlrKt97wE5X/U8Ds10urB32P
	Zp1Jxfg5pCeTs1B64zYEIL3/jI5+AmVvKMzonqC3bhQYYK9YUVx/Tbiv0pjd69hmltcwpzxb2pu5h
	pj7+RsQaRVg2eB+f57rh9CPWu+vopQSdhMqiaC5Ha9+yzEEk142aVU837cl223dX87KSwLXqXSAz5
	oToYIIdcWcn24AkfhMpqb38WdoVpfANi8BgfmMtD5VA8TWA78w77TnMwy0Gj2qMq201VfAVraNjOS
	+08PvCgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgCOx-00FeKh-H2; Mon, 10 May 2021 20:21:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCOu-00FeKV-AL
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 20:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ypJMXGHxFBpZ5W0TKAltvaipxJmAZfBHWoFKzXMSGzc=; b=UTc/yG9gSDhrFotk/9kojY0usc
 G+v6MqJ3iDr9opKqLrnA6FetCXHNftFslJtYJZtx4M5V3HCs6Hr/CkmD9i2PEVh+t1e52UWCakXGj
 FL697IEUt4d8GE+9glp3Dq8Ogbi2eOk3NlWtl2br56IVrROcDLZHifLhmks08bEMOF7zDx3YFIPJ4
 hZ3EAwZ/MSf/AO5c+GoLWncuX6oHnVK6A1pTno0OJB7fKX2kpeNyYmnoW01u5ckUGHt+Y1jhCoCJP
 t2uTiqOLcTsaOn2flED1nXqw9w1f35U+WvMPNnJAk/+ylUrsEAVCZR2aKOzM4qFP70wt+WUWY5T8e
 YzB6ksvA==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCOq-0096M8-W2
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 20:21:11 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 75C192222E;
 Mon, 10 May 2021 22:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620678063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ypJMXGHxFBpZ5W0TKAltvaipxJmAZfBHWoFKzXMSGzc=;
 b=DKBHQKs+9Rahg2CJoPYU80H3z4ivu3VCXv/jMPL0IVAfSlxypV03dixj3smkfaI6C+Yp99
 yjYNX2c41bwlh6DO9GYqEMsG0wig8NLY0Y1gWK1oBM84kc5uO6kIWmYIB+9lpgpRt2AmaO
 3Oh5r9wKebFEwmfI5sJCvXXtZKX6P8k=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2] mtd: spi-nor: implement OTP erase for Winbond and similar
 flashes
Date: Mon, 10 May 2021 22:20:56 +0200
Message-Id: <20210510202056.30000-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_132109_366313_F4E650C5 
X-CRM114-Status: GOOD (  22.08  )
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

Winbond flashes with OTP support provide a command to erase the OTP
data. This might come in handy during development.

This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
NXP FSPI controller.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since v1:
 - fixed kernel doc

There is also a patch for mtd-utils to add a small tool to issue
the erase:
https://lore.kernel.org/linux-mtd/20210510201319.25975-1-michael@walle.cc/

 drivers/mtd/spi-nor/core.c    |  4 +-
 drivers/mtd/spi-nor/core.h    |  4 ++
 drivers/mtd/spi-nor/otp.c     | 73 ++++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/winbond.c |  1 +
 4 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bd2c7717eb10..fac8717f651f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -166,8 +166,8 @@ static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
 	return nor->controller_ops->read_reg(nor, opcode, buf, len);
 }
 
-static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
-					    const u8 *buf, size_t len)
+int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+				     const u8 *buf, size_t len)
 {
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
 		return -EOPNOTSUPP;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 28a2e0be97a3..b410e4eec2fb 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -214,6 +214,7 @@ struct spi_nor_otp_ops {
 	int (*write)(struct spi_nor *nor, loff_t addr, size_t len,
 		     const u8 *buf);
 	int (*lock)(struct spi_nor *nor, unsigned int region);
+	int (*erase)(struct spi_nor *nor, loff_t addr);
 	int (*is_locked)(struct spi_nor *nor, unsigned int region);
 };
 
@@ -481,6 +482,8 @@ extern const struct spi_nor_manufacturer spi_nor_xmc;
 void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     struct spi_mem_op *op,
 			     const enum spi_nor_protocol proto);
+int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+				     const u8 *buf, size_t len);
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
@@ -507,6 +510,7 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
 int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 			   const u8 *buf);
+int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr);
 int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
 int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
 
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 61036c716abb..d3ca73c8cc53 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -8,6 +8,7 @@
 #include <linux/log2.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/spi/spi-mem.h>
 
 #include "core.h"
 
@@ -111,6 +112,48 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 	return ret ?: written;
 }
 
+/**
+ * spi_nor_otp_erase_secr() - erase one OTP region
+ * @nor:        pointer to 'struct spi_nor'
+ * @addr:       offset of the OTP region to be erased
+ *
+ * Erase one OTP region by using the SPINOR_OP_ESECR commands. This method is
+ * used on GigaDevice and Winbond flashes.
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_ESECR, 0),
+				   SPI_MEM_OP_ADDR(3, addr, 0),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		nor->bouncebuf[2] = addr & 0xff;
+		nor->bouncebuf[1] = (addr >> 8) & 0xff;
+		nor->bouncebuf[0] = (addr >> 16) & 0xff;
+
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_ESECR,
+						       nor->bouncebuf, 3);
+	}
+	if (ret)
+		return ret;
+
+	return spi_nor_wait_till_ready(nor);
+}
+
 static int spi_nor_otp_lock_bit_cr(unsigned int region)
 {
 	static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
@@ -316,12 +359,14 @@ static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
 }
 
-static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
+static int spi_nor_mtd_otp_lock_erase(struct mtd_info *mtd, loff_t from,
+				      size_t len, bool is_erase)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
 	const size_t rlen = spi_nor_otp_region_len(nor);
 	unsigned int region;
+	loff_t rstart;
 	int ret;
 
 	if (from < 0 || (from + len) > spi_nor_otp_size(nor))
@@ -337,7 +382,13 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 
 	while (len) {
 		region = spi_nor_otp_offset_to_region(nor, from);
-		ret = ops->lock(nor, region);
+
+		if (is_erase) {
+			rstart = spi_nor_otp_region_start(nor, region);
+			ret = ops->erase(nor, rstart);
+		} else {
+			ret = ops->lock(nor, region);
+		}
 		if (ret)
 			goto out;
 
@@ -351,6 +402,23 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 	return ret;
 }
 
+static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	return spi_nor_mtd_otp_lock_erase(mtd, from, len, false);
+}
+
+static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+
+	/* OTP erase is optional */
+	if (!ops->erase)
+		return -EOPNOTSUPP;
+
+	return spi_nor_mtd_otp_lock_erase(mtd, from, len, true);
+}
+
 void spi_nor_otp_init(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
@@ -374,4 +442,5 @@ void spi_nor_otp_init(struct spi_nor *nor)
 	mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
 	mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
 	mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
+	mtd->_erase_user_prot_reg = spi_nor_mtd_otp_erase;
 }
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9a81c67a60c6..96573f61caf5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -139,6 +139,7 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 static const struct spi_nor_otp_ops winbond_otp_ops = {
 	.read = spi_nor_otp_read_secr,
 	.write = spi_nor_otp_write_secr,
+	.erase = spi_nor_otp_erase_secr,
 	.lock = spi_nor_otp_lock_sr2,
 	.is_locked = spi_nor_otp_is_locked_sr2,
 };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
