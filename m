Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYdpz-0001hQ-V7
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 20:16:06 +0000
Date: Mon, 8 Jan 2018 21:15:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: brcmnand: Disable prefetch by default
Message-ID: <20180108211540.131f938a@bbrezillon>
In-Reply-To: <1515441973-30753-1-git-send-email-kdasu.kdev@gmail.com>
References: <1515441973-30753-1-git-send-email-kdasu.kdev@gmail.com>
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

On Mon,  8 Jan 2018 15:06:13 -0500
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> Brcm nand controller prefetch feature needs to be disabled
> by default. Enabling affects performance on random reads as
> well as dma reads.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: stable@vger.kernel.org

Fixes:????

> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index dd56a67..2a978d9 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -2193,16 +2193,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  	if (ctrl->nand_version >= 0x0702)
>  		tmp |= ACC_CONTROL_RD_ERASED;
>  	tmp &= ~ACC_CONTROL_FAST_PGM_RDIN;
> -	if (ctrl->features & BRCMNAND_HAS_PREFETCH) {
> -		/*
> -		 * FIXME: Flash DMA + prefetch may see spurious erased-page ECC
> -		 * errors
> -		 */
> -		if (has_flash_dma(ctrl))
> -			tmp &= ~ACC_CONTROL_PREFETCH;
> -		else
> -			tmp |= ACC_CONTROL_PREFETCH;
> -	}
> +	if (ctrl->features & BRCMNAND_HAS_PREFETCH)
> +		tmp &= ~ACC_CONTROL_PREFETCH;
> +
>  	nand_writereg(ctrl, offs, tmp);
>  
>  	return 0;
