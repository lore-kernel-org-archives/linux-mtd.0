Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8e-0007V4-1g
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:12 +0000
Received: by wwb39 with SMTP id 39so1305393wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/17] mtd: last pile of MTD partition cleanup patches
Date: Thu,  9 Jun 2011 18:22:49 +0400
Message-Id: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here goes last serie of my current work on cleaning up the MTD partition
handling. Now my goal is to clean up OF partition handling.

The following changes since commit 3e1643b282542cf524d30cfab4cfe38f6b2afa99:

  mtd: edb7312: correctly pass MTD name to parsers (2011-06-09 15:30:44 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup

Dmitry Eremin-Solenikov (17):
      mtd: prepare to convert of_mtd_parse_partitions to partition parser
      mtd: physmap_of: use ofpart through generic parsing
      mtd: m25p80: use ofpart through generic parsing
      mtd: fsl_elbc_nand: use ofpart through generic parsing
      mtd: fsl_upm: use ofpart through generic parsing
      mtd: mpc5121_nfc: use ofpart through generic parsing
      mtd: ndfc: use ofpart through generic parsing
      mtd: socrates_nand: use ofpart through generic parsing
      mtd: drop of_mtd_parse_partitions()
      physmap_of: move parse_obsolete_partitions to become separate parser
      mtd: physmap_of.c: use mtd_device_parse_register
      mtd: m25p80.c: use mtd_device_parse_register
      mtd: fsl_elbc_nand.c: use mtd_device_parse_register
      mtd: fsl_upm.c: use mtd_device_parse_register
      mtd: mpc5121_nfc.c: use mtd_device_parse_register
      mtd: ndfc.c: use mtd_device_parse_register
      mtd: socrates_nand.c: use mtd_device_parse_register

 drivers/mtd/devices/m25p80.c     |   36 ++------------
 drivers/mtd/maps/physmap_of.c    |   79 ++----------------------------
 drivers/mtd/mtdcore.c            |   19 +++++++
 drivers/mtd/mtdpart.c            |    8 ++-
 drivers/mtd/nand/fsl_elbc_nand.c |   16 +-----
 drivers/mtd/nand/fsl_upm.c       |   12 +----
 drivers/mtd/nand/mpc5121_nfc.c   |   16 +-----
 drivers/mtd/nand/ndfc.c          |   15 +-----
 drivers/mtd/nand/socrates_nand.c |   22 +--------
 drivers/mtd/ofpart.c             |   98 ++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/mtd.h          |    5 ++
 include/linux/mtd/partitions.h   |   16 ------
 12 files changed, 144 insertions(+), 198 deletions(-)
