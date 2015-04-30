Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnxaY-0006jb-He
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 23:09:51 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 1/3] MTD: m25p80: fix write return value.
Date: Fri, 1 May 2015 01:09:22 +0200
References: <cover.1430430153.git.hramrach@gmail.com>
 <02f7510acb9b6dbb3a5a6cd5bb287762eb4d22c1.1430430153.git.hramrach@gmail.com>
In-Reply-To: <02f7510acb9b6dbb3a5a6cd5bb287762eb4d22c1.1430430153.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201505010109.22577.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, zajec5@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
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

On Thursday, April 30, 2015 at 03:33:47 PM, Michal Suchanek wrote:
> The 'retlen' points to a variable representing the number of data bytes
> written/read (see include/linux/mtd/mtd.h) by the current invocation of
> the function. This variable must be set, not incremented.
> 
> v2: clearer commit message

This V2 goes past the diffstat, so that when the patch is applied, it
doesn't end up in the log.

> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Acked-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/mtd/devices/m25p80.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Aka. V<n> changes go here.

I don't think there's a need to repost tho :)

> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7c8b169..0b2bc21 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -102,7 +102,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t
> to, size_t len,
> 
>  	spi_sync(spi, &m);
> 
> -	*retlen += m.actual_length - cmd_sz;
> +	*retlen = m.actual_length - cmd_sz;
>  }
> 
>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)

Best regards,
Marek Vasut
