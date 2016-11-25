Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAKL9-0001ae-FR
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 17:31:15 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 0/2] mtd-utils: Fix almost all compiler warnings
Date: Fri, 25 Nov 2016 18:30:39 +0100
Message-Id: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

These 2 patches fix all the warnings except the #warning in 
misc-utils/flashcp.c.

The first patch make sure the PRIoff formats are correct on all
64 bits platforms, and the second one fixes all 'unchecked return
val' warnings.

This series is based on mtd-utils' master branch.

Regards,

Boris

Boris Brezillon (2):
  common: Fix PRI{x,d}off definitions for x86_64 platform
  common: Fix 'unchecked return code' warnings

 .gitignore                |  3 +++
 configure.ac              |  5 +++++
 include/common.h          | 37 ++++++++++++++++++++++++++++++++++++-
 jffsX-utils/jffs2dump.c   | 32 ++++++++++++++++----------------
 jffsX-utils/jffs2reader.c |  2 +-
 misc-utils/docfdisk.c     |  6 +++++-
 misc-utils/ftl_check.c    |  2 +-
 nand-utils/nftl_format.c  | 24 ++++++++++++------------
 nand-utils/nftldump.c     | 10 ++++++----
 tests/ubi-tests/integ.c   | 10 ++++++++--
 10 files changed, 93 insertions(+), 38 deletions(-)

-- 
2.7.4
