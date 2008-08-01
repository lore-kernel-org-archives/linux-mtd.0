Received: from smtp4.pp.htv.fi ([213.243.153.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KP3bN-0002mm-GW
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 23:00:01 +0000
Date: Sat, 2 Aug 2008 01:58:58 +0300
From: Adrian Bunk <bunk@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: mtdsuper.c BLOCK=n compile error
Message-ID: <20080801225858.GM19682@cs181140183.pp.htv.fi>
References: <20080801223056.GK19682@cs181140183.pp.htv.fi>
	<1217630912.3719.41.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1217630912.3719.41.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 01, 2008 at 11:48:31PM +0100, David Woodhouse wrote:
> On Sat, 2008-08-02 at 01:30 +0300, Adrian Bunk wrote:
> > Commit d5686b444ff3f72808d2b3fbd58672a86cdf38e7
> > (switch mtd and dm-table to lookup_bdev()) causes
> > the following compile error with CONFIG_BLOCK=n:
> > 
> > <--  snip  -->
> > 
> > ...
> >   CC      drivers/mtd/mtdsuper.o
> > /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c: In function `get_sb_mtd':
> > /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:184: error: implicit declaration of function 'lookup_bdev'
> > /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:184: warning: assignment makes pointer from integer without a cast
> > /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:197: error: implicit declaration of function 'bdput'
> > make[3]: *** [drivers/mtd/mtdsuper.o] Error 1
> > 
> > <--  snip  -->
> 
> Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> 
> diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
> index 9b6af7e..e03250b 100644
> --- a/drivers/mtd/mtdsuper.c
> +++ b/drivers/mtd/mtdsuper.c
> @@ -178,6 +178,7 @@ int get_sb_mtd(struct file_system_type *fs_type, int
> flags,
>  		}
>  	}
>  
> +#ifdef CONFIG_BLOCK
>  	/* try the old way - the hack where we allowed users to mount
>  	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
>  	 */
> @@ -200,6 +201,7 @@ int get_sb_mtd(struct file_system_type *fs_type, int
> flags,
>  			     mnt);
>  
>  not_an_MTD_device:
> +#endif /* CONFIG_BLOCK */
>  	if (!(flags & MS_SILENT))
>  		printk(KERN_NOTICE
>  		       "MTD: Attempt to mount non-MTD device \"%s\"\n",


Still gives a compile error for the second bdput().


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
