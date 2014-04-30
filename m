Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfNfk-0007Zc-OY
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 06:07:13 +0000
Message-ID: <536092CE.2090209@huawei.com>
Date: Wed, 30 Apr 2014 14:06:06 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, <adrian.hunter@intel.com>
Subject: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
References: <535B7B96.9030008@huawei.com>
In-Reply-To: <535B7B96.9030008@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Laurence Withers <lwithers@guralp.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all

Basing on the perious mail, I would like to show a clear figure
about the race I have found.

Thread A (mmap)                        Thread B (fsync)

->__do_fault                           ->write_cache_pages
   -> ubifs_page_mkwrite
       -> budget_space
       -> lock_page
       -> release/convert_page_budget
       -> SetPagePrivate
       -> TestSetPageDirty
       -> unlock_page
                                       -> lock_page
                                           -> TestClearPageDirty
                                           -> ubifs_writepage
                                               -> do_writepage
                                                   -> release_budget
                                                   -> ClearPagePrivate
                                                   -> unlock_page
   -> !(ret & VM_FAULT_LOCKED)
   -> lock_page
   -> set_page_dirty
       -> ubifs_set_page_dirty
           -> TestSetPageDirty (set page dirty without budgeting)
   -> unlock_page

According to this situation, my v2 fix returns from page_mkwrite
without performing unlock_page. We return VM_FAULT_LOCKED instead
of just return 0. After doing this, the race above will not happen.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 4f34dba..f7d48a0 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1525,8 +1525,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 	}

 	wait_for_stable_page(page);
-	unlock_page(page);
-	return 0;
+	return VM_FAULT_LOCKED;

 out_unlock:
 	unlock_page(page);
-- 
1.8.5.5
