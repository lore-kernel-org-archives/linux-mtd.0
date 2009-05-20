Received: from mail.wantstofly.org ([2001:888:11ff:97::11])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6jb2-0005C7-KW
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 11:04:31 +0000
Date: Wed, 20 May 2009 13:07:11 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
Message-ID: <20090520110711.GA5712@mail.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8185b1f..ce116e1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -498,6 +498,9 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "at26df161a", 0x1f4601, 0, 64 * 1024, 32, SECT_4K, },
 	{ "at26df321",  0x1f4701, 0, 64 * 1024, 64, SECT_4K, },
 
+	/* Macronix */
+	{ "mx25l12805d", 0xc22018, 0, 64 * 1024, 256, },
+
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
