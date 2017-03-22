Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqcy9-0002aF-Nr
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 09:54:19 +0000
Subject: Re: [patch] mtd: nand: hynix: Fix an error code in init
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170322090145.GA14520@mwanda>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <98f96f37-43cb-23b1-2a8d-4073af1443dd@nod.at>
Date: Wed, 22 Mar 2017 10:53:52 +0100
MIME-Version: 1.0
In-Reply-To: <20170322090145.GA14520@mwanda>
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

Am 22.03.2017 um 10:01 schrieb Dan Carpenter:
> We should be return -ENOMEM instead of success.
> 
> Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
> index 2a5d0efea498..b12dc7325378 100644
> --- a/drivers/mtd/nand/nand_hynix.c
> +++ b/drivers/mtd/nand/nand_hynix.c
> @@ -270,8 +270,10 @@ static int hynix_mlc_1xnm_rr_init(struct nand_chip *chip,
>  		goto out;
>  
>  	rr = kzalloc(sizeof(*rr) + (nregs * nmodes), GFP_KERNEL);
> -	if (!rr)
> +	if (!rr) {
> +		ret = -ENOMEM;
>  		goto out;
> +	}
>  
>  	for (i = 0; i < nmodes; i++) {
>  		for (j = 0; j < nregs; j++) {
> 

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
