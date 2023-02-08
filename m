Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C86C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1sPcWx0HrAihNuBGcDqORbet52rI6YIolZP0y5pVvQ=; b=zjjbJ04ES4iloc
	CQvCmJhtmfWojf7MWhpTK/jkcSbJ/HvB+OsYfm0T4D21qGk9GjR2VxdU5bTCC0qaPAI9bReYpSXUh
	g01neb5EY+hxUg8yXQcS6a4hH3yVVM/izQAHF/OQN5kr6aRNckmeovd7sV7R9Neauhe8fvxSaBcE6
	y//DnGFY4u2UhZ7LhXXuDyttxIYwGBL1g4OxAF4A+75ELajXAFpInO8TDt7Sqb5KxCS2M5/py4P7g
	a40vMtbB1aUJgGCQVDbHuVRUv+wILaVt+ykxHwmM0q2m7NIxcKFSojhO+I9jxE7ha6vjP8ELHkggZ
	JPlZ0LzE1UWgl0gF4uGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPq-00EE2p-1Z; Wed, 08 Feb 2023 05:54:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPm-00EE1P-Ke
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so1214903pjb.1
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG7uhvC5DrWj/sM2t5u2Vw0UUf/ViHzmkq6Z2LAcF0o=;
        b=XMUywQG1n9u5onCQe/KlV0uDFMwdlpJFy726SvOhLNuSLGeL4zvLpFoY/1tF3OPH/t
         KojETjEMoIZ6FqgY9WTwsngWSYR/6VNOmtV5gF1mK+tAV3f96Z1IISWCwQq7D6tx1jjJ
         z2Mu3QYHHTlRQehP4tY42jCTCddQh6aW+2rgmZTxfu1PvcAH1/w6rdKZM4+GzjIhx/sm
         MnKUpNRb4Hm54l4pWaLkU7P/Rac2E8kSGlJDQh/JKGiTAoZRoqrnvC9At08Y9Pt57pNI
         nkPXkqbr3RbBicBwNn6Pi0JC6tviXhN3m6c1AZqGakGSfVgo/+Q1951rYFg7O1Jnynsx
         y3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG7uhvC5DrWj/sM2t5u2Vw0UUf/ViHzmkq6Z2LAcF0o=;
        b=uEhjniP5mPLAyjWUFhZp+2UTUpQvBRj2y9NQ8l/QUbadyvtdcwQla3sN/1m/YNmGkq
         IPLbJ1/9owAAOhriw1L3ELmDvbdYWVJhtoY66T2N3kb3O4SzxOXy7OiKp/QiqEAER7P7
         BEaruBpQfFF7JPz4nPGxPlN0gwvU+j2lhgEj2SDD2xh6tUK3rd16LCOinfuRy+uQffM+
         MlYvmu6ASY2AcSKoAvocWvI5X74uFsKOYOboeopsBplGc25t33T9r6MuHPTSaPAAx/RR
         54wLzIi7W8rznowFOhkb5KsRpG+CxKjgbtg5zcA3KisIy1MpY1aaIxzCBYWbAQP99RwK
         wP0g==
X-Gm-Message-State: AO0yUKWPlD+4xCqYLxoRKw07Egc9ycD8YgNoBD83t4YMoVwu78RxxFla
	BRxneukTLiTXOV0AwPu4mBS9ScSx5cM=
X-Google-Smtp-Source: AK7set9/2oiDEOwRBc7DP+tScCDzKgl2agjyxCm8msTUzgWQNIftspX3UklEGtvHY3CakOzlYtgj1Q==
X-Received: by 2002:a05:6a20:12cd:b0:bc:c663:41be with SMTP id v13-20020a056a2012cd00b000bcc66341bemr7565308pzg.30.1675835682230;
        Tue, 07 Feb 2023 21:54:42 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:41 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 4/8] mtd: spi-nor: spansion: Rework cypress_nor_set_page_size() for multi-chip device support
Date: Wed,  8 Feb 2023 14:53:41 +0900
Message-Id: <08b8d366534e6f9ac3f1dcf08560451293e0b4b1.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215442_725306_4139622E 
X-CRM114-Status: GOOD (  20.51  )
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

For multi-chip devices, we can use 512B page only when the all dice are
configured as 512B page size. Simple for-loop with params->num_of_dice can
check the CFR3V in each die. The volatile register address is calculated
inside the loop by using die number and volatile register offset.

The location of cypress_nor_set_page_size() call is moved from
post_bfpt_fixup() to post_sfdp_fixup(), because the number of dice and
volatile register offset are parsed after BFPT. The post_sfdp_fixup()
does not return error code so cypress_nor_set_page_size() prints error
message instead of returning error code.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 47 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 12a256c0ef4c..7c533737d7c3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -18,7 +18,7 @@
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
-#define SPINOR_REG_CYPRESS_CFR3V		0x00800004
+#define SPINOR_REG_CYPRESS_CFR3			0x4
 #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
 #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
@@ -195,27 +195,34 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
  * The BFPT table advertises a 512B or 256B page size depending on part but the
  * page size is actually configurable (with the default being 256B). Read from
  * CFR3V[4] and set the correct size.
- *
- * Return: 0 on success, -errno otherwise.
  */
-static int cypress_nor_set_page_size(struct spi_nor *nor)
+static void cypress_nor_set_page_size(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR3V,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, 0,
 					  nor->bouncebuf);
 	int ret;
+	u8 i;
 
-	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
+	/* Set to default page size */
+	params->page_size = 256;
 
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
+	for (i = 0; i < params->num_of_dice; i++) {
+		op.addr.val = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR3;
 
-	return 0;
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret) {
+			dev_err(nor->dev, "Failed to read page size configuration. Use default 256B.\n");
+			return;
+		}
+
+		if (!(nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ))
+			return;
+	}
+
+	/* We reach here only when all dice are configured to 512B */
+	params->page_size = 512;
 }
 
 static int
@@ -226,7 +233,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
-	return cypress_nor_set_page_size(nor);
+	return 0;
 }
 
 static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
@@ -251,6 +258,8 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 			break;
 		}
 	}
+
+	cypress_nor_set_page_size(nor);
 }
 
 static void s25hx_t_late_init(struct spi_nor *nor)
@@ -312,13 +321,8 @@ static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 * actual value for that is 4.
 	 */
 	nor->params->rdsr_addr_nbytes = 4;
-}
 
-static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
-				   const struct sfdp_parameter_header *bfpt_header,
-				   const struct sfdp_bfpt *bfpt)
-{
-	return cypress_nor_set_page_size(nor);
+	cypress_nor_set_page_size(nor);
 }
 
 static void s28hx_t_late_init(struct spi_nor *nor)
@@ -329,7 +333,6 @@ static void s28hx_t_late_init(struct spi_nor *nor)
 
 static const struct spi_nor_fixups s28hx_t_fixups = {
 	.post_sfdp = s28hx_t_post_sfdp_fixup,
-	.post_bfpt = s28hx_t_post_bfpt_fixup,
 	.late_init = s28hx_t_late_init,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
