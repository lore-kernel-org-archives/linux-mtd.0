Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B593C25B0E
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Aug 2022 01:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vzxze5QKzgMbFtMqv4cVGrph5trS0vyteohdSHI8bls=; b=nRX5uqh0KvdYwR
	WpwCBqKLoxYjm3RBeFe1vHPEibYefLtbBhnQXEgw3SPLcKKgATxqk0fLfwLCgwB0FBlp6aD2IUftL
	MkKo6Ug3YSSKBYdkr80FSx4QVmGbZCfznlsUZop4bfxUhwoQhJaDvxGuYzuJO8+YMuls/A5vw8BfK
	r1h/c/Is1wEoOyNva/sNusBuMpX8Cz3RpfwhE/1Dp9moFg7103qS40n3cquU2l20HSb3dzKwNdMKC
	PHseV2cZG8JlF7OB+sUb7TYD4UiA4Hv+vfCHV/Bh2JVmMfGhFyKpOqJ4nKdPVA5eiAeYJB+iV/NUf
	ic2ZxKNg0uH2hbA8wK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO7dZ-008Wv6-TJ; Wed, 17 Aug 2022 01:14:25 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO7dU-008WnG-NM
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2022 01:14:22 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 1D0481E80C8B;
	Wed, 17 Aug 2022 09:11:19 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTT1fwfASQlr; Wed, 17 Aug 2022 09:11:16 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 7725E1E80C80;
	Wed, 17 Aug 2022 09:11:16 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] mtd/ubi/block: Remove a semicolon
Date: Wed, 17 Aug 2022 09:14:06 +0800
Message-Id: <20220817011406.3117-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_181420_991656_D5CBE16D 
X-CRM114-Status: UNSURE (   6.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove the repeated ';' from code.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 4cf67a2a0d04..4fc7e756d885 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -409,7 +409,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
 		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_free_dev;;
+		goto out_free_dev;
 	}
 
 
-- 
2.18.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
