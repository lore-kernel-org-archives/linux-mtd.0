Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A1DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kPvyH/4ho2mKOp6iLde3yqU7nKHGCclnhg2v9KdOyiY=; b=am51VN7BPYLDDt
	VxfS4bYYEzZEsAt8Wji04b7hyFNQnDwvoz1QxEyoGVKlmaCEhLr8zQBSKJnKejM/9IMjqDHqE0c9C
	Ox6JAKwQRAxX8b+K9NsatPyW5zkjj7xskvGtWbYAkkmuFvSBMhPOoTb8kgVsEsKHCLVaBpUp+I/Z0
	yVp78tIFVW3XalnZ5uvfEP8jb19KuHGUWjo6gH3p1DZryJ6dLvTmK/KzgWkAbAhZzTf25jD4BOSef
	9dGaLCgwM9invN5y+WjPBdSwxPre8ktH2OAcvoV50s2gTDsacigqq9ApasOpSREdU13sMswUNOW54
	lyluzqh0bsuQekQB7C0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj0CE-00A12Z-Vv; Mon, 25 Apr 2022 15:00:15 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj0C8-00A0wo-T3
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 15:00:10 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nj0C7-0000qH-6k; Mon, 25 Apr 2022 17:00:07 +0200
Date: Mon, 25 Apr 2022 16:00:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [RFC PATCH 4/5] mtd_blkdevs: scan partitions on mtdblock if
 FIT_PARTITION is set
Message-ID: <Yma3ck/hygQ0badz@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_080009_121966_DDD9B51B 
X-CRM114-Status: UNSURE (   8.39  )
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

Enable partition parsers on plain mtdblock devices in case of
CONFIG_FIT_PARTITION being selected.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/mtd_blkdevs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f7317211146550..e9759c4182f8d5 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -359,7 +359,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	} else {
 		snprintf(gd->disk_name, sizeof(gd->disk_name),
 			 "%s%d", tr->name, new->devnum);
+#ifndef CONFIG_FIT_PARTITION
 		gd->flags |= GENHD_FL_NO_PART;
+#endif
 	}
 
 	set_capacity(gd, ((u64)new->size * tr->blksize) >> 9);
-- 
2.36.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
