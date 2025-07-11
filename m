Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E148C83F1D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jul 2025 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxRULIyUX3GaZ9VqcN4j7avQp/76lx5XFtga9WBc9/w=; b=rdKCPudefJILPB
	CkAQ0dqZknxxOVQ1+6SA7W4hr+P0yuAOBqCdCQfVl3NK27ZVB1E7DHM2EJtUxpNXXxGhSJXpHS2o1
	YK66fK3j2+JBUzxOOKNvMhPoGfNIe1rOeX73SleAeHIGaC6wgf0DZTZnu1rusZrjutzOK5STclFsW
	+dNo6rUHympBwkdDotjl2tXY6bX8ZS3lU4CEZla22j7kCyQj2w2yVeGAEiqDB9yKPzQ+48hVVlkZk
	+AJ+tqr+gQTnEu+1X1r+ifEwYYT0yncpK2DtKeFN695UuKrNqwXWJ5oSUrDV+LvZHs6RKdBAfxbjY
	htXPkydokHpExTStK4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9c4-0000000EEz3-28pl;
	Fri, 11 Jul 2025 09:00:12 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8ql-0000000E5eM-2qxy;
	Fri, 11 Jul 2025 08:11:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: stop using write_cache_pages
Date: Fri, 11 Jul 2025 10:11:16 +0200
Message-ID: <20250711081116.564445-1-hch@lst.de>
X-Mailer: git-send-email 2.47.2
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

Stop using the obsolete write_cache_pages and use writeback_iter directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ubifs/file.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index bf311c38d9a8..d52181f533ac 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -977,8 +977,7 @@ static int do_writepage(struct folio *folio, size_t len)
  * on the page lock and it would not write the truncated inode node to the
  * journal before we have finished.
  */
-static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
-		void *data)
+static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc)
 {
 	struct inode *inode = folio->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -1050,7 +1049,12 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 static int ubifs_writepages(struct address_space *mapping,
 		struct writeback_control *wbc)
 {
-	return write_cache_pages(mapping, wbc, ubifs_writepage, NULL);
+	struct folio *folio = NULL;
+	int error;
+
+	while ((folio = writeback_iter(mapping, wbc, folio, &error)))
+		error = ubifs_writepage(folio, wbc);
+	return error;
 }
 
 /**
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
