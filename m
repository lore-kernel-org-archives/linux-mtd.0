Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbmoO-000180-OK
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 07:37:01 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: fixup device removal failure path
Date: Thu, 31 Oct 2013 08:36:36 +0100
References: <1383176571-28057-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1383176571-28057-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310310836.36976.marex@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> Device removal shouls fail if MTD unregistration fails.

should ;-)

Reviewed-by: Marek Vasut <marex@denx.de>

> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 58978892c321..7eda71dbc183 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1125,9 +1125,7 @@ static int m25p_remove(struct spi_device *spi)
>  	struct m25p	*flash = spi_get_drvdata(spi);
> 
>  	/* Clean up MTD stuff. */
> -	mtd_device_unregister(&flash->mtd);
> -
> -	return 0;
> +	return mtd_device_unregister(&flash->mtd);
>  }

Best regards,
Marek Vasut
