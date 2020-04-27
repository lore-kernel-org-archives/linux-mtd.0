Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF87C54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4216E20661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Woh2vlKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4216E20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/RZNMx4gw9C+u5LWXTeMA7NzUYaimq8Kw3n282BIjg=; b=Woh2vlKu0xhm+7
	cMuYAk+pWwBFNkoXJFjr0CeEkHxTl2oQ9n73T/hEUXa/O9AKJU98tM/91QqDIZEzEQOxQDFwdUoQr
	uLM/iKql60cMePk4fsClM449i36UErH6K+aW38Bcr/RtPloogGamakia/ff3LZ7c0SWbVP1Ybx7NP
	yEkIvVusvf5r4+uCmS2BQ/OtEOsXHBwpJoL0DOhgRSb9O7mo0Ys7qY/D+6fs7sdKCZUDnLI4OsiUU
	yQ/4kXaK7bTvX7teQyLXZT+iXGyc/4gLPNufJmhKms+LD0DtHXptZtQ/uvZpn3m57sskwvc+GUnPe
	8nTVF2iBKm4xWVik90tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz76-00062O-Bk; Mon, 27 Apr 2020 08:27:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0L-0006B2-P9
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:45 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF4472A0A20;
 Mon, 27 Apr 2020 09:20:39 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 12/17] mtd: rawnand: cafe: Don't split things when
 reading/writing a page
Date: Mon, 27 Apr 2020 10:20:22 +0200
Message-Id: <20200427082028.394719-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012041_955555_2A75A610 
X-CRM114-Status: GOOD (  12.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Calling nand_read_page_op(pagesize)/nand_prog_page_begin_op(pagesize)
and expecting to get a pagesize+oobsize read from/written to the
read/write buffer is fragile and only works because of hacks done
in cmdfunc(). Let's read/write the page in one go, using the page
cache buffer as a bounce buffer.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 31493a201a02..edf65197604b 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -472,6 +472,7 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
+	void *pagebuf = nand_get_data_buf(chip);
 	unsigned int max_bitflips = 0;
 	u32 ecc_result, status;
 
@@ -479,8 +480,11 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
 		cafe_readl(cafe, NAND_ECC_RESULT),
 		cafe_readl(cafe, NAND_ECC_SYN_REG(0)));
 
-	nand_read_page_op(chip, page, 0, buf, mtd->writesize);
-	chip->legacy.read_buf(chip, chip->oob_poi, mtd->oobsize);
+	nand_read_page_op(chip, page, 0, pagebuf,
+			  mtd->writesize + mtd->oobsize);
+
+	if (buf != pagebuf)
+		memcpy(buf, pagebuf, mtd->writesize);
 
 	ecc_result = cafe_readl(cafe, NAND_ECC_RESULT);
 	status = CAFE_FIELD_GET(NAND_ECC_RESULT, STATUS, ecc_result);
@@ -642,15 +646,17 @@ static int cafe_nand_write_page(struct nand_chip *chip,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
+	void *pagebuf = nand_get_data_buf(chip);
 	int ret;
 
-	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
-	chip->legacy.write_buf(chip, chip->oob_poi, mtd->oobsize);
+	if (pagebuf != buf)
+		memcpy(pagebuf, buf, mtd->writesize);
 
 	/* Set up ECC autogeneration */
 	cafe->ctl2 |= CAFE_NAND_CTRL2_AUTO_WRITE_ECC;
 
-	ret = nand_prog_page_end_op(chip);
+	ret = nand_prog_page_op(chip, page, 0, pagebuf,
+				mtd->writesize + mtd->oobsize);
 
 	/*
 	 * And clear it before returning so that following write operations
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
