Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW7t5-00012g-48
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 17:58:59 +0000
Received: by mail-pd0-f179.google.com with SMTP id ft15so4877239pdb.10
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 10:58:38 -0700 (PDT)
Date: Mon, 22 Sep 2014 10:58:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: support ONFI timing mode retrieval for
 non-ONFI NANDs
Message-ID: <20140922175834.GM1193@ld-irv-0074>
References: <1411395911-30365-1-git-send-email-boris.brezillon@free-electrons.com>
 <1411395911-30365-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411395911-30365-2-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Yassin Jaffer <yassinjaffer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 22, 2014 at 04:25:10PM +0200, Boris BREZILLON wrote:
> Add an onfi_timing_mode_default field to nand_chip and nand_flash_dev in
> order to support NAND timings definition for non-ONFI NAND.
> 
> NAND that support better timings mode than the default one have to define
> a new entry in the nand_ids table.
> 
> The default timing mode should be deduced from timings description from
> the datasheet and the ONFI specification
> (www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf, chapter 4.15
> "Timing Parameters").
> You should choose the closest mode that fit the timings requirements of
> your NAND chip.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

You have some (new?) checkpatch warnings:

WARNING: please, no space before tabs
#49: FILE: include/linux/mtd/nand.h:591:
+ * ^I^I^I      either deduced from the datasheet if the NAND$

WARNING: please, no space before tabs
#50: FILE: include/linux/mtd/nand.h:592:
+ * ^I^I^I      chip is not ONFI compliant or set to 0 if it is$

WARNING: please, no space before tabs
#51: FILE: include/linux/mtd/nand.h:593:
+ * ^I^I^I      (an ONFI chip is always configured in mode 0$

WARNING: please, no space before tabs
#52: FILE: include/linux/mtd/nand.h:594:
+ * ^I^I^I      after a NAND reset)$

total: 0 errors, 4 warnings, 43 lines checked

Your patch has style problems, please review.

If any of these errors are false positives, please report
them to the maintainer, see CHECKPATCH in MAINTAINERS.

Brian

> ---
>  drivers/mtd/nand/nand_base.c |  2 ++
>  include/linux/mtd/nand.h     | 11 +++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ae6e7c4..c37fa2a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3594,6 +3594,8 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>  		chip->options |= type->options;
>  		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
>  		chip->ecc_step_ds = NAND_ECC_STEP(type);
> +		chip->onfi_timing_mode_default =
> +					type->onfi_timing_mode_default;
>  
>  		*busw = type->options & NAND_BUSWIDTH_16;
>  
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index b7c1199..e795fbf 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -587,6 +587,11 @@ struct nand_buffers {
>   * @ecc_step_ds:	[INTERN] ECC step required by the @ecc_strength_ds,
>   *                      also from the datasheet. It is the recommended ECC step
>   *			size, if known; if unknown, set to zero.
> + * @onfi_timing_mode_default: [INTERN] default ONFI timing mode. This field is
> + * 			      either deduced from the datasheet if the NAND
> + * 			      chip is not ONFI compliant or set to 0 if it is
> + * 			      (an ONFI chip is always configured in mode 0
> + * 			      after a NAND reset)
>   * @numchips:		[INTERN] number of physical chips
>   * @chipsize:		[INTERN] the size of one chip for multichip arrays
>   * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
> @@ -671,6 +676,7 @@ struct nand_chip {
>  	uint8_t bits_per_cell;
>  	uint16_t ecc_strength_ds;
>  	uint16_t ecc_step_ds;
> +	int onfi_timing_mode_default;
>  	int badblockpos;
>  	int badblockbits;
>  
> @@ -773,6 +779,10 @@ struct nand_chip {
>   *               @ecc_step_ds in nand_chip{}, also from the datasheet.
>   *               For example, the "4bit ECC for each 512Byte" can be set with
>   *               NAND_ECC_INFO(4, 512).
> + * @onfi_timing_mode_default: the default ONFI timing mode entered after a NAND
> + *			      reset. Should be deduced from timings described
> + *			      in the datasheet.
> + *
>   */
>  struct nand_flash_dev {
>  	char *name;
> @@ -793,6 +803,7 @@ struct nand_flash_dev {
>  		uint16_t strength_ds;
>  		uint16_t step_ds;
>  	} ecc;
> +	int onfi_timing_mode_default;
>  };
>  
>  /**
> -- 
> 1.9.1
> 
