Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuwTc-00052W-5K
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 09:09:25 +0000
Date: Wed, 29 Aug 2018 12:09:09 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
Message-ID: <20180829090909.GU2283@lahna.fi.intel.com>
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
 <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
 <20180828165959.GG2283@lahna.fi.intel.com>
 <39875af1-731d-a5b7-7b10-13701b913751@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39875af1-731d-a5b7-7b10-13701b913751@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 28, 2018 at 09:20:17PM +0200, Marek Vasut wrote:
> On 08/28/2018 06:59 PM, Mika Westerberg wrote:
> > On Tue, Aug 28, 2018 at 06:56:38PM +0200, Marek Vasut wrote:
> >> On 08/28/2018 06:50 PM, Mika Westerberg wrote:
> >>> Intel Ice Lake exposes the SPI serial flash controller as a PCI device
> >>> in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
> >>> ID to the driver list of supported devices.
> >>>
> >>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >>
> >> This should probably go through trivial patches ML, no ?
> > 
> > Hmm, what do you mean? This is not a typo fix or similar but adds a new
> > PCI ID to the driver.
> 
> I mean, adding PCI IDs might be considered trivial. But if you want it
> to go through MTD, fine:
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>

Thanks!
