Return-Path: <SRS0=/XBI=PE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FC7C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 13:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF006101D
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CF006101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nE+lig5nbCQB/arvgpUMFV75nvQ3QHKE3izxtS1W5I=; b=XztIlky0OWM258
	sG2fYwpottUeLkh5O+tsmEMTmEquN0dCY6Hw1dW5CRtF0lpD7ckTPhxWeeIeo2rPFQQHmndlzw8cK
	EN+ndDdPkRBPzOXfhkkdn5p8w6RGUgVdQfdAc6JvWmDpJdD8EeKO1aWD6brabF6vmF6rPruNXwJrn
	+Y6+hVp//wlT4vwtguIovDFoyQxs+La694sFkA8yefRzb5Bv/KBSdI30/8gH/2Uw5p9cWJUci4na6
	jmuzcutRMIXtOCRfPIXli4Bdln9n7W9gIpndq0Cy/nJhD4JhWKZgd2An0eFjpqqdr35+O8AL1hduv
	xYsqYUNY4eFtyqJWtUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbjeX-00Aduk-5j; Sat, 16 Oct 2021 13:23:09 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbjeN-00Adrv-Ho
 for linux-mtd@lists.infradead.org; Sat, 16 Oct 2021 13:23:00 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 stable@vger.kernel.org
Subject: [PATCH v2 2/5] mtd: rawnand/davinci: Avoid duplicated page read
Date: Sat, 16 Oct 2021 14:22:25 +0100
Message-Id: <20211016132228.40254-2-paul@crapouillou.net>
In-Reply-To: <20211016132228.40254-1-paul@crapouillou.net>
References: <20211016132228.40254-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_062259_767058_FBE330A8 
X-CRM114-Status: GOOD (  12.34  )
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

The function nand_davinci_read_page_hwecc_oob_first() first reads the
OOB data, extracts the ECC information, programs the ECC hardware before
reading the actual data in a loop.

Right after the OOB data was read, it called nand_read_page_op() to
reset the read cursor to the beginning of the page. This caused the
first page to be read twice: in that call, and later in the loop.

Address that issue by changing the call to nand_read_page_op() to
nand_change_read_column_op(), which will only reset the read cursor.

Cc: <stable@vger.kernel.org> # v5.2
Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/davinci_nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 89de24d3bb7a..2e6a0c1671be 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -401,7 +401,8 @@ static int nand_davinci_read_page_hwecc_oob_first(struct nand_chip *chip,
 	if (ret)
 		return ret;
 
-	ret = nand_read_page_op(chip, page, 0, NULL, 0);
+	/* Move read cursor to start of page */
+	ret = nand_change_read_column_op(chip, 0, NULL, 0, false);
 	if (ret)
 		return ret;
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
