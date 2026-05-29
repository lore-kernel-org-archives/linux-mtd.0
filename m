Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F112CD6E52
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HRJxkaPPz8BF2GgOR2kAC/9vt9Lo1/WX84/0U9OFL0=; b=lo4UAIETllOXPT
	uvpPI/9UH9DP9Kd2UPW/OJsv5CSh3w0a5r1c4kCBtlhV+FWI5MJ5Ep1EToKyY4LLIwZ93GVQT2sIt
	8PeX8U2HmeTTqc+NHpNbdKzd7Zmq3pjFrSVM3EFJtp6pcE01vGEDKDxJP+MHpsPth9GpDYLEe/oFv
	De8zq8ntWOTkkEzuKRO01fs4A6W6ah6Sit00a9xoJkAvNjSNWF3dXuItPZSWsjlfdrMT8NX0Vxpla
	Vx32gi1QKylUFRzHv1Kde9mL+9QUVTK3K6Wc4Da9ZbtJA4AApuvL21Cno0IfCqpX8vjRl2MWa/PRZ
	rv0z43vOLZhrDkdOzNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3e-00000007gK7-1bWF;
	Fri, 29 May 2026 15:23:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3c-00000007gF4-1REA
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 May 2026 15:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qVylc6gaM79n1hJEKNT6a+57VijXLpcOysJ/GUKa3jk=; b=WV99xIVYYPaXYtC76OIgpk2JI/
	EkzyBmaANx+IS5QaQzXDrWyGD/TQRGbU8AWdbKgx9OiW4nXIJAWtEF0wvT/XBptjbRhssGnAF4SLV
	HINWZa/ygPgi/RhOOzZMd6TilxOxS07upEFIgOCpupAT8I0Gkl3X8kPEfb5VuCP7fX1YJvNhB1NuN
	D70ST+5WuH8nPDd4Y+2zeMOVr6N35nrTXvRQsbfqQEk0qjSMlb2knWKo/RqV7fPbByNUjDtTNFNl2
	g2Yb0RpcCqybK747uy1tsf509u7w/uEQL8b38BFbzd7G+/wMTQOCW5OTEjRik5LcODQ0RGgK+4XN3
	qrRsmQig==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3Y-00000006L3n-2Krw
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:23:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E45E24E42D8D;
	Fri, 29 May 2026 15:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9D86601FA;
	Fri, 29 May 2026 15:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 992C310888CE9;
	Fri, 29 May 2026 17:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qVylc6gaM79n1hJEKNT6a+57VijXLpcOysJ/GUKa3jk=;
	b=hzWoHYrV5WIdHRskzjeXRDpmYQs4r4Iw53DLTIWZs6V2PgBEu0JzvDopn+trK8ZjQcP9wH
	PQKQ77r0LUt1IDs9KBW1CQu5Zldbg/9FcLB10/K5SU02/wXRQnrKeFQx21djZ5bI69p46b
	2RwEVlVHPreEI7Eg1pLxTN0E1hLlekNZM97vQ5Dh+Cn1QSht3cq8jr3q8OipDTK96AkbXV
	LRhm3HgsVnuGthXpbRPibbAc16EcvnBsVUswx0xq52X5NSGFuco0X5OmNqCxqvWzko+src
	XAZO2MwDdhArgxcjqbanu4Of87F7YkAa5GQJ2s0Z82GukpRW0qSXvjOdtPlWPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:48 +0200
Subject: [PATCH 28/30] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Drop
 redundant data
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-28-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_162328_857185_3311F8F0 
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

I do not have any W25Q256JV-Q/N nor any W25Q16JV-M chips in hand, but
all the other chips from the JV family have the same SFDP table,
correctly advertizing the capabilities which are redundantly repeated in
the table. We can reasonably expect that these chips follow the exact same
rules, so drop that extra data.

I am on purpose skipping the W25Q128JV-Q/N because there is also a Zetta
clone that seem to share the same ID, and I have no idea how this chip
works (add a small comment in the table about this).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 1e5ad4e3ef7a..c1dbdf7610fb 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -212,12 +212,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		/* Zetta clone */
 		.fixups = &w25q128_fixups,
 	}, {
 		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -288,9 +287,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
-		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
