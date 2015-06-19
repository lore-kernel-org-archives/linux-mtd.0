Received: from mail-bl2on0055.outbound.protection.outlook.com ([65.55.169.55]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z61lj-0002aC-DL
 for linux-mtd@lists.infradead.org; Fri, 19 Jun 2015 19:16:04 +0000
Message-ID: <5584695E.1090906@opensource.altera.com>
Date: Fri, 19 Jun 2015 14:11:26 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: Re: [RFC PATCH] mtd: spi-nor: Added flag check for quad io protocol
 for micron flash parts
References: <1434639539-7517-1-git-send-email-anuragku@xilinx.com>
In-Reply-To: <1434639539-7517-1-git-send-email-anuragku@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, harinik@xilinx.com, mika.westerberg@linux.intel.com,
 ben@decadent.org.uk, broonie@kernel.org, zajec5@gmail.com,
 Anurag Kumar Vulisha <anuragku@xilinx.com>, linux-kernel@vger.kernel.org,
 svemula@xilinx.com, linux-mtd@lists.infradead.org, anirudh@xilinx.com,
 shijie.huang@intel.com, punnaia@xilinx.com, computersforpeace@gmail.com,
 dwmw2@infradead.org,
 =?UTF-8?B?IkJlYW4gSHVvIOmcjeaWjOaWjCAoYg==?= =?UTF-8?B?ZWFuaHVvKSI=?=
 <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anurag,

We're struggling with the same issue, our Cadence QSPI controller *does* 
handle four-line command, address, and data, but has to be configured 
for it.  The setting of quad-io-protocol mode in micron_quad_enable is 
really jacking up our code.  We have to snoop the command stream and 
configure the controller as soon as we see the quad-io-protocol command 
go to the Micron chip.  Ugly.

I'd like to point out that this flag is also dependent upon the 
particular controller in use, not just the Micron chip.  In fact, it may 
be more of a controller thing than a chip thing.

Maybe this flag should actually be an enum read_mode value, and passed 
into spi_nor_scan by the controller?

Thanks,
Graham


On 06/18/2015 09:58 AM, Anurag Kumar Vulisha wrote:
> micron flash parts by default operates in extended spi protocol,which accepts
> command on single line and can accept address & data on one,two and four lines
> depending on the command sent.In set_quad_enable() we are enabling the quad io
> protocol for micron flash parts by updating the EVCR register,in this method the
> flash expects the command,address and data to be transmitted on all four data
> lines which may not be supported on all qspi controllers.So READ_1_1_4 command
> does not necessarily go out using those bus widths.
>
> So i have added SPI_QUAD_IO_PROTOCOL flag,which should be checked before enabling
> the quad io protocol.
>
> Signed-off-by: Anurag Kumar Vulisha <anuragku@xilinx.com>
> ---
>   drivers/mtd/spi-nor/spi-nor.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 14a5d23..a6fa8dc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -55,6 +55,7 @@ struct flash_info {
>   #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
>   #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
>   #define	USE_FSR			0x80	/* use flag status register */
> +#define SPI_QUAD_IO_PROTOCOL	0x100	/* use quad io protocol */
>   };
>
>   #define JEDEC_MFR(info)	((info)->id[0])
> @@ -962,6 +963,8 @@ static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
>   		}
>   		return status;
>   	case CFI_MFR_ST:
> +		if (!(info->flags & SPI_QUAD_IO_PROTOCOL))
> +			return 0;
>   		status = micron_quad_enable(nor);
>   		if (status) {
>   			dev_err(nor->dev, "Micron quad-read not enabled\n");
>
