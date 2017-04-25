Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2x02-0003Wt-I8
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 09:43:12 +0000
Received: by mail-wr0-x233.google.com with SMTP id l9so3281054wre.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 02:42:48 -0700 (PDT)
Subject: Re: [PATCH] mtd: oxnas_nand: Allocating more than necessary in probe()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170425091949.uindhaxmbtsksqc7@mwanda>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-oxnas@lists.tuxfamily.org, kernel-janitors@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <26f3dff2-274c-0b5f-cbfb-a95a23a2131a@baylibre.com>
Date: Tue, 25 Apr 2017 11:42:44 +0200
MIME-Version: 1.0
In-Reply-To: <20170425091949.uindhaxmbtsksqc7@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/25/2017 11:19 AM, Dan Carpenter wrote:
> We only need to allocate sizeof(struct oxnas_nand_ctrl) which is 192
> bytes and not sizeof(struct nand_chip) which is a much larger 3056
> bytes.
> 
> Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
