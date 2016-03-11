Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeJfi-0004C9-Gr
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2016 09:47:51 +0000
Date: Fri, 11 Mar 2016 10:47:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] mtd: nand: remove kerneldoc for removed function parameter
Message-ID: <20160311104728.77725c12@bbrezillon>
In-Reply-To: <1457642843-16935-1-git-send-email-computersforpeace@gmail.com>
References: <1457642843-16935-1-git-send-email-computersforpeace@gmail.com>
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

On Thu, 10 Mar 2016 12:47:23 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> The 'getchip' parameter is gone as of commit 9f3e04297b08 ("mtd: nand:
> don't select chip in nand_chip's block_bad op"), so kill the doc with
> it.
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/nand/nand_base.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d49b01df3513..b6facac54fc0 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -313,7 +313,6 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
>   * nand_block_bad - [DEFAULT] Read bad block marker from the chip
>   * @mtd: MTD device structure
>   * @ofs: offset from device start
> - * @getchip: 0, if the chip is already selected
>   *
>   * Check, if the block is bad.
>   */



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
