Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBFJH-0004es-4C
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 02:35:11 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 0/9] About the SLC/MLC
Date: Mon, 19 Aug 2013 10:31:09 +0800
Message-ID: <1376879478-22128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In current mtd code, the MTD_NANDFLASH is used to represent both the
SLC nand MLC(including the TLC). But we already have the MTD_MLCNANDFLASH
to stand for the MLC. What is worse is that the JFFS2 may run on the MLC
nand with current code. For the reason of READ/WRITE disturbance, the JFFS2
should runs on the SLC only,
       
This patch set tries to make clear what is the SLC/MLC by renaming,
adding the macros, adding helpers, adding the comments. ..

After this patch set, the gpmi can support the JFFS2 for some SLC NAND now 
(only when the left oob area is big enough).

Tested this patch set with ONFI SLC: M529F8G08ABACAWP

v1 --> v2:
	[0] rename the @cellinfo to @bits_per_cell
	[1] abandon the patch:
       		"mtd: add more information for the MTD_NANDFLASH case"
	[2] update the ABI for patch 8
	[3] misc

Huang Shijie (9):
  mtd: nand: rename the cellinfo to bits_per_cell
  mtd: set the cell information for ONFI nand
  mtd: print out the cell information for nand chip
  mtd: gpmi: rewrite the gpmi_ecc_write_oob() to support the jffs2
  mtd: add more comment for MTD_NANDFLASH/MTD_MLCNANDFLASH
  mtd: fix the wrong mtd->type for nand chip
  jffs2: init the ret with -EINVAL
  mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
  mtd: add a helper to detect the nand type

 Documentation/ABI/testing/sysfs-class-mtd |    2 +-
 drivers/mtd/inftlcore.c                   |    2 +-
 drivers/mtd/mtdcore.c                     |    3 ++
 drivers/mtd/nand/denali.c                 |    2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c    |   31 +++++++++++++++++-------
 drivers/mtd/nand/nand_base.c              |   36 ++++++++++++++++++----------
 drivers/mtd/nftlcore.c                    |    2 +-
 drivers/mtd/ssfdc.c                       |    2 +-
 drivers/mtd/tests/nandbiterrs.c           |    2 +-
 drivers/mtd/tests/oobtest.c               |    2 +-
 drivers/mtd/tests/pagetest.c              |    2 +-
 drivers/mtd/tests/subpagetest.c           |    2 +-
 fs/jffs2/fs.c                             |    2 +-
 include/linux/mtd/mtd.h                   |    5 ++++
 include/linux/mtd/nand.h                  |   14 +++++++++-
 include/uapi/mtd/mtd-abi.h                |    4 +-
 16 files changed, 77 insertions(+), 36 deletions(-)
