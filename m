Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5Pfv-0007nl-FY
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 06:21:25 +0000
Date: Thu, 27 Sep 2018 08:20:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 chris.packham@alliedtelesis.co.nz, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20180927082033.0b5295de@bbrezillon>
In-Reply-To: <20180926212353.13399-1-daniel@zonque.org>
References: <20180926212353.13399-1-daniel@zonque.org>
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

Hi Daniel,

On Wed, 26 Sep 2018 23:23:53 +0200
Daniel Mack <daniel@zonque.org> wrote:

> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR register
> will only cause the IRQ to latch when the RDY lanes are changing, and not
> in case they are already asserted.
> 
> This means that if the controller finished the command in flight before
> marvell_nfc_wait_op() is called, that function will wait for a change in
> the bit that can't ever happen as it is already set.
> 
> To mitigate this race, check for the RDY bits after the IRQ was enabled,
> and only sleep on the condition if the controller isn't ready yet.
> 
> This fixes a bug that was observed with a NAND chip that holds a UBIFS
> parition on which file system stress tests were executed. When
> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount
> the filesystem read-only, reporting lots of warnings along the way.
> 
> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 666f34b58dec..e96ec7b9a152 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -613,7 +613,8 @@ static int marvell_nfc_wait_cmdd(struct nand_chip *chip)
>  static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
>  {
>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
> -	int ret;
> +	int ret = -EALREADY;
> +	u32 st;
>  
>  	/* Timeout is expressed in ms */
>  	if (!timeout_ms)
> @@ -622,8 +623,15 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
>  	init_completion(&nfc->complete);
>  
>  	marvell_nfc_enable_int(nfc, NDCR_RDYM);
> -	ret = wait_for_completion_timeout(&nfc->complete,
> -					  msecs_to_jiffies(timeout_ms));
> +
> +	/*
> +	 * Check if the NDSR_RDY bits have already been set before the
> +	 * interrupt was enabled.
> +	 */
> +	st = readl_relaxed(nfc->regs + NDSR);
> +	if (!(st & (NDSR_RDY(0) | NDSR_RDY(1))))
> +		ret = wait_for_completion_timeout(&nfc->complete,
> +						  msecs_to_jiffies(timeout_ms));

Or you can just do:

	st = readl_relaxed(nfc->regs + NDSR);
	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
		complete(&nfc->complete);

	ret = wait_for_completion_timeout(&nfc->complete,
					  msecs_to_jiffies(timeout_ms));
	...

Of course, it's less efficient than your version, but I find it clearer
than the -EALREADY approach.

>  	marvell_nfc_disable_int(nfc, NDCR_RDYM);
>  	marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));
>  	if (!ret) {
