Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Yxt5J-0005Uy-NR
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 08:22:38 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: dc21285: use raw spinlock functions for nw_gpio_lock
Date: Thu, 28 May 2015 10:22:10 +0200
Message-Id: <1432801330-26406-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
 Ingo Molnar <mingo@elte.hu>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit bd31b85960a7 (which is in 3.2-rc1) nw_gpio_lock is a raw spinlock
that needs usage of the corresponding raw functions.

This fixes:

  drivers/mtd/maps/dc21285.c: In function 'nw_en_write':
  drivers/mtd/maps/dc21285.c:41:340: warning: passing argument 1 of 'spinlock_check' from incompatible pointer type
    spin_lock_irqsave(&nw_gpio_lock, flags);

  In file included from include/linux/seqlock.h:35:0,
                   from include/linux/time.h:5,
                   from include/linux/stat.h:18,
                   from include/linux/module.h:10,
                   from drivers/mtd/maps/dc21285.c:8:
  include/linux/spinlock.h:299:102: note: expected 'struct spinlock_t *' but argument is of type 'struct raw_spinlock_t *'
   static inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
                                                                                                        ^
  drivers/mtd/maps/dc21285.c:43:25: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type
    spin_unlock_irqrestore(&nw_gpio_lock, flags);
                           ^
  In file included from include/linux/seqlock.h:35:0,
                   from include/linux/time.h:5,
                   from include/linux/stat.h:18,
                   from include/linux/module.h:10,
                   from drivers/mtd/maps/dc21285.c:8:
  include/linux/spinlock.h:370:91: note: expected 'struct spinlock_t *' but argument is of type 'struct raw_spinlock_t *'
   static inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)

Fixes: bd31b85960a7 ("locking, ARM: Annotate low level hw locks as raw")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/maps/dc21285.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index f8a7dd14cee0..70a3db3ab856 100644
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
-- 
2.1.4
