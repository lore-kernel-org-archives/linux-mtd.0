Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8c9k-00066b-9F
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 18:45:41 +0000
Date: Fri, 16 Mar 2012 19:43:45 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
Message-ID: <20120316184345.GF10228@parrot.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4F636964.3030904@newsguy.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 16, 2012 at 04:25:08PM +0000, Mike Dunn wrote:
> 
> Maybe my (admittedly limited) understanding of the physical nature of NAND flash
> is flawed.  I assumed that a writesize region (i.e., a NAND page for our
> purposes) is the most elemental unit wrt physical wear, regardless of whether or
> not ecc is caclulated once for the whole page or incrementally in steps.
> 
> 
> > 
> > In both cases, you will compare the same value 4 to mtd->bitflip_threshold (16)
> > and decide to return 0 (and not -EUCLEAN).
> > 
> > So my point is that the cleaning decision happens at the ecc step level,
> > not at the page reading level.
> 
> 
> But you're sayimg my assumption is incorrect.  So each ecc-sized area within a
> page is physically distinct and must be considered in isolation?  Could you
> maybe elaborate on this?

When NAND manufacturers specify ECC requirements in their datasheet, they indicate:
- a block size on which ECC should be computed (possibly smaller than the page size)
- how many errors should be correctable in a single block size, i.e. strength

For instance:
- size = 512 bytes
- strength = 8 errors

If the NAND device has 2 kB (resp. 4kB) pages, you will need to perform 4 (resp. 8) ECC
computations per page.

The point of implementing the specified ECC is to ensure the integrity of data for the
specified lifetime, i.e. its longevity.

Manufacturers select an ECC size/strength setup for a device purely from statistical
computations or empirical results: there is no "special" physical ecc-sized area in each
page. It's just that the error distribution empirically observed is well covered by the
specified size/strength combination. You could perfectly protect your NAND device using
a different size/strength combination, with different longevity results.
The manufacturer size/strength recommendation takes also into account the available spare
space and ECC computational requirements.

As a matter of fact, NAND manufacturers run write/read cycle aging tests in ovens, and
measure how fast data corruption happens, assuming various protection schemes: no ECC,
1-bit ECC/512, 2-bit ECC/512, and so on. Google "NAND UBER" for more details (UBER =
Uncorrectable Bit Error Rate).

Now, the point of scrubbing a block is to avoid error accumulation to the point when
ECC is no longer able to correct all errors. This is why we must monitor each single
ecc step rather than consider the total amount of errors corrected in a page.

BR,
-- 
Ivan
