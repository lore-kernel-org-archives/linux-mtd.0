Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wdysl-000256-St
 for linux-mtd@lists.infradead.org; Sat, 26 Apr 2014 09:26:53 +0000
Message-ID: <535B7B96.9030008@huawei.com>
Date: Sat, 26 Apr 2014 17:25:42 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, Laurence Withers
 <lwithers@guralp.com>
Subject: [PATCH RFC] UBIFS: Fix assert failed in ubifs_set_page_dirty
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I meet some assert failed as Laurence Withers reported in February.

show like this:

[69440.577932] UBIFS assert failed in ubifs_set_page_dirty at 1421 (pid 2067)
[69440.658567] UBIFS assert failed in ubifs_writepage at 1009 (pid 2069)
[69440.735605] UBIFS assert failed in do_writepage at 936 (pid 2069)
[69440.735881] UBIFS assert failed in ubifs_release_budget at 567 (pid 2069)
[69440.736360] UBIFS assert failed in ubifs_release_budget at 567 (pid 2069)
[69441.581541] UBIFS assert failed in ubifs_budget_space at 464 (pid 2070)
[69441.659118] UBIFS assert failed in ubifs_release_budget at 567 (pid 2072)
[69441.740405] UBIFS assert failed in ubifs_set_page_dirty at 1421 (pid 2070)
[69441.822369] UBIFS assert failed in ubifs_writepage at 1009 (pid 2072)
[69441.899574] UBIFS assert failed in do_writepage at 936 (pid 2072)
[69441.899853] UBIFS assert failed in ubifs_release_budget at 567 (pid 2072)
[69450.677679] UBIFS assert failed in ubifs_release_budget at 567 (pid 6)
[69455.757670] UBIFS assert failed in ubifs_release_budget at 567 (pid 6)
[69458.147075] UBIFS assert failed in ubifs_put_super at 1776 (pid 2077)

After communicating with Laurence, I found this assert failed can
be easily reproduced by running mmap(PROT_WRITE, MAP_SHARED) and
fsync with same file at same time.

I think there is a race in __do_fault and ubifs_writepage.

We do ->page_mkwrite in __do_fault, perform space budget and set
PagePrivate, then execute __set_page_dirty_nobuffers to make the
page dirty. But at the end of ubifs_vm_page_mkwrite, we release
page lock.

At the same time, fsync process may hold the lock and do ->writepage
as page is set to dirty in ->page_mkwrite. We will clear page_dirty,
clear page_private and release budget here. In the end, unlock page.

Mmap then get the lock and perform ->set_page_dirty. We will meet
the first assert failed here because dirty bit is clear by fsync.

"UBIFS assert failed in ubifs_set_page_dirty at 1421"

static int ubifs_set_page_dirty(struct page *page)
{
        int ret;

        ret = __set_page_dirty_nobuffers(page); /* Here reset dirty bit */
        /*
         * An attempt to dirty a page without budgeting for it - should not
         * happen.
         */
        ubifs_assert(ret == 0);
        return ret;
}

With this assert failed, ->set_page_dirty will reset the dirty bit
without space budget and SetPagePrivate. When we want to writeback
this page, we will meet PagePrivate assert failed.

"UBIFS assert failed in ubifs_writepage at 1009 (pid 2069)
 UBIFS assert failed in do_writepage at 936 (pid 2069)"

Then, release budget without budgeting and meet budget assert failed.

"UBIFS assert failed in ubifs_release_budget at 567
 UBIFS assert failed in ubifs_budget_space at 464"

c->bi.dd_growth is less than zero now.

I want to fix this problem but I don't have enough knowledge about
this filesystem. In my fix, I remove __set_page_dirty_nobuffers
in ->page_mkwrite and just set dirty bit in ->set_page_dirty.

I don't know if my fix works and causes no other problems. I can only
test it with linux-3.10 and it seems not bad.

-------------------------------------------------------------------

>From 2e7de10767d687c28b90bf013cd20e96b5f0f1a3 Mon Sep 17 00:00:00 2001
From: hujianyang <hujianyang@huawei.com>
Date: Sat, 26 Apr 2014 17:17:19 +0800
Subject: [PATCH] UBIFS: Fix assert failed in ubifs_set_page_dirty

---
 fs/ubifs/file.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 4f34dba..0f3e3ac 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1412,15 +1412,7 @@ static ssize_t ubifs_aio_write(struct kiocb *iocb, const struct iovec *iov,

 static int ubifs_set_page_dirty(struct page *page)
 {
-	int ret;
-
-	ret = __set_page_dirty_nobuffers(page);
-	/*
-	 * An attempt to dirty a page without budgeting for it - should not
-	 * happen.
-	 */
-	ubifs_assert(ret == 0);
-	return ret;
+	return __set_page_dirty_nobuffers(page);
 }

 static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
@@ -1508,7 +1500,6 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 			ubifs_convert_page_budget(c);
 		SetPagePrivate(page);
 		atomic_long_inc(&c->dirty_pg_cnt);
-		__set_page_dirty_nobuffers(page);
 	}

 	if (update_time) {
-- 
1.8.5.5
