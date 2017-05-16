Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQI-0001MU-3h
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:42 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 00/53] Get rid of Docbook
Date: Tue, 16 May 2017 09:15:52 -0300
Message-Id: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch series convert the remaining DocBooks to ReST.

The first version was originally
send as 3 patch series:

   [PATCH 00/36] Convert DocBook documents to ReST
   [PATCH 0/5] Convert more books to ReST
   [PATCH 00/13] Get rid of DocBook

The lsm book was added as if it were a text file under 
Documentation. The plan is to merge it with another file 
under Documentation/security, after both this series and
a security Documentation patch series gets merged.

It also adjusts some Sphinx-pedantic errors/warnings on
some kernel-doc markups.

I also added some patches here to add PDF output for all
existing ReST books.

I did my best to check if what's there is not too outdated, but
the best is if the subsystem maintainers could check it.

This patch series is based on docs tree (next branch):

   git://git.lwn.net/linux.git docs-next

The full patch series is on this tree:

   https://git.linuxtv.org//mchehab/experimental.git/log/?h=docbook3

And the HTML output at:

  http://www.infradead.org/~mchehab/kernel_docs/
  https://mchehab.fedorapeople.org/kernel_docs/  


--

v2: 
  - merged the 3 other patch series into just one
  - added a patch describing ``literal`` kernel-doc syntax
  - addressed the points taken during review process
  - removed two patches that will be merged via subsystem
    trees:
	[PATCH 10/13] sound: fix the comments that refers to kernel-doc
        [PATCH 21/36] fs: locks: Fix some troubles at kernel-doc  comments    

Mauro Carvalho Chehab (53):
  docs-rst: convert kernel-hacking to ReST
  kernel-hacking: update document
  docs-rst: convert kernel-locking to ReST
  mutex, futex: adjust kernel-doc markups to generate ReST
  locking.rst: reformat locking table
  locking.rst: add captions to two tables
  locking.rst: Update some ReST markups
  docs-rst: convert kgdb DocBook to ReST
  kgdb.rst: Adjust ReST markups
  conf.py: define a color for important markup on PDF output
  docs-rst: conf.py: sort LaTeX documents in alphabetical order
  docs-rst: conf.py: remove kernel-documentation from LaTeX
  docs-rst: add crypto API book to pdf output
  docs-rst: add dev-tools book to pdf output
  docs-rst: add sound book to pdf output
  docs-rst: add userspace API book to pdf output
  docs-rst: convert filesystems book to ReST
  docs-rst: filesystems: use c domain references where needed
  fs: jbd2: make jbd2_journal_start() kernel-doc parseable
  docs-rst: don't ignore internal functions for jbd2 docs
  fs: add a blank lines on some kernel-doc comments
  fs: eventfd: fix identation on kernel-doc
  fs: jbd2: escape a string with special chars on a kernel-doc
  docs-rst: convert libata book to ReST
  libata.rst: add c function and struct cross-references
  libata: fix identation on a kernel-doc markup
  docs-rst: convert s390-drivers DocBook to ReST
  docs-rst: convert networking book to ReST
  net: skbuff.h: properly escape a macro name on kernel-doc
  net: fix some identation issues at kernel-doc markups
  docs-rst: convert z8530book DocBook to ReST
  docs-rst: convert scsi DocBook to ReST
  scsi: fix some kernel-doc markups
  docs-rst: convert w1 book to ReST
  docs-rst: convert rapidio book to ReST
  docs-rst: convert librs book to ReST
  docs-rst: convert mtdnand book to ReST
  mtdnand.rst: group the "::" with previous line
  mtd: adjust kernel-docs to avoid Sphinx/kerneldoc warnings
  docs-rst: convert sh book to ReST
  docs-rst: convert lsm from DocBook to ReST
  docs: remove DocBook from the building system
  docs: update old references for DocBook from the documentation
  MAINTAINERS: update old references for DocBook directory
  ata: update references for libata documentation
  ia64, scsi: update references for the device-io book
  irq: update genericirq book location
  fs: update location of filesystems documentation
  lib: update location of kgdb documentation
  fs: fix the location of the kernel-api book
  usb: fix the comment with regards to DocBook
  docs-rst: get rid of Documentation/sphinx/tmplcvt script
  kernel-doc: describe the ``literal`` syntax

 Documentation/00-INDEX                     |    6 +-
 Documentation/DocBook/.gitignore           |   17 -
 Documentation/DocBook/Makefile             |  282 ----
 Documentation/DocBook/filesystems.tmpl     |  381 -----
 Documentation/DocBook/kernel-hacking.tmpl  | 1312 -----------------
 Documentation/DocBook/kernel-locking.tmpl  | 2151 ----------------------------
 Documentation/DocBook/kgdb.tmpl            |  918 ------------
 Documentation/DocBook/libata.tmpl          | 1625 ---------------------
 Documentation/DocBook/librs.tmpl           |  289 ----
 Documentation/DocBook/lsm.tmpl             |  265 ----
 Documentation/DocBook/mtdnand.tmpl         | 1291 -----------------
 Documentation/DocBook/networking.tmpl      |  111 --
 Documentation/DocBook/rapidio.tmpl         |  155 --
 Documentation/DocBook/s390-drivers.tmpl    |  161 ---
 Documentation/DocBook/scsi.tmpl            |  409 ------
 Documentation/DocBook/sh.tmpl              |  105 --
 Documentation/DocBook/stylesheet.xsl       |   11 -
 Documentation/DocBook/w1.tmpl              |  101 --
 Documentation/DocBook/z8530book.tmpl       |  371 -----
 Documentation/Makefile                     |  125 ++
 Documentation/Makefile.sphinx              |  130 --
 Documentation/PCI/MSI-HOWTO.txt            |    2 +-
 Documentation/admin-guide/README.rst       |    6 -
 Documentation/conf.py                      |   37 +-
 Documentation/core-api/index.rst           |    1 +
 Documentation/core-api/librs.rst           |  212 +++
 Documentation/crypto/conf.py               |   10 +
 Documentation/dev-tools/index.rst          |    1 +
 Documentation/dev-tools/kgdb.rst           |  907 ++++++++++++
 Documentation/doc-guide/docbook.rst        |   90 --
 Documentation/doc-guide/index.rst          |    1 -
 Documentation/doc-guide/kernel-doc.rst     |   10 +
 Documentation/doc-guide/sphinx.rst         |    5 -
 Documentation/driver-api/index.rst         |    6 +
 Documentation/driver-api/libata.rst        | 1031 +++++++++++++
 Documentation/driver-api/mtdnand.rst       | 1007 +++++++++++++
 Documentation/driver-api/rapidio.rst       |  107 ++
 Documentation/driver-api/s390-drivers.rst  |  111 ++
 Documentation/driver-api/scsi.rst          |  344 +++++
 Documentation/driver-api/w1.rst            |   70 +
 Documentation/fb/api.txt                   |    4 +-
 Documentation/filesystems/conf.py          |   10 +
 Documentation/filesystems/index.rst        |  317 ++++
 Documentation/gpu/todo.rst                 |    2 +-
 Documentation/index.rst                    |   14 +
 Documentation/kernel-doc-nano-HOWTO.txt    |   65 +-
 Documentation/kernel-hacking/conf.py       |   10 +
 Documentation/kernel-hacking/hacking.rst   |  811 +++++++++++
 Documentation/kernel-hacking/index.rst     |    9 +
 Documentation/kernel-hacking/locking.rst   | 1446 +++++++++++++++++++
 Documentation/lsm.txt                      |  201 +++
 Documentation/networking/conf.py           |   10 +
 Documentation/networking/index.rst         |   18 +
 Documentation/networking/kapi.rst          |  147 ++
 Documentation/networking/z8530book.rst     |  256 ++++
 Documentation/process/changes.rst          |   26 +-
 Documentation/process/howto.rst            |    8 -
 Documentation/process/kernel-docs.rst      |   34 +-
 Documentation/sh/conf.py                   |   10 +
 Documentation/sh/index.rst                 |   59 +
 Documentation/sound/conf.py                |   10 +
 Documentation/sphinx/tmplcvt               |   28 -
 Documentation/translations/ja_JP/howto.rst |    7 -
 Documentation/translations/ko_KR/howto.rst |    7 -
 MAINTAINERS                                |    5 +-
 Makefile                                   |   11 +-
 arch/ia64/include/asm/io.h                 |    2 +-
 arch/ia64/sn/kernel/iomv.c                 |    2 +-
 drivers/ata/acard-ahci.c                   |    2 +-
 drivers/ata/ahci.c                         |    2 +-
 drivers/ata/ahci.h                         |    2 +-
 drivers/ata/ata_piix.c                     |    2 +-
 drivers/ata/libahci.c                      |    2 +-
 drivers/ata/libata-core.c                  |    2 +-
 drivers/ata/libata-eh.c                    |    2 +-
 drivers/ata/libata-scsi.c                  |    9 +-
 drivers/ata/libata-sff.c                   |    2 +-
 drivers/ata/libata.h                       |    2 +-
 drivers/ata/pata_pdc2027x.c                |    2 +-
 drivers/ata/pdc_adma.c                     |    2 +-
 drivers/ata/sata_nv.c                      |    2 +-
 drivers/ata/sata_promise.c                 |    2 +-
 drivers/ata/sata_promise.h                 |    2 +-
 drivers/ata/sata_qstor.c                   |    2 +-
 drivers/ata/sata_sil.c                     |    2 +-
 drivers/ata/sata_sis.c                     |    2 +-
 drivers/ata/sata_svw.c                     |    2 +-
 drivers/ata/sata_sx4.c                     |    2 +-
 drivers/ata/sata_uli.c                     |    2 +-
 drivers/ata/sata_via.c                     |    2 +-
 drivers/ata/sata_vsc.c                     |    2 +-
 drivers/mtd/nand/nand_base.c               |    7 +-
 drivers/net/phy/phy.c                      |    1 +
 drivers/scsi/qla1280.c                     |    2 +-
 drivers/scsi/scsi_scan.c                   |    7 +-
 drivers/scsi/scsi_transport_fc.c           |   18 +-
 drivers/scsi/scsicam.c                     |    4 +-
 drivers/usb/gadget/Kconfig                 |    2 +-
 fs/debugfs/file.c                          |    2 +-
 fs/debugfs/inode.c                         |    2 +-
 fs/eventfd.c                               |    4 +-
 fs/fs-writeback.c                          |   12 +-
 fs/jbd2/transaction.c                      |   42 +-
 fs/mpage.c                                 |    1 +
 fs/namei.c                                 |    1 +
 include/linux/ata.h                        |    2 +-
 include/linux/debugfs.h                    |    2 +-
 include/linux/libata.h                     |    2 +-
 include/linux/mtd/nand.h                   |    2 +-
 include/linux/mutex.h                      |    6 +-
 include/linux/netdevice.h                  |    9 +-
 include/linux/skbuff.h                     |    2 +-
 include/net/sock.h                         |    9 +-
 kernel/futex.c                             |   40 +-
 kernel/irq/chip.c                          |    2 +-
 kernel/irq/handle.c                        |    2 +-
 kernel/irq/irqdesc.c                       |    2 +-
 kernel/locking/mutex.c                     |    6 +-
 lib/Kconfig.debug                          |    2 +-
 lib/Kconfig.kgdb                           |    2 +-
 net/core/datagram.c                        |    2 +-
 net/core/sock.c                            |    7 +-
 scripts/Makefile                           |    9 +-
 scripts/check-lc_ctype.c                   |   11 -
 124 files changed, 7469 insertions(+), 10511 deletions(-)
 delete mode 100644 Documentation/DocBook/.gitignore
 delete mode 100644 Documentation/DocBook/Makefile
 delete mode 100644 Documentation/DocBook/filesystems.tmpl
 delete mode 100644 Documentation/DocBook/kernel-hacking.tmpl
 delete mode 100644 Documentation/DocBook/kernel-locking.tmpl
 delete mode 100644 Documentation/DocBook/kgdb.tmpl
 delete mode 100644 Documentation/DocBook/libata.tmpl
 delete mode 100644 Documentation/DocBook/librs.tmpl
 delete mode 100644 Documentation/DocBook/lsm.tmpl
 delete mode 100644 Documentation/DocBook/mtdnand.tmpl
 delete mode 100644 Documentation/DocBook/networking.tmpl
 delete mode 100644 Documentation/DocBook/rapidio.tmpl
 delete mode 100644 Documentation/DocBook/s390-drivers.tmpl
 delete mode 100644 Documentation/DocBook/scsi.tmpl
 delete mode 100644 Documentation/DocBook/sh.tmpl
 delete mode 100644 Documentation/DocBook/stylesheet.xsl
 delete mode 100644 Documentation/DocBook/w1.tmpl
 delete mode 100644 Documentation/DocBook/z8530book.tmpl
 delete mode 100644 Documentation/Makefile.sphinx
 create mode 100644 Documentation/core-api/librs.rst
 create mode 100644 Documentation/crypto/conf.py
 create mode 100644 Documentation/dev-tools/kgdb.rst
 delete mode 100644 Documentation/doc-guide/docbook.rst
 create mode 100644 Documentation/driver-api/libata.rst
 create mode 100644 Documentation/driver-api/mtdnand.rst
 create mode 100644 Documentation/driver-api/rapidio.rst
 create mode 100644 Documentation/driver-api/s390-drivers.rst
 create mode 100644 Documentation/driver-api/scsi.rst
 create mode 100644 Documentation/driver-api/w1.rst
 create mode 100644 Documentation/filesystems/conf.py
 create mode 100644 Documentation/filesystems/index.rst
 create mode 100644 Documentation/kernel-hacking/conf.py
 create mode 100644 Documentation/kernel-hacking/hacking.rst
 create mode 100644 Documentation/kernel-hacking/index.rst
 create mode 100644 Documentation/kernel-hacking/locking.rst
 create mode 100644 Documentation/lsm.txt
 create mode 100644 Documentation/networking/conf.py
 create mode 100644 Documentation/networking/index.rst
 create mode 100644 Documentation/networking/kapi.rst
 create mode 100644 Documentation/networking/z8530book.rst
 create mode 100644 Documentation/sh/conf.py
 create mode 100644 Documentation/sh/index.rst
 create mode 100644 Documentation/sound/conf.py
 delete mode 100755 Documentation/sphinx/tmplcvt
 delete mode 100644 scripts/check-lc_ctype.c

-- 
2.9.3
