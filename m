Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43E210A88E7
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6s0/e4spWsiZYvPvQZxOoQPjavY5bgpLhFj8tnNVX4=; b=FUQy0fsFa0oLFD
	WRndK/YC1JmonilPwlABp6rnoVE3WW8HHZsrxqOYe1yNUwRkPexIYz/skiOqQG7ds2USgvsVn1fFd
	okV9q/iO0pign59j1kWmsNPqgCbNeglpDeVzVauo4vjFitmlviz+EQdUbia7RO1hiEMr+Pl2gicPX
	6H2S38TT9KV+cO/r+Sk72ZHQ+uiRITEIRQyR2AKHf/0d97EJcki3hHajAjg8k7w0BHteFX1O6UtO6
	PSM1PxChJA25SXVCbtZxr+hZf0WsaJ23p1AtV9WiX7CQ1CMWNRel4TD4n9ejoo3dc7hu1iVsGW66l
	9L14DbsojdcfT1BxaFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXJ-00000005qcs-0MMg;
	Thu, 26 Mar 2026 16:26:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXC-00000005qYM-0ADG
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:26:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CAAA31A3006;
	Thu, 26 Mar 2026 16:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98B90601FA;
	Thu, 26 Mar 2026 16:26:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF69910450C89;
	Thu, 26 Mar 2026 17:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774542367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QHp/XpnDc6VCjq7Z0fA22iB0i5XtlmN2AieaCNd4Ovs=;
	b=IXFbR8p6lsJT/2f6E3hDXOp7rvLkQdRT63ruqh/UP9hGiIBruK7rTY1bsyi2UK9A2zAFQX
	iEFYEOrDZ2e4P9wAal/136ejBloxyx5cQXlp62khWj6gyOhNl6ef0tbxVYA/b97P4RtHFc
	omhzZZVanMUzBeeruhIhKZzHe5dQHZjrC0WMgolWSXV7Buu9oWraSlmHm6TYXijPraaPTz
	MC/ao3fMtnzduuP9HU7aAJW+ot4v4mgTyk52f056ttWYMYng6ITUx60PFyDnU3z7TJGmv2
	Wa7bj+Iu9QOiBEpXDilMLrb8FkQNOMe//So9L8wMcVqkABE7UQKiYrMagH17Kw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:25:48 +0100
Subject: [PATCH v2 01/11] mtd: spinand: Drop a too strong limitation
MIME-Version: 1.0
Message-Id: <20260326-winbond-v6-18-rc1-cont-read-v2-1-643de97a68a3@bootlin.com>
References: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
In-Reply-To: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_092614_213891_5C565C21 
X-CRM114-Status: GOOD (  15.13  )
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

Since continuous reads may sometimes not be able to go past an erase
block boundary, it has been decided not to attempt longer reads and if
the user request is bigger, it will be split across eraseblocks.

As these request will anyway be handled correctly, there is no reason to
filter out cases where we would go over a target or a die, so drop this
limitation which had a side effect: any request to read more than the
content of an eraseblock would simply not benefit from the continuous
read feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 66c90419f6d5..fba3cc213c88 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -878,6 +878,12 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 	 * Each data read must be a multiple of 4-bytes and full pages should be read;
 	 * otherwise, the data output might get out of sequence from one read command
 	 * to another.
+	 *
+	 * Continuous reads never cross LUN boundaries. Some devices don't
+	 * support crossing planes boundaries. Some devices don't even support
+	 * crossing blocks boundaries. The common case being to read through UBI,
+	 * we will very rarely read two consequent blocks or more, so let's only enable
+	 * continuous reads when reading within the same erase block.
 	 */
 	nanddev_io_for_each_block(nand, NAND_PAGE_READ, from, ops, &iter) {
 		ret = spinand_select_target(spinand, iter.req.pos.target);
@@ -968,19 +974,6 @@ static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
 	nanddev_offs_to_pos(nand, from, &start_pos);
 	nanddev_offs_to_pos(nand, from + ops->len - 1, &end_pos);
 
-	/*
-	 * Continuous reads never cross LUN boundaries. Some devices don't
-	 * support crossing planes boundaries. Some devices don't even support
-	 * crossing blocks boundaries. The common case being to read through UBI,
-	 * we will very rarely read two consequent blocks or more, so it is safer
-	 * and easier (can be improved) to only enable continuous reads when
-	 * reading within the same erase block.
-	 */
-	if (start_pos.target != end_pos.target ||
-	    start_pos.plane != end_pos.plane ||
-	    start_pos.eraseblock != end_pos.eraseblock)
-		return false;
-
 	return start_pos.page < end_pos.page;
 }
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
