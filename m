Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIVSk-0003Vg-B5
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 07:33:07 +0000
Date: Wed, 7 Jun 2017 09:32:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: orion: Handle return value of
 clk_prepare_enable
Message-ID: <20170607093233.2f950148@bbrezillon>
In-Reply-To: <8ff46d4fcedc129a76cef82f344ae182309e633d.1496314473.git.arvind.yadav.cs@gmail.com>
References: <8ff46d4fcedc129a76cef82f344ae182309e633d.1496314473.git.arvind.yadav.cs@gmail.com>
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

On Thu,  1 Jun 2017 16:28:15 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> clk_prepare_enable() can fail here and we must check its return value.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/nand/orion_nand.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index f8e463a..209170e 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -166,7 +166,11 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	clk_prepare_enable(info->clk);
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to prepare clock!\n");
> +		return ret;
> +	}
>  
>  	ret = nand_scan(mtd, 1);
>  	if (ret)
