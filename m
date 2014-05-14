Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkThV-0004fl-NF
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 07:34:06 +0000
Message-ID: <53731C00.1020203@huawei.com>
Date: Wed, 14 May 2014 15:32:16 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH] ubifs: add missing ui pointer in debugging code
References: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
In-Reply-To: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/5/14 4:27, Daniel Golle wrote:
> If UBIFS_DEBUG is defined an additional assertion of the ui_lock
> spinlock in do_writepage cannot compile because the ui pointer has not
> been previously declared.
> 
> Fix this by declaring and initializing the ui pointer in case
> UBIFS_DEBUG is defined.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  fs/ubifs/file.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 4f34dba..e13ec5e 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -903,6 +903,7 @@ static int do_writepage(struct page *page, int len)
>  	struct ubifs_info *c = inode->i_sb->s_fs_info;
>  
>  #ifdef UBIFS_DEBUG
> +	struct ubifs_inode *ui = ubifs_inode(inode);
>  	spin_lock(&ui->ui_lock);
>  	ubifs_assert(page->index <= ui->synced_i_size << PAGE_CACHE_SIZE);

I think here should be:
  	ubifs_assert(page->index <= ui->synced_i_size >> PAGE_CACHE_SHIFT);

as line 1023 in ubifs_writepage:

        /* Is the page fully inside @i_size? */
        if (page->index < end_index) {
                if (page->index >= synced_i_size >> PAGE_CACHE_SHIFT) {
                        err = inode->i_sb->s_op->write_inode(inode, NULL);

>  	spin_unlock(&ui->ui_lock);
> 
