Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egHaJ-00010M-GM
 for linux-mtd@lists.infradead.org; Mon, 29 Jan 2018 22:07:29 +0000
Received: by mail-wm0-x243.google.com with SMTP id r71so17340442wmd.1
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2018 14:07:15 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 0/2] mtd-utils: improve compatibility with klibc
Date: Mon, 29 Jan 2018 23:07:10 +0100
Message-Id: <1517263632-11126-1-git-send-email-andrea.adami@gmail.com>
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
v2 fixes compiler warnings (-Wformat) about printf().

Andrea Adami (2):
  mtd-utils: common.c: convert to integer arithmetic
  ubi-utils: ubiformat.c: convert to integer arithmetic

 lib/common.c          | 18 ++++++++++++------
 ubi-utils/ubiformat.c |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.7.4
