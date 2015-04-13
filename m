Received: from mail-bn1bbn0102.outbound.protection.outlook.com
 ([157.56.111.102] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhjnD-0007eI-4y
 for linux-mtd@lists.infradead.org; Mon, 13 Apr 2015 19:13:12 +0000
Message-ID: <1428952353.22867.621.camel@freescale.com>
Subject: Re: Missing support for ECC_SOFT_BCH in fsl-elbc-nand
From: Scott Wood <scottwood@freescale.com>
To: Tomas Hlavacek <tomas.hlavacek@nic.cz>
Date: Mon, 13 Apr 2015 14:12:33 -0500
In-Reply-To: <5a117ed2-8cb4-4f55-9098-ff622066db4e@nic.cz>
References: <55156575.8080704@nic.cz>
 <5a117ed2-8cb4-4f55-9098-ff622066db4e@nic.cz>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin =?UTF-8?Q?Strba=C4=8Dka?= <martin.strbacka@nic.cz>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-04-13 at 00:30 +0200, Tomas Hlavacek wrote:
> Hi!
> 
> On Friday, March 27, 2015 3:13:09 PM CEST, Martin Strbačka wrote:
> > in our product we have Freescale P2020 SoC together with Micron
> > MT29F2G08ABAEAWP NAND. Lately we discovered that the internal driver
> > (fsl-elbc-nand) supports only 1-bit HW ECC.
> 
> Actually we use the NAND pretty intensively with JFFS2 and we have seen 
> some uncorrectable multiple bitflips with the current HW ECC mode (it means 
> more than one bit flip in 512B subpage, if I got that right). So we would 
> like to change to software BCH ECC since we have powerful enough CPU.

Yes, the hardware ECC on eLBC is only suitable if 1 bit per 512 bytes
meets the NAND chip's specifications.

> I would like to discuss two major questions before I submit a patch for 
> this:
> 
> 1) How to disable HW ECC?
> 
> What I have done is this:
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c 
> b/drivers/mtd/nand/fsl_elbc_nand.c
> index 04b22fd..e5818ba 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> 
> @@ -676,6 +691,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info 
> *mtd)
>         } else if (mtd->writesize == 2048) {
>                 priv->page_size = 1;
>                 setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
> +#ifndef ELBC_ECC_SW_BCH
>                 /* adjust ecc setup if needed */
>                 if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
>                     BR_DECC_CHK_GEN) {
> @@ -684,6 +700,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info 
> *mtd)
>                                            &fsl_elbc_oob_lp_eccm1 :
>                                            &fsl_elbc_oob_lp_eccm0;
>                 }
> +#endif

You shouldn't be setting BR_DECC if you don't want to use HW ECC, so
this ifdef doesn't accomplish anything.

Also, while a compile-time hack may be suitable for your own use, to get
a mergable patch it should be a runtime decision.  You should be able to
read at runtime the level of ECC that the flash requires.

>         } else {
>                 dev_err(priv->dev,
>                         "fsl_elbc_init: page size %d is not supported\n",
> @@ -774,11 +791,18 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd 
> *priv)
>  
>         chip->ecc.read_page = fsl_elbc_read_page;
>         chip->ecc.write_page = fsl_elbc_write_page;
> -       chip->ecc.write_subpage = fsl_elbc_write_subpage;
>  
> +#ifdef ELBC_ECC_SW_BCH
> +       
> out_be32(&lbc->bank[priv->bank].br,(in_be32(&lbc->bank[priv->bank].br) & 
> (~BR_DECC)));

Instead change U-Boot to never set that bit in the first place.

> It works but I am particularly not sure of line
> 
> out_be32(&lbc->bank[priv->bank].br,(in_be32(&lbc->bank[priv->bank].br) & 
> (~BR_DECC)));
> 
> Does it make sense? I have been told that on our board there is some 
> unconnected pin that causes that (in_be32(&lbc->bank[priv->bank].br) & 
> BR_DECC) == BR_DECC_CHK_GEN is true but I still have to disable HW ECC.

>From this I assume you're booting from NAND, but even so U-Boot will
overwrite that register with its own desired value.

> I would like to point out that the shuffling chip->ecc.write_subpage = 
> fsl_elbc_write_subpage; line is needed for subpages to work properly with 
> SW ECC because the write_subpage pointer in elbc_fcm_ctrl is left intact 
> when SW ECC is being initialized and then the ECC does not work for 
> subpages. Not setting it causes that default write_subpage function is 
> used.

There is no default write_subpage function for swecc.

> 2) We need to implement RNDOUT operation for SW ECC / ECC_BCH. My attempt 
> follows:
> 
> @@ -335,6 +335,21 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, 
> unsigned int command,
>                 fsl_elbc_run_command(mtd);
>                 return;
>  
> +       /* !!! Experimental */
> +       case NAND_CMD_RNDOUT:
> +               dev_vdbg(priv->dev,
> +                       "fsl_elbc_cmdfunc: NAND_CMD_RNDOUT, "
> +                       "column: 0x%x.\n", column);
> +
> +               if ((column < 512) || (priv->page_size && (column < 2048))) 
> {
> +                       elbc_fcm_ctrl->index = column;
> +                       return;
> +               } else {
> +                       column -= priv->page_size ? 2048 : 512;
> +                       page_addr = elbc_fcm_ctrl->page;
> +                       /* and fall-through to READOOB */
> +               }
> +
>         /* READOOB reads only the OOB because no ECC is performed. */
>         case NAND_CMD_READOOB:
>                 dev_vdbg(priv->dev,
> 
> Maybe it is too complicated (?) and it would be sufficient to set 
> elbc_fcm_ctrl->index = column both for IB and OOB data? It seems that both 
> ways work for me.

I think you should just set index = column.  The OOB has already been
read if we previously read a full page -- and RNDOUT is also used in
other contexts such as ONFI identification.

-Scott
