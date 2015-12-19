Date: Fri, 18 Dec 2015 18:27:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Frans Klaver <fransklaver@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: sh_flctl: pass FIFO as physical address
Message-ID: <20151219022737.GC109450@google.com>
References: <3152458.D3kElfhRW2@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3152458.D3kElfhRW2@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 08, 2015 at 04:38:12PM +0100, Arnd Bergmann wrote:
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
> 
> We also get a warning about a type mismatch for the case that
> dma_addr_t is wider than a pointer, i.e. when CONFIG_LPAE is set:
> 
> drivers/mtd/nand/sh_flctl.c: In function 'flctl_setup_dma':
> drivers/mtd/nand/sh_flctl.c:163:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   cfg.dst_addr = (dma_addr_t)FLDTFIFO(flctl);
> 
> This changes the driver to instead pass the physical address of
> the FIFO that is extracted from the MMIO resource, making the
> code more portable and avoiding the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied
