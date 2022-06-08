Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4713CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+15Kj9QHPhwhIdb+dWehiD+G41Bax3qD0VHjUKi3gOU=; b=ps8vO3AAhPQ/FZ
	QXHcRr+2vEtIpsLtuoNbE9f0nG1uIJFUx+JRdYnqxU/qQplM/NY+pGHhEKGuTEQo8RJd/qJOdFJoH
	0+UHKNMoweyfDLWvf0R+XYEyK0jx9Pcn24z+zPE4FujSgVg/QsDA3GkHTekwv6ZfJgMQ1RMHaocWj
	Ob9dDQI+fndf+7K282iBdE4rm301gSheKheoAp0dk0MD/CRdi/+2QDgzTRphpwoQG4YmTWBmlwKKx
	gqLceoofsvKac6d6nIq8WpjvQyNaVNtLXx47a2jkx6DOQPJtBo9YolF3LNQIm+lwyaR1UdT4AVQno
	3ngutANrKkQgZOFRoKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxJZ-00Dvom-Tm; Wed, 08 Jun 2022 15:09:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxJN-00DvgH-D7
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ncg84OMjo+AvVLmZPKmxXncRAMSRMDL0v/ScNwY3xFo=; b=ZH1jj5JLt5Huo0hFneWdzgOddm
	tf5K8ofhIHTgnH+k78szErcZy1qjS4hpsIPzVbNLfB5AIeGJmWMbZktwyBE6yJjNN24hOFdbIWYps
	0k5T7kH1RFNzHhpJsupjLqgjCdLqwuWzSZgNhY2n52oP0kMd87dkVgBHfSoFTVS8nt6uZvyuZE06K
	gHrqY4UgBaz7xm0r/3v2l0jjzdslv1KD0nkS+J0Cbg4WA6mbH+6xsumitM+mTT5Vcrrl3/x0lv80/
	61+K0Wy9nZhpfjr/5EC2MG8rMJ90zjUNQarBbpaXsRYondC+xNRnTEkCIjXwjmRbYvVaaccl1uAzH
	CsHsOp5g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCu-00CjFU-Ga; Wed, 08 Jun 2022 15:02:52 +0000
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
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 08/19] btrfs: Convert btree_migratepage to migrate_folio
Date: Wed,  8 Jun 2022 16:02:38 +0100
Message-Id: <20220608150249.3033815-9-willy@infradead.org>
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

Use a folio throughout this function.  migrate_page() will be converted
later.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/disk-io.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 12b11e645c14..9ceb73f683af 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -952,28 +952,28 @@ void btrfs_submit_metadata_bio(struct inode *inode, struct bio *bio, int mirror_
 }
 
 #ifdef CONFIG_MIGRATION
-static int btree_migratepage(struct address_space *mapping,
-			struct page *newpage, struct page *page,
-			enum migrate_mode mode)
+static int btree_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
 	/*
 	 * we can't safely write a btree page from here,
 	 * we haven't done the locking hook
 	 */
-	if (PageDirty(page))
+	if (folio_test_dirty(src))
 		return -EAGAIN;
 	/*
 	 * Buffers may be managed in a filesystem specific way.
 	 * We must have no buffers or drop them.
 	 */
-	if (page_has_private(page) &&
-	    !try_to_release_page(page, GFP_KERNEL))
+	if (folio_get_private(src) &&
+	    !filemap_release_folio(src, GFP_KERNEL))
 		return -EAGAIN;
-	return migrate_page(mapping, newpage, page, mode);
+	return migrate_page(mapping, &dst->page, &src->page, mode);
 }
+#else
+#define btree_migrate_folio NULL
 #endif
 
-
 static int btree_writepages(struct address_space *mapping,
 			    struct writeback_control *wbc)
 {
@@ -1073,10 +1073,8 @@ static const struct address_space_operations btree_aops = {
 	.writepages	= btree_writepages,
 	.release_folio	= btree_release_folio,
 	.invalidate_folio = btree_invalidate_folio,
-#ifdef CONFIG_MIGRATION
-	.migratepage	= btree_migratepage,
-#endif
-	.dirty_folio = btree_dirty_folio,
+	.migrate_folio	= btree_migrate_folio,
+	.dirty_folio	= btree_dirty_folio,
 };
 
 struct extent_buffer *btrfs_find_create_tree_block(
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
