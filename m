Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0932C19F2D
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gW2e9UUt7GwNENi8uMD6cLbqIaWZqUOlZCKCji7mOnc=; b=y7KtXLp/A2dK7L
	4hKohNFy+1Z6Jslfu6k6tdQZies6j8k70zI9/VhuZ4f/4GE2eDapwNGbOPX0qg/a/W4rjzNCjrRZR
	xY9yD/t47sI7ONZKAXWQ+XRX5JSXM8ksfgOdJw3GJ+hrlx0sL+/qMxYIfLJBR35l+5iaJAeAegYIJ
	YuvftS6JSL55mDj6VBWmNsY4yRCjNlByUZShfZbVSN6eL/p4UU6c4lVC1WFIOExhmMNRWc/VUz/U0
	0W7TyI/wBfwEekAGFZ9Od2oruY3gadRWPZoyv7XsQIyvUVhXCK3ajUnK/ADwtA7WH9c+6XIK2vLtc
	1yJkt/OqsfzRQ9PfTYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKQ5A-00HGP3-9E; Sat, 06 Aug 2022 20:07:36 +0000
Received: from smtp-15.smtpout.orange.fr ([80.12.242.15] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKQ54-00HGGc-A7
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 20:07:32 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id KQ4xoJ2tYsfCIKQ4xoRKcu; Sat, 06 Aug 2022 22:07:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 22:07:26 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Fix a typo in a comment
Date: Sat,  6 Aug 2022 22:07:22 +0200
Message-Id: <de1b1134f056ea7563bb0a9bb2f66ede1475728d.1659816434.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_130730_525641_2EA9C614 
X-CRM114-Status: GOOD (  10.27  )
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

o and t are swapped.
s/mtdpsotre/mtdpstore/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/mtdpstore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index e13d42c0acb0..7ac8ac901306 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -401,7 +401,7 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	/*
 	 * kmsg_size must be aligned to 4096 Bytes, which is limited by
 	 * psblk. The default value of kmsg_size is 64KB. If kmsg_size
-	 * is larger than erasesize, some errors will occur since mtdpsotre
+	 * is larger than erasesize, some errors will occur since mtdpstore
 	 * is designed on it.
 	 */
 	if (mtd->erasesize < info->kmsg_size) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
