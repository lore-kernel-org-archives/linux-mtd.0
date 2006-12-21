Date: Thu, 21 Dec 2006 16:07:24 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH/RFC] CFI XIP support on chip with RWW
Message-ID: <Pine.LNX.4.64.0612211514580.18123@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: dwmw2@infradead.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

The XIP awareness feature in MTD provides a safe way to use XIP but it introduces some significant issues too,
The issues are following:

1.	Large interrupt latency
2.	Lower write/erase performance (due to suspend/resume) 
3.	~100% CPU load during write or erase operations with flash

In other hands if chip with Read While Write feature (or several chips) are used it is possible to avoid all these XIP related issues.

To provide it from s/w it is necessary to separate wait procedures for RWW partitions with XIP and without XIP. 
Idea is simple user specify memory region planned for XIP - according to this data, the code marks XIP flag for some RWW partitions. 
RWW partitions with XIP flag are handled by wait procedures with XIP awareness. All other RWW partitions are handled by default wait procedures. 
Please see the code below. Your comments are welcome.

Thanks,
Alexey

[CFI] XIP awareness for chips with RWW 
Signed-off by: Alexey Korolev <akorolev@infradead.org>
----------

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 72e6d73..68619c5 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -285,5 +285,46 @@ config MTD_XIP
  	  used for XIP purposes.  If you're not sure what this is all about
  	  then say N.

+config MTD_XIP_REGIONS
+	bool "Specify regions for XIP aware support"
+	depends on MTD_XIP
+	help
+	  This allows MTD to use XIP awarennes support for specified regions only.
+	  This option make sence when multipartitioned NOR chips are used.
+	  If you're not sure what this is all about
+	  then say N.
+
+config MTD_XIPREG_1_START
+	hex "Physical start address of first XIP region"
+	depends on MTD_XIP_REGIONS
+	default "0x0"
+	help
+	  This is the physical start address of first memory region which is used 
+	  for application or kernel XIP. 
+
+config MTD_XIPREG_1_LEN
+	hex "Physical length of first XIP region"
+	depends on MTD_XIP_REGIONS
+	default "0x0"
+	help
+	  This is the length of first memory region which is used 
+	  for application or kernel XIP. 
+
+config MTD_XIPREG_2_START
+	hex "Physical start address of second XIP region"
+	depends on MTD_XIP_REGIONS
+	default "0x0"
+	help
+	  This is the physical start address of second memory region which is used 
+	  for application or kernel XIP. 
+
+config MTD_XIPREG_2_LEN
+	hex "Physical length of second XIP region"
+	depends on MTD_XIP_REGIONS
+	default "0x0"
+	help
+	  This is the length of first memory region which is used 
+	  for application or kernel XIP. 
+
  endmenu

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index f69184a..1adfa20 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -595,6 +595,7 @@ static int cfi_intelext_partition_fixup(
  				init_waitqueue_head(&chip->wq);
  				spin_lock_init(&chip->_spinlock);
  				chip->mutex = &chip->_spinlock;
+				chip->xip_mode = xip_partition(map->phys, chip->start, 1<<partshift);
  				chip++;
  			}
  		}
@@ -874,7 +875,9 @@ #ifdef CONFIG_MTD_XIP
  static void xip_disable(struct map_info *map, struct flchip *chip,
  			unsigned long adr)
  {
-	/* TODO: chips with no XIP use should ignore and return */
+	/* Check if this particular chip requires XIP awareness */
+	if ( !chip->xip_mode )
+	    return;
  	(void) map_read(map, adr); /* ensure mmu mapping is up to date */
  	local_irq_disable();
  }
@@ -883,6 +886,9 @@ static void __xipram xip_enable(struct m
  				unsigned long adr)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
+	if ( !chip->xip_mode )
+	    return;
+
  	if (chip->state != FL_POINT && chip->state != FL_READY) {
  		map_write(map, CMD(0xff), adr);
  		chip->state = FL_READY;
@@ -1023,11 +1029,19 @@ static int __xipram xip_wait_for_operati
   * a XIP setup so do it before the actual flash operation in this case
   * and stub it out from INVAL_CACHE_AND_WAIT.
   */
-#define XIP_INVAL_CACHED_RANGE(map, from, size)  \
-	INVALIDATE_CACHED_RANGE(map, from, size)
-
-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, usec)
+#define XIP_INVAL_CACHED_RANGE(map, chip, from, size) 		\
+	do {							\
+		if ((chip)->xip_mode)	{			\
+    		    INVALIDATE_CACHED_RANGE(map, from, size);	\
+		}						\
+	} while (0)
+
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec)  \
+	( ((chip)->xip_mode) ?							\
+		xip_wait_for_operation(map, chip, cmd_adr, usec) 	        \
+	    :     								\
+		inval_cache_and_wait_for_operation(map, chip, cmd_adr, 		\
+					inval_adr, inval_len, usec)  )

  #else

@@ -1036,6 +1050,11 @@ #define xip_enable(map, chip, adr)
  #define XIP_INVAL_CACHED_RANGE(x...)
  #define INVAL_CACHE_AND_WAIT inval_cache_and_wait_for_operation

+#endif /* CONFIG_MTD_XIP */
+
+#define WAIT_TIMEOUT(map, chip, adr, udelay) \
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
+
  static int inval_cache_and_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
  		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
@@ -1103,11 +1122,6 @@ static int inval_cache_and_wait_for_oper
  	return 0;
  }

-#endif
-
-#define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
-

  static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
  {
@@ -1321,7 +1335,7 @@ static int __xipram do_write_oneword(str
  		return ret;
  	}

-	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
+	XIP_INVAL_CACHED_RANGE(map, chip, adr, map_bankwidth(map));
  	ENABLE_VPP(map);
  	xip_disable(map, chip, adr);
  	map_write(map, write_cmd, adr);
@@ -1475,7 +1489,7 @@ static int __xipram do_write_buffer(stru
  		return ret;
  	}

-	XIP_INVAL_CACHED_RANGE(map, adr, len);
+	XIP_INVAL_CACHED_RANGE(map, chip, adr, len);
  	ENABLE_VPP(map);
  	xip_disable(map, chip, cmd_adr);

@@ -1687,7 +1701,7 @@ static int __xipram do_erase_oneblock(st
  		return ret;
  	}

-	XIP_INVAL_CACHED_RANGE(map, adr, len);
+	XIP_INVAL_CACHED_RANGE(map, chip, adr, len);
  	ENABLE_VPP(map);
  	xip_disable(map, chip, adr);

diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
index a293a3b..b53a28c 100644
--- a/include/linux/mtd/flashchip.h
+++ b/include/linux/mtd/flashchip.h
@@ -74,6 +74,7 @@ struct flchip {
  	int word_write_time;
  	int buffer_write_time;
  	int erase_time;
+	int xip_mode;  /* Defines need we XIP awareness for the chip or not */

  	void *priv;
  };
diff --git a/include/linux/mtd/xip.h b/include/linux/mtd/xip.h
index e9d40bd..05ef270 100644
--- a/include/linux/mtd/xip.h
+++ b/include/linux/mtd/xip.h
@@ -18,7 +18,6 @@
  #ifndef __LINUX_MTD_XIP_H__
  #define __LINUX_MTD_XIP_H__

-
  #ifdef CONFIG_MTD_XIP

  /*
@@ -92,9 +91,38 @@ #ifndef xip_cpu_idle
  #define xip_cpu_idle()  do { } while (0)
  #endif

+#ifdef CONFIG_MTD_XIP_REGIONS
+
+static int xipreg_intersection( unsigned long phys_adr, unsigned long chip_start, unsigned long chip_len )
+{
+
+	if ( CONFIG_MTD_XIPREG_1_LEN && 
+	     (CONFIG_MTD_XIPREG_1_START + CONFIG_MTD_XIPREG_1_LEN > phys_adr + chip_start ) && 
+	     (CONFIG_MTD_XIPREG_1_START < phys_adr + chip_start + chip_len) ) {
+	    return 1; 
+ 
+	}
+	if ( CONFIG_MTD_XIPREG_2_LEN && 
+	     (CONFIG_MTD_XIPREG_2_START + CONFIG_MTD_XIPREG_2_LEN > phys_adr + chip_start ) && 
+	     (CONFIG_MTD_XIPREG_2_START < phys_adr + chip_start + chip_len) ) {
+	    return 1; 
+ 
+	}
+	return 0; 
+}
+#define xip_partition(phys_adr, chip_start, chip_len) xipreg_intersection(phys_adr, chip_start, chip_len)
+
+
+#else
+
+#define xip_partition(phys_adr, chip_start, chip_len) (1)
+
+#endif /* CONFIG_MTD_XIP_REGIONS */
+
  #else

  #define __xipram
+#define xip_partition(phys_adr, chip_start, chip_len) (0)

  #endif /* CONFIG_MTD_XIP */
