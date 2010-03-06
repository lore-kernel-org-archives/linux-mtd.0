Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NnzNN-0007rK-8J
	for linux-mtd@lists.infradead.org; Sat, 06 Mar 2010 19:09:25 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [mtd, nand] Remove stray endchoice from help text
Date: Sat, 06 Mar 2010 20:09:23 +0100
Message-ID: <8763591d3w.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
---
 drivers/mtd/nand/Kconfig |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 677cd53..d68bd6e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -358,8 +358,6 @@ config MTD_NAND_ATMEL_ECC_NONE
 
 	  If unsure, say N
 
-	  endchoice
-
 endchoice
 
 config MTD_NAND_PXA3xx
-- 
1.5.6.5
