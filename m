Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldOYHPt+E5qAp11uO6BFtiXzSEz735krPgiOLL5dDIw=; b=EPGbQO4TY7ty0x
	DV2O85tdpWceBWGb4lrSHxXZ9zE+TbS7/8c8xuONNpVQs/BdwAP2VfvRcHMEsrlQW0bTXILVRIT0L
	BP4wnyMnc5DLN6rUNMonHrdwtMpPV0eHTXuSn8P7Cfv5peOx0GVQ5WMZIve3/QhlnV9KQmBMihLKB
	cwe3cc+2RysCMgeIyaOVXQ3AiCeSzvUsJBnRXh2lKeHTtaj77AaC7/RocW1AuZxeXeXWGw3sUI0n2
	jUL6SreFhBtVIP9LGRDPGIUxo7wOkxKyK45OsXi/uSWCqPce7AVsQw/QTV59+1tbFUAEpyS+NIXwf
	QAQfZ7u0dez4ZCA7C+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwENo-00DUqU-5H; Wed, 01 Jun 2022 02:46:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwENk-00DUjx-2j
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 02:46:50 +0000
Received: from kwepemi100011.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LCYQj4qv6zfZDX;
	Wed,  1 Jun 2022 10:45:01 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100011.china.huawei.com (7.221.188.134) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 1 Jun 2022 10:46:41 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 1 Jun
 2022 10:46:40 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<kirill.shutemov@linux.intel.com>, <willy@infradead.org>,
	<s.hauer@pengutronix.de>, <ext-adrian.hunter@nokia.com>,
	<Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 2/2] ubifs: ubifs_releasepage: Remove ubifs_assert(0) to valid this process
Date: Wed, 1 Jun 2022 11:00:00 +0800
Message-ID: <20220601030000.49714-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220601030000.49714-1-chengzhihao1@huawei.com>
References: <20220601030000.49714-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_194648_488169_20D632B5 
X-CRM114-Status: GOOD (  14.45  )
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

There are two states for ubifs writing pages:
1. Dirty, Private
2. Not Dirty, Not Private

The normal process cannot go to ubifs_releasepage() which means there
exists pages being private but not dirty. Reproducer[1] shows that it
could occur (which maybe related to [2]) with following process:

     PA                     PB                    PC
lock(page)[PA]
ubifs_write_end
  attach_page_private         // set Private
  __set_page_dirty_nobuffers  // set Dirty
unlock(page)

write_cache_pages[PA]
  lock(page)
  clear_page_dirty_for_io(page)	// clear Dirty
  ubifs_writepage

                        do_truncation[PB]
			  truncate_setsize
			    i_size_write(inode, newsize) // newsize = 0

    i_size = i_size_read(inode)	// i_size = 0
    end_index = i_size >> PAGE_SHIFT
    if (page->index > end_index)
      goto out // jump
out:
unlock(page)   // Private, Not Dirty

						generic_fadvise[PC]
						  lock(page)
						  invalidate_inode_page
						    try_to_release_page
						      ubifs_releasepage
						        ubifs_assert(c, 0)
		                                        // bad assertion!
						  unlock(page)
			  truncate_pagecache[PB]

Then we may get following assertion failed:
  UBIFS error (ubi0:0 pid 1683): ubifs_assert_failed [ubifs]:
  UBIFS assert failed: 0, in fs/ubifs/file.c:1513
  UBIFS warning (ubi0:0 pid 1683): ubifs_ro_mode [ubifs]:
  switched to read-only mode, error -22
  CPU: 2 PID: 1683 Comm: aa Not tainted 5.16.0-rc5-00184-g0bca5994cacc-dirty #308
  Call Trace:
    dump_stack+0x13/0x1b
    ubifs_ro_mode+0x54/0x60 [ubifs]
    ubifs_assert_failed+0x4b/0x80 [ubifs]
    ubifs_releasepage+0x67/0x1d0 [ubifs]
    try_to_release_page+0x57/0xe0
    invalidate_inode_page+0xfb/0x130
    __invalidate_mapping_pages+0xb9/0x280
    invalidate_mapping_pagevec+0x12/0x20
    generic_fadvise+0x303/0x3c0
    ksys_fadvise64_64+0x4c/0xb0

[1] https://bugzilla.kernel.org/show_bug.cgi?id=215373
[2] https://linux-mtd.infradead.narkive.com/NQoBeT1u/patch-rfc-ubifs-fix-assert-failed-in-ubifs-set-page-dirty

Fixes: 1e51764a3c2ac0 ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 264b0484ea56..bc2eaf331e56 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1495,14 +1495,23 @@ static bool ubifs_release_folio(struct folio *folio, gfp_t unused_gfp_flags)
 	struct inode *inode = folio->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 
-	/*
-	 * An attempt to release a dirty page without budgeting for it - should
-	 * not happen.
-	 */
 	if (folio_test_writeback(folio))
 		return false;
+
+	/*
+	 * Page is private but not dirty, weird? There is one condition
+	 * making it happened. ubifs_writepage skipped the page because
+	 * page index beyonds isize (for example. truncated by other
+	 * process named A), then the page is invalidated by fadvise64
+	 * syscall before being truncated by process A.
+	 */
 	ubifs_assert(c, folio_test_private(folio));
-	ubifs_assert(c, 0);
+	if (folio_test_checked(folio))
+		release_new_page_budget(c);
+	else
+		release_existing_page_budget(c);
+
+	atomic_long_dec(&c->dirty_pg_cnt);
 	folio_detach_private(folio);
 	folio_clear_checked(folio);
 	return true;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
