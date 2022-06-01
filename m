Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5e0tMJNasgMSAAw5VD2opXLZVOCcEKD4pAyMn4incA=; b=SM61tBWngmDdUB
	Jau3tLQVEKlas4g+FNoTP5l1MwrnTdKSCikZWiyqz4Zk5GPFM6kzooVXZTXFu4GWZIOxMgQ2YL9Cr
	lKb5bU9GagnocwoCH8JDYmtWsveTta2TKjYRQETwdFwB8FXpHWtincOIDMKNx9fWUL+jO2n3fLOJs
	1hXNTnWo096DE5eiN3L6yxB/v2qzddOKZelF4FS+iZ8dnk55kz0UmlV/2TPHxt7xmhIvL3Oq84Ox7
	r9uUwDFT45uxbHEQaQD8X9Dd8uTU7dTM4Ubf6UEQpSh0G7BR8dh9lZKgOARCUkV7M8Bf7RKWLzcRi
	IoV/hDw8KbqMak1I37dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwENs-00DUtu-RS; Wed, 01 Jun 2022 02:46:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwENl-00DUiy-HT
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 02:46:51 +0000
Received: from kwepemi100012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LCYRG5hczzjWvh;
	Wed,  1 Jun 2022 10:45:30 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100012.china.huawei.com (7.221.188.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 1 Jun 2022 10:46:40 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 1 Jun
 2022 10:46:39 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<kirill.shutemov@linux.intel.com>, <willy@infradead.org>,
	<s.hauer@pengutronix.de>, <ext-adrian.hunter@nokia.com>,
	<Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 1/2] ubifs: ubifs_writepage: Mark page dirty after writing inode failed
Date: Wed, 1 Jun 2022 10:59:59 +0800
Message-ID: <20220601030000.49714-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220601030000.49714-1-chengzhihao1@huawei.com>
References: <20220601030000.49714-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_194649_964336_9BEE22FB 
X-CRM114-Status: GOOD (  12.76  )
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
index 04ced154960f..264b0484ea56 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1032,7 +1032,7 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 		if (page->index >= synced_i_size >> PAGE_SHIFT) {
 			err = inode->i_sb->s_op->write_inode(inode, NULL);
 			if (err)
-				goto out_unlock;
+				goto out_redirty;
 			/*
 			 * The inode has been written, but the write-buffer has
 			 * not been synchronized, so in case of an unclean
@@ -1060,11 +1060,17 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
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
