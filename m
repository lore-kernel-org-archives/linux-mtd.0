Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qtpt0-0001B0-RR
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 23:51:03 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC 0/5] fix data+OOB writes, add ioctl
Date: Wed, 17 Aug 2011 16:50:24 -0700
Message-ID: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

Warning: This patch series is not a finished product yet; it is merely a
"Request For Comments" on my goals, methods, etc. Please comment on
this, and in the near future, there may be a full update to this series.

First off, these fixes are motivated by a number of things:

1) Broken "noecc" writes; `nandwrite -n -o' does not work on my
   hardware, at least, without these patches

2) We cannot write twice to the same page on MLC NAND flash. Thus, the
   current implementation for nandwrite, where we write OOB and page
   data in two separate ioctl operations, will not work. We need a new
   ioctl. See this thread:

   http://lists.infradead.org/pipermail/linux-mtd/2011-August/037316.html

3) It is beneficial to expose the mtd_oob_mode_t options to the
   user-space, since we often want to use MTD_OOB_RAW, MTD_OOB_AUTO,
   etc. on a per-operation basis. This naturally fits in with a new
   ioctl that can handle different combinations of page data and OOB as
   well as different OOB modes. See some discussion:

   http://lists.infradead.org/pipermail/linux-mtd/2011-August/037511.html

Now, there are certainly some things that this patch series does NOT yet
do. I will list some now:

4) Base the old ioctls (MEMWRITEOOB, MEMWRITEOOB64) on the new one
   (MEMWRITEDATAOOB). In fact, the first two patches update support for
   the old ioctls, whereas they could simply be "merged" with the new
   one instead.

5) Gracefully handle cases where mtd->write_oob doesn't exist. It simply
   quits with -EOPNOTSUPP. I test all of this code on NAND flash only,
   and the NAND subsystem always supplies this function. If there is a
   need for this ioctl without OOB writes, then perhaps this can be
   fixed.

Other thoughts:

Patch 3/5 is a weird one. I know code that the patch targets is wrong
(since it's obviously assuming oobsize is a power of 2), but I'm not
sure the *exact* intention of the wrong code - so it's hard to be sure
that my fix is valid. Please look it over.

The name "MEMWRITEDATAOOB" is totally up for debate. This was the best I
could come up with at the moment.

Perhaps something should be done about the MTDFILEMODE ioctl, since it
seems to cause some confusing overlap, at least to me. I see two
different RAW modes:

* MTD_MODE_RAW, which belongs to the mode field in `struct
  mtd_file_info'. It can be set by the ioctl MTDFILEMODE
* MTD_OOB_RAW, which belongs to the mode field in `struct
  mtd_oob_ops'. It is set indirectly by other operations.

Does MTD_MODE_RAW imply MTD_OOB_RAW when OOB operations are involved?
Does MTD_MODE_RAW imply that no ECC is applied to data?
Is the MTD file mode persistent? If so, then it may conflict with a
"per-operation" mode in our new MEMWRITEDATAOOB

Maybe the "something" to be done would just be some better
documentation. Or something more drastic if there's an actual conflict.

Speaking of documentation, what is this supposed to mean (from struct
nand_chip, in include/linux/mtd/nand.h)?

	@oob_poi:            poison value buffer

It seems like the oob_poi buffer is meant to be an intermediary buffer
for storing the laid-out OOB data; it's used by the NAND subsystem,
especially in mode MTD_OOB_AUTO, to layout data to be written. But this
"documentation" means absolutely nothing to me. I'll edit that comment
in nand.h and include it in my revised patch series if I'm on the right
track.

OK, that's a lot to read :) Let me know if you have questions, and I'll
follow up with more info if there's something I left out.

Brian

Brian Norris (5):
  mtd: support MTD_MODE_RAW for writing OOB
  mtd: support MTD_MODE_RAW for reading OOB
  mtd: do not assume oobsize is power of 2
  mtd: move mtd_oob_mode_t to shared kernel/user space
  mtd: add MEMWRITEDATAOOB ioctl

 drivers/mtd/mtdchar.c        |   54 +++++++++++++++++++++++++++++++++--------
 drivers/mtd/nand/nand_base.c |   16 +++++++++++-
 include/linux/mtd/mtd.h      |   14 -----------
 include/mtd/mtd-abi.h        |   23 ++++++++++++++++++
 4 files changed, 80 insertions(+), 27 deletions(-)
