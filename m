Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeHg-0007QM-OK
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:57:47 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 45/46] mtd: nandsim: Always answer all 8 bytes from
 NAND_CMD_READID
Date: Wed, 21 Sep 2016 11:57:42 +0200
Message-Id: <a2c15d2e4faa551a0aad359b6cc04ec71fef4e9c.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

nand base reads the full 8 byte NAND ID, no matter
how many id bytes we have configured.

So, instead of getting confused return all bytes
even when they are not configured (0xff).

Fixes error messages such as:
nandsim: unexpected data output cycle, state is STATE_READY return 0x0

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 5d82a0a..b901155 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -56,8 +56,6 @@
 
 #define NANDSIM_FIRST_ID_BYTE  0x98
 #define NANDSIM_SECOND_ID_BYTE 0x39
-#define NANDSIM_THIRD_ID_BYTE  0xFF /* No byte */
-#define NANDSIM_FOURTH_ID_BYTE 0xFF /* No byte */
 #define NANDSIM_ACCESS_DELAY 25
 #define NANDSIM_PROGRAMM_DELAY 200
 #define NANDSIM_ERASE_DELAY 2
@@ -87,9 +85,7 @@ static unsigned int bch;
 static u_char id_bytes[8] = {
 	[0] = NANDSIM_FIRST_ID_BYTE,
 	[1] = NANDSIM_SECOND_ID_BYTE,
-	[2] = NANDSIM_THIRD_ID_BYTE,
-	[3] = NANDSIM_FOURTH_ID_BYTE,
-	[4 ... 7] = 0xFF,
+	[2 ... 7] = 0xFF,
 };
 static bool defaults = true;
 
@@ -3064,14 +3060,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	 * Perform minimum nandsim structure initialization to handle
 	 * the initial ID read command correctly
 	 */
-	if (id_bytes[6] != 0xFF || id_bytes[7] != 0xFF)
-		nand->geom.idbytes = 8;
-	else if (id_bytes[4] != 0xFF || id_bytes[5] != 0xFF)
-		nand->geom.idbytes = 6;
-	else if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
-		nand->geom.idbytes = 4;
-	else
-		nand->geom.idbytes = 2;
+	nand->geom.idbytes = sizeof(id_bytes);
 	nand->regs.status = NS_STATUS_OK(nand);
 	nand->nxstate = STATE_UNKNOWN;
 	nand->options |= OPT_PAGE512; /* temporary value */
-- 
2.8.3
