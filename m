Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsnWV-0001di-AA
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 05:48:52 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so6352573pde.28
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 21:48:30 -0800 (PST)
Date: Mon, 16 Dec 2013 21:48:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131217054825.GE12034@norris-Latitude-E6410>
References: <20131127073512.GB13929@norris.computersforpeace.net>
 <1386278524-25669-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1386278524-25669-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Huang: a few comments are directed at you below)

Hi Uwe,

On Thu, Dec 05, 2013 at 10:22:04PM +0100, Uwe Kleine-König wrote:
> According to the Open NAND Flash Interface Specification (ONFI) Revision
> 3.1 "Parameters are always transferred on the lower 8-bits of the data
> bus." for the Get Features and Set Features commands.
> 
> So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> they use I/O[15:0]. The Get Features command is easily fixed using 4
> times the read_byte callback. For Set Features implement a new
> overwritable callback "write_byte". Still I expect the default to work
> just fine for all controllers and making it overwriteable was just done
> for symmetry.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v2, sent with
> Message-Id: 1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de:
> 
>  - use a proper uint16_t instead of a 2 byte array to pass to chip->write_buf
>    to fix endianess issue. Noticed by David Woodhouse. (This also gets rid of
>    the Compound Literal that catched David's eye.)
> 
> Changes since v3, sent with
> Message-id:1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de (v3)
> 
>  - drop whitespace cleanup
>  - support resetting to 16 bit width function on 2nd call of nand_set_defaults

Thanks for the changes. This patch looks good to me, and I think it can
go in regardless of our other x8/x16 buswidth solutions.

I don't have a good x16 setup yet, but I believe Ezequiel did some
testing on v3 (is this a "Tested-by"?). I'll probably try this out on my
x8 setups when I get a chance sometime this week.

>  drivers/mtd/nand/nand_base.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/nand.h     |  3 +++
>  2 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index bd39f7b..3a6e95f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -202,6 +202,51 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
>  }
>  
>  /**
> + * nand_write_byte - [DEFAULT] write single byte to chip
> + * @mtd: MTD device structure
> + * @byte: value to write
> + *
> + * Default function to write a byte to I/O[7:0]
> + */
> +static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +
> +	chip->write_buf(mtd, &byte, 1);

Side issue: Huang, this is another potential pitfall for GPMI, as you
will again be performing DMA on the stack.

> +}
> +
> +/**
> + * nand_write_byte16 - [DEFAULT] write single byte to a chip with width 16
> + * @mtd: MTD device structure
> + * @byte: value to write
> + *
> + * Default function to write a byte to I/O[7:0] on a 16-bit wide chip.
> + */
> +static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	uint16_t word = byte;
> +
> +	/*
> +	 * It's not entirely clear what should happen to I/O[15:8] when writing
> +	 * a byte. The ONFi spec (Revision 3.1; 2012-09-19, Section 2.16) reads:
> +	 *
> +	 *    When the host supports a 16-bit bus width, only data is
> +	 *    transferred at the 16-bit width. All address and command line
> +	 *    transfers shall use only the lower 8-bits of the data bus. During
> +	 *    command transfers, the host may place any value on the upper
> +	 *    8-bits of the data bus. During address transfers, the host shall
> +	 *    set the upper 8-bits of the data bus to 00h.
> +	 *
> +	 * One user of the write_byte callback is nand_onfi_set_features. The
> +	 * four parameters are specified to be written to I/O[7:0], but this is
> +	 * neither an address nor a command transfer. Let's assume a 0 on the
> +	 * upper I/O lines is OK.
> +	 */
> +	chip->write_buf(mtd, &word, 2);

Huang: same here. So you see how this type of patch can easily trigger
the maintainability problems that are inherent when gpmi-nand does
things differently than other drivers?

> +}
> +
> +/**
>   * nand_write_buf - [DEFAULT] write buffer to chip
>   * @mtd: MTD device structure
>   * @buf: data buffer

Brian
