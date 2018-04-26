Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBlFa-00070b-9S
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 18:04:11 +0000
Date: Thu, 26 Apr 2018 20:03:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Luca Ellero <luca.ellero@brickedbrain.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: dataflash: replace msleep with usleep_range
Message-ID: <20180426200348.7c4eef72@bbrezillon>
In-Reply-To: <1524043588-25816-1-git-send-email-luca.ellero@brickedbrain.com>
References: <1524043588-25816-1-git-send-email-luca.ellero@brickedbrain.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Apr 2018 11:26:26 +0200
Luca Ellero <luca.ellero@brickedbrain.com> wrote:

> Since msleep is based on jiffies, this 3 ms sleep becomes actually 20 ms.
> Worst of all, since this sleep is used in a loop when writing, a single page
> write (256 to 1024 bytes) causes 17 ms extra time.
> When writing large files (for example u-boot is usually 512 KB) this delay
> adds up to minutes.
> See Documentation/timers/timers-howto.txt "Why not msleep for (1ms - 20ms)".
> 
> Signed-off-by: Luca Ellero <luca.ellero@brickedbrain.com>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/devices/mtd_dataflash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index aaaeaae..3a6f450 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -140,7 +140,7 @@ static int dataflash_waitready(struct spi_device *spi)
>  		if (status & (1 << 7))	/* RDY/nBSY */
>  			return status;
>  
> -		msleep(3);
> +		usleep_range(3000, 4000);
>  	}
>  }
>  
