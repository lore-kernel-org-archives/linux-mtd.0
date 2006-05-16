Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfuzO-0000GK-Hq
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 04:33:17 -0400
Date: Tue, 16 May 2006 10:33:02 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexander Belyakov <alexander.belyakov@intel.com>
Message-ID: <20060516083302.GC18958@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
	<20060515122535.GA26656@wohnheim.fh-wedel.de>
	<44697264.8040509@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44697264.8040509@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2006 10:34:12 +0400, Alexander Belyakov wrote:
>  
>  /*
> + * Forward function declaration
> + */
> +static int
> +concat_writev_ecc(struct mtd_info *mtd, const struct kvec *vecs,
> +		unsigned long count, loff_t to, size_t * retlen,
> +		u_char *eccbuf, struct nand_oobinfo *oobsel);
> +

This hunk can be removed...

> +static int
> +concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
> +		unsigned long count, loff_t to, size_t * retlen)
> +{
> +	return concat_writev_ecc(mtd, vecs, count, to, retlen, NULL, NULL);
> +}

...if this is moved down a little.

>  static int
> +concat_writev_ecc(struct mtd_info *mtd, const struct kvec *vecs,
> +		unsigned long count, loff_t to, size_t * retlen,
                                                        ^

> +	/* Do not allow write past end of page */
> +	if ((to + total_len) > mtd->size)
> +		return -EINVAL;

s/page/device/ ?

> +	if (concat->mtd.type == MTD_NANDFLASH) {
> +    		if ((to & (mtd->oobblock - 1)) ||
   ^^^^

> +		    (total_len & (mtd->oobblock - 1)))
> +			return -EINVAL;
> +	}

Not generic enough.  You would need a similar, but not identical check
for dataflash, another one for ecc nor, one for sibley.  And if
someone merges yet another weird chip...

What I'm currently doing in my tree (that dwmw2 still didn't look at)
is remove some of the special cases in existing code.  Basically, I
start with the lowest common denominator of all devices:
1. Device has one erasesize.
2. Device has one writesize.
3. Erasesize is a multiple of writesize.
4. At least <writesize> aligned bytes must be written in one go.
5. Writes to any eraseblock must happen in order, from lowest offset to
   highest.
6. Any number of eraseblocks can be written to in any order, providing
   that rule 5 is followed.
7. Neither writesize nor erasesize must be a power of 2.

Among other things mtd->oobblock is replaced with mtd->writesize, as
that is a generic attribute of any flash type.  Once that is in - and
it should go in before this patch - you can exchange above code with
something like this:

	if (mtd->writesize > 1)
		if ((to % mtd->writesize) || (total_len % mtd->writesize))
			return -EINVAL;

> +	/* make a copy of vecs */
> +	vecs_copy = kmalloc(sizeof(struct kvec) * count, GFP_KERNEL);
> +	if (!vecs_copy)
> +		return -ENOMEM;
> +	memcpy(vecs_copy, vecs, sizeof(struct kvec) * count);

Ok for now.  In the future, we might run into problems when memory
pressure causes dirty pages to get written to flash.  Then this
allocation will fail because of memory pressure and we have a
livelock.

With jffs2 this can't happen, so don't worry about it yet.

> +	entry_low = 0;
> +	for (i = 0; i < concat->num_subdev; i++) {
> +		struct mtd_info *subdev = concat->subdev[i];
> +		size_t size, wsize, retsize, old_iov_len;
> +
> +		if (to >= subdev->size) {
> +			size = 0;

Is this line necessary?

> +			to -= subdev->size;
> +			continue;
> +		}
> +
> +		if (to + total_len > subdev->size)
> +			size = subdev->size - to;
> +		else
> +			size = total_len;

		size = min(total_len, subdev->size - to);

> +		while (entry_high < count) {
> +			if (size > vecs_copy[entry_high].iov_len)
> +				size -= vecs_copy[entry_high++].iov_len;
> +			else
> +				break;
> +		}

		while (entry_high < count) {
			if (size <= vecs_copy[entry_high].iov_len)
				break;
			size -= vecs_copy[entry_high++].iov_len;
		}

> +		vecs_copy[entry_high].iov_base = vecs_copy[entry_high].iov_base
> +						+ size;

		vecs_copy[entry_high].iov_base += size;

> +	if(concat->mtd.type == MTD_NANDFLASH)
> +		memcpy(&concat->mtd.oobinfo,
> +			&subdev[0]->oobinfo,sizeof(struct nand_oobinfo));
                                            ^

Rest looks fine.

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson 
