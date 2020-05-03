Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F85C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 11:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032AF205ED
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 11:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DK3oF0qY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032AF205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STSDtxuDpEGTP1JxLcb/jxGpwsU1nllOW0+LZffT2To=; b=DK3oF0qYaHoXnO
	WcXG04Tv7L9dXaqnoK0VqNEiN0XRVlVV+fEI9sZWWNS39Y+N6S6hZONdtRfxg0eY0Ymht45aMnRzP
	7vWWi5npNsNI5tkGvzQ6F5gZLcJ/pUlVUNlcOaDfukeX+GVGrMGJom/2w+dbILrkRYeOgMcMrBpIn
	6Onf6YTowXSK8RQOwwslAG9GVlMW4i9z7awvezZIz6b1bcBO1tA/yyZ+v9JOxrMF3pVcGANSFLysq
	p6+5co0igDcA6WhdlpCkia/Cvr+pooCXel9ZC+EZOzF5NZ+dTECGjWDg2FBHfONNs0Q6G9r2u2zPm
	dfwSvOkce2eEs/SV3Hcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVCzT-0003gk-Ra; Sun, 03 May 2020 11:40:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVCz7-0003HC-0R
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 11:40:38 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 737C3FF807;
 Sun,  3 May 2020 11:40:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/3] mtd: rawnand: Add the nand_chip->write_oob hook
Date: Sun,  3 May 2020 13:40:28 +0200
Message-Id: <20200503114029.30257-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200503114029.30257-1-miquel.raynal@bootlin.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_044037_315176_212D7C67 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With the same approach as for the ->erase hook, in order to solve an
issue with Micron NANDs, we must be able to overload the write
operation. With this in mind, we create a ->write_oob hook in the
nand_chip structure which points by default to the
currently in use nand_write_oob() helper, renamed
nand_write_oob_nand() for the parallel with the nand_erase_nand()
one.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h | 2 ++
 drivers/mtd/nand/raw/nand_base.c | 8 ++++++++
 include/linux/mtd/rawnand.h      | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 9d0caadf940e..caf534a6586a 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
+int nand_write_oob_nand(struct nand_chip *chip, loff_t to,
+			struct mtd_oob_ops *ops);
 int onfi_fill_data_interface(struct nand_chip *chip,
 			     enum nand_data_interface_type type,
 			     int timing_mode);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7c7ac722d88b..f9cf30949f49 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4121,6 +4121,13 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 			  struct mtd_oob_ops *ops)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	return chip->write_oob(chip, to, ops);
+}
+
+int nand_write_oob_nand(struct nand_chip *chip, loff_t to,
+			struct mtd_oob_ops *ops)
+{
 	int ret;
 
 	ops->retlen = 0;
@@ -4423,6 +4430,7 @@ static void nand_set_defaults(struct nand_chip *chip)
 		chip->buf_align = 1;
 
 	chip->erase = nand_erase_nand;
+	chip->write_oob = nand_write_oob_nand;
 }
 
 /* Sanitize ONFI strings so we can safely print them */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 505c13f7a2ba..7fbbd5d7088f 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1021,6 +1021,7 @@ struct nand_legacy {
  * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @erase:		Raw NAND erase operation.
+ * @write_oob:		Raw NAND write operation.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buf_align:		minimum buffer alignment required by a platform
  * @oob_poi:		"poison value buffer," used for laying out OOB data
@@ -1092,6 +1093,8 @@ struct nand_chip {
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
 	int (*erase)(struct nand_chip *chip, struct erase_info *instr,
 		     int allowbbt);
+	int (*write_oob)(struct nand_chip *chip, loff_t to,
+			 struct mtd_oob_ops *ops);
 
 	unsigned int options;
 	unsigned int bbt_options;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
