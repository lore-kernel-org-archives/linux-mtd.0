Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDctf-0007AF-CL
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 11:20:29 +0000
Date: Mon, 8 Jun 2009 12:20:02 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct
	macros for 2412/2440
Message-ID: <20090608112002.GB31034@fluff.org.uk>
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
Cc: wookey@wookware.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, ben-linux@fluff.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 07, 2009 at 03:04:22PM +0200, Peter Korsgaard wrote:
> Use the correct S3C2440_NFCONF_* macros for the mask for the 2412/2440
> variants instead of the 2410 ones which use wrong bit positions.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Acked-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  drivers/mtd/nand/s3c2410.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 89b7905..01a105e 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -253,9 +253,9 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
>  
>  	case TYPE_S3C2440:
>  	case TYPE_S3C2412:
> -		mask = (S3C2410_NFCONF_TACLS(tacls_max - 1) |
> -			S3C2410_NFCONF_TWRPH0(7) |
> -			S3C2410_NFCONF_TWRPH1(7));
> +		mask = (S3C2440_NFCONF_TACLS(tacls_max - 1) |
> +			S3C2440_NFCONF_TWRPH0(7) |
> +			S3C2440_NFCONF_TWRPH1(7));
>  
>  		set = S3C2440_NFCONF_TACLS(tacls - 1);
>  		set |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
> -- 
> 1.6.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
