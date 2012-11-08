Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWXKL-0000P5-5c
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 18:59:46 +0000
Date: Thu, 8 Nov 2012 19:59:42 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Christopher Harvey <charvey@matrox.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121108185942.GC28118@parrot.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20121108152125.GR2389@harvey-pc.matrox.com>
Cc: "stefan.bigler@keymile.com" <stefan.bigler@keymile.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gerlando Falauto <gerlando.falauto@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2012 at 03:21:25PM +0000, Christopher Harvey wrote:
(...) 
> We had BCH8 code running, but it wasn't enough. The main reason we
> switched away from host side ECC was because we were getting bitflips
> within the ECC codeword data itself.

But the ECC bytes are part of the BCH codeword, therefore I don't understand
what the issue could be ? Are you sure bitflips were not in some unprotected
OOB area ?

 Yes, it would have been possible
> to add a 1 byte hamming code to protect the main ECC data, but it was
> just easier to say, "hey, Micron knows their hardware, so we'll trust
> their algorithms", and enable the Micron ECC hardware. Although it
> didn't require too much work to enable it's all a total hack. I took
> the code that runs the "ECC disabled mode", and sprinkled in some
> extra init code and error checking code. Would be nice to add an
> "external ecc mode" to support these chips explicitly.
> 
> > Support for software-based multiple-bit-resilient ECC mechanism (BCH) 
> > was posted (http://lwn.net/Articles/426856/) by Ivan Djelic (which I 
> > took liberty to Cc:) and merged in March last year.
> > I haven't been able to track how the situation evolved, but apparently 
> > you need to enable it (in addition to within the kernel configuration), 
> > also within your flash controller setup.
> > Micron gives an example of how to enable it on a sample NAND host 
> > controller S3C6410 in this TN (rest of the code, mainly from the above 
> > patch, would be already present in recent kernels):
> > http://www.micron.com/~/media/Documents/Products/Technical%20Note/NAND%20Flash/tn2971_software_bch_ecc_on_linux.pdf 
> 
> I haven't looked into current software ECC algorithms in the
> kernel. Do the protect against corrupted ECC data? As in, corruptions
> in the out of bounds area?

Yes, BCH ECC works by generating a codeword containing data+ecc bytes.
Errors can be detected and corrected in any location of the codeword (data and ecc).
Note that in practice, we are interested in actually fixing errors in data only (not ecc).
When an error is detected in ECC bytes, it must simply be reported to trigger block scrubbing.

The current software BCH implementation in MTD protects the page data area (and ecc bytes).
It does not protect additional bytes in the OOB area (like the Micron on-die ECC does),
but since the BCH library is not limited to any particular size, a simple patch could achieve this.
 
BR,
-- 
Ivan
