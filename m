Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAzzt-0007us-11
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 14:00:02 +0000
Date: Sun, 27 Nov 2016 14:58:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 01/39] mtd: nand: allow to set only one of ECC size and
 ECC strength from DT
Message-ID: <20161127145828.231844b1@bbrezillon>
In-Reply-To: <1480183585-592-2-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-2-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:05:47 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Currently, it is valid to specify both "nand-ecc-step-size" and
> "nand-ecc-strength", but not allowed to set only one of them.
> 
> This requirement has a conflict with "nand-ecc-maximize"; this flag
> is used when you want the driver to choose the best ECC strength.
> If "nand-ecc-maximize" is set, "nand-ecc-strength" is very likely to
> be unset.

Well, when I added nand-ecc-maximize I was assuming that the driver
would choose both step-size and strength to maximize the ECC strength
on the whole page, but you're right, we might need fine-grained
tweaking (forcing the step-size but letting the driver choose the ECC
strength).

> 
> It would be possible to make the if-conditional more complex by
> adding the check for the NAND_ECC_MAXIMIZE flag, but I chose to drop
> the check entirely.  I thought of the situation where the hardware
> has a fixed ECC step size (so it can be hard-coded in the driver),
> whereas the ECC strength is configurable by software.  In that case,
> we may want to only set "nand-ecc-strength" (or "nand-ecc-maximize")
> in DT.

I would also add that checking things at this level is not really
relevant. The driver is likely to check the ecc.size and ecc.strength
values anyway, and pick a default value (chip->nand_ecc_xx_ds or some
hard-coded values if the ECC engine only support one specific case) if
one of them is unassigned (left to 0).

I'll let some time for others to review before queuing this patch for
4.11.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> The Denali NAND is the case.
> 
> The ecc.size is fixed when the RTL is delivered, while the
> driver can choose ecc.strength from some supported values.
> 
>  For Intel and Altera, available ecc.strength are 8, 15.
>  For Socionext UniPhier, available ecc.strength are 8, 16, 24.
> 
> 
>  drivers/mtd/nand/nand_base.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8c74d8c..c1ed91d 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4266,12 +4266,6 @@ static int nand_dt_init(struct nand_chip *chip)
>  	ecc_strength = of_get_nand_ecc_strength(dn);
>  	ecc_step = of_get_nand_ecc_step_size(dn);
>  
> -	if ((ecc_step >= 0 && !(ecc_strength >= 0)) ||
> -	    (!(ecc_step >= 0) && ecc_strength >= 0)) {
> -		pr_err("must set both strength and step size in DT\n");
> -		return -EINVAL;
> -	}
> -
>  	if (ecc_mode >= 0)
>  		chip->ecc.mode = ecc_mode;
>  
