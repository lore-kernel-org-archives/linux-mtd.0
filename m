Return-Path: <SRS0=/XBI=PE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE87BC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 13:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FE361163
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88FE361163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBQy52mLyz8J95zH1PXfjBUQko2gvwuivDHym/ZIVAo=; b=bl1tKisJi8vT6H
	tVcEXlp3ZgTefSUo8/FiuliMi0Be/0DojexSw9D0b4v7GtIKWKEMUEXF/31hsdLCGXuYD+xqPNCTn
	dNOhnUqoTvQ8SGxt516X/BAg0BiWZAI+9zYFl/zjB7b/C2O5pnRFYBErVh8UsGDgZ7FMgbbUOdWMo
	DqLwImBfdYo5Xc7QeI3VleJ1jcMG16w8ik1maRUaH20r1EQo8oS+UaWP98d/L9oybtTeg8IXGH4+z
	JqWBT4sLC1UTGiGniBPxr5jpBIUzq5QRHbehOVciqZ0vGLnqTNkk4WPs0cQBZtryy5kUm3gMlNvZb
	DzbIZseL3oETpTtzon1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbjek-00AdxV-QN; Sat, 16 Oct 2021 13:23:22 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbjeW-00Adts-B3
 for linux-mtd@lists.infradead.org; Sat, 16 Oct 2021 13:23:09 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 stable@vger.kernel.org
Subject: [PATCH v2 3/5] mtd: rawnand/davinci: Rewrite function description
Date: Sat, 16 Oct 2021 14:22:26 +0100
Message-Id: <20211016132228.40254-3-paul@crapouillou.net>
In-Reply-To: <20211016132228.40254-1-paul@crapouillou.net>
References: <20211016132228.40254-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_062308_557369_176F4937 
X-CRM114-Status: GOOD (  11.48  )
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

The original comment that describes the function
nand_davinci_read_page_hwecc_oob_first() is very obscure and it is hard
to understand what it is for.

Cc: <stable@vger.kernel.org> # v5.2
Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/davinci_nand.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 2e6a0c1671be..fe2511cdcae3 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -372,17 +372,15 @@ static int nand_davinci_correct_4bit(struct nand_chip *chip, u_char *data,
 }
 
 /**
- * nand_read_page_hwecc_oob_first - hw ecc, read oob first
+ * nand_davinci_read_page_hwecc_oob_first - Hardware ECC page read with ECC
+ *                                          data read from OOB area
  * @chip: nand chip info structure
  * @buf: buffer to store read data
  * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  *
- * Hardware ECC for large page chips, require OOB to be read first. For this
- * ECC mode, the write_page method is re-used from ECC_HW. These methods
- * read/write ECC from the OOB area, unlike the ECC_HW_SYNDROME support with
- * multiple ECC steps, follows the "infix ECC" scheme and reads/writes ECC from
- * the data area, by overwriting the NAND manufacturer bad block markings.
+ * Hardware ECC for large page chips, which requires the ECC data to be
+ * extracted from the OOB before the actual data is read.
  */
 static int nand_davinci_read_page_hwecc_oob_first(struct nand_chip *chip,
 						  uint8_t *buf,
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
