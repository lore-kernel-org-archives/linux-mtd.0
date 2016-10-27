Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzqsK-0008JV-JP
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 20:02:09 +0000
Date: Thu, 27 Oct 2016 22:01:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 1/3] mtd: introduce function max_bad_blocks
Message-ID: <20161027220147.4ac902c6@bbrezillon>
In-Reply-To: <1477595642-11454-2-git-send-email-zach.brown@ni.com>
References: <1477595642-11454-1-git-send-email-zach.brown@ni.com>
 <1477595642-11454-2-git-send-email-zach.brown@ni.com>
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

On Thu, 27 Oct 2016 14:14:00 -0500
Zach Brown <zach.brown@ni.com> wrote:

> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> If implemented, 'max_bad_blocks' returns the maximum number of bad
> blocks to reserve for an MTD. An implementation for NAND is coming soon.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> ---
>  drivers/mtd/mtdpart.c   | 12 ++++++++++++
>  include/linux/mtd/mtd.h |  1 +
>  2 files changed, 13 insertions(+)
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
>  	slave->mtd._erase = part_erase;
>  	slave->master = master;
>  	slave->offset = part->offset;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052..bd277eb 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -322,6 +322,7 @@ struct mtd_info {
>  	int (*_block_isreserved) (struct mtd_info *mtd, loff_t ofs);
>  	int (*_block_isbad) (struct mtd_info *mtd, loff_t ofs);
>  	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
> +	int (*_max_bad_blocks) (struct mtd_info *mtd, loff_t ofs, size_t len);

Please provide an helper function around this hook, so that you can
call the helper in patch 3 and won't have to test the ->_max_bad_blocks
field directly.

This helper should return -ENOTSUPP if ->_max_bad_blocks is not
implemented.

>  	int (*_suspend) (struct mtd_info *mtd);
>  	void (*_resume) (struct mtd_info *mtd);
>  	void (*_reboot) (struct mtd_info *mtd);
