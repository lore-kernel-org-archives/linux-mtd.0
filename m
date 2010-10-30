Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PC53c-0002R6-Ew
	for linux-mtd@lists.infradead.org; Sat, 30 Oct 2010 06:36:53 +0000
Received: by wwb17 with SMTP id 17so3800360wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Oct 2010 23:36:50 -0700 (PDT)
Sender: Grant Likely <glikely@secretlab.ca>
Subject: [RFC] mtd: Fix MTD_OF_PARTS for all arch and minor tidy of
	MTD_PARTITIONS
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Andres Salomon <dilinger@queued.net>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 30 Oct 2010 07:35:02 +0100
Message-ID: <20101030063425.22588.76571.stgit@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD_OF_PARTS should be possible on all architectures, not just
powerpc and microblaze, and it probably should not be a user
selectable option.  Neither does it need to be in a separate module.

Also, rework MTD Kconfig to group options dependant on MTD_PARTITIONS
into a if/endif block.  Do the same for MTD_REDBOOT_PARTS.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---

Compile tested only.

 drivers/mtd/Kconfig  |   19 +++++++++++--------
 drivers/mtd/Makefile |    2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 1e2cbf5..7741470 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -53,9 +53,10 @@ config MTD_PARTITIONS
 	  devices. Partitioning on NFTL 'devices' is a different - that's the
 	  'normal' form of partitioning used on a block device.
 
+if MTD_PARTITIONS
+
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
-	depends on MTD_PARTITIONS
 	---help---
 	  RedBoot is a ROM monitor and bootloader which deals with multiple
 	  'images' in flash devices by putting a table one of the erase
@@ -72,9 +73,10 @@ config MTD_REDBOOT_PARTS
 	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
 	  example.
 
+if MTD_REDBOOT_PARTS
+
 config MTD_REDBOOT_DIRECTORY_BLOCK
 	int "Location of RedBoot partition table"
-	depends on MTD_REDBOOT_PARTS
 	default "-1"
 	---help---
 	  This option is the Linux counterpart to the
@@ -91,18 +93,18 @@ config MTD_REDBOOT_DIRECTORY_BLOCK
 
 config MTD_REDBOOT_PARTS_UNALLOCATED
 	bool "Include unallocated flash regions"
-	depends on MTD_REDBOOT_PARTS
 	help
 	  If you need to register each unallocated flash region as a MTD
 	  'partition', enable this option.
 
 config MTD_REDBOOT_PARTS_READONLY
 	bool "Force read-only for RedBoot system images"
-	depends on MTD_REDBOOT_PARTS
 	help
 	  If you need to force read-only for 'RedBoot', 'RedBoot Config' and
 	  'FIS directory' images, enable this option.
 
+endif # MTD_REDBOOT_PARTS
+
 config MTD_CMDLINE_PARTS
 	bool "Command line partition table parsing"
 	depends on MTD_PARTITIONS = "y" && MTD = "y"
@@ -142,7 +144,7 @@ config MTD_CMDLINE_PARTS
 
 config MTD_AFS_PARTS
 	tristate "ARM Firmware Suite partition parsing"
-	depends on ARM && MTD_PARTITIONS
+	depends on ARM
 	---help---
 	  The ARM Firmware Suite allows the user to divide flash devices into
 	  multiple 'images'. Each such image has a header containing its name
@@ -158,8 +160,8 @@ config MTD_AFS_PARTS
 	  example.
 
 config MTD_OF_PARTS
-	tristate "Flash partition map based on OF description"
-	depends on (MICROBLAZE || PPC_OF) && MTD_PARTITIONS
+	def_bool y
+	depends on OF
 	help
 	  This provides a partition parsing function which derives
 	  the partition map from the children of the flash node,
@@ -167,10 +169,11 @@ config MTD_OF_PARTS
 
 config MTD_AR7_PARTS
 	tristate "TI AR7 partitioning support"
-	depends on MTD_PARTITIONS
 	---help---
 	  TI AR7 partitioning support
 
+endif # MTD_PARTITIONS
+
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 760abc5..d4e7f25 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -6,13 +6,13 @@
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o
 mtd-$(CONFIG_MTD_PARTITIONS)	+= mtdpart.o
+mtd-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 
 obj-$(CONFIG_MTD_CONCAT)	+= mtdconcat.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
-obj-$(CONFIG_MTD_OF_PARTS)      += ofpart.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
