Date: Fri, 27 Oct 2017 14:45:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <computersforpeace@gmail.com>, srv_heupstream@mediatek.com,
 linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dwmw2@infradead.org, rogercc.lin@mediatek.com
Subject: Re: [PATCH v1 1/2] mtd: nand: mtk: do not disable ECC IRQ in the
 function mtk_ecc_disable
Message-ID: <20171027144538.4875953f@bbrezillon>
In-Reply-To: <1508746897-62291-2-git-send-email-xiaolei.li@mediatek.com>
References: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
 <1508746897-62291-2-git-send-email-xiaolei.li@mediatek.com>
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

On Mon, 23 Oct 2017 16:21:36 +0800
Xiaolei Li <xiaolei.li@mediatek.com> wrote:

> There will disable ECC IRQ in ECC IRQ handle function, so no need to
> disable it again in the function mtk_ecc_disable.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/mtk_ecc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> index 7f3b065..82aa6f2 100644
> --- a/drivers/mtd/nand/mtk_ecc.c
> +++ b/drivers/mtd/nand/mtk_ecc.c
> @@ -307,7 +307,6 @@ void mtk_ecc_disable(struct mtk_ecc *ecc)
>  
>  	/* disable it */
>  	mtk_ecc_wait_idle(ecc, op);
> -	writew(0, ecc->regs + ECC_IRQ_REG(op));

As explained in my review of patch 2, I would do it the other way
around: remove this write from the irq handler and keep it here.

>  	writew(ECC_OP_DISABLE, ecc->regs + ECC_CTL_REG(op));
>  
>  	mutex_unlock(&ecc->lock);
