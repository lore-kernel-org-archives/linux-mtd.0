Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163Fqo-00035k-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2001 12:06:06 +0000
Received: from jocke.lumentis.se (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id NAA03459
	for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2001 13:14:59 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: Cache mappings and invalidate
Date: Mon, 12 Nov 2001 14:14:14 +0200
MIME-Version: 1.0
Message-Id: <0111121314140A.28381@jocke.lumentis.se>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all

I am trying to make copy_from use cahced memory by assignig 
map_priv_2 = (unsigned long)__ioremap(flash_addr, flash_size, 0);
and then change copy_from routine to:
+#ifndef NO_CACHE
+       memcpy_fromio(to, (void *)(map->map_priv_2 + from), len);
+#else
        memcpy_fromio(to, (void *)(map->map_priv_1 + from), len);
+#endif

There are no cache invalidations in my map file, instead I have 
added invalidate_dcache_range() calls to drivers/mtd/chips/cfi_cmdset_0001.c(see below)
in do_write_oneword(), do_write_buffer() and do_erase_oneblock(). Note that
this is just a quick hack to try out my theory. Does this look sane or should I use
another invalidate_dcache_range() and/or place the invalidate calls somewhere else?

I am not using burst reads yet, that will come later once i have gotten the cached mapping
to work.
 
       Joakim



--- drivers/mtd/chips/cfi_cmdset_0001.c 2001/10/25 12:11:10     1.3
+++ drivers/mtd/chips/cfi_cmdset_0001.c 2001/11/12 12:02:33
@@ -502,6 +502,10 @@
        cfi_udelay(chip->word_write_time);
        spin_lock_bh(chip->mutex);

+#ifndef NO_CACHE
+       invalidate_dcache_range(map->map_priv_2 + adr, map->map_priv_2 + adr + 4); /* on a 32 bit bus */
+#endif
+
        timeo = jiffies + (HZ/2);
        z = 0;
        for (;;) {
@@ -691,7 +695,7 @@
        wbufsize = CFIDEV_INTERLEAVE << cfi->cfiq->MaxBufWriteSize;
        adr += chip->start;
        cmd_adr = adr & ~(wbufsize-1);
-
+
        /* Let's determine this according to the interleave only once */
        status_OK = CMD(0x80);
 
@@ -790,6 +794,10 @@
        cfi_udelay(chip->buffer_write_time);
        spin_lock_bh(chip->mutex);
 
+#ifndef NO_CACHE
+       invalidate_dcache_range(map->map_priv_2 + adr, map->map_priv_2 + adr + len);
+#endif
+
        timeo = jiffies + (HZ/2);
        z = 0;
        for (;;) {
@@ -994,6 +1002,10 @@
        spin_unlock_bh(chip->mutex);
        schedule_timeout(HZ);
        spin_lock_bh(chip->mutex);
+
+#ifndef NO_CACHE
+       invalidate_dcache_range(map->map_priv_2 + adr, map->map_priv_2 + adr + 0x40000);
/* 0x40000 is my erase size */
+#endif
 
        /* FIXME. Use a timer to check this, and return immediately. */
        /* Once the state machine's known to be working I'll do that */
