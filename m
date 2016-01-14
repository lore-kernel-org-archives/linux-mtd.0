Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJkWQ-0003Cd-4v
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 16:13:15 +0000
Date: Thu, 14 Jan 2016 16:56:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Peter Pan <peterpansjtu@gmail.com>
Subject: Re: [PATCH 2/3] mtd: onenand: make onenand_scan_bbt() static
Message-ID: <20160114165604.2efa7c85@bbrezillon>
In-Reply-To: <1452782691-5193-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1452782691-5193-2-git-send-email-thomas.petazzoni@free-electrons.com>
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

+Peter

On Thu, 14 Jan 2016 15:44:50 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Like was done in commit 17799359e7b3fa6ef4f2bf926cd6821cf7903ecf
> ("mtd: nand_bbt: make nand_scan_bbt() static") for the NAND code, this
> commit makes the onenand_scan_bbt() function static in the OneNAND
> code, since it is only used in onenand_bbt.c itself.
> 
> Consequently, the EXPORT_SYMBOL() and declaration in bbm.h are also
> removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Not sure how this will impact the BBT rework done by Peter, but those
are trivial changes, so I guess it should be pretty easy to fix the
conflicts in case Brian decides to take them before the BBT rework
changes.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/onenand/onenand_bbt.c | 3 +--
>  include/linux/mtd/bbm.h           | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
> index 08d0085..5f8d470 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -179,7 +179,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
>   * by the onenand_release function.
>   *
>   */
> -int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
> +static int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>  {
>  	struct onenand_chip *this = mtd->priv;
>  	struct bbm_info *bbm = this->bbm;
> @@ -248,5 +248,4 @@ int onenand_default_bbt(struct mtd_info *mtd)
>  	return onenand_scan_bbt(mtd, bbm->badblock_pattern);
>  }
>  
> -EXPORT_SYMBOL(onenand_scan_bbt);
>  EXPORT_SYMBOL(onenand_default_bbt);
> diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
> index 36bb6a5..3bf8f95 100644
> --- a/include/linux/mtd/bbm.h
> +++ b/include/linux/mtd/bbm.h
> @@ -166,7 +166,6 @@ struct bbm_info {
>  };
>  
>  /* OneNAND BBT interface */
> -extern int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
>  extern int onenand_default_bbt(struct mtd_info *mtd);
>  
>  #endif	/* __LINUX_MTD_BBM_H */



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
