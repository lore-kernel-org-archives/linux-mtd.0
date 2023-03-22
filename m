Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5454DC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teO4N3d5aqBjWYuMwwp//Fu1tbT4aFt1N8bRi71L2uQ=; b=FuIP3llKVj3ZHW
	WzhvuaqMGLZnztnEHQxbkObN82pzGCGrAbRGahhM0jxnwRY7+ni9Cy8ct2afRtrlVZ4j0omBgnhlr
	eaihUgKb/stgThkVuS2QS7vGjgpXfsCpO1xChD2TnvlUFqbQTSlu7a9V4a4/OovX5yKY5Xw7R6bNo
	Kexfw4Sw4V/N/xumzEPAm+wvvl3bqrkGzoFi5V1V7a/t4NLyGUHUtJtnsXf0lZFqLFX13ZKLWxLiR
	JC+ef5Yl3QZz1FQ0wJ2uZ5PtnySrbvLF/nzYCaPrX+NUjszB0i96c8+wuSY9u/yTmXxH8rzFARrvz
	KzxiTYRqMkD7Fz1w58jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9T-00Etqh-0I;
	Wed, 22 Mar 2023 06:40:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9L-00EtlW-3B
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:45 +0000
Received: by mail-lf1-x133.google.com with SMTP id k37so9116989lfv.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv+mpUAZwkOh2eeM+ctcdr1FWMN9cPSlCRNPkUJDfOM=;
        b=IsUHCsURkrKzfVF9FTo8CpXo5cdwqWMeHrhqOZXQ2LJ7Dxj125BHHR7lB0mgVaHrEB
         6jqc2tIt/Ojae4grV8rz812MXaoiuYheF3e1g6KceYQ1CGvCvceU2YbBNUNxgusosHq9
         tZ625ww5rA6Khu7QRyre8+Udyzoyn7W/3fIwloiYuqwvgmioJ4xs6mi7r26R5e8vlFPQ
         8nK0M5PNnwmN2KilGY114n1OZC6dmd1ilfXfSQgyh+nCl8Kzu0n+LzGQxI3ROKqZoBji
         KzAo0qQWrOKXTGL2ZAsKhkPDJ8Af6qhXdieLEHXeU0g/uzKgTnVDdqE5S5M5j3qsbjJf
         AftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv+mpUAZwkOh2eeM+ctcdr1FWMN9cPSlCRNPkUJDfOM=;
        b=XHNCmlwcZbTo9i/cKHzoaEccrmPUe42Bm1ZjKBmxAgGI6Vf4+SFRtHaqN5c1uvoT3M
         FxDiVYr33YaYvgFmGZBEGJiksOiWy4lEjeapigCWTnX3AEHyLCayX6Uvhhs7u7+KybXW
         sHPS4ykMLUkaOW0rVkrD/DY2H++NDJHgs6NOAlxc0cWRC3+or5x1SZhskc/2kySkmclK
         lY47rReGrF5W+iGPqtXyuqeWUEMYxrh7yodQLC+vrDu0WcpMaI+KBEU2+GmB/lxpVeyT
         gCpP6Caw+TM/IdQURg0S/qlmsd4zkaOH4bQeTyusqd5GRZ3dkQQE7FBd4jYm0p2RvAex
         wUVg==
X-Gm-Message-State: AO0yUKUzFq3EBXtXeljTCdARDfsqnFBD1Ulfi9uJr8VIpGssPcZ+z9Mv
	+tW71Q4PntOt5nh4lR4l5Ot+Vw==
X-Google-Smtp-Source: AK7set/WXhgfu25geTxkrdgYFE1ioV5AxG+bYZaCiZxwqSgK04DjO1lvy2TvrbLCaxZcNxLJuRNEaA==
X-Received: by 2002:a19:ae12:0:b0:4b5:26f3:2247 with SMTP id f18-20020a19ae12000000b004b526f32247mr1430002lfc.69.1679467241660;
        Tue, 21 Mar 2023 23:40:41 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:41 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 06/11] mtd: spi-nor: Parse BFPT to determine the 4-Byte Address Mode methods
Date: Wed, 22 Mar 2023 06:40:28 +0000
Message-Id: <20230322064033.2370483-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234044_041980_E2DCDFBB 
X-CRM114-Status: GOOD (  19.13  )
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

BFPT[DWORD(16)] defines the methods to enter and exit the 4-Byte Address
Mode. Parse BFPT to determine the method. Will rename the methods with
generic names in a further patch, to keep things trackable in this one.

Some regressions may be introduced by this patch, because the
params->set_4byte_addr_mode method that was set either in
spi_nor_init_default_params() or later overwritten in default_init() hooks,
may now be overwritten with a different value based on the BFPT data. If
that's the case, the fix is to introduce a post_bfpt fixup hook where one
should fix the wrong BFPT info.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/sfdp.c    | 11 +++++++++++
 drivers/mtd/spi-nor/sfdp.h    | 28 ++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c | 11 ++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 298ab5e53a8c..63b2810cf75e 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -438,6 +438,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	size_t len;
 	int i, cmd, err;
 	u32 addr, val;
+	u32 dword;
 	u16 half;
 	u8 erase_mask;
 
@@ -607,6 +608,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 	}
 
+	dword = bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
+	if (sfdp_bits_set(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))
+		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
+	else if (sfdp_bits_set(dword, BFPT_DWORD16_4B_ADDR_MODE_WREN_EN4B_EX4B))
+		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
+	else if (sfdp_bits_set(dword, BFPT_DWORD16_4B_ADDR_MODE_EN4B_EX4B))
+		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	else
+		dev_dbg(nor->dev, "BFPT: 4-Byte Address Mode method is not recognized or not implemented\n");
+
 	/* Soft Reset support. */
 	if (bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
 		nor->flags |= SNOR_F_SOFT_RESET;
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 500659b35655..a4b5fe795f18 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -16,6 +16,8 @@
 /* SFDP DWORDS are indexed from 1 but C arrays are indexed from 0. */
 #define SFDP_DWORD(i)		((i) - 1)
 
+#define sfdp_bits_set(dword, mask)		(((dword) & (mask)) == (mask))
+
 /* Basic Flash Parameter Table */
 
 /* JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs. */
@@ -89,6 +91,32 @@ struct sfdp_bfpt {
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
 
+#define BFPT_DWORD16_EN4B_MASK			GENMASK(31, 24)
+#define BFPT_DWORD16_EN4B_ALWAYS_4B		BIT(30)
+#define BFPT_DWORD16_EN4B_4B_OPCODES		BIT(29)
+#define BFPT_DWORD16_EN4B_16BIT_NV_CR		BIT(28)
+#define BFPT_DWORD16_EN4B_BRWR			BIT(27)
+#define BFPT_DWORD16_EN4B_WREAR			BIT(26)
+#define BFPT_DWORD16_EN4B_WREN_EN4B		BIT(25)
+#define BFPT_DWORD16_EN4B_EN4B			BIT(24)
+#define BFPT_DWORD16_EX4B_MASK			GENMASK(18, 14)
+#define BFPT_DWORD16_EX4B_16BIT_NV_CR		BIT(18)
+#define BFPT_DWORD16_EX4B_BRWR			BIT(17)
+#define BFPT_DWORD16_EX4B_WREAR			BIT(16)
+#define BFPT_DWORD16_EX4B_WREN_EX4B		BIT(15)
+#define BFPT_DWORD16_EX4B_EX4B			BIT(14)
+#define BFPT_DWORD16_4B_ADDR_MODE_MASK			\
+	(BFPT_DWORD16_EN4B_MASK | BFPT_DWORD16_EX4B_MASK)
+#define BFPT_DWORD16_4B_ADDR_MODE_16BIT_NV_CR		\
+	(BFPT_DWORD16_EN4B_16BIT_NV_CR | BFPT_DWORD16_EX4B_16BIT_NV_CR)
+#define BFPT_DWORD16_4B_ADDR_MODE_BRWR			\
+	(BFPT_DWORD16_EN4B_BRWR | BFPT_DWORD16_EX4B_BRWR)
+#define BFPT_DWORD16_4B_ADDR_MODE_WREAR			\
+	(BFPT_DWORD16_EN4B_WREAR | BFPT_DWORD16_EX4B_WREAR)
+#define BFPT_DWORD16_4B_ADDR_MODE_WREN_EN4B_EX4B	\
+	(BFPT_DWORD16_EN4B_WREN_EN4B | BFPT_DWORD16_EX4B_WREN_EX4B)
+#define BFPT_DWORD16_4B_ADDR_MODE_EN4B_EX4B		\
+	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
 #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
 
 #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9cea241c204b..a1b387accc07 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -218,13 +218,22 @@ static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
 
 static void winbond_nor_default_init(struct spi_nor *nor)
 {
-	nor->params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
 }
 
 static void winbond_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->params->otp.org->n_regions)
 		nor->params->otp.ops = &winbond_nor_otp_ops;
+
+	/*
+	 * Winbond seems to require that the Extended Address Register to be set
+	 * to zero when exiting the 4-Byte Address Mode, at least for W25Q256FV.
+	 * This requirement is not described in the JESD216 SFDP standard, thus
+	 * it is Winbond specific. Since we do not know if other Winbond flashes
+	 * have the same requirement, play safe and overwrite the method parsed
+	 * from BFPT, if any.
+	 */
+	nor->params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
 }
 
 static const struct spi_nor_fixups winbond_nor_fixups = {
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
