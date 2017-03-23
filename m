Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzJq-0000jX-90
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:46:11 +0000
Date: Thu, 23 Mar 2017 10:45:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [patch] mtd: nand: hynix: Fix an error code in init
Message-ID: <20170323104548.30aae3d0@bbrezillon>
In-Reply-To: <20170322090145.GA14520@mwanda>
References: <20170322090145.GA14520@mwanda>
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

On Wed, 22 Mar 2017 12:01:45 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We should be return -ENOMEM instead of success.
> 
> Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,

Boris

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
