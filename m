Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxdDMeqOraEMf5vzwhc5O6EaO/LeJaPJeel+yXmT0As=; b=cfECvllf8YTc45
	q04yRfnObc9chF8N8/JFLr3ITM5eMi8G1I7BlbsEhWjoD6AQDD8mDmsTPCX1UE34RzFK1Mb67xXCR
	+/2q64ngAEeFdpP1Y9My3aid8VU8HFqKah1M/zYbidv0LRUjHcJ3ymb59mw7iCP6AjWlY3A9FBpRX
	tdg/fbUxgQGaFfEF/Cf5QygtA3G5VBcWSuyEXiO1eraIcW8aQ2le1UXycE34UdHcN5otN/d4z0bVd
	mbpTUu20465yQt5c3iodXw9fMlI+lIkLyME5ymsFb8wG+pLz9XwafyEILuQJzAWbtuUa5+jkJhmfd
	fQX2+W1Ri0NmsVGYiTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJp4-002o1E-IK; Mon, 06 Jun 2022 20:59:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJoy-002nz6-Je
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xi6bfdZ9kew/Ht/n6wJe844q1fNiFHAUuQwBybhvWV8=; b=SPlA9TQH81xoMoIY10n2YxKfFT
	FsYePoVkMqprqpv6ZpSb8LgcBJlPTx6ZiQnv9+DpcX1C8BhCoh731GzGv3vwXqOhVgpjWqAcZ9x5Q
	yXSG40C4z1zTwsHq25TqavEFM/aIkrZ74keXov/lJSFAeAlVFO92OjNCITHAZeey74UYtElj1IkQ9
	igzOLTZbXbr/H/xrC6wuD1gd2dEhozUsRpbKST11t4x3padiQWXP0MH6RjFWVF6lx2GnIIN77FMNF
	eqfhiP3IbavqdfjHnrPmIl/jNgL2ME2jYU2bFfEUdA0P2115AUzGiBLzXrUZQ116ZbPHL/l6z5/G3
	D9YuFHRg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWx-00B19m-P8; Mon, 06 Jun 2022 20:40:55 +0000
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
Subject: [PATCH 15/20] balloon: Convert to migrate_folio
Date: Mon,  6 Jun 2022 21:40:45 +0100
Message-Id: <20220606204050.2625949-16-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
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

This is little more than changing the types over; there's no real work
being done in this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/balloon_compaction.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 4b8eab4b3f45..3f75b876ad76 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -230,11 +230,10 @@ static void balloon_page_putback(struct page *page)
 
 
 /* move_to_new_page() counterpart for a ballooned page */
-static int balloon_page_migrate(struct address_space *mapping,
-		struct page *newpage, struct page *page,
-		enum migrate_mode mode)
+static int balloon_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	struct balloon_dev_info *balloon = balloon_page_device(page);
+	struct balloon_dev_info *balloon = balloon_page_device(&src->page);
 
 	/*
 	 * We can not easily support the no copy case here so ignore it as it
@@ -244,14 +243,14 @@ static int balloon_page_migrate(struct address_space *mapping,
 	if (mode == MIGRATE_SYNC_NO_COPY)
 		return -EINVAL;
 
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
+	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
+	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
 
-	return balloon->migratepage(balloon, newpage, page, mode);
+	return balloon->migratepage(balloon, &dst->page, &src->page, mode);
 }
 
 const struct address_space_operations balloon_aops = {
-	.migratepage = balloon_page_migrate,
+	.migrate_folio = balloon_migrate_folio,
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
 };
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
