Received: from faui40.informatik.uni-erlangen.de
 ([2001:638:a00:22:1ec1:deff:fef4:b7a0])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SZJKD-00005U-3A
 for linux-mtd@lists.infradead.org; Tue, 29 May 2012 10:06:50 +0000
Date: Tue, 29 May 2012 12:06:46 +0200
From: Christian Dietrich <christian.dietrich@informatik.uni-erlangen.de>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: dc21285.c: remove double check of CONFIG_ARCH_NETWINDER
Message-ID: <20120529100646.GA23383@faui49q.informatik.uni-erlangen.de>
References: <1338040464.2525.38.camel@koala>
 <20120525082812.GA12238@faui49q.informatik.uni-erlangen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1338040464.2525.38.camel@koala>
Cc: vamos-dev@lists.cs.fau.de, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Christian Dietrich <christian.dietrich@informatik.uni-erlangen.de>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When CONFIG_ARCH_NETWINDER is unset nw_en_write is a NOP. But
machine_is_netwinder() also checks for
CONFIG_ARCH_NETWINDER. Therefore in the !netwinder case the
preprocessed code is:

if (0)
   do {} while(0);

Signed-off-by: Christian Dietrich <christian.dietrich@informatik.uni-erlangen.de>
---
 drivers/mtd/maps/dc21285.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index 86598a1..38fbf23 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -79,8 +79,7 @@ static void dc21285_copy_from(struct map_info *map, void *to, unsigned long from
 
 static void dc21285_write8(struct map_info *map, const map_word d, unsigned long adr)
 {
-	if (machine_is_netwinder())
-		nw_en_write();
+	nw_en_write();
 	*CSR_ROMWRITEREG = adr & 3;
 	adr &= ~3;
 	*(uint8_t*)(map->virt + adr) = d.x[0];
@@ -88,8 +87,7 @@ static void dc21285_write8(struct map_info *map, const map_word d, unsigned long
 
 static void dc21285_write16(struct map_info *map, const map_word d, unsigned long adr)
 {
-	if (machine_is_netwinder())
-		nw_en_write();
+	nw_en_write();
 	*CSR_ROMWRITEREG = adr & 3;
 	adr &= ~3;
 	*(uint16_t*)(map->virt + adr) = d.x[0];
@@ -97,8 +95,7 @@ static void dc21285_write16(struct map_info *map, const map_word d, unsigned lon
 
 static void dc21285_write32(struct map_info *map, const map_word d, unsigned long adr)
 {
-	if (machine_is_netwinder())
-		nw_en_write();
+	nw_en_write();
 	*(uint32_t*)(map->virt + adr) = d.x[0];
 }
 
-- 
1.7.5.4
