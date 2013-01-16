Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvTwj-0002BA-3W
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 14:26:29 +0000
Received: by mail-wi0-f178.google.com with SMTP id hn3so1287143wib.5
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2013 06:26:25 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: onfi don't WARN if we are in 16 bits mode
Date: Wed, 16 Jan 2013 15:25:45 +0100
Message-Id: <1358346345-7920-1-git-send-email-matthieu.castet@parrot.com>
Cc: paul@pwsan.com, Matthieu CASTET <matthieu.castet@parrot.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ff3206b2450499203532af2505a7f6f8413e92c0 adds a WARN if the onfi probe is
in 16 bits mode.
This allows to detect driver that need to be fixed, but this is a bit noisy [1].
Transform the WARN in a pr_err.

[1]
http://article.gmane.org/gmane.linux.ports.arm.omap/91317

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8323ac9..3766682 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2857,8 +2857,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	int i;
 	int val;
 
-	/* ONFI need to be probed in 8 bits mode */
-	WARN_ON(chip->options & NAND_BUSWIDTH_16);
+	/* ONFI need to be probed in 8 bits mode, and 16 bits should be selected with NAND_BUSWIDTH_AUTO */
+	if (chip->options & NAND_BUSWIDTH_16) {
+		pr_err("Trying ONFI probe in 16 bits mode, aborting !\n");
+		return 0;
+	}
 	/* Try ONFI for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
-- 
1.7.10.4
