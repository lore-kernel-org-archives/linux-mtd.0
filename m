Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7H7p-0005hr-3J
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 09:37:55 +0000
Date: Tue, 2 Oct 2018 11:37:31 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Daniel Mack
 <daniel@zonque.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20181002113731.21e16ba5@bbrezillon>
In-Reply-To: <20181002113610.380abf9c@bbrezillon>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
 <20181002001328.7f64ecbc@bbrezillon>
 <b98170dbd30541d8aa5b51be7efe850d@svr-chch-ex1.atlnz.lc>
 <20181002113610.380abf9c@bbrezillon>
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

On Tue, 2 Oct 2018 11:36:10 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Mon, 1 Oct 2018 22:15:28 +0000
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> 
> > On 02/10/18 11:13, Boris Brezillon wrote:  
> > > On Mon, 1 Oct 2018 22:01:27 +0000
> > > Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> > >     
> > >> On 02/10/18 10:41, Boris Brezillon wrote:    
> > >>> On Mon, 1 Oct 2018 22:34:38 +0200
> > >>> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > >>>           
> > >>>>>
> > >>>>> I'd previously tried readl() based on the same hunch. No change.
> > >>>>>
> > >>>>> I think my snippet above might be misleading. While a delay between
> > >>>>> readl_relaxed() and the if should not change the outcome, this is also a
> > >>>>> delay between marvell_nfc_enable_int() and marvell_nfc_disable_int()
> > >>>>> which is probably more significant. Sure enough if I move the delay to
> > >>>>> just before the marvell_nfc_disable_int() the error is not seen.    
> > >>>>
> > >>>> AFAICT, your timeout always happens when waiting for RDREQ, not RDYM.
> > >>>> So maybe disabling MRDY too early has a side-effect on the RDREQ event.    
> > >>>
> > >>> Can you try with this patch [1]? It should ensure that NDSR_RDY bits
> > >>> are cleared before starting an operation.
> > >>>
> > >>> [1]http://code.bulix.org/lgs30c-468205
> > >>>        
> > >>
> > >> No luck. I applied that on top of Daniel's and got the same result.
> > >>
> > >> One thing that does look promising is the following modification of
> > >> Daniel's patch[1]. Which moves the RDY check to before where the
> > >> interrupts are enabled.    
> > > 
> > > Except we still don't know why this is happening, and I'm not sure I
> > > want to take a fix without understanding why it does fix the problem.    
> > 
> > Agreed. My only guess is that there is some interrupt that is missed in 
> > the short period they are disabled when calling complete().  
> 
> Disabling interrupts when taking a spinlock means masking the IRQ line,
> but the interrupt still exists and should be there when linux unmasks
> the IRQ line. I don't think this is the problem we're chasing.
> 
> Looks more like something 

Please ignore this email, I inadvertently hit the send button on a
draft I started yesterday :-)
