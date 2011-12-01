Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW2U7-00029D-Gc
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:59:16 +0000
Received: by lagu2 with SMTP id u2so791186lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:59:13 -0800 (PST)
Subject: Re: [PATCH 2/5] backport mtd api change to mtd infrastructure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 01 Dec 2011 10:59:09 +0200
In-Reply-To: <1322528536-19700-1-git-send-email-mikedunn@newsguy.com>
References: <1322528536-19700-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322729952.2332.25.camel@koala>
Mime-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jamie Iles <jamie@jamieiles.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Andres Salomon <dilinger@queued.net>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, Olof Johansson <olof@lixom.net>,
 Vimal Singh <vimal.newwork@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-11-28 at 17:02 -0800, Mike Dunn wrote:
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index 7c1dc90..ada714d 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -182,10 +182,13 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
>  
>  			if (mtdblk->cache_state == STATE_EMPTY ||
>  			    mtdblk->cache_offset != sect_start) {
> +				unsigned int max_bitflips;
> +
>  				/* fill the cache with the current sector */
>  				mtdblk->cache_state = STATE_EMPTY;
>  				ret = mtd->read(mtd, sect_start, sect_size,
> -						&retlen, mtdblk->cache_data);
> +						&retlen, mtdblk->cache_data,
> +						&max_bitflips);

Now difficult would it be to allow for NULL to be passed as the last
argument? I think it makes sense to do so that the callers who do not
care about the max. bit-flips just pass NULL and they would not have to
define an dummy 'int max_bitflips' variable which they do not need at
all. And the amount of changes you introduce would be smaller.

E.g. in this case, you would just add on NULL argument to mtd->read.

Probably the implementations would need to do something like this:

int tmp;

if (!max_bitflips)
	max_bitflips = &tmp;

So it does not seem to be difficult to implement.

> -			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf);
> +			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf,
> +					&max_bitflips);
>  		}
>  		/* Nand returns -EBADMSG on ECC errors, but it returns
>  		 * the data. For our userspace tools it is important
>  		 * to dump areas with ECC errors!
>  		 * For kernel internal usage it also might return -EUCLEAN
> -		 * to signal the caller that a bitflip has occurred and has
> -		 * been corrected by the ECC algorithm.
> +		 * to signal the caller that one or more bitflips have occurred
> +		 * and have been corrected by the ECC algorithm.  The highest
> +		 * number of corrected bits in a single page is returned in the
> +		 * max_bitflips arg.

If you do what I proposed you won't need to change the comment here and
in mtd_do_readoob().

Artem.
