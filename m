Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8XwZ-0006Vs-Al
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 14:15:48 +0000
Date: Fri, 16 Mar 2012 15:13:53 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 2/4] MTD: flash drivers set ecc strength
Message-ID: <20120316141353.GA10228@parrot.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 11, 2012 at 09:21:11PM +0000, Mike Dunn wrote:
> Flash device drivers initialize 'ecc_strength' in struct mtd_info, which is the
> maximum number of bit errors that can be corrected in one writesize region.
> 
> Drivers using the nand interface intitialize 'strength' in struct nand_ecc_ctrl,
> which is the maximum number of bit errors that can be corrected in one ecc step.
> Nand infrastructure code translates this to 'ecc_strength'.

OK, in [1] I suggested to drop 'ecc_strength' and use ecc.strength, but
obviously it does not work for drivers not using the nand interface...

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040313.html

> With a couple exceptions, I'm fairly confident that these values are correct,
> but if you can confirm, an ACK would be greatly appreciated!  Note that an
> incorrect value will not cause a regression unless the value is overstated.
> 
> The exceptions are:
> 
>   bcm_umi_nand.c: implements bch in hw; Galois field order not indicated

The fixed ecc.size = 512 and number of ecc bytes (13) strongly suggest
m=13 and t=8; this is confirmed if you look at nand_bch_umi.h: 112:
	/* K parameter is used internally.  K = N - (T * 13) */

>   jz4740_nand.c: implements r-s in hw; generator polynomial order not indicated

The Reed-Solomon code used by this chip is described in [2], it is a RS(511,503)
code. It can correct up to 4 symbols (each symbol is 9 bits).
In the NAND context, it just means it can correct up to 4 bitflips per 512 bytes.

[2] http://www.amebasystems.com/downloads/hardware/datasheets/ben-nanonote/Ingenic-SOC-JZ4720/Jz4740-PM/jz4740_03_emc_spec.pdf

> index ee81b63..fc60043 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -476,6 +476,14 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
>                         largepage_bbt.options = NAND_BBT_SCAN2NDPAGE;
>                 this->badblock_pattern = &largepage_bbt;
>         }
> +
> +       /*
> +        * FIXME: ecc strength value of 6 bits per 512 bytes of data is a
> +        * conservative guess, given 13 ecc bytes and using bch alg.
> +        * (Assume Galois field order m=15 to allow a margin of error.)
> +        */
> +       this->ecc.strength = 6;
> +
>  #endif

When NAND_ECC_BCH is disabled, is ecc.strength properly enabled ?

> index 7195ee6..80b5264 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -813,6 +813,12 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>                                 &fsl_elbc_oob_sp_eccm1 : &fsl_elbc_oob_sp_eccm0;
>                 chip->ecc.size = 512;
>                 chip->ecc.bytes = 3;
> +               chip->ecc.strength = 1;
> +               /*
> +                * FIXME: can hardware ecc correct 4 bitflips if page size is
> +                * 2k?  Then does hardware report number of corrections for this
> +                * case?  If so, ecc_stats reporting needs to be fixed as well.
> +                */

Here you simply have 4 ecc steps, each step only able to correct 1 bitflip in its
512 bytes subpage.

BR,
--
Ivan
