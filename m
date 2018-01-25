Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eedHB-00041W-6z
 for linux-mtd@lists.infradead.org; Thu, 25 Jan 2018 08:52:54 +0000
Received: by mail-wm0-x242.google.com with SMTP id 143so13099615wma.5
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2018 00:52:42 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 0/2] mtd-utils: improve compatibility with klibc
Date: Thu, 25 Jan 2018 09:52:36 +0100
Message-Id: <cover.1516868053.git.andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Klibc does not support floating point calculations.
Here some fixes needed to build the ubi-utils against klibc for aarch64,
without FPU.

These lines end up compiled with soft float for other arm targets w/out
FPU thus this was discovered only cross-building for qemuarm64 using the flag
 '-mgeneral-regs-only'.

Changes tested on armv5, same output is printed.

Andrea Adami (2):
  mtd-utils: common.c: convert to integer arithmetic
  ubi-utils: ubiformat.c: convert to integer arithmetic.

 lib/common.c          | 15 +++++++++------
 ubi-utils/ubiformat.c |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.7.4
