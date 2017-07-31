Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dcDXn-0007DS-5j
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 16:27:49 +0000
Date: Mon, 31 Jul 2017 18:27:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: Fix a docs build warning
Message-ID: <20170731182720.209d7842@bbrezillon>
In-Reply-To: <20170730161803.1593200e@lwn.net>
References: <20170730161803.1593200e@lwn.net>
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

On Sun, 30 Jul 2017 16:18:03 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Commit 0b4773fd1649 (mtd: nand: Drop unused cached programming support)
> removed the "cached" parameter from nand_write_page(), but did not update
> the kerneldoc comments, creating this docs build warning:
> 
>   ./drivers/mtd/nand/nand_base.c:2751: warning: Excess function parameter 'cached' description in 'nand_write_page'
> 
> Remove the offending line so we can have a little peace and quiet.

Applied to nand/fixes.

Thanks,

Boris

> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  drivers/mtd/nand/nand_base.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 5fa5ddc94834..ba57d8970f27 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2741,7 +2741,6 @@ static int nand_write_page_syndrome(struct mtd_info *mtd,
>   * @buf: the data to write
>   * @oob_required: must write chip->oob_poi to OOB
>   * @page: page number to write
> - * @cached: cached programming
>   * @raw: use _raw version of write_page
>   */
>  static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
