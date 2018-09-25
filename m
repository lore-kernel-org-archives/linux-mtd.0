Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4jpq-00079d-2D
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2018 09:40:51 +0000
Received: by mail-vs1-f68.google.com with SMTP id y11-v6so9945887vso.5
 for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2018 02:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180920073112.7897-1-boris.brezillon@bootlin.com>
 <20180920073112.7897-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180920073112.7897-4-boris.brezillon@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Sep 2018 11:40:06 +0200
Message-ID: <CAMuHMdUxK9QebHmGERNsF1JA4bS2RjbV3=yGJxmsLFvHO_bfoQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] spi: spi-mem: Add extra sanity checks on the op param
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, Sep 20, 2018 at 9:32 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Some combinations are simply not valid and should be rejected before
> the op is passed to the SPI controller driver.
>
> Add an spi_mem_check_op() helper and use it in spi_mem_exec_op() and
> spi_mem_supports_op() to make sure the spi-mem operation is valid.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

This is now commit 380583227c0c7f52 ("spi: spi-mem: Add extra sanity checks
on the op param") in spi/for-next, and causes probing of the QSPI FLASH
on r8a7791/koelsch to fail with:

    m25p80 spi0.0: error -22 reading 9f
    m25p80: probe of spi0.0 failed with error -22

Reverting the commit revives the FLASH:

    m25p80 spi0.0: s25fl512s (65536 Kbytes)
    3 fixed-partitions partitions found on MTD device spi0.0
    Creating 3 MTD partitions on "spi0.0":
    0x000000000000-0x000000080000 : "loader"
    0x000000080000-0x000000600000 : "user"
    0x000000600000-0x000004000000 : "flash"

> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -12,6 +12,8 @@
>
>  #include "internals.h"
>
> +#define SPI_MEM_MAX_BUSWIDTH           4
> +
>  /**
>   * spi_controller_dma_map_mem_op_data() - DMA-map the buffer attached to a
>   *                                       memory operation
> @@ -149,6 +151,44 @@ static bool spi_mem_default_supports_op(struct spi_mem *mem,
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
>
> +static bool spi_mem_buswidth_is_valid(u8 buswidth)
> +{
> +       if (hweight8(buswidth) > 1 || buswidth > SPI_MEM_MAX_BUSWIDTH)
> +               return false;
> +
> +       return true;
> +}
> +
> +static int spi_mem_check_op(const struct spi_mem_op *op)
> +{
> +       if (!op->cmd.buswidth)
> +               return -EINVAL;
> +
> +       if ((op->addr.nbytes && !op->addr.buswidth) ||
> +           (op->dummy.nbytes && !op->dummy.buswidth) ||
> +           (op->data.nbytes && !op->data.buswidth))
> +               return -EINVAL;
> +
> +       if (spi_mem_buswidth_is_valid(op->cmd.buswidth) ||
> +           spi_mem_buswidth_is_valid(op->addr.buswidth) ||
> +           spi_mem_buswidth_is_valid(op->dummy.buswidth) ||
> +           spi_mem_buswidth_is_valid(op->data.buswidth))

Adding debug code shows:

    op->cmd.buswidth = 1
    op->addr.buswidth = 0
    op->dummy.buswidth = 0
    op->data.buswidth = 1

so they're all valid, leading to a failure?!?
Looks like the logic is completely reversed, will send a patch...

> +               return -EINVAL;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
