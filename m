Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlhLY-0005Qd-Jy
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 12:02:22 +0000
Received: by eye22 with SMTP id 22so248900eye.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Aug 2010 05:02:18 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Wed, 18 Aug 2010 14:01:07 +0200
Subject: [PATCH 1/4 v2] NAND: add NAND_CMD_PARAM (0xec) definition
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008181401.07406.florian@openwrt.org>
Cc: Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This command is used to read the device ONFI paramaters page.

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 102e12c..8b288b6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -88,6 +88,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_CMD_RNDIN		0x85
 #define NAND_CMD_READID		0x90
 #define NAND_CMD_ERASE2		0xd0
+#define NAND_CMD_PARAM		0xec
 #define NAND_CMD_RESET		0xff
 
 #define NAND_CMD_LOCK		0x2a
