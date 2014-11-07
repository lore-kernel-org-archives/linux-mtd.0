Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmZDX-0000j2-Nd
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 02:24:04 +0000
Message-ID: <545C2CEE.5020905@huawei.com>
Date: Fri, 7 Nov 2014 10:22:38 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
 <1413805935.7906.225.camel@sauron.fi.intel.com>
 <C3050A4DBA34F345975765E43127F10F62CC5D9B@SZXEMA512-MBX.china.huawei.com>
 <1413810719.7906.268.camel@sauron.fi.intel.com>
In-Reply-To: <1413810719.7906.268.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Jijiagang <jijiagang@hisilicon.com>, Caizhiyong <caizhiyong@hisilicon.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>, linux-mm@kvack.org,
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

Hi,

I think we found the cause of this problem. We enable CONFIG_CMA in our
config file. This feature seems to allocate a contiguous memory for caller.
If some pages in this contiguous area are used by other modules, like UBIFS,
CMA will migrate these pages to other place. This operation should be
transparent to the user of old pages. But it is *not true* for UBIFS.

> 
> 1. UBIFS wants to make sure that no one marks UBIFS-backed pages (and
> actually inodes too) as dirty directly. UBIFS wants everyone to ask
> UBIFS to mark a page as dirty.
> 
> 2. This is because for every dirty page, UBIFS needs to reserve certain
> amount of space on the flash media, because all writes are out-of-place,
> even when you are changing an existing file.
> 
> 3. There are exactly 2 places where UBIFS-backed pages may be marked as
> dirty:
> 
>   a) ubifs_write_end() [->wirte_end] - the file write path
>   b) ubifs_page_mkwrite() [->page_mkwirte] - the file mmap() path

line 1160, func try_to_unmap_one() in mm/rmap.c

""
        /* Move the dirty bit to the physical page now the pte is gone. */
        if (pte_dirty(pteval))
                set_page_dirty(page);
""

Here, If the pte of a page is dirty, a directly set_page_dirty() is
performed and hurt the internal logic of UBIFS.

So I have a question, why the page needs to be marked as dirty when
the pte is dirty? Can we just move the dirty bit of the old pte to the
new one without setting the dirty bit of the page? I think the dirty
bit of a page is used to mark the contents of this page is different
from it is in storage. Can we just set it without informing filesyetem?

Could any one in MM list show us some reasons of this performing or
give us some help?

> 
> 4. If anything calls 'ubifs_set_page_dirty()' directly (not through
> write_end()/mkwrite()), and the page was not dirty, UBIFS will complain
> with the assertion that you see.
> 

To Artem, I have an idea to fix this problem without changing mm files.
We can:

1) Add a .migratepage in address_space_operations and do budget in it.
2) As CMA perform set_page_dirty() before migratepage, we seems to remove
   the assert failed in ubifs_set_page_dirty().

Just some thoughts, not a clear solution.

I should say I don't want to do this because it will change some logic
in UBIFS. So I think the best way to solve this problem is to change
the MM operations.

Thanks!

Hu
