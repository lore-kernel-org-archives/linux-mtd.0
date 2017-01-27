Received: from mail-wj0-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cX5b3-0006l3-DX
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 12:25:43 +0000
Received: by mail-wj0-f196.google.com with SMTP id ip10so5851942wjb.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2017 04:25:21 -0800 (PST)
Subject: Re: [PATCH] Mtd: nand - Fix possible NULL derefrence.
To: Shailendra Verma <shailendra.v@samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.shailesh@samsung.com,
 ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
References: <CGME20170127112921epcas1p45999b22222202e8d98b6aecfc3cbeb39@epcas1p4.samsung.com>
 <1485516553-4438-1-git-send-email-shailendra.v@samsung.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9a682616-d1c3-a096-0736-fa23aca10299@gmail.com>
Date: Fri, 27 Jan 2017 13:24:18 +0100
MIME-Version: 1.0
In-Reply-To: <1485516553-4438-1-git-send-email-shailendra.v@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/27/2017 12:29 PM, Shailendra Verma wrote:
> of_match_device could return NULL, and so can cause a NULL
> pointer dereference later.
> 
> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>

Nice find, but can you split this into two patches ? And the prefix is
'mtd' without capital letter.

Thanks

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
> 


-- 
Best regards,
Marek Vasut
