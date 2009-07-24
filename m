Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUIyP-0003Vz-F5
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 11:30:06 +0000
Date: Fri, 24 Jul 2009 13:29:42 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V5 0/2] Nand and OneNand for ARM Nomadik
Message-ID: <cover.1248434635.git.rubini@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
Cc: STEricsson_nomadik_linux@list.st.com, linux@arm.linux.org.uk,
	andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Version 5. Use soft ecc routines for NAND, as they give the
same result as the ones I wrote. Additionally, this fixes the
defconfig for the machine, since the one I posted already
included configuration for NAND and OneNand.

Rebased on today's rmk's devel tree, where nomadik base support is
already included (even though rmk tells not to base on that branch,
which is volatile, I think rebasing before posting is correct).

Alessandro Rubini (2):
  Nand driver for Nomadik 8815 SoC (on NHK8815 board)
  OneNand support for Nomadik 8815 SoC (on NHK8815 board)

 arch/arm/configs/nhk8815_defconfig        |    2 +-
 arch/arm/mach-nomadik/board-nhk8815.c     |  155 ++++++++++++++++++
 arch/arm/mach-nomadik/include/mach/fsmc.h |   29 ++++
 arch/arm/mach-nomadik/include/mach/nand.h |   16 ++
 drivers/mtd/nand/Kconfig                  |    6 +
 drivers/mtd/nand/Makefile                 |    1 +
 drivers/mtd/nand/nomadik_nand.c           |  249 +++++++++++++++++++++++++++++
 7 files changed, 457 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
 create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
 create mode 100644 drivers/mtd/nand/nomadik_nand.c
