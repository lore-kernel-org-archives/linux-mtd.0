Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4620DD3748F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Dec 2025 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0bkbxlO/7zlXgQLaEx+Mi74erPIkDQXHb6R9St/Bjw=; b=gm9luUpx9GoOrD
	3sJsCkQ2E8EXj6IoAaeFj6SNQh/MFpSJuF6cFQlZnzFklMzd+4M+6/azEoRAWv2FeycWkaTkyJMR+
	6qQt+qLB73EdBGpX6CRddetYYAuNcz7Jutw4e4d5UkZ9biI7N0SoJz/k9l3VU7NJ0pbAoEHc+1XBt
	SIIRMeDd/XlOYgoEPO552KiSYGGbhwSvw2xvf69n0PRdCpkawf6RIYDhTnvmiB46eqDHrUaZZ2mtO
	w6psabcLAbyDD0eTWC5HL66qna93gbFRcx7hCkz44Uo3lnlKoA+2hTQzFMF3xUG01WCFH94BlEPqD
	Y9OJKmMhW4XGwD0uKuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbec-00000009xKP-2kSZ;
	Fri, 05 Dec 2025 19:39:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbeZ-00000009xJa-4929
	for linux-mtd@lists.infradead.org;
	Fri, 05 Dec 2025 19:39:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B9E714E41A73;
	Fri,  5 Dec 2025 19:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86FAA606AC;
	Fri,  5 Dec 2025 19:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7219102F17A8;
	Fri,  5 Dec 2025 20:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764963580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qGBKhT3RNIHcjkZ9EmczMf85mf9EwSENJtITDWUwMNE=;
	b=rwfR0l88X+RfLeOIGJQ8PprYYUukBuV8926iW1SSP/RE5++dAcHwq9Z1T/FaWQmbrQutGz
	aRubIFfOLGVdHv8hTUByo2ygcNrgQPSPF01zV/FDbdsFozAt10b8J7r+HIa+O+eGi8KqGp
	mIlr8JimntwKvSR5hqv75F86p8CkeTPTDkQNv/wB5jHkCxNRFxqBpg4Wepl/TJ7UvaIiGS
	Z/NatzKyehSc8txDt73ytaNKr5xYMhmJWiPgZLMz+mgY+1TAhuFcbc8ZXIg/Qm3I47ML5r
	z1jb8gqDW4BJN0jPYDnOZs+I9CYc+lm4S0OC8FaZOOyCZOrI3PgIL11bk0HY1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 05 Dec 2025 20:38:52 +0100
Subject: [PATCH RFC 1/8] mtd: spinand: Drop a too strong limitation
MIME-Version: 1.0
Message-Id: <20251205-winbond-v6-18-rc1-cont-read-v1-1-01bc48631c73@bootlin.com>
References: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
In-Reply-To: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_113944_165536_87A38188 
X-CRM114-Status: GOOD (  14.61  )
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
index 49ee03a7252b..f19150740979 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -788,6 +788,12 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
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
@@ -870,19 +876,6 @@ static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
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
