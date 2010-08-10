Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oip6H-0005le-Tv
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 13:42:42 +0000
Received: by bwz19 with SMTP id 19so2608877bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 06:42:40 -0700 (PDT)
Message-ID: <4C61571D.1030906@mvista.com>
Date: Tue, 10 Aug 2010 17:41:49 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Subject: Re: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
References: <1281422578-20461-1-git-send-email-sudhakar.raj@ti.com>
In-Reply-To: <1281422578-20461-1-git-send-email-sudhakar.raj@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: --cc=dwmw2@infradead.org, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Sudhakar Rajashekhara wrote:

> On some platforms, MTD device can hold MAC address, calibration
> data, serial numbers etc.

> On TI's DA850/OMAP-L138/AM18xx EVM, MAC address is stored on
> the last sector of the SPI flash, which is exported as an MTD
> device.

> This patch adds two new members to the 'flash_platform_data'
> structure, a function handler which will be called after
> add_mtd_device() and an argument to be passed to this function,
> for example: offset to read from.

> Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> ---
>  drivers/mtd/devices/m25p80.c |   15 +++++++++++++--
>  include/linux/spi/flash.h    |    2 ++
>  2 files changed, 15 insertions(+), 2 deletions(-)

> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 81e49a9..b832091 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
[...]
> @@ -924,13 +925,23 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  					(long long)(parts[i].size >> 10));
>  			}
>  			flash->partitioned = 1;
> -			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
> +			ret = add_mtd_partitions(&flash->mtd, parts, nr_parts);
> +			if (!ret)
> +				goto out;
> +
> +			return ret;
>  		}
>  	} else if (data && data->nr_parts)
>  		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
>  				data->nr_parts, data->name);
>  
> -	return add_mtd_device(&flash->mtd) == 1 ? -ENODEV : 0;
> +	ret = add_mtd_device(&flash->mtd);
> +
> +out:
> +	if (data->setup && !ret)
> +		(data->setup)(&flash->mtd, (void *)data->context);

    Parens not necessary around 'data->setup'.

> diff --git a/include/linux/spi/flash.h b/include/linux/spi/flash.h
> index 3f22932..daa4875 100644
> --- a/include/linux/spi/flash.h
> +++ b/include/linux/spi/flash.h
> @@ -24,6 +24,8 @@ struct flash_platform_data {
>  	unsigned int	nr_parts;
>  
>  	char		*type;
> +	void		(*setup)(struct mtd_info *, void *context);
> +	void		*context;
>  
>  	/* we'll likely add more ... use JEDEC IDs, etc */
>  };

    Hm, is m25p80.c the only SPI flash driver using this structure? I guess 
not -- I'm seeing at least sst25l.c and mtd_dataflash.c...

WBR, Sergei
