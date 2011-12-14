Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ravj7-00032A-59
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2011 20:46:58 +0000
Message-ID: <4EE90B28.7030708@newsguy.com>
Date: Wed, 14 Dec 2011 12:46:32 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>	
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>	
 <1323009827.9400.75.camel@sauron.fi.intel.com>	
 <4EDB89E9.6070306@newsguy.com> <1323065234.2316.2.camel@koala>	
 <4EDCF840.7050107@newsguy.com> <4EDCFAAC.90709@bitbox.co.uk>	
 <4EDD142B.6090303@newsguy.com> <87hb1de5b6.fsf@free.fr>	
 <4EDECC7A.1080202@newsguy.com>	
 <Pine.LNX.4.64.1112070848340.32119@lnxricardw.se.axis.com>	
 <4EDFB142.6050208@newsguy.com>
 <1323694138.24509.21.camel@sauron.fi.intel.com>
In-Reply-To: <1323694138.24509.21.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Peter Horton <phorton@bitbox.co.uk>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2011 04:48 AM, Artem Bityutskiy wrote:
> On Wed, 2011-12-07 at 10:32 -0800, Mike Dunn wrote:
>> Hi Ricard, thanks for chiming in.
>>
>> On 12/07/2011 12:01 AM, Ricard Wanderlof wrote:
>>>
>>> So, something like this:
>>> - The driver reports number of bit flips and current ECC strength etc to
>>>   the mtd layer.
>>> - Based on some userspace knob, the mtd framework reports -EUCLEAN if
>>>   scrubbing is needed.
>>> - Upper layers perform scrubbing if they want to (i.e. UBI) or not (i.e.
>>>   JFFS2).
>>
>> Sounds like a nice compromise between user configurability and keeping the
>> decision in the mtd layer.  The problem is that the read method currently goes
>> directly to the driver, so all drivers would have to be patched.  The last patch
>> I submitted was rejected as being too large.  And it can't be broken into
>> smaller patches because they are interdependent and not bisectable. 
>> Implementing this scheme would be an even larger patch, and the changes made to
>> every driver would bear scrutiny.
> Yeah, I think it is OK.

...<snip>...


> You should make it so that even if there
> are no partitions - everything goes via mtpart anyways. Nowadays mtdpart
> is an integral part of mtd, so this should be easy to do.


OK, this makes sense.  Yes, going through the partitioning code and its wrapper
functions for unpartitioned devices does look fairly straightforward, and It
allows the decision of whether or not to return -EUCLEAN to be made in the mtd
code, not the drivers.  Plus it can be its own separate patch.  But it does not
obviate the need to change the api for read() and read_oob() in order to return
the bitflip info.  Currently only the drivers can determine this.  The read
operation can span multiple pages, so e.g., we can't just use ecc_stats.  So the
"one large patch" problem remains.

As an aside, the nand infrastructure code only reads one page at a time, so if
we restricted this to devices that use the nand interface, ecc_stats could be
used, the driivers would not have to be touched, and the patch would be very
reasonable.  Unfortunately, there are two nand devices that use ecc but do not
use the nand interface.

Here's a proposed patch set:

1. mtd api changed so that read() and read_oob() return bitflip info (LARGE,
essentially the previous patch)
2. Unpartitioned devices go through the partitioning code (small patch)
3. Add ecc_strength to struct mtd_info, backport to drivers (moderate patch)
4. Implement functionality to intelligently decide whether to return -EUCLEAN or
0; add sysfs controls (moderate patch)

Please give this some more thought.  Just as a reminder of the size of item 1,
the diff stats of the previous patch are pasted below.

Thanks,
Mike


 drivers/mtd/afs.c                   |    4 ++--
 drivers/mtd/ar7part.c               |    8 ++++----
 drivers/mtd/chips/cfi_cmdset_0001.c |   10 ++++++++--
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++++--
 drivers/mtd/chips/cfi_cmdset_0020.c |   10 ++++++++--
 drivers/mtd/chips/map_absent.c      |    7 +++++--
 drivers/mtd/chips/map_ram.c         |    8 ++++++--
 drivers/mtd/chips/map_rom.c         |    8 ++++++--
 drivers/mtd/devices/block2mtd.c     |    6 +++++-
 drivers/mtd/devices/doc2000.c       |   11 +++++++++--
 drivers/mtd/devices/doc2001.c       |    7 +++++--
 drivers/mtd/devices/doc2001plus.c   |    6 ++++--
 drivers/mtd/devices/docg3.c         |    6 +++++-
 drivers/mtd/devices/lart.c          |    5 ++++-
 drivers/mtd/devices/m25p80.c        |    5 ++++-
 drivers/mtd/devices/ms02-nv.c       |    6 ++++--
 drivers/mtd/devices/mtd_dataflash.c |    5 ++++-
 drivers/mtd/devices/mtdram.c        |    4 +++-
 drivers/mtd/devices/phram.c         |    5 ++++-
 drivers/mtd/devices/pmc551.c        |    6 +++++-
 drivers/mtd/devices/slram.c         |    8 ++++++--
 drivers/mtd/devices/sst25l.c        |    6 +++++-
 drivers/mtd/ftl.c                   |   24 +++++++++++++-----------
 drivers/mtd/inftlcore.c             |    7 ++++---
 drivers/mtd/inftlmount.c            |    6 +++---
 drivers/mtd/lpddr/lpddr_cmds.c      |    8 ++++++--
 drivers/mtd/maps/bcm963xx-flash.c   |    4 ++--
 drivers/mtd/mtdblock.c              |    7 ++++---
 drivers/mtd/mtdblock_ro.c           |    2 +-
 drivers/mtd/mtdchar.c               |    2 +-
 drivers/mtd/mtdconcat.c             |   16 ++++++++++++----
 drivers/mtd/mtdoops.c               |    3 ++-
 drivers/mtd/mtdpart.c               |    4 ++--
 drivers/mtd/mtdswap.c               |    4 ++--
 drivers/mtd/nand/diskonchip.c       |    4 ++--
 drivers/mtd/nand/nand_base.c        |   21 ++++++++++++++++++---
 drivers/mtd/nand/nand_bbt.c         |    7 ++++---
 drivers/mtd/nftlcore.c              |    6 +++---
 drivers/mtd/nftlmount.c             |    6 +++---
 drivers/mtd/onenand/onenand_base.c  |    6 +++++-
 drivers/mtd/redboot.c               |    2 +-
 drivers/mtd/rfd_ftl.c               |   12 +++++++-----
 drivers/mtd/ssfdc.c                 |    4 ++--
 drivers/mtd/tests/mtd_pagetest.c    |   30 ++++++++++++++++--------------
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    8 ++++----
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    9 +++++----
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/io.c                |    6 +++---
 include/linux/mtd/mtd.h             |   11 ++++++++++-
 include/linux/mtd/pmc551.h          |    3 ++-
 52 files changed, 254 insertions(+), 125 deletions(-)
