Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52790C55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0od26ZJsUUvMKNfhQ2npKGPo0ROwCd6OEKG0GOxbf4=; b=bCFl1laI0WTJqK
	vxwPHn9IIdu/e+Nn9SXR68loeDOdO8f+SdDwuYJ4CNK1X50aYMPc8CImFiV0MO1ke2j3Sa/YvI1Dl
	OBkoUH+6fqhra/dGK0m8hGYAEk/4QS1crAjtFxNwgsBF7FKd+MJ3mwI7rIz0G6F8EGpZeJ1PF6dKV
	PA0BbZg9UFt9acHbmuOFoT9E1/844JFGDY980mbd7HcYVVVaKmb5E375Rom9zrcuZTiJIQRoROP4q
	geGZ56+KZaHVfMdrM7BEc7nm8KZuvAO64sS7gsgZlzUojhR0pHMFu7RsLuiFcq4xvf7KBCSz3qYII
	vPLE/L9KS7fS1Sq7e2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsg-00000001cJn-2M4L;
	Tue, 04 Aug 2026 11:00:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCse-00000001cFT-2UxX
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 11:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2efJBaCayTywqP4Hq/HYu2FRsCV5fb1DWh4ZIBYfC1k=; b=n/jXPFN8Ur9m8uEbLhwcp7Xrtt
	1+z1czHWXhYWNcQhTuVAIQSkeZ9qwWd87sRr8P2dtSEwaOBQZ+X2QyInNwG7k2dJmKLJAXcXZpAI6
	u/xfrH54qMqLpXk3DXNqvni1EWGgZLyNIF8zgl9+NoLT78IHVYcclS031Kvs8kM0T2t7EvHHWRcq0
	bG9IWC2LzzT1tU+4YCyz6njMAgzEs8mOZ4kqiJsYPvmrygDjdnbrrfV+X55PeU5WTYWxTivM0A9O1
	vlKg4+2E2O64ag1lOZsnyo33KkQa/uC3UaS5WpdYYLRo1TDALQ9q3BreO0yyEd8JCuJNP51X2zJ6s
	jx/9vRdQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrCsZ-00000009oYP-0Zjt
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 11:00:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 55B9B1A1404;
	Tue,  4 Aug 2026 11:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B47E6029E;
	Tue,  4 Aug 2026 11:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66F5811C3046B;
	Tue,  4 Aug 2026 13:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2efJBaCayTywqP4Hq/HYu2FRsCV5fb1DWh4ZIBYfC1k=;
	b=baSRbXPH6XoX368MCYPCZT2xkA7ZwEgNdwLmRjOLgJt85oFAoKAMw3OnhAlf/bbV2m55Ei
	jxS20rE9EH9nctUfcjqZdYb05SnlMozuk+HMaiP0l+c554pM9uszf1odJ9u22wTWpJ9mcK
	TXQbDK0Q2WUMbAPBv/0aqCedxaKCLMHGU7oAH6MuG5UxYEXNRsZvaN0s+iMDsmK0x1zvLF
	oLqGSVDvjN8fFg079CVzrX/dILFiO2SwOuBklMJH44xeOUwi1p1nTjxlAbzwqKT9Gbfvmv
	EyWLH74J9uDSdP9DnMnUFpBv+6LOnNaFxq6Y/ngzWFld1/im4KQWBJ29UBvaQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:09 +0200
Subject: [PATCH v3 11/27] mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-11-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_120017_890171_B459B623 
X-CRM114-Status: GOOD (  12.93  )
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

The benefit is not massive @25MHz, yet this feature is not advertized
because these chips do not implement the 4BAIT table. Flag the quad page
program capability manually and earn a few % of write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 536 KiB/s
page write speed is 532 KiB/s
2 page write speed is 532 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 552 KiB/s
page write speed is 547 KiB/s
2 page write speed is 549 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_read
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 15df3cc26fbc..f7cdbf1a56a5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,7 +217,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q128_fixups,
 	}, {

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
