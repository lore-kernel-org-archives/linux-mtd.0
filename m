Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLY-00010O-SW
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:05 +0000
Received: by ewy3 with SMTP id 3so1527779ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:02 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2 00/18] last part of big cleanup of partition handling
Date: Sun, 12 Jun 2011 03:11:44 +0400
Message-Id: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Changes in V2 of this serie:
* Introduce special struct mtd_parts_parser_data structure to hold data args
  passed to parsers
* small cleanups

The following changes since commit 3e1643b282542cf524d30cfab4cfe38f6b2afa99:

  mtd: edb7312: correctly pass MTD name to parsers (2011-06-09 15:30:44 +0300)

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

 drivers/mtd/cmdlinepart.c        |    2 +-
 drivers/mtd/devices/m25p80.c     |   37 ++------------
 drivers/mtd/maps/physmap_of.c    |   80 +++--------------------------
 drivers/mtd/mtdcore.c            |    6 +-
 drivers/mtd/mtdpart.c            |   15 ++++--
 drivers/mtd/nand/fsl_elbc_nand.c |   17 ++-----
 drivers/mtd/nand/fsl_upm.c       |   13 +----
 drivers/mtd/nand/mpc5121_nfc.c   |   17 +-----
 drivers/mtd/nand/ndfc.c          |   16 +-----
 drivers/mtd/nand/socrates_nand.c |   23 +-------
 drivers/mtd/ofpart.c             |  104 ++++++++++++++++++++++++++++++++++++--
 drivers/mtd/redboot.c            |    6 +-
 include/linux/mtd/mtd.h          |    3 +-
 include/linux/mtd/partitions.h   |   32 +++++-------
 14 files changed, 160 insertions(+), 211 deletions(-)
