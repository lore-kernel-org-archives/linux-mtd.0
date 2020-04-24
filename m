Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B54C54FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 16:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DD2206D7
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 16:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p39lx9D1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DD2206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyLrsJmSipFEReLUVtuYR26bQ2pg9l4auCvzLDWkUiE=; b=p39lx9D1m3hzpn
	d5iI3JI0RODap++mVzeaw7K1nOqu5ihZ2PMX8410vcX4LaRMheJfUSLv6me6rSmhqckdSxDoDDpL5
	GFNHdIKKLUtimz1VV53GcyYTu9II1FAPipiLbKerEzSUNyaVCjPSJ7CjYbbGtvSaOCniLBljzhvgZ
	ioY6FKoPUO0rXfX4C1IfV1ZH7LBMiy9uVLttpj0oitITs0ficO4vhTyMMz72mqNDHNyNFMrF7twtB
	NajrHmc3W/l4pmHtVqS/N6xQ5mq6J/dEHN1cqoRoeWuYI328mTtQdpQmnZeNcYbwvfNrFa+Rf0sEL
	c1x2IcF6B4yVz2j0zB4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS1QF-0006Fn-Fi; Fri, 24 Apr 2020 16:43:28 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS1Nl-0003yI-AJ
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 16:40:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2769220007;
 Fri, 24 Apr 2020 16:40:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 7/9] mtd: rawnand: onfi: Drop a useless parameter page read
Date: Fri, 24 Apr 2020 18:40:40 +0200
Message-Id: <20200424164042.26572-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424164042.26572-1-miquel.raynal@bootlin.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_094054_340622_870494FC 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

During detection the logic on the NAND bus is:

    /* Regular ONFI detection */
    1/ read the three NAND parameter pages

    /* Extended parameter page detection */
    2/ send "read the NAND parameter page" commands without reading
       actual data
    3/ move the column pointer to the extended page and read it

If fact, as long as there is nothing happening on the NAND bus between
1/ and 3/, the operation 2/ is redundant so remove it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_onfi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 6576b841bc56..2fc71b7c361f 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -47,12 +47,10 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	if (!ep)
 		return -ENOMEM;
 
-	/* Send our own NAND_CMD_PARAM. */
-	ret = nand_read_param_page_op(chip, 0, NULL, 0);
-	if (ret)
-		goto ext_out;
-
-	/* Use the Change Read Column command to skip the ONFI param pages. */
+	/*
+	 * Use the Change Read Column command to skip the ONFI param pages and
+	 * ensure we read at the right location.
+	 */
 	ret = nand_change_read_column_op(chip,
 					 sizeof(*p) * p->num_of_param_pages,
 					 ep, len, true);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
