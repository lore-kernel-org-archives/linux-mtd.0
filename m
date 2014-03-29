Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTtRi-0007ZY-5a
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 13:37:15 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 3/3] mtd: nand: introduce a READMODE command
Date: Sat, 29 Mar 2014 14:36:24 +0100
Message-Id: <1396100184-7110-4-git-send-email-gsi@denx.de>
In-Reply-To: <1396100184-7110-1-git-send-email-gsi@denx.de>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
Cc: Gerhard Sittig <gsi@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

the nand_command_lp() implementation derives a "READPAGE" sequence from
a passed in READ0 opcode, i.e. emits a sequence of READ0 _and_ READSTART
commands in this case

introduce a "READMODE" command which sends the READ0 opcode to the chip
exclusively and doesn't send the READSTART opcode

such a "READMODE" command is useful in the context of on-die-ECC support
where a sequence of READ0, READSTART, STATUS, READ0 is required; having
support for READMODE in the common nand_command_lp() routine avoids the
need for duplication and open coded cmd_ctrl() calls

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 drivers/mtd/nand/nand_base.c |    4 +++-
 include/linux/mtd/nand.h     |   11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9ae99c1ba772..9a74bd06004b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -706,7 +706,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 
 	/*
 	 * Program and erase have their own busy handlers status, sequential
-	 * in and status need no delay.
+	 * in and status need no delay, read mode just reverts back to
+	 * data output after a status command and needs no read start.
 	 */
 	switch (command) {
 
@@ -717,6 +718,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_RNDIN:
 	case NAND_CMD_STATUS:
+	case NAND_CMD_READMODE:
 		return;
 
 	case NAND_CMD_RESET:
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 32f8612469d8..234c80c1456a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -106,6 +106,17 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 #define NAND_CMD_NONE		-1
 
+/*
+ * Pseudo commands, which map to the above "real" commands for the NAND chip
+ * yet involve slightly different behaviour in related software layers
+ *
+ * READMODE switches back from status output to data output after a
+ * previously emitted sequence of READ0, READSTART, and STATUS commands;
+ * actually it's a mere READ0 without the address specs and without the
+ * READSTART command which the READ0 convenience logic would imply
+ */
+#define NAND_CMD_READMODE	0x100
+
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
-- 
1.7.10.4
