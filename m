Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9kncD3+dbnKLGBBUEKy9CFY3raLsHP78FA1EGzPeT24=; b=pviTIWaEqNBRLI
	xzR/iXJ6tc4UNeXSDkyPwonyZZ8taETPDhLehk8vTLTeyV1lte7KFRH9Hxm9VPEe84shiLxrxr1Q/
	HfrKgNeC8P5wdZez+B+8ZUS0hyl74QHZV7UFWXQDxuwV6yxBHnYuP82L6YhRIcmRSlTv4JenBEcsR
	cMG8IgxH4k6LnzIBgrZA7Gs5p4M7rN6PXeQ51JYkRV3VtoUo2LSWM+EH3rkvXYPchksnWC3uTBsSu
	fNMCyy7kX3pUEf/b1oolivkhjhbix9EcSwE5OUsSKTF+jWx/50Th0qnlMNzTq60kx4ZO5I13IVkyb
	VDNuyCjpz/uyV05emAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogJST-00HZg5-Dp; Thu, 06 Oct 2022 05:30:09 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogJSP-00HZd1-Cu
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 05:30:07 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Mjg4K2QPwz9srM;
	Thu,  6 Oct 2022 07:29:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEHhpviyTnOe; Thu,  6 Oct 2022 07:29:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Mjg4K1Jrgz9srL;
	Thu,  6 Oct 2022 07:29:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BBBE8B765;
	Thu,  6 Oct 2022 07:29:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0F3ykgzubF1K; Thu,  6 Oct 2022 07:29:52 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.234])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DCF1E8B763;
	Thu,  6 Oct 2022 07:29:52 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2965TcYX212029
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 6 Oct 2022 07:29:38 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2965TJAe211988;
	Thu, 6 Oct 2022 07:29:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: mpc5121: Replace NO_IRQ by 0
Date: Thu,  6 Oct 2022 07:29:12 +0200
Message-Id: <4e3ca3e0077ea124ea210c312e6e620f0f9e8bca.1665034065.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665034152; l=872; s=20211009; h=from:subject:message-id; bh=rYLVuyFmTaTCs61Q+MrDuHd7NYBtl4Z3bCNb9QGXTUU=; b=I/0to1iroQff1gp6zJpHvzj69MWD1s2x80lLNXnfBF1H+C+QcGYEX46jRUB9K2t9yjqQueKcTxgt vwtMePSJBiDNx+MgIPUqAEfA2HdbMUD7sqLiKY8CSbqOG4OHK/bI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_223005_615933_3C75DAD1 
X-CRM114-Status: GOOD (  11.58  )
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

NO_IRQ is used to check the return of irq_of_parse_and_map().

On some architecture NO_IRQ is 0, on other architectures it is -1.

irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.

So use 0 instead of using NO_IRQ.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 800d774aed8e..f68349cb7824 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -663,7 +663,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	}
 
 	prv->irq = irq_of_parse_and_map(dn, 0);
-	if (prv->irq == NO_IRQ) {
+	if (!prv->irq) {
 		dev_err(dev, "Error mapping IRQ!\n");
 		return -EINVAL;
 	}
-- 
2.37.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
