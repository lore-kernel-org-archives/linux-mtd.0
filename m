Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1B9C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Jul 2022 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qORfB5vBF4Xqh/z7pdnrXXDjHMyX6QRB9XM3qSNiKo8=; b=vIq4JwSW0IeyhH
	NUL9VNzwY28oTOB479n1g1eh25LgZUGy0lYwVtUyA/QFd7D/8hv24R80EJ8F9yOHyseM7oo6nP4qH
	i9erVTZRHUSOSsZpfQgpX/VUeAeTchNPH/9dcKqaUyk4B9cQ9qYq5KXBnIFAJ+Q8y4LR/rnSGLLWN
	reaRf/fwDMbOZdU6Sm7BrmtGfRYVBSOpHAiffv5V673Dey9BlDqkEpVqf+elSlW4KyGc7xr777k9J
	3OoTc+ZAxSnqEUmaNZQQ+mmU2zTrtqSlys91d2LQw5NQO7F/oJOWlRZJFzKdK34zmyhfESpL4nu70
	3rKgEFTWI8JhhM9c/d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o82Ab-00H6oo-7f; Sun, 03 Jul 2022 16:10:01 +0000
Received: from smtp03.smtpout.orange.fr ([80.12.242.125] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o82AX-00H6ko-Hy
	for linux-mtd@lists.infradead.org; Sun, 03 Jul 2022 16:09:59 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 82ANo4WMq5ohR82ANo6E2q; Sun, 03 Jul 2022 18:09:48 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 03 Jul 2022 18:09:48 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: bbt: Use the bitmap API to allocate bitmaps
Date: Sun,  3 Jul 2022 18:09:45 +0200
Message-Id: <b18c2b6711b8930f0dfb8318b5d19ef6e41f0f9a.1656864573.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_090957_778361_14C32EA9 
X-CRM114-Status: UNSURE (   8.05  )
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

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/bbt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index 64af6898131d..db4f93a903e4 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -24,11 +24,8 @@ int nanddev_bbt_init(struct nand_device *nand)
 {
 	unsigned int bits_per_block = fls(NAND_BBT_BLOCK_NUM_STATUS);
 	unsigned int nblocks = nanddev_neraseblocks(nand);
-	unsigned int nwords = DIV_ROUND_UP(nblocks * bits_per_block,
-					   BITS_PER_LONG);
 
-	nand->bbt.cache = kcalloc(nwords, sizeof(*nand->bbt.cache),
-				  GFP_KERNEL);
+	nand->bbt.cache = bitmap_zalloc(nblocks * bits_per_block, GFP_KERNEL);
 	if (!nand->bbt.cache)
 		return -ENOMEM;
 
@@ -44,7 +41,7 @@ EXPORT_SYMBOL_GPL(nanddev_bbt_init);
  */
 void nanddev_bbt_cleanup(struct nand_device *nand)
 {
-	kfree(nand->bbt.cache);
+	bitmap_free(nand->bbt.cache);
 }
 EXPORT_SYMBOL_GPL(nanddev_bbt_cleanup);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
