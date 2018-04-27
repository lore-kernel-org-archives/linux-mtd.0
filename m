Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fC2C8-0002gx-Vl
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 12:09:47 +0000
Date: Fri, 27 Apr 2018 14:09:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@saleconix.be>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>, Richard Weinberger
 <richard@nod.at>, Han Xu <han.xu@nxp.com>, sam.lefebvre@essensium.com
Subject: Re: optimizing the nand read performance by reducing interrupts
 from 4 to 1
Message-ID: <20180427140916.459f76ab@bbrezillon>
In-Reply-To: <9ab9b851-a8bf-f783-b5e9-998950b47900@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
 <20180426182843.02f60425@bbrezillon>
 <9ab9b851-a8bf-f783-b5e9-998950b47900@essensium.com>
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

Hi Sam,

On Fri, 27 Apr 2018 12:27:49 +0200
Sam Lefebvre <sam.lefebvre@saleconix.be> wrote:

> > Are there any changes in this version? I don't see a changelog and the
> > version number has not been incremented.  
> 
> Until now we did not used version numbers. Because of time limitation
> patches have been reordered and limited in such way that:
> 
> Patches 1-9 will be probably accepted.
> Patches 10-13 is a solution for nand read performance improvement,
> may be possibly not accepted upstream but can be useful for somebody
> who want to use it in the future.

How does that prevent you from adding a version number to the patch
series? It's as easy as passing "-vX" to your git format-patch command
(where X is the version number of the patch series), and it helps
maintainers keeping track of various versions of the patchset.

> 
> > Also, I nacked this patch in my previous review, so I'm not going to
> > accept it now, unless you have strong arguments to convince me.  
> 
> I will remember that these patches are based on your mail of march 5,
> 2018 where you suggested to reduce the number of interrupts in the
> current implementation.

I certainly never told you to implement ->cmdfunc(). Just quoting my
answer to your private email for the record:

"
Before you even consider these options I'd recommend reworking the
gpmi_ecc_read_page() function to avoid splitting things in 2 distinct
calls:

1/ nand_read_page_op()
2/ gpmi_ecc_read_page_data()

#1 is responsible for 2 DMA interrupts (READ0+ADDR and READ_START PIO
xfers), and #2 is responsible for the last DMA interrupt (READ_DATA PIO
xfer) + the BCH interrupt. I think you could turn this into a single
interrupt by chaining the READ0+ADDR+READ_START+WAITREADY+DATA_IN
instructions, wait for DMA completion and then poll the BCH status
instead of using interrupts (assuming BCH calculation does not take too
long).
"

Don't know where you see any mention of cmdfunc() in there, and I
actually suggested what I'm suggesting today, that is, implementing the
optimization in gpmi_ecc_read_page().

> Due to budgetary constraints, today is the
> last day we are able to work on it in terms of this project.

That won't convince me, quite the opposite actually. If the goal is to
send the current status so that other people can take over this work,
then that's fine, but don't expect me to accept the patches as-is.

> 
> Some measurements showed:
> Reduction of 10% boot time on quad core.
> Reduction of 3% boot time on dual lite.

That's a nice improvement, indeed, but still not a good reason to take
the patches, especially since I proposed 2 alternatives, "->exec_op()"
or "gpmi_ecc_read_page() optim", and I'm almost sure the 2nd one is
even less invasive than re-implementing your own cmdfunc().

Regards,

Boris
