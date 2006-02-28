Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEAKx-0005nn-NG
	for linux-mtd@lists.infradead.org; Tue, 28 Feb 2006 14:16:48 -0500
Date: Tue, 28 Feb 2006 20:16:42 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060228191642.GB19811@xi.wantstofly.org>
References: <20060212170441.GA28427@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060212170441.GA28427@xi.wantstofly.org>
Subject: [less intrusive PATCH,RFC] don't load physmap if length is zero
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK, so if the previous patch (which converted physmap into a platform
driver) was too nonobvious, can we at least apply a patch like this so
that it's possible to compile in physmap without using it?

This is useful for example on the Technologic Systems TS-72xx boards,
where some models in the series have NOR flash while others have NAND
flash, and you'd like to be able to compile a single kernel that works
on all models.  (So for the NOR models, you call physmap_configure at
run time, while for the NAND models, you initialise the board-specific
NAND driver (which I shall submit later.))

I'd still prefer the platform driver patch to be applied, but having
some kind of solution merged is better than no solution at all :-)

-- CUT HERE --
Allow compiling in the physmap mtd map driver without using it --
this is useful for multi-machine kernels where some of the supported
machines need physmap while others do not.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

diff -urN linux-2.6.15.orig/drivers/mtd/maps/Kconfig linux-2.6.15/drivers/mtd/maps/Kconfig
--- linux-2.6.15.orig/drivers/mtd/maps/Kconfig	2006-02-12 10:22:16.000000000 +0100
+++ linux-2.6.15/drivers/mtd/maps/Kconfig	2006-02-28 20:03:36.000000000 +0100
@@ -37,7 +37,7 @@
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
 	depends on MTD_PHYSMAP
-	default "0x4000000"
+	default "0"
 	help
 	  This is the total length of the mapping of the flash chips on
 	  your particular board. If there is space, or aliases, in the
diff -urN linux-2.6.15.orig/drivers/mtd/maps/physmap.c linux-2.6.15/drivers/mtd/maps/physmap.c
--- linux-2.6.15.orig/drivers/mtd/maps/physmap.c	2006-02-12 10:22:16.000000000 +0100
+++ linux-2.6.15/drivers/mtd/maps/physmap.c	2006-02-20 21:14:23.000000000 +0100
@@ -51,6 +51,9 @@
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
 	const char **type;
 
+	if (!physmap_map.size)
+		return -EIO;
+
        	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
 	physmap_map.virt = ioremap(physmap_map.phys, physmap_map.size);
 
