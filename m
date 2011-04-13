Received: from usausmgw02.spansion.com ([12.110.209.162])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9xbi-00018U-JZ
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 10:47:35 +0000
Subject: Re: Re: Does NOR chip drivers support PPB protection
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <BANLkTik+nBf4TJ3BrxQuRa_sLr-8W2wdTw@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 13 Apr 2011 12:21:54 +0200
Message-ID: <1302690114.23151.51.camel@MUC-CSE-01.spansion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: vk.raghavendra@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, cfi_cmdset_0002.c does not support PPB locking of sectors - mainly
because it is hard to check for older devices if they support it or not (newer 
devices indicate this via CFI word 0x49, 0x08 means PPB locking is supported).

On the other hand, adding PPB support is not too complicated. The major hurdle
is the MTD lock/unlock logic which assumes that sectors can be locked and unlocked
individually. With the PPB bits, sectors can be locked individually but can be 
unlocked only together as a group.

So if you want to use the existing MTD lock infrastructure (which is normally 
unused by the AMD/Spansion chip driver) to set PPB bits then you can apply below
changes (older kernel version). Afterwards, you can lock sectors, i.e. set the 
corresponding PPB bit via the "flash_lock" mtd utility. Similarly, you could 
implement an unlock function and use flash_unlock, however, note that all sectors
will be unlocked (!) in this case whenever you use flash_unlock. Maybe it would 
be better to develop a new "flash_unlockall" utility instead to clarify this.


--- cfi_cmdset_0002.c.org	2007-12-17 13:46:08.000000000 +0100
+++ cfi_cmdset_0002.c	2007-12-17 13:46:19.000000000 +0100
@@ -59,7 +59,8 @@
 static void cfi_amdstd_sync (struct mtd_info *);
 static int cfi_amdstd_suspend (struct mtd_info *);
 static void cfi_amdstd_resume (struct mtd_info *);mtdInfo.size;
+static int cfi_amdstd_lock(struct mtd_info *mtd, loff_t ofs, size_t len);
 static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 
 static void cfi_amdstd_destroy(struct mtd_info *);
 

@@ -270,6 +267,7 @@
 	mtd->sync    = cfi_amdstd_sync;
 	mtd->suspend = cfi_amdstd_suspend;
 	mtd->resume  = cfi_amdstd_resume;
+	mtd->lock    = cfi_amdstd_lock;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
@@ -1869,6 +1876,53 @@
 	kfree(mtd->erasereg+	ions);
 }
 
+static int __xipram do_lock_oneblock(struct map_info *map, struct flchip *chip,
+				       unsigned long adr, int len, void *thunk)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	int udelay;
+	int ret;
+
+	adr += chip->start;
+
+	spin_lock(chip->mutex);
+	ret = get_chip(map, chip, adr, FL_LOCKING);
+	if (ret) {
+		spin_unlock(chip->mutex);
+		return ret;
+	}
+
+	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
+	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xC0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	map_write(map, CMD(0x00), adr);
+	chip->state = FL_LOCKING;
+
+	udelay = (1 << cfi->cfiq->WordWriteTimeoutTyp) * (1 << cfi->cfiq->WordWriteTimeoutMax);
+	INVALIDATE_CACHE_UDELAY(map, chip, adr, map_bankwidth(map), udelay);
+	/* wait max word program time */
+
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+        
+	xip_enable(map, chip, adr);
+        
+	chip->state = FL_READY;
+	put_chip(map, chip, adr);
+	spin_unlock(chip->mutex);
+	return ret;
+}
+
+static int cfi_amdstd_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	return cfi_varsize_frob(mtd, do_lock_oneblock, ofs, len, 0);
+}
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");
 MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");
