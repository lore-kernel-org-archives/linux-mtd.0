Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11C5C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 02:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95bevXA2ev1F9Iis3LaO/hLmPJF51J2USSnRGyQrxQo=; b=1kn/mJTjK6VsY9
	cD4l9Sk26zmMqr65eTe2rqNvadXMIqZ7V8CCcFbRsHiVqs5piDRDoJiuBDh2+jyZ8hTFLXKNCpyRG
	TGnayWenWFGnCeiL5s+tUDd3qf1+UYHYHyXqI5/7Rb00bwj/zhTANyVJKnEF7YqmsA6BnKvgtZnlc
	iZ9WucapD/YaUo/nsc3cgJDM6ztY0CJKHPSxreA14AURGjIWHCyIcD+jIzMawo2jaqjUL93cS2x6s
	H5/+kyBMFuqomFYOlwjzXkWtU2g+jdnF7D8aZQXFSKx/VNVmhyMpoqaIkRBHz+XzYwRCyZGMlFFdj
	bC6sSo84uFD7PtxACn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf73w-00000003PsG-31aW;
	Thu, 02 Jul 2026 02:22:00 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf73s-00000003Pr3-44jr
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 02:21:58 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so540652a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2026 19:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782958916; x=1783563716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhBKIBTyUUlzBSrRoY3fwwZdfAj9Qw3eVw3ezZbn3wQ=;
        b=TP5YHs2F4OTuKvFab1PdAcBJCn4MIAVB7cZEosJ4Po6D19WVRJhKrI63wIkv0APxJv
         oM/hIAdKq3eCoqFYwtpkd9fvvBKgZA2q+iU5Dam1NET4Yt9Y5PHJn9Dz1cI4zqo/8eWc
         V+oGL4m93Uhy/GHI5MEadiae3QwrMK1AONu6tqMIypMaegHO7chiJBtEtYbqbflzLlWV
         3FRM23Ab1qjQjGcgfI8wyC4lfMtcjdsu/XV6AhSJefw8/jpyBErI3F4TtGQp+JsfX6Tc
         LdzuGxJ5t8xPIxkzdO/qMod5hlTmKo7+sEN19uO4j8+YU0kV1vvzjwATNQlctpYbORW6
         ymvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782958916; x=1783563716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhBKIBTyUUlzBSrRoY3fwwZdfAj9Qw3eVw3ezZbn3wQ=;
        b=eVeMfuXVKnaT3D+SSd+aNeftJXJxI1m+o3taGvx7ZCsHQ76hueITg87/KvOk4exXyU
         axsTysLP2H8MUYtfiak5d8USXrnuHTFycthc2HE0OnkgdQ1k5hV+kgLpw/R5VjOToyXr
         sBx+e1j1CThhow8LIfnOIxretxpa72zomwMRnhQlPEElOR0InLLa5fcp9aiveqWF7Q7q
         yp9Z/2FUMJsQJLM88fyQqbWdwISA92xV0Jue+XtuzalxTdSuTBmPb04H9Qgsxm3SWYmA
         UYEeWcaukjaOFwkJQvcjaV8gttehrqiMgDiP9C7GAKnB6HrRUJoKoC29jzuDcvJ9qjiD
         7+CA==
X-Forwarded-Encrypted: i=1; AFNElJ95Kn7lhn1SXiZDu5rqeutfwrtyWoo7N+x+9jI4aRHdASz3//X2C4uGU9/yCYwmjU/2YuKdnm0A9kY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcsQfLjwoajAqK6rnzNo6mg417FEQqaDVOw8B6GZip+uNy/vBC
	EYJnlSR3ww9lw7xG1jvMGH7mqTrom54/D+sixpCLEaziaITjmvmKXNgv
X-Gm-Gg: AfdE7ck5L+4UZPHQltPYnYcge4SUxB4pyWJLE42lcVm+7FD7i4QwPkiaErM8plYYhsj
	dloPxd6Zmp0fyc8tVeqUVwc/d9kwVk/zdMww/3XGKzGf4Gd/yj26MSLgMiuGMqR2fvGvBmFZ6LP
	4nQLHxmWooxcRiMRiT/vyeSCG6p+ar5SyrwgquL/Btk3hQCUZUJ9FGqs3sADOBkaBfgB1+2WGIp
	PPD1xtiKmhitewIahtTlQkjNY984X7m1+KelK3V8yqLuHKN2f+w4J1mfrEoGFC6XQgu0VXsi3i7
	rpd6xODz2BvlUqo4YlRaSBwboJNUfUkuLaXYHJ0cjVIOdWpEXITXLsEmbI24HhzxgXarFcZsnue
	/qmkeY8hFin+s3oGTeoKpHJm0eHn5J/1KZKDXhtdi/E2rkbJAVQKaB7dkzxQ/5vOVR1upAppQON
	SASmgPANcSfkmsYibNmJHzeI4AtvbIAadOKdU=
X-Received: by 2002:a05:6a21:697:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3bfed472a5cmr4469448637.43.1782958916058;
        Wed, 01 Jul 2026 19:21:56 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm602016a12.6.2026.07.01.19.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 19:21:55 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id E522A4163B74;
	Thu,  2 Jul 2026 10:21:52 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: stable@vger.kernel.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 6.6.y v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Thu,  2 Jul 2026 10:18:41 +0800
Message-Id: <20260702021842.2771498-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702021842.2771498-1-linchengming884@gmail.com>
References: <20260702021842.2771498-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_192157_023458_A76637A9 
X-CRM114-Status: GOOD (  14.56  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit 798aafeffb369c5eb36e406b18970ef27baa820d upstream.

Although certain Macronix NOR flash support the Quad Input Page Program
feature, the corresponding information in the 4-byte Address Instruction
Table of these flash is not properly filled. As a result, this feature
cannot be enabled as expected.

To address this issue, a post_sfdp fixups implementation is required to
correct the missing information.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Link: https://lore.kernel.org/r/20250211063028.382169-2-linchengming884@gmail.com
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index eb149e517c1f..b676a71822a3 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -28,8 +28,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+static int
+macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+				SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
+static const struct spi_nor_fixups macronix_qpp4b_fixups = {
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
 static const struct flash_info macronix_nor_parts[] = {
@@ -81,7 +99,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
 		PARSE_SFDP
 		FLAGS(SPI_NOR_RWW) },
@@ -91,18 +110,22 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512) },
 	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
