Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFPo3-0005Gt-7X
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 18:54:20 +0000
Date: Mon, 29 May 2017 20:53:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 1/2] mtd: nand: sunxi: Actually use DMA for subpage reads
Message-ID: <20170529205357.7845a473@bbrezillon>
In-Reply-To: <1494887026-20970-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494887026-20970-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 16 May 2017 00:23:45 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> ecc->read_subpage is set to sunxi_nfc_hw_ecc_read_subpage_dma when
> ->dmac != NULL, but is then unconditionally overwritten in the common  
> init path.
> 
> Remove this extra assignment to allow usage of the DMA operation when
> possible.
> 

Applied both to nand/next.

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/sunxi_nand.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index 118a26fff368..a4e43026c35d 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -1922,7 +1922,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
>  	ecc->write_subpage = sunxi_nfc_hw_ecc_write_subpage;
>  	ecc->read_oob_raw = nand_read_oob_std;
>  	ecc->write_oob_raw = nand_write_oob_std;
> -	ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
>  
>  	return 0;
>  }
