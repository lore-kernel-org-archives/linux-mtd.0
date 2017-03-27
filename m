Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1csPaa-00059q-DS
 for linux-mtd@lists.infradead.org; Mon, 27 Mar 2017 08:01:22 +0000
Date: Mon, 27 Mar 2017 10:00:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, thorsten.christiansson@idquantique.com,
 laurent.monat@idquantique.com, Dinh Nguyen <dinguyen@kernel.org>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Graham Moore
 <grmoore@opensource.altera.com>, Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring
 <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170327100039.480b8d8d@bbrezillon>
In-Reply-To: <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

On Thu, 23 Mar 2017 09:17:59 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Commit 66507c7bc889 ("mtd: nand: Add support to use nand_base poi
> databuf as bounce buffer") fixed the issue that drivers can be
> passed with a kmap()'d buffer.  This addressed the use_bufpoi = 0
> case.
> 
> When use_bufpoi = 1, chip->buffers->databuf is used.  The databuf
> allocated by nand_scan_tail() is not suitable for DMA due to the
> offset, sizeof(*chip->buffers).

As said earlier, I'm fine with the patch content, but I'm not sure
about your explanation. Alignment requirements are DMA controller
dependent so you're not exactly fixing a bug for all NAND controller
drivers, just those that require >4 bytes alignment.

Regarding the cache line alignment issue, in this case it shouldn't be
a problem, because the driver and the core shouldn't touch the
chip->buffers object during a DMA transfer, so dma_map/unmap_single()
should work fine (they may flush/invalidate one cache line entry that
contains non-payload data, but that's not a problem as long as nothing
is modified during the DMA transfer).

> 
> So, drivers using DMA are very likely to end up with setting the
> NAND_OWN_BUFFERS flag and allocate buffers by themselves.  Drivers
> tend to use devm_k*alloc to simplify the probe failure path, but
> devm_k*alloc() does not return a cache line aligned buffer.

Oh, I didn't know that. I had a closer look at the code, and indeed,
devm_kmalloc() does not guarantee any alignment.

> 
> If used, it could violate the DMA-API requirement stated in
> Documentation/DMA-API.txt:
>   Warnings:  Memory coherency operates at a granularity called the
>   cache line width.  In order for memory mapped by this API to
>   operate correctly, the mapped region must begin exactly on a cache
>   line boundary and end exactly on one (to prevent two separately
>   mapped regions from sharing a single cache line).
> 
> To sum up, NAND_OWN_BUFFERS is not very convenient for drivers.
> nand_scan_tail() can give a separate buffer for each of ecccalc,
> ecccode, databuf.  It is guaranteed kmalloc'ed memory is aligned
> with ARCH_DMA_MINALIGN.

Maybe I'm wrong, but AFAIU, kmalloc&co do not guarantee cache line
alignment for small buffers (< cache line), so even kmalloc can return
a buffer that is not cache line aligned.
This being said, we should be good because most NAND controllers are
only manipulating the page buffer (->databuf) which is large enough to
be cache line aligned.

Anyway, I'm not discussing the need for this patch, just the reasons we
need it ;-).

To me, it's more that we want to support as many cases as possible, no
matter the DMA controller requirements, and allocating each buffer
independently allows us to do that for almost no overhead.

How about simplifying the commit message to only focus on what this
patch is really fixing/improving?

"
Some NAND controllers are using DMA engine requiring a specific buffer
alignment. The core provides no guarantee on the nand_buffers pointers,
which forces some drivers to allocate their own buffers and pass the
NAND_OWN_BUFFERS flag.

Rework the nand_buffers allocation logic to allocate each buffer
independently. This should make most NAND controllers/DMA engine
happy, and allow us to get rid of these custom buf allocation in NAND
controller drivers.
"

> This is enough for most drivers because
> it is rare that DMA engines require larger alignment than CPU's
> cache line.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/nand_base.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e13f959..6fc0422 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4614,13 +4614,25 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	}
>  
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
> -		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
> -				+ mtd->oobsize * 3, GFP_KERNEL);
> +		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
>  		if (!nbuf)
>  			return -ENOMEM;
> -		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
> -		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
> -		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
> +		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
> +		if (!nbuf->ecccalc) {
> +			ret = -EINVAL;
> +			goto err_free;
> +		}
> +		nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
> +		if (!nbuf->ecccode) {
> +			ret = -EINVAL;
> +			goto err_free;
> +		}
> +		nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
> +					GFP_KERNEL);
> +		if (!nbuf->databuf) {
> +			ret = -EINVAL;
> +			goto err_free;
> +		}
>  
>  		chip->buffers = nbuf;
>  	} else {
> @@ -4863,8 +4875,12 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* Build bad block table */
>  	return chip->scan_bbt(mtd);
>  err_free:
> -	if (!(chip->options & NAND_OWN_BUFFERS))
> +	if (!(chip->options & NAND_OWN_BUFFERS)) {
> +		kfree(chip->buffers->databuf);
> +		kfree(chip->buffers->ecccode);
> +		kfree(chip->buffers->ecccalc);
>  		kfree(chip->buffers);
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_tail);
> @@ -4915,8 +4931,12 @@ void nand_cleanup(struct nand_chip *chip)
>  
>  	/* Free bad block table memory */
>  	kfree(chip->bbt);
> -	if (!(chip->options & NAND_OWN_BUFFERS))
> +	if (!(chip->options & NAND_OWN_BUFFERS)) {
> +		kfree(chip->buffers->databuf);
> +		kfree(chip->buffers->ecccode);
> +		kfree(chip->buffers->ecccalc);
>  		kfree(chip->buffers);
> +	}
>  
>  	/* Free bad block descriptor memory */
>  	if (chip->badblock_pattern && chip->badblock_pattern->options
