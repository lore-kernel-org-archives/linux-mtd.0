Received: from smtp117.sbc.mail.sp1.yahoo.com ([69.147.64.90])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrgZh-00035B-0R
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 22:16:37 +0000
Content-Disposition: inline
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd m25p80: add support for Macronix MX25L12805D
Date: Sun, 19 Oct 2008 15:16:30 -0700
MIME-Version: 1.0
Message-Id: <200810191516.30804.david-b@pacbell.net>
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Lennert Buytenhek <buytenh@wantstofly.org>

Support one more flavor of SPI flash:  Macronix MX25L12805D
(128 Mbit, 16 MByte).

Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>
Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>

--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -467,6 +467,9 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "at26df161a", 0x1f4601, 64 * 1024, 32, SECT_4K, },
 	{ "at26df321",  0x1f4701, 64 * 1024, 64, SECT_4K, },
 
+	/* Macronix */
+	{ "mx25l12805d", 0xc22018, 64 * 1024, 256, SECT_4K, },
+
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
