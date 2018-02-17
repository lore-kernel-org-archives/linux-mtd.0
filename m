Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emy1Q-00086v-9i
 for linux-mtd@lists.infradead.org; Sat, 17 Feb 2018 08:39:06 +0000
Date: Sat, 17 Feb 2018 09:38:52 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Miquel Raynal
 <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH] mtd: Make sure the device supports erase operations in
 mtd_erase()
Message-ID: <20180217093852.4112e2ba@bbrezillon>
In-Reply-To: <20180122093801.19618-1-boris.brezillon@free-electrons.com>
References: <20180122093801.19618-1-boris.brezillon@free-electrons.com>
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

On Mon, 22 Jan 2018 10:38:01 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Some devices do not implement ->_erase() or have an invalid ->erasesize
> value. In this case, mtd_erase() should return -ENOTSUPP.
> 
> Note that the test is not done on the MTD_NO_ERASE flag because this
> flag means 'erasing a block before writing to it is unnecessary',
> not 'the erase operation is not supported'. Actually, some drivers are
> setting the MTD_NO_ERASE flag but still implementing the ->_erase()
> hook and setting a valid ->erasesize value.

Applied.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/mtdcore.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index d7ab091b36b2..f24144cbc99c 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -971,10 +971,14 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
>   */
>  int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
>  {
> +	if (!mtd->erasesize || !mtd->_erase)
> +		return -ENOTSUPP;
> +
>  	if (instr->addr >= mtd->size || instr->len > mtd->size - instr->addr)
>  		return -EINVAL;
>  	if (!(mtd->flags & MTD_WRITEABLE))
>  		return -EROFS;
> +
>  	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
>  	if (!instr->len) {
>  		instr->state = MTD_ERASE_DONE;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
