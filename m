Received: from 6.mo68.mail-out.ovh.net ([46.105.63.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d61ko-0002st-Ao
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 21:24:12 +0000
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id A90594F453
 for <linux-mtd@lists.infradead.org>; Wed,  3 May 2017 23:23:46 +0200 (CEST)
Subject: Re: [RFC PATCH] mtd: spi-nor: handle signal case as failure
To: Nicholas Mc Guire <der.herr@hofr.at>
References: <1493805189-25327-1-git-send-email-der.herr@hofr.at>
Cc: Ludovic Barre <ludovic.barre@st.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <b3de06f6-9fcd-4b58-60f2-14c55d83898d@wedev4u.fr>
Date: Wed, 3 May 2017 23:23:32 +0200
MIME-Version: 1.0
In-Reply-To: <1493805189-25327-1-git-send-email-der.herr@hofr.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 03/05/2017 à 11:53, Nicholas Mc Guire a écrit :
>  The problem is that stm32_qspi_wait_cmd() will indicate success in case of
>  being interrupted. The if condition is incomplete here as
>  wait_for_copletion_interruptible_timeout can return -ERESTARTSYS but this
>  is not handled by if(!wait_for_completion_interruptible_timeout()).
>  While somewhat unlikely it probably would be hard to figure out what went
>  wrong if the signal case does occur.
> 
> Fixes: commit 0d43d7ab277a ("mtd: spi-nor: add driver for STM32 quad spi flash controller")
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> ---
> Problem found by experimental coccinelle script
> 
> Its not clear if its sufficient to simply treat this case as failure or
> if it might need some debug output to allow differentiation of signal
> and timeout case. 
> 
> Patch was compile tested with: stm32_defconfig +CONFIG_MTD=y, CONFIG_MTD_SPI_NOR=y,
> CONFIG_SPI_STM32_QUADSPI=m
> 
> Patch is against v4.11-rc8 (localversion-next is next-20170503)
> 
>  drivers/mtd/spi-nor/stm32-quadspi.c  | 10 ++++++++--
>  1 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 1056e74..27147ad 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -159,6 +159,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
>  {
>  	u32 cr;
>  	int err = 0;
> +	long timeout = 0;
>  
>  	if (readl_relaxed(qspi->io_base + QUADSPI_SR) & SR_TCF)
>  		return 0;
> @@ -167,8 +168,13 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
>  	cr = readl_relaxed(qspi->io_base + QUADSPI_CR);
>  	writel_relaxed(cr | CR_TCIE, qspi->io_base + QUADSPI_CR);
>  
> -	if (!wait_for_completion_interruptible_timeout(&qspi->cmd_completion,
> -						       msecs_to_jiffies(1000)))

Ludovic, can we just use wait_for_completion_timeout() instead?
I think so but you surely know better than me :)
Do you plan to receive signal? maybe to abort the current SPI flash command?

Best regards,

Cyrille

> +	timeout = wait_for_completion_interruptible_timeout(
> +				&qspi->cmd_completion, msecs_to_jiffies(1000));
> +
> +	/* since the calling side only cares about success of failure
> +	 * returning -ETIMEDOUT even when interrupted should be ok here
> +	 */
> +	if (timeout == 0 || timeout == -ERESTARTSYS)
>  		err = -ETIMEDOUT;
>  
>  	writel_relaxed(cr, qspi->io_base + QUADSPI_CR);
> 
