Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmbd2-0004ab-GG
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 07:07:38 +0000
Date: Wed, 21 Sep 2016 09:07:04 +0200
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
Subject: Re: [PATCH] mtd: spi-nor: Add support for S3AN spi-nor devices
Message-ID: <20160921090704.2cfebfc8@bbrezillon>
In-Reply-To: <20160920154551.3494-1-ricardo.ribalda@gmail.com>
References: <20160920154551.3494-1-ricardo.ribalda@gmail.com>
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

Please try to pass the version in your subject prefix (pass
--subject-prefix="PATCH vX" to git format-patch).

On Tue, 20 Sep 2016 17:45:51 +0200
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
> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v6:
> Suggested by: Boris Brezillon <boris.brezillon@free-electrons.com>
> -Replace triple operator with if/else
> 
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
> 
>  drivers/mtd/spi-nor/spi-nor.c | 124 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  12 ++++
>  2 files changed, 131 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165d7d66..d29842177808 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c

[...]

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

Can you send a new version with

	offset = addr % nor->page_size;

to see if kbuild test robot still complains.

> +
> +	return ((addr - offset) << 1) | offset;
> +}
> +

Thanks,

Boris
