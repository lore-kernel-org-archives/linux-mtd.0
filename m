Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuwbq-0000Zx-AV
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 09:17:56 +0000
Date: Wed, 29 Aug 2018 11:17:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
Message-ID: <20180829111740.12223549@bbrezillon>
In-Reply-To: <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
 <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
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

Hi Marek,

On Tue, 28 Aug 2018 18:56:38 +0200
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 08/28/2018 06:50 PM, Mika Westerberg wrote:
> > Intel Ice Lake exposes the SPI serial flash controller as a PCI device
> > in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
> > ID to the driver list of supported devices.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>  
> 
> This should probably go through trivial patches ML, no ?

Nope, it should go through the spi-nor tree. Actually, even for trivial
fixes like typos, I prefer to take them directly to avoid possible
future conflicts in case something changes near the typo.

> Also, CC Stable.

Why? It's adding a new entry in pci_ids[] table, it looks like
supporting new HW to me, not fixing a bug.

Regards,

Boris

> 
> > ---
> >  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
> > index c0976f2e3dd1..872b40922608 100644
> > --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> > +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> > @@ -65,6 +65,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
> >  static const struct pci_device_id intel_spi_pci_ids[] = {
> >  	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
> >  	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
> > +	{ PCI_VDEVICE(INTEL, 0x34a4), (unsigned long)&bxt_info },
> >  	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
> >  	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
> >  	{ },
> >   
> 
> 
