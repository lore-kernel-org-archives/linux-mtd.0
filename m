Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmIk-0003Y0-9S
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 11:52:20 -0400
Date: Wed, 26 Apr 2006 17:51:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
Message-ID: <20060426155116.GL29108@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 April 2006 15:36:08 +0400, Belyakov, Alexander wrote:
> 
> diff -uNr a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> --- a/drivers/mtd/mtdconcat.c	2006-04-07 20:56:47.000000000 +0400
> +++ b/drivers/mtd/mtdconcat.c	2006-04-26 15:26:21.000000000 +0400
> @@ -141,6 +141,97 @@
>  }
>  
>  static int
> +concat_writev (struct mtd_info *mtd, const struct kvec *vecs, unsigned
> long count, 
> +		loff_t to, size_t * retlen)
> +{
> +	int i, page, len, total_len, ret = 0, written = 0, cnt = 0,
> towrite;
> +	u_char *bufstart;
> +	char* data_poi;
> +	char* data_buf;
> +	loff_t write_offset;
> +	int rl_wr;
> +	u_int32_t pagesize;
> +
> +	if (mtd->flags & MTD_PROGRAM_REGIONS) {
> +		pagesize = MTD_PROGREGION_SIZE(mtd);
> +	} else {
> +		pagesize = mtd->oobblock;
> +	}

Take a look at my tree:
http://git.infradead.org/?p=users/joern/mtd-2.6.git;a=summary

Once writesize is in, this part can just go.

> +	data_buf = kmalloc(pagesize, GFP_KERNEL);

Allocation can fail.

> +	/* Preset written len for early exit */
> +	*retlen = 0;
> +
> +	/* Calculate total length of data */
> +	total_len = 0;
> +	for (i = 0; i < count; i++)
> +		total_len += (int) vecs[i].iov_len;
> +
> +	/* Do not allow write past end of page */
> +	if ((to + total_len) > mtd->size) {
> +		kfree(data_buf);

Move the allocation below this check instead.

> +		return -EINVAL;
> +	}
> +
> +	/* Setup start page */
> +	page = ((int) to) / pagesize;

If you have to cast, at least take uint32_t, as mtd->size has that
type as well.

> +	towrite = (page + 1) * pagesize - to;
> +	write_offset = to;
> +	written = 0;
> +	
> +	/* Loop until all iovecs' data has been written */
> +	len = 0;
> +	while (len < total_len) {
> +    		bufstart = (u_char *)vecs->iov_base;

Why the cast?  Can't bufstart be a void*?

> +		bufstart += written;
> +		data_poi = bufstart;
> +
> +    		/* If the given tuple is >= reet of page then
> +		 * write it out from the iov
> +		 */
> +		if ( (vecs->iov_len-written) >= towrite) {
> +			ret = mtd->write(mtd, write_offset, towrite,
> &rl_wr, data_poi);
> +			if(ret)

Documentation/CodingStyle requires a space here.

> +	    			break;
> +			len += towrite;
> +			page ++;
> +			write_offset = page * pagesize;
> +			towrite = pagesize;
> +			written += towrite;
> +			if (vecs->iov_len  == written) {
> +				vecs ++;
> +				written = 0;
> +			}
> +		} else {
> +			cnt = 0;
> +			while (cnt < towrite ) {
> +				data_buf[cnt++] = ((u_char *)
> vecs->iov_base)[written++];
> +				if (vecs->iov_len == written ) {
> +					if((cnt+len) == total_len )
> +						break;
> +					vecs ++;
> +					written = 0;
> +				}
> +			}
> +			data_poi = data_buf;
> +			ret = mtd->write(mtd, write_offset, cnt, &rl_wr,
> data_poi);
> +			if (ret)
> +				break;
> +			len += cnt;
> +			page ++;
> +			write_offset = page * pagesize;
> +			towrite = pagesize;
> +		}
> +	}
> +
> +	if(retlen)
> +		*retlen = len;
> +	kfree(data_buf);
> +	return ret;
> +}
> +
> +static int
>  concat_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
>  		size_t * retlen, u_char * buf, u_char * eccbuf,
>  		struct nand_oobinfo *oobsel)
> @@ -251,6 +342,123 @@
>  }
>  
>  static int
> +concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
> unsigned long count, 
> +		loff_t to, size_t * retlen, u_char *eccbuf, struct
> nand_oobinfo *oobsel)
> +{
> +	int i, page, len, total_len, ret = 0, written = 0, cnt = 0,
> towrite;
> +	u_char *bufstart;
> +	char* data_poi;
> +	char* data_buf;
> +	loff_t write_offset;
> +	int rl_wr;
> +	u_int32_t pagesize;
> +
> +	if (mtd->flags & MTD_PROGRAM_REGIONS) {
> +		pagesize = MTD_PROGREGION_SIZE(mtd);
> +	} else {
> +		pagesize = mtd->oobblock;
> +	}

Again.

> +	data_buf = kmalloc(pagesize, GFP_KERNEL);

Again.

> +	if (!(mtd->flags & MTD_WRITEABLE))
> +		return -EROFS;
> +
> +	/* Preset written len for early exit */
> +	*retlen = 0;
> +
> +	/* Calculate total length of data */
> +	total_len = 0;
> +	for (i = 0; i < count; i++)
> +		total_len += (int) vecs[i].iov_len;
> +
> +	/* check if no data is going to be written */
> +	if (!total_len) {
> +		kfree(data_buf);

Again.

I'll stop reading here.  These two functions look fairly similar so
there might be some duplicated code you can move into a common helper.

Once you have the above fixed up and checked all the code for similar
problems, I'll take another look.

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
