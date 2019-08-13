Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B727C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 12:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E183B20844
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 12:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nayEixV1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Eji9QCzX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E183B20844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kZw1f3wFnrcPMXNjNPU0amYhOW8RYOf75iebuGxoMYM=; b=nayEixV1s1V+m3N5iBMiVS3zSE
	UGLU2hyMTNjIdXzc9vPJdI0/fSUdayksTz9wkygSOKmwRsRmQYAt+1OkWqAmrb+F4Fdg3+IlE3933
	kreIVQJR8y6fM32cXyq6XyUCz+FnjJaNFMo31FTGgskBC69hg2EN4gBVSMaBGVFi0P7u5JyEIRgH6
	+VhjHnQIspQRNdGnisyjNDXVcaAugQrBPfRnw+zJ0N0mtr7LpkLDQ1TxOMOu6e5bWrok517cqb/5Q
	o0hlEdGkId6ixeoMcHZ5mD4ktYJSFIV0xNZ/AMfH5LNybQitRTs4hsD8/wuyL6bYf850oF5kbhHkM
	0KCrWlPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxW6C-000211-80; Tue, 13 Aug 2019 12:40:24 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxW65-0001si-Th
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 12:40:19 +0000
Received: by mail-pl1-x642.google.com with SMTP id t14so49208539plr.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 05:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pgvdxjtpuz55YPGQB23L2WMX3O76fZRFK/d5NtZERoU=;
 b=Eji9QCzX6NDgNFeFnxj9rUaLJ6FyD9qbUp2fmHutJvjmJL8oz/oWGOEImUBp2qtzw2
 ghphYL3aC6mXnLbOGCvXFQjrVBDpirAncbRbGmdUEa7XYLNB0D+JhD51PifiQw0pgHLw
 q1SDWN7dG9Glq6n0BucEoRp8nl9RhPMvVmD/hR9H22W/jI1JPRuB5KVf5Jet9+mUpmOT
 /GhnmfRF/XGkkEgiLzboxS9VhOmSkpz7xq5ZezpOIKH+oS6LIxMPzLR7H8po8iEM4nWL
 KuuymjgKjvPoiInOFUkLUoUWoDAkYK6WXeZiPva9HxTsOLsM0oeJH4zBeiBQoNloEkqW
 DKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pgvdxjtpuz55YPGQB23L2WMX3O76fZRFK/d5NtZERoU=;
 b=jhqetVrSPCARphbJSeSeSE6LAhd3YFtGl0ixAAKpItW7CJoxPMTNDlaHgu/BYz7SpO
 2dhGk5t6eAQx2UyTlkuXf43/d1WgSCZoOl+KDF9n4LWgb0dIWi3wWYsouBVrXpS/7PwE
 eD3U0El/bVgPb+uJ7KuPEoa1J0dpC0Oz2GhXqLmV2lX5/gV0wuCG2Uue3Ex4vBM2aea5
 ZqhOLTKf0qyKPhGO8kDW8554/B3plZ5MmFic4+fcqOPJdrEkW/EAnjVEwqnaNbvSU4Sr
 YKMHwPR8INFRD2yyfZW9j6WXiXiwnaJvjlCjdVeNt7w72VVfEeDVwArEU2KKg3uFA+Rx
 gjIA==
X-Gm-Message-State: APjAAAWsrx8mlOwO9jFk54HI3t4Lw/PEhza/OZNBmM4M2QQpDjgJpJaT
 PELnFxq9zXCcge4lqQ/JF/dfuw==
X-Google-Smtp-Source: APXvYqxWcTCU0kgc6G/GYUMZlXWQ2LubbF4dViI0P+GouGc1oCNVdP/GEvRTcKm+kT7ludfGw87CVg==
X-Received: by 2002:a17:902:20cc:: with SMTP id
 v12mr24385277plg.188.1565700017042; 
 Tue, 13 Aug 2019 05:40:17 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 v145sm14758467pfc.31.2019.08.13.05.40.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Aug 2019 05:40:16 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v8 1/4] mtd: spi-nor: add support for is25wp256
Date: Tue, 13 Aug 2019 18:08:12 +0530
Message-Id: <1565699895-4770-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565699895-4770-1-git-send-email-sagar.kadam@sifive.com>
References: <1565699895-4770-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_054017_979222_4FE524BB 
X-CRM114-Status: GOOD (  12.73  )
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
table.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 9 ++++++++-
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 03cc788..6635127 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1946,7 +1946,10 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
@@ -3776,6 +3779,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		default:
 			/* Kept only for backward compatibility purpose. */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9f57cdf..5d6583e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -21,6 +21,7 @@
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
+#define SNOR_MFR_ISSI		0x9d		/* ISSI */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
 #define SNOR_MFR_SPANSION	CFI_MFR_AMD
 #define SNOR_MFR_SST		CFI_MFR_SST
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
