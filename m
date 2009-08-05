Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYpjG-0002LH-TK
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 23:17:11 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KNX0036ZETLGS51@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 19:05:45 -0400 (EDT)
Date: Wed, 05 Aug 2009 19:16:54 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: add support for 3 Macronix flash chips
Message-id: <alpine.LFD.2.00.0908051913310.16073@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Siddarth Gore <gores@marvell.com>
Date: Tue, 4 Aug 2009 08:42:08 +0530

Signed-off-by: Siddarth Gore <gores@marvell.com>
Signed-off-by: Nicolas Pitre <nico@marvell.com>
---
 drivers/mtd/devices/m25p80.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ae5fe91..2bcdd83 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -501,7 +501,10 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "at26df321",  0x1f4701, 0, 64 * 1024, 64, SECT_4K, },
 
 	/* Macronix */
+	{ "mx25l3205d", 0xc22016, 0, 64 * 1024, 64, },
+	{ "mx25l6405d", 0xc22017, 0, 64 * 1024, 128, },
 	{ "mx25l12805d", 0xc22018, 0, 64 * 1024, 256, },
+	{ "mx25l12855e", 0xc22618, 0, 64 * 1024, 256, },
 
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
