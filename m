Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSXnc-000662-AO
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:32:25 +0000
Received: by bwz14 with SMTP id 14so983719bwz.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 08:32:23 -0800 (PST)
Subject: Re: [PATCH v4 2/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D3x16UxC NOR chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20101209140416.26049.54282.stgit@dev.siriade.com>
References: <20101209140410.26049.51539.stgit@dev.siriade.com>
	<20101209140416.26049.54282.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:31:53 +0200
Message-ID: <1292344313.2538.86.camel@localhost>
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
> These chips report CFI v3.3 [1], so patch them on the fly to the more
> correct v1.3.
> Discussed and tested by the OpenWRT people [2].
> 
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NORFlash/32Mbit/K8D3216UBC/ds_K8D3x16UxC_rev17.pdf
> [2] https://dev.openwrt.org/ticket/866
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> Acked-by: Wolfram Sang <w.sang@pengutronix.de>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index bf457a4..13cee2b 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -401,6 +401,14 @@ static void cfi_fixup_major_minor(struct cfi_private *cfi,
>  
>  			extp->MajorVersion = '1';
>  		}
> +		if (extp->MajorVersion == '3' && extp->MinorVersion == '3') {
> +			/*
> +			 * Samsung K8D3x16UxC chips report major=3 / minor=3
> +			 */
> +			printk(KERN_NOTICE "  Fixed Samsung's Amd/Fujitsu Extended Query version from 3.3 to 1.3\n");
> +
> +			extp->MajorVersion = '1';
> +		}

Similar, I think this newline is unneeded. Sorry for nit-picking
again :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
