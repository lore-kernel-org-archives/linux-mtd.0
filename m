Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DA4C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D1120757
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lzbi0+Ua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D1120757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opKfEh0jgNCV31125eUmiiLJls07gptoaxsSTdIy8ng=; b=Lzbi0+Ua3Rn3i5
	8q6YFN7kkwGA5ZEySdPi3DuqzURq/stnYkCb/rZRPju/GF1GXPYZnMcdKkESRfHFXAMO2Ao7ZdgZD
	vwP71Mb6PwiagbTHb/y920qowq4Mu+xrVRXypWcowLG52WOwJpP5l+VswSVuHVuLy1nYXTlnEqQrx
	EXPHHOHzxHEXgkHF0H4aY9AkLFE3RF3MP0Ee0MgGG8/6ugR9PWg5bviA7lhciAcoJXrCvvDBUGUrq
	9IZPVzO2MVuQg3i8nunvpZ2JYnPyPMedZ7rN9Yd76P0/cLLApJkHm67uyq31JfpFCVKbqzxHLo/kg
	XKTrMpUhGkLqOM4QnTSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYAm-0005Rr-BG; Mon, 04 May 2020 10:18:04 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYAj-0005Qq-Im
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 10:18:02 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6E08624001A;
 Mon,  4 May 2020 10:16:18 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 10/13] mtd: rawnand: jedec: Adapt the parameter page read
 to constraint controllers
Date: Mon,  4 May 2020 11:52:34 +0200
Message-Id: <20200504095237.1654-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504095237.1654-1-miquel.raynal@bootlin.com>
References: <20200504095237.1654-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_031801_752820_2EA2FCE0 
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We already know that there are controllers not able to read the three
copies of the parameter page in one go. The workaround was to first
request the controller to assert command and address cycles on the
NAND bus to trigger a parameter page read, and then do a read
operation for each page.

But there are also controllers which are not able to split the
parameter page read between the command/address cycles and the actual
data operation.

Let's use a regular PARAMETER PAGE READ operation for the first
iteration and use eithe a CHANGE READ COLUMN or a simple DATA READ
operation for the following copies, depending on what the controller
supports. The default for non-exec-op compliant drivers remains
unchanged: use a SIMPLE READ.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_jedec.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 63069f1948a8..b15c42f48755 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -27,6 +27,7 @@ int nand_jedec_detect(struct nand_chip *chip)
 	struct nand_memory_organization *memorg;
 	struct nand_jedec_params *p;
 	struct jedec_ecc_info *ecc;
+	bool use_datain = false;
 	int jedec_version = 0;
 	char id[5];
 	int i, val, ret;
@@ -44,14 +45,20 @@ int nand_jedec_detect(struct nand_chip *chip)
 	if (!p)
 		return -ENOMEM;
 
-	ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
-	if (ret) {
-		ret = 0;
-		goto free_jedec_param_page;
-	}
+	if (!nand_has_exec_op(chip) ||
+	    !nand_read_data_op(chip, p, sizeof(*p), true, true))
+		use_datain = true;
 
 	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
-		ret = nand_read_data_op(chip, p, sizeof(*p), true, false);
+		if (!i)
+			ret = nand_read_param_page_op(chip, 0x40, p,
+						      sizeof(*p));
+		else if (use_datain)
+			ret = nand_read_data_op(chip, p, sizeof(*p), true,
+						false);
+		else
+			ret = nand_change_read_column_op(chip, sizeof(*p) * i,
+							 p, sizeof(*p), true);
 		if (ret) {
 			ret = 0;
 			goto free_jedec_param_page;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
