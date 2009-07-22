Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTkGN-0008Ii-GE
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 22:26:20 +0000
Date: Thu, 23 Jul 2009 00:25:47 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V4 0/2] Nand and OneNand for ARM Nomadik
Message-ID: <cover.1248300341.git.rubini@unipv.it>
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

These two patches are the ones I last posted on Jun 22nd 2009 (thus
with all comments accepted), rebased to current master.

At this time, the arch/arm/mach-nomadik files have been accepted in
Russell's tree ("nomadik branch", I'm told), but I can't find a public
repository for that tree.

So these are from the tip of my rebased tree, and I think only
Rusell can apply them cleanly. So I Cc: him while posting to linux-mtd.

Thanks for your patience
/alessandro

Alessandro Rubini (2):
  Nand driver for Nomadik 8815 SoC (on NHK8815 board)
  OneNand support for Nomadik 8815 SoC (on NHK8815 board)

 arch/arm/mach-nomadik/board-nhk8815.c     |  155 ++++++++++++++
 arch/arm/mach-nomadik/include/mach/fsmc.h |   29 +++
 arch/arm/mach-nomadik/include/mach/nand.h |   16 ++
 drivers/mtd/nand/Kconfig                  |    6 +
 drivers/mtd/nand/Makefile                 |    1 +
 drivers/mtd/nand/nomadik_nand.c           |  329 +++++++++++++++++++++++++++++
 6 files changed, 536 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
 create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
 create mode 100644 drivers/mtd/nand/nomadik_nand.c
