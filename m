Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SeUe-0001P0-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 15:00:28 +0100
Date: Thu, 11 Jul 2002 16:00:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: jffs-dev@axis.com
Subject: [patch 1.1] cfi_cmdset_0020.c update
Message-ID: <20020711140028.GA9578@wohnheim.fh-wedel.de>
References: <20020711125740.GA6789@wohnheim.fh-wedel.de> <20020711132812.GB6789@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020711132812.GB6789@wohnheim.fh-wedel.de>
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

I forgot the config option. This is the update for the Makefile and
Config.in.


Common subdirectories: new_chips/CVS and new_chips2/CVS
diff -u new_chips/Config.in new_chips2/Config.in
--- new_chips/Config.in	Wed Feb 13 17:29:15 2002
+++ new_chips2/Config.in	Thu Jul 11 15:43:48 2002
@@ -44,6 +44,7 @@
 fi
 dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_GEN_PROBE
 dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_GEN_PROBE
+dep_tristate '  Support for ST (Advanced Architecture) flash chips' CONFIG_MTD_CFI_STAA $CONFIG_MTD_GEN_PROBE
 
 dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONFIG_MTD
 dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM $CONFIG_MTD
diff -u new_chips/Makefile new_chips2/Makefile
--- new_chips/Makefile	Thu Jan 10 21:27:40 2002
+++ new_chips2/Makefile	Thu Jul 11 15:43:05 2002
@@ -19,6 +19,7 @@
 obj-$(CONFIG_MTD_CFI)		+= cfi_probe.o
 obj-$(CONFIG_MTD_CFI_AMDSTD)	+= cfi_cmdset_0002.o
 obj-$(CONFIG_MTD_CFI_INTELEXT)	+= cfi_cmdset_0001.o
+obj-$(CONFIG_MTD_CFI_STAA)	+= cfi_cmdset_0020.o
 obj-$(CONFIG_MTD_GEN_PROBE)	+= gen_probe.o
 obj-$(CONFIG_MTD_JEDEC)		+= jedec.o
 obj-$(CONFIG_MTD_JEDECPROBE)	+= jedec_probe.o
