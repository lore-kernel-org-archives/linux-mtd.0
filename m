Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21E3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55yLpMuRZSRx/0bXki3nE5KkW8KqdCOWb5NxUibDflg=; b=ROMi94zRBfRRe8
	ac9JFfcwa6bQp844yfjShLqVoU9vty8K7On8jGiY/ifOc7rUtHXqorMVcSKFRIxd5E1P2wvXFANY7
	3L09XUR6ps4uc2pVsfZtj72WFeVncTB/QMCPFm4NS/phTeE+2ZBSmkyOORXd2XNAaRHSsp9koseOt
	MhusmqU/LxoSszLfetlc0UOOE68U9ur3axMTCtMgu7AXC6iJtXg46z4pwEfF7LAgsWEd9A6/QNfeG
	gXzaQ+tbeFMIZhQOlRIJEVIflK4Ep8rIjoRdUgx/vtCZaPSRq1hpFcrBv6NkDGShDUvl54lDkbSO3
	Px7/hjTY2GmTYVJCG++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJX8-002hlM-NB; Mon, 06 Jun 2022 20:41:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJX3-002hhN-Mq
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NFScYX57GEbw0yH/d1QXpe8YFpfaQsvuaQCT3ii6ess=; b=mDp4J3wn+JfgTBMvZgEUqjDjOc
	MdvHmectsbLkZvfTk8nG6ytXS1+4dBHiC4pMAhcy3dH+w+BngrUwTH364Opf+ULDH9RffR6xS8W1s
	NvNCsPvgWsTpdK5si++BB7gskVwFgeJKaRz9oSkBMT/tvUH1htLz8dXlAm4tajf1oQVpZT/iQpp3Z
	3qvjBqAGoN/HgsaNXSczCYJXunICX2cMGKbV8nqWYAZ1dFtuqgFYtfMpTC7xMxk50hUBGd3mZWqxV
	6hlTudv8DYvIDVhKEtAVCLpJUOSZgQOHlnJd6eZoWquUE4SD1aKFk5s64qg6Qy5XVFt9b2QyPeQP8
	VdadEfOg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWy-00B19s-0v; Mon, 06 Jun 2022 20:40:56 +0000
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
Subject: [PATCH 18/20] zsmalloc: Convert to migrate_folio
Date: Mon,  6 Jun 2022 21:40:48 +0100
Message-Id: <20220606204050.2625949-19-willy@infradead.org>
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

zsmalloc doesn't really use folios, but it needs to be called like this
in order to migrate an individual page.  Convert from a folio back to
a page until we decide how to handle migration better for zsmalloc.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/zsmalloc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 5d5fc04385b8..8ed79121195a 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1865,9 +1865,11 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 	return true;
 }
 
-static int zs_page_migrate(struct address_space *mapping, struct page *newpage,
-		struct page *page, enum migrate_mode mode)
+static int zs_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
+	struct page *newpage = &dst->page;
+	struct page *page = &src->page;
 	struct zs_pool *pool;
 	struct size_class *class;
 	struct zspage *zspage;
@@ -1966,7 +1968,7 @@ static void zs_page_putback(struct page *page)
 
 static const struct address_space_operations zsmalloc_aops = {
 	.isolate_page = zs_page_isolate,
-	.migratepage = zs_page_migrate,
+	.migrate_folio = zs_migrate_folio,
 	.putback_page = zs_page_putback,
 };
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
