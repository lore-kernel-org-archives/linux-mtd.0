Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Zxx-0006Pm-0C
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 16:25:21 +0000
Message-ID: <4F636964.3030904@newsguy.com>
Date: Fri, 16 Mar 2012 09:25:08 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com>
In-Reply-To: <20120316111939.GA10362@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

Hi Ivan.  Thanks for the review!

On 03/16/2012 04:19 AM, Ivan Djelic wrote:
> 
> Consider the following situation:
> - a NAND device with 2kB pages and 4 ecc steps per page (4 x 512 bytes)
> - the driver has chip->ecc.strength = 4, and therefore mtd->ecc_strength = 16
> - let's say mtd->bitflip_threshold = 16
> 
> The driver read() method could return a non-negative integer, say 4, in at least
> the following cases:
> 
> 1. During a single page read, each of the 4 ecc steps corrected 1 bit, with a
> total variation of ecc_stats.corrected equal to 4.
> => no cleaning needed
> 
> 2. During a single page read, 1 ecc step corrected 4 bits, the 3 other steps had
> no correction to perform, with a total variation of ecc_stats.corrected equal
> to 4.
> => cleaning is needed


Maybe my (admittedly limited) understanding of the physical nature of NAND flash
is flawed.  I assumed that a writesize region (i.e., a NAND page for our
purposes) is the most elemental unit wrt physical wear, regardless of whether or
not ecc is caclulated once for the whole page or incrementally in steps.


> 
> In both cases, you will compare the same value 4 to mtd->bitflip_threshold (16)
> and decide to return 0 (and not -EUCLEAN).
> 
> So my point is that the cleaning decision happens at the ecc step level,
> not at the page reading level.


But you're sayimg my assumption is incorrect.  So each ecc-sized area within a
page is physically distinct and must be considered in isolation?  Could you
maybe elaborate on this?


> 
> I think this could be fixed by dropping 'ecc_strength' and changing the semantics
> of 'bitflip_threshold' in the following way (rephrasing your explanation):
> 
>   (3) The drivers' read methods, absent an error, return a non-negative integer
>       indicating the maximum number of bit errors that were corrected in any one
>       ecc step.  MTD returns -EUCLEAN if this is >= bitflip_threshold, 0
>       otherwise.
> 
>   So basically, the meaning of -EUCLEAN is changed from "one or more bit errors
>   were corrected", to "a dangerously high number of bit errors were corrected on
>   one or more ecc step block".  By default, "dangerously high" is interpreted
>   as chip->ecc.strength.  Drivers can specify a different value, and the user can
>   override it if more or less caution regarding data integrity is desired.
> 
> But still, there is a problem: how do we implement (3), i.e. how do we know
> "the maximum number of bit errors that were corrected in any one ecc step" ?
> 
> Just looking at ecc_stats.corrected is not enough, as it accumulates over each
> ecc step result, and does not allow us to distinguish cases 1 and 2 (from my
> previous example). Maybe we could have per-step ecc stats ? or have the driver
> return directly the information ?


Yes, this will require more work, touching many drivers :(  The per-page stats
allowed me to limit most of the changes to nand_base.c.

If you are correct about the need to consider each ecc-sized region separately,
then these patches are actually a regression, since a "dangerously high" number
of bitflips will be considered OK, as your example illustrates.

Thanks again.

Mike
