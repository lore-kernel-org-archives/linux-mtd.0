Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8VDx-0005Ko-Ml
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 11:21:34 +0000
Date: Fri, 16 Mar 2012 12:19:39 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
Message-ID: <20120316111939.GA10362@parrot.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
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

On Thu, Mar 15, 2012 at 05:25:50PM +0000, Mike Dunn wrote:
> 
> This patchset addresses the problem of insufficient information being returned
> by mtd_read() and mtd_read_oob() with regard to bit error corrections.
> Currently -EUCLEAN is returned if one or more bit errors were corrected during
> the course of the read operation.  Higher layers like UBI use this return code
> as an indication that the erase block may be degrading and should be considered
> as a candidate for being marked as a bad block.  The problem is that high bit
> error rates are common on more recent NAND flash devices, which these devices
> compensate for by using strong ecc algorithms.  Frequent (but entirely normal)
> bit error corrections on these devices result in blocks being incorrectly marked
> as bad.  On some devices, ubi/ubifs can not be reliably used because of this.
> 
> This problem was discussed a while back [1][2][3], and a consensus of sorts was
> reached for a solution, which these patches implement.  The recent addition of
> the mtd api entry functions now make this solution practical (thanks Artem!).
> These patches are on top of those which added ecc_strength to mtd_info and had
> the drivers initialize it.  (Those patches have already been pushed.)  A quick
> description of each patch will provide a synopsis of the patchset:
> 
> (1) The struct mtd_info element 'ecc_strength' is exposed through sysfs as a
>     read-only variable.
> 
> (2) The element 'bitflip_threshold' is added to struct mtd_info.  If the driver
>     leaves this uninitialized, mtd sets it to ecc_strength when the device or
>     partition is registered.  This element is also exposed for reading and
>     writing from userspace through sysfs.
> 
> (3) The drivers' read methods, absent an error, return a non-negative integer
>     indicating the maximum number of bit errors that were corrected in any one
>     writesize region.  MTD returns -EUCLEAN if this is >= bitflip_threshold, 0
>     otherwise.
> 
> So basically, the meaning of -EUCLEAN is changed from "one or more bit errors
> were corrected", to "a dangerously high number of bit errors were corrected on
> one or more writesize regions".  By default, "dangerously high" is interpreted
> as ecc_strength.  Drivers can specify a different value, and the user can
> override it if more or less caution regarding data integrity is desired.

Hello Mike,

Thanks a lot for working on this long needed feature!

I haven't had the chance to work on mtd stuff for a very long time, but I'll try
at least to review your work.
>From your quick description, I fear there may be a design problem: with
'ecc_strength' and 'bitflip_threshold' defined on a per writesize region basis, I
think you cannot provide upper layers with enough information regarding the
block cleaning decision.

Consider the following situation:
- a NAND device with 2kB pages and 4 ecc steps per page (4 x 512 bytes)
- the driver has chip->ecc.strength = 4, and therefore mtd->ecc_strength = 16
- let's say mtd->bitflip_threshold = 16

The driver read() method could return a non-negative integer, say 4, in at least
the following cases:

1. During a single page read, each of the 4 ecc steps corrected 1 bit, with a
total variation of ecc_stats.corrected equal to 4.
=> no cleaning needed

2. During a single page read, 1 ecc step corrected 4 bits, the 3 other steps had
no correction to perform, with a total variation of ecc_stats.corrected equal
to 4.
=> cleaning is needed

In both cases, you will compare the same value 4 to mtd->bitflip_threshold (16)
and decide to return 0 (and not -EUCLEAN).

So my point is that the cleaning decision happens at the ecc step level,
not at the page reading level.

I think this could be fixed by dropping 'ecc_strength' and changing the semantics
of 'bitflip_threshold' in the following way (rephrasing your explanation):

  (3) The drivers' read methods, absent an error, return a non-negative integer
      indicating the maximum number of bit errors that were corrected in any one
      ecc step.  MTD returns -EUCLEAN if this is >= bitflip_threshold, 0
      otherwise.

  So basically, the meaning of -EUCLEAN is changed from "one or more bit errors
  were corrected", to "a dangerously high number of bit errors were corrected on
  one or more ecc step block".  By default, "dangerously high" is interpreted
  as chip->ecc.strength.  Drivers can specify a different value, and the user can
  override it if more or less caution regarding data integrity is desired.

But still, there is a problem: how do we implement (3), i.e. how do we know
"the maximum number of bit errors that were corrected in any one ecc step" ?

Just looking at ecc_stats.corrected is not enough, as it accumulates over each
ecc step result, and does not allow us to distinguish cases 1 and 2 (from my
previous example). Maybe we could have per-step ecc stats ? or have the driver
return directly the information ?

BR,

--
Ivan
