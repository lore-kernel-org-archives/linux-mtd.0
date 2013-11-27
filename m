Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlZet-0002eV-Rj
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 07:35:40 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so9270168pdj.23
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 23:35:16 -0800 (PST)
Date: Tue, 26 Nov 2013 23:35:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131127073512.GB13929@norris.computersforpeace.net>
References: <1365164021.28127.109.camel@i7.infradead.org>
 <1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Pekon, Ezequiel

Can one of you see how this patch works with your BeagleBones w/ x16
NAND?

Also, do you think on of you could take a look at killing the
nand_chip.read_word() callback, as Artem was originally requesting with
this patch? It only has one user (for bad block checking in
nand_block_bad(), which is currently only used when there is no BBT at
all), and it looks like it could be replaced with a call to
read_buf(mtd, buf, 2).

Hi Uwe,

On Tue, Nov 26, 2013 at 10:15:15PM +0100, Uwe Kleine-König wrote:
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
>  drivers/mtd/nand/nand_base.c | 61 +++++++++++++++++++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |  3 +++
>  2 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index bd39f7b..27d755b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
...
> @@ -2706,7 +2751,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  }
>  
>  /**
> - * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
> + * nand_onfi_set_features - [REPLACEABLE] set features for ONFI nand

This change is unrelated. (Yes, the whitespace should be fixed, but
probably not in this patch.)

>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
>   * @addr: feature address.
...
> @@ -2731,7 +2779,7 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /**
> - * nand_onfi_get_features- [REPLACEABLE] get features for ONFI nand
> + * nand_onfi_get_features - [REPLACEABLE] get features for ONFI nand

Ditto.

>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
>   * @addr: feature address.
...
> @@ -2812,6 +2863,8 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>  		chip->block_markbad = nand_default_block_markbad;
>  	if (!chip->write_buf || chip->write_buf == nand_write_buf)
>  		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
> +	if (!chip->write_byte)

This check should be:

	if (!chip->write_byte || chip->write_byte == nand_write_byte)

in order to match the rest of the functions, so they can be reset if the
buswidth is detected to be x16, and we re-call nand_set_defaults()
(e.g., when using NAND_BUSWIDTH_AUTO). See the comment:

  /* If called twice, pointers that depend on busw may need to be reset */

I know it's kind of ugly, but that's what we have for now.

> +		chip->write_byte = busw ? nand_write_byte16 : nand_write_byte;
>  	if (!chip->read_buf || chip->read_buf == nand_read_buf)
>  		chip->read_buf = busw ? nand_read_buf16 : nand_read_buf;
>  	if (!chip->scan_bbt)

Brian
