Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BAEC55ABA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZq7LMoVDp1s0pqXHQ538T+F6HgXhmA8/xII9BSfrio=; b=vUKOXsSQJNJ+Gf
	OawhPmTdTANmtv6xuq84mxXUdBvY/1X0eAK2clZJemiUqEKCZ18RvgW73Gzn0TKtt6MwyBtrZA39i
	JI1olZdyiEn0AJagzzfpEvEnOp3anlpdyBT/Wnw3CO+y5GzXdfnEZFGWRzHq7AlBUOs03SlL3uw6o
	Yh7a3Spe1FFQ1Nj1XYaFv/k8CTYyddHvG0skaIdXnODDNaYxT5FGU5lK4blATSc6yj/H9IiqDPmi/
	3r3wqhdtMlaXmMnMqZOrxUyWrUKeD3RSHXYzhcAxifX6F9m02LFQFds4x81ujihWXeDgzrPBj1600
	Amkr+8Z8B9VGf+rITz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWbI-00000003TXi-0zzZ;
	Wed, 05 Aug 2026 08:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb8-00000003TKh-2LXR
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Aug 2026 08:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5Z2fZ1HsvRf2oJCPhM7cvSNUBhizZXIjDtniecho4UM=; b=iDROMMPvM2dxBoMrlaxWiW5mxt
	Pg/xcvbTVAXlTnb11cry6Y9fWWN2JIKvF4zkBi2+KNlMA7gwyVNROqO5W2vkWrEA15OUkp3SOagfm
	CiRpcjh+EIuJ3HdvJHylw2hi8j4IAwP6eZi1FVal6qf7sKfF0+trLxvfl+4lt7q/vE3h3g3tGGkau
	c01AiGKt/42DbUm4539GokHh1Dg/UPaHNhg79kBFOo6bP87vH1c2UjbX+o0t+4LIGU7u8tFBnJPZf
	L1PfmgmvQ7SkmShjplyf8bKzFBx/WaxL1Y7zEafndr2mN9RXOGijaEm92ErIPbhkXZuO1ljItdL8z
	b1LTNnHw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrWb5-0000000AYu5-1sEi
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CEA484E410F2;
	Wed,  5 Aug 2026 08:03:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4685602AB;
	Wed,  5 Aug 2026 08:03:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4CC711C3436A;
	Wed,  5 Aug 2026 10:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785917010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Z2fZ1HsvRf2oJCPhM7cvSNUBhizZXIjDtniecho4UM=;
	b=Voe8Ya9rV47vJLZ2K165htFSEJC1v+DBfWxXugGWZzT9JilrRJ8+kBrUNYp4F6lDnRiaHx
	XoSiWW9446IBxn8Lf85YmGJebENJW4cFVoQVe9ArdXluPBIRukxwVuoBaX3vXwtjjMG3UB
	RvnltSuu9uP/R5HVUo3W+i/2jhM4dRQPBUjMoF6KO0Cu8A6ZGggCydf+LOPx8RYYIZJUHT
	BBtSjjaSAkc/YoITwcCJkRnu+Wt6hWf6Pnst9INKpxEo0RfZNONsJpFl3EtWJoBYJsIg6E
	LrrOLu4h1TgN+mPsU71lnd3nA9zXnVgNMoNFAiLq8rlpEc99OO6NNV5Iweg3aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:51 +0200
Subject: [PATCH v5 26/28] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-26-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090331_633861_3A2B9963 
X-CRM114-Status: GOOD (  11.42  )
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
index 5ab7f4860295..6b21fed74f4e 100644
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
