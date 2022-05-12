Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92256C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TnLkbF7dV6iYAa8AZztbid9pG3XW24aDj1eisMk9rBc=; b=GLLKAmjCovxWc5
	wncn8f3XQLts+9wjkdHj+OOPmUE5N3sfy9PkPY2tPPFdeQrPIjxe9PbL+VG+sKJlpKp88jLmPYbo/
	V5nhqs5+YDxZPFn+IntuQtVYl7DntQHkU77OOOEX7gEJct+cohg2ugQRmUzU9KuRuw735xPbkBJBy
	7ivCCOVmiKpu4qGHWIoK5DXwoXOxAvIpd8o8SiUtPz1jnAUIWbleZKtVLOTkKEwM7HWzVdtjSAacj
	PfyvRhw1hNzp8W41L7bvMjR+jnC/5msTrPDwQJyxiazJNlAcf5o0RwGG8kqn1Kj3Bn0aI2k68KQ/P
	1PJOLgG4PNCeKoyG1aKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npDte-00D9RC-VX; Thu, 12 May 2022 18:50:47 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npDtc-00D9Ov-9q
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 18:50:45 +0000
X-IronPort-AV: E=Sophos;i="5.91,220,1647270000"; d="scan'208";a="120800635"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 13 May 2022 03:50:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.50])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8268340E703F;
 Fri, 13 May 2022 03:50:36 +0900 (JST)
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
 Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: mpc5121: Check before clk_disable_unprepare()
 not needed
Date: Thu, 12 May 2022 19:50:33 +0100
Message-Id: <20220512185033.46901-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_115044_480943_248FD32C 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

All code in clk_disable_unprepare() already checks the clk ptr using
IS_ERR_OR_NULL so there is no need to check it again before calling it.
A lot of other drivers already rely on this behaviour, so it's safe
to do so here.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 5b9271b9c326..800d774aed8e 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -595,8 +595,7 @@ static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
-	if (prv->clk)
-		clk_disable_unprepare(prv->clk);
+	clk_disable_unprepare(prv->clk);
 
 	if (prv->csreg)
 		iounmap(prv->csreg);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
