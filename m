Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0GFO-0003tj-Vc
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 13:59:07 +0000
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mACDwOdE011033
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2008 07:59:04 -0600
Message-ID: <491AE2F0.7040200@nokia.com>
Date: Wed, 12 Nov 2008 16:06:40 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [NAND] nandsim: suppress unnecessary warning
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_base sometimes reads only 2 bytes of a 4 byte id.
It is OK.  Do not print a warning in that case.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1045de9..baa6f95 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1973,13 +1973,17 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check if chip is expecting command */
 		if (NS_STATE(ns->nxstate) != STATE_UNKNOWN && !(ns->nxstate & STATE_CMD_MASK)) {
-			/*
-			 * We are in situation when something else (not command)
-			 * was expected but command was input. In this case ignore
-			 * previous command(s)/state(s) and accept the last one.
-			 */
-			NS_WARN("write_byte: command (%#x) wasn't expected, expected state is %s, "
-				"ignore previous states\n", (uint)byte, get_state_name(ns->nxstate));
+			/* Do not warn if only 2 id bytes are read */
+			if (!(ns->regs.command == NAND_CMD_READID &&
+			    NS_STATE(ns->state) == STATE_DATAOUT_ID && ns->regs.count == 2)) {
+				/*
+				 * We are in situation when something else (not command)
+				 * was expected but command was input. In this case ignore
+				 * previous command(s)/state(s) and accept the last one.
+				 */
+				NS_WARN("write_byte: command (%#x) wasn't expected, expected state is %s, "
+					"ignore previous states\n", (uint)byte, get_state_name(ns->nxstate));
+			}
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		}
 
-- 
1.5.4.3
