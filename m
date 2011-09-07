Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OVm-0001NN-5s
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:14:19 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 00/14] mtd: nand: improve flash-based BBT robustness
Date: Wed, 7 Sep 2011 13:13:27 -0700
Message-ID: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
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

Hello,

This patch series aims to improve the robustness of flash-based bad
block tables, especially their ECC handling. In fact, most of the
patches simply build up to the changes in patch 9 and 10, with some
following bugfixes and improvements that were discovered as a result of
the optimizations.

It's worth noting here the intended block scrubbing policy so that it
can be checked for soundness and for implementation:

*) a BBT page with uncorrected ECC errors is invalid
*) a BBT page with corrected ECC errors is valid but needs scrubbing
   (erased and rewritten with corrected data)

Upon discovering invalid table page(s), we retry our table versioning in
this order:

(1) Mirrored table of same version
(2) Mirrored table of lesser version
(3) Rescan flash for bad blocks

After yielding the most up-to-date table (from table in flash or from
scanning the device), then if the flash-BBT is out of date or needs
scrubbing, the table should be rewritten.

Let me know how any of this works and if there are particular areas
where documentation or explanation is lacking.

Brian

Brian Norris (14):
  mtd: nand: refactor scanning code
  mtd: nand: do not ignore all ECC errors
  mtd: define `is_ecc_error()' macros
  mtd: utilize `is_ecc_error()' macros
  mtd: nand: remove unnecessary variable
  mtd: nand: fix style
  mtd: nand: begin restructuring check_create
  mtd: nand: remove gotos in `check_create()'
  mtd: nand: report ECC errors properly when reading BBT
  mtd: nand: scrub BBT on ECC errors
  mtd: nand: wait to set BBT version
  mtd: nand: do not scan bad blocks with NAND_BBT_NO_OOB set
  mtd: nand: invalidate cache on unaligned reads
  mtd: nand: switch `check_pattern()' to standard `memcmp()'

 drivers/mtd/inftlcore.c             |    4 +-
 drivers/mtd/mtdchar.c               |    4 +-
 drivers/mtd/mtdconcat.c             |    8 +-
 drivers/mtd/mtdoops.c               |    2 +-
 drivers/mtd/mtdpart.c               |    8 +-
 drivers/mtd/mtdswap.c               |   20 ++--
 drivers/mtd/nand/diskonchip.c       |    2 +-
 drivers/mtd/nand/nand_base.c        |   12 ++-
 drivers/mtd/nand/nand_bbt.c         |  198 ++++++++++++++++++-----------------
 drivers/mtd/nftlcore.c              |    4 +-
 drivers/mtd/onenand/onenand_base.c  |   11 +-
 drivers/mtd/sm_ftl.c                |    4 +-
 drivers/mtd/tests/mtd_pagetest.c    |   28 +++---
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    8 +-
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    9 +-
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/eba.c               |    2 +-
 drivers/mtd/ubi/io.c                |   27 +++--
 drivers/mtd/ubi/kapi.c              |    3 +-
 drivers/mtd/ubi/misc.c              |    2 +-
 drivers/mtd/ubi/scan.c              |    4 +-
 drivers/mtd/ubi/vtbl.c              |    2 +-
 include/linux/mtd/mtd.h             |    5 +
 25 files changed, 198 insertions(+), 175 deletions(-)

-- 
1.7.5.4
