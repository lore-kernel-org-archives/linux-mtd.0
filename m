Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A7Vl-0002c9-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 10:36:45 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0111300926130.13550-200000@newbast.lynuxworks.com> 
References: <Pine.LNX.4.33.0111300926130.13550-200000@newbast.lynuxworks.com> 
To: Aleksander Sanochkin <asanochkin@Lnxw.COM>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS1/MTD bug-fixes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 10:47:21 +0000
Message-ID: <17628.1007203641@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> --- cvs/drivers/mtd/chips/cfi_cmdset_0002.c	Wed Oct 24 13:37:30 2001
> +++ other/drivers/mtd/chips/cfi_cmdset_0002.c	Wed Nov 21 12:58:47 2001
> @@ -162,10 +162,7 @@
>  	/* Also select the correct geometry setup too */ 
>  	mtd->size = devsize * cfi->numchips;
>  	
> -	if (cfi->cfiq->NumEraseRegions == 1) {
> -		/* No need to muck about with multiple erase sizes */
> -		mtd->erasesize = ((cfi->cfiq->EraseRegionInfo[0] >> 8) & ~0xff) * cfi->interleave;
> -	} else {
> +	{
>  		unsigned long offset = 0;
>  		int i,j;

Why do we need this? If NumEraseRegions is one (or zero, for that matter), 
we don't need to allocate the structure containing the region information, 
as the whole device is known to have the same 'major' erasesize.

>     mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
>     if (!mtd_info)
> -      return 0;
> +      return -ENOMEM;

Applied.

>  	default:
>  		DEBUG(MTD_DEBUG_LEVEL0, "Invalid ioctl %x (MEMGETINFO = %x)\n", cmd, MEMGETINFO);
> -		ret = -ENOTTY;
> +		ret = -ENOIOCTLCMD;

Strange though it may seem, I thought -ENOTTY was correct there. 

       ENOTTY The specified request does not apply to the kind of
              object that the descriptor d references.

> +			if (mtd->usage_counter)
> +			{
> +				up(&mtd_table_mutex);
> +				return -EBUSY;
> +			}

Do we need to provide this in the kernel? I can see it protects against 
user error, but that isn't necessarily the kernel's job. Am I missing 
another need for it?

> --- cvs/fs/jffs/inode-v23.c	Tue Oct  2 13:16:02 2001
> +++ other/fs/jffs/inode-v23.c	Wed Nov 21 18:36:46 2001
> @@ -137,10 +137,22 @@
>  	if (c->gc_maxdirty_threshold < c->fmc->sector_size)
>  		c->gc_maxdirty_threshold = c->fmc->sector_size;
>  
> +	init_completion(&c->gc_thread_comp);
> +	c->gc_task = 0;

Agreed. The existing code is racy. 

> +	while (! c->gc_task)
> +	{
> +		schedule();
> +	}

Better to do this with a semaphore. Start it locked, have the GC thread 
call up(), and this code wait in down(). 

The rest of the JFFS changes look sane. Would you be happy to take over 
maintenance of JFFS1?

--
dwmw2
