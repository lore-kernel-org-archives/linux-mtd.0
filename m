Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKzgo-0004OA-7J
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 18:33:06 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KD6001D70TTEFN0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 13:32:18 -0500 (EST)
Date: Thu, 08 Jan 2009 13:33:04 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
In-reply-to: <49664427.7060801@grandegger.com>
Message-id: <alpine.LFD.2.00.0901081330030.6007@xanadu.home>
References: <496624A4.3050808@grandegger.com>
	<alpine.LFD.2.00.0901081134110.6007@xanadu.home>
	<1231433317.28362.77.camel@macbook.infradead.org>
	<4966310C.1010103@grandegger.com>
	<alpine.LFD.2.00.0901081237460.6007@xanadu.home>
	<49664427.7060801@grandegger.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Jan 2009, Wolfgang Grandegger wrote:

> Yep, the patch below introduces cfi_fixup_major_minor() to do the quirk. 
> What do you think now?

Looks fine to me.


> 
> Wolfgang.
> 
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++++++
>  include/linux/mtd/cfi.h             |    1 +
>  2 files changed, 11 insertions(+)
> 
> Index: linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
> ===================================================================
> --- linux-2.6.orig/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -322,6 +322,14 @@ static struct cfi_fixup fixup_table[] = 
>  };
>  
>  
> +static void cfi_fixup_major_minor(struct cfi_private *cfi, 
> +				  struct cfi_pri_amdstd *extp)
> +{
> +	if (cfi->mfr == CFI_MFR_SAMSUNG && cfi->id == 0x257e &&
> +	    extp->MajorVersion == '0')
> +		extp->MajorVersion = '1';
> +}
> +
>  struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
>  {
>  	struct cfi_private *cfi = map->fldrv_priv;
> @@ -363,6 +371,8 @@ struct mtd_info *cfi_cmdset_0002(struct 
>  			return NULL;
>  		}
>  
> +		cfi_fixup_major_minor(cfi, extp);
> +
>  		if (extp->MajorVersion != '1' ||
>  		    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
>  			printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
> Index: linux-2.6/include/linux/mtd/cfi.h
> ===================================================================
> --- linux-2.6.orig/include/linux/mtd/cfi.h
> +++ linux-2.6/include/linux/mtd/cfi.h
> @@ -520,6 +520,7 @@ struct cfi_fixup {
>  
>  #define CFI_MFR_AMD 0x0001
>  #define CFI_MFR_ATMEL 0x001F
> +#define CFI_MFR_SAMSUNG 0x00EC
>  #define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
>  
>  void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
> 
