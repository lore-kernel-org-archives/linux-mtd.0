Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lou3Z-0002fF-Ed
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 06:36:20 +0000
From: David Brownell <david-b@pacbell.net>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Date: Tue, 31 Mar 2009 23:36:10 -0700
References: <200903260042.42091.david-b@pacbell.net>
	<200903312021.25165.david-b@pacbell.net>
	<a95a62fe0903312149j482c1684k564896e1981f9819@mail.gmail.com>
In-Reply-To: <a95a62fe0903312149j482c1684k564896e1981f9819@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200903312336.10440.david-b@pacbell.net>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 31 March 2009, Kevin Cernekee wrote:
> On 3/31/09, David Brownell <david-b@pacbell.net> wrote:
> >> 2) region_info_user fields?  Not really sure how this would work.
> >> Maybe a separate subdirectory for each region?
> >
> > I'm not sure I've ever had reason to care about a "region" (whatever
> > that is!) with MTD hardware.
> 
> Erase Block Regions.  From the CFI spec:
> 
> ...
> 
> This is fairly common on parallel NOR devices.  Probably less so on
> huge NAND devices.

Oh, that.  Right.  Few new boards I've seen in the past few
years have NOR; it's mostly NAND nowadays.  That gets mixed
up with bootblocks too ... as in, store u-boot parameters in
a 4K erase block (surrounded by u-boot code) instead of some
dedicated 128K block that's almost entirely unused.


> > I suspect that a lot of interesting questions could come up in
> > the context of enhancing mtd-utils to work with sysfs and bigger
> > NAND chips.  Some might relate to "regions".
> 
> Right, this sysfs requirement raises a number of issues that need to
> be fully thought out in order to make sure the new interface is a
> suitable replacement for the "INFO" ioctls.

Hmm, it's the same as the *current* sysfs model for chardevs, except
that (a) it's there even if chardevs aren't, (b) it supports proper
parent devices, and (c) it adds attributes.  So in that sense maybe
that's not the best question to ask.

Maybe you should ask a slightly different question:  what's the right
interface to build using sysfs?  Certainly let the answers be illuminated
by what current tools can do.

I suspect answering that revised question will lead to a desire for
more driver model update, exposing concerpts beyond just raw MTDs.


> For instance: 
> 
> 1) If each region is a subdirectory, are user programs supposed to use
> readdir() to count them?  Is ioctl(MEMGETREGIONCOUNT) still the
> preferred method?  Or do we make a new "regioncount" sysfs attribute?

Model-wise, it might make sense to export chips (potentially
concatentated) with their regions, as distinct from partitions.

That notion doesn't show up all that cleanly in the framework,
thoug it might be good to add it.


> (A somewhat related question is whether MEMGETREGIONCOUNT only exists
> because it was impossible to expand the MEMGETINFO struct.  After all,
> it's just copying another field from the mtd_info struct.)

There are folk who are rabidly in favor of the "one value
per attribute" model, but I've never seen that as compelling.
A "regions" attribute, with versioned header (field labels?)
and one line per region, would be a natural model for any
interface that didn't get waylaid by religious fervor.

But ... not my call.


> 2) How are user programs expected to access MTD sysfs?  Do we
> introduce a new libsysfs dependency, or roll our own implementation?
> Are there any past examples of ioctls being phased out in favor of
> sysfs, particularly in subsystems that are popular on embedded
> platforms?

I thought the idea was not to use libsysfs...
 

> 3) What should the mtd-utils changes look like?  Do we define
> backward-compatibility wrapper functions that try to work the same way
> the ioctls used to?  New libraries and layers of abstraction?  Or
> something in the middle?

Up to mtd-utils maintainers.  I'd expect some period of backward
compatibility would be required.  The "carrot" might be that new
support for 4+ GB chips/partitions might depend on sysfs, while
smaller chips can be supported without it (using existing tools).
