Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJsu-00040s-RL
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:10 +0000
Received: by wyf23 with SMTP id 23so536851wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:06 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2 00/18] mtd: cleanup partition handling in OF-enabled drivers
Date: Wed, 22 Jun 2011 13:37:34 +0400
Message-Id: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since V1:
 * Tab-vs-space cleanup
 * 80-column cleanup
 * documented of_node parser data field
 * changed documentation for parser_data arguments

The following changes since commit 6a146696fdcf383d90753145dfb367e499790940:

  mtd: nand_base: always initialise oob_poi before writing OOB data (2011-06-22 08:50:28 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup

Dmitry Eremin-Solenikov (18):
      mtd: abstract last MTD partition parser argument
      mtd: prepare to convert of_mtd_parse_partitions to partition parser
      mtd: physmap_of: use ofpart through generic parsing
      mtd: m25p80: use ofpart through generic parsing
      mtd: fsl_elbc_nand: use ofpart through generic parsing
      mtd: fsl_upm: use ofpart through generic parsing
      mtd: mpc5121_nfc: use ofpart through generic parsing
      mtd: ndfc: use ofpart through generic parsing
      mtd: socrates_nand: use ofpart through generic parsing
      mtd: drop of_mtd_parse_partitions()
      mtd: physmap_of: move parse_obsolete_partitions to become separate parser
      mtd: physmap_of.c: use mtd_device_parse_register
      mtd: m25p80.c: use mtd_device_parse_register
      mtd: fsl_elbc_nand.c: use mtd_device_parse_register
      mtd: fsl_upm.c: use mtd_device_parse_register
      mtd: mpc5121_nfc.c: use mtd_device_parse_register
      mtd: ndfc.c: use mtd_device_parse_register
      mtd: socrates_nand.c: use mtd_device_parse_register

 drivers/mtd/afs.c                |    4 +-
 drivers/mtd/ar7part.c            |    2 +-
 drivers/mtd/cmdlinepart.c        |    4 +-
 drivers/mtd/devices/m25p80.c     |   37 ++------------
 drivers/mtd/maps/physmap_of.c    |   80 +++--------------------------
 drivers/mtd/mtdcore.c            |    6 +-
 drivers/mtd/mtdpart.c            |   15 ++++--
 drivers/mtd/nand/fsl_elbc_nand.c |   18 ++-----
 drivers/mtd/nand/fsl_upm.c       |   13 +----
 drivers/mtd/nand/mpc5121_nfc.c   |   17 +-----
 drivers/mtd/nand/ndfc.c          |   16 +-----
 drivers/mtd/nand/socrates_nand.c |   23 +-------
 drivers/mtd/ofpart.c             |  104 ++++++++++++++++++++++++++++++++++++--
 drivers/mtd/redboot.c            |   13 ++---
 include/linux/mtd/mtd.h          |    3 +-
 include/linux/mtd/partitions.h   |   36 +++++++-------
 16 files changed, 172 insertions(+), 219 deletions(-)
