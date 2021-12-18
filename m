Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FD7C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Dec 2021 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J935Cm1l087f3ezW7xLAk63OEyfiCt4g8ucuVl2MHC4=; b=MgCQnrUCNnqr4R
	VRpytEqFekw/FqdNd5M00FTkEPThwvNwypWMSYwk7Nn8jfXU/P1dDls7LKRvfDG7jyt4ruBtRAm/6
	ZXjHj5vGgIBM2NuOsotvykgOPCTspIEvkWvOQCD3J5jCWov/KkFayiaL3aKcNudSr0xaPKHe+rLn2
	UTv8/hXW/sUXRAQgAJV+YleH7A6LzciQGkU8uxDY2iO3hOsPNjMmQ+kyq6lAQG2df82ic1b7qjb7H
	ZYY3bXa+e/2Bh8XYnphHozhqcTjk5vmR7gQhfSKWFttgszlIEmOio8yx5OCFZtgs7CmGF6hCw9Z7R
	o6rGBv2fOptWh3q19gYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWvw-00DWaL-1r; Sat, 18 Dec 2021 10:27:20 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWsT-00DVSh-OR
 for linux-mtd@lists.infradead.org; Sat, 18 Dec 2021 10:23:47 +0000
Received: from kwepemi100006.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JGMLc1lpszZdLq;
 Sat, 18 Dec 2021 18:20:40 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100006.china.huawei.com (7.221.188.165) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 18 Dec 2021 18:23:43 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 18 Dec
 2021 18:23:43 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH v4 13/13] ubifs: ubifs_writepage: Mark page dirty after
 writing inode failed
Date: Sat, 18 Dec 2021 18:35:12 +0800
Message-ID: <20211218103512.370420-14-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211218103512.370420-1-chengzhihao1@huawei.com>
References: <20211218103512.370420-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_022346_189424_75CF0C48 
X-CRM114-Status: GOOD (  12.17  )
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

There is a third possibility which maybe related to [1] that page is
private but not dirty caused by following process:

          PA
lock(page)
ubifs_write_end
  attach_page_private		// set Private
    __set_page_dirty_nobuffers	// set Dirty
unlock(page)

write_cache_pages
  lock(page)
  clear_page_dirty_for_io(page)	// clear Dirty
  ubifs_writepage
    write_inode
    // fail, goto out, following codes are not executed
    // do_writepage
    //   set_page_writeback 	// set Writeback
    //   detach_page_private	// clear Private
    //   end_page_writeback 	// clear Writeback
    out:
    unlock(page)		// Private, Not Dirty

                                       PB
				ksys_fadvise64_64
				  generic_fadvise
				     invalidate_inode_page
				     // page is neither Dirty nor Writeback
				       invalidate_complete_page
				       // page_has_private is true
					 try_to_release_page
					   ubifs_releasepage
					     ubifs_assert(c, 0) !!!

Then we may get following assertion failed:
  UBIFS error (ubi0:0 pid 1492): ubifs_assert_failed [ubifs]:
  UBIFS assert failed: 0, in fs/ubifs/file.c:1499
  UBIFS warning (ubi0:0 pid 1492): ubifs_ro_mode [ubifs]:
  switched to read-only mode, error -22
  CPU: 2 PID: 1492 Comm: aa Not tainted 5.16.0-rc2-00012-g7bb767dee0ba-dirty
  Call Trace:
    dump_stack+0x13/0x1b
    ubifs_ro_mode+0x54/0x60 [ubifs]
    ubifs_assert_failed+0x4b/0x80 [ubifs]
    ubifs_releasepage+0x7e/0x1e0 [ubifs]
    try_to_release_page+0x57/0xe0
    invalidate_inode_page+0xfb/0x130
    invalidate_mapping_pagevec+0x12/0x20
    generic_fadvise+0x303/0x3c0
    vfs_fadvise+0x35/0x40
    ksys_fadvise64_64+0x4c/0xb0

Jump [2] to find a reproducer.

[1] https://linux-mtd.infradead.narkive.com/NQoBeT1u/patch-rfc-ubifs-fix-assert-failed-in-ubifs-set-page-dirty
[2] https://bugzilla.kernel.org/show_bug.cgi?id=215357

Fixes: 1e51764a3c2ac0 ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 6b45a037a047..7cc2abcb70ae 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1031,7 +1031,7 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 		if (page->index >= synced_i_size >> PAGE_SHIFT) {
 			err = inode->i_sb->s_op->write_inode(inode, NULL);
 			if (err)
-				goto out_unlock;
+				goto out_redirty;
 			/*
 			 * The inode has been written, but the write-buffer has
 			 * not been synchronized, so in case of an unclean
@@ -1059,11 +1059,17 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 	if (i_size > synced_i_size) {
 		err = inode->i_sb->s_op->write_inode(inode, NULL);
 		if (err)
-			goto out_unlock;
+			goto out_redirty;
 	}
 
 	return do_writepage(page, len);
-
+out_redirty:
+	/*
+	 * redirty_page_for_writepage() won't call ubifs_dirty_inode() because
+	 * it passes I_DIRTY_PAGES flag while calling __mark_inode_dirty(), so
+	 * there is no need to do space budget for dirty inode.
+	 */
+	redirty_page_for_writepage(wbc, page);
 out_unlock:
 	unlock_page(page);
 	return err;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
