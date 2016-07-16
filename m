Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bODWy-0004qH-Le
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 00:32:33 +0000
Received: by mail-pf0-x243.google.com with SMTP id t190so7163934pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 17:32:12 -0700 (PDT)
Date: Fri, 15 Jul 2016 17:32:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-ID: <20160716003209.GC76613@google.com>
References: <20160715110629.GB9258@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160715110629.GB9258@mwanda>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ stable

Hi Dan,

Patch looks good, but one question.

On Fri, Jul 15, 2016 at 02:06:30PM +0300, Dan Carpenter wrote:
> We check for NULL but then dereference "info->mtd" on the next line.
> 
> Fixes: 72169755cf36 ('mtd: maps: sa1100-flash: show parent device in sysfs')

What am I supposed to do about tags like this? It appears that the
-stable folks have started taking patches with a 'Fixes' tag alone [0],
even though that's not mentioned in [1]. I ask because I strongly
suspect this patch doesn't fit the rules in [1] -- it quite likely has
only been compile tested; and it qualifies quite well as violating
bullet 4:

"""
 - It must fix a real bug that bothers people (not a, "This could be a
   problem..." type thing).
"""

So, I'd like to keep the tag, but I'd like to avoid having to NAK it in
the stable review process. (And really, I often don't care enough to
even do that. I believe there's a very low chance that something like
this would cause additional problems more than the original bug.)

Regards,
Brian

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
> index 142fc3d..784c6e1 100644
> --- a/drivers/mtd/maps/sa1100-flash.c
> +++ b/drivers/mtd/maps/sa1100-flash.c
> @@ -230,8 +230,10 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
>  
>  		info->mtd = mtd_concat_create(cdev, info->num_subdev,
>  					      plat->name);
> -		if (info->mtd == NULL)
> +		if (info->mtd == NULL) {
>  			ret = -ENXIO;
> +			goto err;
> +		}
>  	}
>  	info->mtd->dev.parent = &pdev->dev;
>  

[0] I haven't tried to prove that all patches with 'Fixes' tags go to
the -stable queue, but I know at least that this commit:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3b5394a3ccffbfa1d1d448d48742853a862822c4

ended up in v4.5.y here:

https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=800a0b8a973b4262c92c228043cd17455cdf1a15

and IIRC, there are plenty more like that.

[1] Documentation/stable_kernel_rules.txt
