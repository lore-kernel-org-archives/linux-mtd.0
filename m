Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH3f3-0004Ro-3X
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 07:07:34 +0000
Date: Wed, 14 Dec 2016 08:06:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: fix typos in ooblayout comment blocks
Message-ID: <20161214080657.60e658cf@bbrezillon>
In-Reply-To: <1481675461-19364-1-git-send-email-yamada.masahiro@socionext.com>
References: <1481675461-19364-1-git-send-email-yamada.masahiro@socionext.com>
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

On Wed, 14 Dec 2016 09:31:01 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

>  - "This functions return ..." -> "This function returns ..."
>  - "I you want ..." -> "If you want ..."
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> 
>  drivers/mtd/mtdcore.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index ca661ce..d64e61b 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1129,7 +1129,7 @@ EXPORT_SYMBOL_GPL(mtd_write_oob);
>   * @oobecc: OOB region struct filled with the appropriate ECC position
>   *	    information
>   *
> - * This functions return ECC section information in the OOB area. I you want
> + * This function returns ECC section information in the OOB area. If you want
>   * to get all the ECC bytes information, then you should call
>   * mtd_ooblayout_ecc(mtd, section++, oobecc) until it returns -ERANGE.
>   *
> @@ -1161,7 +1161,7 @@ EXPORT_SYMBOL_GPL(mtd_ooblayout_ecc);
>   * @oobfree: OOB region struct filled with the appropriate free position
>   *	     information
>   *
> - * This functions return free bytes position in the OOB area. I you want
> + * This function returns free bytes position in the OOB area. If you want
>   * to get all the free bytes information, then you should call
>   * mtd_ooblayout_free(mtd, section++, oobfree) until it returns -ERANGE.
>   *
> @@ -1191,7 +1191,7 @@ EXPORT_SYMBOL_GPL(mtd_ooblayout_free);
>   * @iter: iterator function. Should be either mtd_ooblayout_free or
>   *	  mtd_ooblayout_ecc depending on the region type you're searching for
>   *
> - * This functions returns the section id and oobregion information of a
> + * This function returns the section id and oobregion information of a
>   * specific byte. For example, say you want to know where the 4th ECC byte is
>   * stored, you'll use:
>   *
