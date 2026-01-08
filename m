Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9563D1D483
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxntSUJr6lp/ANy4lAx6DR8tdnGEOW2woJlqos0mDIk=; b=WLGaimc4wziwTL
	ZG21zClSJyAZeLGpRCQRbSBrFz4EzUBeo0+4Vb+9Tirr4G56lQeOMVsWKGBVp/fMXvKvIbHGicQFn
	oAJMsCm07Rw+BqmoSinn5Y7CGmUvJuBwndVnyYcMoKSKmwCFx2mpbEfMF4Ep34e8ICarm9uALLmZE
	dBjtUBh0s50NaudUnMHfbR9CovfjyiZUpO4NSaoskWsd+2PIDvwOLcZ7wVY5bZ5G4lnUiC/ivmw+A
	GjUD6+Ztm6AziwyEv26IDClyWQQMST6/xE2njvE6g1csCCg3Eu5alZiPaWf3PNs/Q86rfsPIow4iI
	V8hmZgWnr3KtuuPLYIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMf-00000000GIC-20fH;
	Thu, 08 Jan 2026 17:00:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMM-00000000Frh-0kIt
	for linux-mtd@bombadil.infradead.org;
	Thu, 08 Jan 2026 16:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3UTw9aN/2yCK3EvGO8QBuf8zar07N1b/IrNqKvh1CgE=; b=iJMYSAj8BhJPMzD8wKE+yAETFL
	hpY/1VezjCz0m3/ykUooryZ3vd0tPyU5M7oSwGXe8KRkTXHP2Dy+koaN4Y16Izf8rw0xFNUg0MZHp
	rjuFgjh9LNE6OcL3EgKpRDPO0EgAp9+jY+xETrvlXS+nlWc3LRZLx6TsS0UCCXsjoq90szEgM2LYA
	s+QxhxnfOtd+dAfcmeRjuNYC5kuYXa7LAawYiQPk27HTtpSiLa8fkZyt5XW+4lNSz85/WBSA/emJ+
	AH5NIHMm38dS4qsgzvXnXA+pOIwWj4eB35q727VLs/zLb3BA/fVtEwj6Olm4wgQkLyCrJC71TvhvE
	Qr+MpoZw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMJ-0000000Djc1-02zZ
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:59:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68E504E42007;
	Thu,  8 Jan 2026 16:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DBD46072B;
	Thu,  8 Jan 2026 16:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23666103C8824;
	Thu,  8 Jan 2026 17:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3UTw9aN/2yCK3EvGO8QBuf8zar07N1b/IrNqKvh1CgE=;
	b=Lp+DL/33QEXrIt/JPKUVsroCGNq5iYZJQUUyT2ND2SBgJbFBtwhMrDCtQfopkVADcgdVIF
	baS3wb3IbYW8kehAmbz/4YD+b/Z/yjsXMEjBpKQRfLsD3pFvvokDoW+BZS14wzYl4KN538
	0Je+/GH7YMk9AOQ6c6XN82a/+hoE+BpltphzS45TK65d9PKd3+Y6pL45Iy2Y4khJyG6Eoo
	kCOM5Vzt59v8kmAEUxsyJEIrAwrzEZ/+ZNn4LGmymhj4D1RjuQLO91zrhxleAHchMi26nF
	MZF2T0nFYfdqk4zfWDRPBJ9uuI3xc+uICy6tDoylR9FgwdOZlORY8fxDNcX+7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:55 +0100
Subject: [PATCH v2 22/27] mtd: spi-nor: winbond: Add W25H512NWxxAM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-22-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_165939_189279_6427B667 
X-CRM114-Status: GOOD (  11.96  )
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

This chip has support for the locking complement (CMP) feature. Add
the relevant bit to enable it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run following the freshly written documentation:

$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-03ffffff |   locked | 1023
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-03ffffff |   locked | 1022
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03feffff |   locked | 1023
 03ff0000-03ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03fdffff |   locked | 1022
 03fe0000-03ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fb855fe44733..7609dcc768f0 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -358,7 +358,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H01NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
