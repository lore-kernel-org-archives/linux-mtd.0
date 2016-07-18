Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP4Tv-0003xx-34
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 09:04:55 +0000
Date: Mon, 18 Jul 2016 11:04:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <richard@nod.at>, <oss@buserror.net>, <stable@vger.kernel.org>, Brian
 Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix bug writing 1 byte less than page size
Message-ID: <20160718110432.003b52ea@bbrezillon>
In-Reply-To: <1468831158-6172-1-git-send-email-hector.palacios@digi.com>
References: <1468831158-6172-1-git-send-email-hector.palacios@digi.com>
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

On Mon, 18 Jul 2016 10:39:18 +0200
Hector Palacios <hector.palacios@digi.com> wrote:

> nand_do_write_ops() determines if it is writing a partial page with the
> formula:
> 	part_pagewr = (column || writelen < (mtd->writesize - 1))
> 
> When 'writelen' is exactly 1 byte less than the NAND page size the formula
> equates to zero, so the code doesn't process it as a partial write,
> although it should.
> As a consequence the function remains in the while(1) loop with 'writelen'
> becoming 0xffffffff and iterating endlessly.
> 
> The bug may not be easy to reproduce in Linux since user space tools
> usually force the padding or round-up the write size to a page-size
> multiple.
> This was discovered in U-Boot where the issue can be reproduced by
> writing any size that is 1 byte less than a page-size multiple.
> For example, on a NAND with 2K page (0x800):
> 	=> nand erase.part <partition>
> 	=> nand write $loadaddr <partition> 7ff  
> 
> Signed-off-by: Hector Palacios <hector.palacios@digi.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, can you take this patch in your tree.

As usual, I'm unsure whether we should Cc stable or not, but we
should at least add

Fixes: 66507c7bc8895 ("mtd: nand: Add support to use nand_base poi databuf as bounce buffer")

> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0b0dc29d2af7..77533f7f2429 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2610,7 +2610,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
>  		int cached = writelen > bytes && page != blockmask;
>  		uint8_t *wbuf = buf;
>  		int use_bufpoi;
> -		int part_pagewr = (column || writelen < (mtd->writesize - 1));
> +		int part_pagewr = (column || writelen < mtd->writesize);
>  
>  		if (part_pagewr)
>  			use_bufpoi = 1;
