Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFhSg-0003gA-2e
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 09:59:36 +0000
Received: by mail-pd0-f175.google.com with SMTP id w10so16013116pde.34
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 01:59:12 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAMuHMdUY+XEqKYh7mMOYUV18PpR+7SFw+BEUFh-9yL=H6reQkA@mail.gmail.com>
References: <CAMuHMdUY+XEqKYh7mMOYUV18PpR+7SFw+BEUFh-9yL=H6reQkA@mail.gmail.com>
Date: Tue, 18 Feb 2014 10:59:09 +0100
Message-ID: <CAMuHMdWkPxp2U=Xz=wWu70RPxj+4GGCyifdPv=xL=47cz_upBw@mail.gmail.com>
Subject: Re: spi: Provide core support for full duplex devices
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On Thu, Feb 6, 2014 at 1:56 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> I found this in your for-next branch:
>
> commit 3a2eba9bd0a6447dfbc01635e4cd0689f5f2bdad
> Author: Mark Brown <broonie@linaro.org>
> Date:   Tue Jan 28 20:17:03 2014 +0000
>
>     spi: Provide core support for full duplex devices
>
> If I'm not mistaken, you forgot to email this out to linux-spi?
>
> I'll see whether I can make use of this in the RSPI driver.

I gave it a quick try, with RSPI single transfers.

For Dual/Quad transfers, which are half-duplex, the buffer pointer for the
unused direction must be NULL, so the driver knows in which direction to
transfer. Hence SPI_MASTER_MUST_TX cannot be set for Dual/Quad
capable SPI master.

I'm also worried about the buffer allocation. With m25p80 and mtchar, the
transfer buffer can be quite large (up to 4 MiB in my case), and this can be
triggered from userspace.

While mtdchar uses mtd_kmalloc_up_to(), and reduces the temporary
buffer size under memory pressure, the SPI core must always allocate a
buffer of the matching size. This may fail.

It's also a little bit slower (O(20 ms) for 1 MiB read), due to the overhead of
calling krealloc(), and zeroing the dummy buffer.

Alternatively, to avoid the memory allocation, you could zero rx_buf,
and use rx_buf for both tx and rx? That may break some DMA setups,
though.

Concluding, for PIO mode, I'm still in favor of using

    data = tx_buf ? *tx_buf++ : DUMMY_DATA;

in the SPI master driver itself.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
