Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FB1C61DA4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Mar 2023 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2CXDN3K5pngIfdZEvzyINpDR6PRUDJg9ddSqJ5oRcGs=; b=2V5MyF5aJ8qSQ8
	IUugtQHyv8IA3wypSchuq84C2AtyA67AVICZm9+t0Z5daX0BT7jKRp12SaMyH2E/QTFMdiK7Z/R+i
	YowOfUUte4Cs5MtGMCdDkh7hhTtLZr6+C+tJcAECnR/+Qg829XtHbc+jVtrlUJePusm2M/UW48YBA
	mtueBAcuZu/ZgIUSsLgXrMM1d+brD8y6Sn7wUzug1bZ/sBPi2ExHMfiep4NQn0A/qsdjmvPJ5W5pq
	q5bsuH0UwiqMfj4ZKi3TX0y9KeY5ygK1HVS2lO3YmM+YuasHkglETxUuDImjh1YQiqcZjIaUhKGWl
	zATlehqvBQP4mhCEt5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI0O-00CB9J-0M;
	Wed, 15 Mar 2023 03:40:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI0J-00CB7R-38
	for linux-mtd@lists.infradead.org;
	Wed, 15 Mar 2023 03:40:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id iw3so1859802plb.6
        for <linux-mtd@lists.infradead.org>; Tue, 14 Mar 2023 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678851631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3O07O6yoIRm92tWdhdAFlEIl0gLpfVJDZi13d1nu7i8=;
        b=PD/C65EjE9MNJpYNvCPaeDXI577/1IcB7320fHexEz7APlUiMHcW81nC0bbQ6RkTnE
         kYHL3zF4peiwm6d8iXgE4nwj47GpfBE6El9T236IKtc26CqRkdma6XqRoKl1ZZJ/TsNS
         h1ZiZwB9rge+UTFtxnGN3Hnugy8fHn+iJHnQRK6HeTHMZbkyt4DflO45qEFCCm5KtLcQ
         dvHgdk3kGS/j+gewC+IRcj6iTcOFHEHOqLHW9HRCy+DoJ+NOTRPPEhliCMz7u16K24UR
         s3NMDLjxow6ZOwC12gfmUBFSqSeuL46Cshkt+vxIw5c+3jKrT5dCQAsFtakooGw5lNTI
         57Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678851631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O07O6yoIRm92tWdhdAFlEIl0gLpfVJDZi13d1nu7i8=;
        b=5TmTwGDBsfNMMacmJvYMpBVDb8JH+j9PbV+hGKKShfKV6Ymdubr1Oyj1cVHd9Rak6v
         JKtSzIYMUGDitV18wYkio+tVua4z7/I0LUzEObnZ+KpLqbZYUyPta0+rVSoNQAs3Cu8I
         3XpdW4aejsajZ64/dugvridgTyjS2zblFcN2yXunA7vrr0W4njDD8bmXurm+c6lApKmy
         BARh/OXWsHFxe8s8ULk8y4OOnGJQUCtweIepIMNdvS6Up+F+PneeHKHtzkGUyklVfbDd
         UM2li9/qr/FFkX92u4m6atmhu4rg7woblmkV30xq85OzXwUVq451vHizQQkfIpTlM+Hc
         nrNA==
X-Gm-Message-State: AO0yUKXk4+CdeeXkIuH2lO+r+AuweskKw+P8n7pkdVpWy5gUZSsj7tCT
	PExkKwY/9V2n7jxLATV/MBI18Y9MvY4JhA==
X-Google-Smtp-Source: AK7set8ecJwDFaFf/03P0xw2wXE0v88ZtE72uUqiBf7CN4NZd0NhbbKjkc6nspvbABb9WkDc4DxnEg==
X-Received: by 2002:a17:90b:4d07:b0:23a:87cf:de93 with SMTP id mw7-20020a17090b4d0700b0023a87cfde93mr39377070pjb.15.1678851631119;
        Tue, 14 Mar 2023 20:40:31 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090b070100b00234afca2498sm222719pjz.28.2023.03.14.20.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:40:30 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: spansion: Determine current address mode
Date: Wed, 15 Mar 2023 12:40:04 +0900
Message-Id: <20230315034004.5535-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_204044_035414_2A1655C6 
X-CRM114-Status: GOOD (  23.87  )
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

Internal address mode (3- or 4-byte) affects to the address length in
Read Any Reg op. Read Any Reg op is used in SMPT parse and other setup
functions. Current driver assumes that address mode is factory default
but users can change it via volatile and non-volatile registers.

Current address mode can be checked by CFR2V[7] but Read Any Reg op is
needed to read CFR2V (chicken-and-egg).

This patch introduces a way to determine current address mode by
comparing status register 1 values read by different address length.

Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 170 ++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1678b7b2e9f7..154ea148d5ca 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,10 +14,12 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_STR1V		0x00800000
 #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
+#define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
 #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
@@ -188,6 +190,153 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
+ *                                            (3- or 4-byte) by querying status
+ *                                            register 1 (SR1).
+ * @nor:		pointer to a 'struct spi_nor'
+ * @addr_mode_nbytes:	pinter to buffer for current address mode (3 or 4).
+ * @write_enable:	true to perform write enable op before reading SR1.
+ *
+ * This function tries to determine current address mode by comparing SR1 value
+ * from RDSR1(no address), RDAR(3-byte address), and RDAR(4-byte address).
+ *
+ * The factory default of SR1 (00h) may be vulnerable as reference pattern
+ * because value from RDAR can accidentally get 00h even if address nbytes is
+ * wrong. To mitigate this, use write enable op that sets bit-1 in SR1.
+ *
+ * The 'addr_mode_nbytes' is used as input buffer for predetermined address
+ * nbytes as well as output buffer for determination result. If 0 is specified,
+ * RDAR is performed twice with 3- and 4-byte address. If 3 or 4 is specified,
+ * RDAR is performed just once with specified address nbytes.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
+						  u8 *addr_mode_nbytes,
+						  bool write_enable)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(0, SPINOR_REG_CYPRESS_STR1V, 0,
+					  nor->bouncebuf);
+	u8 predeterm = *addr_mode_nbytes;
+	bool is3byte, is4byte;
+	int ret;
+
+	if (write_enable) {
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			return ret;
+	}
+
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[1]);
+	if (ret)
+		goto out;
+
+	is3byte = false;
+	if (!predeterm || predeterm == 3) {
+		op.addr.nbytes = 3;
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			goto out;
+
+		is3byte = (nor->bouncebuf[0] == nor->bouncebuf[1]);
+	}
+
+	is4byte = false;
+	if (!predeterm || predeterm == 4) {
+		op.addr.nbytes = 4;
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			goto out;
+
+		is4byte = (nor->bouncebuf[0] == nor->bouncebuf[1]);
+	}
+
+	if ((is3byte && is4byte) || (!is3byte && !is4byte))
+		*addr_mode_nbytes = 0;
+	else if (is3byte)
+		*addr_mode_nbytes = 3;
+	else
+		*addr_mode_nbytes = 4;
+
+out:
+	if (write_enable)
+		spi_nor_write_disable(nor);
+
+	return ret;
+}
+
+/**
+ * cypress_nor_set_addr_mode_nbytes() - Set the number of address bytes mode of
+ *                                      current address mode.
+ * @nor:		pointer to a 'struct spi_nor'
+ *
+ * Determine current address mode by reading SR1 with different methods, then
+ * query CFR2V[7] to confirm. If determination is failed, force enter to 4-byte
+ * address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 addr_mode_nbytes = 0;
+	bool is4byte;
+	int ret;
+
+	/*
+	 * Read SR1 by RDSR1 and RDAR(3- AND 4-byte addr). Use write enable
+	 * that sets bit-1 in SR1.
+	 */
+	ret = cypress_nor_determine_addr_mode_by_sr1(nor, &addr_mode_nbytes,
+						     true);
+	if (ret)
+		return ret;
+	if (!addr_mode_nbytes)
+		goto force_4byte;
+
+	/*
+	 * Second iteration is to confirm the 'addr_mode_nbytes' determined by
+	 * first iteration. Write enable is not used for this iteration.
+	 */
+	ret = cypress_nor_determine_addr_mode_by_sr1(nor, &addr_mode_nbytes,
+						     false);
+	if (ret)
+		return ret;
+	if (!addr_mode_nbytes)
+		goto force_4byte;
+
+	/*
+	 * Query CFR2V and make sure no contradiction between determied address
+	 * nbytes and CFR2V[7].
+	 */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_CFR2V, 0,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	is4byte = (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR2_ADRBYT);
+	if ((is4byte && addr_mode_nbytes != 4) ||
+	    (!is4byte && addr_mode_nbytes != 3))
+		goto force_4byte;
+
+	nor->params->addr_mode_nbytes = addr_mode_nbytes;
+
+	return 0;
+
+force_4byte:
+	ret = spi_nor_set_4byte_addr_mode(nor, true);
+	if (ret)
+		return ret;
+	nor->params->addr_mode_nbytes = 4;
+
+	return 0;
+}
+
 /**
  * cypress_nor_set_page_size() - Set page size which corresponds to the flash
  *                               configuration.
@@ -227,9 +376,10 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	struct spi_mem_op op;
 	int ret;
 
-	/* 4-byte address mode is enabled by default */
-	nor->params->addr_nbytes = 4;
-	nor->params->addr_mode_nbytes = 4;
+	ret = cypress_nor_set_addr_mode_nbytes(nor);
+	if (ret)
+		return ret;
+	nor->params->addr_nbytes = nor->params->addr_mode_nbytes;
 
 	/* Read Architecture Configuration Register (ARCFN) */
 	op = (struct spi_mem_op)
@@ -280,6 +430,13 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_parameter_header *bfpt_header,
 			const struct sfdp_bfpt *bfpt)
 {
+	int ret;
+
+	ret = cypress_nor_set_addr_mode_nbytes(nor);
+	if (ret)
+		return ret;
+	nor->params->addr_nbytes = nor->params->addr_mode_nbytes;
+
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
@@ -375,6 +532,13 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 				   const struct sfdp_parameter_header *bfpt_header,
 				   const struct sfdp_bfpt *bfpt)
 {
+	int ret;
+
+	ret = cypress_nor_set_addr_mode_nbytes(nor);
+	if (ret)
+		return ret;
+	nor->params->addr_nbytes = nor->params->addr_mode_nbytes;
+
 	return cypress_nor_set_page_size(nor);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
