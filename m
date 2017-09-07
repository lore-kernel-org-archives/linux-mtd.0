Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dprkO-0003eW-UT
 for linux-mtd@lists.infradead.org; Thu, 07 Sep 2017 08:01:20 +0000
Received: by mail-pf0-x242.google.com with SMTP id q76so4178266pfq.5
 for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2017 01:00:52 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170906214502.26748-1-cyrille.pitchen@wedev4u.fr>
References: <20170906214502.26748-1-cyrille.pitchen@wedev4u.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2017 10:00:50 +0200
Message-ID: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: fix DMA unsafe buffer issue in
 spi_nor_read_sfdp()
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Wed, Sep 6, 2017 at 11:45 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
> spi_nor_read_sfdp() calls nor->read() to read the SFDP data.
> When the m25p80 driver is used (pretty common case), nor->read() is then
> implemented by the m25p80_read() function, which is likely to initialize a
> 'struct spi_transfer' from its buf argument before appending this
> structure inside the 'struct spi_message' argument of spi_sync().
>
> Besides the SPI sub-system states that both .tx_buf and .rx_buf members of
> 'struct spi_transfer' must point into dma-safe memory. However, two of the
> three calls of spi_nor_read_sfdp() were given pointers to stack allocated
> memory as buf argument, hence not in a dma-safe area.
> Hopefully, the third and last call of spi_nor_read_sfdp() was already
> given a kmalloc'ed buffer argument, hence dma-safe.
>
> So this patch fixes this issue by introducing a
> spi_nor_read_sfdp_dma_unsafe() function which simply wraps the existing
> spi_nor_read_sfdp() function and uses some kmalloc'ed memory as a bounce
> buffer.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

While this patch got rid of the warning, it does not fix the SPI FLASH
identification
issue:

    m25p80 spi0.0: s25fl512s (0 Kbytes)
    3 ofpart partitions found on MTD device spi0.0
    Creating 3 MTD partitions on "spi0.0":
    0x000000000000-0x000000040000 : "loader"
    mtd: partition "loader" is out of reach -- disabled
    0x000000040000-0x000000080000 : "system"
    mtd: partition "system" is out of reach -- disabled
    0x000000080000-0x000004000000 : "user"
    mtd: partition "user" is out of reach -- disabled

I noticed there's still one direct call to spi_nor_read_sfdp() left in
spi_nor_parse_sfdp().
I tried changing that to spi_nor_read_sfdp_dma_unsafe(), but that didn't help.

> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1784,7 +1784,7 @@ spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
>   * @nor:       pointer to a 'struct spi_nor'
>   * @addr:      offset in the SFDP area to start reading data from
>   * @len:       number of bytes to read
> - * @buf:       buffer where the SFDP data are copied into
> + * @buf:       buffer where the SFDP data are copied into (dma-safe memory)
>   *
>   * Whatever the actual numbers of bytes for address and dummy cycles are
>   * for (Fast) Read commands, the Read SFDP (5Ah) instruction is always
> @@ -1829,6 +1829,36 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>         return ret;
>  }
>
> +/**
> + * spi_nor_read_sfdp_dma_unsafe() - read Serial Flash Discoverable Parameters.
> + * @nor:       pointer to a 'struct spi_nor'
> + * @addr:      offset in the SFDP area to start reading data from
> + * @len:       number of bytes to read
> + * @buf:       buffer where the SFDP data are copied into
> + *
> + * Wrap spi_nor_read_sfdp() using a kmalloc'ed bounce buffer as @buf is now not
> + * guaranteed to be dma-safe.
> + *
> + * Return: -ENOMEM if kmalloc() fails, the return code of spi_nor_read_sfdp()
> + *          otherwise.
> + */
> +static int spi_nor_read_sfdp_dma_unsafe(struct spi_nor *nor, u32 addr,
> +                                       size_t len, void *buf)
> +{
> +       void *dma_safe_buf;
> +       int ret;
> +
> +       dma_safe_buf = kmalloc(len, GFP_KERNEL);
> +       if (!dma_safe_buf)
> +               return -ENOMEM;
> +
> +       ret = spi_nor_read_sfdp(nor, addr, len, dma_safe_buf);
> +       memcpy(buf, dma_safe_buf, len);
> +       kfree(dma_safe_buf);
> +
> +       return ret;
> +}
> +
>  struct sfdp_parameter_header {
>         u8              id_lsb;
>         u8              minor;
> @@ -2101,7 +2131,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>                     bfpt_header->length * sizeof(u32));
>         addr = SFDP_PARAM_HEADER_PTP(bfpt_header);
>         memset(&bfpt, 0, sizeof(bfpt));
> -       err = spi_nor_read_sfdp(nor,  addr, len, &bfpt);
> +       err = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
>         if (err < 0)
>                 return err;
>
> @@ -2243,7 +2273,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>         int i, err;
>
>         /* Get the SFDP header. */
> -       err = spi_nor_read_sfdp(nor, 0, sizeof(header), &header);
> +       err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
>         if (err < 0)
>                 return err;
>

Instead of having buffers on the stack, passing them around through multiple
call levels, and then kmalloc()ing a buffer, what about using the helpers in
<linux/spi/spi.h> instead, which take care of the issue through the
static bounce
buffer or kmalloc() themselves?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
