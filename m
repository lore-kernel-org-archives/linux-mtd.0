From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Wed, 12 Feb 2003 13:57:29 +0100
Subject: [patch] fix missing cfi_cmdset_0020 in drivers/mtd/chips/Makefile
Message-ID: <20030212125728.GA22472@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi!

This patch is needed for pre4 and pre4-ac3. It appears to be missing
from cvs as well, David. I'll apply it later today.

J?rn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong

diff -Naur linux-2.4.21-pre4-ac3/drivers/mtd/chips/Makefile scratch/drivers/mtd/chips/Makefile
--- linux-2.4.21-pre4-ac3/drivers/mtd/chips/Makefile	Wed Feb 12 13:42:01 2003
+++ scratch/drivers/mtd/chips/Makefile	Wed Feb 12 13:42:29 2003
@@ -17,7 +17,6 @@
 obj-$(CONFIG_MTD)		+= chipreg.o
 obj-$(CONFIG_MTD_AMDSTD)	+= amd_flash.o 
 obj-$(CONFIG_MTD_CFI)		+= cfi_probe.o
+obj-$(CONFIG_MTD_CFI_STAA)	+= cfi_cmdset_0020.o
 obj-$(CONFIG_MTD_CFI_AMDSTD)	+= cfi_cmdset_0002.o
 obj-$(CONFIG_MTD_CFI_INTELEXT)	+= cfi_cmdset_0001.o
 obj-$(CONFIG_MTD_GEN_PROBE)	+= gen_probe.o
