Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kre2y-0003D2-LF
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 19:34:41 +0000
Date: Sun, 19 Oct 2008 19:32:52 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: dbrownell@users.sourceforge.net,
	spi-devel-general@lists.sourceforge.net
Subject: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
Message-ID: <20081019173252.GA16094@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Resent-Message-Id: <20081019193440.0945B7FAB3@xi.wantstofly.org>
Cc: nico@marvell.com, prafulla@marvell.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b35c333..299047e 100644
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
