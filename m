Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N670n-0007AF-1b
	for linux-mtd@lists.infradead.org; Thu, 05 Nov 2009 18:24:49 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KSN008HUF587RM0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 05 Nov 2009 13:24:44 -0500 (EST)
Date: Thu, 05 Nov 2009 13:24:44 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Subject: Re: [PATCH] mtd: move manufacturer to the common cfi.h header file
In-reply-to: <1257432823-20816-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-id: <alpine.LFD.2.00.0911051324140.10340@xanadu.home>
References: <1257432823-20816-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Nov 2009, Hans-Christian Egtvedt wrote:

> This patch moves the MANUFACTURER_ST and MANUFACTURER_INTEL to the
> include/linux/mtd/cfi.h header file and renames them to CFI_MFR_ST and
> CFI_MFR_INTEL. CFI_MFR_ST was already present there.
> 
> All references in drivers/mtd/chips/cfi_cmdset_0001.c are updated to reflect
> this.
> 
> Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

Acked-by: Nicolas Pitre <nico@fluxnic.net>


> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |   20 ++++++++++----------
>  include/linux/mtd/cfi.h             |    9 +++++----
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 31e9c43..65d796e 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -43,11 +43,11 @@
>  // debugging, turns off buffer write mode if set to 1
>  #define FORCE_WORD_WRITE 0
>  
> -#define MANUFACTURER_INTEL	0x0089
> +/* Intel chips */
>  #define I82802AB	0x00ad
>  #define I82802AC	0x00ac
>  #define PF38F4476	0x881c
> -#define MANUFACTURER_ST         0x0020
> +/* STMicroelectronics chips */
>  #define M50LPW080       0x002F
>  #define M50FLW080A	0x0080
>  #define M50FLW080B	0x0081
> @@ -308,16 +308,16 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  #endif
>  	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
>  	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
> -	{ MANUFACTURER_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
> +	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
>  	{ 0, 0, NULL, NULL }
>  };
>  
>  static struct cfi_fixup jedec_fixup_table[] = {
> -	{ MANUFACTURER_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
> -	{ MANUFACTURER_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
> -	{ MANUFACTURER_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
> -	{ MANUFACTURER_ST,    M50FLW080A, fixup_use_fwh_lock, NULL, },
> -	{ MANUFACTURER_ST,    M50FLW080B, fixup_use_fwh_lock, NULL, },
> +	{ CFI_MFR_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
> +	{ CFI_MFR_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
> +	{ CFI_MFR_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
> +	{ CFI_MFR_ST,    M50FLW080A, fixup_use_fwh_lock, NULL, },
> +	{ CFI_MFR_ST,    M50FLW080B, fixup_use_fwh_lock, NULL, },
>  	{ 0, 0, NULL, NULL }
>  };
>  static struct cfi_fixup fixup_table[] = {
> @@ -333,7 +333,7 @@ static struct cfi_fixup fixup_table[] = {
>  static void cfi_fixup_major_minor(struct cfi_private *cfi,
>  						struct cfi_pri_intelext *extp)
>  {
> -	if (cfi->mfr == MANUFACTURER_INTEL &&
> +	if (cfi->mfr == CFI_MFR_INTEL &&
>  			cfi->id == PF38F4476 && extp->MinorVersion == '3')
>  		extp->MinorVersion = '1';
>  }
> @@ -2249,7 +2249,7 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
>  
>  	/* Some chips have OTP located in the _top_ partition only.
>  	   For example: Intel 28F256L18T (T means top-parameter device) */
> -	if (cfi->mfr == MANUFACTURER_INTEL) {
> +	if (cfi->mfr == CFI_MFR_INTEL) {
>  		switch (cfi->id) {
>  		case 0x880b:
>  		case 0x880c:
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index 88d3d8f..df89f42 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -518,10 +518,11 @@ struct cfi_fixup {
>  #define CFI_MFR_ANY 0xffff
>  #define CFI_ID_ANY  0xffff
>  
> -#define CFI_MFR_AMD 0x0001
> -#define CFI_MFR_ATMEL 0x001F
> -#define CFI_MFR_SAMSUNG 0x00EC
> -#define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
> +#define CFI_MFR_AMD	0x0001
> +#define CFI_MFR_INTEL	0x0089
> +#define CFI_MFR_ATMEL	0x001F
> +#define CFI_MFR_SAMSUNG	0x00EC
> +#define CFI_MFR_ST	0x0020 /* STMicroelectronics */
>  
>  void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
>  
> -- 
> 1.6.0.4
> 
