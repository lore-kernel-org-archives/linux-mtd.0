Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvwBl-0003fN-Og
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2005 07:59:41 -0400
Date: Fri, 22 Jul 2005 13:59:39 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: ?? ???? <zhao_fusheng@hotmail.com>
Message-ID: <20050722115939.GA941@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 July 2005 15:22:24 +0800, ?? ???? wrote:
> 
> Current jffs2_check_oob_empty() assumes that only OOB of first
> page has data content -- the clean marker. OOB of other pages should
> be all 0xFF.
> But if we decide to store other kind of meta-data in OOB of the
> second,third or forth page, this will cause compatibility issue.
> For example, if we store some data in OOB of second page in the
> future, the "old" JFFS2 will recognize all the erase blocks in
> the "new" JFFS2 image as ALL_DIRTY.
> So this patch solve this compatibility problem by extending existent
> node type compat_bits to OOB area. In particular, I think
> JFFS2_FEATURE_RWCOMPAT_COPY has no meaning for OOB, so it's
> handled the same way as JFFS2_FEATURE_RWCOMPAT_DELETE.
> 
> Your comments are welcome!

I'm pretty clueless wrt. oob data, so I leave the hard stuff for
others to comment on.

> --- wbuf.c.bak	2005-07-21 20:50:42.000000000 +0800
> +++ wbuf.c	2005-07-21 22:03:53.589883720 +0800
> @@ -933,9 +933,10 @@
>  {
>  	unsigned char *buf;
>  	int 	ret = 0;
> -	int	i,len,page;
> +	int	i,len,page,current_oob;
>  	size_t  retlen;
>  	int	oob_size;
> +	struct jffs2_unknown_node *node;
>  
>  	/* allocate a buffer for all oob data in this sector */
>  	oob_size = c->mtd->oobsize;
> @@ -947,7 +948,7 @@
>  	}
>  	/* 
>  	 * if mode = 0, we scan for a total empty oob area, else we have
> -	 * to take care of the cleanmarker in the first page of the block
> +	 * to take care of the data content in the subsequent pages of the block
>  	*/
>  	ret = jffs2_flash_read_oob(c, jeb->offset, len , &retlen, buf);
>  	if (ret) {
> @@ -961,28 +962,51 @@
>  		ret = -EIO;
>  		goto out;
>  	}
> -	
> -	/* Special check for first page */
> -	for(i = 0; i < oob_size ; i++) {
> -		/* Yeah, we know about the cleanmarker. */
> -		if (mode && i >= c->fsdata_pos && 
> -		    i < c->fsdata_pos + c->fsdata_len)
> -			continue;
> -
> -		if (buf[i] != 0xFF) {
> -			D2(printk(KERN_DEBUG "Found %02x at %x in OOB for %08x\n",
> -				  buf[i], i, jeb->offset));
> -			ret = 1; 
> -			goto out;
> +
> +
> +	if (!mode) {
> +		for (page = 0; page < len; page += sizeof(long)) {
> +			unsigned long dat = *(unsigned long *)(&buf[page]);
> +			if (dat != -1) {
> +				ret = 1;
> +				goto out;
> +			}
>  		}
> -	}
> +	} else {
> +		for (current_oob = 0; current_oob < len; current_oob += oob_size) {
> +			node = (struct jffs2_unknown_node *)&buf[current_oob + c->fsdata_pos];
> +			if (je16_to_cpu(node->magic) == JFFS2_MAGIC_BITMASK) {
> +				switch (je16_to_cpu(node->nodetype) & JFFS2_COMPAT_MASK) {
> +				case JFFS2_FEATURE_ROCOMPAT:
> +					c->flags |= JFFS2_SB_FLAG_RO;
> +					if (!(jffs2_is_readonly(c)))
> +						return -EROFS;
> +
> +				case JFFS2_FEATURE_RWCOMPAT_DELETE:
> +				case JFFS2_FEATURE_RWCOMPAT_COPY:
> +					for (i = current_oob; i < current_oob + oob_size; i++) {
> +						if (i >= current_oob + c->fsdata_pos &&
> +						    i < current_oob + c->fsdata_pos + c->fsdata_len)
> +							continue;
> +
> +						if (buf[i] != 0xFF) {
> +							ret = 1;
> +							goto out;

Sevenfold indentation is not what I call good coding style.  Try to
make this stuff simpler.  Use "if (!...) continue" and similar
constructs.

> +						}
> +					}
> +					break;
>  
> -	/* we know, we are aligned :) */	
> -	for (page = oob_size; page < len; page += sizeof(long)) {
> -		unsigned long dat = *(unsigned long *)(&buf[page]);
> -		if(dat != -1) {
> -			ret = 1; 
> -			goto out;
> +				case JFFS2_FEATURE_INCOMPAT:
> +					return -EINVAL;
> +				}
> +			} else {
> +				for (i = current_oob; i < current_oob + oob_size; i++) {
> +					if (buf[i] != 0xFF) {
> +						ret = 1;
> +						goto out;

Same here.

> +					}
> +				}
> +			}
>  		}
>  	}
 

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
