Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB1H5-0003ZQ-EL
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 15:21:52 +0000
Date: Sun, 27 Nov 2016 16:21:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 09/39] mtd: nand: denali: fix erased page check code
Message-ID: <20161127162129.67bb8e00@bbrezillon>
In-Reply-To: <1480183585-592-10-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-10-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:05:55 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Currently, is_erased() is called against "buf" twice, so the second
> call is meaningless.  The second one should be checked against
> chip->oob_poi.
> 

IMO, patch 9 to 12 should be squashed in a single patch. All you're
doing in these patch is fixing the check_erased_page logic.

You can describe the different broken thing in the commit message, but
splitting things as you do does not help much.

Also, please have at nand_check_erased_ecc_chunk() [1] instead of using
a private method (is_erased()) to check if the page is erased.
With this method you get bitflips in erased pages correction for free.

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L1212

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index cbc7f75..753e9a02 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1160,7 +1160,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  		if (check_erased_page) {
>  			if (!is_erased(buf, mtd->writesize))
>  				mtd->ecc_stats.failed++;
> -			if (!is_erased(buf, mtd->oobsize))
> +			if (!is_erased(chip->oob_poi, mtd->oobsize))
>  				mtd->ecc_stats.failed++;
>  		}
>  	}
