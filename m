Date: Wed, 8 Oct 2008 22:25:08 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [RFC/PATCH 2/7] LPDDR Makefile and KConfig
Message-ID: <alpine.LFD.1.10.0810082218580.13328@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have two components to manage LPDDR flash memories in Linux.
1. It is a driver for chip probing and reading its capabilities
2. It is a device operations driver.

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
---

diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
new file mode 100644
index 0000000..6771d82
--- /dev/null
+++ b/drivers/mtd/lpddr/Kconfig
@@ -0,0 +1,22 @@
+# drivers/mtd/chips/Kconfig
+
+menu "LPDDR flash memory drivers"
+	depends on MTD!=n
+
+config MTD_LPDDR
+	tristate "Support for LPDDR flash chips"
+	select MTD_QINFO_PROBE
+	help
+	  This option enables support of LPDDR (Low power double data rate) 
+	  flash chips. Synonymous with Mobile-DDR. It is a new standard for 
+	  DDR memories, intended for battery-operated systems.	  
+
+config MTD_QINFO_PROBE
+	tristate "Detect flash chips by QINFO probe"
+	help
+	    Device Information for LPDDR chips is offered through the Overlay 
+	    Window QINFO interface, permits software to be used for entire 
+	    families of devices. This serves similar purpose of CFI on legacy
+	    Flash products
+endmenu
+
diff --git a/drivers/mtd/lpddr/Makefile b/drivers/mtd/lpddr/Makefile
new file mode 100644
index 0000000..0c305f5
--- /dev/null
+++ b/drivers/mtd/lpddr/Makefile
@@ -0,0 +1,6 @@
+#
+# linux/drivers/mtd/lpddr/Makefile
+#
+
+obj-$(CONFIG_MTD_QINFO_PROBE)	+= qinfo_probe.o
+obj-$(CONFIG_MTD_LPDDR)		+= lpddr_cmds.o
