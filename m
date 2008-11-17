Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2BOK-0000zo-NM
	for linux-mtd@lists.infradead.org; Mon, 17 Nov 2008 21:12:17 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch 2.6.28-rc5] mtd m25p80: regression fix for chip detection
Date: Mon, 17 Nov 2008 11:37:17 -0800
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200811171137.17431.david-b@pacbell.net>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Chen Gong <g.chen@freescale.com>, lkml <linux-kernel@vger.kernel.org>
Reply-To: dbrownell@users.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

The "m25p80.c extended jedec support" patch introduced a regression
whereby every chip ended up matching the first entry in the list
of chips, since it parenthesized a test incorrectly.

This bug could cause MTD filesystem corruption, and all sorts crazy
stuff since all chips would appear to be small (128KB) Atmel chips
instead of what they really were.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: Chen Gong <g.chen@freescale.com>
---
 drivers/mtd/devices/m25p80.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -574,10 +574,11 @@ static struct flash_info *__devinit jede
 	for (tmp = 0, info = m25p_data;
 			tmp < ARRAY_SIZE(m25p_data);
 			tmp++, info++) {
-		if (info->jedec_id == jedec)
+		if (info->jedec_id == jedec) {
 			if (ext_jedec != 0 && info->ext_id != ext_jedec)
 				continue;
 			return info;
+		}
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
 	return NULL;
