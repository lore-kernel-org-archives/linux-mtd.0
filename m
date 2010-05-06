Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9unU-0006eK-SB
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 06:43:01 +0000
Subject: Re: [PATCH resend] mpc5121_nfc: Changed SVR check to allow MPC5123.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Deiters <SteveDeiters@BASLER.com>
In-Reply-To: <181804936ABC2349BE503168465576460EA16F75@exchserver.basler.com>
References: <181804936ABC2349BE503168465576460E95836C@exchserver.basler.com>
	<1272980863.3702.10.camel@localhost>
	<181804936ABC2349BE503168465576460EA16F75@exchserver.basler.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 09:42:07 +0300
Message-ID: <1273128127.3702.201.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 13:48 -0500, Steve Deiters wrote:
> The revision in SVR for MPC5123 is 3.  The NFC is the same as MPC5121
> revision 2.
> 
> Signed-off-by: Steve Deiters <SteveDeiters@basler.com>
> ---
>  drivers/mtd/nand/mpc5121_nfc.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mpc5121_nfc.c
> b/drivers/mtd/nand/mpc5121_nfc.c
> index 191bf99..dc04d74 100644
> --- a/drivers/mtd/nand/mpc5121_nfc.c
> +++ b/drivers/mtd/nand/mpc5121_nfc.c
> @@ -666,10 +666,10 @@ static int __devinit mpc5121_nfc_probe(struct
> of_device *op,
>  
>  	/*
>  	 * Check SoC revision. This driver supports only NFC
> -	 * in MPC5121 revision 2.
> +	 * in MPC5121 revision 2 and MPC5123 revision 3.
>  	 */
>  	rev = (mfspr(SPRN_SVR) >> 4) & 0xF;
> -	if (rev != 2) {
> +	if ((rev != 2) && (rev != 3)) {
>  		dev_err(dev, "SoC revision %u is not supported!\n",
> rev);
>  		return -ENXIO;
>  	}

Now your patch is line-wrapped. But I fixed it and pushed to
l2-mtd-2.6.git / master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
