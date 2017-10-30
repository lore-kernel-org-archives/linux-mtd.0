Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e95Ly-0002uR-Lc
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 08:23:28 +0000
Date: Mon, 30 Oct 2017 09:23:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: motobud@gmail.com
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix writing mtdoops to nand flash.
Message-ID: <20171030092303.42383c59@bbrezillon>
In-Reply-To: <20171030042343.24551-1-motobud@gmail.com>
References: <20171030042343.24551-1-motobud@gmail.com>
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

Hi Brent,

Subject should be prefixed by "mtd: nand: ", so

"mtd: nand: Fix writing mtdoops to nand flash"

On Sun, 29 Oct 2017 23:23:43 -0500
motobud@gmail.com wrote:

> From: Brent Taylor <motobud@gmail.com>
> 
> When mtdoops calls mtd_panic_write, it eventually calls
> panic_nand_write in nand_base.c.  In order to properly
> wait for the nand chip to be ready in panic_nand_wait,
> the chip must first be selected.
> 
> When using the atmel nand flash controller, a panic
> would occur due to a NULL pointer exception.
> 
> Signed-off-by: Brent Taylor <motobud@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 12edaae17d81..0a8058a66d93 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2802,9 +2802,14 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	struct mtd_oob_ops ops;
>  	int ret;
>  
> +	int chipnr = (int)(to >> chip->chip_shift);
> +	chip->select_chip(mtd, chipnr);
> +
>  	/* Wait for the device to get ready */
>  	panic_nand_wait(mtd, chip, 400);
>  
> +	chip->select_chip(mtd, -1);
> +

Duh! Looks like a piece of code that is never tested. Did you face the
problem or did you find out by inspecting the code?

Anyway, I fear the atmel driver is not the only one to rely on the chip
to be selected when ->dev_ready() is called so this should definitely
be fixed. Also, we should probably move the ->select_chip() and
panic_nand_wait() calls after panic_nand_get_device(), and I don't
think we need to unselect the chip (it will be taken care of by
nand_do_write_ops()).

>  	/* Grab the device */
>  	panic_nand_get_device(chip, mtd, FL_WRITING);
>  
