Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ6pk-0004gC-T1
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 23:27:22 +0000
Received: by mail-pg0-x241.google.com with SMTP id f127so5976789pgc.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 16:27:00 -0700 (PDT)
Date: Thu, 8 Jun 2017 16:26:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v5 3/5] mtd: handle partitioning on devices with 0
 erasesize
Message-ID: <20170608232657.GH102137@google.com>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
 <20170602032119.22282-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170602032119.22282-4-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 02, 2017 at 03:21:17PM +1200, Chris Packham wrote:
> erasesize is meaningful for flash devices but for SRAM there is no
> concept of an erase block so erasesize is set to 0. When partitioning
> these devices instead of ensuring partitions fall on erasesize
> boundaries we ensure they fall on writesize boundaries.
> 
> Helped-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v3:
> - new
> Changes in v4:
> - None
> Changes in v5:
> - None (yet). There is some active discussion on this so it may change.
>   patch 4/5 is somewhat dependent on this but only if partitions are
>   specified on the dt node.
> 
>  drivers/mtd/mtdpart.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index ea5e5307f667..5cef1247806c 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -393,8 +393,11 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  			const struct mtd_partition *part, int partno,
>  			uint64_t cur_offset)
>  {
> +	int wr_alignment = master->erasesize ? : master->writesize;

I'd prefer this be checked based on the MTD_NO_ERASE flag, as the
erasesize is essentially undefined. That might also help other drivers,
which might currently fake an erasesize just to satisfy this check. Now,
they won't have to.

i.e.

	int wr_alignment = (master->flags & MTD_NO_ERASE) ? master->erasesize :
							    master->writesize;

or similar.

>  	struct mtd_part *slave;
> +	u32 remainder;
>  	char *name;
> +	u64 tmp;
>  
>  	/* allocate the partition structure */
>  	slave = kzalloc(sizeof(*slave), GFP_KERNEL);

...

Brian
