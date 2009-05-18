Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6CGf-0008GS-RW
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 23:29:20 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KJV00AUB58PCW00@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 18 May 2009 19:29:13 -0400 (EDT)
Date: Mon, 18 May 2009 19:29:13 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Daniel Ribeiro <drwyrm@gmail.com>
Subject: Re: [PATCH] cfi_cmdset_0001.c: quirk for PF38F4476.
In-reply-to: <1242558137.26769.7.camel@brutus>
Message-id: <alpine.LFD.2.00.0905181929000.6741@xanadu.home>
References: <1242558137.26769.7.camel@brutus>
Cc: linux-mtd@lists.infradead.org,
	openezx-devel <openezx-devel@lists.openezx.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 17 May 2009, Daniel Ribeiro wrote:

> This chip reports CFI 1.3, but the CFI PRI is like CFI 1.1. Add a quirk
> to pass probe on this chip.
> (This patch depends on "cfi_cmdset_0001.c: CFI 1.0 and CFI 1.1")
> (sent again with CC to Nicolas Pitre)
> 
> Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>

Acked-by: Nicolas Pitre <nico@cam.org>

> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index bf07d14..0e01ab9 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -46,6 +46,7 @@
>  #define MANUFACTURER_INTEL	0x0089
>  #define I82802AB	0x00ad
>  #define I82802AC	0x00ac
> +#define PF38F4476	0x881c
>  #define MANUFACTURER_ST         0x0020
>  #define M50LPW080       0x002F
>  #define M50FLW080A	0x0080
> @@ -315,9 +316,18 @@ static struct cfi_fixup fixup_table[] = {
>  	{ 0, 0, NULL, NULL }
>  };
>  
> +static void cfi_fixup_major_minor(struct cfi_private *cfi,
> +						struct cfi_pri_intelext *extp)
> +{
> +	if (cfi->mfr == MANUFACTURER_INTEL &&
> +			cfi->id == PF38F4476 && extp->MinorVersion == '3')
> +		extp->MinorVersion = '1';
> +}
> +
>  static inline struct cfi_pri_intelext *
>  read_pri_intelext(struct map_info *map, __u16 adr)
>  {
> +	struct cfi_private *cfi = map->fldrv_priv;
>  	struct cfi_pri_intelext *extp;
>  	unsigned int extra_size = 0;
>  	unsigned int extp_size = sizeof(*extp);
> @@ -327,6 +337,8 @@ read_pri_intelext(struct map_info *map, __u16 adr)
>  	if (!extp)
>  		return NULL;
>  
> +	cfi_fixup_major_minor(cfi, extp);
> +
>  	if (extp->MajorVersion != '1' ||
>  	    (extp->MinorVersion < '0' || extp->MinorVersion > '5')) {
>  		printk(KERN_ERR "  Unknown Intel/Sharp Extended Query "
> -- 
> tg: (385157b..) mtd/pf38f4476-fix (depends on: mtd/cfi1.1-has-extra-too)
> 
> -- 
> Daniel Ribeiro
> 
