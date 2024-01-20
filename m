Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB040C47DDE
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VkGV/cqZtLoK0NaUrCrK+jgd1+iLUIWKSOc5WPUDw8=; b=ZfCteD+YUvJiD3
	fuF7Yhpy08SFVLZlSO7JoZeOjLUno3RMpjK+/Pc09MHhAZnmwL9RnumJ3EoBIkjOeEIFSmnBYj02R
	mHsc4UqqKIyMASwb7f1eboUFvDS3xNDWNgrSKojcATrz6DTkfpYqAfOFp48qin5lCQ9AtV+vLfE4d
	vuLnLS3sC5zDtT2ogUsn2KnrlE5afIdbrKamYg9yIS5J85mTEWkzTBfwJhP4xmAwDsEdHuHiuu/OI
	wFu6SIERx7bLDTjKF/yHgIVHgf8q4I6QnY+ssa2r2juNqVTwekTeX11mouar6san3W4TpS6fLzqV2
	Updf6BAc5mnbR0gip6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS1-008ZKA-0v;
	Sat, 20 Jan 2024 23:08:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIK-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+pfj62HVFLRhQa76E5lqZ9ATTPCNNeY/kUCyEYPP1Fo=; b=YcLhXckWLN8188OGYVr/PiAQi8
	rb1EozocNmZwnDA3dPF5m/zJv1NjcgphRRyaQdDYlXMCOfpHAe89yiFr/ARnyXjP2HCJr3FWX4Qbh
	YbR+1pFtaP0acNaCOJsm7MWW3VNbRiEqz7lGlcj3UyplJl9wt1XPYORl00IVttHl9QoqR6l/KoUAa
	+nAB9HeLWJrBHUSoxksU6Q37ydLlhJ7EWfXRRjA6q4pSMGgcRiLjge8thEfqo7ZVqS1fpvFOMI9ce
	46NYtsOOSewPMC63F/4vJUXNolLQdHevDKVpCEASaNYyTqALLr+8GrPHLsNHJFlnuvF5NKkTsJ7dl
	kLIjMQMw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRw-0000000AzXF-0Zrn;
	Sat, 20 Jan 2024 23:08:28 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 11/15] ubifs: Convert allocate_budget() to work on a folio
Date: Sat, 20 Jan 2024 23:08:19 +0000
Message-ID: <20240120230824.2619716-12-willy@infradead.org>
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

The one caller has a folio, so pass it in instead of the page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cc450afdcc47..6bc7965ce918 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -307,7 +307,7 @@ static int write_begin_slow(struct address_space *mapping,
 /**
  * allocate_budget - allocate budget for 'ubifs_write_begin()'.
  * @c: UBIFS file-system description object
- * @page: page to allocate budget for
+ * @folio: folio to allocate budget for
  * @ui: UBIFS inode object the page belongs to
  * @appending: non-zero if the page is appended
  *
@@ -318,15 +318,15 @@ static int write_begin_slow(struct address_space *mapping,
  *
  * Returns: %0 in case of success and %-ENOSPC in case of failure.
  */
-static int allocate_budget(struct ubifs_info *c, struct page *page,
+static int allocate_budget(struct ubifs_info *c, struct folio *folio,
 			   struct ubifs_inode *ui, int appending)
 {
 	struct ubifs_budget_req req = { .fast = 1 };
 
-	if (PagePrivate(page)) {
+	if (folio->private) {
 		if (!appending)
 			/*
-			 * The page is dirty and we are not appending, which
+			 * The folio is dirty and we are not appending, which
 			 * means no budget is needed at all.
 			 */
 			return 0;
@@ -350,11 +350,11 @@ static int allocate_budget(struct ubifs_info *c, struct page *page,
 		 */
 		req.dirtied_ino = 1;
 	} else {
-		if (PageChecked(page))
+		if (folio_test_checked(folio))
 			/*
 			 * The page corresponds to a hole and does not
 			 * exist on the media. So changing it makes
-			 * make the amount of indexing information
+			 * the amount of indexing information
 			 * larger, and we have to budget for a new
 			 * page.
 			 */
@@ -462,7 +462,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 		}
 	}
 
-	err = allocate_budget(c, &folio->page, ui, appending);
+	err = allocate_budget(c, folio, ui, appending);
 	if (unlikely(err)) {
 		ubifs_assert(c, err == -ENOSPC);
 		/*
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
