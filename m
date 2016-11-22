Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9G7P-00060w-2K
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 18:48:36 +0000
Received: by mail-pf0-x241.google.com with SMTP id y68so1840701pfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 10:48:12 -0800 (PST)
Date: Tue, 22 Nov 2016 10:48:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zach Brown <zach.brown@ni.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/5] mtd: introduce function max_bad_blocks
Message-ID: <20161122184809.GB77253@google.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
 <1479757899-6849-2-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479757899-6849-2-git-send-email-zach.brown@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few small comments.

On Mon, Nov 21, 2016 at 01:51:35PM -0600, Zach Brown wrote:
> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> If implemented, 'max_bad_blocks' returns the maximum number of bad
> blocks to reserve for an MTD. An implementation for NAND is coming soon.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
> ---
>  drivers/mtd/mtdpart.c   | 12 ++++++++++++
>  include/linux/mtd/mtd.h | 11 +++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index fccdd49..565f0dd 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -349,6 +349,16 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
>  	.free = part_ooblayout_free,
>  };
>  
> +static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
> +{
> +	struct mtd_part *part = mtd_to_part(mtd);
> +
> +	if ((len + ofs) > mtd->size)
> +		return -EINVAL;

Normally you want the bounds checking in the top-level API, and that
should be enough for the partitions as well. Also, what about 'ofs < 0'?

> +	return part->master->_max_bad_blocks(part->master,
> +					     ofs + part->offset, len);
> +}
> +
>  static inline void free_partition(struct mtd_part *p)
>  {
>  	kfree(p->mtd.name);
> @@ -481,6 +491,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  	if (master->_put_device)
>  		slave->mtd._put_device = part_put_device;
>  
> +	if (master->_max_bad_blocks)
> +		slave->mtd._max_bad_blocks = part_max_bad_blocks;

Nit: add an extra blank line after? Also might make sense to stick this
up with the other bad-block-related assignments (after _block_markbad =
...).

>  	slave->mtd._erase = part_erase;
>  	slave->master = master;
>  	slave->offset = part->offset;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052..c02d3c2 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -322,6 +322,7 @@ struct mtd_info {
>  	int (*_block_isreserved) (struct mtd_info *mtd, loff_t ofs);
>  	int (*_block_isbad) (struct mtd_info *mtd, loff_t ofs);
>  	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
> +	int (*_max_bad_blocks) (struct mtd_info *mtd, loff_t ofs, size_t len);
>  	int (*_suspend) (struct mtd_info *mtd);
>  	void (*_resume) (struct mtd_info *mtd);
>  	void (*_reboot) (struct mtd_info *mtd);
> @@ -402,6 +403,16 @@ int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
>  int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
>  			      const struct mtd_pairing_info *info);
>  int mtd_pairing_groups(struct mtd_info *mtd);
> +
> +static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
> +				     loff_t ofs, size_t len)
> +{

Bounds checks here?

Brian

> +	if (mtd->_max_bad_blocks)
> +		return mtd->_max_bad_blocks(mtd, ofs, len);
> +
> +	return -ENOTSUPP;
> +}
> +
>  int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
>  int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
>  	      void **virt, resource_size_t *phys);
> -- 
> 2.7.4
> 
