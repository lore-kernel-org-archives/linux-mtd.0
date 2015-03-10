Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVDfN-0000JW-RX
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 06:29:22 +0000
Received: by pdbfp1 with SMTP id fp1so63621533pdb.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 23:29:00 -0700 (PDT)
Date: Mon, 9 Mar 2015 23:28:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 30/60] mtd: nand: fsl_elbc_nand: show device in sysfs
Message-ID: <20150310062852.GA4124@norris-Latitude-E6410>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-31-git-send-email-fransklaver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425418844-25177-31-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 03, 2015 at 10:40:14PM +0100, Frans Klaver wrote:
> Fix a bug where devices aren't shown in sysfs.
> 
> While at it, make use of the default owner value set by mtdcore.
> 
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index 04b22fd..0cd94a1 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -747,7 +747,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  
>  	/* Fill in fsl_elbc_mtd structure */
>  	priv->mtd.priv = chip;
> -	priv->mtd.owner = THIS_MODULE;
> +	priv->mtd.dev.parent = &chip->dev;

drivers/mtd/nand/fsl_elbc_nand.c: In function 'fsl_elbc_chip_init':
drivers/mtd/nand/fsl_elbc_nand.c:750:30: error: 'struct nand_chip' has no member named 'dev'
make[4]: *** [drivers/mtd/nand/fsl_elbc_nand.o] Error 1

>  
>  	/* set timeout to maximum */
>  	priv->fmr = 15 << FMR_CWTO_SHIFT;
> -- 
> 2.2.2
> 
