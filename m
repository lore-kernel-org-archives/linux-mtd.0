Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XY2Dm-00062Y-9S
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 00:20:14 +0000
Received: by mail-pa0-f47.google.com with SMTP id rd3so4820399pab.20
 for <linux-mtd@lists.infradead.org>; Sat, 27 Sep 2014 17:19:52 -0700 (PDT)
Date: Sat, 27 Sep 2014 17:19:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] mtd: fsl_ifc_nand: Use devm_* throughout driver
Message-ID: <20140928001948.GO7362@norris-Latitude-E6410>
References: <2056273149.70335.1408150004992.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2056273149.70335.1408150004992.JavaMail.zimbra@xes-inc.com>
Cc: linux-mtd@lists.infradead.org, Himangi Saraogi <himangi774@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Aaron,

Hmm, you're not the only one to send a patch like this. But I'm not sure
if it's correct; this driver is written awkwardly.

On Fri, Aug 15, 2014 at 07:46:44PM -0500, Aaron Sierra wrote:
> For consistency, use managed resources for allocations and remaps
> throughout the driver.
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 2338124..7861909 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -997,9 +997,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
>  
>  	kfree(priv->mtd.name);
>  
> -	if (priv->vbase)
> -		iounmap(priv->vbase);
> -
>  	ifc_nand_ctrl->chips[priv->bank] = NULL;
>  
>  	return 0;
> @@ -1062,7 +1059,8 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
>  
>  	mutex_lock(&fsl_ifc_nand_mutex);
>  	if (!fsl_ifc_ctrl_dev->nand) {
> -		ifc_nand_ctrl = kzalloc(sizeof(*ifc_nand_ctrl), GFP_KERNEL);
> +		ifc_nand_ctrl = devm_kzalloc(&dev->dev,
> +					sizeof(*ifc_nand_ctrl), GFP_KERNEL);

This structure is static, and it looks like it's written with an attempt
of sharing the same controller structure across potentially many
instances of the device (multiple banks / chip selects?). And it has a
refcount for freeing the struct, but that refcount is wrong (see below).

>  		if (!ifc_nand_ctrl) {
>  			mutex_unlock(&fsl_ifc_nand_mutex);
>  			return -ENOMEM;
> @@ -1085,7 +1083,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
>  	priv->ctrl = fsl_ifc_ctrl_dev;
>  	priv->dev = &dev->dev;
>  
> -	priv->vbase = ioremap(res.start, resource_size(&res));
> +	priv->vbase = devm_ioremap(priv->dev, res.start, resource_size(&res));
>  	if (!priv->vbase) {
>  		dev_err(priv->dev, "%s: failed to map chip region\n", __func__);
>  		ret = -ENOMEM;
> @@ -1148,10 +1146,8 @@ static int fsl_ifc_nand_remove(struct platform_device *dev)
>  
>  	mutex_lock(&fsl_ifc_nand_mutex);
>  	ifc_nand_ctrl->counter--;
> -	if (!ifc_nand_ctrl->counter) {
> +	if (!ifc_nand_ctrl->counter)

Notice here, that there is an attempt at refcounting the ->nand
structure. It is wrong (see how 'counter' is never incremented, only
decremented). I don't know if anyone uses this driver in a "removed"
context (e.g., rmmod or device unbinding), but this patch is potentially
circumventing the (incorrect) refcounting, and instead will free the
memory when it's possibly still used by another device.

IMO, it's better to have a potential memory leak than a potential
use-after-free, so I will not apply this patch. Feel free to provide an
actual bugfix for this driver to fix the refcounting instead, though! Or
work with the original authors/users to see if this driver actually
needs all the global/static info that's being used here. Perhaps the
driver could be refactored.

>  		fsl_ifc_ctrl_dev->nand = NULL;
> -		kfree(ifc_nand_ctrl);
> -	}
>  	mutex_unlock(&fsl_ifc_nand_mutex);
>  
>  	return 0;

BTW, I see that an earlier incarnation of this type of patch says it was
based on an automated semantic patch. I'd suggest taking a hard look at
the automated tools you're using, so you don't inadverently add more
bugs while you're making "cleanups."

Regards,
Brian
