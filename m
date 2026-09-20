Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8978C982D8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVn1NweoNNPnZT3ddj3kYjzea5eRNhlfwU6pN5xN0jg=; b=jqOOZjN/fCRl3A
	PEC3n/5LsojSfg7DgneL5gnt1JQ65bd2mvuEfyw59b7s8g49pLSLAanAsCgse2lB52rzzrRsMaAgI
	mYxJY4X2Jv6IKB2983Z0YvG6/qYdj6iQKf4CoRDZiJve4FVskzMO9YXd4sCnIwqIa7jM39eDmTxQh
	S/zT/uQSq4QSkc5TUsy92wFt1VYDuqXG4U9YnqoUVtcwLmZKSJiCbhSvDgvk7o67RmX8aAdnJV6tU
	+IG4L4QBfwpBxwQK/tJ8k6WjKxgNQebGMGN/sgTK8+p1Qen2Jqq/NUHMNasWbAcmz8tP0pX4iYgXz
	/QO9bDQJv4ESblaGCDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6A-0000000HXSh-1XL9;
	Sun, 20 Sep 2026 14:00:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I68-0000000HXPR-0se0
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:00:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C6D9C51468;
	Sun, 20 Sep 2026 14:01:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 851596033F;
	Sun, 20 Sep 2026 14:00:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E971103286A4;
	Sun, 20 Sep 2026 16:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JX145afNqmwx7gx0nctZs7OY5qzDSHefsh4nXWmrx18=;
	b=lAzEajqarAZndx4d3hJRHLAtdq+dnpFisUDKuuGCXcw+SvoHGt5SU7H8+VxeHiHmnNAmE9
	RRborJfmpf1dA9wF3olECPJEYCoHHIQhR1ML68HY6JCyyVyYQt3jBXg89KZEJzRdxK2cn7
	q7EHD6NS3ZkZX5IjnNfTKpdA6yREb5sG12x+HqA0NZsorwjfYMrAQicrEE8nmB1EgtW2zx
	8FXnSk30qKdbyUWoRNc45hhwAJIzUed+3Y46QkyfYNn3SyeB2XSyr0OAlcFBWuczhR1hCN
	2U4lRllMqQUoBtyyzRW6aVZXlYyGVvvSQBjH+Dd066n0/yQsCYkg6H4FVvEy7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:18 +0200
Subject: [PATCH v2 09/25] mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-9-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_070052_415600_06E3BDC6 
X-CRM114-Status: GOOD (  10.43  )
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

I do not have any W25Q256JW-Q/N/M in hand, but since all the other chips
from this family have the same locking pattern, we can reasonably expect
that these chips follow the exact same rules.

Add the missing CMP flags.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4ffc7a39ac6d..62f69e868d7d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -348,7 +348,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q512NW-Q/N */
@@ -441,7 +442,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q512NW-M */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
