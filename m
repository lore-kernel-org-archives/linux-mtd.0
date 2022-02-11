Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71E3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 03:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oRiYmP0VXu8TZdLFT30THOD0LIZAvJTQJdrcqnycoT0=; b=l0VElH7prUEE8w
	clfa4mlH8ORDN3rT6uWdDuWveWGRAW3q3k5qacFXGcHNfUgkl4QNjucdHe+aJwPL9D2pBnwcyRAn6
	kcQC1+JYi94PHDiS6SwGdVA8wR6Nn9B4PMzs6VQrqZ8mgkaBYMT/Dea7RbAZi3AT9QgzeyEaUcud9
	1FatTuE3VMwvc62ZLcJ3OkBUNUexRnB0GniyYw458DxAwTgw6FJoDpCOR+4BsyUJPaLPSzQ/0TBzg
	WPIw4UzXWbn4jb2/LjVGEhIKoVLJlfjAYaGSEGeSpscX42SwP6i82Rj1PPKXsEc6rQVDG7w8N1bjp
	D34DOlP6wrVbvqwfImbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIMTE-005Zom-TW; Fri, 11 Feb 2022 03:19:40 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIMT8-005ZoF-Gc
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 03:19:36 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=hongnan.li@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V46e-4F_1644549568; 
Received: from localhost(mailfrom:hongnan.li@linux.alibaba.com
 fp:SMTPD_---0V46e-4F_1644549568) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 11 Feb 2022 11:19:28 +0800
From: Hongnan Li <hongnan.li@linux.alibaba.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org,
	richard@nod.at
Subject: [PATCH] fs/jffs2: fix comments mentioning i_mutex
Date: Fri, 11 Feb 2022 11:19:28 +0800
Message-Id: <20220211031928.113693-1-hongnan.li@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_191934_769929_01268A72 
X-CRM114-Status: UNSURE (   9.47  )
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

From: hongnanli <hongnan.li@linux.alibaba.com>

inode->i_mutex has been replaced with inode->i_rwsem long ago. Fix
comments still mentioning i_mutex.

Signed-off-by: hongnanli <hongnan.li@linux.alibaba.com>
---
 fs/jffs2/jffs2_fs_i.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/jffs2_fs_i.h b/fs/jffs2/jffs2_fs_i.h
index 2e4a86763c07..93a2951538ce 100644
--- a/fs/jffs2/jffs2_fs_i.h
+++ b/fs/jffs2/jffs2_fs_i.h
@@ -18,11 +18,11 @@
 #include <linux/mutex.h>
 
 struct jffs2_inode_info {
-	/* We need an internal mutex similar to inode->i_mutex.
+	/* We need an internal mutex similar to inode->i_rwsem.
 	   Unfortunately, we can't used the existing one, because
 	   either the GC would deadlock, or we'd have to release it
 	   before letting GC proceed. Or we'd have to put ugliness
-	   into the GC code so it didn't attempt to obtain the i_mutex
+	   into the GC code so it didn't attempt to obtain the i_rwsem
 	   for the inode(s) which are already locked */
 	struct mutex sem;
 
-- 
2.19.1.6.gb485710b


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
