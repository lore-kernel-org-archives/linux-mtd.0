Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c02Nl-0005nT-41
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 08:19:22 +0000
Date: Fri, 28 Oct 2016 10:18:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>
Subject: [PULL] mtd: nand: Fixes for 4.9-rc3
Message-ID: <20161028101859.615190bc@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Here is the PR I was mentioning yesterday. I thought I had more fixes
in the queue, but apparently I only have 2.

As usual, let me know if you find something weird in this PR, and I'll
fix it.

Thanks,

Boris

The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69:

  Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/fixes-for-4.9-rc3

for you to fetch changes up to 73f907fd5fa56b0066d199bdd7126bbd04f6cd7b:

  mtd: nand: Fix data interface configuration logic (2016-10-28 09:58:36 +0200)

----------------------------------------------------------------
Two simple fixes:

- the first one is fixing a non-critical bug in the gpmi driver
- the second one is fixing a bug in the 'automatic NAND timings
  selection' feature introduced in 4.9-rc1

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: nand: Fix data interface configuration logic

Fabio Estevam (1):
      mtd: nand: gpmi: disable the clocks on errors

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |  6 ++++--
 drivers/mtd/nand/nand_base.c          | 60 ++++++++++++++++++++++++++++++++++++++++++------------------
 include/linux/mtd/nand.h              |  2 +-
 3 files changed, 47 insertions(+), 21 deletions(-)
	
