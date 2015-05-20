Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvDgM-0006tl-6x
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 23:45:51 +0000
Received: by pabru16 with SMTP id ru16so84328759pab.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 16:45:28 -0700 (PDT)
Date: Wed, 20 May 2015 16:45:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 1/3] MTD: m25p80: fix write return value.
Message-ID: <20150520234525.GY11598@ld-irv-0074>
References: <cover.1430430153.git.hramrach@gmail.com>
 <02f7510acb9b6dbb3a5a6cd5bb287762eb4d22c1.1430430153.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02f7510acb9b6dbb3a5a6cd5bb287762eb4d22c1.1430430153.git.hramrach@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, zajec5@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>, Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 30, 2015 at 03:33:47PM +0200, Michal Suchanek wrote:
> The 'retlen' points to a variable representing the number of data bytes
> written/read (see include/linux/mtd/mtd.h) by the current invocation of
> the function. This variable must be set, not incremented.
> 
> v2: clearer commit message
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Acked-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/mtd/devices/m25p80.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7c8b169..0b2bc21 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -102,7 +102,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  
>  	spi_sync(spi, &m);
>  
> -	*retlen += m.actual_length - cmd_sz;
> +	*retlen = m.actual_length - cmd_sz;

This is very wrong. It gets a little better once you add your next
patches (which are also not good) since those patches reinterpret the
usage of retlen, but this one definitely does *not* stand a lone.

I'll admit the API is a little odd here, but the callers of this
function (see spi_nor_write()) actually depend on calling this multiple
times, with the value incrementing each time so we get a summary total.
You're now clobbering this value.

I'm willing to accept patches to improve this API, if you think that
would help. Or to add comments that document this.

>  }
>  
>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)

Also, I'm a little confused because you sent two different patch series
very close to each other, and this patch is in both of them. Please
don't do that. Either send a single patch series that contains all
patches (and is versions v2, v3, etc., as you revise the whole thing) or
send completely independent patch series. Don't include the same patch
in different series.

Anyway, please consider my comments, and when you have something better,
please resend everything. I'm not going to take either series as-is.

Thanks,
Brian
