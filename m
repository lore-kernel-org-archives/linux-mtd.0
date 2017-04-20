Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CBk-0002I9-QI
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:32:05 +0000
Received: by mail-wm0-x243.google.com with SMTP id d79so10878196wmi.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:31:40 -0700 (PDT)
Subject: Re: [PATCH 1/4] mtd: spi-nor: aspeed: remove dummies from keep mask
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-2-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cfd472d8-8213-3780-01a5-f95dfc1c7cd3@gmail.com>
Date: Thu, 20 Apr 2017 15:28:13 +0200
MIME-Version: 1.0
In-Reply-To: <1492689397-4704-2-git-send-email-clg@kaod.org>
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

On 04/20/2017 01:56 PM, Cédric Le Goater wrote:
> There is no need to keep the dummy bytes in the control register if
> the command mode is not kept also. This could lead to an inconsistent
> setting : normal read mode (command 0x3) and dummy bytes. It is to be
> noted that the HW allows such a configuration.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 56051d30f000..2940f2098420 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -180,8 +180,7 @@ struct aspeed_smc_controller {
>  
>  #define CONTROL_KEEP_MASK						\
>  	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
> -	 CONTROL_IO_DUMMY_MASK | CONTROL_CLOCK_FREQ_SEL_MASK |		\
> -	 CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
> +	 CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
>  
>  /*
>   * The Segment Register uses a 8MB unit to encode the start address
> 


-- 
Best regards,
Marek Vasut
