Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD448C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTjW7VZVAt2xaGBRyFu8eHaWRTq2cSAdWCsTQfYo174=; b=s8nyRJU2DrSGO6
	kW7APYZDfgrVWEX6mNYldNclRQAfMBjeXAGUZtFq1Mb+2XLCwymLv+rpOLhz+6uPKnDm1UD3dDTsk
	5JcpA5aP28lEROqev0F+B39BXzhuEkqwvi3oyVT6Q6XHexua/r/DpFRHKppAr6efC32XVY3ALEQU+
	yt6R0jfh5uQ6OoloTxwOjWQEnCB9bWYQklwnPwIFG5JhqRzdxtdlwGS4z6xio2vnHWFtJT1lBZ13w
	oK3AEEw23ilwBTV8fmC66TzbCuFM9i2kylusa8Ho4xjKQnyU20qa/b1ZlVfX0h/gxQkDzpZqLyAud
	wJPmEzIA+khQpuEEhoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZn-00000002rAc-1ND1;
	Fri, 04 Sep 2026 17:19:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZl-00000002r6v-1wfM
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KED0MtUcl5GYT48RhBLaFd++nMWLmV85SA49tSVm5h8=; b=ofT0EdlfMG87DeY287K0Iyxqu8
	8UPlG4SMjoZd7G8EeclNLmvi2g6s9L8xKHhhmDUKgDiASyMbi4xLobQoky2/2uRAaCJsXCJyJBFxR
	e5/8mHahY3wcjdG2271y0119eHvs+cs3AUuOeayYqyNjJ2WKpdqJHp+03/pnt2GgmfDBsJBIePAJP
	3vhXddMNgrf1Im9QN/jPPTQyUwBJYmp39l90nfujjsyxgiSlQnxdS3URy9y9LGtMT2Gc8/bI7sROK
	+cAw/Vm0dC1Jh4WvLaMcJ1dfA4LEPDXJNhxqokPZLGUQxEOQ6g4KhEH+lGIE57E19iY3qG8yvJnnX
	ydhaMWcQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZf-0000000EKv0-0f1U
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 855C74E41515;
	Fri,  4 Sep 2026 17:19:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A29D6057F;
	Fri,  4 Sep 2026 17:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A20CD11C79FA6;
	Fri,  4 Sep 2026 19:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KED0MtUcl5GYT48RhBLaFd++nMWLmV85SA49tSVm5h8=;
	b=iWCrbvE6xF0i20BkjWd2ho6xaO6UvN3kXj7BF3jfaL+PmMDL3FrZBfhfUWzn667C3Tls0S
	GeRm0X03aHCpgDCHQF/aaxQlR/FLNf8oUiNRrrMzICwE0niXyXRX1E4KSRtp9f+XwZVaU7
	GZJFOlllxukneCk2XFOe4nOdgGsRbkIAqZ6L86lkdDUSo0u0CbPg5h3RosbfBLyI9dieoa
	iXC/mjUt9h/jcewd9HtZxYD916B+PVb/c3sDlWVvc7O9PerkMEne1E3sprRq0X4GvLoJzQ
	xXeELCUDYyj39CugpPROmfp4tJ8Byk4Wdvt6img4ewv5qEO5CZHUA7HB56B20A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:06 +0200
Subject: [PATCH v6 13/26] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-13-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181935_430410_3F6DEBDC 
X-CRM114-Status: GOOD (  12.05  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs, add the flag manually:

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 553 KiB/s
page write speed is 548 KiB/s
2 page write speed is 550 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 1628 KiB/s
page write speed is 1600 KiB/s
2 page write speed is 1612 KiB/s

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
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 48b0bb643b15..f8f103296c82 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -321,8 +321,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
