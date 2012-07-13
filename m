MIME-Version: 1.0
In-Reply-To: <1342095778-13403-3-git-send-email-stigge@antcom.de>
References: <1342095778-13403-1-git-send-email-stigge@antcom.de>
 <1342095778-13403-3-git-send-email-stigge@antcom.de>
Date: Fri, 13 Jul 2012 09:51:29 -0300
Message-ID: <CAAAP30GxeXHfeZZchYzSjBQXfkS+o+sabAU5iy8uBxiSoO87hQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: lpc32xx_mlc: Adjust to pl08x DMA interface
 changes
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk, arnd@arndb.de,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 12, 2012 at 9:22 AM, Roland Stigge <stigge@antcom.de> wrote:
> This patch adjusts the LPC32xx MLC NAND driver to the new pl08x DMA interface,
> fixing the compile error resulting from changed pl08x structures.
>
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Acked-By: Alexandre Pereira da Silva <aletes.xgr@gmail.com>

> ---
>
> Applies to today's linux-next (integrated lpc32xx-next and dma branches which collide)
>
>  drivers/mtd/nand/lpc32xx_mlc.c |   13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
> index 260b2c2..1cf3593 100644
> --- a/drivers/mtd/nand/lpc32xx_mlc.c
> +++ b/drivers/mtd/nand/lpc32xx_mlc.c
> @@ -576,17 +576,6 @@ static void lpc32xx_ecc_enable(struct mtd_info *mtd, int mode)
>         /* Always enabled! */
>  }
>
> -static bool lpc32xx_dma_filter(struct dma_chan *chan, void *param)
> -{
> -       struct pl08x_dma_chan *ch =
> -               container_of(chan, struct pl08x_dma_chan, chan);
> -
> -       /* In LPC32xx's PL080 DMA wiring, the MLC NAND DMA signal is #12 */
> -       if (ch->cd->min_signal == 12)
> -               return true;
> -       return false;
> -}
> -
>  static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
>  {
>         struct mtd_info *mtd = &host->mtd;
> @@ -594,7 +583,7 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
>
>         dma_cap_zero(mask);
>         dma_cap_set(DMA_SLAVE, mask);
> -       host->dma_chan = dma_request_channel(mask, lpc32xx_dma_filter, NULL);
> +       host->dma_chan = dma_request_channel(mask, pl08x_filter_id, "nand-mlc");
>         if (!host->dma_chan) {
>                 dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
>                 return -EBUSY;
> --
> 1.7.10.4
>
