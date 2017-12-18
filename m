Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQqZR-00014v-Es
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 08:14:47 +0000
Date: Mon, 18 Dec 2017 09:14:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Fix mtd_check_oob_ops()
Message-ID: <20171218091413.2150cc0f@bbrezillon>
In-Reply-To: <20171218072628.17977-1-miquel.raynal@free-electrons.com>
References: <20171218072628.17977-1-miquel.raynal@free-electrons.com>
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

Hi Miquel,

On Mon, 18 Dec 2017 08:26:28 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> The mtd_check_oob_ops() helper verifies if the operation defined by the
> user is correct.
> 
> Fix the check that verifies if the entire requested area exists. This
> check is too restrictive and will fail anytime the last data byte of the
> very last page is included in an operation.
> 
> Fixes: 5cdd929da53d ("mtd: Add sanity checks in mtd_write/read_oob()")
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

and thanks for fixing my mess.

Richard, feel free to queue it for the next -rc.

Boris

> ---
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index f80e911b8843..73b605577447 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1114,7 +1114,7 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
>  	if (!ops->oobbuf)
>  		ops->ooblen = 0;
>  
> -	if (offs < 0 || offs + ops->len >= mtd->size)
> +	if (offs < 0 || offs + ops->len > mtd->size)
>  		return -EINVAL;
>  
>  	if (ops->ooblen) {
