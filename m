Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLOTQ-000274-2b
 for linux-mtd@lists.infradead.org; Wed, 11 Feb 2015 04:00:24 +0000
Received: by mail-qg0-f49.google.com with SMTP id q107so903208qgd.8
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 20:00:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1422789346-16954-1-git-send-email-hofrat@osadl.org>
References: <1422789346-16954-1-git-send-email-hofrat@osadl.org>
Date: Tue, 10 Feb 2015 22:00:01 -0600
Message-ID: <CA+EcR23aNNaOEk8kmw7S1MX1uzVdZ=At1q2aAtJh3jNLnyOk7Q@mail.gmail.com>
Subject: Re: [PATCH] spi: fsl-quadspi: cleanup wait_for_completion return
 handling
From: Han Xu <xhnjupt@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Marek Vasut <marex@denx.de>,
 Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Allen Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 1, 2015 at 5:15 AM, Nicholas Mc Guire <hofrat@osadl.org> wrote:
> return type of wait_for_completion_timeout is unsigned long not int, this
> patch uses the return value of wait_for_completion_timeout in the condition
> directly rather than adding a additional appropriately typed variable.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
>
> As the returnvalue of wait_for_completion_timeout is logically treated here
> as a boolean (timeout occured or not) it can be wrapped into the if condition
> directly and no additional variable is needed.
>
> This patch was only compile tested with imx_v6_v7_defconfig
> (implies CONFIG_SPI_FSL_QUADSPI=y)
>
> Patch is against 3.19.0-rc6 -next-20150130
>
>  drivers/mtd/spi-nor/fsl-quadspi.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index a46bea3..2543b5c 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -455,8 +455,7 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
>         writel((seqid << QUADSPI_IPCR_SEQID_SHIFT) | len, base + QUADSPI_IPCR);
>
>         /* Wait for the interrupt. */
> -       err = wait_for_completion_timeout(&q->c, msecs_to_jiffies(1000));
> -       if (!err) {
> +       if (!wait_for_completion_timeout(&q->c, msecs_to_jiffies(1000))) {
>                 dev_err(q->dev,
>                         "cmd 0x%.2x timeout, addr@%.8x, FR:0x%.8x, SR:0x%.8x\n",
>                         cmd, addr, readl(base + QUADSPI_FR),
> --
> 1.7.10.4
>

Acked-by: Han Xu <han.xu@freescale.com>

>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
