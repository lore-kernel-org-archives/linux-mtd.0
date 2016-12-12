Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGZPG-0001g2-1f
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 22:49:15 +0000
Received: by mail-pg0-x242.google.com with SMTP id e9so2307843pgc.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 14:48:52 -0800 (PST)
Date: Mon, 12 Dec 2016 14:48:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zach Brown <zach.brown@ni.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mtd: introduce function max_bad_blocks
Message-ID: <20161212224849.GA50814@google.com>
References: <1480525051-4991-1-git-send-email-zach.brown@ni.com>
 <1480525051-4991-2-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480525051-4991-2-git-send-email-zach.brown@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Nov 30, 2016 at 10:57:27AM -0600, Zach Brown wrote:
> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> If implemented, 'max_bad_blocks' returns the maximum number of bad
> blocks to reserve for a MTD. An implementation for NAND is coming soon.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>

I guess I had given my 'ack' conditional on fixing my comments. It
appears they have been fixed well enough. One small nit, but that's not
worth holding anything up:

> ---
>  drivers/mtd/mtdpart.c   | 10 ++++++++++
>  include/linux/mtd/mtd.h | 14 ++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index fccdd49..08925bb 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -349,6 +349,14 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
>  	.free = part_ooblayout_free,
>  };
>  
> +static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
> +{
> +	struct mtd_part *part = mtd_to_part(mtd);
> +
> +	return part->master->_max_bad_blocks(part->master,
> +					     ofs + part->offset, len);
> +}
> +
>  static inline void free_partition(struct mtd_part *p)
>  {
>  	kfree(p->mtd.name);
> @@ -475,6 +483,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  		slave->mtd._block_isbad = part_block_isbad;
>  	if (master->_block_markbad)
>  		slave->mtd._block_markbad = part_block_markbad;
> +	if (master->_max_bad_blocks)
> +		slave->mtd._max_bad_blocks = part_max_bad_blocks;
>  
>  	if (master->_get_device)
>  		slave->mtd._get_device = part_get_device;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052..da6d762 100644
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
> @@ -402,6 +403,19 @@ int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
>  int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
>  			      const struct mtd_pairing_info *info);
>  int mtd_pairing_groups(struct mtd_info *mtd);
> +
> +static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
> +				     loff_t ofs, size_t len)
> +{
> +	if (!mtd->_max_bad_blocks)
> +		return -ENOTSUPP;
> +
> +	if (mtd->size < (len + ofs) || ofs < 0)
> +		return -EINVAL;
> +
> +	return mtd->_max_bad_blocks(mtd, ofs, len);
> +}

I don't really know what the reasoning is for putting functions like
this as 'static inline' in the header, vs. exported from the .c file.
But this seems to be the odd man out in that regard.

> +
>  int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
>  int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
>  	      void **virt, resource_size_t *phys);

Anyway, it's all fine with me here. I think Richard suggested he'd like
to take the whole series (presuming he's happy with patch 2?) in his
tree, though IMO it's a bit late for 4.10. I guess I'm fine either way,
as it's only UBI that will suffer if this wasn't properly baked ;)

Brian
