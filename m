Received: from faui40.informatik.uni-erlangen.de
 ([2001:638:a00:22:1ec1:deff:fef4:b7a0])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXpsq-0007BZ-Ir
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 08:28:31 +0000
Date: Fri, 25 May 2012 10:28:19 +0200
From: Christian Dietrich <christian.dietrich@informatik.uni-erlangen.de>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 vamos-dev@lists.cs.fau.de
Subject: [PATCH] mtd: dc21285.c: handle nw_gpio_lock correctly
Message-ID: <20120525082812.GA12238@faui49q.informatik.uni-erlangen.de>
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

nw_gpio_lock is a raw_spinlock_t, therefore raw_spin_lock_irqsave should be
used. it doesn't make a difference, while rlock is the first element of
spinlock_t.

Also the check for machine_is_netwinder() is a double check of
CONFIG_ARCH_NETWINDER.

Signed-off-by: Christian Dietrich <christian.dietrich@informatik.uni-erlangen.de>
---
 drivers/mtd/maps/dc21285.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index 080f060..38fbf23 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -38,9 +38,9 @@ static void nw_en_write(void)
 	 * we want to write a bit pattern XXX1 to Xilinx to enable
 	 * the write gate, which will be open for about the next 2ms.
 	 */
-	spin_lock_irqsave(&nw_gpio_lock, flags);
+	raw_spin_lock_irqsave(&nw_gpio_lock, flags);
 	nw_cpld_modify(CPLD_FLASH_WR_ENABLE, CPLD_FLASH_WR_ENABLE);
-	spin_unlock_irqrestore(&nw_gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&nw_gpio_lock, flags);
 
 	/*
 	 * let the ISA bus to catch on...
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
