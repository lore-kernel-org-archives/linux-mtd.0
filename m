Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD3FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E18F2610CF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E18F2610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQWqjM8mXOi5vvCm7edw7bAERi+rDaX5A7J8sZQ8ARs=; b=ls7lmavJVgJemE
	iQMkz/pgalBXxMkZ4uFTI3lPzEx0I1dIwlkFoZi/VwkejVlMrq/A1W67uuDyhn+6jqU3Rk9ernLz3
	wWpTcqM0CejkFVB0wg1zPwk/xgry3tJlykUTMGlJBoU7QXtqx4GL/z7CzQcpFgIw+gLZEOSmgdbdd
	nHXwu6prlFIumOjhRlPgNF+6nW+smwqEwixrYnekps1EMn2GN0EnnbdSzxQj65nMDluGDkJSKe68P
	ssnhPJw6gVRMAbVDJxPVqzJN23YGpC2iSKf9vGPxZ+KsTbNDkuuqgsGZvYTJRWxjFZL6Uz6lkg7gI
	dKyHaR/UxTkFb/sPn+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWE0-00Bhyk-2W; Fri, 29 Oct 2021 18:03:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfU-00BZN1-IG; Fri, 29 Oct 2021 17:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528472; x=1667064472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VmCd1pb67nRpl3ADwqjAbVCoLoCJzqK86FC9hZIaE3o=;
 b=RM0AfE15hN348iUZEZmDiYdGsTNIUoeRpEz+MZSCs4n2XcBg/ybnv3g/
 y9TDyIdN24pNpUs3o/kOlfP6EnpFQ91imXDNwKZobv+beaqV6AxKKi5VK
 zOwM8xDRy88fvCRyu2OB84F3i3S65r82DCxtJ4NLrwfnjGKfUd04mRX5x
 C4Oxt67NQiX0YrjQqmfdGqeXvuY+rVWNIfu4cz9CpffgxL9LXSgK4i7CR
 pyY3vD23bsCvMho/6Lizo1vdxfAU78mGVukgNDlmIE1rYu4Ek1NzNaDih
 uoyJpwgCf3dc+bEwwwttlTxWLo3z/wl9xohPcrlMLGKST1sEqHiU4awG7 Q==;
IronPort-SDR: euKcV8EKA4yZysCvFNuXMWgasBOSeTCAIR18npY9aM4Gld4Ek0aXFJqcpc8QpJVvdu3kvdMb2p
 vmRjIBbRmLPDFGjmboiiJoqlsd524YjXvQKXvuM5GeIgfn1HTx9GadT0/yhOrpIkmT/V+rC+jJ
 x1S3rTutiDfOe7Pip1s/Jgq10V51VcAEmulTCBNnXc7r3asLr+IGtOQRQXLRHJZlkG53AqgLot
 xt/1Nfp5DvSCT9MXK5Zj+vvyoJCcarQBKNW0qnQn5AwfB8fcuctTRatJp4I8WscrMe3v9cxuOk
 hilk3HsPYSt3/jRVkATxs/NR
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183612"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:50 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:45 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 14/25] mtd: spi-nor: Introduce flash_info flags masks
Date: Fri, 29 Oct 2021 20:26:22 +0300
Message-ID: <20211029172633.886453-15-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102752_672719_5B88FB4C 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Clarify for what the flash_info flags are used for. Split them in
three categories:
1/ NON_SFDP_FLAGS: flags that indicate support that is not defined
   by the JESD216 standard in its SFDP tables.
2/ SFDP_FLAGS: flags that indicate support that can be discovered
   via SFDP. These flags are used when the flash does not define the
   SFDP tables. Used together with SPI_NOR_SKIP_SFDP flag.
3/ FIXUP_FLAGS: flags that indicate support that can be discovered
   via SFDP ideally, but can not be discovered for this particular flash
   because the SFDP table that indicates this support is not defined by
   the flash. In case the table for this support is defined but has wrong
   values, one should instead use a post_sfdp() hook to set the SNOR_F
   equivalent flag.

Manufacturer specific flags like USE_CLSR, USE_FSR, SPI_NOR_XSR_RDY,
will be removed in a future series.

BIT(0) was kept for SPI_NOR_PARSE_SFDP (will be introduced in a
further patch).

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 89 ++++++++++++++++++++++++--------------
 1 file changed, 57 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6fc63ef4267b..1fadd0e74103 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -334,56 +334,81 @@ struct flash_info {
 	u16		addr_width;
 
 	u32		flags;
-#define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
-#define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
-#define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
-#define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
-#define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
-#define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
-#define USE_FSR			BIT(7)	/* use flag status register */
-#define SPI_NOR_HAS_LOCK	BIT(8)	/* Flash supports lock/unlock via SR */
-#define SPI_NOR_HAS_TB		BIT(9)	/*
+#define SPI_NOR_SKIP_SFDP	BIT(1)	/* Skip parsing of SFDP tables */
+
+/*
+ * Flags that indicate support that is not defined by the JESD216 standard in
+ * its SFDP tables.
+ */
+#define NON_SFDP_FLAGS_MASK	GENMASK(15, 2)
+#define NON_SFDP_FLAGS(x)	((x) & NON_SFDP_FLAGS_MASK)
+#define SPI_NOR_HAS_LOCK	BIT(2)	/* Flash supports lock/unlock via SR */
+#define SPI_NOR_HAS_TB		BIT(3)	/*
 					 * Flash SR has Top/Bottom (TB) protect
 					 * bit. Must be used with
 					 * SPI_NOR_HAS_LOCK.
 					 */
-#define SPI_NOR_XSR_RDY		BIT(10)	/*
-					 * S3AN flashes have specific opcode to
-					 * read the status register.
-					 */
-#define SPI_NOR_4B_OPCODES	BIT(11)	/*
-					 * Use dedicated 4byte address op codes
-					 * to support memory size above 128Mib.
-					 */
-#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
-#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
-#define USE_CLSR		BIT(14)	/* use CLSR command */
-#define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
-#define SPI_NOR_TB_SR_BIT6	BIT(16)	/*
+#define SPI_NOR_TB_SR_BIT6	BIT(4)	/*
 					 * Top/Bottom (TB) is bit 6 of
 					 * status register. Must be used with
 					 * SPI_NOR_HAS_TB.
 					 */
-#define SPI_NOR_4BIT_BP		BIT(17) /*
+#define SPI_NOR_4BIT_BP		BIT(5) /*
 					 * Flash SR has 4 bit fields (BP0-3)
 					 * for block protection.
 					 */
-#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
+#define SPI_NOR_BP3_SR_BIT6	BIT(6) /*
 					 * BP3 is bit 6 of status register.
 					 * Must be used with SPI_NOR_4BIT_BP.
 					 */
-#define SPI_NOR_OCTAL_DTR_READ	BIT(19) /* Flash supports octal DTR Read. */
-#define SPI_NOR_OCTAL_DTR_PP	BIT(20) /* Flash supports Octal DTR Page Program */
-#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(21) /*
-						 * Flash enables the best
-						 * available I/O mode via a
-						 * volatile bit.
-						 */
-#define SPI_NOR_SWP_IS_VOLATILE	BIT(22)	/*
+#define SPI_NOR_SWP_IS_VOLATILE	BIT(7)	/*
 					 * Flash has volatile software write
 					 * protection bits. Usually these will
 					 * power-up in a write-protected state.
 					 */
+#define SPI_NOR_NO_ERASE	BIT(8)	/* No erase command needed */
+#define NO_CHIP_ERASE		BIT(9) /* Chip does not support chip erase */
+#define SPI_NOR_NO_FR		BIT(10)	/* Can't do fastread */
+#define USE_CLSR		BIT(11)	/* use CLSR command */
+#define USE_FSR			BIT(12)	/* use flag status register */
+#define SPI_NOR_XSR_RDY		BIT(13)	/*
+					 * S3AN flashes have specific opcode to
+					 * read the status register.
+					 */
+
+/*
+ * Flags that indicate support that can be discovered via SFDP. Used when SFDP
+ * tables are not defined in the flash. These flags are used together with the
+ * SPI_NOR_SKIP_SFDP flag.
+ */
+#define SFDP_FLAGS_MASK		GENMASK(23, 16)
+#define SFDP_FLAGS(x)		((x) & SFDP_FLAGS_MASK)
+#define SECT_4K			BIT(16)	/* SPINOR_OP_BE_4K works uniformly */
+#define SECT_4K_PMC		BIT(17)	/* SPINOR_OP_BE_4K_PMC works uniformly */
+#define SPI_NOR_DUAL_READ	BIT(18)	/* Flash supports Dual Read */
+#define SPI_NOR_QUAD_READ	BIT(19)	/* Flash supports Quad Read */
+#define SPI_NOR_OCTAL_READ	BIT(20)	/* Flash supports Octal Read */
+#define SPI_NOR_OCTAL_DTR_READ	BIT(21) /* Flash supports octal DTR Read. */
+#define SPI_NOR_OCTAL_DTR_PP	BIT(22) /* Flash supports Octal DTR Page Program */
+
+/*
+ * Flags that indicate support that can be discovered via SFDP ideally, but can
+ * not be discovered for this particular flash because the SFDP table that
+ * indicates this support is not defined by the flash. In case the table for
+ * this support is defined but has wrong values, one should instead use a
+ * post_sfdp() hook to set the SNOR_F equivalent flag.
+ */
+#define FIXUP_FLAGS_MASK	GENMASK(31, 24)
+#define FIXUP_FLAGS(x)		((x) & FIXUP_FLAGS_MASK)
+#define SPI_NOR_4B_OPCODES	BIT(24)	/*
+					 * Use dedicated 4byte address op codes
+					 * to support memory size above 128Mib.
+					 */
+#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(25) /*
+						 * Flash enables the best
+						 * available I/O mode via a
+						 * volatile bit.
+						 */
 
 	const struct spi_nor_otp_organization otp_org;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
