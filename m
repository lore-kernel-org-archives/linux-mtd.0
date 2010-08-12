Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjXIA-0003WW-Cr
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 12:53:55 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
Date: Thu, 12 Aug 2010 14:53:46 +0200
Subject: [PATCH 2/3] NAND: denali should also handle NAND_CMD_PARAM
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008121453.46569.ffainelli@freebox.fr>
Cc: Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	"Chuanxiao.Dong" <chuanxiao.dong@intel.com>
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
Note: this has not been runtime tested.

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
