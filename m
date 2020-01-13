Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3464C33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 22:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8249B2084D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 22:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VdaL88Rs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="ruCDOvbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8249B2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sjDdgrXSr+vwZRRCqkLj52n+dFvnJoY+r5Mwvasc5Ko=; b=VdaL88RsmpRdX6
	Q/AOYdfDIhcbNIlUd1ChZo1Y+7uxHgX6aFQ4WY6Buimhkzk73PFY5M8tROfNVViKVZDOTZCbsxKsU
	hzUcKJ35rY9ZyJq8a0opjNeZMvePPHhexoaV2aHy1cWRRyr5xl11B6KqPP9njlOa+FAKrKjh1zmP3
	78yJk94ShgPS91V4E4JyxTT2p9R8KKhaPaQQE54ZvkI/yw566is5DmNaGyYx2UOhg2kcc8BcEFAHV
	uqs9i1jhEkk8VX4qbDbry+ZHns7FiA7z0ww9Xg9NKYQ99dJgACaz7SO1Y3c5SPy00DhL1BpyS/Xy6
	ekH3P9zyLolN1kkHzkMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir8Gm-0000Dn-PS; Mon, 13 Jan 2020 22:33:12 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir8Gi-0000Ck-4B
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 22:33:11 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6BC4D22F2E;
 Mon, 13 Jan 2020 23:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1578954784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Ym2AqtgKgLASdYVT4fX6U8b0VarIXO2vV3w44Riz6o=;
 b=ruCDOvblEcjqKFxu7VlWZ5WJ9OQQk7XL4/V3701nmELsHq6IWwzh4sBGqfprVmPlwC/K/E
 UhRH0ZwodNfJCRPC4WvMD7a2z4LowkoJqVGmjfJd/SHlsvcG29gJaAc8suJ1QF/E6smVdL
 92LxB5UNnvctpLTBDhRx51M3VJf6yek=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: remove unused enum spi_nor_ops
Date: Mon, 13 Jan 2020 23:32:48 +0100
Message-Id: <20200113223248.15743-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 6BC4D22F2E
X-Spamd-Result: default: False [4.90 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM(-0.00)[-0.903];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:31334, ipnet:2a02:810c::/31, country:DE]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_143308_488736_93A1A5A2 
X-CRM114-Status: GOOD (  12.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ops aren't used in any SPI controller. Therefore, remove them
altogether.

Signed-off-by: Michael Walle <michael@walle.cc>
---
This patch superseeds the following two patches (thus v2):
https://lore.kernel.org/linux-mtd/20200107222317.3527-1-michael@walle.cc/
https://lore.kernel.org/linux-mtd/20200107222317.3527-2-michael@walle.cc/

 drivers/mtd/spi-nor/aspeed-smc.c      |  4 +--
 drivers/mtd/spi-nor/cadence-quadspi.c |  4 +--
 drivers/mtd/spi-nor/hisi-sfc.c        |  4 +--
 drivers/mtd/spi-nor/spi-nor.c         | 36 +++++++++++++--------------
 include/linux/mtd/spi-nor.h           | 12 ++-------
 5 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 2b7cabbb680c..395127349aa8 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -305,7 +305,7 @@ static void aspeed_smc_stop_user(struct spi_nor *nor)
 	writel(ctl, chip->ctl);		/* default to fread or read mode */
 }
 
-static int aspeed_smc_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+static int aspeed_smc_prep(struct spi_nor *nor)
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 
@@ -313,7 +313,7 @@ static int aspeed_smc_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	return 0;
 }
 
-static void aspeed_smc_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+static void aspeed_smc_unprep(struct spi_nor *nor)
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 
diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 06f997247d0f..494dcab4aaaa 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1062,7 +1062,7 @@ static int cqspi_erase(struct spi_nor *nor, loff_t offs)
 	return 0;
 }
 
-static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+static int cqspi_prep(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
@@ -1072,7 +1072,7 @@ static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	return 0;
 }
 
-static void cqspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+static void cqspi_unprep(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index a1258216f89d..554713db63e6 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -144,7 +144,7 @@ static void hisi_spi_nor_init(struct hifmc_host *host)
 	writel(reg, host->regbase + FMC_SPI_TIMING_CFG);
 }
 
-static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+static int hisi_spi_nor_prep(struct spi_nor *nor)
 {
 	struct hifmc_priv *priv = nor->priv;
 	struct hifmc_host *host = priv->host;
@@ -167,7 +167,7 @@ static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	return ret;
 }
 
-static void hisi_spi_nor_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+static void hisi_spi_nor_unprep(struct spi_nor *nor)
 {
 	struct hifmc_priv *priv = nor->priv;
 	struct hifmc_host *host = priv->host;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6a1c19824fde..97467811d07e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1312,14 +1312,14 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	}
 }
 
-static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+static int spi_nor_lock_and_prep(struct spi_nor *nor)
 {
 	int ret = 0;
 
 	mutex_lock(&nor->lock);
 
 	if (nor->controller_ops &&  nor->controller_ops->prepare) {
-		ret = nor->controller_ops->prepare(nor, ops);
+		ret = nor->controller_ops->prepare(nor);
 		if (ret) {
 			mutex_unlock(&nor->lock);
 			return ret;
@@ -1328,10 +1328,10 @@ static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	return ret;
 }
 
-static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+static void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
 	if (nor->controller_ops && nor->controller_ops->unprepare)
-		nor->controller_ops->unprepare(nor, ops);
+		nor->controller_ops->unprepare(nor);
 	mutex_unlock(&nor->lock);
 }
 
@@ -1693,7 +1693,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_ERASE);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
@@ -1756,7 +1756,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	ret = spi_nor_write_disable(nor);
 
 erase_err:
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
+	spi_nor_unlock_and_unprep(nor);
 
 	return ret;
 }
@@ -2052,13 +2052,13 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
 	ret = nor->params.locking_ops->lock(nor, ofs, len);
 
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_UNLOCK);
+	spi_nor_unlock_and_unprep(nor);
 	return ret;
 }
 
@@ -2067,13 +2067,13 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
 	ret = nor->params.locking_ops->unlock(nor, ofs, len);
 
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
+	spi_nor_unlock_and_unprep(nor);
 	return ret;
 }
 
@@ -2082,13 +2082,13 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
 	ret = nor->params.locking_ops->is_locked(nor, ofs, len);
 
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
+	spi_nor_unlock_and_unprep(nor);
 	return ret;
 }
 
@@ -2745,7 +2745,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_READ);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
@@ -2772,7 +2772,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = 0;
 
 read_err:
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
+	spi_nor_unlock_and_unprep(nor);
 	return ret;
 }
 
@@ -2785,7 +2785,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
@@ -2858,7 +2858,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 out:
 	*retlen += actual;
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
+	spi_nor_unlock_and_unprep(nor);
 	return ret;
 }
 
@@ -2876,7 +2876,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
+	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
@@ -2922,7 +2922,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 
 write_err:
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
+	spi_nor_unlock_and_unprep(nor);
 	return ret;
 }
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7e32adce72f7..5abd91cc6dfa 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -225,14 +225,6 @@ static inline u8 spi_nor_get_protocol_width(enum spi_nor_protocol proto)
 	return spi_nor_get_protocol_data_nbits(proto);
 }
 
-enum spi_nor_ops {
-	SPI_NOR_OPS_READ = 0,
-	SPI_NOR_OPS_WRITE,
-	SPI_NOR_OPS_ERASE,
-	SPI_NOR_OPS_LOCK,
-	SPI_NOR_OPS_UNLOCK,
-};
-
 enum spi_nor_option_flags {
 	SNOR_F_USE_FSR		= BIT(0),
 	SNOR_F_HAS_SR_TB	= BIT(1),
@@ -485,8 +477,8 @@ struct spi_nor;
  *			opcode via write_reg().
  */
 struct spi_nor_controller_ops {
-	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
+	int (*prepare)(struct spi_nor *nor);
+	void (*unprepare)(struct spi_nor *nor);
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, size_t len);
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, const u8 *buf,
 			 size_t len);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
