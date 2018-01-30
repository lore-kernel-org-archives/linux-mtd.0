Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egWRz-0002BN-26
 for linux-mtd@lists.infradead.org; Tue, 30 Jan 2018 13:59:52 +0000
Received: by mail-qk0-x243.google.com with SMTP id z12so10158918qkf.12
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jan 2018 05:59:40 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180130145626.7a108c64@bbrezillon>
References: <1517318601-14793-1-git-send-email-geert@linux-m68k.org>
 <20180130144647.73a44b8d@xps13> <20180130145626.7a108c64@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2018 14:59:37 +0100
Message-ID: <CAMuHMdVZSBdGxRZfYRaNGH5Aygf3avuCu86dMJ0NsxxVp_yifg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: MTD_NAND_MARVELL should depend on HAS_DMA
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 30, 2018 at 2:56 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 30 Jan 2018 14:46:47 +0100
> Miquel Raynal <miquel.raynal@free-electrons.com> wrote:
>> On Tue, 30 Jan 2018 14:23:21 +0100
>> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> > If NO_DMA=y:
>> >
>> >     ERROR: "bad_dma_ops" [drivers/mtd/nand/marvell_nand.ko] undefined!
>> >
>> > Add a dependency on HAS_DMA to fix this.
>> >
>> > Fixes: 02f26ecf8c772751 ("mtd: nand: add reworked Marvell NAND controller driver")
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> > ---
>> >  drivers/mtd/nand/Kconfig | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> > index e6b8c59f2c0da7c0..736ac887303c88ba 100644
>> > --- a/drivers/mtd/nand/Kconfig
>> > +++ b/drivers/mtd/nand/Kconfig
>> > @@ -328,7 +328,7 @@ config MTD_NAND_MARVELL
>> >     tristate "NAND controller support on Marvell boards"
>> >     depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU || \
>> >                COMPILE_TEST
>> > -   depends on HAS_IOMEM
>> > +   depends on HAS_IOMEM && HAS_DMA
>>
>> I think this is more a coding issue than a Kconfig issue. AFAIR, none
>> of the ARCH_MVEBU SoCs use DMA in conjunction with the NAND controller.
>> PXA SoCs may use DMA (NFCv1 only) but this is not a hard requirement and
>> the driver is supposed to support PIO mode in all situations.
>>
>> Can you please share your setup, the SoC, the configuration,
>> maybe also the DT?
>
> I don't think Geert is testing on a real board. He's just enabling
> COMPILE_TEST and can then select your driver. Which means you really
> need this depends on HAS_DMA.

Correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
