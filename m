Received: from ipmail07.adl2.internode.on.net ([150.101.137.131])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1x3k-0007SN-Jy
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2010 07:30:53 +0000
Message-ID: <4BC56F21.6040909@call-direct.com.au>
Date: Wed, 14 Apr 2010 17:30:41 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Anders Larsen <al@alarsen.net>
Subject: Re: [PATCH] Fix Oops with Atmel SPI
References: <1271158315l.25331l.9l@i-dmzi_al.realan.de>
In-Reply-To: <1271158315l.25331l.9l@i-dmzi_al.realan.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anders,

I wouldn't recommend that. MTD erase blocks are 64K or more. In a typical
embedded system you will not be able to kmalloc that much memory after
a few day's of operation - the page pool gets fragmented.

A possibly better approach is to arrange for that memory to get allocated
at driver start time.

An even better approach would be to change the algorithm to operate on
a list of smaller allocations, e.g. MTD page size.


Best regards,

Iwo


Anders Larsen wrote:
> Tweak MTD's cache allocation to make it work with the atmel DMA'ed SPI.
> Substitute kmalloc for vmalloc so the cache buffer is mappable as per
> the Atmel SPI driver's requirements, otherwise an Oops would occur.
> 
> The original patch by Ian McDonnell <ian@brightstareng.com> was found here:
> http://lists.infradead.org/pipermail/linux-mtd/2007-December/020184.html
> 
> Signed-off-by: Anders Larsen <al@alarsen.net>
> Cc: Ian McDonnell <ian@brightstareng.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Matthias Kaehlcke <matthias@kaehlcke.net>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Nicolas Pitre <nico@fluxnic.net>
> ---
>  drivers/mtd/mtdblock.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> Index: b/drivers/mtd/mtdblock.c
> ===================================================================
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -253,7 +253,11 @@ static int mtdblock_writesect(struct mtd
>  {
>  	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
>  	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
> +#ifdef CONFIG_SPI_ATMEL
> +		mtdblk->cache_data = kmalloc(mtdblk->mtd->erasesize, GFP_KERNEL);
> +#else
>  		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
> +#endif
>  		if (!mtdblk->cache_data)
>  			return -EINTR;
>  		/* -EINTR is not really correct, but it is the best match
> @@ -322,7 +326,11 @@ static int mtdblock_release(struct mtd_b
>  		mtdblks[dev] = NULL;
>  		if (mtdblk->mtd->sync)
>  			mtdblk->mtd->sync(mtdblk->mtd);
> +#ifdef CONFIG_SPI_ATMEL
> +		kfree(mtdblk->cache_data);
> +#else
>  		vfree(mtdblk->cache_data);
> +#endif
>  		kfree(mtdblk);
>  	}
>  
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
