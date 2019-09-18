Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC72C4CEC4
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 16:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2065207FC
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 16:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SlayBEwt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NLPFJ4H0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2065207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hb4jCRIEBOv+FWdkoyPcqnneL5kagWMjffoZwLqPcII=; b=SlayBEwt2jxapaq9CVcB6PEXz2
	U7P+MhIsaT7EZ4H6zbfQQRlUl+JqC1REXfYl0xm2vhuBJN3KN8Q9UMW0cdWvjiGpfMOWe0W9uZiz6
	3Dr905NaSrL9/e3haTertpvkgSyvEg25UMVzTMPDi7XfU2FUV5Gijm5vRKTasOSYXuL/P7g/1xe81
	fPldI0xAJxjf+wKpHi0K6hgUGBoqGlWhVIxoMVZ8f9+wgAj8n+dYSwdYqj+g+NetKV9C+1DywzmJ0
	/fCY/SqL2aCzwmRZTT7jJR+EGfZVFVogLfoX7GWKYROXVec4G/qGbRdld5lsfsQKqFj/J9GKVog3p
	XQIJJ6yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAcPw-0007k6-0S; Wed, 18 Sep 2019 16:02:56 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAcPa-0007U9-Ad
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 16:02:36 +0000
Received: by mail-pf1-x441.google.com with SMTP id y72so240141pfb.12
 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2019 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x/hOHLuin26MPrIrFSxVodQBfjvOevhYq+l2qnUtb4s=;
 b=NLPFJ4H0KYYWxV3pQaf6UPLJT5yOe2Z9mc8KjdbFMglhBxFeEQqRaXBFL1FuONKFuP
 LtZ8e4sGexom6Wfnf4zMIOCuNksF3PxbFOEggvk84aA483J2v8FXBtq9HKu1SO+XhEHY
 K7XZwjXvtTf01Gsc2jdjCc+BuepCKtwVksaw6Pwc8sGUyDYFy36zzKCo/eL/DZur+pLK
 u2zovlIoxYeTiAR6ZKEAwG6BDwhQvTE2Y6d7YxdWerUzzV2ZgZ9dcHLSnyU30fYkrfHU
 wd29GJsVRBrNGPgKc98MJq//C0IiIP+VM5nQrCjIxWOVNkA6wpJL8+9SrfgZowQ4xRh+
 MNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x/hOHLuin26MPrIrFSxVodQBfjvOevhYq+l2qnUtb4s=;
 b=NoCTS4Iy0xlrl9kejZIn61EBVU79DU4EalAWvzj0PRrkk1QJCb31ygHmec42a5Z9LY
 KU8fJ1y4UOevaMOTfW+Tge2KjVSSVY0vU9ThqvDIUrr+42XORI3shxAna2LwGCMlVmcd
 /B3Ecy9wL8g7cAhY/sJYERrlb8ZdITjd1o+hKgQ9TLKbDjrnb02/wkc0EnNAvZE12EYU
 7ALgOa85EvVtsmwb/NuP06VujH696dkMgMGpCORcto1Yy/ebozV9cod0gWNpHd/zFvRk
 3nOM1UqFPtUr3j9wm27llMqqyfqtkeht0N8CQizO9j0OIKgTjaTr5Sd8Vv9jYUnmbn76
 HtFQ==
X-Gm-Message-State: APjAAAUnUENlZrlI9nqau1ABmISxcVn9wV7pk71K3VAY723fmkfcx/J0
 RKy1hqQJR81jkZvhxHl6WSrsTA==
X-Google-Smtp-Source: APXvYqyTb59K5tEHA9jKBr9DDK6Fol9hLY0ADaMXEbmWN9Vrrd8hcj+iGvecx5mGfHulwlg9Srchew==
X-Received: by 2002:a65:5543:: with SMTP id t3mr4674553pgr.242.1568822553580; 
 Wed, 18 Sep 2019 09:02:33 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id g12sm9872379pfb.97.2019.09.18.09.02.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Sep 2019 09:02:33 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v9 1/2] mtd: spi-nor: add support for is25wp256
Date: Wed, 18 Sep 2019 21:31:44 +0530
Message-Id: <1568822505-19297-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568822505-19297-1-git-send-email-sagar.kadam@sifive.com>
References: <1568822505-19297-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_090234_590576_0545704C 
X-CRM114-Status: GOOD (  11.85  )
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
index 654bdc4..003c1c7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1946,7 +1946,10 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
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
