Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85AFC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jan 2022 01:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dsPjL0JJqTkejkAnOcj1TCnhuBwKT1EM53MyaeJ2uVc=; b=q2hD1cpjK7CJk5
	t+KY+ieiZNe3V/fWERNGF6iuiNFyF2E7PL58pypo20TTeDx/h/AmLG3Hq8V1oen++8r7E0NagoYMt
	zDF8CbnIYjw0OPvmYP4SWq3WCvo/AM3l9Zkyx4iEmiKdXntr8iSxjwCrJoT+3EXX/6JNcAatwincM
	qOdvi96rMPnZ93P9e5TEatBzDRzeevKr7Dy5OTEbAW2xIAx2yHboZYil9l1m822+OhUhVLXuY+riS
	P3OeO7A2R0EP90Ja71wdVzR2+ShUy2vz5Fbfeqy+VwfzukOu8an5F1tOcMhiwZyLrsHjwnBYX+ffO
	wYLEKAvXfOK9tsAHG6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7p2g-004DS2-S7; Thu, 13 Jan 2022 01:36:42 +0000
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7p2e-004DRk-Bk
 for linux-mtd@lists.infradead.org; Thu, 13 Jan 2022 01:36:41 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0V1hFwAI_1642037783; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V1hFwAI_1642037783) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 13 Jan 2022 09:36:24 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] ubifs: Fix ubifs_check_dir_empty() kernel-doc comment
Date: Thu, 13 Jan 2022 09:36:22 +0800
Message-Id: <20220113013622.102096-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_173640_585590_9FB1B95F 
X-CRM114-Status: UNSURE (   6.45  )
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

Fix function name in fs/ubifs/dir.c kernel-doc comment
to remove warning found by running scripts/kernel-doc,
which is caused by using 'make W=1'.

fs/ubifs/dir.c:883: warning: expecting prototype for check_dir_empty().
Prototype was for ubifs_check_dir_empty() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ae082a0be2a3..d208d1e35361 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -872,7 +872,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 }
 
 /**
- * check_dir_empty - check if a directory is empty or not.
+ * ubifs_check_dir_empty - check if a directory is empty or not.
  * @dir: VFS inode object of the directory to check
  *
  * This function checks if directory @dir is empty. Returns zero if the
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
