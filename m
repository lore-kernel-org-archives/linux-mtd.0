Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L85Tr-00062A-10
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 04:06:23 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KBC00M433ELTOC0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 03 Dec 2008 23:06:22 -0500 (EST)
Date: Wed, 03 Dec 2008 23:06:21 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] m25p80: add support for Macronix MX25L12805D
Message-id: <alpine.LFD.2.00.0812032302430.14328@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Lennert Buytenhek <buytenh@marvell.com>

Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>
Signed-off-by: Nicolas Pitre <nico@marvell.com>
---

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 76a7675..9e23588 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -500,6 +500,9 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "at26df161a", 0x1f4601, 0, 64 * 1024, 32, SECT_4K, },
 	{ "at26df321",  0x1f4701, 0, 64 * 1024, 64, SECT_4K, },
 
+	/* Macronix */
+	{ "mx25l12805d", 0xc22018, 64 * 1024, 256, SECT_4K, },
+
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
