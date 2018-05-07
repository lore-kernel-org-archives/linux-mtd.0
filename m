Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFcYb-0006vj-HI
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 09:35:47 +0000
Date: Mon, 7 May 2018 11:35:22 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v2] mtd: rawnand: Make sure we wait tWB before polling
 the STATUS reg
Message-ID: <20180507113522.03a52da9@bbrezillon>
In-Reply-To: <20180504192431.16661-1-boris.brezillon@bootlin.com>
References: <20180504192431.16661-1-boris.brezillon@bootlin.com>
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

On Fri,  4 May 2018 21:24:31 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> NAND chips require a bit of time to take the NAND operation into
> account and set the BUSY bit in the STATUS reg. Make sure we don't poll
> the STATUS reg too early in nand_soft_waitrdy().
> 
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - Move the ndelay() to nand_soft_waitrdy() instead of having it in the
>   FSMC driver
> ---
>  drivers/mtd/nand/raw/nand_base.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 72f3a89da513..da94fcb4dd9b 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -706,12 +706,17 @@ static void nand_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
>   */
>  int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
>  {
> +	const struct nand_sdr_timings *timings;
>  	u8 status = 0;
>  	int ret;
>  
>  	if (!chip->exec_op)
>  		return -ENOTSUPP;
>  
> +	/* Wait tWB before polling the STATUS reg. */
> +	timings = nand_get_sdr_timings(&chip->data_interface);
> +	ndelay(PSEC_TO_NSEC(sdr->tWB_max));

			    ^ timings->tWB_max

And for those who wonder, yes, I compiled the code, but it seems I
forgot to amend the commit after fixing the bug locally :-).

> +
>  	ret = nand_status_op(chip, NULL);
>  	if (ret)
>  		return ret;
