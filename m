Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlB00-0002Yl-Ag
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 05:48:04 +0000
Received: by mail-pa0-f47.google.com with SMTP id lf10so2084661pab.20
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 22:47:42 -0700 (PDT)
Date: Thu, 15 May 2014 22:47:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: Introduce mtd_block_isreserved()
Message-ID: <20140516054732.GA2413@norris-Latitude-E6410>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140513013133.GA28907@ld-irv-0074>
 <20140514233721.GA19700@arch.cereza>
 <20140514235705.GK28907@ld-irv-0074>
 <20140515201518.GA18864@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140515201518.GA18864@arch.cereza>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 15, 2014 at 05:15:18PM -0300, Ezequiel Garcia wrote:
> On 14 May 04:57 PM, Brian Norris wrote:
> > All? Like what? mtd_read_oob()? mtd_get_fact_prot_info()? These return
> > -EOPNOTSUPP, which is an informative error code. But that's different
> > than returning 0 for mtd_block_isbad() or mtd_block_isreserved(), even
> > if the block doesn't exist.
> 
> Ah... I misunderstood your comment. The point is that you don't want to
> return 0, when the parameters may be are wrong.

Right. I think it is wrong to return '0' for the out-of-bounds case.

> So, I'll fix this patch by changing both, mtd_block_isbad and
> mtd_block_isreserved, just as you asked in the first place.

Sounds good.

> > (Also, is it just me, or is mtd_writev() missing bounds checking?)
> 
> Hm... so it seems. I guess the check should be something like:
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index d201fee..21ce0f4 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1066,11 +1066,22 @@ static int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
>  int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
>  	       unsigned long count, loff_t to, size_t *retlen)
>  {
> +	int i;
> +
>  	*retlen = 0;
>  	if (!(mtd->flags & MTD_WRITEABLE))
>  		return -EROFS;
>  	if (!mtd->_writev)
>  		return default_mtd_writev(mtd, vecs, count, to, retlen);
> +
> +	if (to < 0 || to > mtd->size)
> +		return -EINVAL;
> +	for (i = 0; i < count; i++) {
> +		if (!vecs[i].iov_len)
> +			continue;
> +		if (vecs[i].iov_len > mtd->size - to)

This isn't quite the right check. It's OK for the first iteration, but
it's not a good check for vecs[i].iov_len where i > 0. Maybe just check
the sum of all the lengths against `mtd->size - to'.

> +			return -EINVAL;
> +	}
>  	return mtd->_writev(mtd, vecs, count, to, retlen);
>  }
>  EXPORT_SYMBOL_GPL(mtd_writev);
> 
> Right?

Brian
