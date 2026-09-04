Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0806C79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPwkwqCBwVE7ZsNiksRi55teBdGJE2lNqA7lyc3/W1c=; b=l7irBWJVOAIzXP
	HSkvqk6irpeCy4x2a3ooWnQKjV4vSDcS5qNuNG3wQlDoGXoaBJAO1J7b83i6JT43u6dFFSRhBAB52
	0nBGUFkiEVfjcWa/zXSnzQaIHhL8w2nQh3/ebgIVs7BFXx4lBlIeXpDgMc3uQlFSscGmnQmm39rDX
	52OqR/4fN19RN08RmMTAZBLrclYWv2vd1ELyx59grXusD8Av4zy2UXF7Mf9ENzWIZKBj9ZQsvae0b
	CzKH6Xh3QS+ETDudPUZW5HtxokvuoDTY7GWqC+5+i980o6IOsr3YSvQhTUbeqkIwj1lE5yfRDtmEd
	T0YWLONNSA7Zk8DIsv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xa6-00000002rcc-3xVJ;
	Fri, 04 Sep 2026 17:20:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xa5-00000002raM-3JrY
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Lq1oF6KvN3o6KyABQZtGHFyblhr1uPysODE9IBEw114=; b=aqI6elHxgZd9ij1ymaz9DqksDs
	Gq5YuoLGobi2C7rXBZdn2XlRogkegegg0H6w7p32RXpRAOVjTuqQ0vIv73twxZA2nhaBhf7tDozW1
	2IKgD+Se2QdL8TxDVn8Vaq/B+VQ6C5bUj4bokxhOGs4vTovakNCCVbeL9fH8MyAIegJLEnScDZQOV
	y7RN1hsXwW/zWvZnG0oOzT9wzSlM1oiThsfadhAgp7Z+qbsWjeq7s6MgUwkXsDzk4TtBY2WShHX/y
	VfQyqR/WUwTBq4zuSpIWwnx3OcQcqT/GsFCTDl5QzhklcpWoEKw0hfwB8G4R2YdOWsmlXfvZGOk6g
	VqSW5m0Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZy-0000000EL4I-3LDs
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:20:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 219284E41518;
	Fri,  4 Sep 2026 17:19:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAB086057F;
	Fri,  4 Sep 2026 17:19:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44B7911C79C68;
	Fri,  4 Sep 2026 19:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lq1oF6KvN3o6KyABQZtGHFyblhr1uPysODE9IBEw114=;
	b=aL0O9QQzZ7uNQ3HB2/MTRGXxBmPXVSLWEE76DHWrTksJ2dwlPaNm+LnXsKm1B9kFXzDQym
	1E9+nNJs64+o2niWX3Gy3HkvGTvNZJsvBD5SwPDXzdNAVg1ud76+qObFMydXrt9NENAOxR
	ZJfXKvuP4Wthf5Oly/t1QnHvgtLNHvGgDYHrsCoAhT2YKwjPEJUloPv6TEg/kmz2KP5xnn
	jSknlfRfsBYQVCFlzsLlWSZNxyJfJo5mQ2bJiBLbHytEQI6Y+0a2MF3aArsAHkTd76XV0H
	uf5mpXa1eFO3qjioTEco2rYdtRY0g9H+ReBcmAksJYRvX4FUD4s28PqBC2q/4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:17 +0200
Subject: [PATCH v6 24/26] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-24-bdb282f42a47@bootlin.com>
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
X-CRM114-CacheID: sfid-20260904_181955_851533_EA7BC0E8 
X-CRM114-Status: GOOD (  11.06  )
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

I do not have any W25Q256JV-Q/N/M nor any W25Q16JV-M chips in hand, but
all the other chips from this family have the same locking pattern, so
we can reasonably expect that these chips follow the exact same rules.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 0c854c975eb6..90fe9617d784 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -226,7 +226,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -306,7 +307,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
@@ -332,7 +333,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
