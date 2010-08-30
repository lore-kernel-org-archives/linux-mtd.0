Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3uX-0002sF-9W
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:56:29 +0000
Received: by vws11 with SMTP id 11so5533119vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:56:28 -0700 (PDT)
Subject: Re: [PATCH] mtd: Blackfin NFC: fix build error after
	nand_scan_ident() change
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
References: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:56:13 +0300
Message-ID: <1283172973.12995.73.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	uclinux-dist-devel@blackfin.uclinux.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-08-28 at 01:45 -0400, Mike Frysinger wrote:
> Seems some patches got out sync when being merged.  The Blackfin NFC
> driver was updated to use nand_scan_ident(), but it missed the change
> where nand_scan_ident() now takes 3 arguments.  So update this driver
> to fix build failures.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> note: this needs to be merged before 2.6.36 final
> 
>  drivers/mtd/nand/bf5xx_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
> index a382e3d..162c5ea 100644
> --- a/drivers/mtd/nand/bf5xx_nand.c
> +++ b/drivers/mtd/nand/bf5xx_nand.c
> @@ -710,7 +710,7 @@ static int bf5xx_nand_scan(struct mtd_info *mtd)
>  	struct nand_chip *chip = mtd->priv;
>  	int ret;
>  
> -	ret = nand_scan_ident(mtd, 1);
> +	ret = nand_scan_ident(mtd, 1, NULL);
>  	if (ret)
>  		return ret;

Pushed to l2-mtd-2.6.git / master so far, but please, bug dwmw2 about
2.6.36 inclusion, I'll do this as well, though.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
