Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6184BC3ABBE
	for <linux-mtd@archiver.kernel.org>; Thu,  8 May 2025 03:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q88NfPt88Wqz+lpN/0nWJwJI7FYBntXz1aVY4RwmPZw=; b=CHJxi4qkIiRZwM
	9xku2k+0RSunH9G4zTjDp7huRAYlg7CPO09QkHUgiYMV/UtnebhSufJerwJa1NmPcipk7wqS85lSf
	kAbzcS+UC3B1r/0JtDuAtnMvxOA8u2Tf9OhTV5Vuyv5T0FeksCLTcwGMElHiny0cxT/PDZlzZBIeG
	zsE4FnhskQIcwibs/IJbAKyknxQRBeh7Wqea4fJg2DaTN2LzwjIxiOaNhJnzZmkFF1fu3bGcEX+xr
	KYwkLJADE9x9B6Q1LCN4TB679v80sCeuirDza7MFyK3DXKFw+4nSz48my4jGIRhG2wYC8hSmNZKAj
	rzU/ip9nga1T86gzN77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCrwO-0000000HDSa-0Cej;
	Thu, 08 May 2025 03:28:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCrwL-0000000HDS9-2Qxs
	for linux-mtd@lists.infradead.org;
	Thu, 08 May 2025 03:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04D2644BE5;
	Thu,  8 May 2025 03:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5C7DC4CEE8;
	Thu,  8 May 2025 03:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746674929;
	bh=vdAmVAbufuOs39noAWyicE6RZakZi51NyGvoS2Gr3As=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ENHPijUw2e8bBenUyJA/B5Fl0O8M1Vco9GZYiy/fbeuooQminhUsQ/vxPgEywxxqB
	 6A4Si22NuGnUzknZV4/hWZpGYemjL7zw12MTTpxKPesWQsJ+A+q801D6EjeS5fGKUC
	 8fpPERcaVhfIqtACyVlLsrCvc7FrfOACLq42NPaJymerWDd931B6X0Z6mWtRED77hR
	 PjIBqhgElF8ua0JWFcR9Uz5uYP0GWt0NyeVwkw8zAJxsxJ359ZV039h97CS7rzoy0N
	 VdBCeQlPqfW+MZWcm0TTxNt7QYJjIzgA57WJVo5DSehccTgMyYY70yYUcDHT5HXUyJ
	 dFCxZWtMzxuag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C417CC3ABBE;
	Thu,  8 May 2025 03:28:49 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Thu, 08 May 2025 11:28:42 +0800
Subject: [PATCH] mtd: rawnand: loongson1: Fix inconsistent refcounting in
 ls1x_nand_chip_init()
MIME-Version: 1.0
Message-Id: <20250508-loongson1-nand-fix-v1-1-27b26234c62c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOkkHGgC/x2MQQqAMAzAvjJ6tjAHOvQr4mHaqgXpZAMRZH93e
 EwgeSFzEs4wmhcS35IlaoW2MbAeQXdGocrgrOtsZz2eMeqeo7aoQQk3edD5YfErUb8Fghpeiav
 +p9NcygcEQdaqZAAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746674928; l=2384;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=Enffpow1/oAmcpIlxb54XqOtVEib/iLdUuIMLpplTqs=;
 b=fYD8HRpmUt1FmYMRV3iW1cBEn4niKD1j8KhX3W660f8g/vV9SUM9UJ2xm+x1vbLINlw0u8KKW
 vHC+7SwNRNmAPW6deUZAEbq+C+iM1dGovTg/E7gfvQniSTIjeTEuiSr
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_202853_664254_91A88AC7 
X-CRM114-Status: UNSURE (   9.50  )
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
Reply-To: keguang.zhang@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Keguang Zhang <keguang.zhang@gmail.com>

As reported by Dan,
commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
Driver"), leads to the following Smatch static checker warning:

drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':

Fix this issue by calling of_node_put() immediately after using chip_np.
In addition, remove all unnecessary of_node_put(chip_np) calls.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aBR535RZZT-sa6QZ@stanley.mountain/
Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/mtd/nand/raw/loongson1-nand-controller.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
index 6a369b1c7d86..5f1bde21c8fc 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -703,27 +703,25 @@ static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
 	if (!chip_np)
 		return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
 
-	chip->controller = &host->controller;
-	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
-	chip->buf_align = 16;
-	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, chip_np);
+	of_node_put(chip_np);
 	if (!mtd->name)
 		return dev_err_probe(dev, -EINVAL, "Missing MTD label\n");
 
+	nand_set_controller_data(chip, host);
+	chip->controller = &host->controller;
+	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
+	chip->buf_align = 16;
 	mtd->dev.parent = dev;
 	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
-	if (ret) {
-		of_node_put(chip_np);
+	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
-	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		nand_cleanup(chip);
-		of_node_put(chip_np);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 

---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-loongson1-nand-fix-279b7cdd6fad

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
