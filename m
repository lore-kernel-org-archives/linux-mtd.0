Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq7KL-00023q-Ip
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 16:35:22 +0000
Received: by wyb38 with SMTP id 38so5713762wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 09:35:20 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Mon, 30 Aug 2010 18:32:14 +0200
Subject: [PATCH 1/3 v3] NAND: add NAND_CMD_PARAM (0xec) definition
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008301832.14935.florian@openwrt.org>
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

This command is used to read the device ONFI parameters page.

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
