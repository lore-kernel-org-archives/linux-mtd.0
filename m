Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds4GY-0004bw-JL
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 09:47:32 +0000
Date: Wed, 13 Sep 2017 12:47:02 +0300
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "sr@denx.de" <sr@denx.de>
Subject: Re: [PATCH v2 00/10] spi-nor: intel-spi: Various fixes and
 enhancements
Message-ID: <20170913094702.GW2477@lahna.fi.intel.com>
References: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
 <1505151868.31322.98.camel@infinera.com>
 <CAEUhbmXOiEKx736ht6pku31nuHVJgEK=wigdpeJAd678Mx3sPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXOiEKx736ht6pku31nuHVJgEK=wigdpeJAd678Mx3sPA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 13, 2017 at 10:11:21AM +0800, Bin Meng wrote:
> Hi Joakim,
> 
> On Tue, Sep 12, 2017 at 1:44 AM, Joakim Tjernlund
> <Joakim.Tjernlund@infinera.com> wrote:
> > On Mon, 2017-09-11 at 02:41 -0700, Bin Meng wrote:
> >> This series does several bug fixes and clean ups against the intel-spi
> >> spi-nor driver, as well as enhancements to make the driver independent
> >> on the underlying BIOS/bootloader.
> >>
> >> At present the driver uses the HW sequencer for the read/write/erase on
> >> all supported platforms, read_reg/write_reg for BXT, and the SW sequencer
> >> for read_reg/write_reg for BYT/LPT. The way the driver uses the HW and SW
> >> sequencer relies on some programmed register settings and hence creates
> >> unneeded dependencies with the underlying BIOS/bootloader. For example,
> >> the driver unfortunately does not work as expected when booting from
> >> Intel Baytrail FSP based bootloaders like U-Boot, as the Baytrail FSP
> >> does not set up some SPI controller settings to make the driver happy.
> >> Now such limitation has been removed with this series.
> >
> > Hi Bin
> >
> > Just starting to test these on Rangeley and got a question: We have two SPI flashes on CS0 resp. CS1
> > and the mtd driver seems to only map the first of those flashes. Is this intentional or
> > are we missing something?
> >
> 
> All the boards I have tested only have one SPI flash. Mika, any comments?

So I don't have such boards either.

However, I think the other CS is mapped to bit 24 of the flash address.
So once you try to address higher than 16MB it should activate the other
CS instead. Not 100% sure, though but for example Intel C620 chipset
datasheet [1] seems to have additional bits in address register (there is
also another CS for TPM).

[1] https://www.intel.com/content/www/us/en/chipsets/c620-series-chipset-datasheet.html
