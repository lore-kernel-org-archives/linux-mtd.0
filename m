Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhbmJ-0006ZZ-IY
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 09:35:12 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: Fix problem with NAND_CMD_RNDOUT (05h-E0h)
Date: Tue, 6 May 2014 15:04:13 +0530
Message-ID: <1399368853-6363-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Marek Belisko <marek.belisko@gmail.com>,
 Samuel Egli <samuel.egli@siemens.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Steven Kipisz <s-kipisz2@ti.com>, Stefan Roese <sr@denx.de>,
 Bacem Daassi <Bacem.Daassi@spansion.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bacem Daassi <Bacem.Daassi@spansion.com>

Though the NAND_CMD_READ "Page Read" command expects the full address footprint
(2bytes for column address + 3bytes for row address).
But once the page is loaded into the read buffer, NAND_CMD_RNDOUT (05h-E0h) also
called "Random Data Output" command expects to see only the column address that
should be addressed within the already loaded page present in read buffers.
Only 2 address cycles with ALE active should be provided between the 05h and E0h
So expected sequence for NAND_CMD_RNDOUT is
	<05h> <column-addr-byte1> <column-address-byte2> <E0h>

Though most NAND Devices mentioned above tend to work even if extra cycles of
page-address is issued between <05h> .... <E0h> command. But some Spansion and
Hynix devices break on this non-compliance.
The same issue has been reported by Bacem Daassi
  http://e2e.ti.com/support/arm/sitara_arm/f/791/t/259699.aspx

This patch fixes nand_command for all vendors devices as datasheet of all
devices expect same sequence.

+--------+------------------------+---------------------------------------------
|Vendor  | Datasheet/Part#        |  Reference
+--------+------------------------+---------------------------------------------
|Spansion| S34ML{01|02|04}G2      | Figure 6.12 Random Data Output In a Page
|Micron  | MT29F{16|32|64|128}G08A| Figure 47: CHANGE READ COLUMN (05h-E0h) Operation
|Macronix| MX30LF1G08AA           | Figure 10. AC Waveforms for Random Data Output
|Toshiba | TC58NVG1S3ETAI0        | Figure Column Address Change in Read Cycle Timing Diagram (2/2)
+--------+------------------------+---------------------------------------------

Reported-by: Bacem Daassi <Bacem.Daassi@spansion.com>
Reported-by: Marek Belisko <marek.belisko@gmail.com>
Reported-by: Steven Kipisz <s-kipisz2@ti.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9d01c4d..f0cb33a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -688,7 +688,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			ctrl &= ~NAND_CTRL_CHANGE;
 			chip->cmd_ctrl(mtd, column >> 8, ctrl);
 		}
-		if (page_addr != -1) {
+		if (page_addr != -1 && command != NAND_CMD_RNDOUT) {
 			chip->cmd_ctrl(mtd, page_addr, ctrl);
 			chip->cmd_ctrl(mtd, page_addr >> 8,
 				       NAND_NCE | NAND_ALE);
-- 
1.8.5.1.163.gd7aced9
