Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVNEW-0005uZ-Rs
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2012 14:00:59 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so1941062bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2012 06:00:53 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_wait : warn if the nand is busy on exit
Date: Mon,  5 Nov 2012 15:00:44 +0100
Message-Id: <1352124044-31627-1-git-send-email-matthieu.castet@parrot.com>
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allow to detect buggy driver/hardware with
bad RnB (dev_ready) management or when timeout occurs in polling mode.

This works when dev_ready is set or not set.
There are 2 methods to wait for an erase/program command completion:

1. Wait until nand RnB pin goes high (that's what chip->dev_ready usually does)
2. Poll the device: send a status (0x70) command and read status byte in a loop
   until bit NAND_STATUS_READY is set

In all cases, you should send a status command after completion, to check if
the operation was successful. And if the operation completed, the status should
have bit NAND_STATUS_READY set.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
CC: Ivan Djelic <ivan.djelic@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ee49fe2..5894c2c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -865,6 +865,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
 	status = (int)chip->read_byte(mtd);
+	/* This can happen if in case of timeout or buggy dev_ready */
+	WARN_ON(!(status & NAND_STATUS_READY));
 	return status;
 }
 
-- 
1.7.10.4
