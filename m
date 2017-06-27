Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPvVW-00044j-4s
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 18:46:40 +0000
Received: by mail-pf0-x241.google.com with SMTP id d5so5822720pfe.1
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 11:46:17 -0700 (PDT)
Date: Tue, 27 Jun 2017 11:46:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2 1/2] mtd: Stop directly calling master ->_xxx() hooks
 from mtdpart code
Message-ID: <20170627184614.GC55942@google.com>
References: <20170625160113.11860-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170625160113.11860-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 25, 2017 at 06:01:12PM +0200, Boris Brezillon wrote:
> The MTD layer provides several wrappers around mtd->_xxx() hooks. Call
> these wrappers instead of directly dereferencing the associated ->_xxx()
> pointer.
> 
> This change has been motivated by another rework letting the core
> handle the case where ->_read/write_oob() are implemented but not
> ->_read/write(). In this case, we want mtd_read/write() to fall back to
> ->_read/write_oob() when ->_read/write() are NULL. The problem is,
> mtdpart is directly calling the ->_xxx() instead of using the wrappers,
> thus leading to a NULL pointer exception.
> 
> Even though we only need to do the change for part_read/write(), going
> through those wrappers for all kind of part -> master operation
> propagation is a good thing, because other wrappers might become
> smarter over time, and the duplicated check overhead (parameters will
> be checked at the partition and master level instead of only at the
> partition level) should be negligible.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - new patch needed to fix a NULL pointer dereference BUG

I think I like this patch on the whole. A few notes below.

> ---
>  drivers/mtd/mtdpart.c | 71 ++++++++++++++++++++++-----------------------------
>  1 file changed, 31 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index ea5e5307f667..11486ec6cab0 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -68,8 +68,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	int res;
>  
>  	stats = part->master->ecc_stats;
> -	res = part->master->_read(part->master, from + part->offset, len,
> -				  retlen, buf);
> +	res = mtd_read(part->master, from + part->offset, len, retlen, buf);
>  	if (unlikely(mtd_is_eccerr(res)))
>  		mtd->ecc_stats.failed +=
>  			part->master->ecc_stats.failed - stats.failed;

The parent-to-child ECC stat handling is different here than it is
below, in part_read_oob().

...

> @@ -132,7 +130,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
>  			return -EINVAL;
>  	}
>  
> -	res = part->master->_read_oob(part->master, from + part->offset, ops);
> +	res = mtd_read_oob(part->master, from + part->offset, ops);
>  	if (unlikely(res)) {
>  		if (mtd_is_bitflip(res))
>  			mtd->ecc_stats.corrected++;

Notice how we only count a single increment here.

That seems wrong, doesn't it? But then, do we guarantee that
->_read_oob() implementations follow the same stat recording guarantees
that ->_read() implementations do (or should)? Might double check that
before trying to fiddle here any more than you are.

I'm not sure if that affects your next patch at all. It's not a
criticism of this patch either, but I just noticed it when reviewing.

[...]

I was also wondering whether this patch couldn't go a step further, and
remove conditions like this:

	if (parent->_panic_write)
		slave->mtd._panic_write = part_panic_write; 

Since part_panic_write() should call mtd_panic_write() on the parent
(master), which would do its own -EOPNOTSUPP check. But then I suppose
that might invert the order of the checks, causing (for example) -EINVAL
for out-of-bounds panic write instead of -EOPNOTSUPP. So maybe that's
better left alone.

Brian
