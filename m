Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRRZ-00029G-6n
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:17:29 +0000
Received: by wwb39 with SMTP id 39so1154847wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:17:25 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] Further Denali NAND enhancements
Date: Fri,  3 Jun 2011 11:17:12 +0100
Message-Id: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series performs a couple of minor cleanups to the Denali NAND
controller driver and then introduces support for newer versions of the
IP where ECC fixup is supported in hardware.

Finally add support for partitioning through platform data and cmdline
partitioning.

Jamie Iles (6):
  nand/denali: convert to dev_() printk helpers
  nand/denali: annotate pci init/exit functions with correct section
  nand/denali: allow the number of ECC bits to be set by pdata
  nand/denali: support hardware with internal ECC fixup
  nand/denali: support MTD partitioning
  mtd/denali: support for cmdline partitioning

 drivers/mtd/nand/denali.c            |  195 ++++++++++++++++++----------------
 drivers/mtd/nand/denali.h            |   10 ++
 include/linux/platform_data/denali.h |   26 +++++
 3 files changed, 140 insertions(+), 91 deletions(-)
 create mode 100644 include/linux/platform_data/denali.h

-- 
1.7.4.1
