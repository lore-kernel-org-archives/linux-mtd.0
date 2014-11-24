Received: from mta-out1.inet.fi ([62.71.2.195] helo=jenni1.inet.fi)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XspiQ-0005PK-8n
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 09:13:51 +0000
Date: Mon, 24 Nov 2014 11:10:24 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Jijiagang <jijiagang@hisilicon.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
Message-ID: <20141124091024.GA1190@node.dhcp.inet.fi>
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
 <1413805935.7906.225.camel@sauron.fi.intel.com>
 <C3050A4DBA34F345975765E43127F10F62CC5D9B@SZXEMA512-MBX.china.huawei.com>
 <1413810719.7906.268.camel@sauron.fi.intel.com>
 <545C2CEE.5020905@huawei.com>
 <20141120123011.GA9716@node.dhcp.inet.fi>
 <BE257DAADD2C0D439647A27133296657394A65A4@SZXEMA511-MBS.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BE257DAADD2C0D439647A27133296657394A65A4@SZXEMA511-MBS.china.huawei.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Caizhiyong <caizhiyong@hisilicon.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 Hujianyang <hujianyang@huawei.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "Wanli \(welly\)" <welly.wan@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 24, 2014 at 02:59:51AM +0000, Jijiagang wrote:
> Hi Kirill,
> 
> I add dump_page(page) in function ubifs_set_page_dirty.
> And get this log when ubifs assert fail. Is it helpful for this problem?

Not really. It seems you called dump_page() after
__set_page_dirty_nobuffers() in ubifs_set_page_dirty().

Could you try something like patch below. It assumes ubifs to compiled in
(not module).

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b5b593c45270..7b4386dd174e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1531,7 +1531,7 @@ out_unlock:
        return err;
 }
 
-static const struct vm_operations_struct ubifs_file_vm_ops = {
+const struct vm_operations_struct ubifs_file_vm_ops = {
        .fault        = filemap_fault,
        .map_pages = filemap_map_pages,
        .page_mkwrite = ubifs_vm_page_mkwrite,
diff --git a/mm/rmap.c b/mm/rmap.c
index 19886fb2f13a..343c4571df68 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1171,8 +1171,15 @@ static int try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
        pteval = ptep_clear_flush(vma, address, pte);
 
        /* Move the dirty bit to the physical page now the pte is gone. */
-       if (pte_dirty(pteval))
+       if (pte_dirty(pteval)) {
+               extern const struct vm_operations_struct ubifs_file_vm_ops;
+               if (vma->vm_ops == &ubifs_file_vm_ops) {
+                       dump_vma(vma);
+                       dump_page(page, __func__);
+                       pr_emerg("pte_write: %d\n", pte_write(pteval));
+               }
                set_page_dirty(page);
+       }
 
        /* Update high watermark before we lower rss */
        update_hiwater_rss(mm);
-- 
 Kirill A. Shutemov
