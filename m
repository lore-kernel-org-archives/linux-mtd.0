Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZuK-00057M-96
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:48:01 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 00/12] mtd: various "no ECC" and MLC NAND work
Date: Tue, 30 Aug 2011 18:45:35 -0700
Message-ID: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch series includes edited versions of several patches and RFCs -
some changed some not - as well as new material and documentation. To
avoid confusion, I will not include any version numbers yet (i.e.,
everything is "v1"), and any updates from here on out can be v2, v3,
etc. if necessary. I will try to include any important changes in the
comments though.

The key additions in this patch series are:

(1) add replaceable `{read,write}_oob_raw()' functions to
    `struct nand_chip'
(2) add a new ioctl(MEMWRITE)
(3) improve documentation

Patches for category (1) help improve support for reading/writing flash
without ECC on systems that calculate ECC on OOB operations. Category
(2) allows us to write data+OOB in a single operation; this solves
problems with MLC NAND, which can only be written once per page. And
category (3) was sorely needed for old and new functionality alike :)

Generally, these fixes have been tested by using various combinations of
nandwrite on nandsim, SLC NAND flash, and MLC NAND flash. In order to
utilize the new ioctl, I had to make some custom edits. I should have a
few patches soon to support this new stuff.

Note: the first and last patches are bugfixes to patches that are still
queued in l2-mtd-2.6.git. They probably should be squashed into the
relevant patches.

Brian

Brian Norris (12):
  mtd: nand: initialize chip->oob_poi before write
  mtd: support writing OOB without ECC
  mtd: support reading OOB without ECC
  mtd: move mtd_oob_mode_t to shared kernel/user space
  mtd: rename MTD_OOB_* to MTD_OPS_*
  mtd: rename MTD_MODE_* to MTD_FILE_MODE_*
  mtd: add MEMWRITE ioctl
  mtd: nand: document nand_chip.oob_poi
  mtd: document ABI
  mtd: nand: kill member `ops' of `struct nand_chip'
  mtd: kill old field for `struct mtd_info_user'
  mtd: nand: free allocated memory

 drivers/mtd/devices/doc2000.c          |    4 +-
 drivers/mtd/devices/doc2001.c          |    4 +-
 drivers/mtd/devices/doc2001plus.c      |    4 +-
 drivers/mtd/inftlcore.c                |    6 +-
 drivers/mtd/mtdchar.c                  |  115 ++++++++++++++++++++++++--------
 drivers/mtd/mtdpart.c                  |    2 +-
 drivers/mtd/mtdswap.c                  |    6 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 drivers/mtd/nand/nand_base.c           |  107 ++++++++++++++++++-----------
 drivers/mtd/nand/nand_bbt.c            |    8 +-
 drivers/mtd/nand/sm_common.c           |    2 +-
 drivers/mtd/nftlcore.c                 |    6 +-
 drivers/mtd/onenand/onenand_base.c     |   42 ++++++------
 drivers/mtd/onenand/onenand_bbt.c      |    2 +-
 drivers/mtd/sm_ftl.c                   |    4 +-
 drivers/mtd/ssfdc.c                    |    2 +-
 drivers/mtd/tests/mtd_oobtest.c        |   24 +++---
 drivers/mtd/tests/mtd_readtest.c       |    2 +-
 drivers/staging/spectra/lld_mtd.c      |    6 +-
 fs/jffs2/wbuf.c                        |    6 +-
 include/linux/mtd/mtd.h                |   18 +-----
 include/linux/mtd/nand.h               |   12 ++-
 include/mtd/mtd-abi.h                  |  115 +++++++++++++++++++++++++++-----
 23 files changed, 329 insertions(+), 170 deletions(-)

-- 
1.7.5.4
