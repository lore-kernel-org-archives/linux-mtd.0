Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718CBC43464
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 08:10:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 130622085B
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 08:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyk4qb4O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oxgdaZkE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 130622085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gVyij15EZKOn8lpgzR0E8/wgBQdOokozepDUTznL49k=; b=hyk4qb4OdMhOwEvhY0LzZUFS8
	nuvQT5IypHQ4VBWOQy1C1wR0xejzvplt5wb9LuqK8da73yRPEKDHkKjDZ2AQ9E89kBY6SFJI8q1AA
	1V4gZORBs7Ml8+qD+tf5FyCSOPP9R63GxwqfuVQMuKCE+fd8NBX5RU0E7wEzzPbTlNyPFb1OzVyg7
	2Wf9B0HZq+vX2BbGaogFPMm8cNbOXt7s2xRnjjFKZqUS9JJSyqzBORXmTDof3jcntjUrDFHOczohI
	qrSXFeBcHr4+G8kamIWoXgOMcj8jn0Zsa3VYymsEsVtpB4YluMrcDUZTMyM3mxYbwrwTRJI2ryxIP
	Btnr2CTFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGtI-0005BJ-Tw; Mon, 21 Sep 2020 08:09:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGrX-0004G5-Fk
 for linux-mtd@merlin.infradead.org; Mon, 21 Sep 2020 08:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XopQpzpw3KoIwQKF1nuIAvoWKkMjHrthqtRC/LQIsIM=; b=oxgdaZkE3vPwWoHdsZB5QbIkU9
 dL790/gcWo6Rnc9CEMtjIP8jLgJWfdPIqnIy4Phpn7NiEoP0QlzqARJVd+06/78JyNR44cXsbj0gn
 KcumUL855ONLqYrlrHrZ3J4izrnKmwjOC46x3Z4vWCvJUwWoW6d0h3BSZ+Cr2UebzwDjkM90paJDN
 361y9eDen7Dc1xnQk4Ncz+9HHbcA6BiwjQGH5qUcTEUWHEkmc+1OHhIdDt1HgFZahvWk6pWRyuJp3
 PplYqA7/ILui1zsuTbHmvb++kDVfdzW00tb9ASHypK4eAVE9x77amyMRmEHpk0DLQMl8OIicKkPY1
 uYd7TsnQ==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGrW-0006YR-0N; Mon, 21 Sep 2020 08:07:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/13] bdi: invert BDI_CAP_NO_ACCT_WB
Date: Mon, 21 Sep 2020 10:07:33 +0200
Message-Id: <20200921080734.452759-13-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921080734.452759-1-hch@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Justin Sanders <justin@coraid.com>, Jan Kara <jack@suse.cz>,
 Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace BDI_CAP_NO_ACCT_WB with a positive BDI_CAP_WRITEBACK_ACCT to
make the checks more obvious.  Also remove the pointless
bdi_cap_account_writeback wrapper that just obsfucates the check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/fuse/inode.c             |  3 ++-
 include/linux/backing-dev.h | 13 +++----------
 mm/backing-dev.c            |  1 +
 mm/page-writeback.c         |  4 ++--
 4 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 17b00670fb539e..581329203d6860 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1050,7 +1050,8 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
 		return err;
 
 	/* fuse does it's own writeback accounting */
-	sb->s_bdi->capabilities = BDI_CAP_NO_ACCT_WB | BDI_CAP_STRICTLIMIT;
+	sb->s_bdi->capabilities &= ~BDI_CAP_WRITEBACK_ACCT;
+	sb->s_bdi->capabilities |= BDI_CAP_STRICTLIMIT;
 
 	/*
 	 * For a single fuse filesystem use max 1% of dirty +
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 5da4ea3dd0cc5c..b217344a2c63be 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -120,17 +120,17 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
  *
  * BDI_CAP_NO_ACCT_DIRTY:  Dirty pages shouldn't contribute to accounting
  * BDI_CAP_NO_WRITEBACK:   Don't write pages back
- * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
+ * BDI_CAP_WRITEBACK_ACCT: Automatically account writeback pages
  * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
  */
 #define BDI_CAP_NO_ACCT_DIRTY	0x00000001
 #define BDI_CAP_NO_WRITEBACK	0x00000002
-#define BDI_CAP_NO_ACCT_WB	0x00000004
+#define BDI_CAP_WRITEBACK_ACCT	0x00000004
 #define BDI_CAP_STRICTLIMIT	0x00000010
 #define BDI_CAP_CGROUP_WRITEBACK 0x00000020
 
 #define BDI_CAP_NO_ACCT_AND_WRITEBACK \
-	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY | BDI_CAP_NO_ACCT_WB)
+	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY)
 
 extern struct backing_dev_info noop_backing_dev_info;
 
@@ -179,13 +179,6 @@ static inline bool bdi_cap_account_dirty(struct backing_dev_info *bdi)
 	return !(bdi->capabilities & BDI_CAP_NO_ACCT_DIRTY);
 }
 
-static inline bool bdi_cap_account_writeback(struct backing_dev_info *bdi)
-{
-	/* Paranoia: BDI_CAP_NO_WRITEBACK implies BDI_CAP_NO_ACCT_WB */
-	return !(bdi->capabilities & (BDI_CAP_NO_ACCT_WB |
-				      BDI_CAP_NO_WRITEBACK));
-}
-
 static inline bool mapping_cap_writeback_dirty(struct address_space *mapping)
 {
 	return bdi_cap_writeback_dirty(inode_to_bdi(mapping->host));
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 8e3802bf03a968..df18f0088dd3f5 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -745,6 +745,7 @@ struct backing_dev_info *bdi_alloc(int node_id)
 		kfree(bdi);
 		return NULL;
 	}
+	bdi->capabilities = BDI_CAP_WRITEBACK_ACCT;
 	bdi->ra_pages = VM_READAHEAD_PAGES;
 	bdi->io_pages = VM_READAHEAD_PAGES;
 	return bdi;
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index e9c36521461aaa..0139f9622a92da 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2738,7 +2738,7 @@ int test_clear_page_writeback(struct page *page)
 		if (ret) {
 			__xa_clear_mark(&mapping->i_pages, page_index(page),
 						PAGECACHE_TAG_WRITEBACK);
-			if (bdi_cap_account_writeback(bdi)) {
+			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
 				struct bdi_writeback *wb = inode_to_wb(inode);
 
 				dec_wb_stat(wb, WB_WRITEBACK);
@@ -2791,7 +2791,7 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
 						   PAGECACHE_TAG_WRITEBACK);
 
 			xas_set_mark(&xas, PAGECACHE_TAG_WRITEBACK);
-			if (bdi_cap_account_writeback(bdi))
+			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT)
 				inc_wb_stat(inode_to_wb(inode), WB_WRITEBACK);
 
 			/*
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
