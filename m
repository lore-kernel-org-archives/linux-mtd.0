Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7119FCD13D2
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZffWl6HRuke7NwEfZivwI5artn8fgifjcd9gZqUhy0=; b=DhDCovtYQ0bOim
	RqrJ1wW4VhF+RW1w0wrljYENOQTQ8TxyMbU1QMT6b5kiWwYjh2SsUTQi5u4G4N3qmQS31s1+FDB7A
	JoLos4e1i/UICySrPpMFLiN2ah9aMsE2XL8A4FCDJGmgdaPeW31gh69wbT2G5rjSSyIVsf5VPWDP7
	jcsa3TSbAZtAqSbkIlq1A+Z8AwIiqcHm13Ws1lvhVBXKBYp5F9XPTlZl6WhEijonSDH5ARBqGbthI
	/NyKBJzclxT4b6NmAT0UAwMDG7yXzZPRdBtcdXrZpjMDKQL63P0uGlLfAKp1aYmBFAp9OSFLt4z4z
	zfLxtJ20VEMeYupJydzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9BL-000000041PX-0EsB;
	Wed, 29 Apr 2026 17:58:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9B5-0000000415t-3CFC;
	Wed, 29 Apr 2026 17:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MmcPFcCFT0gegKw7/GAlAOSTHc6JlaEROIWqR2nOl4k=; b=PobWXAlP6WzE0nrZB/Tpsq1Y+h
	Sd7hMi2z2qgW4SJxneV5gKjsWoXlBaLhJdlvK3x74sZ3TGxl1lQgblo/QApHa/V2l9ZxGlEoOmCWH
	roCc8+++SB6JGBkKL3jS8Mp5KKvA2Ptw4HEYtPYOjFCbAFqNVwtbL6CAzdCU+GFnwXCcFtWuPhcO7
	OFD6wzqo8hIx+d7GQdV8EGnt2MrO7MQO9JSQQfbKmhEMuaa+dEUKWSBRvjlw7cjjUaFyRaSrPjZpF
	+5JXwi3QGSRrdE7V6HhI2Fo0vOfh6DaL5KyB0xvbBC6vsrubHD2uYNaLeuphqSuSBmVDT17eD8jCy
	kEroNkBA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9B1-00000005wOx-0s24;
	Wed, 29 Apr 2026 17:58:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2177F1A347B;
	Wed, 29 Apr 2026 17:58:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E99E35FD43;
	Wed, 29 Apr 2026 17:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FE631072B176;
	Wed, 29 Apr 2026 19:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MmcPFcCFT0gegKw7/GAlAOSTHc6JlaEROIWqR2nOl4k=;
	b=Kc0vRRlqvfSudEFr1jF1Gd7LJngYIVk/OpJ9Xy8LuG253NtHk6/h4qCUHyLC/uelRVb4cc
	4dtdIBzKI2GiH9nxWVLuBkH0XM6+60TUTV3lPbduunRwVmtsS7NZANu7HdJhAtQLgyg/XC
	qfAyvlNfSlYsoOKdexYgZ4wm/bWSodcggsYCwEBKkDHvzztBYmluC6xuKPrOLpX9/h7Qic
	pT6L6tnkencqHbZvV4EVzLeBhMxFjsgykFNa9YcAAIpXCmpJMwhvoG1NFc/Ior2L3DtbkU
	3DKkjUd9tAEKhfs0hEhZ7womvlhnP/h4dMJsvpfuXnYvpxywIGUMsaSX8ch/9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:48 +0200
Subject: [PATCH v3 11/11] mtd: spinand: winbond: Add support for continuous
 reads on W25NxxJW
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-11-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185823_397956_50B9B3D2 
X-CRM114-Status: GOOD (  15.69  )
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

As for the W35NxxJW family, add support for W25N{01,02}JW continuous
read support. Similar operations require to be done, such as setting a
specific bit in a configuration register, and providing a set of read
variants without the address cycles.

As read from cache variants are badly supported by SPI memory
controllers, we create a new set of read from cache templates with a
fake address cycle and just enough dummy cycles. There are two
unsupported configurations (which would require 4.5 dummy bytes), so we
just do not provide them.

The same extra value in the ECC is possible as with the W35NxxJW family,
so we reference the same helper to retrieve the ECC status.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
All variants have been validated on a Nuvoton MA35D1 platform.
---
 drivers/mtd/nand/spi/winbond.c | 108 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index ffbcd25b0366..578f702528ee 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -46,6 +46,62 @@
 		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
 		   SPI_MEM_OP_MAX_FREQ(freq))
 
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1D_1D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(2, 0, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 2),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 2),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_2D_2D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbd, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 2),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 2),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6d, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 1),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 4),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 4),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
+#define WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xed, 1),				\
+		   SPI_MEM_DTR_OP_ADDR(1, 0, 4),			\
+		   SPI_MEM_DTR_OP_DUMMY(ndummy - 1, 4),			\
+		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define WINBOND_CONT_READ_FROM_CACHE_1S_1S_8S_OP(ndummy, buf, len, freq) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x8b, 1),				\
 		   SPI_MEM_OP_ADDR(1, 0, 1),				\
@@ -133,6 +189,20 @@ static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
 
+static SPINAND_OP_VARIANTS(cont_read_cache_dual_quad_dtr_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(11, NULL, 0, 80 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(5, NULL, 0, 80 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(7, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 104 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2D_2D_OP(6, NULL, 0, 80 * HZ_PER_MHZ),
+		/* The 1S_1D_2D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(5, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 104 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -445,11 +515,25 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
 
+	/*
+	 * At this stage, we do not yet know the continuous read template, nor
+	 * if there is going to be one. Let's assume the continuous read
+	 * template will be selected with the same heuristics as the buffered
+	 * read variant, as there cannot be a HS configuration mismatch between
+	 * them.
+	 */
 	op = spinand->op_templates->read_cache;
 
 	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
+static int w25n0xjw_set_cont_read(struct spinand_device *spinand, bool enable)
+{
+	u8 mask = enable ? 0 : WINBOND_CFG_BUF_READ;
+
+	return spinand_upd_cfg(spinand, WINBOND_CFG_BUF_READ, mask);
+}
+
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)
 {
 	struct spi_mem_op op = SPINAND_OP(spinand, winbond_write_vcr,
@@ -580,12 +664,14 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_dual_quad_dtr_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_dual_quad_dtr_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_dual_quad_dtr_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&w25n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
+		     SPINAND_ECCINFO(&w25n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
@@ -624,12 +710,14 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_dual_quad_dtr_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_dual_quad_dtr_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_dual_quad_dtr_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25w35nxxjw_ecc_get_status),
+		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
