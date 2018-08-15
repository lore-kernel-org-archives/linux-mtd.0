Received: from gateway30.websitewelcome.com ([192.185.149.4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpzCE-0007hk-CA
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2018 17:02:59 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 070BA4D101
 for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2018 12:02:36 -0500 (CDT)
Date: Wed, 15 Aug 2018 12:02:26 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: cfi_cmdset_0020: Mark expected switch fall-throughs
Message-ID: <20180815170226.GA14553@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 114857 ("Missing break in switch")
Addresses-Coverity-ID: 114858 ("Missing break in switch")
Addresses-Coverity-ID: 114859 ("Missing break in switch")
Addresses-Coverity-ID: 114860 ("Missing break in switch")
Addresses-Coverity-ID: 114861 ("Missing break in switch")
Addresses-Coverity-ID: 114862 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/chips/cfi_cmdset_0020.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 35aa72b..e752067 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -324,6 +324,7 @@ static inline int do_read_onechip(struct map_info *map, struct flchip *chip, lof
 	case FL_JEDEC_QUERY:
 		map_write(map, CMD(0x70), cmd_addr);
 		chip->state = FL_STATUS;
+		/* Fall through */
 
 	case FL_STATUS:
 		status = map_read(map, cmd_addr);
@@ -461,6 +462,7 @@ static int do_write_buffer(struct map_info *map, struct flchip *chip,
 #ifdef DEBUG_CFI_FEATURES
 	printk("%s: 1 status[%x]\n", __func__, map_read(map, cmd_adr));
 #endif
+		/* Fall through */
 
 	case FL_STATUS:
 		status = map_read(map, cmd_adr);
@@ -754,6 +756,7 @@ static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, u
 	case FL_READY:
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
+		/* Fall through */
 
 	case FL_STATUS:
 		status = map_read(map, adr);
@@ -995,6 +998,7 @@ static void cfi_staa_sync (struct mtd_info *mtd)
 			 * as the whole point is that nobody can do anything
 			 * with the chip now anyway.
 			 */
+			/* Fall through */
 		case FL_SYNCING:
 			mutex_unlock(&chip->mutex);
 			break;
@@ -1050,6 +1054,7 @@ static inline int do_lock_oneblock(struct map_info *map, struct flchip *chip, un
 	case FL_READY:
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
+		/* Fall through */
 
 	case FL_STATUS:
 		status = map_read(map, adr);
@@ -1196,6 +1201,7 @@ static inline int do_unlock_oneblock(struct map_info *map, struct flchip *chip,
 	case FL_READY:
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
+		/* Fall through */
 
 	case FL_STATUS:
 		status = map_read(map, adr);
-- 
2.7.4
