Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFPbO-0000lc-Su
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 18:41:16 +0000
Date: Mon, 29 May 2017 20:40:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: check ecc->total sanity in nand_scan_tail
Message-ID: <20170529204049.25cb8c30@bbrezillon>
In-Reply-To: <1495687820-30692-1-git-send-email-yamada.masahiro@socionext.com>
References: <1495687820-30692-1-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 25 May 2017 13:50:20 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Drivers are supposed to set correct ecc->{size,strength,bytes} before
> calling nand_scan_tail(), but it does not complain about ecc->total
> bigger than oobsize.
> 
> In this case, chip->scan_bbt() crashes due to memory corruption, but
> it is hard to debug.  It would be kind to fail it earlier with a clear
> message.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to nand/next.

Thanks,

Boris

> ---
> 
> I was actually hit by this case.
> 
> I wasted half a day until I figured out my coding mistake in my
> Denali driver.  It will be helpful to check this in NAND core.
> 
> 
>  drivers/mtd/nand/nand_base.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index f4d686192717..14d6a5aa3ee8 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4970,6 +4970,11 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		goto err_free;
>  	}
>  	ecc->total = ecc->steps * ecc->bytes;
> +	if (ecc->total > mtd->oobsize) {
> +		WARN(1, "Total number of ECC bytes exceeded oobsize\n");
> +		ret = -EINVAL;
> +		goto err_free;
> +	}
>  
>  	/*
>  	 * The number of bytes available for a client to place data into
