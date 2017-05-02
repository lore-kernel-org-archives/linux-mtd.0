Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5aWn-0000Al-G9
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 16:19:55 +0000
Date: Tue, 2 May 2017 18:19:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-oxnas@lists.tuxfamily.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: oxnas_nand: Allocating more than necessary in probe()
Message-ID: <20170502181931.66ea6628@bbrezillon>
In-Reply-To: <20170425091949.uindhaxmbtsksqc7@mwanda>
References: <20170425091949.uindhaxmbtsksqc7@mwanda>
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

On Tue, 25 Apr 2017 12:19:49 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We only need to allocate sizeof(struct oxnas_nand_ctrl) which is 192
> bytes and not sizeof(struct nand_chip) which is a much larger 3056
> bytes.
> 
> Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
> index 3e3bf3b364d2..1b207aac840c 100644
> --- a/drivers/mtd/nand/oxnas_nand.c
> +++ b/drivers/mtd/nand/oxnas_nand.c
> @@ -91,7 +91,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	int err = 0;
>  
>  	/* Allocate memory for the device structure (and zero it) */
> -	oxnas = devm_kzalloc(&pdev->dev, sizeof(struct nand_chip),
> +	oxnas = devm_kzalloc(&pdev->dev, sizeof(*oxnas),
>  			     GFP_KERNEL);
>  	if (!oxnas)
>  		return -ENOMEM;
