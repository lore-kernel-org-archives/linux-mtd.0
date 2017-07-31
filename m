Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dcDYL-0007Td-TK
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 16:28:23 +0000
Date: Mon, 31 Jul 2017 18:28:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Alexander Dahl <ada@thorsis.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Declare tBERS, tR and tPROG as u64 to avoid
 integer overflow
Message-ID: <20170731182800.7517f117@bbrezillon>
In-Reply-To: <1501489887-7372-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501489887-7372-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Mon, 31 Jul 2017 10:31:27 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> All timings in nand_sdr_timings are expressed in picoseconds but some
> of them may not fit in an u32.

Applied to nand/fixes.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 204e7ecd47e2 ("mtd: nand: Add a few more timings to nand_sdr_timings")
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/mtd/nand/nand_timings.c | 6 +++---
>  include/linux/mtd/nand.h        | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
> index f06312df3669..7e36d7d13c26 100644
> --- a/drivers/mtd/nand/nand_timings.c
> +++ b/drivers/mtd/nand/nand_timings.c
> @@ -311,9 +311,9 @@ int onfi_init_data_interface(struct nand_chip *chip,
>  		struct nand_sdr_timings *timings = &iface->timings.sdr;
>  
>  		/* microseconds -> picoseconds */
> -		timings->tPROG_max = 1000000UL * le16_to_cpu(params->t_prog);
> -		timings->tBERS_max = 1000000UL * le16_to_cpu(params->t_bers);
> -		timings->tR_max = 1000000UL * le16_to_cpu(params->t_r);
> +		timings->tPROG_max = 1000000ULL * le16_to_cpu(params->t_prog);
> +		timings->tBERS_max = 1000000ULL * le16_to_cpu(params->t_bers);
> +		timings->tR_max = 1000000ULL * le16_to_cpu(params->t_r);
>  
>  		/* nanoseconds -> picoseconds */
>  		timings->tCCS_min = 1000UL * le16_to_cpu(params->t_ccs);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 892148c448cc..5216d2eb2289 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -681,10 +681,10 @@ struct nand_buffers {
>   * @tWW_min: WP# transition to WE# low
>   */
>  struct nand_sdr_timings {
> -	u32 tBERS_max;
> +	u64 tBERS_max;
>  	u32 tCCS_min;
> -	u32 tPROG_max;
> -	u32 tR_max;
> +	u64 tPROG_max;
> +	u64 tR_max;
>  	u32 tALH_min;
>  	u32 tADL_min;
>  	u32 tALS_min;
