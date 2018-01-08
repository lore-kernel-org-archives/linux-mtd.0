Subject: Re: [PATCH] mtd/nand/atmel: Delete an error message for a failed
 memory allocation in two functions
To: SF Markus Elfring <elfring@users.sourceforge.net>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Josh Wu <rainyfeeling@outlook.com>,
 Marek Vasut <marek.vasut@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Richard Weinberger <richard@nod.at>, Wenyou
 Yang <wenyou.yang@atmel.com>
CC: LKML <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <81cadb76-8c67-9289-1375-2d4a55a4adfa@users.sourceforge.net>
From: "Yang, Wenyou" <Wenyou.Yang@Microchip.com>
Message-ID: <09e98604-00ec-64be-665a-a101b31028b1@Microchip.com>
Date: Mon, 8 Jan 2018 08:58:21 +0800
MIME-Version: 1.0
In-Reply-To: <81cadb76-8c67-9289-1375-2d4a55a4adfa@users.sourceforge.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2018/1/6 4:55, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jan 2018 21:45:04 +0100
>
> Omit an extra message for a memory allocation failure in these functions.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Acked-by: Wenyou Yang <wenyou.yang@microchip.com>
>   drivers/mtd/nand/atmel/nand-controller.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 90a71a56bc23..a41b999229c9 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -1612,10 +1612,8 @@ static int atmel_nand_register(struct atmel_nand *nand)
>   		mtd->name = devm_kasprintf(nc->dev, GFP_KERNEL,
>   					   "%s:nand.%d", dev_name(nc->dev),
>   					   nand->cs[0].id);
> -		if (!mtd->name) {
> -			dev_err(nc->dev, "Failed to allocate mtd->name\n");
> +		if (!mtd->name)
>   			return -ENOMEM;
> -		}
>   	}
>   
>   	ret = nand_scan_tail(mtd);
> @@ -1654,10 +1652,8 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
>   	nand = devm_kzalloc(nc->dev,
>   			    sizeof(*nand) + (numcs * sizeof(*nand->cs)),
>   			    GFP_KERNEL);
> -	if (!nand) {
> -		dev_err(nc->dev, "Failed to allocate NAND object\n");
> +	if (!nand)
>   		return ERR_PTR(-ENOMEM);
> -	}
>   
>   	nand->numcs = numcs;
>   

Best Regards,
Wenyou Yang
