Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Lesj-0006BW-Cv
	for <linux-mtd@lists.infradead.org>; Fri, 30 May 2003 09:04:57 +0100
Received: from hermes.fachschaften.tu-muenchen.de ([129.187.202.12])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19LetO-000178-00
	for linux-mtd@lists.infradead.org; Fri, 30 May 2003 09:05:38 +0100
Date: Fri, 30 May 2003 10:05:34 +0200
From: Adrian Bunk <bunk@fs.tum.de>
To: Andrew Morton <akpm@digeo.com>, linux-mtd@lists.infradead.org
Message-ID: <20030530080533.GN5643@fs.tum.de>
References: <20030529012914.2c315dad.akpm@digeo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030529012914.2c315dad.akpm@digeo.com>
Content-Type: text/plain; charset=us-ascii
cc: linux-kernel@vger.kernel.org
Subject: [patch] 2.5.70-mm2: `__raw_{read,write}ll' undefinded references
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems the following compile error comes from Linus' tree:

<--  snip  -->

...
  CC      drivers/mtd/maps/map_funcs.o
drivers/mtd/maps/map_funcs.c: In function `simple_map_read64':
drivers/mtd/maps/map_funcs.c:38: warning: implicit declaration of 
function `__raw_readll'
drivers/mtd/maps/map_funcs.c: In function `simple_map_write64':
drivers/mtd/maps/map_funcs.c:65: warning: implicit declaration of 
function `__raw_writell'
...
  LD      .tmp_vmlinux1
drivers/built-in.o(.text+0x669e8e): In function `simple_map_read64':
: undefined reference to `__raw_readll'
drivers/built-in.o(.text+0x669f74): In function `simple_map_write64':
: undefined reference to `__raw_writell'
make: *** [.tmp_vmlinux1] Error 1

<--  snip  -->


The fix is simple:


--- linux-2.5.70-mm2/drivers/mtd/maps/map_funcs.c.old	2003-05-30 09:47:04.000000000 +0200
+++ linux-2.5.70-mm2/drivers/mtd/maps/map_funcs.c	2003-05-30 09:47:49.000000000 +0200
@@ -13,6 +13,7 @@
 #include <asm/io.h>
 
 #include <linux/mtd/map.h>
+#include <linux/mtd/cfi.h>
 
 static u8 simple_map_read8(struct map_info *map, unsigned long ofs)
 {



cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
