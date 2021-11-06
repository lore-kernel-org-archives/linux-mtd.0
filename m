Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA67C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:43:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB17761165
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB17761165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17unYojUrCwAjgAwjkowSWZWIvkSaCthVSSTqJLOVxI=; b=Ou5Vp++MHKvkF9
	RDBDukKtJNBwLyUgWaMAJiKxa9/ky7G+jjt4ozASoVL79zzcQp7jRHC5F2gfzbQ2eM+qR0Jzrfuov
	QYRAtrFlmuJ5HnOrQvLaLK7ShfLKsf2onsWtPdWeFGZG5pA1gM+JVaUV2k9ZOJHgYEJEA8210ZgC7
	+C419F6moPUYzIC+pf/CSuQtgXdz86tFVpcnbbTo0W76O3WzrZifNc1WuHZVTwAcO0SKGj9G2ZbGV
	AVRDTPJ/dTkkXOhJWtTMd+NxGwBKnVvhLxyInUxSKSxToYYM3DOfpd8iNg/sPfI2i/mp66NsajvFV
	dXNple7kVyIF4kgkBPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOmJ-00D7MP-0t; Sat, 06 Nov 2021 16:42:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKzN-00CzUC-M4
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2gdeGPStzMfcuZa0Pw2bla2+ZF0eJqxLRFGiKsR25Po=; b=Yb2tevNp2d3ouAyXw3UKX+/DL/
 tvpzEUFNwbEwPkfnBGlTvVWXJxaEYSAbL1I68ncdsguKhjzaRTCgaE0TkSwXd14NSr2I6x2duW+v1
 n6261rsVpNyPPjSD+YAq7UgJtHsJZAHbiGtQGLcekCh8Emj6tW8SkXKXtf0I6ECSWEVfbCgbDfaR7
 4FKxiSYqqlNSsWWUGxyiGh3T0Wlc+KzDUlTf+t7LvN9k+roGrM8K7V0lavRRFQq8unIedOfk/mgSE
 5ewPdPCVbTSXfQdSOSn3QGC5b5uJPN/YYscYLYSX5HvEbd2vpaYwilN8ol2kbzVEdp+I+byUfD/ce
 TZIYNEjg==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKZe-00EVWs-MH
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:13:37 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hmbnc0Kfbz8v8d;
 Sat,  6 Nov 2021 20:11:16 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:48 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:47 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 10/12] ubifs: Fix to add refcount once page is set private
Date: Sat, 6 Nov 2021 20:25:15 +0800
Message-ID: <20211106122517.3304628-11-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106122517.3304628-1-chengzhihao1@huawei.com>
References: <20211106122517.3304628-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121331_638708_A1330889 
X-CRM114-Status: GOOD (  12.83  )
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

MM defined the rule [1] very clearly that once page was set with PG_private
flag, we should increment the refcount in that page, also main flows like
pageout(), migrate_page() will assume there is one additional page
reference count if page_has_private() returns true. Otherwise, we may
get a BUG in page migration:

  page:0000000080d05b9d refcount:-1 mapcount:0 mapping:000000005f4d82a8
  index:0xe2 pfn:0x14c12
  aops:ubifs_file_address_operations [ubifs] ino:8f1 dentry name:"f30e"
  flags: 0x1fffff80002405(locked|uptodate|owner_priv_1|private|node=0|
  zone=1|lastcpupid=0x1fffff)
  page dumped because: VM_BUG_ON_PAGE(page_count(page) != 0)
  ------------[ cut here ]------------
  kernel BUG at include/linux/page_ref.h:184!
  invalid opcode: 0000 [#1] SMP
  CPU: 3 PID: 38 Comm: kcompactd0 Not tainted 5.15.0-rc5
  RIP: 0010:migrate_page_move_mapping+0xac3/0xe70
  Call Trace:
    ubifs_migrate_page+0x22/0xc0 [ubifs]
    move_to_new_page+0xb4/0x600
    migrate_pages+0x1523/0x1cc0
    compact_zone+0x8c5/0x14b0
    kcompactd+0x2bc/0x560
    kthread+0x18c/0x1e0
    ret_from_fork+0x1f/0x30

The BUG is caused by following process:
PA(cpu 1)                           PB(cpu 2)
ubifs_write_begin
  page = grab_cache_page_write_begin
  (refcnf = 3, for page creation process)
ubifs_write_end
  SetPagePrivate(page)
  unlock_page(page)  // refcnt=3
  put_page(page)
    page_ref_dec_and_test
                                      lock(page)
                                      ...
                                      ubifs_migrate_page
                                        migrate_page_move_mapping
                                          expected_page_refs get 3
                                          (1 + mapping[1] + private[1])
                                          page_ref_freeze  // refcnt = 0
      atomic_dec_and_test(0 - 1 = -1)
                                          page_ref_unfreeze
                                          VM_BUG_ON_PAGE(-1 != 0, page)

Actually zhangjun has tried to fix this problem [2] by recalculating page
refcnt in ubifs_migrate_page(). It's better to follow MM rules [1], because
just like Kirill suggested in [2], we need to check all users of
page_has_private() helper. Like f2fs does in [3], fix it by adding/deleting
refcount when setting/clearing private for a page. BTW, according to [4],
we set 'page->private' as 1 because ubifs just simply SetPagePrivate().
And, [5] provided a common helper to set/clear page private, ubifs can
use this helper following the example of iomap, afs, btrfs, etc.

Jump [6] to find a reproducer.

[1] https://lore.kernel.org/lkml/2b19b3c4-2bc4-15fa-15cc-27a13e5c7af1@aol.com
[2] https://www.spinics.net/lists/linux-mtd/msg04018.html
[3] http://lkml.iu.edu/hypermail/linux/kernel/1903.0/03313.html
[4] https://lore.kernel.org/linux-f2fs-devel/20210422154705.GO3596236@casper.infradead.org
[5] https://lore.kernel.org/all/20200517214718.468-1-guoqing.jiang@cloud.ionos.com
[6] https://bugzilla.kernel.org/show_bug.cgi?id=214961

Fixes: 1e51764a3c2ac0 ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5cfa28cd00cd..6b45a037a047 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -570,7 +570,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 	}
 
 	if (!PagePrivate(page)) {
-		SetPagePrivate(page);
+		attach_page_private(page, (void *)1);
 		atomic_long_inc(&c->dirty_pg_cnt);
 		__set_page_dirty_nobuffers(page);
 	}
@@ -947,7 +947,7 @@ static int do_writepage(struct page *page, int len)
 		release_existing_page_budget(c);
 
 	atomic_long_dec(&c->dirty_pg_cnt);
-	ClearPagePrivate(page);
+	detach_page_private(page);
 	ClearPageChecked(page);
 
 	kunmap(page);
@@ -1304,7 +1304,7 @@ static void ubifs_invalidatepage(struct page *page, unsigned int offset,
 		release_existing_page_budget(c);
 
 	atomic_long_dec(&c->dirty_pg_cnt);
-	ClearPagePrivate(page);
+	detach_page_private(page);
 	ClearPageChecked(page);
 }
 
@@ -1471,8 +1471,8 @@ static int ubifs_migrate_page(struct address_space *mapping,
 		return rc;
 
 	if (PagePrivate(page)) {
-		ClearPagePrivate(page);
-		SetPagePrivate(newpage);
+		detach_page_private(page);
+		attach_page_private(newpage, (void *)1);
 	}
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
@@ -1496,7 +1496,7 @@ static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
 		return 0;
 	ubifs_assert(c, PagePrivate(page));
 	ubifs_assert(c, 0);
-	ClearPagePrivate(page);
+	detach_page_private(page);
 	ClearPageChecked(page);
 	return 1;
 }
@@ -1567,7 +1567,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	else {
 		if (!PageChecked(page))
 			ubifs_convert_page_budget(c);
-		SetPagePrivate(page);
+		attach_page_private(page, (void *)1);
 		atomic_long_inc(&c->dirty_pg_cnt);
 		__set_page_dirty_nobuffers(page);
 	}
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
