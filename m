Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC1CC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 12:30:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DB720825
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 12:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Whj5iTwM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DB720825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xEA4cDdB+5Mwh24CPrI7HT8h2TPjRLwJXCWcSMFETQ=; b=Whj5iTwMtsUgGk
	PJ9TLkr7yjaWDkb65n/XmDXvvAIpLYVBiB61O08CVd1X65om+f/6EAPGvyRAk0Hjb79zs8ra25myv
	MhinX+/7MH/1x+/VChtY2I8iyrmz7ilXEOm2mmLHkX/bq3UyC4RS8QyF0w87xmYXLyhdCNcYiRIzb
	M5LJxf+7rw6nB1LcHDGQzefZYs2FfydGc0Ua5/1YOAE9BgOk3kGeXJhIgPiMGJ9djl7mSj7Mm8EhH
	anCoNDG4xQFNDOE2zfeOZlnwJtc5e98VJt4etPNn96LVaVJvbE2ME6yEe0ywAhlXnhHU7LqqrY06E
	QWl72abjD9RfdaDfQzDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb1OM-0008Of-3e; Tue, 19 May 2020 12:30:42 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1OJ-0008OJ-TN
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 12:30:41 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 10628200018;
 Tue, 19 May 2020 12:30:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: rawnand: micron: Adapt the PAGE READ flow to
 constraint controllers
Date: Tue, 19 May 2020 14:30:32 +0200
Message-Id: <20200519123032.32547-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_053040_219137_466A22E9 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are controllers not able to just read data cycles on the
bus. There are controllers not able to do a change column.

If we want to support both, we need to check which operation is
supported first. This is the exact same mechanism that is in use for
parameter page reads (ONFI/JEDEC) as the same problem occurs.

Speed testing does not show any throughput penalty so we do not
optimize more than that. However it is likely that, in the future, a
more robust and exhaustive test will run at boot time to avoid
re-checking what is supported and what is not at every call.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---

Changes in v2:
* Added a comment before each check which is a condensate of the
  commit message.
* Collected Boris' R-by tag.

 drivers/mtd/nand/raw/nand_micron.c | 44 ++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index b2b047b245f4..bbd0ffbae19a 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -192,6 +192,7 @@ static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status,
 	struct micron_nand *micron = nand_get_manufacturer_data(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned int step, max_bitflips = 0;
+	bool use_datain = false;
 	int ret;
 
 	if (!(status & NAND_ECC_STATUS_WRITE_RECOMMENDED)) {
@@ -211,8 +212,18 @@ static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status,
 	 * in non-raw mode, even if the user did not request those bytes.
 	 */
 	if (!oob_required) {
-		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
-					false, false);
+		if (!nand_has_exec_op(chip) ||
+		    !nand_read_data_op(chip, chip->oob_poi, mtd->oobsize, false,
+				       true))
+			use_datain = true;
+
+		if (use_datain)
+			ret = nand_read_data_op(chip, chip->oob_poi,
+						mtd->oobsize, false, false);
+		else
+			ret = nand_change_read_column_op(chip, mtd->writesize,
+							 chip->oob_poi,
+							 mtd->oobsize, false);
 		if (ret)
 			return ret;
 	}
@@ -285,6 +296,7 @@ micron_nand_read_page_on_die_ecc(struct nand_chip *chip, uint8_t *buf,
 				 int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	bool use_datain = false;
 	u8 status;
 	int ret, max_bitflips = 0;
 
@@ -300,14 +312,28 @@ micron_nand_read_page_on_die_ecc(struct nand_chip *chip, uint8_t *buf,
 	if (ret)
 		goto out;
 
-	ret = nand_exit_status_op(chip);
-	if (ret)
-		goto out;
+	if (!nand_has_exec_op(chip) ||
+	    !nand_read_data_op(chip, buf, mtd->writesize, false, true))
+		use_datain = true;
 
-	ret = nand_read_data_op(chip, buf, mtd->writesize, false, false);
-	if (!ret && oob_required)
-		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
-					false, false);
+	if (use_datain) {
+		ret = nand_exit_status_op(chip);
+		if (ret)
+			goto out;
+
+		ret = nand_read_data_op(chip, buf, mtd->writesize, false,
+					false);
+		if (!ret && oob_required)
+			ret = nand_read_data_op(chip, chip->oob_poi,
+						mtd->oobsize, false, false);
+	} else {
+		ret = nand_change_read_column_op(chip, 0, buf, mtd->writesize,
+						 false);
+		if (!ret && oob_required)
+			ret = nand_change_read_column_op(chip, mtd->writesize,
+							 chip->oob_poi,
+							 mtd->oobsize, false);
+	}
 
 	if (chip->ecc.strength == 4)
 		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
