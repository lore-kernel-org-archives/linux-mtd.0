Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeZF-0004Uv-PY
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 10:15:55 +0000
Date: Wed, 21 Sep 2016 12:15:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Walter <dwalter@sigma-star.at>, computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/46] mtdpart: Propagate _get/put_device()
Message-ID: <20160921121531.7786ee9b@bbrezillon>
In-Reply-To: <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
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

On Wed, 21 Sep 2016 11:43:56 +0200
Daniel Walter <dwalter@sigma-star.at> wrote:

> From: Richard Weinberger <richard@nod.at>
> 
> If the master device has callbacks for _get/put_device()
> and this MTD has slaves a get_mtd_device() call on paritions
> will never issue the registered callbacks.
> Fix this by propagating _get/put_device() down.

Brian, can we have this one queued for 4.9? I can't take it in my tree
if you want, but it's probably better if it's in the mtd tree.

> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/mtdpart.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 1f13e32..ec852fa 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -317,6 +317,18 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  	return res;
>  }
>  
> +static int part_get_device(struct mtd_info *mtd)
> +{
> +	struct mtd_part *part = mtd_to_part(mtd);
> +	return part->master->_get_device(part->master);
> +}
> +
> +static void part_put_device(struct mtd_info *mtd)
> +{
> +	struct mtd_part *part = mtd_to_part(mtd);
> +	part->master->_put_device(part->master);
> +}
> +
>  static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
>  			      struct mtd_oob_region *oobregion)
>  {
> @@ -463,6 +475,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  		slave->mtd._block_isbad = part_block_isbad;
>  	if (master->_block_markbad)
>  		slave->mtd._block_markbad = part_block_markbad;
> +
> +	if (master->_get_device)
> +		slave->mtd._get_device = part_get_device;
> +	if (master->_put_device)
> +		slave->mtd._put_device = part_put_device;
> +
>  	slave->mtd._erase = part_erase;
>  	slave->master = master;
>  	slave->offset = part->offset;
