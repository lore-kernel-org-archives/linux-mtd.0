Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZQuj-0005Lx-Gd
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 17:08:30 +0000
Date: Wed, 22 Jun 2011 19:07:47 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: Preventing JFFS2 partial page writes?
Message-ID: <20110622170747.GC25928@parrot.com>
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>
	<4E020A36.6070708@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4E020A36.6070708@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 22, 2011 at 04:28:54PM +0100, Peter Barada wrote:
(...)
> 
> I'm thinking a new ioctl (and data in the kernel accessible to the NAND 
> FS layers) is needed (GETOOBLAYOUT?) that returns the oobfree array, as 
> well as other arrays in a structure:
> 1) which OOB bytes perturb the data ECCs,
> 2) which OOB bytes are ECC'd (within the OOB area and separate from the 
> data ECCs).
> 
> I think given the new large-sized NAND that these lists will have to be 
> dynamic (and another GETOOBLAYOUTSIZE ioctl call to return its size) to 
> prevent moving massive structure to userspace).
> 
> Then userspace can figure out:
> 
> 1) what bytes can be written in the OOB.
> 2) what bytes in the OOB can only be written as part of a data write (or 
> sub-page write)
> 3) if no OOB bytes are internally ECC'd(outside of those covered by a 
> data area ECC) then the code needs to either use an ECC as part of the 
> data written to the OOB, or use a bitflip-friendly way to compare the 
> returned data - unless the OOB data it wants to write is part of a data 
> area write.
> 
> In my initial attempt to solve this I ran into the issue (in 
> linux-2.6.32) that nand_transfer_oob/nand_fill_oob make the assumption 
> that chip->ecc.layout->oobfree is *always* zero terminated (I needed 
> eight entries to describe my OOB area).  I'll put together a patch 
> against the latest kernel and send it along.
> 
> Thoughts?

On one hand it sure would be nice (and a bit complicated) to accurately
describe OOB write constraints, for easier JFFS2/YAFFS2 integration.
On the other hand, I am not sure such a complication is really worth the
trouble, given that on next nand generation:
- OOB areas will not be usable anymore for metadata storage (8-bit ecc leaves
  only 6 spare bytes out of 64)
- partial writes will probably be limited to 1 (like in MLC), meaning that
  JFFS2 clean marking step will be forbidden anyway
Furthermore, userspace will probably need to handle case 3) anyway (no
protected oob bytes) to stay portable...

--
Ivan
