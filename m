Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OAR3H-0004Sh-Rp
	for linux-mtd@lists.infradead.org; Fri, 07 May 2010 17:09:28 +0000
Received: by wwb22 with SMTP id 22so238237wwb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 May 2010 10:09:25 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Fri, 7 May 2010 19:09:13 +0200
Subject: [PATCH] NAND: add Toshiba TC58NVG0 device ID
MIME-Version: 1.0
To: David Woodhouse <david.woodhouse@intel.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201005071909.13259.florian@openwrt.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This NAND flash part advertises 0xD1 as an identifier but is still a working
128MBytes x 8bits 3.3V NAND part.

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 69ee2c9..89907ed 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -82,6 +82,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	/* 1 Gigabit */
 	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
 	{"NAND 128MiB 3,3V 8-bit",	0xF1, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 3,3V 8-bit",	0xD1, 0, 128, 0, LP_OPTIONS},
 	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
 	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
 
