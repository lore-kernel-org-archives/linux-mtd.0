Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B85DC25B78
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 13:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0J1RSBJ7wnhGRo5mBzM+dPmDtDTrxmpUzCxpEYzx6U=; b=2SdRlELoq3Pdk6
	e/p/pX/TzpbBYv0BSLu4rHDAbYhZzbCieLmkqRJKgWGcAr8ojk1B4BHItuqnshOJ7O/SBfOLY9EDy
	4Si6+S2SJENgzcy+7OROLW+1HcZID5qwu8dwaTK/8GQHCJ0NYxWp5R8iZl4f0VaKBMNOCHyp+GOi4
	KxhKLXM46XQtYoAzXepp+TJl97Hd7oZU9xjItUWlHKwSgrYB3oWGaL2pcTZQunR29lqd1qGPH4j1P
	e8ncHZ9r/FR464KIswR/J4FChgBOPx/XQrek5qumG7jh2qbfhvvJu8+8VuCpvea/qPhhHQdGN66GI
	+JAlWllgW8z2pfGN1dCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7avI-00000004xuX-0CB3;
	Thu, 16 May 2024 13:13:28 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7avE-00000004xsv-2Xtp
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 13:13:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DFF14000D;
	Thu, 16 May 2024 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715865203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niIhrWEjM3sU/kw98OzBrAKu9bIx/RRyEgWePiM1sso=;
	b=MCXIKfcRLCTetH7bJGUTLsLR5IhXYK7Tx7jmubQgWxBdELgB/TeKRPUc9lk5wryuqSbBsj
	9T+YfnamFcGGcnQeDki0AtcDCC6hH3BS8xvcZXANkpz2XhWI7nMdhXeWwj3ipFJDI2h4nx
	iNnYSmQoNKbqNsbwJUIK8mVoH5psvW/eVxF2cw5M4sD+7HyiJqKus99wAwWKybuxtog9LS
	RD/f46Q7VF1ZCE8Frlvaq+0a6HCCOCsJKtaip9Nb8ZX6mBWIJi5yDVp/n3DGo6tHWRWCd6
	jAcQQ1KoNJ19gcNxa+wBY+B4zVA0skY7YIGjz710wLlIkOpvJVsKgi1MIXjpnQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: rawnand: Bypass a couple of sanity checks during NAND identification
Date: Thu, 16 May 2024 15:13:20 +0200
Message-Id: <20240516131320.579822-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516131320.579822-1-miquel.raynal@bootlin.com>
References: <20240516131320.579822-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_061324_964081_9BD03EB1 
X-CRM114-Status: GOOD (  21.91  )
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

Early during NAND identification, mtd_info fields have not yet been
initialized (namely, writesize and oobsize) and thus cannot be used for
sanity checks yet. Of course if there is a misuse of
nand_change_read_column_op() so early we won't be warned, but there is
anyway no actual check to perform at this stage as we do not yet know
the NAND geometry.

So, if the fields are empty, especially mtd->writesize which is *always*
set quite rapidly after identification, let's skip the sanity checks.

nand_change_read_column_op() is subject to be used early for ONFI/JEDEC
identification in the very unlikely case of:
- bitflips appearing in the parameter page,
- the controller driver not supporting simple DATA_IN cycles.

As nand_change_read_column_op() uses nand_fill_column_cycles() the logic
explaind above also applies in this secondary helper.

Fixes: c27842e7e11f ("mtd: rawnand: onfi: Adapt the parameter page read to constraint controllers")
Fixes: daca31765e8b ("mtd: rawnand: jedec: Adapt the parameter page read to constraint controllers")
Cc: stable@vger.kernel.org
Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Dropped the double (( ))
* Fixed nand_fill_column_cycles() as well.
---
 drivers/mtd/nand/raw/nand_base.c | 57 ++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 248e654ecefd..53e16d39af4b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1093,28 +1093,32 @@ static int nand_fill_column_cycles(struct nand_chip *chip, u8 *addrs,
 				   unsigned int offset_in_page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	bool ident_stage = !mtd->writesize;
 
-	/* Make sure the offset is less than the actual page size. */
-	if (offset_in_page > mtd->writesize + mtd->oobsize)
-		return -EINVAL;
-
-	/*
-	 * On small page NANDs, there's a dedicated command to access the OOB
-	 * area, and the column address is relative to the start of the OOB
-	 * area, not the start of the page. Asjust the address accordingly.
-	 */
-	if (mtd->writesize <= 512 && offset_in_page >= mtd->writesize)
-		offset_in_page -= mtd->writesize;
-
-	/*
-	 * The offset in page is expressed in bytes, if the NAND bus is 16-bit
-	 * wide, then it must be divided by 2.
-	 */
-	if (chip->options & NAND_BUSWIDTH_16) {
-		if (WARN_ON(offset_in_page % 2))
+	/* Bypass all checks during NAND identification */
+	if (likely(!ident_stage)) {
+		/* Make sure the offset is less than the actual page size. */
+		if (offset_in_page > mtd->writesize + mtd->oobsize)
 			return -EINVAL;
 
-		offset_in_page /= 2;
+		/*
+		 * On small page NANDs, there's a dedicated command to access the OOB
+		 * area, and the column address is relative to the start of the OOB
+		 * area, not the start of the page. Asjust the address accordingly.
+		 */
+		if (mtd->writesize <= 512 && offset_in_page >= mtd->writesize)
+			offset_in_page -= mtd->writesize;
+
+		/*
+		 * The offset in page is expressed in bytes, if the NAND bus is 16-bit
+		 * wide, then it must be divided by 2.
+		 */
+		if (chip->options & NAND_BUSWIDTH_16) {
+			if (WARN_ON(offset_in_page % 2))
+				return -EINVAL;
+
+			offset_in_page /= 2;
+		}
 	}
 
 	addrs[0] = offset_in_page;
@@ -1123,7 +1127,7 @@ static int nand_fill_column_cycles(struct nand_chip *chip, u8 *addrs,
 	 * Small page NANDs use 1 cycle for the columns, while large page NANDs
 	 * need 2
 	 */
-	if (mtd->writesize <= 512)
+	if (!ident_stage && mtd->writesize <= 512)
 		return 1;
 
 	addrs[1] = offset_in_page >> 8;
@@ -1436,16 +1440,19 @@ int nand_change_read_column_op(struct nand_chip *chip,
 			       unsigned int len, bool force_8bit)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	bool ident_stage = !mtd->writesize;
 
 	if (len && !buf)
 		return -EINVAL;
 
-	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
-		return -EINVAL;
+	if (!ident_stage) {
+		if (offset_in_page + len > mtd->writesize + mtd->oobsize)
+			return -EINVAL;
 
-	/* Small page NANDs do not support column change. */
-	if (mtd->writesize <= 512)
-		return -ENOTSUPP;
+		/* Small page NANDs do not support column change. */
+		if (mtd->writesize <= 512)
+			return -ENOTSUPP;
+	}
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_interface_config *conf =
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
