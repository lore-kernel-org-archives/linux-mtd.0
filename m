From: icampbell@arcom.com (Ian Campbell)
Date: 12 Feb 2003 14:50:26 +0000
Subject: PATCH: add an mtd device at a particular minor number
In-Reply-To: <20030212142211.GA18753@wohnheim.fh-wedel.de>
References: <1045056666.31625.44.camel@linuxdev.icampbell.arcom.cc>
 <20030212142211.GA18753@wohnheim.fh-wedel.de>
Message-ID: <1045061426.29282.130.camel@linuxdev.icampbell.arcom.cc>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-12 at 14:22, J?rn Engel wrote:
> On Wed, 12 February 2003 13:31:06 +0000, Ian Campbell wrote:
> > 
> > I sent this last week but it appears to have gone unnoticed.
> 
> This happens all too often. Seems like noone has found a sponsor to do
> mtd support fulltime yet. :|
> 
> > This patch adds a function add_mtd_device_full which works the same as
> > add_mtd_device except it allows you to request a particular minor number
> > for the new device.
> > 
> > I wanted this because on our boards we have Flash, SRAM and BIOS all
> > accessible via MTD, unfortunately the minor number of the SRAM and BIOS
> > devices can change depending on how many partitions exist in the main
> > Flash, and the BIOS minor number can additionally change depending on if
> > the board has SRAM fitted or not etc. I would much prefer to be able to
> > say that SRAM would always be mtd14 and BIOS would be mtd15.
> 
> Interesting idea, but not completely new. More than a year ago, I did
> a big overhaul of the partitioning code that added this functionality,
> among other things.
> The main point was to create a device/partition hierarchy so that
> adding/removing some partitions on one device doesn't affect other
> devices. This should be an even better fix to your problem.
> 
> Unfortunately, this overhaul touched rather central parts of the mtd
> layer and David and I have never found enough time to merge (and
> test!) this code.

I just googled and found
http://wohnheim.fh-wedel.de/~joern/software/kernel/mtd.patch.core.2.4.17
is this the patch you are referring to?

I haven't had time to look at it properly, but it certainly looks like a
great idea, hopefully I'll find time to look at it before I next upgrade
our development kit kernel.

> > What are the chances of this being rolled into the main MTD
> > distribution?
> 
> Dunno. The first time I tried to merge my code was over a year ago,
> the second six month or so. Now I settled to ignore the issue and
> wait. 

Perhaps my less invasive patch can be used in the mean time.

> 
> BTW: The code looks awfully familiar. Apart from the identifiers, it
> might be almost identical to mine. :)

Well, great minds and all that ;-) I hadn't seen your code before today,
I promise...

Ian

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,			Direct: +44 (0)1223 403465
Clifton Road,					Phone:  +44 (0)1223 411 200
Cambridge CB1 7EA				E-Mail: icampbell at arcom.com
United Kingdom					Web:    http://www.arcom.com




________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
