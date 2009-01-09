Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LLIOV-0001IM-9l
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2009 14:31:27 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KD7002M1KCENIE0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 09 Jan 2009 09:31:26 -0500 (EST)
Date: Fri, 09 Jan 2009 09:31:26 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH] CFI: major version fixup for Samsung K8P2815UQB NOR Flash
In-reply-to: <49674AFA.6090109@grandegger.com>
Message-id: <alpine.LFD.2.00.0901090930570.9524@xanadu.home>
References: <49674AFA.6090109@grandegger.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 Jan 2009, Wolfgang Grandegger wrote:

> The NOR Flash memory K8P2815UQB from Samsung uses an incorrect major
> version number '0'. This patch introduces the cfi_fixup_major_minor()
> function to set the major version to '1' for this chip. A normal
> quirk (fixup) cannot be used, because cfi_fixup() is called after the
> major/minor version check.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Acked-by: Nicolas Pitre <nico@cam.org>


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
