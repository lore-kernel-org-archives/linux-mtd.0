Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZwH-00059D-MA
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:50:02 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 08/12] mtd: nand: document nand_chip.oob_poi
Date: Tue, 30 Aug 2011 18:45:43 -0700
Message-ID: <1314755147-17756-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 17964c9..0b3d464 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -434,7 +434,8 @@ struct nand_buffers {
  * @chip_delay:		[BOARDSPECIFIC] chip dependent delay for transferring
  *			data from array to read regs (tR).
  * @state:		[INTERN] the current state of the NAND device
- * @oob_poi:		poison value buffer
+ * @oob_poi:		"poison value buffer," used for laying out OOB data
+ *			before writing
  * @page_shift:		[INTERN] number of address bits in a page (column
  *			address bits).
  * @phys_erase_shift:	[INTERN] number of address bits in a physical eraseblock
-- 
1.7.5.4
