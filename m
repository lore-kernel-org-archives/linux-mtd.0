Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4DDC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p5SQxyfYPUsTrAofO9nZ+ZsASpZOpKssFG0IjezY0qI=; b=0wqOFw86o1qlGI
	lOJB3lATesGb/y5B715a1ZZ6W3EbAZTk88S94gs12XhXEBT8UDL0Fa7syZiudFu/7Di1qZIQj51o3
	iaUJ0LpS+ZIAmceWfrCx0mwWCm4DpeVjhWa35NT8O6c1XHO1Dy+pAf5jD+jG5n7ifSytBhwE9eeWR
	cIrPAS0HeCYGlRGsiFmlmJ2Sylp5NFK5p8LwCl2vVSIkB59AEwpqFfifc7Bq+QytspVoVCuS8HKF+
	u0WpLgscKK3i8bLToOSecX/3wPgi5lN1r95p/YbBXyBSs7jZ5M4ZozffxsHZowJ6L1oei2ergwBQb
	ePR73CvOQyUSKZfhlr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovx6w-002t58-VW; Fri, 18 Nov 2022 08:52:35 +0000
Received: from mail.nfschina.com ([124.16.136.209])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovx6s-002syQ-SL
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:52:33 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 3BF1B1E80D82;
	Fri, 18 Nov 2022 16:48:56 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TqIVJEq5iht; Fri, 18 Nov 2022 16:48:53 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: yuzhe@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 40C7A1E80D72;
	Fri, 18 Nov 2022 16:48:51 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] jffs2: fix spelling mistake "neccecary"->"necessary"
Date: Fri, 18 Nov 2022 16:51:04 +0800
Message-Id: <20221118085104.19106-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_005231_188227_F930D3F0 
X-CRM114-Status: UNSURE (   7.45  )
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

There is a spelling mistake in comment. Fix it.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 fs/jffs2/fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 39cec28096a7..af433c4271ff 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -403,7 +403,7 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 	/* We stop if it was running, then restart if it needs to.
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it.
-	   Flush the writebuffer, if neccecary, else we loose it */
+	   Flush the writebuffer, if necessary, else we loose it */
 	if (!sb_rdonly(sb)) {
 		jffs2_stop_garbage_collect_thread(c);
 		mutex_lock(&c->alloc_sem);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
