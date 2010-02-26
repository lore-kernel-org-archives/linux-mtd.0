Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nl7Cg-0007GV-Jl
	for linux-mtd@lists.infradead.org; Fri, 26 Feb 2010 20:54:35 +0000
Message-ID: <4B8834FB.2070004@netinsight.net>
Date: Fri, 26 Feb 2010 21:54:19 +0100
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <anders.grafstrom@netinsight.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0001: Fix max timeout for locking operations
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The max timeout is currently too short for some flash chips.
This patch increases it to 10 seconds. The typical timeout
remains unchanged (the tick period, 1000000/HZ).

Specification change #11 in '5 Volt Intel StrataFlash Memory Specification Update'
(297848-15) specifies an increase of Clear Block Lock-Bit Time Max to 7 sec.
This is contradicted by the table in Specification Change #8 which says .70 sec
but a 10 sec timeout doesn't hurt so play it safe.

Signed-off-by: Anders Grafström <anders.grafstrom@netinsight.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 9253043..83e4ae2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2077,7 +2077,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 	 */
 	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
 
-	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * HZ * 10);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
-- 
1.6.6.1
