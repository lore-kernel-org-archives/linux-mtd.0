Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9l7y-0008DM-Qb
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:32:35 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] Fixes for docg3 to enable ubifs over docg3
Date: Mon, 19 Mar 2012 23:32:18 +0100
Message-Id: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This set of patches is the feedback from ubifs usage over the docg3.
This set is split into 2 subsets:
 - patches 1 and 2 are fixes
 - patches 3 and 4 are an evolution to provided concurrent access protection

Cheers.

--
Robert

Robert Jarzmik (4):
  drivers/mtd: docg3 fix inbound calculations
  drivers/mtd: docg3 increase write/erase timeout
  drivers/mtd: docg3 refactor cascade floors structure
  drivers/mtd: docg3 add protection against concurrency

 drivers/mtd/devices/docg3.c |  169 ++++++++++++++++++++++++++-----------------
 drivers/mtd/devices/docg3.h |   20 +++++-
 2 files changed, 119 insertions(+), 70 deletions(-)

-- 
1.7.5.4
