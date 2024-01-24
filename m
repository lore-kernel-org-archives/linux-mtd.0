Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826F6C48260
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcBJBxc92jExQwls5/JPXy1mESmopCkO7pEteoTnNAo=; b=UBsG0DBa/VRuUc
	EsI6FFSPYGbVfe067A8LBA+TTQ/q4CG2QI+n7nsP5LYtPPxMuFN3bTMJcTlQB2JGuUoWqLCOf3D7S
	oFOsFenBborGdiBOXiLw4LDYP3i1/fWyRfJy6A90nrAebPYEhc8oicvGTY3krLkz4EYxHvXUjjjC3
	04Yu1NZzuSOhjIW7wbrIdDWKomCZg2oAk0XYKJt7y1TwElKJ9Uf1oRQ/2ysJ2ic2vHsPW/YAgDj8J
	Ccw9OJ+HXJoN4KdpLofrMaBHlEtwde4nK2dOsdJqupJzJE2ev8//OFmgRvP0COGATb6m0Joo7EnzO
	HGlJHRg35o53hRRQ4hVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRG-004a0m-0n;
	Wed, 24 Jan 2024 17:53:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRC-004Zvu-2M
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SWTrdgNrExHVtkdgx6uI7WIrqFvFEgIAoz3yv5G0N9E=; b=DsPuPe34pBg4Fa7Eva4fodqenO
	n4EPtHZ+BZeoFfG8pvbQ6WhboFIL1688YhIjEDkju7TA3lzq/eUg6Mi5kEd+CBV09QFoXwDGat1Rc
	x5UhkAp+pvkzlNeGGGCCHnDAHx4NtMYQ77aIm7q4KvqUQgubhozA9u0+hbSPhvqvD8msfqB4FnI5w
	Tqa5PygbB8TxbJGWK88ru1tvMHIQpM+WTCmJStI9uXKJJFoQLBtzczAoAGEeeY8iC02p6kYG0CIFu
	aoE1QaYvKCOxT2w1dS2ttjmndGnpwl+/ZXnyFiUGYYY6GDbcGcOwI20uYrcv5bxXYHlh0XYKoMbYF
	AC2dhA4g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQu-00000007LVN-3daS;
	Wed, 24 Jan 2024 17:53:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 02/15] ubifs: Convert from writepage to writepages
Date: Wed, 24 Jan 2024 17:52:45 +0000
Message-ID: <20240124175302.1750912-3-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124175302.1750912-1-willy@infradead.org>
References: <20240124175302.1750912-1-willy@infradead.org>
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
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index d0694b83dd02..2022a31006df 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1001,8 +1001,10 @@ static int do_writepage(struct page *page, int len)
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
@@ -1074,6 +1076,12 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
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
@@ -1643,7 +1651,7 @@ static int ubifs_symlink_getattr(struct mnt_idmap *idmap,
 
 const struct address_space_operations ubifs_file_address_operations = {
 	.read_folio     = ubifs_read_folio,
-	.writepage      = ubifs_writepage,
+	.writepages     = ubifs_writepages,
 	.write_begin    = ubifs_write_begin,
 	.write_end      = ubifs_write_end,
 	.invalidate_folio = ubifs_invalidate_folio,
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
