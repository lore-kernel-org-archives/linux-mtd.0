Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EFBC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F10120663
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qQ/tIKHq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F10120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stOfcZPlzGPiCp4hpDVBpDyKdUtFLHmCHdgCTqmZH7U=; b=qQ/tIKHq4/DxTA
	0iJyBo8hCd2WzPogdDDUm1E/ZhQ2tvjhRkqo8ZzD54vhpYAByxSw6u3YBDXQYse2Mn3aF4CxDqc24
	a5ZOrELIKj8Tq7sjQm2lMCkr6JxzJCJNQhYXgn4KqJxLW3MYF1x4IwNxbhu8AzqNHEaRvLHsKAmH9
	QserQHq2hMvHVUH4Cbwk7YC+YUz17USYHdRGQjVKsj15qSc2SPShBqlMxKlLL51lR/ZGhgxYBKBih
	CCBwHRBqYDwKf8HOG3k82c05/PU2IG+/9wxwCtwrd8EiYjz58zKLzrV/Lsh/rUl0vKmx3JU9KA3Lk
	tuxNp7k/ea3HjnrPPguA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdf7g-0005q4-Oh; Tue, 26 May 2020 19:20:24 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf56-0001NJ-Ck
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:17:45 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0ECDF240008;
 Tue, 26 May 2020 19:17:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 08/28] mtd: rawnand: Use the data interface mode entry when
 relevant
Date: Tue, 26 May 2020 21:17:05 +0200
Message-Id: <20200526191725.7591-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121744_571936_7E00F5E2 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The data interface setup does not care about the default timing mode
but cares about the actual timing mode at the time of the call of this
helper.

Use this entry instead and let chip->default_timing_mode only be used
at initialization time.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7567c973964b..6a6af0b19fec 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -951,9 +951,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
  */
 static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 {
-	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
-		chip->onfi_timing_mode_default,
-	};
+	u8 mode = chip->data_interface.timings.mode;
+	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
 	int ret;
 
 	if (!nand_has_setup_data_iface(chip))
@@ -987,9 +986,9 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	if (ret)
 		goto err_reset_chip;
 
-	if (tmode_param[0] != chip->onfi_timing_mode_default) {
+	if (tmode_param[0] != mode) {
 		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
-			chip->onfi_timing_mode_default);
+			mode);
 		goto err_reset_chip;
 	}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
