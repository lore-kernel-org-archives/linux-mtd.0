Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT9xL-0001lU-0J
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 16:16:28 +0000
Received: by mail-lf0-x241.google.com with SMTP id h65so13207275lfi.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 08:16:00 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-4-git-send-email-clg@kaod.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Robert Lippert <roblip@gmail.com>, Robert Lippert <rlippert@google.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <57b7480d-4b5a-c420-d790-b22445eec723@gmail.com>
Date: Mon, 16 Jan 2017 17:15:56 +0100
MIME-Version: 1.0
In-Reply-To: <1484573225-19095-4-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/16/2017 02:27 PM, Cédric Le Goater wrote:
> From: Robert Lippert <roblip@gmail.com>

1) Commit message missing
2) This is unrelated to the rest of the series, send separately please

> Signed-off-by: Robert Lippert <rlippert@google.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69d4857..775788f9828a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -876,7 +876,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
> +	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>  
>  	/* Micron */
> 


-- 
Best regards,
Marek Vasut
