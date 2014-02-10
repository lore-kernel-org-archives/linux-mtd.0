Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCwiE-00037o-OR
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 19:40:15 +0000
Received: by mail-qa0-f53.google.com with SMTP id cm18so10106080qab.26
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2014 11:39:52 -0800 (PST)
Date: Mon, 10 Feb 2014 11:39:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Hou Zhiqiang <b48286@freescale.com>
Subject: Re: [PATCH v2] mtd: m25p80: Make the name of mtd_info fixed
Message-ID: <20140210193948.GD18440@ld-irv-0074>
References: <1390717003-28699-1-git-send-email-b48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390717003-28699-1-git-send-email-b48286@freescale.com>
Cc: scottwood@freescale.com, linuxppc-dev@ozlabs.org, mingkai.hu@freescale.com,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 26, 2014 at 02:16:43PM +0800, Hou Zhiqiang wrote:
> To give spi flash layout using "mtdparts=..." in cmdline, we must
> give mtd_info a fixed name,because the cmdlinepart's parser will
> match the name given in cmdline with the mtd_info.
> 
> Now, if use OF node, mtd_info's name will be spi->dev->name. It
> consists of spi_master->bus_num, and the spi_master->bus_num maybe
> dynamically fetched.
> So, give the mtd_info a new fiexd name "name.cs", "name" is name of
> spi_device_id and "cs" is chip-select in spi_dev.
> 
> Signed-off-by: Hou Zhiqiang <b48286@freescale.com>
> ---
> v2:
>  - add check for return value of function kasprintf.
>  - whether the spi_master->bus_num is dynamical is determined by spi
>    controller driver, and it can't be check in this driver. So, we can
>    not initial the mtd_info's name by distinguishing the spi_master
>    bus_num dynamically-allocated or not.

How about spi->master->bus_num < 0 ?

>  drivers/mtd/devices/m25p80.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index eb558e8..1f494d2 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1011,8 +1011,12 @@ static int m25p_probe(struct spi_device *spi)
>  
>  	if (data && data->name)
>  		flash->mtd.name = data->name;
> -	else
> -		flash->mtd.name = dev_name(&spi->dev);
> +	else {
> +		flash->mtd.name = kasprintf(GFP_KERNEL, "%s.%d",
> +				id->name, spi->chip_select);

I don't think this name is specific enough. What if there are more than
one SPI controller? Then there could be one chip with the same
chip-select. You probably still need to incorporate the SPI master
somehow, even if it's not by using the bus number directly (because it's
dynamic).

> +		if (!flash->mtd.name)
> +			return -ENOMEM;
> +	}
>  
>  	flash->mtd.type = MTD_NORFLASH;
>  	flash->mtd.writesize = 1;

Brian
