Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7g3x-0006ax-TW
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 12:16:07 +0000
Date: Wed, 3 Oct 2018 14:15:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 daniel@zonque.org, Chris.Packham@alliedtelesis.co.nz,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: fix the IRQ handler complete()
 condition
Message-ID: <20181003141508.0dfdea36@bbrezillon>
In-Reply-To: <20181003090504.19910-1-miquel.raynal@bootlin.com>
References: <20181003090504.19910-1-miquel.raynal@bootlin.com>
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

On Wed,  3 Oct 2018 11:05:04 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> With the current implementation, the complete() in the IRQ handler is
> supposed to be called only if the register status has one or the other
> RDY bit set. Other events might trigger an interrupt as well if
> enabled, but should not end-up with a complete() call.
> 
> For this purpose, the code was checking if the other bits were set, in
> this case complete() was not called. This is wrong as two events might
> happen in a very tight time-frame and if the NDSR status read reports
> two bits set (eg. RDY(0) and RDDREQ) at the same time, complete() was
> not called.
> 
> This logic would lead to timeouts in marvell_nfc_wait_op() and has
> been observed on PXA boards (NFCv1) in the Hamming write path.
> 
> Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
> Cc: stable@vger.kernel.org
> Reported-by: Daniel Mack <daniel@zonque.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Daniel Mack <daniel@zonque.org>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index bc2ef5209783..c7573ccdbacd 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -686,7 +686,7 @@ static irqreturn_t marvell_nfc_isr(int irq, void *dev_id)
>  
>  	marvell_nfc_disable_int(nfc, st & NDCR_ALL_INT);
>  
> -	if (!(st & (NDSR_RDDREQ | NDSR_WRDREQ | NDSR_WRCMDREQ)))
> +	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
>  		complete(&nfc->complete);
>  
>  	return IRQ_HANDLED;
