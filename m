Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgtdI-0004zF-0k
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 06:08:49 +0000
Received: by fxm3 with SMTP id 3so3264146fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 23:08:47 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: consider version 1.4 as a valid
	primary extension version
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100804204916.27906.74766.stgit@dev.siriade.com>
References: <20100804204916.27906.74766.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 09:08:44 +0300
Message-Id: <1280988524.1175.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gernot Hoyler <Gernot.Hoyler@spansion.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-04 at 22:50 +0200, Guillaume LECERF wrote:
> As my first patch has been pushed, here is the change requested by Gernot Hoyler.
> 
> ---

Because of this my git-am removes the below comment part... and your
signed-off-by.

> The Spansion S29WS-P device family uses CFI version 1.4 [1].
> Consider it as a valide version.
> 
> [1] http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 749203f..16c4eee 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -418,12 +418,13 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
>  			cfi_fixup_major_minor(cfi, extp);
>  
>  			/*
> -			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3
> -			 * see: http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19 and on
> +			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4
> +			 * see: http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19
>  			 *      http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf
> +			 *      http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
>  			 */
>  			if (extp->MajorVersion != '1' ||
> -			    (extp->MajorVersion == '1' && ( extp->MinorVersion < '0' || extp->MinorVersion > '3'))) {
> +			    (extp->MajorVersion == '1' && ( extp->MinorVersion < '0' || extp->MinorVersion > '4'))) {
>  				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
>  				       "version %c.%c (%#02x/%#02x).\n",
>  				       extp->MajorVersion, extp->MinorVersion,
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
