Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHacg-0005Pv-Nn
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 17:14:47 +0000
Date: Fri, 8 Jan 2016 18:14:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, Alex Smith <alex@alex-smith.me.uk>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: jz4780: Update ecc correction error codes
Message-ID: <20160108181422.4b94ffbd@bbrezillon>
In-Reply-To: <1452271517-18993-1-git-send-email-harvey.hunt@imgtec.com>
References: <1452271517-18993-1-git-send-email-harvey.hunt@imgtec.com>
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

On Fri, 8 Jan 2016 16:45:17 +0000
Harvey Hunt <harvey.hunt@imgtec.com> wrote:

> Update jz4780_bch_ecc_correct's return codes with appropriate values,
> as specified in /include/linux/mtd/nand.h.

Oh, nice catch.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> 
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Cc: Alex Smith <alex@alex-smith.me.uk>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mtd/nand/jz4780_bch.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
> index 5954fbf..755499c 100644
> --- a/drivers/mtd/nand/jz4780_bch.c
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -210,8 +210,8 @@ EXPORT_SYMBOL(jz4780_bch_calculate);
>   * Given the raw data and the ECC read from the NAND device, detects and
>   * corrects errors in the data.
>   *
> - * Return: the number of bit errors corrected, or -1 if there are too many
> - * errors to correct or we timed out waiting for the controller.
> + * Return: the number of bit errors corrected, -EBADMSG if there are too many
> + * errors to correct or -ETIMEDOUT if we timed out waiting for the controller.
>   */
>  int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
>  		       u8 *buf, u8 *ecc_code)
> @@ -227,13 +227,13 @@ int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
>  
>  	if (!jz4780_bch_wait_complete(bch, BCH_BHINT_DECF, &reg)) {
>  		dev_err(bch->dev, "timed out while correcting data\n");
> -		ret = -1;
> +		ret = -ETIMEDOUT;
>  		goto out;
>  	}
>  
>  	if (reg & BCH_BHINT_UNCOR) {
>  		dev_warn(bch->dev, "uncorrectable ECC error\n");
> -		ret = -1;
> +		ret = -EBADMSG;
>  		goto out;
>  	}
>  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
