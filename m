From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Wed, 12 Feb 2003 15:22:11 +0100
Subject: PATCH: add an mtd device at a particular minor number
In-Reply-To: <1045056666.31625.44.camel@linuxdev.icampbell.arcom.cc>
References: <1045056666.31625.44.camel@linuxdev.icampbell.arcom.cc>
Message-ID: <20030212142211.GA18753@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 12 February 2003 13:31:06 +0000, Ian Campbell wrote:
> 
> I sent this last week but it appears to have gone unnoticed.

This happens all too often. Seems like noone has found a sponsor to do
mtd support fulltime yet. :|

> This patch adds a function add_mtd_device_full which works the same as
> add_mtd_device except it allows you to request a particular minor number
> for the new device.
> 
> I wanted this because on our boards we have Flash, SRAM and BIOS all
> accessible via MTD, unfortunately the minor number of the SRAM and BIOS
> devices can change depending on how many partitions exist in the main
> Flash, and the BIOS minor number can additionally change depending on if
> the board has SRAM fitted or not etc. I would much prefer to be able to
> say that SRAM would always be mtd14 and BIOS would be mtd15.

Interesting idea, but not completely new. More than a year ago, I did
a big overhaul of the partitioning code that added this functionality,
among other things.
The main point was to create a device/partition hierarchy so that
adding/removing some partitions on one device doesn't affect other
devices. This should be an even better fix to your problem.

Unfortunately, this overhaul touched rather central parts of the mtd
layer and David and I have never found enough time to merge (and
test!) this code.

> What are the chances of this being rolled into the main MTD
> distribution?

Dunno. The first time I tried to merge my code was over a year ago,
the second six month or so. Now I settled to ignore the issue and
wait. 

BTW: The code looks awfully familiar. Apart from the identifiers, it
might be almost identical to mine. :)


J?rn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
