Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ectdv-00043N-OG
 for linux-mtd@lists.infradead.org; Sat, 20 Jan 2018 13:57:13 +0000
Date: Sat, 20 Jan 2018 14:56:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: marvell: Fix missing memory allocation modifier
Message-ID: <20180120145659.7761e4ef@bbrezillon>
In-Reply-To: <20180119173901.30430-1-miquel.raynal@free-electrons.com>
References: <20180119173901.30430-1-miquel.raynal@free-electrons.com>
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

On Fri, 19 Jan 2018 18:39:01 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> The function marvell_nfc_init_dma() allocates a DMA buffer without the
> GFP_KERNEL modifier, that triggers this warning:
> "marvell_nfc_init_dma() error: no modifiers for allocation."
> 
> Fix this by using (GFP_KERNEL | GFP_DMA) instead of only GFP_DMA as the
> probe happens in non-interrupt context.

Applied.

Thanks,

Boris

> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
> index 48d78ca0d71c..5f49c4e0e9e1 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -2670,7 +2670,7 @@ static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
>  	 * for DMA transfers and then copy the desired amount of data to
>  	 * the provided buffer.
>  	 */
> -	nfc->dma_buf = kmalloc(MAX_CHUNK_SIZE, GFP_DMA);
> +	nfc->dma_buf = kmalloc(MAX_CHUNK_SIZE, GFP_KERNEL | GFP_DMA);
>  	if (!nfc->dma_buf)
>  		return -ENOMEM;
>  
