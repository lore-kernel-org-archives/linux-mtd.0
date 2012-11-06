Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVglC-00044f-Ia
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 10:51:59 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so119710bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2012 02:51:55 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
Date: Tue,  6 Nov 2012 11:51:43 +0100
Message-Id: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- NAND_CMD_READID want an address that it is not scaled on x16 device (it is always 0x20)
- NAND_CMD_PARAM want 8 bits data

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5894c2c..abeb8e9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2851,6 +2851,8 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	int i;
 	int val;
 
+	/* ONFI need to be probed in 8 bits mode */
+	WARN_ON(chip->options & NAND_BUSWIDTH_16);
 	/* Try ONFI for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
-- 
1.7.10.4
