Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QasAw-0006aI-UD
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 16:27:12 +0000
Received: by wyf23 with SMTP id 23so3462571wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 09:27:06 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] nand_wait : warn if the nand is busy on exit
Date: Sun, 26 Jun 2011 18:26:52 +0200
Message-Id: <1309105616-3609-2-git-send-email-matthieu.castet@parrot.com>
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

This patch allow to detect buggy driver/hardware with
bad RnB (dev_ready) management.
This check cost nothing and could help to detect bugs.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7fd3..095dfea 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -885,6 +885,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
 	status = (int)chip->read_byte(mtd);
+	/* This can happen if in case of timeout or buggy dev_ready */
+	WARN_ON(!(status & NAND_STATUS_READY));
 	return status;
 }
 
-- 
1.7.5.4
