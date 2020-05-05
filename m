Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD80AC47254
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E622206CC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6aXO++G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E622206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8CekJt2YsKjtFazM3CnICzVrQD9O+BswL4i09DxDPw=; b=i6aXO++GkCyvpA
	OsfyI/YoXU0/uUe7XZ4PfhwiuKnJnyN8gKs8D+BTvpgGyWet8DzVO3OD1qRTNEZlJ65lWGmAx4Q1p
	VncTBY/c40aZL7tzUt2mvZXb8tYupmNQlkynsa8TxtJ0t4ie1UUs3fjRj7/DEtj2u28oMiTy2AMsd
	CMyTD3Wk7LNDvzhPRdyb1QZZtYQQSbYyPNkM+WVxIJRLiZVIso6DzWvZ6lYFL4g3ihvB+REhbEWnh
	l46WQcO7oWQcUm/deIbt9o4ZphF9ALL8Mw6Y68MkFXBCSIfyPrYWktzBZKQjLB4gI/wKBeR23ghlE
	OA0udr/D+Qxo3B+D/naA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVuev-0005XI-EB; Tue, 05 May 2020 10:18:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuaR-00078B-F1
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:14:07 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A32862A1B1B;
 Tue,  5 May 2020 11:14:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 13/19] mtd: rawnand: cafe: Don't split things when
 reading/writing a page
Date: Tue,  5 May 2020 12:13:47 +0200
Message-Id: <20200505101353.1776394-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200505101353.1776394-1-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_031403_687062_44F04517 
X-CRM114-Status: GOOD (  12.24  )
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
cache buffer as a bounce buffer instead of relying on guesses done
in cafe_nand_cmdfunc().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes in v2:
* Add T-b
* None
---
 drivers/mtd/nand/raw/cafe_nand.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f7e537836d55..36685bee9d83 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -470,6 +470,7 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
+	void *pagebuf = nand_get_data_buf(chip);
 	unsigned int max_bitflips = 0;
 	u32 ecc_result, status;
 
@@ -477,8 +478,11 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
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
@@ -640,15 +644,17 @@ static int cafe_nand_write_page(struct nand_chip *chip,
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
