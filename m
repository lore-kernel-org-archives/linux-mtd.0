Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnvXp-00011Q-Sc
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 20:58:54 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 1/3] MTD: m25p80: fix write return value.
Date: Thu, 30 Apr 2015 20:43:11 +0200
References: <cover.1430403750.git.hramrach@gmail.com>
 <55132b4496e7fe73f949186c0f140f3e4fd4e2c7.1430403750.git.hramrach@gmail.com>
In-Reply-To: <55132b4496e7fe73f949186c0f140f3e4fd4e2c7.1430403750.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201504302043.11118.marex@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "grmoore@altera.com" <grmoore@altera.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 30, 2015 at 03:33:47 PM, Michal Suchanek wrote:
> The size of written data was added to user supplied value rather than
> written at the provided address.

You might want to work on the commit message a little, something like
the following, but feel free to reword as seen fit.

The 'retlen' points to a variable representing the number of data bytes 
written/read (see include/linux/mtd/mtd.h) by the current invocation of
the function. This variable must be set, not incremented.

Otherwise, the patch is correct I believe:

Acked-by: Marek Vasut <marex@denx.de>

> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
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
