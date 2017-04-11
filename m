Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxu8h-0007yC-KC
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 11:39:17 +0000
Date: Tue, 11 Apr 2017 13:38:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sekhar Nori <nsekhar@ti.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: davinci: add comment on NAND subpage write
 status on keystone
Message-ID: <20170411133854.0d3e870c@bbrezillon>
In-Reply-To: <079de6bbc3285ab09e4ac25e78b947286080cee5.1490884624.git.nsekhar@ti.com>
References: <079de6bbc3285ab09e4ac25e78b947286080cee5.1490884624.git.nsekhar@ti.com>
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

On Thu, 30 Mar 2017 20:09:30 +0530
Sekhar Nori <nsekhar@ti.com> wrote:

> Add a comment clarifying that NAND subpage write on keystone works,
> but is not being enabled in the interest of backward compatibility.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  drivers/mtd/nand/davinci_nand.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 27fa8b87cd5f..531c51991e57 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -581,6 +581,17 @@ static struct davinci_nand_pdata
>  			"ti,davinci-nand-use-bbt"))
>  			pdata->bbt_options = NAND_BBT_USE_FLASH;
>  
> +		/*
> +		 * Since kernel v4.8, this driver has been fixed to enable
> +		 * use of 4-bit hardware ECC with subpages and verified on
> +		 * TI's keystone EVMs (K2L, K2HK and K2E).
> +		 * However, in the interest of not breaking systems using
> +		 * existing UBI partitions, sub-page writes are not being
> +		 * (re)enabled. If you want to use subpage writes on Keystone
> +		 * platforms (i.e. do not have any existing UBI partitions),
> +		 * then use "ti,davinci-nand" as the compatible in your
> +		 * device-tree file.
> +		 */
>  		if (of_device_is_compatible(pdev->dev.of_node,
>  					    "ti,keystone-nand")) {
>  			pdata->options |= NAND_NO_SUBPAGE_WRITE;
