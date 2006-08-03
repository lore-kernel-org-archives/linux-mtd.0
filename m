Received: from smtp12.dti.ne.jp ([202.216.231.187])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8dRE-0005Bc-7M
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 09:40:40 -0400
Received: from shabby.localdomain (KHP059140016099.ppp-bb.dion.ne.jp
	[59.140.16.99]) by smtp12.dti.ne.jp (3.11s) with ESMTP AUTH id
	k73DSJx6028537 for <linux-mtd@lists.infradead.org>;
	Thu, 3 Aug 2006 22:28:19 +0900 (JST)
Date: Thu, 3 Aug 2006 22:28:18 +0900
From: takasi-y@ops.dti.ne.jp
To: linux-mtd@lists.infradead.org
Subject: [PATCH] PHYSMAP depens on CFI or JEDECPROBE or ROM
Message-Id: <20060803222818.7f8f0286.takasi-y@ops.dti.ne.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
map/physmap.c tries to probe "cfi_probe", "jedec_probe" and "map_rom", but
map/Kconfig says it depends on MTD_CFI only.
Here is the fix. 
# I think description should be rewritten by someone who speak real english, though.
/yoshii

Index: drivers/mtd/maps/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Kconfig,v
retrieving revision 1.69
diff -u -p -r1.69 Kconfig
--- drivers/mtd/maps/Kconfig    28 Mar 2006 16:15:53 -0000      1.69
+++ drivers/mtd/maps/Kconfig    3 Aug 2006 13:22:08 -0000
@@ -13,13 +13,13 @@ config MTD_COMPLEX_MAPPINGS

 config MTD_PHYSMAP
        tristate "CFI Flash device in physical memory map"
-       depends on MTD_CFI
+       depends on MTD_CFI || MTD_JEDECPROBE || MTD_ROM
        help
-         This provides a 'mapping' driver which allows the CFI probe and
-         command set driver code to communicate with flash chips which
-         are mapped physically into the CPU's memory. You will need to
-         configure the physical address and size of the flash chips on
-         your particular board as well as the bus width, either statically
+         This provides a 'mapping' driver which allows the NOR Flash and
+         ROM driver code to communicate with chips which are mapped
+         physically into the CPU's memory. You will need to configure
+         the physical address and size of the flash chips on your
+         particular board as well as the bus width, either statically
          with config options or at run-time.

 config MTD_PHYSMAP_START
