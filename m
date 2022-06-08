Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CB8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYgfYZmg436/fSyc+kE/1OZqoexHyfGRvAVNOf2K7a8=; b=qJ/xE+VOztjend
	ZwYZUxnjGVw4D4+aCzx2ZmYd/bx9P5Kde29Y2m8b0MVakjUym5o2lPNEZKol30hKVjY52k3fNJjjY
	RlU8PywMoNRgvIsGZCdApKVP6AJnO1GNAChh/Aw4u5RItCPmZR/xKcKDQmC8UFgM33G/ve9J9EO89
	qqlAXhrP5xcwmE6SKSPWpstl0EUIS7xg2SPftejXw4CgsnW2DK6IQfx3QvE3ORnMQkCtm5WEYB+/A
	ecBfCpQZpybCazkwXXW/ckTdLG/s67iMLI6vq4A1HbETFH/RYAl5p3eADwis+VjSLJweWva29/yUk
	zZ8P41zO15pQyPbev4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEs-00DtFL-8N; Wed, 08 Jun 2022 15:04:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEn-00DtBr-VF
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jUHtPvxpwYn/CbCKtCO4gIDrDPVTvyaQoVGtIQShqV8=; b=F0wkIwdh5JarabWL7s440hCeed
	JG7M+RAPNvEs0qtJ0odlvedPM5u6UNyXbTmEBm4Hx35BoOjFV1oKCmRWs7a2p1I7DWzzzvlvH7zxb
	NwAy72/kutKMINfwHD8wNSSOmlkp/ZbcRgANHqqHoyDCAzRFMPKBCLvDG/+pf/SqWyA6xVonIuvPK
	3Vo2mRZDOuHUiWFb793CtPIl0KBu+BtlMkUJpzHLOBoi3MTThxjS7QgPBZ4bWXFBqmBv38WY81zoI
	IOHo+aIWKHbzH55lED0UDiMkvsiu5YHhPck8zRT5hnVZDoeLyNfO5FO+6YtWEQzYK/lnegSOXMkks
	Gp33NrTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCu-00CjFe-U7; Wed, 08 Jun 2022 15:02:52 +0000
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
Subject: [PATCH v2 13/19] ubifs: Convert to filemap_migrate_folio()
Date: Wed,  8 Jun 2022 16:02:43 +0100
Message-Id: <20220608150249.3033815-14-willy@infradead.org>
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

filemap_migrate_folio() is a little more general than ubifs really needs,
but it's better to share the code.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 04ced154960f..f2353dd676ef 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1461,29 +1461,6 @@ static bool ubifs_dirty_folio(struct address_space *mapping,
 	return ret;
 }
 
-#ifdef CONFIG_MIGRATION
-static int ubifs_migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode)
-{
-	int rc;
-
-	rc = migrate_page_move_mapping(mapping, newpage, page, 0);
-	if (rc != MIGRATEPAGE_SUCCESS)
-		return rc;
-
-	if (PagePrivate(page)) {
-		detach_page_private(page);
-		attach_page_private(newpage, (void *)1);
-	}
-
-	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
-	else
-		migrate_page_states(newpage, page);
-	return MIGRATEPAGE_SUCCESS;
-}
-#endif
-
 static bool ubifs_release_folio(struct folio *folio, gfp_t unused_gfp_flags)
 {
 	struct inode *inode = folio->mapping->host;
@@ -1649,10 +1626,8 @@ const struct address_space_operations ubifs_file_address_operations = {
 	.write_end      = ubifs_write_end,
 	.invalidate_folio = ubifs_invalidate_folio,
 	.dirty_folio	= ubifs_dirty_folio,
-#ifdef CONFIG_MIGRATION
-	.migratepage	= ubifs_migrate_page,
-#endif
-	.release_folio    = ubifs_release_folio,
+	.migrate_folio	= filemap_migrate_folio,
+	.release_folio	= ubifs_release_folio,
 };
 
 const struct inode_operations ubifs_file_inode_operations = {
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
