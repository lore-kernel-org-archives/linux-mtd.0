Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0oCk-0004tg-FG
	for linux-mtd@lists.infradead.org; Sat, 19 Mar 2011 04:55:59 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: renumber conflicting BBT flags
Date: Fri, 18 Mar 2011 21:53:41 -0700
Message-ID: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND_USE_FLASH_BBT_NO_OOB and NAND_CREATE_EMPTY_BBT flags conflict
with the NAND_BBT_SCANBYTE1AND6 and NAND_BBT_DYNAMICSTRUCT flags,
respectively. This change will allow us to utilize these options
independently.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ae67ef5..80b471b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -237,9 +237,9 @@ typedef enum {
  * If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
  * the OOB area.
  */
-#define NAND_USE_FLASH_BBT_NO_OOB	0x00100000
+#define NAND_USE_FLASH_BBT_NO_OOB	0x00800000
 /* Create an empty BBT with no vendor information if the BBT is available */
-#define NAND_CREATE_EMPTY_BBT		0x00200000
+#define NAND_CREATE_EMPTY_BBT		0x01000000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.7.0.4
