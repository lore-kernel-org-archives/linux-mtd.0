Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dqyAD-0005b1-Vi
 for linux-mtd@lists.infradead.org; Sun, 10 Sep 2017 09:04:38 +0000
Date: Sun, 10 Sep 2017 11:03:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>, MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix DMA unsafe buffer issue in
 spi_nor_read_sfdp()
Message-ID: <20170910110358.366ac1cc@bbrezillon>
In-Reply-To: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
References: <20170906214502.26748-1-cyrille.pitchen@wedev4u.fr>
 <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 7 Sep 2017 10:00:50 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Cyrille,
> 
> On Wed, Sep 6, 2017 at 11:45 PM, Cyrille Pitchen
> <cyrille.pitchen@wedev4u.fr> wrote:
> > spi_nor_read_sfdp() calls nor->read() to read the SFDP data.
> > When the m25p80 driver is used (pretty common case), nor->read() is then
> > implemented by the m25p80_read() function, which is likely to initialize a
> > 'struct spi_transfer' from its buf argument before appending this
> > structure inside the 'struct spi_message' argument of spi_sync().
> >
> > Besides the SPI sub-system states that both .tx_buf and .rx_buf members of
> > 'struct spi_transfer' must point into dma-safe memory. However, two of the
> > three calls of spi_nor_read_sfdp() were given pointers to stack allocated
> > memory as buf argument, hence not in a dma-safe area.
> > Hopefully, the third and last call of spi_nor_read_sfdp() was already
> > given a kmalloc'ed buffer argument, hence dma-safe.
> >
> > So this patch fixes this issue by introducing a
> > spi_nor_read_sfdp_dma_unsafe() function which simply wraps the existing
> > spi_nor_read_sfdp() function and uses some kmalloc'ed memory as a bounce
> > buffer.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>  
> 
> While this patch got rid of the warning, it does not fix the SPI FLASH
> identification
> issue:
> 
>     m25p80 spi0.0: s25fl512s (0 Kbytes)
>     3 ofpart partitions found on MTD device spi0.0
>     Creating 3 MTD partitions on "spi0.0":
>     0x000000000000-0x000000040000 : "loader"
>     mtd: partition "loader" is out of reach -- disabled
>     0x000000040000-0x000000080000 : "system"
>     mtd: partition "system" is out of reach -- disabled
>     0x000000080000-0x000004000000 : "user"
>     mtd: partition "user" is out of reach -- disabled
> 
> I noticed there's still one direct call to spi_nor_read_sfdp() left in
> spi_nor_parse_sfdp().

I think the remaining call site is valid because the caller allocates
the buffer it passes to spi_nor_parse_sfdp() with kmalloc().

> I tried changing that to spi_nor_read_sfdp_dma_unsafe(), but that didn't help.

Ok, we're still working on that. Did you have time to test Cyrille's
debug patch?

Cyrille, can we add more consistency checks in the SFDP parser code to
detect devices exposing invalid SFPD pages? For example, a device size
of 0 is impossible and could be easily detected when parsing the SFPD?
