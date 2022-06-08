Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8487BC43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MStMEJwYnu5S6plsbhJMbFpqZbWXtwzNaaqlMP8xAeE=; b=RC3KXKtNaQVf6Z
	SGG3icxw4ICUcefhcuXdgIv5uSpczbEvPoGvy/PpZrlUhv6cv5k0cJ17DeBgfNMtjJVFdUxen0MSE
	54U518M3vFW1Y5BGIwmnrB7L5sCQWCBXQUO/cXiHKOlTFdSXuaiz7kNopdNSxduqCQ5aHq+2A4mu0
	YnVw6lTvE51vro3e+H47fAp3RfAVIKB3cE/dvahnvEL39X1S3qxp9E1mnR77DgpCzj5BeZxftSwjf
	Hmi9aqlZGaOhT9JGGOYYIqBwxq75qc8pGMIczlt/UP/84v/Ovxr1sB+6Rn7TeikpJOuIUVNJiLqFa
	+zOMWPQO0kznjf/xYT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxF9-00DtPp-Ua; Wed, 08 Jun 2022 15:05:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEq-00DtBr-8J
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z93Cnt+g7bn8Rks2qPHkqYOXC3V0vuJ4otfYMlwXMI0=; b=A8DhNIxJJ669f/qkcLeDGf72ZN
	VH8LAA48msbBnAVr0E+7FelEvxIN6WeTVVsY3+XbJ3JFz8o4YxHui00x1Y70h4ocWwm1rEhwBIjKN
	KqmXwNooNqQHQTU0PGaJX9VSpy4TIudFD2m7wXi5brVUZ9sATYKFon0A8unvko2wdijgsEP55z5gw
	LICUf+6yA08O9mkZ2CoaqXjq3c6UpqxZ4JALyMMrvUsNOS/irI5NCXGs3fXnIssRB78QjoY8+rsu6
	2JldLt7koSxVP03aOcqMPx4vsCCm76xYnTTjxDObf8Wn4Fx8tpZC1OJvSXomcGoxR7FYaLBgr8kSN
	KwIQrhwQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCv-00CjFm-8u; Wed, 08 Jun 2022 15:02:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 17/19] secretmem: Convert to migrate_folio
Date: Wed,  8 Jun 2022 16:02:47 +0100
Message-Id: <20220608150249.3033815-18-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220608150249.3033815-1-willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
MIME-Version: 1.0
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

This is little more than changing the types over; there's no real work
being done in this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/secretmem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 1c7f1775b56e..658a7486efa9 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -133,9 +133,8 @@ static const struct file_operations secretmem_fops = {
 	.mmap		= secretmem_mmap,
 };
 
-static int secretmem_migratepage(struct address_space *mapping,
-				 struct page *newpage, struct page *page,
-				 enum migrate_mode mode)
+static int secretmem_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
 	return -EBUSY;
 }
@@ -149,7 +148,7 @@ static void secretmem_free_folio(struct folio *folio)
 const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
-	.migratepage	= secretmem_migratepage,
+	.migrate_folio	= secretmem_migrate_folio,
 };
 
 static int secretmem_setattr(struct user_namespace *mnt_userns,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
