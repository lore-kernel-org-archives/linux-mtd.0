Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmJ7A-0005OU-D0
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 11:21:29 +0000
Date: Tue, 20 Sep 2016 13:21:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Javier
 Martinez Canillas <javier@osg.samsung.com>, Stephen Warren
 <swarren@nvidia.com>, Jagan Teki <jteki@openedev.com>, Vignesh R
 <vigneshr@ti.com>, Marek Vasut <marex@denx.de>, Ezequiel =?UTF-8?B?R2Fy?=
 =?UTF-8?B?Y8OtYQ==?= <ezequiel@vanguardiasur.com.ar>, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <zajec5@gmail.com>, Furquan Shaikh
 <furquan@google.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: Add support for S3AN spi-nor devices
Message-ID: <20160920132104.1159d960@bbrezillon>
In-Reply-To: <1474054432-29124-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1474054432-29124-1-git-send-email-ricardo.ribalda@gmail.com>
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

Hi Ricardo,

On Fri, 16 Sep 2016 21:33:52 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Xilinx Spartan-3AN FPGAs contain an In-System Flash where they keep
> their configuration data and (optionally) some user data.
> 
> The protocol of this flash follows most of the spi-nor standard. With
> the following differences:
> 
> - Page size might not be a power of two.
> - The address calculation (default addressing mode).
> - The spi nor commands used.
> 
> Protocol is described on Xilinx User Guide UG333
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v5:
> -Rebase on top of l2-mtd/master
> Suggested by: Cyrille Pitchen <cyrille.pitchen@atmel.com>:
> -Fix to+1 bug
> -Move all address conversions to spi-nor
> -Replace pr_dev with dev_err
> 
> v4:
> -Rebase on top of l2-mtd/master
> 
> v3:
> -Rebase on top of mtd-next
> -Rename ADDR_NATIVE to ADDR_DEFAULT to follow UG333 naming
> -Fix bug on probe
> 
> v2: Suggested by Brian Norris <computersforpeace@gmail.com>
> 
> -Remove inline qualifier
> -Improve documentation of Default Addressing Mode
> -Convert function callbacks into SNOR_F_
> -Fix missmatch braces
> -Improve documentation of SPI_S3AN flag
>  drivers/mtd/spi-nor/spi-nor.c | 122 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  12 +++++
>  2 files changed, 129 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165d7d66..94c5fd870058 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,12 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define	SPI_S3AN		BIT(10)	/*
> +					 * Xilinx Spartan 3AN In-System Flash
> +					 * (MFR cannot be used for probing
> +					 * because it has the same value as
> +					 * ATMEL flashes)
> +					*/
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -217,6 +223,21 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>  		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
>  	}
>  }
> +
> +static int s3an_sr_ready(struct spi_nor *nor)
> +{
> +	int ret;
> +	u8 val;
> +
> +	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
> +		return ret;
> +	}
> +
> +	return !!(val & XSR_RDY);
> +}
> +
>  static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  {
>  	int sr = read_sr(nor);
> @@ -238,7 +259,9 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>  static int spi_nor_ready(struct spi_nor *nor)
>  {
>  	int sr, fsr;
> -	sr = spi_nor_sr_ready(nor);
> +
> +	sr = nor->flags & SNOR_F_READY_XSR_RDY ? s3an_sr_ready(nor) :
> +						 spi_nor_sr_ready(nor);

Nit: I find

	if (nor->flags & SNOR_F_READY_XSR_RDY)
		sr = s3an_sr_ready(nor);
	else
		sr = spi_nor_sr_ready(nor);

more readable.

>  	if (sr < 0)
>  		return sr;
>  	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> @@ -320,6 +343,22 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>  }
>  
>  /*
> + * This code converts an address to the Default Address Mode, that has non
> + * power of two page sizes. We must support this mode because it is the default
> + * mode supported by Xilinx tools, it can access the whole flash area and
> + * changing over to the Power-of-two mode is irreversible and corrupts the
> + * original data.
> + */
> +static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
> +{
> +	unsigned int offset;
> +
> +	offset = (nor->page_size == 264) ? (addr % 264) : (addr % 528);

Why not just
	
	offset = addr % nor->page_size;

> +
> +	return ((addr - offset) << 1) | offset;
> +}
> +

Sorry for this useless review :-).

Regards,

Boris
