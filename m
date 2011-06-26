Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QasAw-0006aJ-Dh
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 16:27:15 +0000
Received: by wwf22 with SMTP id 22so2949781wwf.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 09:27:08 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] nand_wait_read : add code to wait on status for LP
Date: Sun, 26 Jun 2011 18:26:54 +0200
Message-Id: <1309105616-3609-4-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use read status instead of waiting a fixed time.

For reading data after read status a command 0x0 should be issued (on large page) [1].
Only apply it for driver that use nand_command_lp, because other cmdfunc won't expect
NAND_CMD_READ0 without address.

[1]
While monitoring the read status to determine when the tR (transfer from Flash array to page
register) is complete, the host shall re-issue a command value of 00h to start reading data.
Issuing a command value of 00h will cause data to be returned starting at the selected column
address.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 70af1c0..5f0a0de 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -703,6 +703,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		return;
 
 	case NAND_CMD_READ0:
+		if (column == -1 && page_addr == -1)
+			return;
 		chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
 			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
@@ -889,11 +891,20 @@ static void nand_wait_reset(struct mtd_info *mtd, struct nand_chip *chip)
   */
 static void nand_wait_read(struct mtd_info *mtd, struct nand_chip *chip)
 {
+	if (!chip->dev_ready && chip->cmdfunc == nand_command_lp) {
+		int status;
+		/* same timeout than nand_wait_ready */
+		unsigned long timeo = jiffies + (2 * HZ) / 1000;
+		status = nand_wait_timeout(mtd, chip, timeo);
+		WARN_ON(!(status & NAND_STATUS_READY));
+		/* start reading data */
+		chip->cmdfunc(mtd, NAND_CMD_READ0, -1, -1);
+	}
 	/*
 	 * If we don't have access to the busy pin, we apply the given
 	 * command delay
 	 */
-	if (!chip->dev_ready) {
+	else if (!chip->dev_ready) {
 		udelay(chip->chip_delay);
 	}
 	else {
-- 
1.7.5.4
