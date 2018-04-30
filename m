Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD6E8-0004CA-Nl
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 10:40:14 +0000
Date: Mon, 30 Apr 2018 12:39:56 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Aaron Sierra <asierra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH RESEND] mtd: cfi: Support early CFI fixups
Message-ID: <20180430123956.05074e3b@bbrezillon>
In-Reply-To: <2051977971.384388.1524012814487.JavaMail.zimbra@xes-inc.com>
References: <2051977971.384388.1524012814487.JavaMail.zimbra@xes-inc.com>
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

Hello Aaron,

On Tue, 17 Apr 2018 19:53:34 -0500 (CDT)
Aaron Sierra <asierra@xes-inc.com> wrote:

> Some CFI devices need fixups that affect the number of chips detected,
> but the current fixup infrastructure (struct cfi_fixup and cfi_fixup())
> does not cover this situation.
> 
> Introduce struct cfi_early_fixup and cfi_early_fixup() to fill the void
> along with the fixup for S70GL02GS.
> 
> Without early fixups (top half of device cannot be written or erased):
>   ff0000000.nor-boot: Found 1 x16 devices at 0x0 in 16-bit bank. <snip>
>   Amd/Fujitsu Extended Query Table at 0x0040
>     Amd/Fujitsu Extended Query version 1.5.
>   number of CFI chips: 1
> 
> With early fixups (entire device can be written and erased):
>   Bad S70GL02GS CFI data; adjust to detect 2 chips
>   ff0000000.nor-boot: Found 1 x16 devices at 0x0 in 16-bit bank. <snip>
>   ff0000000.nor-boot: Found 1 x16 devices at 0x8000000 in 16-bit bank
>   Amd/Fujitsu Extended Query Table at 0x0040
>     Amd/Fujitsu Extended Query version 1.5.
>   number of CFI chips: 2
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
> 
>  * Resent due to mailing list bounce
>  * Compiled under 4.16. Tested under 4.1 and 3.12 (e5500 PowerPC)
> 
>  drivers/mtd/chips/cfi_probe.c | 18 ++++++++++++++++++
>  drivers/mtd/chips/cfi_util.c  | 13 +++++++++++++
>  include/linux/mtd/cfi.h       | 10 ++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index e8d0164..8b60aff 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -151,6 +151,22 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
>  	return 1;
>  }
>  
> +static void fixup_s70gl02gs_chips(struct cfi_private *cfi)
> +{
> +	/*
> +	 * S70GL02GS flash reports a single 256 MiB chip, but is really made up
> +	 * of two 128 MiB chips with 1024 sectors each.
> +	 */
> +	cfi->cfiq->DevSize = 27;
> +	cfi->cfiq->EraseRegionInfo[0] = 0x20003ff;
> +	pr_warn("Bad S70GL02GS CFI data; adjust to detect 2 chips\n");
> +}
> +
> +static struct cfi_early_fixup cfi_early_fixup_table[] = {
> +	{ CFI_MFR_AMD, 0x4801, fixup_s70gl02gs_chips },
> +	{ 0, 0, NULL },
> +};
> +

Can you move these changes to a separate patch: one patch adding the
early fixup infra, and another one making use of it for S70GL02GS.

>  static int __xipram cfi_chip_setup(struct map_info *map,
>  				   struct cfi_private *cfi)
>  {
> @@ -235,6 +251,8 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>  	cfi_qry_mode_off(base, map, cfi);
>  	xip_allowed(base, map);
>  
> +	cfi_early_fixup(cfi, cfi_early_fixup_table);
> +
>  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. Manufacturer ID %#08x Chip ID %#08x\n",
>  	       map->name, cfi->interleave, cfi->device_type*8, base,
>  	       map->bankwidth*8, cfi->mfr, cfi->id);
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> index 6f16552..e25d858 100644
> --- a/drivers/mtd/chips/cfi_util.c
> +++ b/drivers/mtd/chips/cfi_util.c
> @@ -333,6 +333,19 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n
>  
>  EXPORT_SYMBOL(cfi_read_pri);
>  
> +void cfi_early_fixup(struct cfi_private *cfi, struct cfi_early_fixup *fixups)
> +{
> +	struct cfi_early_fixup *f;
> +
> +	for (f = fixups; f->fixup; f++) {
> +		if (((f->mfr == CFI_MFR_ANY) || (f->mfr == cfi->mfr)) &&
> +		    ((f->id == CFI_ID_ANY) || (f->id == cfi->id))) {
> +			f->fixup(cfi);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(cfi_early_fixup);
> +
>  void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup *fixups)
>  {
>  	struct map_info *map = mtd->priv;
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index 9b57a9b..7d304db 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -353,6 +353,15 @@ void __xipram cfi_qry_mode_off(uint32_t base, struct map_info *map,
>  
>  struct cfi_extquery *cfi_read_pri(struct map_info *map, uint16_t adr, uint16_t size,
>  			     const char* name);
> +
> +/* CFI fixup that can occur immediately after reading */

					   ^ "after reading the ID" ?

> +struct cfi_early_fixup {
> +	uint16_t mfr;
> +	uint16_t id;
> +	void (*fixup)(struct cfi_private *cfi);
> +};
> +
> +/* CFI fixup that can only occur after MTD device exists */
>  struct cfi_fixup {
>  	uint16_t mfr;
>  	uint16_t id;
> @@ -380,6 +389,7 @@ struct cfi_fixup {
>  #define CFI_MFR_TOSHIBA		0x0098
>  #define CFI_MFR_WINBOND		0x00DA
>  
> +void cfi_early_fixup(struct cfi_private *cfi, struct cfi_early_fixup *fixups);

Is cfi_early_fixup() intended to be used outside of cfi_probe.c? If
that's not the case, I'd recommend to keep the struct and function def
in cfi_probe.c.

>  void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
>  
>  typedef int (*varsize_frob_t)(struct map_info *map, struct flchip *chip,

Thanks,

Boris
