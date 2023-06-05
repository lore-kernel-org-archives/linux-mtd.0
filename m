Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2249C7EE24
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C/eywYasHt9enjmyEsfLTiwBOnyGzGwxdQm1jD3YDE=; b=B3LdqlVUiTd5fp
	vElprEWEDDCU677qKSp0a0ZW+yu13J4P3Lp70njBDKQin9pU5e7La1+10f6dAhXGPsfBj08Lv/DzT
	a5bGh2BrNVRVbQrvG+EjT7qolN69BortyDY7DXu6q7kdj3wp0PJbb6JShF6m5kUFKymQO6Bd8pbz4
	qbORmr1GEamHWZPidlqYMCOueg/s+TavuAxhcrTHQYW9bJk+QZPg0JNF2aaYHBrjWE5Ny8+csqjJk
	zkLqCIDD+7dNPXJDn8ZaDPZSwHzcaqypNVcvqChTmQ491G0IyyQu6gAfYvdBqSPekUayyfCJjX1tR
	6Eu6kWTJTmchKQ/vWDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPg-00GBoK-1r;
	Mon, 05 Jun 2023 16:50:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPe-00GBnT-38
	for linux-mtd@bombadil.infradead.org;
	Mon, 05 Jun 2023 16:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=INGvXmo1gpJ39BTW0aMzLO0L7xz1NqirMG8wRqMY0Xg=; b=SjKnNlbbfDgSTZbjRYUuZMRFRj
	bx0VNvdKNZSBxuqJLptI/2KmEBqT++kTYyYTNR1Ohu2VxdrSjzmjMJoi8o8h16KM3H9/zqqLWe7zU
	DZx0qWHFQPGYzwwdeDXlMQ5pRAV9QSWwO8QQ4oaaEzJmoKxoqpYcO7/aV8HX0cD/8hyL5SJNkV0K2
	GXICloYAmak4djBbPC9HZh4o6fjroCJ+jOTNi9NGDSYPt4WvofkI1a8mfUdM+sRzkCxgegkNR7giB
	ccC8y0zLEXdDvLRcMnGNc6uK94CDDtNrLlwirSPsWh7oh+S+kLPQyrfREUEYS4UVcBBlMQ4kDo0Xe
	dhtds5/w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6DPa-00CCar-Gy; Mon, 05 Jun 2023 16:50:30 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/4] ubifs: Convert from writepage to writepages
Date: Mon,  5 Jun 2023 17:50:26 +0100
Message-Id: <20230605165029.2908304-2-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230605165029.2908304-1-willy@infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org>
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

This is a simplistic conversion to separate out any effects of
no longer having a writepage method.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 979ab1d9d0c3..8bb4cb9d528f 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1003,8 +1003,10 @@ static int do_writepage(struct page *page, int len)
  * on the page lock and it would not write the truncated inode node to the
  * journal before we have finished.
  */
-static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
+static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
+		void *data)
 {
+	struct page *page = &folio->page;
 	struct inode *inode = page->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_inode *ui = ubifs_inode(inode);
@@ -1076,6 +1078,12 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 	return err;
 }
 
+static int ubifs_writepages(struct address_space *mapping,
+		struct writeback_control *wbc)
+{
+	return write_cache_pages(mapping, wbc, ubifs_writepage, NULL);
+}
+
 /**
  * do_attr_changes - change inode attributes.
  * @inode: inode to change attributes for
@@ -1636,7 +1644,7 @@ static int ubifs_symlink_getattr(struct mnt_idmap *idmap,
 
 const struct address_space_operations ubifs_file_address_operations = {
 	.read_folio     = ubifs_read_folio,
-	.writepage      = ubifs_writepage,
+	.writepages     = ubifs_writepages,
 	.write_begin    = ubifs_write_begin,
 	.write_end      = ubifs_write_end,
 	.invalidate_folio = ubifs_invalidate_folio,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
