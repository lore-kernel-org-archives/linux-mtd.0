Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C87CC3601A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFxwCZ79GNsoWraVMcGJFlwPq76Tlc6CS/VNR/Xhs0w=; b=XD2MYWDNtufvzY
	7X080ALyY+xVkWEmrkeYuuPQ+Kpa6PdOB4ja6OlcMgsho/aSXsyFJ9ezxQPXbQ2OiHO9BOTAZ3c1i
	AD1oFRLNhgYelbrHC7tkThxh1or0x01hznaClABKP0Cndz5twzGNK4EVzt0Pav2bdatECMQgc4SG7
	6fye9tXwQzQKsUVOIynubFGp9sGSNR16OTwjHbKKwTZ1m8mAM1Cwn3KJQ60hbuijQj6LUvM231sYU
	KfUWsJsSOvhDxX5I834FV6Tmrq1BGUek1TLIVq5j2jo0DtXEQJWhjzzo/5Pu7A3vfnLvgFq1/xfaq
	dxJd0l2lQ1j2xiKTbyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hVa-0000000GvnX-1iHZ;
	Mon, 07 Apr 2025 08:07:06 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hOU-0000000GuHy-0EBQ
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:59:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-301e05b90caso3811095a91.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2025 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012785; x=1744617585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKgfji2rqot1arhvUVR/iUE/ECdfszR0SrwjOA4/joM=;
        b=jrdpA4m2fNwkuAIFgLhXe9Plm8RwwRB8RrXoD/ft1iQIUVUxGUWhbx0M05sbA2Ptgf
         +fa2Z/F+ig9DrD8ANAA+e4ExCex3V3S/pKl8nIDDciYbhTaJwjcIzanNx4P1G77YyYC7
         T1qSizLnVSvDr9PG/IN8CDt0UEdJ3X/K1EQ1zQtup9Yq8qBCR6r8eZORTe61Gv2xk9QI
         EwWYBYHlGw+JorDvxYrQVN2Vq1YatS2oxWY7AeQVng7tNFr+uMZSSb4YUwf9utaeq81Q
         OOHKzEUQd1xOwspZk04NuNfpsZXyz7llMDePYSWMB+wX1kpnGM+VnH+4gsgM+zSieGVR
         EvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012785; x=1744617585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKgfji2rqot1arhvUVR/iUE/ECdfszR0SrwjOA4/joM=;
        b=ecS2zb2AlNkTV8D6X/5hFE+sndJgNhAcfe8e/RPbS66QKWFk9VNo+MA8JUT23D4CuJ
         27d4BnKIw/LCRmX4yI+Y+QBmVOH4OJ6sn0xa1nBudFmrNVVS1n4GppcJu9Re7BVMuwYU
         6roLxv+pRS7KRuZGTKgVQXRp4w3ozgud5WaDvzAwnRXrQbBOFUVMrs/RpoMsN1rC4Gsr
         MphRtRMjyp6gjRCqhBeMo9dQLQYYFlVsnTm0peKN8sIPcqgjLPfwA3+L3KzFGri2otHg
         hN/yuYqLIlGJJPa6xFex2EItRmnITqlsAFDW61lumIB2Yorh7uN3OhC7BczmH7g9glJu
         nCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbsJNSYVaEGmQvl6ew/bjpj080dRs7Hj1C+zSH6Xb/M1+vhwsnEQucKMEgcw65HGDH0nAyLTybyCU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1IVzUSZF+hLfVbtd5CA9JgCFwG831LJKYryvRgQJIE4DBref5
	57anSaEsV6urauH0WdFVfP+3E8bqkgzvFDPS4oHlAxRP+fZAL6fJ
X-Gm-Gg: ASbGnct4tUk+MaEnjqqpm1GS9jroyulO1DzXSh3LsS5ogdZ//u42qAK5dKDmkZk64/M
	bUIFQbAXxjtVkknKW0POYxBgJEW2hT7FhWo9EjrIdfJ5dBzBde6i2xTPB7vk3gl+SWYsP6n6GEv
	Hhlb7W6X0hSj1tWCyn2/nOnqdqJkvvrE8Y/HkbLZqxjWO1qqkVRedalFZYfLSr6+cBApNzReBwe
	YucD4TJ+d4dZHLH6+VRM4wVnar6dlso4zvCvStkKJW0QDUzqRQhK8KHjCZEJM6ySmVf5y47Ob5c
	MD38HGgO3CJWFT9tFGl5IfVfWkyv7UVNH/6saSgOEHqgb5xtP8BWS7fjAuPXdCFOI9zB3W85dhV
	+oWU=
X-Google-Smtp-Source: AGHT+IGlJh8P3H38GXG6VRpz+tiQXJCTK4jw+vQ6e4XstEhWqYS/COON931etfe/4WWR1arjzuDFLg==
X-Received: by 2002:a17:90b:5251:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-306a48b3f74mr14346421a91.32.1744012784917;
        Mon, 07 Apr 2025 00:59:44 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983db5f2sm8235805a91.48.2025.04.07.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:44 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 919A9801D7;
	Mon,  7 Apr 2025 16:08:41 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash info fields
Date: Mon,  7 Apr 2025 15:53:58 +0800
Message-Id: <20250407075400.1113177-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005946_092897_19C36378 
X-CRM114-Status: GOOD (  11.78  )
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

Many flash devices share the same ID but have different part numbers.
To avoid confusion, the part number field is removed.

Additionally, since SFDP already provides size information and
functionality covered by no_sfdp_flags, these fields are also removed.

Furthermore, when 4-byte address instruction table is available,
the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 36 +++++++++-------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 4b09e5add630..2acd8e28d1c4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -88,10 +88,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l8005",
 		.size = SZ_1M,
 	}, {
+		/* MX25L1606E */
 		.id = SNOR_ID(0xc2, 0x20, 0x15),
-		.name = "mx25l1606e",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x16),
 		.name = "mx25l3205d",
@@ -103,29 +101,21 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* MX25L12805D */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
-		.name = "mx25l12805d",
-		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
-		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-		.name = "mx25l25635e",
-		.size = SZ_32M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &mx25l25635_fixups
 	}, {
+		/* MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
-		.name = "mx66l51235f",
-		.size = SZ_64M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
+		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-		.name = "mx66l1g45g",
-		.size = SZ_128M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66L2G45G */
@@ -167,11 +157,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* MX25U51245G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-		.name = "mx25u51245g",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
@@ -185,11 +172,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
+		/* MX66U2G45G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
-		.name = "mx66u2g45g",
-		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
@@ -215,15 +199,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* MX25UW51245G */
 		.id = SNOR_ID(0xc2, 0x81, 0x3a),
-		.name = "mx25uw51245g",
 		.n_banks = 4,
 		.flags = SPI_NOR_RWW,
 	}, {
+		/* MX25L3255E */
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
-		.name = "mx25l3255e",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	},
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
