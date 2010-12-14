Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSXmb-0005wZ-PS
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:31:22 +0000
Received: by bwz14 with SMTP id 14so982550bwz.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 08:31:19 -0800 (PST)
Subject: Re: [PATCH v4 1/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D6x16UxM NOR chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20101209140410.26049.51539.stgit@dev.siriade.com>
References: <20101209140410.26049.51539.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:30:47 +0200
Message-ID: <1292344247.2538.84.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Matthias Buecher / Germany <mail@maddes.net>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-09 at 15:04 +0100, Guillaume LECERF wrote:
> These chips report CFI v0.0 [1], so extend cfi_fixup_major_minor()
> to patch all Samsung chips from 0.0 to 1.0.
> Discussed and tested by the OpenWRT people [2].
> 
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NORFlash/64Mbit/K8D6316UTM/ds_K8D6x16UxM_rev16.pdf
> [2] https://dev.openwrt.org/ticket/7348
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   14 +++++++++++---
>  1 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 9d68ab9..bf457a4 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -392,9 +392,17 @@ static struct cfi_fixup fixup_table[] = {
>  static void cfi_fixup_major_minor(struct cfi_private *cfi,
>  				  struct cfi_pri_amdstd *extp)
>  {
> -	if (cfi->mfr == CFI_MFR_SAMSUNG && cfi->id == 0x257e &&
> -	    extp->MajorVersion == '0')
> -		extp->MajorVersion = '1';
> +	if (cfi->mfr == CFI_MFR_SAMSUNG) {
> +		if (extp->MajorVersion == '0' && extp->MinorVersion == '0') {
> +			/*
> +			 * Samsung K8P2815UQB and K8D6x16UxM chips report major=0 / minor=0
> +			 */
> +			printk(KERN_NOTICE "  Fixed Samsung's Amd/Fujitsu Extended Query version from 0.0 to 1.0\n");
> +
> +			extp->MajorVersion = '1';
> +		}

I'm sorry for this nit-pick, but could you please make checkpatch.pl
happy:

WARNING: line over 80 characters
#97: FILE: drivers/mtd/chips/cfi_cmdset_0002.c:398:
+                        * Samsung K8P2815UQB and K8D6x16UxM chips
report major=0 / minor=0

Also, I do not see any reason for a newline between printk() and
extp->MajorVersion = '1' - it only makes code unnecessary sparse.
Newlines ar good between logically independent things, but not between 2
things which are about the same - print about X and then do X.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
