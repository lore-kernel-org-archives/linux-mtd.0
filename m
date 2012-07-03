Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Slyp8-0006vy-2a
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 08:51:09 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtd: fix the comment
Date: Tue, 3 Jul 2012 16:44:15 +0800
Message-ID: <1341305055-29218-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1341305055-29218-1-git-send-email-b32955@freescale.com>
References: <1341305055-29218-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix the comment for nand_bbt.c

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_bbt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 30d1319..3972fc4 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -22,7 +22,7 @@
  * BBT on flash. If a BBT is found then the contents are read and the memory
  * based BBT is created. If a mirrored BBT is selected then the mirror is
  * searched too and the versions are compared. If the mirror has a greater
- * version number than the mirror BBT is used to build the memory based BBT.
+ * version number, then the mirror BBT is used to build the memory based BBT.
  * If the tables are not versioned, then we "or" the bad block information.
  * If one of the BBTs is out of date or does not exist it is (re)created.
  * If no BBT exists at all then the device is scanned for factory marked
-- 
1.7.0.4
