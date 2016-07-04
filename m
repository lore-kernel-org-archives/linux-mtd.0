Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK0Io-0002ni-B8
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 09:36:30 +0000
Date: Mon, 4 Jul 2016 11:35:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdpart: propagate _get/put_device()
Message-ID: <20160704113558.0daab438@bbrezillon>
In-Reply-To: <1467231263-3974-1-git-send-email-richard@nod.at>
References: <1467231263-3974-1-git-send-email-richard@nod.at>
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

On Wed, 29 Jun 2016 22:14:23 +0200
Richard Weinberger <richard@nod.at> wrote:

> If the master device has callbacks for _get/put_device()
> and this MTD has slaves a get_mtd_device() call on paritions
> will never issue the registered callbacks.
> Fix this by propergating _get/put_device() down.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Nit below, otherwise it looks good to me:

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Hi!
> 
> I've found this issue while heavily reworking nandsim.
> With my changes applied you can add/remove MTD's during
> runtime. I figured that nandsim's refcounting goes nuts.
> After tracking down the root cause I figured that
> _get/put_device() has no effect on MTD slaves.
> 
> Thanks,
> //richard
> 
> ---
>  drivers/mtd/mtdpart.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 1f13e32..938dbeb 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -317,6 +317,19 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
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
> +

Extra blank line here.

>  static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
>  			      struct mtd_oob_region *oobregion)
>  {
> @@ -463,6 +476,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
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
