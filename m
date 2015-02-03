Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIRa5-0006Bj-96
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 00:43:06 +0000
Received: by mail-pa0-f45.google.com with SMTP id et14so89011961pad.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 16:42:41 -0800 (PST)
Date: Mon, 2 Feb 2015 16:42:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/2] spi-nor: add chip_name to struct spi_nor
Message-ID: <20150203004239.GE3992@ld-irv-0074>
References: <54CE5F98.1090704@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54CE5F98.1090704@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 01, 2015 at 06:17:12PM +0100, Heiner Kallweit wrote:
> The caller of spi_nor_scan might be interested in the exact chip type.
> This especially applies to these cases:
> - spi_nor_scan is called with a null name parameter and auto-detects the chip
> - spi_nor_scan detects a chipset which is different from the provided one
> 
> Therefore add chip_name to struct spi_nor.

I'll comment on patch 2, which demonstrates your alleged need for this,
but I don't think the users of spi-nor.c need to know exactly which
flash is being used.

Brian

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  include/linux/mtd/spi-nor.h   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b6a5a0c..712b47b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1160,6 +1160,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	}
>  
>  	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
> +	nor->chip_name = id->name;
>  
>  	dev_info(dev, "%s (%lld Kbytes)\n", id->name,
>  			(long long)mtd->size >> 10);
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 4720b86..468098a 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -143,6 +143,7 @@ enum spi_nor_option_flags {
>   * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
>   * @cfg:		used by the read_xfer/write_xfer
>   * @cmd_buf:		used by the write_reg
> + * @chip_name:		the name of the SPI NOR chip
>   * @prepare:		[OPTIONAL] do some preparations for the
>   *			read/write/erase/lock/unlock operations
>   * @unprepare:		[OPTIONAL] do some post work after the
> @@ -172,6 +173,7 @@ struct spi_nor {
>  	u32			flags;
>  	struct spi_nor_xfer_cfg	cfg;
>  	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
> +	const char		*chip_name;
>  
>  	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
>  	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
