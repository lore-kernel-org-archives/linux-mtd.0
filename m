Return-Path: <SRS0=wdA/=TL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF47C04AB1
	for <linux-mtd@archiver.kernel.org>; Sat, 11 May 2019 10:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F5532183F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 May 2019 10:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="COpQWKkt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SiTnOmO5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F5532183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Yh3DPw3v1LlCnRb08wGhgdhyGRriWQbG1zg3MSvcAVU=; b=COpQWKktgQH1X/SEo3fy4pZ/cA
	AvubaAW0xDCW06XAztq1krhstGCHu0+q/xsFnlpQq8u04WGQ50d0odQi5HxOKhgQ4GkUckIs0U1W4
	TA+6xscduj8OuAarurROxW/aPmDbCNBoOrZGxOIi5h+gxxXWTWQSJejm31mHPuOuIhvrGWlwFpVyL
	HAprVOyKuEQleFALmPh7k90j0P5yUcw4R5/KK9gpLhbvIXUukMjGi9Ww5j1yHimldohBbQqB2ZRKc
	01RJ43RMOyO0B1AYyHIrUzrMDdhF+nbVFr3G+Loya/OYeLsKxGFlkElzQO/4DGoO5wJBFbZh7UxYV
	o1EM+wYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPOvj-0001eY-2C; Sat, 11 May 2019 10:08:35 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPOvb-0001U2-G7
 for linux-mtd@lists.infradead.org; Sat, 11 May 2019 10:08:31 +0000
Received: by mail-pg1-x543.google.com with SMTP id e6so4235948pgc.4
 for <linux-mtd@lists.infradead.org>; Sat, 11 May 2019 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lq4Rwbk+Emx7YmwQUYNWJJYYUQtvyvA+20pB793R1LY=;
 b=SiTnOmO5Sznr5CnkPCNnoJVJU5Gvid2yUW/23I5LhaPf+c7zw252vPCI8XCFt1fZmo
 emDGSDr4ld2Y4g4B24Y7T443ibZBpcgBrr1rJkwzTywjYNGhQAOy0k7XeIAxp1uVt2rd
 txaE9KGRqB04hsCqTzsanygmidSljfy0mQ8LmxWRQjt3Q5IuhfWS+hcaQggLWJu09tIo
 KssEG3LK8ZkIt2S/6sR2ZSdS2YQlZkkumcnHaJmfEXvKBYbf+MKKcTnpmLCtxsU1VOCO
 PuQ4gVdeDWhzoEuxevEEIK165ionec0kMb6BvKCrPiBNcd4/MIm9iFSHzrR6BCxcGyQV
 Gn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lq4Rwbk+Emx7YmwQUYNWJJYYUQtvyvA+20pB793R1LY=;
 b=HbUqyNKLdqG85lGf+fzlfatvUrd6IjLVvS7ZCfGG0a+Vvc5ot1GJx817EL5eWp1uP7
 nolR99LOjnQt5zR+OIr5+KPxHY2TdGmGsr6RnyMdZPlyxLzrJttIzvrQWgjnTF/uSt8d
 vmF6NDGs/nGB38D0GXFdOUfVmw0cBfFR7RqYiAp6lpbty3lKBgg5mT7vV00HQr2ldQ8R
 +GECiU5+epIMi6sV0l2A8y2CZR3UFZNnJHtpfjrHsUvh57LOJzqp+KmOTwqDsTrtkzAo
 lLfUjkLmW3Ar78OioR5JBU1D4c0oloAVnO5Ni6qiMeXTZ7LR3vVOu6iudVL+dDvSMqf5
 MHww==
X-Gm-Message-State: APjAAAXr38DQ5o3flEVF20pkoEk6RLZXqAFF2AYvfXNvPXzF1HwanBcR
 ZCfPvlauPAxbaop2VxaLtVoygg==
X-Google-Smtp-Source: APXvYqxOdhmgPO8LBuF/0ZOWGILA5WyT0Mz/HZlaeiC4VVBR8+wmgJ7gNoTimV5uPF/AqWOurqUY4w==
X-Received: by 2002:a62:d286:: with SMTP id
 c128mr21241832pfg.159.1557569307043; 
 Sat, 11 May 2019 03:08:27 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 c129sm16951836pfg.178.2019.05.11.03.08.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 11 May 2019 03:08:26 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/3] mtd: spi-nor: add support for is25wp256
Date: Sat, 11 May 2019 15:38:06 +0530
Message-Id: <1557569288-19441-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557569288-19441-1-git-send-email-sagar.kadam@sifive.com>
References: <1557569288-19441-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_030827_836727_22167C73 
X-CRM114-Status: GOOD (  14.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update spi_nor_id table for is25wp256 (32MB)device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Set method to enable quad mode for ISSI device in flash parameters
table.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae1474..c5408ed 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1834,6 +1834,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -3650,6 +3654,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_MACRONIX:
 			params->quad_enable = macronix_quad_enable;
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
@@ -4127,7 +4135,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
+	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
 		/* already configured from SFDP */
 	} else if (info->addr_width) {
 		nor->addr_width = info->addr_width;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b..ff13297 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -19,6 +19,7 @@
 #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
 #define SNOR_MFR_GIGADEVICE	0xc8
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
+#define SNOR_MFR_ISSI		0x9d		/* ISSI */
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
