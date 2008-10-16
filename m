Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc0D-0003JN-A9
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:11:33 +0000
Received: by fg-out-1718.google.com with SMTP id l26so164783fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:11:31 -0700 (PDT)
Date: Fri, 17 Oct 2008 03:11:27 +0400
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [GIT PULL] sharpsl-nand driver model hookup
Message-ID: <20081016231127.GA17131@doriath.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please have a look at the patches making sharpsl-nand more clean driver,
correctly hooked in the driver model.

The following changes since commit 6bb7a935489dab20802dde6c2cb7d8582f4849bf:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../tiwai/sound-2.6

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lumag/tosa-2.6.git misc/mtd/sharpsl-nand

Dmitry Baryshkov (6):
      [MTD] sharpsl_nand: switch to driver model usage.
      [MTD] sharpsl_nand: make drvdata non-static
      [MTD] sharpsl_nand: move io addr to struct sharpsl_nand
      [MTD] sharpsl-nand: cleanup partitions support
      [MTD] sharpsl-nand: use platform_data for model-specific values
      [MTD] sharpsl-nand: move registration to board code

 arch/arm/mach-pxa/corgi.c   |   54 ++++++++++
 arch/arm/mach-pxa/poodle.c  |   51 +++++++++
 arch/arm/mach-pxa/spitz.c   |   76 +++++++++++++
 drivers/mtd/nand/sharpsl.c  |  248 +++++++++++++++++++++----------------------
 include/linux/mtd/sharpsl.h |   20 ++++
 5 files changed, 324 insertions(+), 125 deletions(-)
 create mode 100644 include/linux/mtd/sharpsl.h

-- 
With best wishes
Dmitry
