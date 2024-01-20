Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AA3C47DD9
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKVb9XPwF4nUJsTWdgp6o/SI4Kw9d6Jcb0641d463O8=; b=pT/6M0S11FJW3X
	Ny5QbigX8TrPyKAPT/iJEuU4RKj++UfT6BUwjA7BGKN7x1Aom3b7IGRyU3C2yw87QaWq+j66+4dCA
	ZrJctzuEc9SZJ8rKeRvY/OFLvcVNK8LZrzA7ka+7YG/wavsvvk1ZDukxcCQ9p9q+6EZVXwZkrdT0m
	u/T1IrmQxqw7lUanllXcTwUud1ZIQgth9KKc5hb+MIxs8kct/4NIpEBV3TJ9CVFEahZocYKeppTP2
	cRna6zhF9xCYFnRMLdPqQddoqVwPBU5xJtSZBZi/wBy7Haim7BBEZxZj4Y6SaLUsw2H3BCD91UEKp
	Qd/L5YFAsKqJiPNE9ZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS5-008ZLC-0H;
	Sat, 20 Jan 2024 23:08:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZI4-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XkaHGMGt53SwjvP38fxIGwhU3n+LAaDVWYrWt4x1lLk=; b=qwh/+t6VGbMzPwT954U9+opLGO
	VxH6WuCucZRU5DkSfTUOMXxraAshL73pJihDm7n5wB79X1J6Ko8DqI4/k6wEvM0iwk9b/NGhTAado
	8vac6fELjzGCvjxXl6AnygIGtmsf6eIaDp1wQKw7j4zVhiIYQQJ3ndAcqvAMEYztIYEznT/VETr6E
	ADsrK5mqCgiMbH2JlWLqw/IMpedOP46b0icbbA9a2PKzK5i6BbeaqAW+sGB+6Op7Gmu2GoXRV/N9V
	IFDiOHA5AWCsmNiutWSsl7cZJpFSMtzoi+SK6Ww/nTwaCm1GmFXwlfb7juL8vxqsO93yfT30XEmtf
	nU60UYEw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRu-0000000AzVy-3QZr;
	Sat, 20 Jan 2024 23:08:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 01/15] ubifs: Set page uptodate in the correct place
Date: Sat, 20 Jan 2024 23:08:09 +0000
Message-ID: <20240120230824.2619716-2-willy@infradead.org>
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

Page cache reads are lockless, so setting the freshly allocated page
uptodate before we've overwritten it with the data it's supposed to have
in it will allow a simultaneous reader to see old data.  Move the call
to SetPageUptodate into ubifs_write_end(), which is after we copied the
new data into the page.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5029eb3390a5..40a9b03ef821 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -463,9 +463,6 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 				return err;
 			}
 		}
-
-		SetPageUptodate(page);
-		ClearPageError(page);
 	}
 
 	err = allocate_budget(c, page, ui, appending);
@@ -569,6 +566,9 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 		goto out;
 	}
 
+	if (len == PAGE_SIZE)
+		SetPageUptodate(page);
+
 	if (!PagePrivate(page)) {
 		attach_page_private(page, (void *)1);
 		atomic_long_inc(&c->dirty_pg_cnt);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
