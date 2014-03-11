Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNG6W-000120-QK
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 06:23:57 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [RFC PATCH] UBIFS: remove check for all(0xff) for empty pages
Date: Tue, 11 Mar 2014 11:53:12 +0530
Message-ID: <1394518992-26969-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Kent Li <Kent.Li@radisys.com>,
 HOUR Frderic <frederic.hour@safran-engineering.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS throws following error if an blank page does not contain perfect all(0xff)
data, during LEB scan, even though if number of bit-flips is within ecc.strength
	"UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 417:53168"

But newer technology devices (like MLC NAND) are prone to read-disturb bit-flips
and so having perfect all(0xff) data on empty-pages is practically not feasible
on these newer technology devices (like MLC NAND).
Also, such device spec suggest using stronger ECC schemes (like BCH16), and have
large OOB size to guarantee longer field life.

So this check of perfect all(0xff) data can be safely removed from UBIFS, as
UBI and MTD layers already these before passing the data to UBIFS:
 if (number-of-bitflips < mtd->bitflip_threshold)
        Driver's ECC scheme is strong enough to handle existing bit-flips in
        future, so both MTD and UBI ignore such bit-flips.
 if (number-of-bitflips >= mtd->bitflip_threshold)
        MTD flags -EUCLEAN.
        UBI schedules the block for scrubbing.
 if (number-of-bitflips > nand_chip->ecc.strength)
        MTD flags -EBADMSG.
        UBI tries to extract data relevant data from block based on sanity of
        its headers, and then schedule it for re-erase.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 fs/ubifs/scan.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 58aa05d..b6ab396 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -332,17 +332,6 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 
 	ubifs_end_scan(c, sleb, lnum, offs);
 
-	for (; len > 4; offs += 4, buf = buf + 4, len -= 4)
-		if (*(uint32_t *)buf != 0xffffffff)
-			break;
-	for (; len; offs++, buf++, len--)
-		if (*(uint8_t *)buf != 0xff) {
-			if (!quiet)
-				ubifs_err("corrupt empty space at LEB %d:%d",
-					  lnum, offs);
-			goto corrupted;
-		}
-
 	return sleb;
 
 corrupted:
-- 
1.8.5.1.163.gd7aced9
