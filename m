Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A82DC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+zG36FKIX2oDMRaBRWJtmjGQBlL6dJHucFOnLgeUJw=; b=F3P23mndhwoi2l
	B93pkZ9DHqfqCWTG9XGehvb/lELIDK7Y2QWVruBw5oH+oeZK/ZO2dVHRpT0kS/OmLfvXNfG1x7hYF
	MfduWHOshfeurKmFpVdkzfIIjvbcCbvJ3+bzzU6nvnnv7tzyBrYPrwRkTyk48xDVsCPx9gvXJdv88
	tq9JFjaJIIhPe+9O6JSg0QoxhoauUx3rYJUEgRe8WmuDU9rXPsoTunObEhWGJX+Emq1iIP2NXib2z
	Sdg2MwGAU+BUboheUuVvuzIQhHSWhqh2JxATW+scHmbDoaReYAnpGXG/Y4A+yz0OWWRHjZKOViS9h
	MIlw37OqlPbP5VXpgLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRB-004Zvg-2Z;
	Wed, 24 Jan 2024 17:53:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR6-004ZsM-2J
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IEVbAZZovLeCPkDNm6M1D+kYK+iHGLVWZ9I5CTFHVkc=; b=e0C2m+c9qAA2Prjf9+bwOMQCNm
	vt/eSEUChKHRN2B02FnQgFWAcA3I26Xu4SCasDOS2QMD/iTQPZnqO2rnnRUgK0DKjugWNFlRdzDzZ
	LRk1t707HAaiS54v2MVZXZWCmhiszlryXT8ehxvgYWVamgHKutLY8iNRuYjocEd0XbnC0WCqVvyCu
	6mH7VgWSrnVGoj0DM0mUmhodYF8sXoKJN5qXFEV4OR3qo/+9UEEsNEsn2kvoWfS6bbEulmpNxwrU8
	g+JOkUgKZGvJMlL+FteHU3O1ymrGxuXpMykuvKAjEb6v2RFGyGCtyHbQyfHCHalJolU4MnmK/wSOI
	5KzRYCqA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVu-3ITG;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 12/15] ubifs: Convert cancel_budget() to take a folio
Date: Wed, 24 Jan 2024 17:52:55 +0000
Message-ID: <20240124175302.1750912-13-willy@infradead.org>
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

The one caller already has a folio, so pass it in instead of the page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5542d73db717..9cd2e6d37c5d 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -499,14 +499,14 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 /**
  * cancel_budget - cancel budget.
  * @c: UBIFS file-system description object
- * @page: page to cancel budget for
+ * @folio: folio to cancel budget for
  * @ui: UBIFS inode object the page belongs to
  * @appending: non-zero if the page is appended
  *
  * This is a helper function for a page write operation. It unlocks the
  * @ui->ui_mutex in case of appending.
  */
-static void cancel_budget(struct ubifs_info *c, struct page *page,
+static void cancel_budget(struct ubifs_info *c, struct folio *folio,
 			  struct ubifs_inode *ui, int appending)
 {
 	if (appending) {
@@ -514,8 +514,8 @@ static void cancel_budget(struct ubifs_info *c, struct page *page,
 			ubifs_release_dirty_inode_budget(c, ui);
 		mutex_unlock(&ui->ui_mutex);
 	}
-	if (!PagePrivate(page)) {
-		if (PageChecked(page))
+	if (!folio->private) {
+		if (folio_test_checked(folio))
 			release_new_page_budget(c);
 		else
 			release_existing_page_budget(c);
@@ -548,7 +548,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 		 */
 		dbg_gen("copied %d instead of %d, read page and repeat",
 			copied, len);
-		cancel_budget(c, &folio->page, ui, appending);
+		cancel_budget(c, folio, ui, appending);
 		folio_clear_checked(folio);
 
 		/*
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
