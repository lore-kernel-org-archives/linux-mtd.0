Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ED7C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 18:51:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254F460F6B
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 18:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 254F460F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATlDJEs9GfLnvGRj6h3IFmyROlzJnTNK1UhQGCYTpXk=; b=NzCTcZTSCkRQY5
	wu52RIWXl0JPxtQ47Q+nlrFhz+QojzECuqHLspQr0L4K/oVe+ycBpIXMOgzz18aIvOczD7rH2A3Oi
	0ka9ym7VUqiCy3jFPJgsL1ORsXc5joo3qfPsymZETEkt3qsEESX5ky4lgtBW0lflR8ywaBcbpodiT
	UjbQUl3L9UzDDwkWTlMpKMtOWmadm6tVkjGcjd5/tUTW5mxCszqauadrZKmBpDZgO9FgW0f7S7CS2
	a/RdNLdE0iF78MXhr0lj09eqYlciP26ZEdXFPQ9caZuP8cjIWEIOv5zyrrDRJJsfxHSrFqhshKMAX
	H9+lHB9IOmtEjjiW13Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZHQp-005zAE-Pm; Sat, 09 Oct 2021 18:50:51 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZHQX-005z5T-VU
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 18:50:35 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: list@opendingux.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org
Subject: [PATCH 3/3] mtd: rawnand/ingenic: JZ4740 needs 'oob_first' read page
 function
Date: Sat,  9 Oct 2021 20:49:52 +0200
Message-Id: <20211009184952.24591-4-paul@crapouillou.net>
In-Reply-To: <20211009184952.24591-1-paul@crapouillou.net>
References: <20211009184952.24591-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_115034_192878_892EE60C 
X-CRM114-Status: GOOD (  14.37  )
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

The ECC engine on the JZ4740 SoC requires the ECC data to be read before
the page; using the default page reading function does not work. Indeed,
the old JZ4740 NAND driver (removed in 5.4) did use the 'OOB first' flag
that existed back then.

Use the newly created nand_read_page_hwecc_oob_first() to address this
issue.

This issue was not found when the new ingenic-nand driver was developed,
most likely because the Device Tree used had the nand-ecc-mode set to
"hw_oob_first", which seems to not be supported anymore.

Cc: <stable@vger.kernel.org> # v5.2
Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 0e9d426fe4f2..b18861bdcdc8 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -32,6 +32,7 @@ struct jz_soc_info {
 	unsigned long addr_offset;
 	unsigned long cmd_offset;
 	const struct mtd_ooblayout_ops *oob_layout;
+	bool oob_first;
 };
 
 struct ingenic_nand_cs {
@@ -240,6 +241,9 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		chip->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (nfc->soc_info->oob_first)
+		chip->ecc.read_page = nand_read_page_hwecc_oob_first;
+
 	/* For legacy reasons we use a different layout on the qi,lb60 board. */
 	if (of_machine_is_compatible("qi,lb60"))
 		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
@@ -534,6 +538,7 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset = 0x00008000,
 	.addr_offset = 0x00010000,
+	.oob_first = true,
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
