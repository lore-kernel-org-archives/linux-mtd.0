Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5BE77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jaufQA5yKsigIsDLR2Y0SMIyu4KvCk/hu0EAyeYs/Ok=; b=WFFHeyn3NTOBh7
	rcP5NfxDRhau0nXgOhw8t1W1K6aCe3M9ITdOaHxPgdcqhPK8tSYJwAugYlu0T0roJkXUnJKougj9X
	qDrKvOAu+mcOyTbkQZvYyCJmeICn6twYiWAx5Y7RvL+tbaSWmjoAtq/5DoJFZXRyF6JEOwd3btV8L
	S/b09IRHbAA1kA7Sj0Bysjx2iSMwQV6+SXREsRCVbUuSPVawUj7nlDlXUMqyWUyplHLVXO6f0WetV
	khu63dNchCG7L15gKuImYuK+JAhGDOUat3alRSr/uM+fofesArrxOK4lI77+Hk5pJY36VbFFmEZdT
	dkKzt0c2xwKAY7doQZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRYwH-000000025QG-2ahG;
	Sat, 28 Dec 2024 15:41:17 +0000
Received: from smtprelay01.ispgateway.de ([80.67.31.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRYwD-000000025Pk-01iQ
	for linux-mtd@lists.infradead.org;
	Sat, 28 Dec 2024 15:41:14 +0000
Received: from [87.147.151.102] (helo=localhost.localdomain)
	by smtprelay01.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <git@ober-mail.de>)
	id 1tRYw7-000000007qW-1CJZ;
	Sat, 28 Dec 2024 16:41:07 +0100
From: Micha Ober <git@ober-mail.de>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.a,
	vigneshr@ti.com
Subject: [PATCH] mtd: spinand: micron: fix division by zero
Date: Sat, 28 Dec 2024 16:41:06 +0100
Message-Id: <20241228154106.26995-1-git@ober-mail.de>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-Df-Sender: bWljaGFAb2Jlci1tYWlsLmRl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_074113_052826_75D26F2A 
X-CRM114-Status: UNSURE (   9.44  )
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

The `ecc_step_size` field ist not set at this point
in the call tree, leading to a division by zero.

Read the step size from the mtd device ecc config instead.

Signed-off-by: Micha Ober <git@ober-mail.de>
---
 drivers/mtd/nand/spi/micron.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 12601bc4227a..7973996519d3 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -106,9 +106,10 @@ static int micron_4_ooblayout_free(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *region)
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
 
 	if (section >= spinand->base.memorg.pagesize /
-			mtd->ecc_step_size)
+			nanddev_get_ecc_conf(nand)->step_size)
 		return -ERANGE;
 
 	if (section) {
-- 
2.39.5 (Apple Git-154)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
