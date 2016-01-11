Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIc1G-0002bM-2K
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 12:56:23 +0000
Date: Mon, 11 Jan 2016 13:55:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: mpc5121: use 'of_machine_is_compatible' to
 simplify code
Message-ID: <20160111135558.6ebd1165@bbrezillon>
In-Reply-To: <1452408399-5840-1-git-send-email-christophe.jaillet@wanadoo.fr>
References: <1452408399-5840-1-git-send-email-christophe.jaillet@wanadoo.fr>
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

Hi Christophe,

On Sun, 10 Jan 2016 07:46:39 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The current code is the same as 'of_machine_is_compatible'.
> So use it in order to remove a few lines of code and to be more
> consistent with other parts of the kernel.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Your patch looks good from a functional POV, but what is this board
detection hack doing in the NAND driver code in the first place?

Let's say I didn't see that :-).

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/nand/mpc5121_nfc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
> index 6b93e89..5d7843f 100644
> --- a/drivers/mtd/nand/mpc5121_nfc.c
> +++ b/drivers/mtd/nand/mpc5121_nfc.c
> @@ -626,7 +626,7 @@ static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
>  
>  static int mpc5121_nfc_probe(struct platform_device *op)
>  {
> -	struct device_node *rootnode, *dn = op->dev.of_node;
> +	struct device_node *dn = op->dev.of_node;
>  	struct clk *clk;
>  	struct device *dev = &op->dev;
>  	struct mpc5121_nfc_prv *prv;
> @@ -712,18 +712,15 @@ static int mpc5121_nfc_probe(struct platform_device *op)
>  	chip->ecc.mode = NAND_ECC_SOFT;
>  
>  	/* Support external chip-select logic on ADS5121 board */
> -	rootnode = of_find_node_by_path("/");
> -	if (of_device_is_compatible(rootnode, "fsl,mpc5121ads")) {
> +	if (of_machine_is_compatible("fsl,mpc5121ads")) {
>  		retval = ads5121_chipselect_init(mtd);
>  		if (retval) {
>  			dev_err(dev, "Chipselect init error!\n");
> -			of_node_put(rootnode);
>  			return retval;
>  		}
>  
>  		chip->select_chip = ads5121_select_chip;
>  	}
> -	of_node_put(rootnode);
>  
>  	/* Enable NFC clock */
>  	clk = devm_clk_get(dev, "ipg");



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
