Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfUhB-0004Gr-Gb
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 15:13:58 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 =?UTF-8?q?Karl=20Zhang=20=E5=BC=A0=E5=8F=8C=E9=94=A3=20=28karlzhang=29?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 1/5] mtd: nand: add basic stuff to support power-cut emulation
Date: Fri, 25 Sep 2015 17:09:14 +0200
Message-Id: <1443193758-22071-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new status flag to support power-cut emulation. Since real NAND
status is limited to 8bits, we can safely use higher bits for something
else. The NAND_STATUS_POWER_CUT is assigned bit 30 to avoid integer
overflow (not sure this is necessary).

The NAND status is currently retrieved using ->read_byte() after sending
a NAND_CMD_STATUS command, which prevents the nandsim (or any other
implementation that wants to support power-cut emulation) to return a
value with the NAND_STATUS_POWER_CUT flag set.
Add a ->get_status() method returning an int, and provide a default
implementation.

Also note that ->get_status() could be used for other cases than power-cut
emulation. For example, some NAND controllers are able to retrieve the
NAND status by their own after launching a specific command, and this
status is then stored in a specific register, thus preventing the extra
->cmdfunc() + ->read_byte() calls.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 17 ++++++++++++++---
 include/linux/mtd/nand.h     |  4 ++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 37c0d9d..a621814 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -478,8 +478,7 @@ static int nand_check_wp(struct mtd_info *mtd)
 		return 0;
 
 	/* Check the WP bit */
-	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
-	return (chip->read_byte(mtd) & NAND_STATUS_WP) ? 0 : 1;
+	return (chip->get_status(mtd) & NAND_STATUS_WP) ? 0 : 1;
 }
 
 /**
@@ -880,6 +879,15 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 }
 
+static int nand_get_status(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+
+	return (int)chip->read_byte(mtd);
+}
+
 /**
  * nand_wait - [DEFAULT] wait until the command is done
  * @mtd: MTD device structure
@@ -922,7 +930,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	}
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
-	status = (int)chip->read_byte(mtd);
+	status = chip->get_status(mtd);
 	/* This can happen if in case of timeout or buggy dev_ready */
 	WARN_ON(!(status & NAND_STATUS_READY));
 	return status;
@@ -3106,6 +3114,9 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 	if (chip->cmdfunc == NULL)
 		chip->cmdfunc = nand_command;
 
+	if (!chip->get_status)
+		chip->get_status = nand_get_status;
+
 	/* check, if a user supplied wait function given */
 	if (chip->waitfunc == NULL)
 		chip->waitfunc = nand_wait;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c4d8e30..075d7b8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -107,6 +107,9 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_STATUS_READY	0x40
 #define NAND_STATUS_WP		0x80
 
+/* Status bits reserved for NAND emulation */
+#define NAND_STATUS_POWER_CUT	0x40000000
+
 /*
  * Constants for ECC_MODES
  */
@@ -661,6 +664,7 @@ struct nand_chip {
 	int (*init_size)(struct mtd_info *mtd, struct nand_chip *this,
 			u8 *id_data);
 	int (*dev_ready)(struct mtd_info *mtd);
+	int (*get_status)(struct mtd_info *mtd);
 	void (*cmdfunc)(struct mtd_info *mtd, unsigned command, int column,
 			int page_addr);
 	int(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
-- 
1.9.1
