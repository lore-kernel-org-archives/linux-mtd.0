Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DC6C71143
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zO4ajZ7Dar4515V04O3Gl1kbmql2uX0GwtGU35it5FY=; b=YvOsZozMnEgBoe
	s8S6QkgWsnpGZZTV8sI4IgJn3hIZz9Qaixg4Ie97U4H0+ZZd+aIOq675QoNW6+kdh1+5NEBP3VEhI
	qKyUQQ4nUGuevDULoc6bupZ6xXV5SRU8Cf7I3LRGKiHpF27nr242T7r7PPmJq25RMDLSEaO9skYH+
	Y2IdxKoZTUzlLzEUi8n+Sal/M6MehbeNAUf6Glwy3NDMCOglWsVMNr5DT0lyEO8hp2vHFKhlyD1iE
	zVwNoDr6oMmIwzxBUHEmgXcUTYCspQesJbRcDcEszybZhXYfTN+aiu2J8gi3AzCnxKYXHBOT5JfBN
	8UHVKkS1PQ/eL2YpsPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd0L-0000000CYqF-3bTe;
	Thu, 12 Jun 2025 08:09:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcdL-0000000CUa3-0W2Q
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 07:46:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-234d3261631so4770705ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2025 00:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714358; x=1750319158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzvLXRakggIa4bBtP40TgDjj2rPWIFEhf6AHkIfLiBQ=;
        b=VMTi2Fv/uSkYFsGudOPO3h5QMrZHbe+EVKfNAs4jFxLU7EbnqkgNJoMDPMeh8edsL3
         Y0NFaim0QvzrEaxCeL4H2xrWTmmXin3IhxJC8Fvn7oK5mNWBUortS/dwq2aAg7DawIJi
         FwBFIs6XdLTOt0fI5qfiAYvdudfloV4ucdNnj0zoqVfLVelNWz/0mgaBoIs/xdfzqUgr
         kUaIcraz9RHLBpak73D5eEsJxz7Nzue0MUtOXHjO4svfleB6aGBjx7BuCsK7888+/zob
         n6nP5fnIfJg2mKrUcBioGclF+5h5YGHZAu7/yJZ1GQcWq9Go/n9HnOWox1afWlbHWCOX
         CKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714358; x=1750319158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzvLXRakggIa4bBtP40TgDjj2rPWIFEhf6AHkIfLiBQ=;
        b=nbzwOIL5prH/MIhpaAYeIY82wpzm0Rbf3Ilmh+cTIdIGL+GaE1ifVn+9yM/uScifgN
         gGR//PahER9+7iKDJ9opoK9bwLwkR8f2hGUkYkwBuB9P5DX+s2LXxsgV9A8DKArtVxrM
         9RUh9x6A2VSmsuCHiv7MVW5o1iUg0hg6dHR1tv2TRMXKWCspqk8cQ90f7z7YwkGmP4MG
         QUibyTgUFPNKNkD0Vvc4bpHRF4m8l6idv9GUeu0CnMNQOpvClqgvfokP0de2de/7adGo
         gasMv2ZXLlWn02dhULffJNojUPPQ7dPn6Io17iqWSy1OJ6H9gDv0E1YZS+7IMJDFkTnY
         yubA==
X-Gm-Message-State: AOJu0YyNoYbLDP+e7sI8/dLtjbrrF7DLE5vOIGf3ltKkSpJODAz31bTW
	NJmHU7B6mFdClxResAb6GDijs5NrNRnww6EGS3wRP5H285lwsx3fvMmtrt/0SA==
X-Gm-Gg: ASbGncvEfgQhWQiYpIcIlOpu3qZofnjI2aTAwdcXhQFX9pBZj5cOfdU+9wzue7hkFPO
	7TquRMGHnQdR9uOrqkFIb4qf+cJ2f0eg7Tk1wC2afiKSkuERMrp4LatDS60FXuNHr1++GJ/LbIp
	dy9zLXjtaYjXHFH7SMGOPYvRjGmMnJG7SeZyBNIv88Wg51yp+Omq2iC4sBN5sg/uleeItbAIltd
	SD4/DF7+yHayo/kkI6Cg1VaqhdMAKJlaNfU/8INSFyik77DcyIDudpbFnzLxYFVXDVfBBXbAicM
	EFRAiwZcT7RqvcL16ZKIwqrL4b0uliSXLA3TksLxHtKug46GFnRi/uKNBCR7CD3t1jgUsacJIjx
	WmK11QsZ9GUGDc4u+CaGjAjvD8gMlhaUeVGcGKcM3cU2o9OhQzrR9PK4=
X-Google-Smtp-Source: AGHT+IEiLC+gcOZEc+iXS/cf93hxuf8tlhtMJHsICTNTOh2kJGmzRHW9d3JJ4vLpKPYOTRMM1OKIpQ==
X-Received: by 2002:a17:903:1b6c:b0:235:f45f:ed2b with SMTP id d9443c01a7336-2364c8e1b6amr35329865ad.1.1749714358356;
        Thu, 12 Jun 2025 00:45:58 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e7031efsm7691855ad.188.2025.06.12.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:45:57 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2] mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode for SEMPER
Date: Thu, 12 Jun 2025 16:44:27 +0900
Message-Id: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004559_159465_BAC003E0 
X-CRM114-Status: GOOD (  12.02  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
and function.

Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v2:
  - Move set_4byte_addr_mode() assignment to post_bfpt fixup

 drivers/mtd/spi-nor/spansion.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index bf08dbf5e742..b9f156c0f8bc 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -17,6 +17,7 @@
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
+#define SPINOR_OP_CYPRESS_EX4B	0xB8	/* Exit 4-byte address mode */
 #define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
@@ -58,6 +59,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
+#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
+					   SPINOR_OP_CYPRESS_EX4B, 0),	\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 #define SPANSION_OP(opcode)						\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_NO_ADDR,					\
@@ -356,6 +364,20 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+static int cypress_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+	struct spi_mem_op op = CYPRESS_NOR_EN4B_EX4B_OP(enable);
+
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
+
+	return ret;
+}
+
 /**
  * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
  *                                            (3 or 4-byte) by querying status
@@ -526,6 +548,9 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	struct spi_mem_op op;
 	int ret;
 
+	/* Assign 4-byte address mode method that is not determined in BFPT */
+	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
+
 	ret = cypress_nor_set_addr_mode_nbytes(nor);
 	if (ret)
 		return ret;
@@ -591,6 +616,9 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 {
 	int ret;
 
+	/* Assign 4-byte address mode method that is not determined in BFPT */
+	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
+
 	ret = cypress_nor_set_addr_mode_nbytes(nor);
 	if (ret)
 		return ret;
@@ -718,6 +746,9 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 				   const struct sfdp_parameter_header *bfpt_header,
 				   const struct sfdp_bfpt *bfpt)
 {
+	/* Assign 4-byte address mode method that is not determined in BFPT */
+	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
+
 	return cypress_nor_set_addr_mode_nbytes(nor);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
