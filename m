Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Krfx9-0006JD-83
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 21:36:48 +0000
Date: Sun, 19 Oct 2008 23:36:46 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
Message-ID: <20081019213646.GI4129@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
