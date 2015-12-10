Date: Wed, 9 Dec 2015 18:21:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mtd: sh_flctl: pass FIFO as physical address
Message-ID: <20151210022146.GH144338@google.com>
References: <3152458.D3kElfhRW2@wuerfel>
 <CAMuHMdVWss6Kz8sVrcUR3a4iJ+Z8D1q1Er6eH_uRMoS5DCN5pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWss6Kz8sVrcUR3a4iJ+Z8D1q1Er6eH_uRMoS5DCN5pw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 08, 2015 at 05:30:02PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 8, 2015 at 4:38 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > By convention, the FIFO address we pass using dmaengine_slave_config
> > is a physical address in the form that is understood by the DMA
> > engine, as a dma_addr_t, phys_addr_t or resource_size_t.
> >
> > The sh_flctl driver however passes a virtual __iomem address that
> > gets cast to dma_addr_t in the slave driver. This happens to work
> > on shmobile because that platform sets up an identity mapping for
> > its MMIO regions, but such code is not portable to other platforms,
> > and prevents us from ever changing the platform mapping or reusing
> > the driver on other architectures like ARM64 that might not have the
> > mapping.
> 
> Note that since the removal of (ARM) sh7367/sh7377/sh7372 support, this
> driver is used on SH only.

It's still available as COMPILE_TEST, so it's still worth fixing.

But really, does anyone use this driver any more?

Brian
