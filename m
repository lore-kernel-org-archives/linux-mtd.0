Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW2aG-00072u-L1
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 11:46:57 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/3] mtd: nand: introduce a READMODE command
Date: Fri,  4 Apr 2014 13:45:48 +0200
Message-Id: <1396611948-4523-4-git-send-email-gsi@denx.de>
In-Reply-To: <1396611948-4523-1-git-send-email-gsi@denx.de>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
Cc: Alexander Shiyan <shc_work@mail.ru>, David Mosberger <davidm@egauge.net>,
 Gerhard Sittig <gsi@denx.de>, Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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

for the non-"large page" setup (i.e. the nand_command() routine) both
commands "READMODE" and "READ0" are identical, "READSTART" exclusively
applies to large page configurations

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
changes in v2:
- update the commmit message to discuss that for the nand_command()
  routine READMODE results in identical behaviour as READ0
- rephrase the NAND_CMD_READMODE command to better reflect that it
  re-uses the NAND_CMD_READ0 opcode plus has high bits set

 drivers/mtd/nand/nand_base.c |    4 +++-
 include/linux/mtd/nand.h     |   11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7108191b1598..50b8a2a93b4f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -711,7 +711,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 
 	/*
 	 * Program and erase have their own busy handlers status, sequential
-	 * in and status need no delay.
+	 * in and status need no delay, read mode just reverts back to
+	 * data output after a status command and needs no read start.
 	 */
 	switch (command) {
 
@@ -722,6 +723,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_RNDIN:
 	case NAND_CMD_STATUS:
+	case NAND_CMD_READMODE:
 		return;
 
 	case NAND_CMD_RESET:
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 32f8612469d8..f294c9a47143 100644
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
+#define NAND_CMD_READMODE	(0x100 | NAND_CMD_READ0)
+
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
-- 
1.7.10.4
