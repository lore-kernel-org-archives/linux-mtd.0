Date: Mon, 30 Jan 2017 13:36:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wei Yongjun
 <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: nand: mediatek: remove redundant dev_err
 call in mtk_nfc_probe()
Message-ID: <20170130133647.1c383bd8@bbrezillon>
In-Reply-To: <20170117142246.9607-1-weiyj.lk@gmail.com>
References: <20170117142246.9607-1-weiyj.lk@gmail.com>
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

On Tue, 17 Jan 2017 14:22:46 +0000
Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/nand/mtk_nand.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> index 6c3eed3..6c517c6 100644
> --- a/drivers/mtd/nand/mtk_nand.c
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -1383,7 +1383,6 @@ static int mtk_nfc_probe(struct platform_device *pdev)
>  	nfc->regs = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(nfc->regs)) {
>  		ret = PTR_ERR(nfc->regs);
> -		dev_err(dev, "no nfi base\n");
>  		goto release_ecc;
>  	}
>  
> 
> 
> 
