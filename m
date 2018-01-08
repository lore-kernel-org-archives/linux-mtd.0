Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYeKF-0005G5-CS
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 20:47:21 +0000
Date: Mon, 8 Jan 2018 21:46:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park
 <kyungmin.park@samsung.com>, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Ladislav Michl
 <ladis@linux-mips.org>
Subject: Re: [PATCH v3 3/4] mtd: Stop directly calling master ->_xxx() hooks
 from mtdpart code
Message-ID: <20180108214656.35f26b27@bbrezillon>
In-Reply-To: <20171215123954.30017-4-boris.brezillon@free-electrons.com>
References: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
 <20171215123954.30017-4-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Ladislav

On Fri, 15 Dec 2017 13:39:53 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

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
> Changes in v3:
> - unconditionally assign part wrappers as suggested by Brian
> 
> Changes in v2:
> - new patch needed to fix a NULL pointer dereference BUG
> ---
>  drivers/mtd/mtdpart.c | 141 +++++++++++++++++++-------------------------------
>  1 file changed, 53 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index be088bccd593..e83c9d870b11 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -74,8 +74,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	int res;
>  
>  	stats = part->parent->ecc_stats;
> -	res = part->parent->_read(part->parent, from + part->offset, len,
> -				  retlen, buf);
> +	res = mtd_read(part->parent, from + part->offset, len, retlen, buf);

This change introduced a regression (reported by Ladislav) because
mtd_read() does not return the number of bitflips and instead returns 0
if we are below ->bitflips_threshold and -EUCLEAN if we're equal
or above. That's a problem in 2 situations:
1/ when ->bitflips_threshold is customized for a specific partition,
   the custom value is ignored in favor of the one set on the master MTD
   device
2/ when PARTITIONED_MASTER is not defined, ->bitflip_threshold is not
   initialized (->bitflip_threshold = 0), thus triggering -EUCLEAN
   every time we read a page

I fear this patch might introduce other subtle regression so I plan to
drop it entirely.

Regards,

Boris

>  	if (unlikely(mtd_is_eccerr(res)))
>  		mtd->ecc_stats.failed +=
>  			part->parent->ecc_stats.failed - stats.failed;
