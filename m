Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W69mc-0003EY-T2
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 02:12:43 +0000
Received: by mail-ig0-f170.google.com with SMTP id m12so647337iga.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2014 18:12:20 -0800 (PST)
Date: Wed, 22 Jan 2014 18:12:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Hou Zhiqiang <b48286@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: Make the name of mtd_info fixed
Message-ID: <20140123021213.GZ8919@ld-irv-0074>
References: <1388990069-27066-1-git-send-email-b48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388990069-27066-1-git-send-email-b48286@freescale.com>
Cc: scottwood@freescale.com, linuxppc-dev@ozlabs.org, mingkai.hu@freescale.com,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hou,

On Mon, Jan 06, 2014 at 02:34:29PM +0800, Hou Zhiqiang wrote:
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
>  drivers/mtd/devices/m25p80.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index eb558e8..d1ed480 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1012,7 +1012,8 @@ static int m25p_probe(struct spi_device *spi)
>  	if (data && data->name)
>  		flash->mtd.name = data->name;
>  	else
> -		flash->mtd.name = dev_name(&spi->dev);
> +		flash->mtd.name = kasprintf(GFP_KERNEL, "%s.%d",
> +				id->name, spi->chip_select);

Changing the mtd.name may have far-reaching consequences for users who
already have mtdparts= command lines. But your concern is probably valid
for dynamically-determined bus numbers. Perhaps you can edit this patch
to only change the name when the busnum is dynamically-allocated?

This also needs a NULL check (for OOM), and you leak memory on device
removal.

>  
>  	flash->mtd.type = MTD_NORFLASH;
>  	flash->mtd.writesize = 1;

Brian
