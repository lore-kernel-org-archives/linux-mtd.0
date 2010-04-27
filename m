Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6kQI-0004tI-TC
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 13:01:59 +0000
Subject: Re: [PATCH] Fix Oops with Atmel SPI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anders Larsen <al@alarsen.net>
In-Reply-To: <1271158315l.25331l.9l@i-dmzi_al.realan.de>
References: <1271158315l.25331l.9l@i-dmzi_al.realan.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 15:57:29 +0300
Message-ID: <1272373049.7750.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ian McDonnell <ian@brightstareng.com>, Nicolas Pitre <nico@fluxnic.net>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-13 at 13:31 +0200, Anders Larsen wrote:
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

This is an old problem. Instead of doing this dirty hack, change the
code and teach it to work with array of 1-4 pages , not with buffers.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
