Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlhLe-0005Y7-0A
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 12:02:26 +0000
Received: by wwe15 with SMTP id 15so707213wwe.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Aug 2010 05:02:24 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Wed, 18 Aug 2010 14:01:12 +0200
Subject: [PATCH 2/4 v2] NAND: denali should also handle NAND_CMD_PARAM
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008181401.12945.florian@openwrt.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	"Chuanxiao.Dong" <chuanxiao.dong@intel.com>,
	Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>
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
