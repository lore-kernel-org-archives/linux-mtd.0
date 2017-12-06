Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVpM-0000KB-Tf
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 09:17:18 +0000
Date: Wed, 6 Dec 2017 10:16:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Albert Hsieh <wen.hsieh@broadcom.com>, richard@nod.at
Cc: computersforpeace@gmail.com, hsiehwt@gmail.com, kdasu.kdev@gmail.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 bcm-kernel-feedback-list@broadcom.com, dwmw2@infradead.org
Subject: Re: [PATCH 1/1] mtd: nand: brcmnand: Zero bitflip is not an error
Message-ID: <20171206101645.0576dff9@bbrezillon>
In-Reply-To: <1511148386-14573-1-git-send-email-wen.hsieh@broadcom.com>
References: <1511148386-14573-1-git-send-email-wen.hsieh@broadcom.com>
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

On Mon, 20 Nov 2017 11:26:26 +0800
Albert Hsieh <wen.hsieh@broadcom.com> wrote:

> A negative return value of brcmstb_nand_verify_erased_page() indicates a
> real bitflip error of an erased page, and other return values (>= 0) show
> the corrected bitflip number. Zero return value means no bitflip, but the
> current driver code treats it as an error, and eventually leads to
> falsely reported ECC error.
> 
> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflip")
> Signed-off-by: Albert Hsieh <wen.hsieh@broadcom.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: <stable@vger.kernel.org>

Richard, can you queue this patch to the mtd/master branch?

Thanks,

Boris

> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index e0eb51d..dd56a67 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1763,7 +1763,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  			err = brcmstb_nand_verify_erased_page(mtd, chip, buf,
>  							      addr);
>  			/* erased page bitflips corrected */
> -			if (err > 0)
> +			if (err >= 0)
>  				return err;
>  		}
>  
