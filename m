Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E98C55196
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F7F206B9
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ck1MA6g7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F7F206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGtW3Wu/cFAJNzL+lWsvBWsz4hS0nFcTGd0hsqdfjOc=; b=ck1MA6g7Xq/M5o
	UJCnu0us0ShZ4c/ffAsNVdfAaK1FfjxhHew9b67vJxOeSj6s//CMQD4Kc70FqBjkgjG7knAO6qX8Q
	OgHy+HgJzL+gvZHu/DdCMCU+M10RLqSBGwPcaIVBnVnSJ7j85prv/+TVi8K7K3O1ZYgwI1dFZQMP7
	xYDyzKYBf3BCozt3zsmS8OUg/Ejdgz56iN1nGFolGntl37d/Y5f/i49klbOLF7+4fNORPBFiqs74j
	clbrA/lceXQyeLKdHKCgG7zXYltVd5xAO9yNxWc7siwY+/a64Ts6FBxZb28kF6q9U0VEHezu61GVU
	qxrIQstnpXZO9RPtTCUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS2J9-00024r-Qt; Fri, 24 Apr 2020 17:40:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS2Fq-00069u-EO
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 17:36:48 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AB5B320003;
 Fri, 24 Apr 2020 17:36:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/10] mtd: rawnand: jedec: Add an alternative parameter page
 read
Date: Fri, 24 Apr 2020 19:36:30 +0200
Message-Id: <20200424173631.14311-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424173631.14311-1-miquel.raynal@bootlin.com>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_103646_643683_32E00FD1 
X-CRM114-Status: GOOD (  15.19  )
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

Some controllers are not able to read the parameter page in separate chunks.

As there is no need for separate parameter page reads (the delay penalty
for reading the three copies in one go being negligible), the
temptation to just do a monolithic read is high.

But we are afraid of controllers not supporting reading a parameter
page of 1536 bytes neither.

So, despite darkening a little bit this portion, the final solution to
support as many controllers as possible is to check if there is an
actual need for such monolithic read, otherwise we keep the current
behavior.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_jedec.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 15937e02c64f..c88a5f1049d2 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -25,7 +25,7 @@ int nand_jedec_detect(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_memory_organization *memorg;
-	struct nand_jedec_params *p;
+	struct nand_jedec_params *p = NULL, *pbuf;
 	struct jedec_ecc_info *ecc;
 	int jedec_version = 0;
 	char id[5];
@@ -40,25 +40,32 @@ int nand_jedec_detect(struct nand_chip *chip)
 		return 0;
 
 	/* JEDEC chip: allocate a buffer to hold its parameter page */
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (!p)
+	pbuf = kzalloc(sizeof(*pbuf) * JEDEC_PARAM_PAGES, GFP_KERNEL);
+	if (!pbuf)
 		return -ENOMEM;
 
-	ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
+	if (nand_pack_ops(chip))
+		ret = nand_read_param_page_op(chip, 0x40, pbuf,
+					      sizeof(*pbuf) * JEDEC_PARAM_PAGES);
+	else
+		ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
 	if (ret) {
 		ret = 0;
 		goto free_jedec_param_page;
 	}
 
 	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
-		ret = nand_read_data_op(chip, p, sizeof(*p), true);
-		if (ret) {
-			ret = 0;
-			goto free_jedec_param_page;
+		if (!nand_pack_ops(chip)) {
+			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
+						true);
+			if (ret) {
+				ret = 0;
+				goto free_jedec_param_page;
+			}
 		}
 
-		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 510);
-		if (crc == le16_to_cpu(p->crc))
+		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)&pbuf[i], 510);
+		if (crc == le16_to_cpu(pbuf[i].crc))
 			break;
 	}
 
@@ -67,6 +74,8 @@ int nand_jedec_detect(struct nand_chip *chip)
 		goto free_jedec_param_page;
 	}
 
+	p = pbuf;
+
 	/* Check version */
 	val = le16_to_cpu(p->revision);
 	if (val & (1 << 2))
@@ -122,6 +131,6 @@ int nand_jedec_detect(struct nand_chip *chip)
 	ret = 1;
 
 free_jedec_param_page:
-	kfree(p);
+	kfree(pbuf);
 	return ret;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
