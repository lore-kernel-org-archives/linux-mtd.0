Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzYU5-0003ac-BF
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 23:19:22 +0000
Received: by pacdm15 with SMTP id dm15so95451277pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 15:19:00 -0800 (PST)
Date: Thu, 19 Nov 2015 15:18:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 Ben Hutchings <ben@decadent.org.uk>, Marek Vasut <marex@denx.de>,
 Gabor Juhos <juhosg@openwrt.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMLA==?=  <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] mtd: spi-nor: simplify write loop
Message-ID: <20151119231857.GM64635@google.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <e1251eea4ec9cc8c72d54300f3396919a3afe4b1.1439543572.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1251eea4ec9cc8c72d54300f3396919a3afe4b1.1439543572.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michal,

Sorry this has sat so long...

On Fri, Aug 14, 2015 at 09:23:08AM -0000, Michal Suchanek wrote:
> The spi-nor write loop assumes that what is passed to the hardware
> driver write() is what gets written.
> 
> When write() writes less than page size at once data is dropped on the
> floor. Check the amount of data writen.

Have you seen write() return less than the page size? I know you've
struggled with a SPI driver that can't do "very" (for some definition of
very) long transfers, due to unknown bugs, but I thought that "very" was
much larger than the page size.

> This also means that write can start mid-page any time so there is
> no special case for first page.

I think we'd have some problems if we start seeing hardware that can't
write ~256 bytes at a time. If nothing else, this can be a problem
because some SPI NOR flash are known to have inferior reliability if you
regularly write in small chunks. I believe this is because they actually
use some kind of internal ECC.

So, if you're just guarding against a theoretical behavior, perhaps it's
best if this is done with some kind of assertion, as I'd rather not
encourage non-aligned writes if possible. I notice you used BUG_ON() in
another patch, but I'd suggest maybe something less harsh, like WARN()
or WARN_ONCE().

Brian

> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++-----------------------------
>  1 file changed, 15 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 837e3df..e0ae9cf 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -836,7 +836,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	size_t *retlen, const u_char *buf)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> -	u32 page_offset, page_size, i;
> +	size_t page_offset, page_remain, i;
>  	int ret;
>  
>  	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
> @@ -845,45 +845,27 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	if (ret)
>  		return ret;
>  
> -	write_enable(nor);
> -
> -	page_offset = to & (nor->page_size - 1);
> +	for (i = 0; i < len; ) {
> +		int written;
>  
> -	/* do all the bytes fit onto one page? */
> -	if (page_offset + len <= nor->page_size) {
> -		ret = nor->write(nor, to, len, buf);
> -		if (ret < 0)
> -			goto write_err;
> -		*retlen += ret;
> -	} else {
> +		page_offset = to & (nor->page_size - 1);
>  		/* the size of data remaining on the first page */
> -		page_size = nor->page_size - page_offset;
> -		ret = nor->write(nor, to, page_size, buf);
> +		page_remain = min_t(size_t,
> +				    nor->page_size - page_offset, len - i);
> +
> +		write_enable(nor);
> +		ret = nor->write(nor, to + i, page_remain, buf + i);
>  		if (ret < 0)
>  			goto write_err;
> -		*retlen += ret;
> -
> -		/* write everything in nor->page_size chunks */
> -		for (i = ret; i < len; ) {
> -			page_size = len - i;
> -			if (page_size > nor->page_size)
> -				page_size = nor->page_size;
> -
> -			ret = spi_nor_wait_till_ready(nor);
> -			if (ret)
> -				goto write_err;
> +		written = ret;
>  
> -			write_enable(nor);
> -
> -			ret = nor->write(nor, to + i, page_size, buf + i);
> -			if (ret < 0)
> -				goto write_err;
> -			*retlen += ret;
> -			i += ret;
> -		}
> +		ret = spi_nor_wait_till_ready(nor);
> +		if (ret)
> +			goto write_err;
> +		*retlen += written;
> +		i += written;
>  	}
>  
> -	ret = spi_nor_wait_till_ready(nor);
>  write_err:
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
>  	return ret;
> -- 
> 2.1.4
> 
