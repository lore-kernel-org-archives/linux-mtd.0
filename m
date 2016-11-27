Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB1QV-0000eM-JG
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 15:31:36 +0000
Date: Sun, 27 Nov 2016 16:31:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 13/39] mtd: nand: denali: increment ecc_stats->corrected
Message-ID: <20161127163114.24e9b8ad@bbrezillon>
In-Reply-To: <1480183585-592-14-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-14-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:05:59 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Update the number of corrected bit flips when read_page() succeeds.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index a6445d9..4cc8945 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1162,6 +1162,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			mtd->ecc_stats.failed++;
>  		return 0;
>  	}
> +
> +	mtd->ecc_stats.corrected += max_bitflips;

First of all, ecc_stats.corrected should contain the total number of
bitflips detected on the MTD device, here you're just adding the
maximum number of bitflips per ECC chunk for the current page, which is
slightly different.

Then, ecc_stats.corrected seems to be properly updated in handle_ecc()
[1], so I see no reason to do it here.

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/denali.c#L1003

> +
>  	return max_bitflips;
>  }
>  
