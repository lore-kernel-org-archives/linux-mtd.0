Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYeXo-0007QD-1m
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 16:10:57 +0000
Date: Tue, 22 Oct 2013 18:10:28 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: How to handle ECC in erased pages?
Message-ID: <20131022161028.GA10922@parrot.com>
References: <alpine.DEB.2.00.1310221610570.28562@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1310221610570.28562@lnxricardw.se.axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 22, 2013 at 04:58:09PM +0200, Ricard Wanderlof wrote:
> 
> When erasing a page in a NAND flash all the bits are erased to ones
> so all bytes are 0xff . This presents a potential problem with the
> ECC, in that if the ECC for an all-ff block of data is not itself
> all-ff, there will be ECC errors when reading an erased page.
> 
> This is handled in the software Hamming and BCH cases by XOR masking
> the ECC with a bitmask such that the ECC of an erased block of data
> is in fact all-ff.
> 
> In some cases however, there are hardware NAND flash controllers
> with built-in ECC generation and management, i.e. the controller
> writes the ECC to the OOB automatically when writing a page, and
> automatically corrects potential bit errors using the ECC stored in
> the OOB when reading. In this case there is no way to influence the
> actual ECC bits written to the flash.
> 
> I've come across such a controller, which in fact does return an ECC
> error for an erased page. I'm trying to figure out a reasonable way
> to deal with this. The first step would be to verify that the page
> indeed is erased if it supposed to be, but that is compounded by the
> fact that bitflips could occur in an erased page, so that the data
> in fact is not all-ff when it should be, but should still be
> considered 'erased', because assuming that ECC were properly
> applied, this case would be handled transparently.
> 
> One existing case I've come across while looking through the
> existing NAND flash drivers is denali.c which when it detects an
> uncorrectable ECC error, scans the whole data and spare areas of the
> page for an all-ff condition - this would fail if there were in fact
> a bit flip.
> 
> davinci_nand.c uses an XOR mask for 1 bit ECC, but checks the ECC
> for an all-ff condition, deciding that the page is erased if that is
> the case. Again this ignores the problem of a bit flip in the ECC
> data area of an erased page.
> 
> fmsc_nand.c when encountering a page with more errors that the
> correction algorithm can handle (BCH-8 in this case), counts the
> number of 0 bits in the main and spare areas of the page; if the
> number of 0 bits is less than 8 it considers the page erased. This
> would seem to be the most correct approach so far, but requires
> quite a lot of work (i.e. scanning through all bytes in the page) in
> order to accomplish this.
> 
> One thing I was considering was if when using UBI and ubifs erased
> blocks are read at all in normal operation. In fact this doesn't
> seem to be the case; once the partition has been formatted and/or
> mounted UBI doesn't need to do any scanning operations on the data.
> I did a quick empirical test by adding a printk in
> nand.c:nand_read_page_swecc() when an empty page is read, the
> 'reading blank page' printk was triggered during mount for a couple
> of pages (probably while reading the index pages for UBI), but not
> afterwards, until the file system started to fill up, when I assume
> some form of garbage collection was being trigged. Writing a big
> file to a new ubifs volume didn't cause any blank page printouts
> except for the ones occurring during mount.'
> 
> All in all it seems then that the performance penalty of explicitly
> checking pages that are supposedly erased would be rather small,
> because it is not done very often.
> 
> Any other thoughts on this?

Hi Ricard,

Here are a few additional strategies, depending on the information
provided by your hardware controller:

1. You have access to hardware-calculated ECC bytes

Upon ECC failure, you can compare calculated ECC bytes with the known
ECC sequence of an erased page. If they match, and spare ECC bytes are
all-ff (with a limited number of bitflips allowed), then you can assume
the page is erased and just ignore the ECC failure. If those conditions
are not met, you still need to check the entire erased page for bitflips.
This is quite efficient, because as you said erased pages are not read
very often, an even then, only erased pages with bitflips are checked.

2. You do not have access to hardware-calculated ECC bytes

Upon ECC failure, you need to distinguish programmed pages from erased
pages. You can do so efficently by comparing spare ECC bytes with an
all-ff sequence, allowing a limited number of bitflips. But what if an
all-ff sequence with a few bitflips happens to be a valid ECC sequence
of your hardware controller ? One possible robustness improvement is to
use one or several available spare bytes as a "programmed page" marker.
This idea is to always program those marker bytes to 0; reading back the
marker (againg with a bitflip tolerance) allows to distinguish programmed
pages from erased pages. This trick is used on some NAND devices with
on-die ECC; such devices do not attempt to correct bitflips if the marker
bytes indicate an erased page.

There are other similar tricks which you can use, depending on your hardware
controller features.
Hope this helps,
BR,
--
Ivan
