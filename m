Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c80dK-0003Vl-6m
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2016 08:04:23 +0000
Date: Sat, 19 Nov 2016 09:03:52 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161119090352.062e00c9@bbrezillon>
In-Reply-To: <20161119073546.GA1446@lahna.fi.intel.com>
References: <20161114102447.131602-1-mika.westerberg@linux.intel.com>
 <20161118190426.GC23246@dell.home>
 <20161119073546.GA1446@lahna.fi.intel.com>
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

On Sat, 19 Nov 2016 09:35:46 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> On Fri, Nov 18, 2016 at 07:04:26PM +0000, Lee Jones wrote:
> > On Mon, 14 Nov 2016, Mika Westerberg wrote:
> >   
> > > This is fifth version of the series. You can find the previous versions
> > > archived on:
> > > 
> > >   v4: https://lwn.net/Articles/703773/
> > >   v3: https://lwn.net/Articles/697231/
> > >   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
> > >   v1: https://lkml.org/lkml/2016/6/14/269
> > > 
> > > This patch series adds support for the Intel SPI serial flash controller
> > > found on many recent Intel CPUs including Baytrail and Braswell. This
> > > driver makes it possible to access the BIOS and other platform data which
> > > is stored on the SPI serial flash. It is also possible to upgrade the BIOS
> > > using this driver if it has not been protected by special hardware bits.
> > > 
> > > The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
> > > MAX.
> > > 
> > > Since poking the SPI serial flash can brick the machine, this driver can
> > > only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
> > > unless instructed othwerwise by module parameter.
> > > 
> > > Changes from v4:
> > >   * Use INTEL_SPI_FIFO_SZ instead of hard coded value of 64 bytes
> > >   * Don't increment i inside call to FDATA() macro
> > >   * Check nor->read_opcode in intel_spi_read() and return
> > >     -EINVAL if not supported. We may add SFDP support later on.
> > > 
> > > Changes from v3:
> > >   * Added ACKs from Lee Jones.
> > >   * Use bus instead of dev->bus in PCI accesses
> > > 
> > > Changes from v2:
> > >   * Rebased on top of v4.8-rc2
> > >   * Updated intel_spi_read/write() according spi-nor core changes which
> > >     drops retlen parameter and returns number of bytes read/written.
> > > 
> > > Changes from v1:
> > >   * Older hardware does not support 64k erase command so added erase_64k
> > >     flag which is set only for Broxton (BXT).
> > >   * Fix protection range offset for Broxton. Now there is ispi->pregs
> > >     pointing to the start of the protection registers.
> > >   * Change naming of constants from BCR_BYT -> BYT_BCR and so on.
> > >   * Drop lpc_ich_finalize_spi_cell() and initialize cell directly in
> > >     lpc_ich_init_spi().
> > >   * Use info->type in switch in lpc_ich_init_spi().
> > >   * Add defines for magic numbers used in lpc_ich_init_spi().
> > >   * Use PLATFORM_DEVID_NONE with mfd_add_devices().
> > > 
> > > Mika Westerberg (3):
> > >   spi-nor: Add support for Intel SPI serial flash controller
> > >   mfd: lpc_ich: Add support for SPI serial flash host controller
> > >   mfd: lpc_ich: Add support for Intel Apollo Lake SoC  
> > 
> > What's the plan for this set?  
> 
> I was hoping to get this merged via MTD tree but I haven't got much
> comments from the maintainers. No idea if anyone is going to take this :-(

Marek, Cyrille, can you take a look?
