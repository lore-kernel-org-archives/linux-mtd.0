Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4E9C5AE59
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jun 2025 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RXqOmC8lIVsBhXyHNUd+n2pfdcRZboU7uc39KmUPMCg=; b=Uq5vpKr1Bf305N
	G74qOCPPqK0Ajm16bEi9fqGzPZTUJD+aOzbew9iVMXQShpif453t27mIbkd8XQ76QoudqVJokOK68
	vP1GX4kxLI12sDjslp0NZ/CP58C5m7CvVi9D3XnMNBS+RcBttaBcoCv9k5UiyiRA9jxkmKnZ12tKy
	lgFKvNBdIUJXy/EKKXcgpGO54FDPt3VvBQv4yjdwIncBxDcOjKiAFZQcl36XKWhHOI3/ieqhG+exO
	0t6fmXaRzYzLFYqQyrgwEihnWG9QjRmqdQ7Fogf1KChL0/4myIQ6I/prNzl5r8ibxUDlXS+pHKLMb
	jof/oA0bspIAwCYG16Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6OI-0000000F6YZ-0op1;
	Thu, 05 Jun 2025 08:56:02 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6OE-0000000F6YD-0Izo
	for linux-mtd@lists.infradead.org;
	Thu, 05 Jun 2025 08:55:59 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2db2149ffceso671285fac.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2025 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113756; x=1749718556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o+lQs+l5O6HjY/GiUTefrdUeHH1FdWN2CtX0+R7lfgk=;
        b=lMIpOarNMaGgDXdYjVM7r6t8mEijVKpPWmKW3ZSV2OPyHdVycktmPbBXg1RrrLYcZr
         ASHYoBH4XDn1oYOvM0JyGo4Ebhrf2iId4/vkr+92MepBTSsGsFPSi04j5zaJ5wJyZC/m
         0E5UQLIo3P9eVI9QG9qXOmG+vTg8poSYf1yCI1YYBqs6Xa49xLoYL1kMjjRnGskHstgb
         nmMU4IOakqkSI3kn3ZNqwKeVJk2HGjb6sT0xW5RBZs+QqMjwg+F6/1h+k/pdKH8Lg0V9
         OZZbgLPbP2Prw+jKZskCLD7Ci0ZbdMG90+gzzLVb4afd2tMPxjuzdgaAUUgPHkKZyKcJ
         NoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113756; x=1749718556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+lQs+l5O6HjY/GiUTefrdUeHH1FdWN2CtX0+R7lfgk=;
        b=nQ5DbElimWHxxZOVk0mQ0Ao7Xz4gh1bGisp+K3vgIdJmH75ZSTEe/1fv5DCIVqbQbj
         /Q7GVVg8r9aJCwfkIfFNkEuCIjYZ8ZZ6PzBZZHxzWyCB0zCTjZLIiBXxAXf5fIQ/5OmO
         Vo6GWw9szUyVirHHtU8CqU+5OlBnwhgbrIAb1OHx7bGAGu7zU5iJkCir4/rem1hFzKdc
         dh+JeFNwNwgWG3LJqCl8j3jzAFjBInL2nsXAis0AZprIsvxdJAsq/zWCjAch/KW5eouE
         VkpVrWQFELU61BkjujKcuHd1FLXvJgRf2HftCf5FBkP8cOG38xI4O2Od+Y84dyqIS5rN
         e/fw==
X-Gm-Message-State: AOJu0Yy9wL/tpKENnk7NBRCELTAOg9UqY9YdhNCf/QoVNq+FdU11cApD
	8wqio/GKbPzSOJQJKfWUmVznIfJIHconSocs7Zsl/wVBWjsW86SfwQ+Wt6hXBw==
X-Gm-Gg: ASbGncsUL7VEB5gKHWWm+6sAISx0cwdf5B0xNn1TSRbQ4meUpNn1Mt46FtfPX1fxIjZ
	AgmUNsISFCpfuFhyxrkanqsFe5f/ckZ5rYAxWYYTHqQYI79+PpyVKgDwZsxQwHn0Izmnch6eMaH
	MNqnlxFoX9UQcDL2aVSsmmpEX5PmXeELutT9/Y00AKmFZbpLGd4sLokNvYpzIoYrOxqHia4zGaN
	KSCj8nyS3BGKk0dPkfxGGnD5T8Ikws3R8smYpDod/2G/tPolEEinf7ozXzDQhD4p+WInvR1ZYP9
	m9Ntm1eIY6E+cCb2cDnPHcb/+VPz/AXwnpy01NUOvC2XRydzWrBWvqsD/SIO8lNjjJZnZ4jxL0/
	hGqH6avCA3DJo9DPpzqj+iCqxWXsugiSOuQjQRStbpXEduy7nypUcQ20=
X-Google-Smtp-Source: AGHT+IEeDh+UzhZwda7CuSDBKjM/ZF5oYWtS0YOOBby2/sUC1UscAhQRGFrqgu+EO/fWnUWA1ANYaA==
X-Received: by 2002:a05:6a00:14d4:b0:742:a82c:d832 with SMTP id d2e1a72fcca58-7480b4650abmr9980656b3a.24.1749113745114;
        Thu, 05 Jun 2025 01:55:45 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabc6asm12843624b3a.53.2025.06.05.01.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:55:44 -0700 (PDT)
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
Subject: [PATCH] mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode for SEMPER
Date: Thu,  5 Jun 2025 17:55:35 +0900
Message-Id: <20250605085535.17963-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_015558_114845_91616FB3 
X-CRM114-Status: GOOD (  11.18  )
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
 drivers/mtd/spi-nor/spansion.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index bf08dbf5e742..9162b9297ce8 100644
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
@@ -424,6 +446,13 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 	u8 addr_mode;
 	int ret;
 
+	/*
+	 * 4-byte address mode method is not determined by BFPT parse as SEMPER
+	 * does not support EX4B(E9h). Assign device-specific method before
+	 * spi_nor_set_4byte_addr_mode() is called.
+	 */
+	nor->params->set_4byte_addr_mode = cypress_nor_set_4byte_addr_mode;
+
 	/*
 	 * Read SR1 by RDSR1 and RDAR(3- AND 4-byte addr). Use write enable
 	 * that sets bit-1 in SR1.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
