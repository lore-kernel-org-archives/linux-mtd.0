Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A69C55822
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEDZ7ngZgh7hEADs4yIAv5Y7bNtfDvTr/fmkl1KXkCM=; b=CgH4pikMho/pqn
	m1J4IuFhKP7KUBP322DtU4PuC4jyHSo9rhStElANFHZql97lkYBW5XW+STIxs0J1BQTRTPNd+VGWA
	YHilMHdvbxIwSpXvWxzWXrOBihVBAACdZ5ybV6vh3Y93kcL/h0mZQK/Gy3P0SIdhRnnjNxLGGYvHa
	+c/cM5/wMSp9ljdYhOSjwc+byCsQMMyIT8ogBD6f9LI+Epc9Fx1JipWBC6FVaMPAYdAcQY3vbca2R
	brAgNDhmCg3Xs4wvVrOgTZ0IW4moLlmXPNPM9AuD1WDmXba8HHo/wFOzdn+oxTMnEn/FZ/Nogrq8k
	kmNQW4UDDrZ7MLAkPQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFmz-000000021IR-2E3o;
	Tue, 04 Aug 2026 14:06:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFmy-000000021Hy-06JV
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=IECokdCzBsVUak0E3TMA6f5ekz6V8zS7sl+yPDFgG5g=; b=iNbkyFuf9hmI920D4XeO/mnhZJ
	XMnia6JpNh9YbAQEykPmgxcUiAbPjKMPj59IVVZ3tiVn6UelC/WEV8oSFMSZw07mtEoUgrNte4uEx
	ku9u0wJmeXYV1X6vStuoGPanF4Q3vge0hyxVvtUMWyTNXVwrKIzzYzwkpMdl8HcTcXGhsqCW8MkS5
	WnnbgtF164PqJ95m7iA7HIVmDEuHtKdrnkFwiIWmjTnltptCZzuAFXL79owRYXbHA7KVd2js99khv
	0dG5vF/Td7bxvF1OggQ3WX+JzbpHY0M7CqnsUio1c9J4TDZP9MVumIefz1eRqGlt4+r/Rtylj/9Rk
	3p/9nwSw==;
Received: from [185.246.85.4] (helo=smtpout-03.galae.net)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFmt-00000003xhb-2Jx9
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:06:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF5524E410DE;
	Tue,  4 Aug 2026 14:05:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91E3B6029E;
	Tue,  4 Aug 2026 14:05:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFAF511C32D27;
	Tue,  4 Aug 2026 16:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IECokdCzBsVUak0E3TMA6f5ekz6V8zS7sl+yPDFgG5g=;
	b=ykbvUZ/rpFAu2/15YY6cK9kbZQ3q0Iy50OjCSnKxxY0YXi0fpp4w9Q9blrgZqVHaspkFSo
	uICXuG6EvISD6Qq8G6E5OroIw/NtlVOPnarqn780DVcgmvuCYoMUA0x+2CsnGte4/qB7w1
	HvLZsr7hjN4IooAiayThRLV1DuVY2JQpNI3RTaLRnxU5vTjAlWYpnmhXTadelIOXGrqip/
	wkN0mnNSYZeDfvsaohJfI7MwOodpQ1Ei7uw7jayy3UqrmeRfLHPA+INOLm37sT1+xSD1sP
	YCKIFDnKl1vRRiE3iCoYXpboaZ50fXY+xz69Vvy3XL0RaX6kyTGDmi2fm8Ciag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:41 +0200
Subject: [PATCH v4 19/28] mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-19-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150635_655799_543D9631 
X-CRM114-Status: GOOD (  11.99  )
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

The SFDP table does not advertize the CMP locking capabilities of the
device, flag it.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $ss $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 1
 00040000-00ffffff |   locked | 63
$ flash_lock -u /dev/mtd0 $ss $(($ss / $bs)) # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0007ffff | unlocked | 2
 00080000-00ffffff |   locked | 62
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00fbffff |   locked | 63
 00fc0000-00ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $(($ss / $bs)) # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00f7ffff |   locked | 62
 00f80000-00ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8fab520627bf..5a80de959768 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,8 +217,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
 		.size = SZ_16M,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.fixups = &w25q128_fixups,
 	}, {
 		/* W25Q256JV-Q/N */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
