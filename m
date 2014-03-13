Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WODMk-0000ND-OY
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 21:40:39 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: computersforpeace@gmail.com (Brian Norris)
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
Date: Thu, 13 Mar 2014 17:32:02 -0400
Message-ID: <87bnx9eqel.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 11 Mar 2014, Brian Norris wrote:

> Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
> will return all 1's (0xff). However, modern NAND (MLC, and even some
> SLC) experience bitflips in unprogrammed pages, and so they may not read
> back all 1's. This is problematic for drivers whose ECC cannot correct
> bitflips in an all-0xff page, as they will report an ECC error
> (-EBADMSG) when they come across such a page. This appears to UBIFS as
> "corrupt empty space".

> Several others [1][2] are attempting to solve this problem, but none is
> generically useful, and most (all?) have subtle bugs in their reasoning. Let's
> implement a simple, generic, and correct solution instead.

> To handle such situations, we should implement the following software
> workaround for drivers that need it: when the hardware driver reports an
> ECC error, nand_base should "verify" this error by

> * Re-reading the page without ECC
> * counting the number of 0 bits in each ECC sector (N[i], for i = 0, 1,
> ..., chip->ecc.steps)
> * If any N[i] exceeds the ECC strength (and thus, the maximum allowable
> bitflips) then we consider this to be an uncorrectable sector.
> * If all N[i] are less than the ECC strength, then we "correct" the
> output to all-0xff and report max-bitflips appropriately

One issue is that a raw read will never see 'stuck at one' errors.  I
believe that Elie had a good diagnosis of the issue,

> 3. I read something but failed to correct it.
> The third case can have two causes:
> 3.a you read valid data with bitflips exceeding what the BCH could
>   correct
> 3.b you read an erased page with bitflips.

For 3.b, the permitted value of bitflips should probably be based on the
flash device and not the ECC controller.  If the chip is giving bit
flips on an SLC NAND device, do we wish to continue on 3.b?  I believe
that maybe only some MLC NAND devices might want to permit this.  If the
conclusion is that this is an erased page, then someone is going to write
to it and possibly then see 'stuck at one' issues.  At first glance,
using the ECC strength seems correct, but I don't think that this is
simple data correction in this case.

Another issue is that the management of flash is not at the MTD layer.
The other layers general know when a sector is erased.  There is no hint
ever given to the MTD driver.  For instance, many drivers implement
sub-pages by doing a full page read followed by a sub-page write, where
just the sub-page data is updated in the originally read page.  If this
is happening multiple times (read page w ECC, read page w/o ECC, write
page), the performance to write a sub-page in a known erased sector
could be pretty horrid.  This maybe a fairly common case.

So, I think this statement,

> Obviously, this sequence can be compute intensive if applied heavily.
> Ideally, MTD users should not need to read un-programmed pages very
> often and would require this software check, for instance, only during
> attach/mount checks or certain recovery situations.

... is not quite correct.  It seems common for some upper layers to ask
to read erased data during normal operation?  Or the only MTD drivers I
have looked at have sub-page handling broken and need to fixing.

If this happens only at boot, then I don't think people would be as
concerned about performance.

See: 
 http://git.infradead.org/linux-mtd.git/blob/HEAD:/drivers/mtd/nand/fsmc_nand.c#l800

for another driver which is doing this check.  I think you are right to
ask for an generic API solution to this issue.  However, I believe we
only need to determine whether it is an all xff page or an erased page.
If an upper layer gave a hint that this page is 'known to be written',
then this could be avoided.  I don't think we have such hints?

Fwiw,
Bill Pringlemeir.
