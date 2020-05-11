Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EABC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 06:50:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7E02075E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 06:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZSr3P39t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F7E02075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+emr4wTHkDj2RVcRMDn4cXOvtc5xk5MkzcllmvNg7Y=; b=ZSr3P39t61ON9p
	asrnjb5BOFV8TRwGe9XGeX/tHc0zjmcYhmnufz+8Bj1howdvG2tod62XLFuj39mtkTqISTEO2zrpV
	AQWAg+L2uUS/1bmQUSPHQLpAwb/PSgui9pRoqSvlfMLgVzelkNl0U8TZ3TypT7tJ6FCjdJaaKxrGj
	hItQKm3v6Ud+gu7OwYxM8tofu0DVpzf7MFQFvXEadAjNRDWFgT1wqvKGOh85w01kl/N9+CK3jlw9P
	6yb0z34Zb+gIWPCtrLFoET27swMMOJnHDkUOrSpeCt3U8xuZ5ZrPWXybWQUIgYJ3Rk8JKvtvJQJjY
	ZwtGnZnDhVcVUTTUqudw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY2G5-0003OV-81; Mon, 11 May 2020 06:49:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY2Ft-0003EV-Os
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 06:49:39 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AEF542A0971;
 Mon, 11 May 2020 07:49:27 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/3] mtd: rawnand: cafe: Set the NAND_NO_BBM_QUIRK flag
Date: Mon, 11 May 2020 08:49:16 +0200
Message-Id: <20200511064917.6255-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200511064917.6255-1-boris.brezillon@collabora.com>
References: <20200511064917.6255-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_234937_932981_9CFDF9CA 
X-CRM114-Status: GOOD (  12.59  )
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

We have a dummy block_bad() implementation returning 0. Let's set the
NAND_NO_BBM_QUIRK flag and let the core take care of that.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Add R-b
---
 drivers/mtd/nand/raw/cafe_nand.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 2d1c22dc88c1..2a0df13df5f3 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -546,11 +546,6 @@ static int cafe_nand_write_page_lowlevel(struct nand_chip *chip,
 	return nand_prog_page_end_op(chip);
 }
 
-static int cafe_nand_block_bad(struct nand_chip *chip, loff_t ofs)
-{
-	return 0;
-}
-
 /* F_2[X]/(X**6+X+1)  */
 static unsigned short gf64_mul(u8 a, u8 b)
 {
@@ -718,10 +713,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	/* Enable the following for a flash based bad block table */
 	cafe->nand.bbt_options = NAND_BBT_USE_FLASH;
 
-	if (skipbbt) {
-		cafe->nand.options |= NAND_SKIP_BBTSCAN;
-		cafe->nand.legacy.block_bad = cafe_nand_block_bad;
-	}
+	if (skipbbt)
+		cafe->nand.options |= NAND_SKIP_BBTSCAN | NAND_NO_BBM_QUIRK;
 
 	if (numtimings && numtimings != 3) {
 		dev_warn(&cafe->pdev->dev, "%d timing register values ignored; precisely three are required\n", numtimings);
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
