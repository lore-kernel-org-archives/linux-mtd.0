MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <3152458.D3kElfhRW2@wuerfel>
References: <3152458.D3kElfhRW2@wuerfel>
Date: Tue, 8 Dec 2015 17:30:02 +0100
Message-ID: <CAMuHMdVWss6Kz8sVrcUR3a4iJ+Z8D1q1Er6eH_uRMoS5DCN5pw@mail.gmail.com>
Subject: Re: [PATCH] mtd: sh_flctl: pass FIFO as physical address
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>,
 Frans Klaver <fransklaver@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 8, 2015 at 4:38 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> By convention, the FIFO address we pass using dmaengine_slave_config
> is a physical address in the form that is understood by the DMA
> engine, as a dma_addr_t, phys_addr_t or resource_size_t.
>
> The sh_flctl driver however passes a virtual __iomem address that
> gets cast to dma_addr_t in the slave driver. This happens to work
> on shmobile because that platform sets up an identity mapping for
> its MMIO regions, but such code is not portable to other platforms,
> and prevents us from ever changing the platform mapping or reusing
> the driver on other architectures like ARM64 that might not have the
> mapping.

Note that since the removal of (ARM) sh7367/sh7377/sh7372 support, this
driver is used on SH only.

I'll send a patch to update Kconfig.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
