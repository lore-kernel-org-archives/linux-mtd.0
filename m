Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF81AD1D482
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccCT2yDfi8qWaCApG731iL1B2wC6g6AYbniZcesUuzg=; b=24tlBSL1AWW3fb
	p8CgKbgm6to0y1ZpfmeQ0yKxmF2voySox/6d9LlPRlWcZHM1VlyOlD/2hWX9M4mSR5WlTv8lbUk2M
	KDIAXCT4HgdaoJ96K2KRrGOwjAtz5ybrzz9WXlyKezmNr/4GiyVt/qnlR1H4MowAo+fgyZhF8ozli
	2VcXEMSO/HDF224TVmER2qG7U0qQMlOhfBbu4lv2WiDp/YFiIhqnc4ANR1ILEjrcRE95tpuK63hvp
	2WJHOTCsMkFY0F/Qq8PU72oi0NRfPCAqfi/7pTEVOFLHb+JjUDSCFKH4bQ8c6TB9t99sgvql9PTzA
	uYuew/uigiWQr0ygHwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtNV-00000000GrK-3hte;
	Thu, 08 Jan 2026 17:00:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMa-00000000GAi-2QF8
	for linux-mtd@bombadil.infradead.org;
	Thu, 08 Jan 2026 16:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wXJyxTh9zUcQqoOPuD+RgDBVRNZuUe3FPkKCommQgVQ=; b=R/TP+y5CtFUJZ11iOh72mkAMNU
	g2JpRo4ItyK4HAUcFXUa2CyieQo6Ac/md0ArteCzLFsyHKOufF+WLGdxrvkQFuC67YqS432eZiBQr
	ZwT1PTUCCzm4yxuF3OEfwM830NwpnbTzeskVS+JFhhJhqOf0jZJ+S8DvpdpCS8LtcxX3ys993uC7j
	qnbg0fLb4nNYG2NZ0CteCEYAZUGphjTVreQkvtwfOiI8BkzEZMMCSmstnu2z4MHI0cy6IhL9GrNTK
	MIiOvR6X8OnUIOq/c10Ox/IvCQtp90VPNpfhgZmHacd/1TvNOg98ZBYaSa+PNWr3RM0eRu/n7RUxj
	ATz77u5g==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMV-0000000DjgM-20E9
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:59:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B71811A2715;
	Thu,  8 Jan 2026 16:59:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85F2A6072B;
	Thu,  8 Jan 2026 16:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2F64103C86ED;
	Thu,  8 Jan 2026 17:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wXJyxTh9zUcQqoOPuD+RgDBVRNZuUe3FPkKCommQgVQ=;
	b=mEJDDeqb/jbPrF6UXkoJQOsGfgqLRBTNBmBXDtoBoIgn+4TAKsAPVsqIIcrQs7wWG8sHEK
	/W59zlpTdtbaJ0JdW+coJsi0k7J7Ec4zgS58AR1OqjguX+GDF8R6x8xzlaBmwwBq0uG0vS
	RR17Jx8Ehxhlz+d28PJ//I3hZfdx2GR4HmXBCq836bJOyTcKDf8IQyKsw9DEDczS5YS27f
	7uTqtRpr7qgDUDpHFj5YX6iWwoaidrNuh1IDzQUYe2bt31NXyog/4MKD8J2S4/KzevKa7X
	qKINk4FELT5g38+56H3mgFYejZ5RipGLUsEob9prKdYKiEXktCej3i8GN/pljQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:58:00 +0100
Subject: [PATCH v2 27/27] mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-27-c462ef806130@bootlin.com>
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
X-CRM114-CacheID: sfid-20260108_165951_589565_D5F56AA9 
X-CRM114-Status: GOOD (  14.12  )
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

Unfortunately, this chip also comes with an incorrect BFPT table,
indicating the Control Register cannot be read back. This is wrong,
reading back the register works and has no (observed) side effect. The
datasheet clearly indicates supporting the 35h command and all bits from
the CR are marked readable. QE and CMP bits are inside, and can be
properly read back.

Add a fixup for this, otherwise it would defeat the use of the CMP
feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25Q02NWxxIM:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-0fffffff |   locked | 4095
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-0fffffff |   locked | 4094
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffeffff |   locked | 4095
 0fff0000-0fffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffdffff |   locked | 4094
 0ffe0000-0fffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 72053a4505f9..639d72f48769 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -377,7 +377,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q02NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
