Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf01E-0007zq-IJ
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:33:22 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 746C324E0003
 for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2016 09:32:51 +0200 (CEST)
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH 0/4] Add support for nandsim control interface
Date: Wed, 31 Aug 2016 09:32:40 +0200
Message-Id: <20160831073244.29106-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series introduces nandsimctl, a new tool to manage
nandsim instances.
This series depends on the previously sent kernel patches.

Daniel Walter (3):
  Add help and version information to nandsimctl
  add info support for nandsimctl
  Add support for bad and weak blocks/pages

Richard Weinberger (1):
  Nandsimctl initial commit

 Makefile                   |   2 +-
 include/mtd/nandsim-user.h | 115 +++++++++++
 nand-utils/nandsimctl.c    | 480 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+), 1 deletion(-)
 create mode 100644 include/mtd/nandsim-user.h
 create mode 100644 nand-utils/nandsimctl.c

-- 
2.8.3
