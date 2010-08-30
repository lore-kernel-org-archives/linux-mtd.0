Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq7Ku-00029d-FS
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 16:35:56 +0000
Received: by wyb38 with SMTP id 38so5714531wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 09:35:55 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Mon, 30 Aug 2010 18:32:20 +0200
Subject: [PATCH 2/3 v3] NAND: denali should also handle NAND_CMD_PARAM
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Maxime Bizon <mbizon@freebox.fr>,
	"Chuanxiao.Dong" <chuanxiao.dong@intel.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008301832.20552.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 532fe07..8c8d3c8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1292,6 +1292,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 		read_status(denali);
 		break;
 	case NAND_CMD_READID:
+	case NAND_CMD_PARAM:
 		reset_buf(denali);
 		/*sometimes ManufactureId read from register is not right
 		 * e.g. some of Micron MT29F32G08QAA MLC NAND chips
