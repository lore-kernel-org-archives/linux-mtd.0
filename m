Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2307C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 427B4208C3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzWm3EV0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OXIh86gc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 427B4208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VJeNyGvh0tGxFbmtNKS/GgxCmNxB8/xOTXytgdmDql0=; b=MzWm3EV0el5F1/7ErnDpIEK4WT
	Ruzw/cUdkTlPT41Bmf5oTdfdprF7ig9F7r9jb/jfpvOBHWepHujEZvOf2CqcGYBAhxULyyxw4UunR
	8ejYx1yGcjxuKhk7RMFZpDMFH0byerttomKMxXoxthfas3sZO+Dolb083VRcD1+jG40ed5R3wNZ3A
	CyncccofKkwyPGEsrw+aihppjY/iPzhzfJkmdB145dXD6jLZ/06tufk71jBfJshAcn6OIMD9u4XTD
	EKC+6vNfgN3F26+tZlX9k1pSsxcTRC7md/NZaiNt939ZoPGiZddVohbg3jE9/TcDVJh7+zcStGa30
	e7GbxL7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heN74-00010b-Ia; Fri, 21 Jun 2019 17:14:10 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heN6v-0000rV-Az
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 17:14:03 +0000
Received: by mail-pg1-x541.google.com with SMTP id 196so3685081pgc.6
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o1QLzue2L9JyqaN4FDGc1k6pQyo17m+dj0qwGBRdDDY=;
 b=OXIh86gcYSAIWnFCybe6YkfZ9n6MJRje1GXFZ6LrKLFv0hm4DdMxg4+ScBQkfv9tlB
 my4V9V6Z1bwokLV6PeVUkhXOct2z+oaVqKOvCAFs6y1VgnOuUjfEpQpqved5gUmsuP1F
 y8EYncVYigNk+XV+olBklsZhQiHyaMMGYdzCooNYiP4Rk0cRDUcjm5/v3eR9uvZWY9lv
 xOnCiLn5lvUrVSvkRjlQ1pB3SmgmvEq3wJAaebOY5wPx1nDIA+5bq33uq3MMUEq7umOq
 yj1a2obP9idCdB4MG9zRK27yHDxdF85lMbv9FicaWkIdVHDdZFxoMlDgOtiG8mL8FlLa
 1GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o1QLzue2L9JyqaN4FDGc1k6pQyo17m+dj0qwGBRdDDY=;
 b=gHZhPhmDl83w2waCNrALMyYstSsbyIoOAmhJ2aNs3XE5lcVgBC83LIKqTuWARNjf1G
 9yDEq8DqeZQUyxlblpVu9dgZWvgsJYepMOGvi+0l4op561CYah4kFSMjpA45Jj72c6pV
 9s4cRiug2dtCWQybixPYNt2SjeOtQYFTgWstcO37EGGPY51fA8rRTY+gUVs8bV43YMYP
 F/mqG04DwhUl21Gwrjm5ikOmTr9KKp11e7EuDbGH8H4soAffEGzeIP3K+4ymJqJopsWs
 e2fC+0Hf2OHUh7xtTKyNhSvkOPHa5Up89ZhECAJJyh81yk3HDdQ4yX1GfC2M+I7lBBBE
 UBSQ==
X-Gm-Message-State: APjAAAXRrQLqGjpSjXpYoKGFJy0CQIx+gyya9i0C81LVF6cSVpZ5+c7K
 FFr34jhKGR/KuYiAWVht48WMrQ==
X-Google-Smtp-Source: APXvYqxof2SKEqf2xCm0Tw+L4w3+uZRZjimqmRHsuJRrgvUKSNpX9BWdxeTfusOXP5HA2YFfZEboDg==
X-Received: by 2002:a63:1343:: with SMTP id 3mr20134770pgt.426.1561137240372; 
 Fri, 21 Jun 2019 10:14:00 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id t5sm3496190pgh.46.2019.06.21.10.13.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 10:13:59 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v6 1/3] mtd: spi-nor: add support for is25wp256
Date: Fri, 21 Jun 2019 22:43:29 +0530
Message-Id: <1561137211-12406-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
References: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_101401_407108_4951504C 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update spi_nor_id table for is25wp256 (32MB) device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Set method to enable quad mode for ISSI device in flash parameters
table. Set address width to 4byte if device supports 4Byte opcode and
it's size is greater than 16MiB.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 19 +++++++++++++++----
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7..c816f0c 100644
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
@@ -3652,6 +3656,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_MACRONIX:
 			params->quad_enable = macronix_quad_enable;
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
@@ -4129,13 +4137,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
+	if (info->flags & SPI_NOR_4B_OPCODES && mtd->size > 0x1000000) {
+		/*
+		 * enable 4-byte addressing if device supports it and
+		 * its size exceeds 16MiB.
+		 */
+		nor->addr_width = 4;
+	} else if (nor->addr_width) {
 		/* already configured from SFDP */
 	} else if (info->addr_width) {
 		nor->addr_width = info->addr_width;
-	} else if (mtd->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
 	} else {
 		nor->addr_width = 3;
 	}
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
