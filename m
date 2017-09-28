Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dxVPa-0002dd-8x
 for linux-mtd@lists.infradead.org; Thu, 28 Sep 2017 09:47:23 +0000
Date: Thu, 28 Sep 2017 11:46:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 stable@vger.kernel.org, Mathias Thore <Mathias.Thore@infinera.com>
Subject: Re: [PATCH v2] mtd: Fix partition alignment check on
 multi-erasesize devices
Message-ID: <20170928114644.3708886c@bbrezillon>
In-Reply-To: <20170925081957.19177-1-boris.brezillon@free-electrons.com>
References: <20170925081957.19177-1-boris.brezillon@free-electrons.com>
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

On Mon, 25 Sep 2017 10:19:57 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Commit 1eeef2d7483a ("mtd: handle partitioning on devices with 0
> erasesize") introduced a regression on heterogeneous erase region
> devices. Alignment of the partition was tested against the master
> eraseblock size which can be bigger than the slave one, thus leading
> to some partitions being marked as read-only.
> 
> Update wr_alignment to match this slave erasesize after this erasesize
> has been determined by picking the biggest erasesize of all the regions
> embedded in the MTD partition.
> 
> Reported-by: Mathias Thore <Mathias.Thore@infinera.com>
> Fixes: 1eeef2d7483a ("mtd: handle partitioning on devices with 0 erasesize")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied.

> ---
> Changes in v2:
> - Fix build error reported by Mathias
> ---
>  drivers/mtd/mtdpart.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 5736b0c90b33..a308e707392d 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -581,6 +581,14 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
>  		slave->mtd.erasesize = parent->erasesize;
>  	}
>  
> +	/*
> +	 * Slave erasesize might differ from the master one if the master
> +	 * exposes several regions with different erasesize. Adjust
> +	 * wr_alignment accordingly.
> +	 */
> +	if (!(slave->mtd.flags & MTD_NO_ERASE))
> +		wr_alignment = slave->mtd.erasesize;
> +
>  	tmp = slave->offset;
>  	remainder = do_div(tmp, wr_alignment);
>  	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
