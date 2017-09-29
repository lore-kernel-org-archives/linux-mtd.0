Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxshj-00074M-As
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 10:39:39 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 1/2] mtd: nand: wait for tWHR after NAND_CMD_STATUS /
 NAND_CMD_READID
Date: Fri, 29 Sep 2017 19:38:39 +0900
Message-Id: <1506681520-13897-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For commands such as Read Status, Read ID, etc. the controller needs
to wait for tWHR before it reads out the first data.  If the controller
does not take care of it, the driver has to wait explicitly to make
sure to meet the spec.

Introduce NAND_WAIT_TWHR, which works like NAND_WAIT_TCCS.  The
driver can set this flag to let the core to handle the tWHR delay.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Add nand_whr_delay() helper
    Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR flag

 drivers/mtd/nand/nand_base.c | 21 +++++++++++++++++++--
 include/linux/mtd/rawnand.h  | 13 ++++++++-----
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b1cf32c..455085d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -676,6 +676,17 @@ static void nand_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
 	} while (time_before(jiffies, timeo));
 };
 
+static void nand_whr_delay(struct nand_chip *chip)
+{
+	if (!(chip->options & NAND_WAIT_TWHR))
+		return;
+
+	if (chip->data_interface && chip->data_interface->timings.sdr.tWHR_min)
+		ndelay(chip->data_interface->timings.sdr.tWHR_min / 1000);
+	else
+		ndelay(200);
+}
+
 /**
  * nand_command - [DEFAULT] Send command to NAND device
  * @mtd: MTD device structure
@@ -742,9 +753,12 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
+	case NAND_CMD_SET_FEATURES:
+		return;
+
 	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
+		nand_whr_delay(chip);
 		return;
 
 	case NAND_CMD_RESET:
@@ -871,9 +885,12 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
+	case NAND_CMD_SET_FEATURES:
+		return;
+
 	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
+		nand_whr_delay(chip);
 		return;
 
 	case NAND_CMD_RNDIN:
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 749bb08..bb0165b 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -213,13 +213,16 @@ enum nand_ecc_algo {
 
 /*
  * In case your controller is implementing ->cmd_ctrl() and is relying on the
- * default ->cmdfunc() implementation, you may want to let the core handle the
- * tCCS delay which is required when a column change (RNDIN or RNDOUT) is
- * requested.
- * If your controller already takes care of this delay, you don't need to set
- * this flag.
+ * default ->cmdfunc() implementation, you may want to let the core handle
+ * some delays to meet the timing specification.
+ * If your controller already takes care of these delays, you don't need to set
+ * the following flags.
  */
+
+/* tCCS for a column change (RNDIN or RNDOUT) */
 #define NAND_WAIT_TCCS		0x00200000
+/* tWHR for STATUS, READID, etc. */
+#define NAND_WAIT_TWHR		0x00400000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
2.7.4
