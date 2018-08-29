Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuxmn-00027N-LW
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 10:33:22 +0000
Date: Wed, 29 Aug 2018 12:33:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
Message-ID: <20180829123306.3e9928a4@bbrezillon>
In-Reply-To: <57933711d93f3ba372ca14743daa90df834ed494.camel@infinera.com>
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
 <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
 <20180829111740.12223549@bbrezillon>
 <57933711d93f3ba372ca14743daa90df834ed494.camel@infinera.com>
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

On Wed, 29 Aug 2018 10:28:05 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> On Wed, 2018-08-29 at 11:17 +0200, Boris Brezillon wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > Hi Marek,
> > 
> > On Tue, 28 Aug 2018 18:56:38 +0200
> > Marek Vasut <marek.vasut@gmail.com> wrote:
> >   
> > > On 08/28/2018 06:50 PM, Mika Westerberg wrote:  
> > > > Intel Ice Lake exposes the SPI serial flash controller as a PCI device
> > > > in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
> > > > ID to the driver list of supported devices.
> > > > 
> > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>  
> > > 
> > > This should probably go through trivial patches ML, no ?  
> > 
> > Nope, it should go through the spi-nor tree. Actually, even for trivial
> > fixes like typos, I prefer to take them directly to avoid possible
> > future conflicts in case something changes near the typo.
> >   
> > > Also, CC Stable.  
> > 
> > Why? It's adding a new entry in pci_ids[] table, it looks like
> > supporting new HW to me, not fixing a bug.  
> 
> So you can boot/use new HW with stable kernels. Stable kernels would become
> useless fairly quickly otherwise.
> HW enablement patches are OK when they don't affect existing HW by much.

Where did you get that from? I've always been told that Cc-ing stable
was reserved for bug fixes.
