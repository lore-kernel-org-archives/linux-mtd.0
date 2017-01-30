Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cY6pN-0003kW-3W
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 07:56:43 +0000
Date: Mon, 30 Jan 2017 08:56:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Shailendra Verma <shailendra.v@samsung.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Stefan Agner <stefan@agner.ch>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.shailesh@samsung.com,
 ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
Subject: Re: [PATCH] Mtd: nand - Fix possible NULL derefrence.
Message-ID: <20170130085617.6a48ddfb@bbrezillon>
In-Reply-To: <1485752357-29817-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170130045947epcas4p48c244819af3cad2c5f1f8120192611d2@epcas4p4.samsung.com>
 <1485752357-29817-1-git-send-email-shailendra.v@samsung.com>
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

Hi Shailendra,

Marek and I already reviewed this patch, and you're resending it
without any of the comments addressed. Is this a mistake?

On Mon, 30 Jan 2017 10:29:17 +0530
Shailendra Verma <shailendra.v@samsung.com> wrote:

> of_match_device could return NULL, and so can cause a NULL
> pointer dereference later.
> 
> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
> ---
>  drivers/mtd/nand/mxc_nand.c  |    4 ++++
>  drivers/mtd/nand/vf610_nfc.c |    4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index d7f724b..ca1b8ad 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1596,6 +1596,10 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>  	if (!np)
>  		return 1;
>  
> +	if (!of_id) {
> +		dev_err(host->dev, "Error: No device match found\n");
> +		return -ENODEV;
> +	}
>  	host->devtype_data = of_id->data;
>  
>  	return 0;
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 3ad514c..0e09c11 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -674,6 +674,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  	}
>  
>  	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
> +	if (!of_id) {
> +		dev_err(&pdev->dev, "Error: No device match found\n");
> +		return -ENODEV;
> +	}
>  	nfc->variant = (enum vf610_nfc_variant)of_id->data;
>  
>  	for_each_available_child_of_node(nfc->dev->of_node, child) {
