Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwCyB-0001ZW-UQ
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 19:21:25 +0000
Received: by mail-wr0-x243.google.com with SMTP id u18so6084476wrc.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2017 12:21:02 -0700 (PDT)
Subject: Re: [PATCH 04/10] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-5-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Robert Lippert <roblip@gmail.com>, Robert Lippert <rlippert@google.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <97d155e5-f0c2-8a78-ab00-d8823aea031d@gmail.com>
Date: Thu, 6 Apr 2017 21:21:00 +0200
MIME-Version: 1.0
In-Reply-To: <1491497808-25487-5-git-send-email-clg@kaod.org>
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

On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
> From: Robert Lippert <roblip@gmail.com>
> 
> Implements support for the dual IO read mode on aspeed SMC/FMC
> controllers which uses both MISO and MOSI lines for data during a read
> to double the read bandwidth.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>
> [clg: adapted to mainline driver ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 7dfa1ea0a787..b3c8cfe29765 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -512,6 +512,7 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>  	int i;
>  	u8 dummy = 0xFF;
>  	int ret;
> +	u32 ctl;
>  
>  	if (aspeed_smc_dma_check(chip, from, len)) {
>  		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
> @@ -525,6 +526,13 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>  	for (i = 0; i < chip->nor.read_dummy / 8; i++)
>  		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
>  
> +	if (chip->nor.flash_read == SPI_NOR_DUAL) {
> +		/* Switch to dual I/O mode for data cycle */
> +		ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
> +		ctl |= CONTROL_IO_DUAL_DATA;
> +		writel(ctl, chip->ctl);
> +	}
> +
Can't you switch the mode at runtime ? If you do, who'll clear the
CONTROL_IO_DUAL_DATA in this ctl register if you switch to SINGLE
mode for some command ?

-- 
Best regards,
Marek Vasut
