Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g76Rq-0003ls-3F
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 22:13:54 +0000
Date: Tue, 2 Oct 2018 00:13:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Daniel Mack <daniel@zonque.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20181002001328.7f64ecbc@bbrezillon>
In-Reply-To: <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
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

On Mon, 1 Oct 2018 22:01:27 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On 02/10/18 10:41, Boris Brezillon wrote:
> > On Mon, 1 Oct 2018 22:34:38 +0200
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> >      
> >>>
> >>> I'd previously tried readl() based on the same hunch. No change.
> >>>
> >>> I think my snippet above might be misleading. While a delay between
> >>> readl_relaxed() and the if should not change the outcome, this is also a
> >>> delay between marvell_nfc_enable_int() and marvell_nfc_disable_int()
> >>> which is probably more significant. Sure enough if I move the delay to
> >>> just before the marvell_nfc_disable_int() the error is not seen.  
> >>
> >> AFAICT, your timeout always happens when waiting for RDREQ, not RDYM.
> >> So maybe disabling MRDY too early has a side-effect on the RDREQ event.  
> > 
> > Can you try with this patch [1]? It should ensure that NDSR_RDY bits
> > are cleared before starting an operation.
> > 
> > [1]http://code.bulix.org/lgs30c-468205
> >   
> 
> No luck. I applied that on top of Daniel's and got the same result.
> 
> One thing that does look promising is the following modification of 
> Daniel's patch[1]. Which moves the RDY check to before where the 
> interrupts are enabled.

Except we still don't know why this is happening, and I'm not sure I
want to take a fix without understanding why it does fix the problem.

Also, it looks like complete() is not called until the RDDREQ, WRDREQ
and WRCMDREQ are cleared in the interrupt handler [1], which is weird.
Miquel, do you happen to remember why you had to do that?

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/raw/marvell_nand.c?h=v4.19-rc6#n689
