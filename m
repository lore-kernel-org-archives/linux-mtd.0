Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CnNZD-0004vu-Hs
	for linux-mtd@lists.infradead.org; Sat, 08 Jan 2005 15:52:13 -0500
Date: Sat, 8 Jan 2005 21:51:52 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050108205152.GF11728@wohnheim.fh-wedel.de>
References: <1104961832.15121.45.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1104961832.15121.45.camel@weaponx.rchland.ibm.com>
Cc: tom_gall@vnet.ibm.com, linux-mtd@lists.infradead.org, sallyt@us.ibm.com
Subject: Re: [PATCH] Add error checking to slram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 January 2005 15:50:32 -0600, Josh Boyer wrote:
> 
> The following patch fixes a couple issues I saw with the slram driver.
> 
> 1) No error checking was being done at all.
> 
> 2) There was no eraseblock size for slram, which made JFFS2 unhappy.

Had a look at that one and imo it's jffs2 that should get fixed.  But
for the moment, your patch is fine.

> I think the phram driver might suffer from the eraseblock issue.  Also,
> the current version of phram has another problem that this patch fixes
> for slram.

Patch is in my tree already.  Will commit it soonish.  Thanks for the
report.

> Basically, the driver doesn't return shorted reads.  I had a problem
> where -EINVAL was being returned on a read past the end of the device. 
> Seemed fine at first glance, but it's not.
> 
> If JFFS2 is used on slram/phram, a dirent node (for example) can be
> written to the very end of the device.  When get_inode_nodes reads off
> the node it uses the union of the node types which caused the read to go
> past the end of the device.  JFFS2 deals fine with shorted reads in that
> case, but slram was returning -EINVAL which caused problems.  Once the
> slram driver was fixed to do shorted reads, the problem went away.

Imo, this might be a jffs2 problem as well.  In it's current state,
jffs2 is a bitch to work with, though, so your patch is the simple
solution.  More on jffs2 in a seperate mail.

> Just thought I'd point that out if anyone dealing with phram is
> listening.

;)

> Please take a look at the patch and commit if it looks good.  Comments
> are always welcome too :).

Just one, rest looks fine to me.

> thx,
> josh
> 
> Signed-off-by: Josh Boyer <jdub@us.ibm.com>
> 
> --- mtd/drivers/mtd/devices/slram.c	2005-01-05 14:37:06.000000000 -0600
> +++ mtd.jwb/drivers/mtd/devices/slram.c	2005-01-05 14:36:41.000000000 -0600
> @@ -50,6 +50,7 @@
>  #include <linux/mtd/mtd.h>
>  
>  #define SLRAM_MAX_DEVICES_PARAMS 6		/* 3 parameters / device */
> +#define SLRAM_BLK_SZ 0x4000
>  
>  #define T(fmt, args...) printk(KERN_DEBUG fmt, ## args)
>  #define E(fmt, args...) printk(KERN_NOTICE fmt, ## args)
> @@ -108,6 +109,9 @@
>  {
>  	slram_priv_t *priv = mtd->priv;
>  
> +	if (from + len > mtd->size)
> +		return -EINVAL;
> +
>  	*mtdbuf = priv->start + from;
>  	*retlen = len;
>  	return(0);
> @@ -121,7 +125,13 @@
>  		size_t *retlen, u_char *buf)
>  {
>  	slram_priv_t *priv = mtd->priv;
> -	
> +
> +	if (from > mtd->size)
> +		return -EINVAL;
> +
> +	if (from + len > mtd->size)
> +		len = mtd->size - from;
> +

My code is slightly different:
	if (len > mtd->size - from)
		...

And yes, this _can_ make a difference. ;)

>  	memcpy(buf, priv->start + from, len);
>  
>  	*retlen = len;
> @@ -133,6 +143,9 @@
>  {
>  	slram_priv_t *priv = mtd->priv;
>  
> +	if (to + len > mtd->size)
> +		return -EINVAL;
> +
>  	memcpy(priv->start + to, buf, len);
>  
>  	*retlen = len;
> @@ -188,7 +201,7 @@
>  	(*curmtd)->mtdinfo->name = name;
>  	(*curmtd)->mtdinfo->size = length;
>  	(*curmtd)->mtdinfo->flags = MTD_CLEAR_BITS | MTD_SET_BITS |
> -					MTD_WRITEB_WRITEABLE | MTD_VOLATILE;
> +					MTD_WRITEB_WRITEABLE | MTD_VOLATILE | MTD_CAP_RAM;
>          (*curmtd)->mtdinfo->erase = slram_erase;
>  	(*curmtd)->mtdinfo->point = slram_point;
>  	(*curmtd)->mtdinfo->unpoint = slram_unpoint;
> @@ -196,7 +209,7 @@
>  	(*curmtd)->mtdinfo->write = slram_write;
>  	(*curmtd)->mtdinfo->owner = THIS_MODULE;
>  	(*curmtd)->mtdinfo->type = MTD_RAM;
> -	(*curmtd)->mtdinfo->erasesize = 0x0;
> +	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
>  
>  	if (add_mtd_device((*curmtd)->mtdinfo))	{
>  		E("slram: Failed to register new device\n");
> @@ -261,7 +274,7 @@
>  	}
>  	T("slram: devname=%s, devstart=0x%lx, devlength=0x%lx\n",
>  			devname, devstart, devlength);
> -	if ((devstart < 0) || (devlength < 0)) {
> +	if ((devstart < 0) || (devlength < 0) || (devlength % SLRAM_BLK_SZ != 0)) {
>  		E("slram: Illegal start / length parameter.\n");
>  		return(-EINVAL);
>  	}
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
