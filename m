Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F41C47DB7
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8fNuHKZYzQtEevipi0FUOkD1L7R7tM6DNZxXAd35nE=; b=JlV+X9Sk3caTRr
	verASUSHmXset6B73c7EL+Vzbc40exkDH2XUSagD8MzFY+DTBcSBz8XfIwFMic+5oZw+b4H5xTvdK
	LtJUPK2GJyJEaLNadAfamHGSPRiZtpFVCrBqLFzvFJqBjj6FZgKvh8TZQu0mXHgeqFUyypj+CTN18
	FLLUEzY9ZFG3YMhoEnF/7h6t5lW/s8HckfLISHq7ZRbW9WICK0f0p9u0eIicjNghdMoXfhZcfWX1N
	bMvf2V7iIh7jAmBD3A3zLWOUtWuTDrUOosqVOH7HMrR94F+7yB+ATb2Et3Um6WUU0gjEb7Dx3BBEG
	h+Uk/Ap4jGeKPmHkcqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS2-008ZKc-2v;
	Sat, 20 Jan 2024 23:08:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIM-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WBiXg7WFyw+4JQwd+Uvjhm4gE+euzmY05foRyB/KH4I=; b=t5/dGVWnKDvSlw7rIHYvctpmmN
	14OtOauHvfGIDhMESlMFInSFx5TDBB75a/t84o1HHQ/MAXwS8jp3F0ysHNDkLKWHHI6tzaMqOKfbm
	2q0sYOWe6VixknakFFO1D7H4ylSJZwUtqHHWM9xHz2DU2kfOWubN4aCl96swv4nLZepFRBKxMNmIE
	ChfnEgW4/FvqM6nD84fucxdIKxJeFq2daeqzhq2ArQnONCYi8LY1jLQ9S4L9sp8VlNOV4CixEG/tL
	Z0gG9P8NX00sHK3Pg6KWScgJQcWVDAZXen96k24VhNj8l0KclGQftWnofi5AXnMnMKmWE20X6zIU0
	26Qg0SBw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRw-0000000AzXL-18jx;
	Sat, 20 Jan 2024 23:08:28 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 12/15] ubifs: Convert cancel_budget() to take a folio
Date: Sat, 20 Jan 2024 23:08:20 +0000
Message-ID: <20240120230824.2619716-13-willy@infradead.org>
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

The one caller already has a folio, so pass it in instead of the page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 6bc7965ce918..f34371436a84 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -501,14 +501,14 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
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
@@ -516,8 +516,8 @@ static void cancel_budget(struct ubifs_info *c, struct page *page,
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
@@ -550,7 +550,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
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
