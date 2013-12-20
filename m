Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VttpC-00009Y-E7
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 06:44:43 +0000
Received: by mail-pa0-f46.google.com with SMTP id kp14so349350pab.19
 for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2013 22:44:18 -0800 (PST)
Date: Thu, 19 Dec 2013 22:44:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: parse out the datasheet's required minimum
 ECC for Hynix(>=26nm)
Message-ID: <20131220064407.GA16475@norris-Latitude-E6410>
References: <1385974906-29891-1-git-send-email-b32955@freescale.com>
 <1385976026-31606-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385976026-31606-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 02, 2013 at 05:20:26PM +0800, Huang Shijie wrote:
> Parse out the datasheet's required minimum ECC for Hynix nand chips which
> use the >=26 technology and the id length is 6.
> 
> Referencd to the H27UBG8T2B.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4dab696..5c1ffd0 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3201,6 +3201,26 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>  			mtd->erasesize = 768 * 1024;
>  		else
>  			mtd->erasesize = (64 * 1024) << tmp;
> +
> +		/* ecc info */

s/ecc/ECC/

ECC is an acronym and should be capitalized.

> +		tmp = (id_data[4] >> 4) & 0x7;

This calculation (and several others) are similar between >= and < 26nm.
I think it could help to split out a separate Hynix MLC function for
decoding these together, with the shared calculations pulled outside
(i.e., for extracting the ECC and block size bitfields; and for setting
the buswidth to x8).

> +
> +		if (tmp <= 4) {
> +			if (tmp == 0)
> +				chip->ecc_strength_ds = 0;
> +			else
> +				chip->ecc_strength_ds = 1 << (tmp - 1);

The above 4 lines could be simplified to:

			chip->ecc_strength_ds = (1 << tmp) >> 1;

> +			chip->ecc_step_ds = 512;
> +		} else {
> +			chip->ecc_step_ds = 1024;
> +			if (tmp == 5)
> +				chip->ecc_strength_ds = 24;
> +			else if (tmp == 6)
> +				chip->ecc_strength_ds = 32;
> +			else /* (tmp == 7) */
> +				chip->ecc_strength_ds = 40;

This ECC table looks incorrect. It matches my datasheet for H27UBG8T2B
(26nm) but it is incorrect for my H27UBG8T2A (32nm). My datasheet says:

  0 ==> 1-bit/512-bytes
  1 ==> 2-bits/512-bytes
  2 ==> 4-bits/512-bytes
  3 ==> 8-bits/512-bytes
  4 ==> 16-bits/512-bytes
  5 ==> 24-bits/2048-bytes
  6 ==> 24-bits/1024-bytes
  7 ==> Reserved

Not sure if that's a preliminary version that changed for production
(the datasheet is Rev 0.6, from 2009; I don't have samples on hand for
this one), but this demonstrates the larger problem I have with this
patch series...

...that keeping track of minimum ECC requirements is not a scalable
practice for all flash, especially those that avoid using any proper
standards. It's difficult enough just getting OOB/page/block sizes
correct without adding this to the mix. If we add one more thing to get
wrong (ECC strength/step), we become increasingly fragile.

Furthermore, it seems that GPMI is the only driver that needs this
information in Linux. All other systems determine these things within
their bootloader, or through some restriction on the devices they
support (e.g., only support Hamming ECC). So it doesn't seem 100% clear
that we *must* detect the minimum ECC properties in nand_base. In fact,
you even agreed (in another thread) that gpmi-nand should probably
define a more precise nand-ecc-strength and nand-ecc-step-size binding;
such a binding could eliminate the need for runtime auto-detection.

Now, I'm not against progressively adding ECC information that we are
sure to get correct -- like we did with ONFI and with the full-ID table
entries we add. But unless we can get better guarantees from vendors
like Hynix [1], I don't want to commit to this approach, and I'd prefer
not committing any drivers to relying on autodetecting this information.

[1] For instance, can you (or Hynix) explain why my H27UBG8T2A conflicts
    with this table you provided? Do we have to generate a new ECC table
    for every generation?? (48nm, 41nm, 32nm, 26nm, ...)

> +		}
> +
>  		*busw = 0;
>  	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
>  			!nand_is_slc(chip) && (id_data[5] & 0x7) > 3) {

Brian
