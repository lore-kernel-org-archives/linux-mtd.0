Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpGav-0000rg-Tz
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:35:06 +0000
Message-ID: <1401193701.1304.135.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: add missing ui pointer in debugging code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 27 May 2014 15:28:21 +0300
In-Reply-To: <53731C00.1020203@huawei.com>
References: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
 <53731C00.1020203@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Golle <daniel@makrotopia.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-14 at 15:32 +0800, hujianyang wrote:
> On 2014/5/14 4:27, Daniel Golle wrote:
> > If UBIFS_DEBUG is defined an additional assertion of the ui_lock
> > spinlock in do_writepage cannot compile because the ui pointer has not
> > been previously declared.
> > 
> > Fix this by declaring and initializing the ui pointer in case
> > UBIFS_DEBUG is defined.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  fs/ubifs/file.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > index 4f34dba..e13ec5e 100644
> > --- a/fs/ubifs/file.c
> > +++ b/fs/ubifs/file.c
> > @@ -903,6 +903,7 @@ static int do_writepage(struct page *page, int len)
> >  	struct ubifs_info *c = inode->i_sb->s_fs_info;
> >  
> >  #ifdef UBIFS_DEBUG
> > +	struct ubifs_inode *ui = ubifs_inode(inode);
> >  	spin_lock(&ui->ui_lock);
> >  	ubifs_assert(page->index <= ui->synced_i_size << PAGE_CACHE_SIZE);
> 
> I think here should be:
>   	ubifs_assert(page->index <= ui->synced_i_size >> PAGE_CACHE_SHIFT);

I think you are right, thanks. I've just applied this patch:

Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Tue May 27 15:24:39 2014 +0300

    UBIFS: fix debugging check
    
    The debugging check which verifies that we never write outside of the file
    length was incorrect, since it was multiplying file length by the page size,
    instead of dividing. Fix this.
    
    Spotted-by: hujianyang <hujianyang@huawei.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 727506b..2767ffb 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -905,7 +905,7 @@ static int do_writepage(struct page *page, int len)
 #ifdef UBIFS_DEBUG
        struct ubifs_inode *ui = ubifs_inode(inode);
        spin_lock(&ui->ui_lock);
-       ubifs_assert(page->index <= ui->synced_i_size << PAGE_CACHE_SIZE);
+       ubifs_assert(page->index <= ui->synced_i_size >> PAGE_CACHE_SIZE);
        spin_unlock(&ui->ui_lock);
 #endif

-- 
Best Regards,
Artem Bityutskiy
