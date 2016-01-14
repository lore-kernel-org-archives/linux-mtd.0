Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJkWe-0003GL-Ou
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 16:13:29 +0000
Date: Thu, 14 Jan 2016 16:56:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Peter Pan <peterpansjtu@gmail.com>
Subject: Re: [PATCH 3/3] mtd: onenand: unexport onenand_default_bbt()
Message-ID: <20160114165639.1b7dc462@bbrezillon>
In-Reply-To: <1452782691-5193-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1452782691-5193-3-git-send-email-thomas.petazzoni@free-electrons.com>
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

On Thu, 14 Jan 2016 15:44:51 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> The onenand_default_bbt() function is only used by the OneNAND core
> and not by drivers, so there is no real need to export
> it. Additionally, the corresponding nand_default_bbt() for regular
> NANDs is not exported either, so for consistency reasons, this commit
> removes the EXPORT_SYMBOL on onenand_default_bbt().
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/onenand/onenand_bbt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
> index 5f8d470..680188a 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -247,5 +247,3 @@ int onenand_default_bbt(struct mtd_info *mtd)
>  
>  	return onenand_scan_bbt(mtd, bbm->badblock_pattern);
>  }
> -
> -EXPORT_SYMBOL(onenand_default_bbt);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
