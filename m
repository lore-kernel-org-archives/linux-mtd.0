Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZDza-0001fu-CI
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2017 09:47:51 +0000
Subject: Re: [PATCH] mtd: spi-nor: cqspi: remove redundant dead code on error
 return check
To: Colin King <colin.king@canonical.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <20170131155317.20106-1-colin.king@canonical.com>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <5b9ebe65-d572-0162-3984-8e7a7800148d@atmel.com>
Date: Thu, 2 Feb 2017 10:47:24 +0100
MIME-Version: 1.0
In-Reply-To: <20170131155317.20106-1-colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 31/01/2017 à 16:53, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
> 
> Checking for ret < 0 is redundant because a previous check on ret
> being non-zero already handles the ret < 0 case. Remove the redundant
> code. Found by CoverityScan, CID#1398863, CID#1398864
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to the github spi-nor tree.

Thanks!
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 3fb7be8..9f8102d 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -893,7 +893,7 @@ static ssize_t cqspi_write(struct spi_nor *nor, loff_t to,
>  	if (ret)
>  		return ret;
>  
> -	return (ret < 0) ? ret : len;
> +	return len;
>  }
>  
>  static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
> @@ -913,7 +913,7 @@ static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
>  	if (ret)
>  		return ret;
>  
> -	return (ret < 0) ? ret : len;
> +	return len;
>  }
>  
>  static int cqspi_erase(struct spi_nor *nor, loff_t offs)
> 
