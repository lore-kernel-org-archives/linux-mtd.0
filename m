Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02925C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoTHCIN1Cjjxqbr9Uz5hm3+N31en3uWNW02+KkU6PJ8=; b=OqbvpUjBUZ5GS2
	vVRmXk1m1hSvetsKJEkdcvnILoh3jaYWg6kilaQzqiyvx55jWxQUSceqzKAvpzz7h8FR6ir5R94J3
	GFPD2iIWwE63sD3J6mYL1MdsbxgKORyQxMpmAmvw94GAOfMCFpTnQm3H6WiUBptEFC6NFyv6DCJaM
	F9ri8LkZ2jBpscaKpmzuhvYpY6KcciOmV4d0YZ9FE6ALeCpaAZcRI/Krl4/j1OBgT8jpbBcT6Cxb7
	4KYmLD3rM8uDrg0asy0RjBFJIWrS+R3nmiiAoJMzLx496JXU1u/wLJIUozMeewMxWTNo1byndsevQ
	yjUgmojAxdlYKalOO46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRQ-004aAH-0K;
	Wed, 24 Jan 2024 17:53:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRO-004a8C-2F
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ELYw0OTwbLf7aC1j9q8EPmu91n7Xk0swkeUGad3g6cE=; b=DXfV9RwNEGYxV04mDDTXZ/zDzj
	dYJhm+c4jviRRtcN0/TvEyvXTlQBRaNR1t5Kz9bSLMbsum19ZFO+uTNot967wy09mCVei2vLO1Zqt
	DWDWMObQKXYP9OAU/qpBepeFbkEocS9uN7W3D6f9rL2QM5iFC3N5yGRS7zlmnAHZolzZVppfiGy0t
	Qo8glQpPDCiAYALcmfxlzWFIbZSr4mr8m+N/rM8UPZ2/SJRkEt2zN3WFrHqlUXQMxg8Bt+QhnM6ei
	2/nyg8jFHlfCxGMR8WTJLHe1XZzBr65fD1umbn96yHhCvjD7QKgONJIEQ9KK5TSeA7/wp2RPHYFY6
	0S4Zs4JA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVs-2wO7;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 11/15] ubifs: Convert allocate_budget() to work on a folio
Date: Wed, 24 Jan 2024 17:52:54 +0000
Message-ID: <20240124175302.1750912-12-willy@infradead.org>
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

The one caller has a folio, so pass it in instead of the page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 654af636b11d..5542d73db717 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -305,7 +305,7 @@ static int write_begin_slow(struct address_space *mapping,
 /**
  * allocate_budget - allocate budget for 'ubifs_write_begin()'.
  * @c: UBIFS file-system description object
- * @page: page to allocate budget for
+ * @folio: folio to allocate budget for
  * @ui: UBIFS inode object the page belongs to
  * @appending: non-zero if the page is appended
  *
@@ -316,15 +316,15 @@ static int write_begin_slow(struct address_space *mapping,
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
@@ -348,11 +348,11 @@ static int allocate_budget(struct ubifs_info *c, struct page *page,
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
@@ -460,7 +460,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
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
