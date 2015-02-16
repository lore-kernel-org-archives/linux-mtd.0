Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNS1L-0000iu-Ix
 for linux-mtd@lists.infradead.org; Mon, 16 Feb 2015 20:11:56 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
Date: Mon, 16 Feb 2015 21:11:24 +0100
In-Reply-To: <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 16 Feb 2015 13:51:11 +0100")
Message-ID: <87oaotaa6r.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maxime Ripard <maxime.ripard@free-electrons.com> writes:

>  drivers/mtd/nand/pxa3xx_nand.c | 47 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d27df1..b2d8d6960765 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -480,6 +480,41 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  	nand_writel(info, NDCR, ndcr | int_mask);
>  }
>  
> +static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
> +{
> +	if (info->ecc_bch) {
> +		int index = 0;
> +
> +		while (index < (len * 4)) {
> +			u32 timeout;
> +
> +			__raw_readsl(info->mmio_base + NDDB, data + index, 8);
> +
> +			/*
> +			 * According to the datasheet, when reading
> +			 * from NDDB with BCH enabled, after each 32
> +			 * bytes reads, we have to make sure that the
> +			 * NDSR.RDDREQ bit is set
> +			 */
> +			for (timeout = 0;
> +			     !(nand_readl(info, NDSR) & NDSR_RDDREQ);
> +			     timeout++) {
> +				if (timeout >= 5) {
> +					dev_err(&info->pdev->dev,
> +						"Timeout on RDDREQ while draining the FIFO\n");
> +					return;
> +				}
> +
> +				mdelay(1);
So in worst case, we'll end up with 4 times mdelay(1) times len / 32.
For a 2048 page, it is : 256ms where everything is stuck (mdelay and not
msleep).

I know you had no choice because this is called from interrupt handler (top
half). But having a irq handler and a irq thread handler would solve that issue,
and you'll end up with msleep(1) in this code.

I don't think an mdelay(256) is acceptable.

Cheers.

--
Robert
