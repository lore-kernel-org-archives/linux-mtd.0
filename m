Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JUIGq-0001yJ-G5
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 09:08:12 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JUHb4-0002to-PR
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 08:25:02 +0000
Received: from 78-62-85-225.ip.zebra.lt ([78.62.85.225])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2008 08:25:02 +0000
Received: from paulius.zaleckas by 78-62-85-225.ip.zebra.lt with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2008 08:25:02 +0000
To: linux-mtd@lists.infradead.org
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: [PATCH] MTD-XIP: Use generic xip_iprefetch() instead of asm volatile
	(...)
Date: Wed, 27 Feb 2008 01:42:39 +0200
Message-ID: <fq285f$isa$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Untested, but shouldn't break anything...
Makes MTD_XIP arch independent. I guess this is why xip_iprefetch() was made for.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>

---
  drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++--
  drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++--
  drivers/mtd/chips/cfi_probe.c       |    2 +-
  drivers/mtd/chips/cfi_util.c        |    2 +-
  4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 1707f98..c54d0b6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1007,10 +1007,10 @@ static int __xipram xip_wait_for_operation(
  			chip->state = newstate;
  			map_write(map, CMD(0xff), adr);
  			(void) map_read(map, adr);
-			asm volatile (".rep 8; nop; .endr");
+			xip_iprefetch();
  			local_irq_enable();
  			spin_unlock(chip->mutex);
-			asm volatile (".rep 8; nop; .endr");
+			xip_iprefetch();
  			cond_resched();

  			/*
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 389acc6..f71cd70 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -717,10 +717,10 @@ static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
  			chip->erase_suspended = 1;
  			map_write(map, CMD(0xf0), adr);
  			(void) map_read(map, adr);
-			asm volatile (".rep 8; nop; .endr");
+			xip_iprefetch();
  			local_irq_enable();
  			spin_unlock(chip->mutex);
-			asm volatile (".rep 8; nop; .endr");
+			xip_iprefetch();
  			cond_resched();

  			/*
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 60e11a0..648a0a5 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -39,7 +39,7 @@ struct mtd_info *cfi_probe(struct map_info *map);
  #define xip_allowed(base, map) \
  do { \
  	(void) map_read(map, base); \
-	asm volatile (".rep 8; nop; .endr"); \
+	xip_iprefetch(); \
  	local_irq_enable(); \
  } while (0)

diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 2e51496..72e0022 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -65,7 +65,7 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n

  #ifdef CONFIG_MTD_XIP
  	(void) map_read(map, base);
-	asm volatile (".rep 8; nop; .endr");
+	xip_iprefetch();
  	local_irq_enable();
  #endif

-- 
