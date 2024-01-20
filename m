Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA7C47E49
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MRgyKkJ692DzyAtbx+vRAnhnSVIML5gqgpsmBsuaiw=; b=fLgzoCjZ8vxSBG
	Q2oHBWJCillG0d7989saF0tPuYZjdxz7HE2UKciDncSvEZZdy5gWsOKd/DcRsIL/ruDe2/q+rEV8O
	y0ChhEsoRtW4QkDtDAWf2LJz8VMrgovhiibfDV0whhClaFv7zFcWp5EKKKLjY5Qci7J21u7orCuIg
	mG2LiUYUn97sTVXg13eJ67a3QYyl0QxQI/lrGbJe8vFB/IIcTu2TX8mJrfODWpBUm0l9PbjWXEtye
	9QW0CwJl/Xa2NtxPuLwg6xtTwzugFexvuNovAHZJ3WfrjKDFakjG52iTbk92dwkVMRYZ7rnlnTUJV
	1NQ6ZOav8pS728VwVuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS9-008ZNe-0p;
	Sat, 20 Jan 2024 23:08:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS1-008ZKC-38
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4z0khGYiWNQyZt0ecSrl3YfD1tCE0g7u4Ic9ln2ioQs=; b=EnsTdlwCtJ1y6ZwpbCTHbZoLjS
	sglQsL+LjTNzDrER97dDuGh3nw5Vwsrj6YXIm15y5G7E06g9wfvvULu3TcJMUMpdXs8ezwC+mHR5m
	ewh49lUtiRbxIHGC004FAXtISNoILr6lL2HGpf9Ttg6xhjNRyfk4xv/QXx+tFtEDFZ1HO8q0KDRSE
	akSg96j7xI5m2evVDiw1Z+zwTfVzlASLCnOB++1fgjCROP++yDMHezpZArqk5dlDuG5GSDKuG+gyq
	seEx0DEzLo+zF1P9IXeFrzSY329aZHwhy2JrEJzXVCWz9RtW4YEjPepRGEVppKadwmr2GjIEVQ/kJ
	V45JlCYg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRu-0000000AzW1-3itt;
	Sat, 20 Jan 2024 23:08:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 02/15] ubifs: Convert from writepage to writepages
Date: Sat, 20 Jan 2024 23:08:10 +0000
Message-ID: <20240120230824.2619716-3-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240120230824.2619716-1-willy@infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
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
index 40a9b03ef821..007a73052561 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1006,8 +1006,10 @@ static int do_writepage(struct page *page, int len)
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
@@ -1079,6 +1081,12 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
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
@@ -1648,7 +1656,7 @@ static int ubifs_symlink_getattr(struct mnt_idmap *idmap,
 
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
