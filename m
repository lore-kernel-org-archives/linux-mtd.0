Received: from fep02-0.kolumbus.fi ([193.229.0.44] helo=fep02-app.kolumbus.fi)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CU4HE-0000Ar-AD
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 09:25:49 -0500
Received: from [192.168.1.10] (really [193.229.34.141])
	by fep02-app.kolumbus.fi with ESMTP
	id <20041116142546.PWOW3570.fep02-app.kolumbus.fi@[192.168.1.10]>
	for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2004 16:25:46 +0200
Message-ID: <419A0DEA.6070007@cs.helsinki.fi>
Date: Tue, 16 Nov 2004 16:25:46 +0200
From: Heikki O Lindholm <holindho@cs.helsinki.fi>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: minor Ebony mapping patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The IBM Ebony board's default config has AM29F0(40/16) parts, which are 
JEDEC chips. So, I think the following is in order (Kconfig&Config.in 
might need tuning also):

--- drivers/mtd/maps/ebony.c    Thu Nov  4 15:24:14 2004
+++ /tmp/mtd/drivers/mtd/maps/ebony.c   Tue Nov 16 15:54:51 2004
@@ -103,7 +103,7 @@

         simple_map_init(&ebony_small_map);

-       flash = do_map_probe("map_rom", &ebony_small_map);
+       flash = do_map_probe("jedec_probe", &ebony_small_map);
         if (flash) {
                 flash->owner = THIS_MODULE;
                 add_mtd_partitions(flash, ebony_small_partitions,
@@ -125,7 +125,7 @@

         simple_map_init(&ebony_large_map);

-       flash = do_map_probe("cfi_probe", &ebony_large_map);
+       flash = do_map_probe("jedec_probe", &ebony_large_map);
         if (flash) {
                 flash->owner = THIS_MODULE;
                 add_mtd_partitions(flash, ebony_large_partitions,
