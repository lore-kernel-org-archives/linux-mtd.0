Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FvC53-0006Gy-No
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 07:50:27 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id BB1F0472FA
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jun 2006 15:49:35 +0400 (MSD)
Subject: [PATCH 1/1] UBI
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-CoAbFEuy4iWwa5tSA1G1"
Date: Tue, 27 Jun 2006 15:49:35 +0400
Message-Id: <1151408975.16490.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CoAbFEuy4iWwa5tSA1G1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

Frank announced about UBI some time ago
(http://lists.infradead.org/pipermail/linux-mtd/2006-June/015887.html)

The UBI GIT tree is now at git://git.infradead.org/ubi-2.6.git, or
http://git.infradead.org/?p=ubi-2.6.git;a=summary at WEB.

Here is the UBI patch for your review.


[MTD] UBI: Unsorted Block Images

UBI (Latin: "where?") manages multiple logical volumes on a single
flash device, specifically supporting NAND flash devices. UBI provides
a flexible partitioning concept which still allows for wear-levelling
across the whole flash device.

In a sense, UBI may be compared to the Logical Volume Manager
(LVM). Whereas LVM maps logical sector numbers to physical HDD sector
numbers, UBI maps logical eraseblocks to physical eraseblocks.

More information may be found in the UBI design documentation:
ubidesign.pdf. Which can be found here:
http://www.linux-mtd.infradead.org/doc/ubi.html

Partitioning/Re-partitioning

  An UBI volume occupies a certain number of erase blocks. This is
  limited by a configured maximum volume size, which could also be
  viewed as the partition size. Each individual UBI volume's size can
  be changed independently of the other UBI volumes, provided that the
  sum of all volume sizes doesn't exceed a certain limit.

  UBI supports dynamic volumes and static volumes. Static volumes are
  read-only and their contents are protected by CRC check sums.

Bad eraseblocks handling

  UBI transparently handles bad eraseblocks. When a physical
  eraseblock becomes bad, it is substituted by a good physical
  eraseblock, and the user does not even notice this.

Scrubbing

  On a NAND flash bit flips can occur on any write operation,
  sometimes also on read. If bit flips persist on the device, at first
  they can still be corrected by ECC, but once they accumulate,
  correction will become impossible. Thus it is best to actively scrub
  the affected eraseblock, by first copying it to a free eraseblock
  and then erasing the original. The UBI layer performs this type of
  scrubbing under the covers, transparently to the UBI volume users.

Erase Counts

  UBI maintains an erase count header per eraseblock. This frees
  higher-level layers (like file systems) from doing this and allows
  for centralized erase count management instead. The erase counts are
  used by the wear-levelling algorithm in the UBI layer. The algorithm
  itself is exchangeable.

Booting from NAND

  For booting directly from NAND flash the hardware must at least be
  capable of fetching and executing a small portion of the NAND
  flash. Some NAND flash controllers have this kind of support. They
  usually limit the window to a few kilobytes in erase block 0. This
  "initial program loader" (IPL) must then contain sufficient logic to
  load and execute the next boot phase.

  Due to bad eraseblocks, which may be randomly scattered over the
  flash device, it is problematic to store the "secondary program
  loader" (SPL) statically. Also, due to bit-flips it may become
  corrupted over time. UBI allows to solve this problem gracefully by
  storing the SPL in a small static UBI volume.

UBI volumes vs. static partitions

  UBI volumes are still very similar to static MTD partitions:

    * both consist of eraseblocks (logical eraseblocks in case of UBI
      volumes, and physical eraseblocks in case of static partitions;
    * both support three basic operations - read, write, erase.

  But UBI volumes have the following advantages over traditional
  static MTD partitions:

    * there are no eraseblock wear-leveling constraints in case of UBI
      volumes, so the user should not care about this;
    * there are no bit-flips and bad eraseblocks in case of UBI volumes.

  So, UBI volumes may be considered as flash devices with relaxed
  restrictions.

Where can it be found?

  Documentation, kernel code and applications can be found in the MTD
  gits.

What are the applications for?

  The applications help to create binary flash images for two
  purposes: pfi files (partial flash images) for in-system update of
  UBI volumes, and plain binary images, with or without OOB data in
  case of NAND, for a manufacturing step. Furthermore some tools
  are/and will be created that allow flash content analysis after a
  system has crashed.

Who did UBI?

  The original ideas, where UBI is based on, were developed by Andreas
  Arnez, Frank Haverkamp and Thomas Gleixner. Josh W. Boyer and
  some others were involved too. The implementation of the kernel
  layer was done by Artem B. Bityutskiy. The user-space applications
  and tools were written by Oliver Lohmann with contributions from
  Frank Haverkamp, Andreas Arnez, and Artem. Joern Engel contributed a
  patch which modifies JFFS2 so that it can be run on a UBI
  volume. Thomas Gleixner did modifications to the NAND layer and also
  some to JFFS2 to make it work.

Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

--=-CoAbFEuy4iWwa5tSA1G1
Content-Disposition: attachment; filename=ubi-01.diff
Content-Type: text/x-patch; name=ubi-01.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5ac265d..9163a7f 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -273,5 +273,7 @@ source "drivers/mtd/nand/Kconfig"
 
 source "drivers/mtd/onenand/Kconfig"
 
+source "drivers/mtd/ubi/Kconfig"
+
 endmenu
 
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index fc93744..1871565 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -26,3 +26,5 @@ nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
 
 obj-y		+= chips/ maps/ devices/ nand/ onenand/
+
+obj-$(CONFIG_MTD_UBI)		+= ubi/
diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
new file mode 100644
index 0000000..84b158f
--- /dev/null
+++ b/drivers/mtd/ubi/Kconfig
@@ -0,0 +1,213 @@
+# drivers/mtd/ubi/Kconfig
+
+menu "UBI - Unsorted block images"
+	depends on MTD
+
+config MTD_UBI
+	tristate "Enable UBI"
+	depends on MTD
+	select CRC32
+
+config MTD_UBI_WL_THRESHOLD
+	int "UBI wear-leveling threshold"
+	default 4096
+	range 2 65536
+	depends on MTD_UBI
+	help
+	  This parameter defines the maximal difference between the highest
+	  eraseblock erase counter value and the lowest eraseblock erase
+	  counter value of UBI devices. When this threshold is exceeded, UBI
+	  starts doing wear leveling by means of moving data from eraseblock
+	  with low erase counter to eraseblocks with high erase counter.
+
+config MTD_UBI_BEB_RESERVE
+	int "Percentage of reserved eraseblocks for bad eraseblocks handling"
+	default 1
+	range 0 50
+	depends on MTD_UBI
+	help
+	  If the MTD device admits of bad eraseblocks, UBI reserves some amount
+	  of physical eraseblocks to gracefully handle new bad eraseblocks.
+	  This option specifies how many physical eraseblocks will be reserved
+	  for bad eraseblock handling.
+
+config MTD_UBI_DEBUG
+	bool "UBI debugging"
+	default n
+	depends on MTD_UBI
+
+config MTD_UBI_DEBUG_RUNTIME
+	bool "UBI run-time debugging"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  Debugging options will be accessible via sysfs if this option is
+	  enabled
+
+config MTD_UBI_DEBUG_ASSERTS
+	bool "UBI assertions"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  This option enable UBI assertions which are lightweight checks
+	  scattered over different places.
+
+config MTD_UBI_USERSPACE_IO
+	bool "UBI user-space write/erase"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  By default, users cannot directly write and erase individual
+	  eraseblocks of dynamic volumes (the update operation must be used
+	  instead). This option enables this capability - this is often useful
+	  for debugging.
+
+config MTD_UBI_DEBUG_EMULATE_BITFLIPS
+	bool "Emulate flash bit-flips"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  This option emulates bit-flips with probability 1/50, which in turn
+	  causes scrubbing. Useful for debugging.
+
+config MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES
+	bool "Emulate flash write failures"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  This option emulates write failures with probability 1/100. Useful for
+	  debugging.
+
+config MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
+	bool "Emulate flash erase failures"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  This option emulates erase failures with probability 1/100. Useful for
+	  debugging.
+
+menu "UBI debugging messages"
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_UIF
+	bool "User interface unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_VMT
+	bool "Volume management unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_UPD
+	bool "Update unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_VTBL
+	bool "Volume table unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_DTBL
+	bool "Data table unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_ACC
+	bool "Accounting unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_EBA
+	bool "Eraseblock association unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_WL
+	bool "Wear-leveling unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_BGT
+	bool "Background thread unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_ALLOC
+	bool "Memory allocation unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_IO
+	bool "Input/output unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_BLD
+	bool "Build unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_SCAN
+	bool "Scanning unit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+
+endmenu
+
+menu "UBI paranoid checks"
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_VMT
+	bool "Paranoid checks in the volume management unit"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_VTBL
+	bool "Paranoid checks in the volume table unit"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_DTBL
+	bool "Paranoid checks in the data table unit"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_EBA
+	bool "Paranoid checks in the eraseblock association unit"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_WL
+	bool "Paranoid checks in the wear-leveling unit"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_ALLOC
+	bool "Paranoid checks in the memory allocation unit"
+	default n
+	depends on MTD_UBI_DEBUG
+
+config MTD_UBI_DEBUG_PARANOID_IO
+	bool "Paranoid checks in the input/output unit"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  Warning, this is rather heavy-weight and will slow UBI down.
+
+config MTD_UBI_DEBUG_PARANOID_SCAN
+	bool "Paranoid checks in the scanning unit"
+	default n
+	depends on MTD_UBI_DEBUG
+	help
+	  Warning, this is rather heavy-weight and will slow UBI down.
+
+endmenu
+
+config MTD_UBI_TESTS
+	bool "UBI unit tests"
+	default n
+	depends on MTD_UBI
+
+endmenu
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
new file mode 100644
index 0000000..60244b8
--- /dev/null
+++ b/drivers/mtd/ubi/Makefile
@@ -0,0 +1,11 @@
+CHECK = sparse -Wbitwise
+
+obj-$(CONFIG_MTD_UBI) += ubi.o
+
+ubi-y += badeb.o upd.o sysfs.o cdev.o uif.o vtbl.o volmgmt.o eba.o io.o wl.o
+ubi-y += scan.o build.o background.o debug.o alloc.o init.o ivol.o account.o
+ubi-y += dtbl.o
+
+ubi-$(CONFIG_MTD_UBI_TESTS) += unittest.o
+
+obj-$(CONFIG_MTD_UBI_TESTS) += tests/
diff --git a/drivers/mtd/ubi/account.c b/drivers/mtd/ubi/account.c
new file mode 100644
index 0000000..c5879db
--- /dev/null
+++ b/drivers/mtd/ubi/account.c
@@ -0,0 +1,279 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/sched.h>
+#include <linux/string.h>
+#include <linux/spinlock.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "vtbl.h"
+#include "ivol.h"
+#include "account.h"
+#include "scan.h"
+#include "alloc.h"
+#include "badeb.h"
+#include "io.h"
+#include "debug.h"
+
+int ubi_acc_mkvol(const struct ubi_info *ubi, int reserved_pebs)
+{
+	struct ubi_acc_info *acc = ubi->acc;
+
+	dbg_acc("reserve %d PEBs for a new volume", reserved_pebs);
+	ubi_assert(reserved_pebs > 0);
+
+	spin_lock(&acc->lock);
+	if (acc->uvol_count + 1 > acc->max_volumes) {
+		dbg_acc("no room for the volume");
+		goto out;
+	}
+	if (reserved_pebs > acc->avail_pebs) {
+		dbg_acc("no enough PEBs, %d available, %d requested",
+			acc->avail_pebs, reserved_pebs);
+		goto out;
+	}
+	acc->uvol_count += 1;
+	acc->avail_pebs -= reserved_pebs;
+	acc->rsvd_pebs += reserved_pebs;
+	ubi_assert(acc->avail_pebs >= 0);
+	spin_unlock(&acc->lock);
+	return 0;
+
+out:
+	spin_unlock(&acc->lock);
+	return -ENOSPC;
+}
+
+void ubi_acc_rmvol(const struct ubi_info *ubi, int reserved_pebs)
+{
+	struct ubi_acc_info *acc = ubi->acc;
+
+	dbg_acc("remove volume and get back %d PEBs", reserved_pebs);
+	ubi_assert(reserved_pebs > 0 && reserved_pebs <= acc->rsvd_pebs);
+
+	spin_lock(&acc->lock);
+	acc->uvol_count -= 1;
+	acc->avail_pebs += reserved_pebs;
+	acc->rsvd_pebs -= reserved_pebs;
+	ubi_assert(acc->uvol_count >= 0);
+	ubi_assert(acc->rsvd_pebs >= 0);
+	spin_unlock(&acc->lock);
+
+	/* Take care about PEBs reserved for bad PEB handling */
+	ubi_beb_maintain_reserved(ubi);
+}
+
+int ubi_acc_reserve(const struct ubi_info *ubi, int pebs)
+{
+	struct ubi_acc_info *acc = ubi->acc;
+
+	dbg_acc("reserve %d PEBs", pebs);
+	ubi_assert(pebs > 0);
+
+	spin_lock(&acc->lock);
+	if (unlikely(pebs > acc->avail_pebs)) {
+		spin_unlock(&acc->lock);
+		return -ENOSPC;
+	}
+	acc->avail_pebs -= pebs;
+	acc->rsvd_pebs += pebs;
+	spin_unlock(&acc->lock);
+	return 0;
+}
+
+void ubi_acc_free(const struct ubi_info *ubi, int pebs)
+{
+	struct ubi_acc_info *acc = ubi->acc;
+
+	dbg_acc("free %d PEBs", pebs);
+	spin_lock(&acc->lock);
+	ubi_assert(pebs > 0 && pebs <= acc->rsvd_pebs);
+	acc->rsvd_pebs -= pebs;
+	acc->avail_pebs += pebs;
+	spin_unlock(&acc->lock);
+}
+
+static int acc_info_check(const struct ubi_info *ubi,
+			  const struct ubi_scan_info *si);
+
+int ubi_acc_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err, i;
+	struct ubi_acc_info *acc;
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+	const struct ubi_io_info *io = ubi->io;
+
+	dbg_acc("initialize the accounting unit");
+
+	acc = ubi_kzalloc(sizeof(struct ubi_acc_info), GFP_KERNEL);
+	if (!acc)
+		return -ENOMEM;
+	ubi->acc = acc;
+
+	spin_lock_init(&acc->lock);
+	acc->ivol_count = UBI_INT_VOL_COUNT;
+
+	for (i = 0; i < acc->ivol_count; i++) {
+		cond_resched();
+		vtr = ubi_ivol_get_vtr(ubi, UBI_INTERNAL_VOL_START + i);
+		ubi_assert(!IS_ERR(vtr));
+		acc->rsvd_pebs += vtr->reserved_pebs;
+	}
+
+	/*
+	 * The maximum number of volumes may be less then the volume table
+	 * fits if there are too few available eraseblocks on the flash.
+	 */
+	acc->max_volumes = vtbl->vt_slots;
+	i = io->good_peb_count - acc->rsvd_pebs;
+	if (i <= 0) {
+		ubi_err("too small flash");
+		err = -EINVAL;
+		goto out_acc;
+	}
+
+	if (acc->max_volumes > i)
+		acc->max_volumes = i;
+
+	for (i = 0; i < acc->max_volumes; i++) {
+		cond_resched();
+		vtr = ubi_vtbl_get_vtr(ubi, i);
+		if (IS_ERR(vtr))
+			continue;
+		acc->uvol_count += 1;
+		acc->rsvd_pebs += vtr->reserved_pebs;
+	}
+
+	acc->rsvd_pebs += si->alien_peb_count;
+	acc->avail_pebs = io->good_peb_count - acc->rsvd_pebs;
+
+	/* Check accounting information sanity and consistency */
+	err = acc_info_check(ubi, si);
+	if (err)
+		goto out_acc;
+
+	dbg_acc("uvol_count %d, ivol_count %d, avail_pebs %d rsvd_pebs %d "
+		"max_volumes %d", acc->uvol_count, acc->ivol_count,
+		acc->avail_pebs, acc->rsvd_pebs, acc->max_volumes);
+	return 0;
+
+out_acc:
+	ubi_kfree(acc);
+	return err;
+}
+
+void ubi_acc_close(const struct ubi_info *ubi)
+{
+	dbg_acc("close the accounting unit");
+	ubi_kfree(ubi->acc);
+}
+
+/**
+ * acc_info_check - check sanity and consistency of accounting information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information which must be consistent to accounting
+ * information
+ *
+ * As we try not to trust the data we read from the flash media, we have to
+ * check that the accounting information is sane and consistent, as it is
+ * formed using on-flash information. This function returns zero if all is fine
+ * and a negative error code if some inconsistency was found.
+ */
+static int acc_info_check(const struct ubi_info *ubi,
+			  const struct ubi_scan_info *si)
+{
+	int i;
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_acc_info *acc = ubi->acc;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+	const struct ubi_io_info *io = ubi->io;
+
+	if (acc->avail_pebs < 0 || acc->rsvd_pebs < 0 || acc->uvol_count < 0 ||
+	    acc->ivol_count < 0) {
+		ubi_err("negative values");
+		goto bad;
+	}
+
+	if (acc->avail_pebs > io->good_peb_count) {
+		ubi_err("bad avail_pebs");
+		goto bad;
+	}
+
+	if (acc->rsvd_pebs > io->good_peb_count) {
+		ubi_err("bad rsvd_pebs");
+		goto bad;
+	}
+
+	if (acc->avail_pebs + acc->rsvd_pebs != io->good_peb_count) {
+		ubi_err("accounting error");
+		goto bad;
+	}
+
+	if (acc->max_volumes > vtbl->vt_slots) {
+		ubi_err("bad max_volumes");
+		goto bad;
+	}
+
+	if (acc->ivol_count + acc->uvol_count > acc->max_volumes) {
+		ubi_err("vol. count (%d + %d) > max_volumes",
+			acc->ivol_count, acc->uvol_count);
+		goto bad;
+	}
+
+	/*
+	 * Ensure that there are no volumes which exceed acc->max_volumes
+	 * exist.
+	 */
+	for (i = acc->max_volumes; i < vtbl->vt_slots; i++) {
+		cond_resched();
+		vtr = ubi_vtbl_get_vtr(ubi, i);
+		if (unlikely(!IS_ERR(vtr))) {
+			ubi_err("volume %d exists", i);
+			goto bad;
+		}
+	}
+
+	if (si->vols_found > acc->ivol_count + acc->uvol_count) {
+		ubi_err("scanning found volumes %d > %d + %d",
+			si->vols_found, acc->ivol_count, acc->uvol_count);
+		goto bad;
+	}
+
+	if (si->highest_vol_id >= acc->max_volumes &&
+	    si->highest_vol_id < UBI_INTERNAL_VOL_START) {
+		ubi_err("too large volume ID %d found by scanning",
+			si->highest_vol_id);
+		goto bad;
+	}
+
+	return 0;
+
+bad:
+	ubi_msg("uvol_count %d, ivol_count %d, avail_pebs %d, rsvd_pebs %d "
+		"io->good_peb_count %d, max_volumes %d, vtbl->vt_slots %d",
+		acc->uvol_count, acc->ivol_count, acc->avail_pebs,
+		acc->rsvd_pebs, io->good_peb_count, acc->max_volumes,
+		vtbl->vt_slots);
+	return -EINVAL;
+}
diff --git a/drivers/mtd/ubi/account.h b/drivers/mtd/ubi/account.h
new file mode 100644
index 0000000..332d313
--- /dev/null
+++ b/drivers/mtd/ubi/account.h
@@ -0,0 +1,118 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI accounting unit.
+ *
+ * This unit is responsible for maintaining the correct physical eraseblock
+ * accounting to prevent overcommitment.
+ */
+
+#ifndef __UBI_ACCOUNT_H__
+#define __UBI_ACCOUNT_H__
+
+#include <linux/spinlock.h>
+
+struct ubi_info;
+struct ubi_scan_info;
+
+/**
+ * ubi_acc_mkvol - account creation of a volume.
+ *
+ * @ubi: the UBI device description object
+ * @reserved_pebs: how many eraseblocks are reserved for the volume
+ *
+ * This function reserves @reserved_pebs physical eraseblocks for the newly
+ * created volume. Returns zero in case of success and a %-ENOSPC if there are
+ * no enough physical eraseblocks.
+ */
+int ubi_acc_mkvol(const struct ubi_info *ubi, int reserved_pebs);
+
+/**
+ * ubi_acc_rmvol - account removal of a volume.
+ *
+ * @ubi: the UBI device description object
+ * @pebs: how many eraseblocks were reserved for the volume
+ *
+ * This function reclaims the number physical eraseblocks occupied by the
+ * volume. Note, UBI is trying to maintain a constant level of physical
+ * eraseblock reserved for bad PEB handling. So, if there is a lack of reserved
+ * physical eraseblock, this function will reserve them.
+ */
+void ubi_acc_rmvol(const struct ubi_info *ubi, int reserved_pebs);
+
+/**
+ * ubi_acc_reserve - reserve a number of physical eraseblocks.
+ *
+ * @ubi: the UBI device description object
+ * @pebs: how many physical eraseblocks to reserve
+ *
+ * This function returns zero in case of success and %-ENOSPC if there are no
+ * enough physical eraseblocks.
+ */
+int ubi_acc_reserve(const struct ubi_info *ubi, int pebs);
+
+/**
+ * ubi_acc_free - free a number of reserved physical eraseblocks.
+ *
+ * @ubi: the UBI device description object
+ * @pebs: how many physical eraseblocks to free
+ */
+void ubi_acc_free(const struct ubi_info *ubi, int pebs);
+
+/**
+ * ubi_acc_init_scan - initialize the accounting unit using scanning
+ * information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_acc_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_acc_close - close the accounting unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_acc_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_acc_info - the UBI accounting unit's description data structure.
+ *
+ * @ivol_count: count of internal volumes
+ * @uvol_count: count of user volumes
+ * @rsvd_pebs: count of reserved physical eraseblocks
+ * @avail_pebs: count of available physical eraseblocks
+ * @max_volumes: maximum number of volumes that users may create
+ * @lock: protects the accounting data
+ */
+struct ubi_acc_info {
+	int ivol_count;  /* public  */
+	int uvol_count;  /* public  */
+	int rsvd_pebs;   /* public  */
+	int avail_pebs;  /* public  */
+	int max_volumes; /* public  */
+	spinlock_t lock; /* private */
+};
+
+#endif /* !__UBI_ACCOUNT_H__ */
diff --git a/drivers/mtd/ubi/alloc.c b/drivers/mtd/ubi/alloc.c
new file mode 100644
index 0000000..94a205a
--- /dev/null
+++ b/drivers/mtd/ubi/alloc.c
@@ -0,0 +1,604 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/slab.h>
+#include <linux/rwsem.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "io.h"
+#include "background.h"
+#include "wl.h"
+#include "debug.h"
+#include "eba.h"
+#include "scan.h"
+
+#define BGT_WORK_SLAB_NAME          "ubi_bgt_work_slab"
+#define WL_ERASE_WORK_SLAB_NAME     "ubi_wl_erase_work_slab"
+#define WL_ENTRIES_SLAB_NAME        "ubi_wl_entry_slab"
+#define WL_PROT_ENTRIES_SLAB_NAME   "ubi_wl_prow_entry_slab"
+#define EBA_LTREE_ENTRIES_SLAB_NAME "ubi_eba_ltree_entry_slab"
+#define SCAN_EB_SLAB_NAME           "ubi_scan_leb"
+#define SCAN_VOLUME_SLAB_NAME       "ubi_scan_volume"
+
+static struct kmem_cache *bgt_work_slab;
+static struct kmem_cache *wl_erase_work_slab;
+static struct kmem_cache *wl_entries_slab;
+static struct kmem_cache *wl_prot_entries_slab;
+static struct kmem_cache *eba_ltree_entries_slab;
+static struct kmem_cache *scan_eb_slab;
+static struct kmem_cache *scan_volume_slab;
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_ALLOC
+static int paranoid_alloc(const void *p);
+static int paranoid_free(const void *p);
+static void paranoid_check(void);
+#else
+#define paranoid_alloc(p) 0
+#define paranoid_free(p) 0
+#define paranoid_check()
+#endif
+
+void *ubi_kzalloc(size_t size, gfp_t flags)
+{
+	void *ret;
+
+	ret = kzalloc(size, flags);
+	if (unlikely(!ret)) {
+		ubi_err("cannot allocate %zd bytes, flags %u", size, flags);
+		dump_stack();
+		return NULL;
+	}
+
+	dbg_alloc("%p (%zd bytes)", ret, size);
+	if (unlikely(paranoid_alloc(ret)))
+		return NULL;
+	return ret;
+}
+
+void *ubi_kmalloc(size_t size, gfp_t flags)
+{
+	void *ret;
+
+	ret = kmalloc(size, flags);
+	if (unlikely(!ret)) {
+		ubi_err("cannot allocate %zd bytes, flags %u", size, flags);
+		dump_stack();
+		return NULL;
+	}
+
+	dbg_alloc("%p (%zd bytes)", ret, size);
+	if (unlikely(paranoid_alloc(ret)))
+		return NULL;
+	return ret;
+}
+
+void ubi_kfree(const void *obj)
+{
+	if (unlikely(!obj))
+		return;
+	if (unlikely(paranoid_free(obj)))
+		return;
+	dbg_alloc("%p", obj);
+	kfree(obj);
+}
+
+struct ubi_ec_hdr *ubi_alloc_ec_hdr(const struct ubi_info *ubi)
+{
+	struct ubi_ec_hdr *ec_hdr;
+	const struct ubi_io_info *io = ubi->io;
+
+	ec_hdr = kzalloc(io->ec_hdr_alsize, GFP_KERNEL);
+	if (unlikely(!ec_hdr)) {
+		ubi_err("cannot allocate %zd bytes", io->ec_hdr_alsize);
+		dump_stack();
+		return NULL;
+	}
+
+	dbg_alloc("%p (%zd bytes)", ec_hdr, io->ec_hdr_alsize);
+	if (unlikely(paranoid_alloc(ec_hdr)))
+		return NULL;
+
+	return ec_hdr;
+}
+
+void ubi_free_ec_hdr(const struct ubi_info *ubi, struct ubi_ec_hdr *ec_hdr)
+{
+	if (unlikely(!ec_hdr))
+		return;
+	if (unlikely(paranoid_free(ec_hdr)))
+		return;
+	dbg_alloc("%p", ec_hdr);
+	kfree(ec_hdr);
+}
+
+struct ubi_vid_hdr *ubi_alloc_vid_hdr(const struct ubi_info *ubi)
+{
+	char *vid_hdr;
+	const struct ubi_io_info *io = ubi->io;
+
+	vid_hdr = kzalloc(io->vid_hdr_alsize, GFP_KERNEL);
+	if (unlikely(!vid_hdr)) {
+		ubi_err("cannot allocate %zd bytes", io->vid_hdr_alsize);
+		dump_stack();
+		return NULL;
+	}
+
+	/*
+	 * If VID headers are stored at non-aligned addresses, we have to shift
+	 * the pointer.
+	 */
+	if (likely(vid_hdr))
+		vid_hdr = vid_hdr + io->vid_hdr_shift;
+
+	dbg_alloc("%p (%zd bytes)", vid_hdr, io->vid_hdr_alsize);
+	if (unlikely(paranoid_alloc(vid_hdr)))
+		return NULL;
+
+	return (struct ubi_vid_hdr *)vid_hdr;
+}
+
+void ubi_free_vid_hdr(const struct ubi_info *ubi, struct ubi_vid_hdr *vid_hdr)
+{
+	if (unlikely(!vid_hdr))
+		return;
+	if (unlikely(paranoid_free(vid_hdr)))
+		return;
+	vid_hdr = (struct ubi_vid_hdr *)((char *)vid_hdr - ubi->io->vid_hdr_shift);
+	dbg_alloc("%p", vid_hdr);
+	kfree(vid_hdr);
+}
+
+struct ubi_bgt_work *ubi_alloc_bgt_work(void)
+{
+	struct ubi_bgt_work *wrk;
+
+	wrk = kmem_cache_alloc(bgt_work_slab, GFP_KERNEL);
+	if (unlikely(!wrk)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+	dbg_alloc("%p (%zd bytes)", wrk, sizeof(struct ubi_bgt_work));
+	if (unlikely(paranoid_alloc(wrk)))
+		return NULL;
+	return wrk;
+}
+
+void ubi_free_bgt_work(struct ubi_bgt_work *wrk)
+{
+	if (unlikely(!wrk))
+		return;
+	if (unlikely(paranoid_free(wrk)))
+		return;
+	dbg_alloc("%p", wrk);
+	kmem_cache_free(bgt_work_slab, wrk);
+}
+
+struct ubi_wl_erase_work *ubi_alloc_wl_erase_work(void)
+{
+	struct ubi_wl_erase_work *wrk;
+
+	wrk = kmem_cache_alloc(wl_erase_work_slab, GFP_KERNEL);
+	if (unlikely(!wrk)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+	dbg_alloc("%p (%zd bytes)", wrk, sizeof(struct ubi_wl_erase_work));
+	if (unlikely(paranoid_alloc(wrk)))
+		return NULL;
+	return wrk;
+}
+
+void ubi_free_wl_erase_work(struct ubi_wl_erase_work *wrk)
+{
+	if (unlikely(!wrk))
+		return;
+	if (unlikely(paranoid_free(wrk)))
+		return;
+	dbg_alloc("%p", wrk);
+	kmem_cache_free(wl_erase_work_slab, wrk);
+}
+
+struct ubi_wl_entry *ubi_alloc_wl_entry(void)
+{
+	struct ubi_wl_entry *wle;
+
+	wle = kmem_cache_alloc(wl_entries_slab, GFP_KERNEL);
+	if (unlikely(!wle)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+	dbg_alloc("%p (%zd bytes)", wle, sizeof(struct ubi_wl_entry));
+	if (unlikely(paranoid_alloc(wle)))
+		return NULL;
+	return wle;
+}
+
+void ubi_free_wl_entry(struct ubi_wl_entry *wle)
+{
+	if (unlikely(!wle))
+		return;
+	if (unlikely(paranoid_free(wle)))
+		return;
+	dbg_alloc("%p", wle);
+	kmem_cache_free(wl_entries_slab, wle);
+}
+
+struct ubi_wl_prot_entry *ubi_alloc_wl_prot_entry(void)
+{
+	struct ubi_wl_prot_entry *pe;
+
+	pe = kmem_cache_alloc(wl_prot_entries_slab, GFP_KERNEL);
+	if (unlikely(!pe)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+	dbg_alloc("%p (%zd bytes)", pe, sizeof(struct ubi_wl_prot_entry));
+	if (unlikely(paranoid_alloc(pe)))
+		return NULL;
+	return pe;
+}
+
+void ubi_free_wl_prot_entry(struct ubi_wl_prot_entry *pe)
+{
+	if (unlikely(!pe))
+		return;
+	if (unlikely(paranoid_free(pe)))
+		return;
+	dbg_alloc("%p", pe);
+	kmem_cache_free(wl_prot_entries_slab, pe);
+}
+
+struct ubi_eba_ltree_entry *ubi_alloc_eba_ltree_entry(void)
+{
+	struct ubi_eba_ltree_entry *le;
+
+	le = kmem_cache_alloc(eba_ltree_entries_slab, GFP_KERNEL);
+	if (unlikely(!le)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+	dbg_alloc("%p (%zd bytes)", le, sizeof(struct ubi_eba_ltree_entry));
+	if (unlikely(paranoid_alloc(le)))
+		return NULL;
+	return le;
+}
+
+void ubi_free_eba_ltree_entry(struct ubi_eba_ltree_entry *le)
+{
+	if (unlikely(!le))
+		return;
+	if (unlikely(paranoid_free(le)))
+		return;
+	dbg_alloc("%p", le);
+	kmem_cache_free(eba_ltree_entries_slab, le);
+}
+
+struct ubi_scan_leb *ubi_alloc_scan_leb(void)
+{
+	struct ubi_scan_leb *seb;
+
+	seb = kmem_cache_alloc(scan_eb_slab, GFP_KERNEL);
+	if (unlikely(!seb)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+
+	dbg_alloc("%p (%zd bytes)", seb, sizeof(struct ubi_scan_leb));
+	if (unlikely(paranoid_alloc(seb)))
+		return NULL;
+	return seb;
+}
+
+void ubi_free_scan_leb(struct ubi_scan_leb *seb)
+{
+	if (unlikely(!seb))
+		return;
+	if (unlikely(paranoid_free(seb)))
+		return;
+	dbg_alloc("%p", seb);
+	kmem_cache_free(scan_eb_slab, seb);
+}
+
+struct ubi_scan_volume *ubi_alloc_scan_volume(void)
+{
+	struct ubi_scan_volume *sv;
+
+	sv = kmem_cache_alloc(scan_volume_slab, GFP_KERNEL);
+	if (unlikely(!sv)) {
+		ubi_err("failed to allocate memory");
+		dump_stack();
+		return NULL;
+	}
+
+	dbg_alloc("%p (%zd bytes)", sv, sizeof(struct ubi_scan_volume));
+	if (unlikely(paranoid_alloc(sv)))
+		return NULL;
+	return sv;
+}
+
+void ubi_free_scan_volume(struct ubi_scan_volume *sv)
+{
+	if (unlikely(!sv))
+		return;
+	if (unlikely(paranoid_free(sv)))
+		return;
+	dbg_alloc("%p", sv);
+	kmem_cache_free(scan_volume_slab, sv);
+}
+
+static void ltree_entries_ctor(void *obj, struct kmem_cache *cache,
+			       unsigned long falgs);
+
+__init int ubi_create_slab_caches(void)
+{
+	const char *name;
+	size_t size;
+
+	name = BGT_WORK_SLAB_NAME;
+	size = sizeof(struct ubi_bgt_work);
+	bgt_work_slab = kmem_cache_create(name, size, 0, 0, NULL, NULL);
+	if (!bgt_work_slab)
+		goto out;
+
+	name = WL_ERASE_WORK_SLAB_NAME;
+	size = sizeof(struct ubi_wl_erase_work);
+	wl_erase_work_slab = kmem_cache_create(name, size, 0, 0, NULL, NULL);
+	if (!wl_erase_work_slab)
+		goto out;
+
+	name = WL_ENTRIES_SLAB_NAME;
+	size = sizeof(struct ubi_wl_entry);
+	wl_entries_slab = kmem_cache_create(name, size, 0, 0, NULL, NULL);
+	if (!wl_entries_slab)
+		goto out;
+
+	name = WL_PROT_ENTRIES_SLAB_NAME;
+	size = sizeof(struct ubi_wl_prot_entry);
+	wl_prot_entries_slab = kmem_cache_create(name, size, 0, 0, NULL,
+						   NULL);
+	if (!wl_prot_entries_slab)
+		goto out;
+
+	name = EBA_LTREE_ENTRIES_SLAB_NAME;
+	size = sizeof(struct ubi_eba_ltree_entry);
+	eba_ltree_entries_slab = kmem_cache_create(name, size, 0, 0,
+						   &ltree_entries_ctor, NULL);
+	if (!eba_ltree_entries_slab)
+		goto out;
+
+	name = SCAN_EB_SLAB_NAME;
+	size = sizeof(struct ubi_scan_leb);
+	scan_eb_slab = kmem_cache_create(name, size, 0, 0, NULL, NULL);
+	if (!scan_eb_slab)
+		goto out;
+
+	name = SCAN_VOLUME_SLAB_NAME;
+	size = sizeof(struct ubi_scan_volume);
+	scan_volume_slab = kmem_cache_create(name, size, 0, 0, NULL, NULL);
+	if (!scan_volume_slab)
+		goto out;
+
+	return 0;
+
+out:
+	ubi_err("cannot create \"%s\" slab", name);
+	ubi_destroy_slab_caches();
+	return -ENOMEM;
+}
+
+__exit void ubi_destroy_slab_caches(void)
+{
+	paranoid_check();
+	if (scan_volume_slab)
+		kmem_cache_destroy(scan_volume_slab);
+	if (scan_eb_slab)
+		kmem_cache_destroy(scan_eb_slab);
+	if (eba_ltree_entries_slab)
+		kmem_cache_destroy(eba_ltree_entries_slab);
+	if (wl_prot_entries_slab)
+		kmem_cache_destroy(wl_prot_entries_slab);
+	if (wl_entries_slab)
+		kmem_cache_destroy(wl_entries_slab);
+	if (wl_erase_work_slab)
+		kmem_cache_destroy(wl_erase_work_slab);
+	if (bgt_work_slab)
+		kmem_cache_destroy(bgt_work_slab);
+}
+
+static void ltree_entries_ctor(void *obj, struct kmem_cache *cache,
+			       unsigned long falgs)
+{
+	struct ubi_eba_ltree_entry *le = obj;
+
+	le->users = 0;
+	init_rwsem(&le->mutex);
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_ALLOC
+
+/*
+ * If UBI memory allocation unit paranoid checking is enabled, we maintain an
+ * allocation RB-tree, remember all allocations and issue a warning if
+ * something was not freed when the module is being unloaded.
+ */
+
+#include <linux/rbtree.h>
+#include <linux/spinlock.h>
+#include <linux/kallsyms.h>
+#include "misc.h"
+
+/*
+ * struct alloc_tree_entry - an entry in the tree of allocations.
+ *
+ * @rb: the RB-tree link
+ * @add: the address of the allocated object
+ * @caller0: the caller address
+ * @caller1: the caller's caller address
+ */
+struct alloc_tree_entry {
+	struct rb_node rb;
+	unsigned long addr;
+	unsigned long caller0;
+	unsigned long caller1;
+};
+
+/* The root of the allocation tree */
+static struct rb_root alloc_tree = RB_ROOT;
+
+/* Protects the allocation tree */
+static spinlock_t alloc_tree_lock = SPIN_LOCK_UNLOCKED;
+
+static void print_allocated(void);
+
+/**
+ * paranoid_alloc - a notifier that the object was allocated.
+ *
+ * @a: the object address
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int paranoid_alloc(const void *a)
+{
+	struct rb_node **p, *parent = NULL;
+	struct alloc_tree_entry *te;
+	unsigned long addr = (unsigned long)a;
+
+	if (unlikely(!a))
+		return 0;
+
+	te = kmalloc(sizeof(struct alloc_tree_entry), GFP_KERNEL);
+	if (unlikely(!te)) {
+		ubi_err("no memory, may be memory leaks?");
+		dump_stack();
+		ubi_msg("allocated objects:");
+		print_allocated();
+		return -ENOMEM;
+	}
+
+	te->addr = addr;
+	te->caller0 = (unsigned long)__builtin_return_address(0);
+	te->caller1 = (unsigned long)__builtin_return_address(1);
+
+	spin_lock(&alloc_tree_lock);
+	p = &alloc_tree.rb_node;
+	while (*p) {
+		struct alloc_tree_entry *te1;
+
+		parent = *p;
+		te1 = rb_entry(parent, struct alloc_tree_entry, rb);
+
+		BUG_ON(addr == te1->addr);
+
+		if (addr < te1->addr)
+			p = &(*p)->rb_left;
+		else
+			p = &(*p)->rb_right;
+	}
+
+	rb_link_node(&te->rb, parent, p);
+	rb_insert_color(&te->rb, &alloc_tree);
+	spin_unlock(&alloc_tree_lock);
+	return 0;
+}
+
+/**
+ * paranoid_free - a notifier that an object was freed.
+ *
+ * @a: the object address
+ *
+ * This function returns zero if the object was previously allocated and
+ * %1 if not.
+ */
+static int paranoid_free(const void *a)
+{
+	struct rb_node *p;
+	unsigned long addr = (unsigned long)a;
+	struct alloc_tree_entry *te;
+
+	if (unlikely(!a))
+		return 0;
+
+	spin_lock(&alloc_tree_lock);
+	p = alloc_tree.rb_node;
+	while (p) {
+		te = rb_entry(p, struct alloc_tree_entry, rb);
+
+		if (addr == te->addr)
+			break;
+
+		if (addr < te->addr)
+			p = p->rb_left;
+		else
+			p = p->rb_right;
+	}
+
+	if (unlikely(!p)) {
+		ubi_err("free a non-allocated object %p", a);
+		dump_stack();
+		spin_unlock(&alloc_tree_lock);
+		return 1;
+	}
+
+	rb_erase(&te->rb, &alloc_tree);
+	spin_unlock(&alloc_tree_lock);
+	kfree(te);
+	return 0;
+}
+
+/**
+ * paranoid_check - check that all the allocated objects were freed.
+ */
+static void paranoid_check(void)
+{
+	if (alloc_tree.rb_node == NULL)
+		return;
+
+	ubi_err("paranoid check failed");
+	ubi_msg("the following objects were not freed");
+	print_allocated();
+}
+
+/**
+ * print_allocated - print the list of allocated objects.
+ */
+static void print_allocated(void)
+{
+	struct rb_node *p;
+	struct alloc_tree_entry *te;
+
+	spin_lock(&alloc_tree_lock);
+	rb_for_each_entry(p, te, &alloc_tree, rb) {
+		printk(UBI_MSG_PREF "%#lx, callers: ", te->addr);
+		__print_symbol("%s <== ", te->caller0);
+		__print_symbol("%s\n", te->caller1);
+	}
+	spin_unlock(&alloc_tree_lock);
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_ALLOC */
diff --git a/drivers/mtd/ubi/alloc.h b/drivers/mtd/ubi/alloc.h
new file mode 100644
index 0000000..60abbe2
--- /dev/null
+++ b/drivers/mtd/ubi/alloc.h
@@ -0,0 +1,229 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI memory allocation unit.
+ *
+ * This unit provides memory allocation/deallocation calls and wrappers, plus
+ * some debugging stuff.
+ */
+
+#ifndef __UBI_ALLOC_H__
+#define __UBI_ALLOC_H__
+
+#include <linux/slab.h>
+
+struct ubi_info;
+struct ubi_ec_hdr;
+struct ubi_vid_hdr;
+struct ubi_bgt_work;
+struct ubi_wl_erase_work;
+struct ubi_wl_entry;
+struct ubi_wl_prot_entry;
+struct ubi_eba_ltree_entry;
+struct ubi_scan_leb;
+struct ubi_scan_volume;
+
+/**
+ * ubi_kmalloc - allocate memory.
+ *
+ * This function is just a wrapper over the standard Linux 'kmalloc()'
+ * function.
+ */
+void *ubi_kmalloc(size_t size, gfp_t flags);
+
+/**
+ * ubi_kzalloc - allocate and zero memory.
+ *
+ * This function is just a wrapper over the standard Linux 'kzalloc()'
+ * function.
+ */
+void *ubi_kzalloc(size_t size, gfp_t flags);
+
+/**
+ * ubi_kfree - free memory allocated by 'ubi_kmalloc()' or 'ubi_kzalloc()'.
+ *
+ * @obj: a pointer to the object to free
+ *
+ * This is just a wrapper over the standard Linux 'kfree()' function.
+ */
+void ubi_kfree(const void *obj);
+
+/**
+ * ubi_alloc_ec_hdr - allocate a &struct ubi_ec_hdr object.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns a pointer to the newly allocated and zero-filled erase
+ * counter header object in case of success and %NULL in case of failure.
+ */
+struct ubi_ec_hdr *ubi_alloc_ec_hdr(const struct ubi_info *ubi);
+
+/**
+ * ubi_free_ec_hdr - free a &struct ubi_ec_hdr object.
+ *
+ * @ubi: the UBI device description object
+ * @ec_hdr: a pointer to the object to free
+ */
+void ubi_free_ec_hdr(const struct ubi_info *ubi, struct ubi_ec_hdr *ec_hdr);
+
+/**
+ * ubi_alloc_vid_hdr - allocate a &struct ubi_vid_hdr object.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns a pointer to the newly allocated and zero-filled
+ * volume identifier header object in case of success and %NULL in case of
+ * failure.
+ */
+struct ubi_vid_hdr *ubi_alloc_vid_hdr(const struct ubi_info *ubi);
+
+/**
+ * ubi_free_vid_hdr - free a &struct ubi_vid_hdr object.
+ *
+ * @ubi: the UBI device description object
+ * @vid_hdr: a pointer to the object to free
+ */
+void ubi_free_vid_hdr(const struct ubi_info *ubi, struct ubi_vid_hdr *vid_hdr);
+
+/**
+ * ubi_alloc_bgt_work - allocate a &struct ubi_bgt_work object.
+ *
+ * This function returns a pointer to the newly allocated &struct ubi_bgt_work
+ * object in case of success and %NULL in case of failure. The allocated object
+ * is not zeroed.
+ */
+struct ubi_bgt_work *ubi_alloc_bgt_work(void);
+
+/**
+ * ubi_free_bgt_work - free a &struct ubi_bgt_work object.
+ *
+ * @wrk: a pointer to the object to free
+ */
+void ubi_free_bgt_work(struct ubi_bgt_work *wrk);
+
+/**
+ * ubi_alloc_wl_erase_work - allocate a &struct ubi_wl_erase_work object.
+ *
+ * This function returns a pointer to the newly allocated &struct ubi_wl_erase_work
+ * object in case of success and %NULL in case of failure. The allocated object
+ * is not zeroed.
+ */
+struct ubi_wl_erase_work *ubi_alloc_wl_erase_work(void);
+
+/**
+ * ubi_free_wl_erase_work - free a &struct ubi_wl_erase_work object.
+ *
+ * @wrk: a pointer to the object to free
+ */
+void ubi_free_wl_erase_work(struct ubi_wl_erase_work *wrk);
+
+/**
+ * ubi_alloc_wl_entry - allocate a &struct ubi_wl_entry object.
+ *
+ * This function returns a pointer to the newly allocated &struct ubi_wl_entry
+ * object in case of success and %NULL in case of failure. The allocated object
+ * is not zeroed.
+ */
+struct ubi_wl_entry *ubi_alloc_wl_entry(void);
+
+/**
+ * ubi_free_wl_entry - free a &struct ubi_wl_entry object.
+ *
+ * @wle: a pointer to the object to free
+ */
+void ubi_free_wl_entry(struct ubi_wl_entry *wle);
+
+/**
+ * ubi_alloc_wl_prot_entry - allocate a &struct ubi_wl_prot_entry object.
+ *
+ * This function returns a pointer to the newly allocated
+ * &struct ubi_wl_prot_entry object in case of success and %NULL in case of
+ * failure. The allocated object is not zeroed.
+ */
+struct ubi_wl_prot_entry *ubi_alloc_wl_prot_entry(void);
+
+/**
+ * ubi_free_wl_prot_entry - free a &struct ubi_wl_prot_entry object.
+ *
+ * @pe: a pointer to the object to free
+ */
+void ubi_free_wl_prot_entry(struct ubi_wl_prot_entry *pe);
+
+/**
+ * ubi_alloc_eba_ltree_entry - allocate a &struct ubi_eba_ltree_entry object.
+ *
+ * This function returns a pointer to the newly allocated
+ * &struct ubi_eba_ltree_entry object in case of success and %NULL in case of
+ * failure. The allocated object is not zeroed, but the @users and @mutex
+ * fields are initialized by slab constructor.
+ */
+struct ubi_eba_ltree_entry *ubi_alloc_eba_ltree_entry(void);
+
+/**
+ * ubi_free_eba_ltree_entry - free a &struct ubi_eba_ltree_entry object.
+ *
+ * @le: a pointer to the object to free
+ */
+void ubi_free_eba_ltree_entry(struct ubi_eba_ltree_entry *le);
+
+/**
+ * ubi_alloc_scan_leb - allocate a &struct ubi_scan_leb object.
+ *
+ * This function returns a pointer to the newly allocated &struct ubi_scan_leb
+ * object in case of success, or %NULL in case of failure. The allocated object
+ * is not zeroed.
+ */
+struct ubi_scan_leb *ubi_alloc_scan_leb(void);
+
+/**
+ * ubi_free_scan_leb - free a &struct ubi_scan_leb object.
+ *
+ * @seb: a pinter to the &struct ubi_scan_leb object to free
+ */
+void ubi_free_scan_leb(struct ubi_scan_leb *seb);
+
+/**
+ * ubi_alloc_scan_volume - allocate a &struct ubi_scan_volume object.
+ *
+ * This function returns a pointer to the newly allocated &struct
+ * ubi_scan_volume object in cases of success, or %NULL in case of failure. The
+ * allocated object is not zeroed.
+ */
+struct ubi_scan_volume *ubi_alloc_scan_volume(void);
+
+/**
+ * ubi_free_scan_volume - free a &struct ubi_scan_volume object.
+ *
+ * @sv: a pinter to the &struct ubi_scan_volume object to free
+ */
+void ubi_free_scan_volume(struct ubi_scan_volume *sv);
+
+/**
+ * ubi_create_slab_caches - create UBI slab caches.
+ */
+int ubi_create_slab_caches(void);
+
+/**
+ * ubi_destroy_slab_caches - destroy UBI slab caches.
+ */
+void ubi_destroy_slab_caches(void);
+
+#endif /* !__UBI_ALLOC_H__ */
diff --git a/drivers/mtd/ubi/background.c b/drivers/mtd/ubi/background.c
new file mode 100644
index 0000000..ef61d28
--- /dev/null
+++ b/drivers/mtd/ubi/background.c
@@ -0,0 +1,326 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Authors: Thomas Gleixner, Artem B. Bityutskiy
+ */
+
+#include <linux/string.h>
+#include <linux/sched.h>
+#include <linux/completion.h>
+#include <linux/spinlock.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "debug.h"
+#include "background.h"
+
+/* Background thread name pattern */
+#define BGT_NAME_PATTERN "ubi_bgt%dd"
+/* Highest number of pending works */
+#define BGT_MAX_PENDING_WORKS 0x7FFFFFFF
+
+static void bgt_do_wrk(const struct ubi_info *ubi);
+
+int ubi_bgt_schedule(const struct ubi_info *ubi, struct ubi_bgt_work *wrk)
+{
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+retry:
+	spin_lock(&bgt->lock);
+	dbg_bgt("%s: schedule work %p (func %p, priv %p)",
+		bgt->bgt_name, wrk, wrk->func, wrk->priv);
+
+	if (unlikely(!bgt->task)) {
+		ubi_err("task \"%s\" was killed", bgt->bgt_name);
+		spin_unlock(&bgt->lock);
+		return -ENODEV;
+	}
+
+	if (unlikely(bgt->pending_works_count == BGT_MAX_PENDING_WORKS)) {
+		/* Too many pending works */
+		spin_unlock(&bgt->lock);
+		dbg_wl("pending queue is too long, do a work");
+		bgt_do_wrk(ubi);
+		goto retry;
+	}
+
+	list_add_tail(&wrk->list, &bgt->pending_works);
+	bgt->pending_works_count += 1;
+
+	if (!bgt->active_work && likely(bgt->enabled))
+		wake_up_process(bgt->task);
+	spin_unlock(&bgt->lock);
+	return 0;
+}
+
+int ubi_bgt_reschedule(const struct ubi_info *ubi, struct ubi_bgt_work *wrk)
+{
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	spin_lock(&bgt->lock);
+	dbg_bgt("%s: re-schedule work %p (func %p, priv %p)",
+		bgt->bgt_name, wrk, wrk->func, wrk->priv);
+
+	if (unlikely(!bgt->task)) {
+		ubi_err("task \"%s\" was killed", bgt->bgt_name);
+		spin_unlock(&bgt->lock);
+		return -ENODEV;
+	}
+
+	list_add_tail(&wrk->list, &bgt->pending_works);
+	bgt->pending_works_count += 1;
+
+	if (!bgt->active_work && likely(bgt->enabled))
+		wake_up_process(bgt->task);
+	spin_unlock(&bgt->lock);
+	return 0;
+}
+
+struct ubi_bgt_work *ubi_bgt_next_work(const struct ubi_info *ubi)
+{
+	struct ubi_bgt_work *wrk;
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	spin_lock(&bgt->lock);
+	if (list_empty(&bgt->pending_works)) {
+		wrk = NULL;
+		dbg_bgt("%s: no works", bgt->bgt_name);
+	} else {
+		wrk = list_entry(bgt->pending_works.next, struct ubi_bgt_work,
+				 list);
+		list_del(&wrk->list);
+		bgt->pending_works_count -= 1;
+		dbg_bgt("%s: next work %p (func %p, priv %p)",
+			bgt->bgt_name, wrk, wrk->func, wrk->priv);
+	}
+	spin_unlock(&bgt->lock);
+	return wrk;
+}
+
+int ubi_bgt_enable(const struct ubi_info *ubi)
+{
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	spin_lock(&bgt->lock);
+	dbg_bgt("enable \"%s\"", bgt->bgt_name);
+
+	if (!bgt->task) {
+		ubi_err("task \"%s\" was killed", bgt->bgt_name);
+		spin_unlock(&bgt->lock);
+		return -ENODEV;
+	}
+
+	bgt->enabled = 1;
+	wake_up_process(bgt->task);
+	spin_unlock(&bgt->lock);
+	return 0;
+}
+
+void ubi_bgt_disable(const struct ubi_info *ubi)
+{
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	spin_lock(&bgt->lock);
+	dbg_bgt("disable \"%s\"", bgt->bgt_name);
+	bgt->enabled = 0;
+	spin_unlock(&bgt->lock);
+}
+
+void ubi_bgt_kill_thread(const struct ubi_info *ubi)
+{
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	dbg_bgt("disable \"%s\"", bgt->bgt_name);
+	if (bgt->task) {
+		send_sig(SIGKILL, bgt->task, 1);
+		wait_for_completion(&bgt->thread_stop);
+	}
+}
+
+/**
+ * bgt_do_wrk - run pending works.
+ *
+ * @ubi: the UBI device description object
+ */
+static void bgt_do_wrk(const struct ubi_info *ubi)
+{
+	int err;
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	spin_lock(&bgt->lock);
+	while (!list_empty(&bgt->pending_works) && likely(bgt->enabled)) {
+		struct ubi_bgt_work *wrk;
+
+		bgt->active_work = wrk = list_entry(bgt->pending_works.next,
+						    struct ubi_bgt_work, list);
+		list_del(&wrk->list);
+		bgt->pending_works_count -= 1;
+		ubi_assert(bgt->pending_works_count >= 0);
+		spin_unlock(&bgt->lock);
+
+		cond_resched();
+
+		/*
+		 * Call the worker function. Do not touch the work structure
+		 * after this call as it will have been freed or reused by that
+		 * time by the worker function.
+		 */
+		dbg_bgt("%s: run work %p (func %p, priv %p)",
+			bgt->bgt_name, wrk, wrk->func, wrk->priv);
+
+		err = wrk->func(ubi, wrk, 0);
+		if (unlikely(err))
+			ubi_warn("%s: work failed with error code %d",
+				 bgt->bgt_name, err);
+
+		spin_lock(&bgt->lock);
+		bgt->active_work = NULL;
+	}
+	spin_unlock(&bgt->lock);
+}
+
+/**
+ * ubi_thread - UBI background thread.
+ *
+ * @u: the UBI device description object pointer
+ */
+static int ubi_thread(void *u)
+{
+	const struct ubi_info *ubi = u;
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	daemonize(bgt->bgt_name);
+	allow_signal(SIGKILL);
+	allow_signal(SIGSTOP);
+
+	ubi_msg("background thread \"%s\" started, PID %d",
+		bgt->bgt_name, current->pid);
+
+	bgt->task = current;
+	complete(&bgt->thread_start);
+	set_current_state(TASK_INTERRUPTIBLE);
+	schedule();
+
+	for (;;) {
+		cond_resched();
+
+		if (unlikely(!bgt->enabled) ||
+			     list_empty(&bgt->pending_works)) {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule();
+		}
+
+		if (try_to_freeze())
+			continue;
+
+		while (signal_pending(current)) {
+			siginfo_t info;
+			unsigned long nr;
+
+			nr = dequeue_signal_lock(current, &current->blocked,
+						 &info);
+			if (nr == SIGKILL)
+				goto out;
+			if (nr == SIGSTOP) {
+				bgt->enabled = !bgt->enabled;
+				ubi_msg("%s the background thread",
+					bgt->enabled ? "enable" : "disable");
+			}
+		}
+
+		bgt_do_wrk(ubi);
+	}
+
+out:
+	ubi_msg("killing background thread \"%s\"", bgt->bgt_name);
+
+	/* Cancel all pending works before exiting */
+	spin_lock(&bgt->lock);
+	bgt->task = NULL;
+
+	bgt->enabled = 0;
+	while (!list_empty(&bgt->pending_works)) {
+		struct ubi_bgt_work *wrk;
+
+		wrk = list_entry(bgt->pending_works.next, struct ubi_bgt_work,
+				 list);
+		list_del(&wrk->list);
+		bgt->pending_works_count -= 1;
+		spin_unlock(&bgt->lock);
+		wrk->func(ubi, wrk, 1);
+		spin_lock(&bgt->lock);
+	}
+	spin_unlock(&bgt->lock);
+
+	complete_and_exit(&bgt->thread_stop, 0);
+}
+
+int ubi_bgt_init(struct ubi_info *ubi)
+{
+	int err;
+	pid_t pid;
+	struct ubi_bgt_info *bgt;
+
+	dbg_bgt("initialize the UBI background thread unit");
+
+	bgt = ubi_kzalloc(sizeof(struct ubi_bgt_info), GFP_KERNEL);
+	if (!bgt)
+		return -ENOMEM;
+	ubi->bgt = bgt;
+
+	init_completion(&bgt->thread_start);
+	init_completion(&bgt->thread_stop);
+	INIT_LIST_HEAD(&bgt->pending_works);
+	spin_lock_init(&bgt->lock);
+
+	bgt->bgt_name = ubi_kmalloc(sizeof(BGT_NAME_PATTERN) + 20, GFP_KERNEL);
+	if (!bgt->bgt_name) {
+		err = -ENOMEM;
+		goto out_bgt;
+	}
+	sprintf(bgt->bgt_name, BGT_NAME_PATTERN, ubi->ubi_num);
+
+	pid = kernel_thread(ubi_thread, ubi, CLONE_FS | CLONE_FILES);
+	if (pid < 0) {
+		err = pid;
+		ubi_err("cannot spawn \"%s\", error %d", bgt->bgt_name, err);
+		goto out_name;
+	}
+
+	wait_for_completion(&bgt->thread_start);
+	dbg_bgt("the UBI background thread unit is initialized");
+	return 0;
+
+out_name:
+	ubi_kfree(bgt->bgt_name);
+out_bgt:
+	ubi_kfree(bgt);
+	return err;
+}
+
+void ubi_bgt_close(struct ubi_info *ubi)
+{
+	struct ubi_bgt_info *bgt = ubi->bgt;
+
+	dbg_bgt("close the UBI background thread unit");
+
+	ubi_assert(!bgt->enabled);
+	ubi_assert(bgt->pending_works_count == 0);
+	ubi_assert(list_empty(&bgt->pending_works));
+
+	ubi_kfree(bgt->bgt_name);
+	ubi_kfree(bgt);
+}
diff --git a/drivers/mtd/ubi/background.h b/drivers/mtd/ubi/background.h
new file mode 100644
index 0000000..094aa96
--- /dev/null
+++ b/drivers/mtd/ubi/background.h
@@ -0,0 +1,174 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Authors: Thomas Gleixner, Artem B. Bityutskiy
+ */
+
+/*
+ * UBI background thread unit.
+ *
+ * This unit maintains a per-UBI device thread which is supposed to do
+ * different background works. It is mostly used by the WL unit to perform
+ * eraseblock erasure and movement, but may also be used for other works.
+ */
+
+#ifndef __UBI_BACKGROUND_H__
+#define __UBI_BACKGROUND_H__
+
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/completion.h>
+
+struct ubi_info;
+struct ubi_bgt_work;
+
+/**
+ * ubi_bgt_schedule - schedule a work.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work to schedule
+ *
+ * This function enqueues a work defined by @wrk to the tail of the pending
+ * works list. Returns zero in case of success and %-ENODEV if the background
+ * thread was killed.
+ */
+int ubi_bgt_schedule(const struct ubi_info *ubi, struct ubi_bgt_work *wrk);
+
+/**
+ * ubi_bgt_reschedule - re-schedule a work.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work to re-schedule.
+ *
+ * This function enqueues a work defined by @wrk to the tail of the pending
+ * works list. Returns zero in case of success and %-ENODEV if the background
+ * thread was killed.
+ */
+int ubi_bgt_reschedule(const struct ubi_info *ubi, struct ubi_bgt_work *wrk);
+
+/**
+ * ubi_bgt_next_work - get the next pending work.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function dequeues a work form the head of the pending works queue and
+ * returns a pointer on it. If the queue is empty, %NULL us returned.
+ */
+struct ubi_bgt_work *ubi_bgt_next_work(const struct ubi_info *ubi);
+
+/**
+ * ubi_bgt_enable - enable the background thread.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function enables the background thread for UBI device defined by @ubi.
+ * Returns zero in case of success and %-ENODEV if the background thread was
+ * killed.
+ */
+int ubi_bgt_enable(const struct ubi_info *ubi);
+
+/**
+ * ubi_bgt_disable - disable the background thread.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_bgt_disable(const struct ubi_info *ubi);
+
+/**
+ * ubi_bgt_kill_thread - kill the background thread.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function kills the background thread for UBI device defined by @ubi.
+ * This function also makes sure all the pending tasks are done.
+ */
+void ubi_bgt_kill_thread(const struct ubi_info *ubi);
+
+/**
+ * ubi_bgt_init - initialize the background thread unit for an UBI device.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_bgt_init(struct ubi_info *ubi);
+
+/**
+ * ubi_bgt_close - close the background thread unit for an UBI device.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_bgt_close(struct ubi_info *ubi);
+
+/**
+ * ubi_bgt_worker_t - background worker function prototype.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work object pointer
+ * @cancel: non-zero if the work has to be canceled
+ *
+ * The @cancel argument is not zero when the background thread is being killed
+ * and just wants the worker to free  everything associated with this work
+ * (@wrk).
+ */
+typedef int ubi_bgt_worker_t(const struct ubi_info *ubi,
+			     struct ubi_bgt_work *wrk, int cancel);
+
+/**
+ * struct ubi_bgt_work - a background work.
+ *
+ * @list: a link in the list of pending works
+ * @func: the worker function
+ * @priv: private data of the worker function
+ *
+ * To schedule a background work users have to construct a
+ * &struct ubi_bgt_work object, initialize the @func and @priv fields and call
+ * 'ubi_bgt_schedule()'.
+ */
+struct ubi_bgt_work {
+	struct list_head list;
+	ubi_bgt_worker_t *func;
+	void *priv;
+};
+
+/**
+ * struct ubi_bgt_work - UBI background thread unit description data structure.
+ *
+ * @pending_works: the list of pending works
+ * @active_work: the work which is currently running
+ * @pending_works_count: count of pending works
+ * @lock: protects the @pending_works, @active_work, @enabled, and @task fields
+ * @enabled: if the background thread is enabled
+ * @task: a pointer to the &struct task_struct of the background thread
+ * @bgt_name: the background thread name
+ * @thread_start: used to synchronize with starting of the background thread
+ * @thread_stop: used to synchronize with killing of the background thread
+ */
+struct ubi_bgt_info {
+	struct list_head pending_works;   /* private */
+	struct ubi_bgt_work *active_work; /* private */
+	int pending_works_count;          /* public  */
+	spinlock_t lock;                  /* private */
+	int enabled;                      /* public  */
+	struct task_struct *task;         /* private */
+	char *bgt_name;                   /* public  */
+	struct completion thread_start;   /* private */
+	struct completion thread_stop;    /* private */
+};
+
+#endif /* !__UBI_BACKGROUND_H__ */
diff --git a/drivers/mtd/ubi/badeb.c b/drivers/mtd/ubi/badeb.c
new file mode 100644
index 0000000..6ef271f
--- /dev/null
+++ b/drivers/mtd/ubi/badeb.c
@@ -0,0 +1,232 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "badeb.h"
+#include "debug.h"
+#include "io.h"
+#include "eba.h"
+#include "account.h"
+#include "wl.h"
+#include "misc.h"
+
+/* The lowest number PEBs reserved for bad PEB handling */
+#define MIN_RESEVED_PEBS 1
+
+static void calculate_reserved_max(const struct ubi_info *ubi);
+
+int ubi_beb_mark_bad(const struct ubi_info *ubi, int pnum)
+{
+	int err;
+	struct ubi_beb_info *beb = ubi->beb;
+
+	ubi_assert(ubi->io->bad_allowed);
+
+	err = ubi_io_mark_bad(ubi, pnum);
+	if (err)
+		return err;
+
+	spin_lock(&beb->lock);
+	if (beb->reserved_pebs <= 0)
+		ubi_warn("no reserved physical eraseblocks!");
+	ubi->io->bad_peb_count += 1;
+	ubi->io->good_peb_count -= 1;
+	calculate_reserved_max(ubi);
+	beb->reserved_pebs -= 1;
+	if (beb->reserved_pebs < beb->reserved_max && !ubi_acc_reserve(ubi, 1))
+		beb->reserved_pebs += 1;
+	spin_unlock(&beb->lock);
+
+	ubi_msg("PEB %d wend bad, mark it as bad", pnum);
+	return err;
+}
+
+void ubi_beb_maintain_reserved(const struct ubi_info *ubi)
+{
+	int err, i, needed;
+	struct ubi_beb_info *beb = ubi->beb;
+
+	if (!ubi->io->bad_allowed)
+		return;
+
+	spin_lock(&beb->lock);
+	needed = beb->reserved_max - beb->reserved_pebs;
+	for (i = needed; i > 0; i--) {
+		err = ubi_acc_reserve(ubi, i);
+		if (!err) {
+			ubi_msg("allocated %d PEBs for bad PEB handling", i);
+			beb->reserved_pebs += i;
+			break;
+		}
+	}
+	spin_unlock(&beb->lock);
+}
+
+int ubi_beb_recover_peb(const struct ubi_info *ubi, int pnum, int vol_id,
+			int lnum, const void *buf, int offset, int len)
+{
+	int err, new_pnum, data_size, read, tries = 0;
+	struct ubi_vid_hdr *vid_hdr;
+	unsigned char *new_buf;
+
+	ubi_assert(ubi->io->bad_allowed);
+
+retry:
+	new_pnum = ubi_wl_get_peb(ubi, UBI_DATA_UNKNOWN);
+	if (new_pnum < 0)
+		return new_pnum;
+
+	ubi_msg("recover PEB %d, move its data to PEB %d", pnum, new_pnum);
+
+	/* At first recover the VID header */
+
+	vid_hdr = ubi_alloc_vid_hdr(ubi);
+	if (!vid_hdr) {
+		err = -ENOMEM;
+		goto out_put;
+	}
+
+	err = ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
+	if (err && err != UBI_IO_BITFLIPS) {
+		if (err > 0)
+			err = -EIO;
+		goto out_vid_hdr;
+	}
+
+	vid_hdr->leb_ver = cpu_to_ubi32(ubi32_to_cpu(vid_hdr->leb_ver) + 1);
+	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
+	if (err)
+		goto vid_write_error;
+
+	/* Now recover the data */
+
+	data_size = offset + len;
+	new_buf = ubi_kmalloc(data_size, GFP_KERNEL);
+	if (unlikely(!new_buf)) {
+		err = -ENOMEM;
+		goto out_vid_hdr;
+	}
+	memset(new_buf + offset, 0xFF, len);
+
+	/* Read everything before the area where the write failure happened */
+	if (offset > 0) {
+		err = ubi_io_read_data(ubi, new_buf, pnum, 0, offset,
+				       &read);
+		if (err && err != UBI_IO_BITFLIPS)
+			goto out_new_buf;
+	}
+
+	/*
+	 * Now we assume that before the failed write the (offset, offset+len)
+	 * area contained all 0xFF bytes. This is true for NAND. This is not
+	 * always true for NOR, but NOR don't admit of bad PEBs.
+	 */
+	memcpy(new_buf + offset, buf, len);
+
+	err = ubi_io_write_data(ubi, new_buf, new_pnum, 0, data_size, &read);
+	if (err)
+		goto vid_data_write_error;
+
+	ubi_kfree(new_buf);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	ubi_eba_leb_remap(ubi, vol_id, lnum, new_pnum);
+	ubi_wl_put_peb(ubi, pnum, 1);
+	ubi_msg("data was successfully recovered")
+	return 0;
+
+out_new_buf:
+	ubi_kfree(new_buf);
+out_vid_hdr:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+out_put:
+	ubi_wl_put_peb(ubi, new_pnum, 1);
+	return err;
+
+vid_data_write_error:
+	ubi_kfree(new_buf);
+vid_write_error:
+	/*
+	 * Bad luck? This physical eraseblock is bad too? Crud. Let's try to
+	 * get another one.
+	 */
+	ubi_warn("failed to write to PEB %d", new_pnum);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	ubi_wl_put_peb(ubi, new_pnum, 1);
+	if (++tries > 5)
+		/* We've tried too many times */
+		return err;
+	goto retry;
+}
+
+int ubi_beb_init(struct ubi_info *ubi)
+{
+	int i;
+	struct ubi_beb_info *beb;
+	const struct ubi_io_info *io = ubi->io;
+
+	beb = ubi_kzalloc(sizeof(struct ubi_beb_info), GFP_KERNEL);
+	if (!beb)
+		return -ENOMEM;
+	ubi->beb = beb;
+
+	spin_lock_init(&beb->lock);
+
+	if (!io->bad_allowed)
+		return 0;
+
+	calculate_reserved_max(ubi);
+
+	for (i = beb->reserved_max; i > 0; i--)
+		if (!ubi_acc_reserve(ubi, i)) {
+			beb->reserved_pebs = i;
+			break;
+		}
+
+	if (beb->reserved_pebs < beb->reserved_max)
+		/* No enough free physical eraseblocks */
+		ubi_warn("cannot reserve enough PEBs");
+
+	return 0;
+}
+
+void ubi_beb_close(struct ubi_info *ubi)
+{
+	ubi_kfree(ubi->beb);
+}
+
+/**
+ * calculate_reserved_max - calculate how many PEBs must be reserved for bad
+ * eraseblock handling.
+ * @ubi: the UBI device description object
+ */
+static void calculate_reserved_max(const struct ubi_info *ubi)
+{
+	struct ubi_beb_info *beb = ubi->beb;
+
+	/* Reserve some amount of PEBs for bad PEB handling */
+	beb->reserved_max = ubi->io->good_peb_count/100;
+	beb->reserved_max *= CONFIG_MTD_UBI_BEB_RESERVE;
+	if (beb->reserved_max < MIN_RESEVED_PEBS)
+		beb->reserved_max = MIN_RESEVED_PEBS;
+}
diff --git a/drivers/mtd/ubi/badeb.h b/drivers/mtd/ubi/badeb.h
new file mode 100644
index 0000000..596a0e6
--- /dev/null
+++ b/drivers/mtd/ubi/badeb.h
@@ -0,0 +1,106 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * Bad eraseblock handling unit.
+ *
+ * This unit is responsible for marking physical eraseblocks as bad and for
+ * recovering data from supposedly bad physical eraseblocks.
+ */
+
+#ifndef __UBI_BADEB_H__
+#define __UBI_BADEB_H__
+
+#include <linux/spinlock.h>
+
+/**
+ * ubi_beb_mark_bad - mark a physical eraseblock as bad.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to mark
+ *
+ * This function returns error in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_beb_mark_bad(const struct ubi_info *ubi, int pnum);
+
+/**
+ * ubi_beb_maintain_reserved - maintain a certain level of reserved physical
+ * eraseblock.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function tries to maintain a fixed number of reserved physical
+ * eraseblocks for bad eraseblock handling. This number is configurable.
+ */
+void ubi_beb_maintain_reserved(const struct ubi_info *ubi);
+
+/**
+ * ubi_beb_recover_peb - recover a physical eraseblock after a write failure.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock to recover
+ * @buf: the data which was not be written because of a write failure
+ * @offset: offset of the failed write
+ * @len: how many bytes are should have been written
+ *
+ * This function has to be called in case of a write failure to move all the
+ * good data foam the potentially bad physical eraseblock to a good physical
+ * eraseblock. This function also writes the data which was not written due to
+ * the failure. This function returns the new physical eraseblock number in
+ * case of success, and a negative error code in case of failure.
+ */
+int ubi_beb_recover_peb(const struct ubi_info *ubi, int pnum, int vol_id,
+			int lnum, const void *buf, int offset, int len);
+
+/**
+ * ubi_beb_init - initialize the bad eraseblock handling unit.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_beb_init(struct ubi_info *ubi);
+
+/**
+ * ubi_beb_close - close the bad eraseblock handling unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_beb_close(struct ubi_info *ubi);
+
+/**
+ * struct ubi_beb_info - UBI bad PEB handling unit description data structure.
+ *
+ * @reserved_pebs: how many physical eraseblocks are reserved for bad PEB
+ * handling
+ * @reserved_max: how many PEBs have to be reserved for bad PEB handling, i.e.,
+ * the normal level of reserved PEBs
+ * @lock: protects @reserved_pebs
+ */
+struct ubi_beb_info {
+	int reserved_pebs; /* public  */
+	int reserved_max;  /* public  */
+	spinlock_t lock;   /* private */
+};
+
+#endif /* !__UBI_BADEB_H__ */
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
new file mode 100644
index 0000000..88265ec
--- /dev/null
+++ b/drivers/mtd/ubi/build.c
@@ -0,0 +1,168 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "io.h"
+#include "wl.h"
+#include "volmgmt.h"
+#include "account.h"
+#include "background.h"
+#include "vtbl.h"
+#include "eba.h"
+#include "build.h"
+#include "uif.h"
+#include "scan.h"
+#include "badeb.h"
+#include "misc.h"
+#include "debug.h"
+
+static int attach_by_scanning(struct ubi_info *ubi);
+
+int ubi_bld_attach_mtd_dev(struct ubi_info *ubi, int mtd_num,
+			   int vid_hdr_offset, int data_offset)
+{
+	int err;
+	const struct ubi_io_info *io;
+	const struct ubi_acc_info *acc;
+
+	ubi_msg("attaching mtd%d to ubi%d", mtd_num, ubi->ubi_num);
+
+	err = ubi_io_init(ubi, mtd_num, vid_hdr_offset, data_offset);
+	if (err)
+		return err;
+
+	err = ubi_bgt_init(ubi);
+	if (err)
+		goto out_io;
+
+	err = attach_by_scanning(ubi);
+	if (err)
+		goto out_bgt;
+
+	err = ubi_beb_init(ubi);
+	if (err)
+		goto out_detach;
+
+	err = ubi_uif_init(ubi);
+	if (err)
+		goto out_beb;
+
+	io = ubi->io;
+	acc = ubi->acc;
+
+	ubi_msg("MTD device name:            \"%s\"", io->mtd_name);
+	ubi_msg("MTD device size:            %llu MB", io->flash_size >> 20);
+	ubi_msg("physical eraseblock size:   %d bytes (%d KB)",
+		io->peb_size, io->peb_size >> 10);
+	ubi_msg("logical eraseblock size:    %d bytes", io->leb_size);
+	ubi_msg("number of good PEBs:        %d", io->good_peb_count);
+	ubi_msg("number of bad PEBs:         %d", io->bad_peb_count);
+	ubi_msg("smallest flash I/O unit:    %d", io->min_io_size);
+	ubi_msg("VID header offset:          %d (aligned %d)",
+		io->vid_hdr_offset, io->vid_hdr_aloffset);
+	ubi_msg("data offset:                %d", io->leb_start);
+	ubi_msg("max. allowed volumes:       %d", acc->max_volumes);
+	ubi_msg("wear-levelling threshold:   %d", CONFIG_MTD_UBI_WL_THRESHOLD);
+	ubi_msg("number of internal volumes: %d", acc->ivol_count);
+	ubi_msg("number of user volumes:     %d", acc->uvol_count);
+	ubi_msg("available PEBs:             %d", acc->avail_pebs);
+	ubi_msg("total number of reserved PEBs: %d", acc->rsvd_pebs);
+	ubi_msg("number of PEBs reserved for bad PEB handling: %d",
+		ubi->beb->reserved_pebs);
+
+	if (!io->ro_mode)
+		ubi_bgt_enable(ubi);
+	return 0;
+
+out_beb:
+	ubi_beb_close(ubi);
+out_detach:
+	ubi_eba_close(ubi);
+	ubi_wl_close(ubi);
+	ubi_vmt_close(ubi);
+out_bgt:
+	ubi_bgt_kill_thread(ubi);
+	ubi_bgt_close(ubi);
+out_io:
+	ubi_io_close(ubi);
+	return err;
+}
+
+void ubi_bld_detach_mtd_dev(struct ubi_info *ubi)
+{
+	ubi_msg("detaching mtd%d from ubi%d", ubi->io->mtd_num, ubi->ubi_num);
+
+	ubi_bgt_kill_thread(ubi);
+	ubi_uif_close(ubi);
+	ubi_beb_close(ubi);
+	ubi_eba_close(ubi);
+	ubi_wl_close(ubi);
+	ubi_vmt_close(ubi);
+	ubi_bgt_close(ubi);
+	ubi_io_close(ubi);
+}
+
+/**
+ * attach_by_scanning - attach a MTD device using scanning method.
+ *
+ * @ubi - UBI device descriptor
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int attach_by_scanning(struct ubi_info *ubi)
+{
+	int err;
+	struct ubi_scan_info *si;
+
+	dbg_bld("attach mtd device by scanning");
+
+	err = ubi_scan(ubi, &si);
+	if (err)
+		return err;
+
+	err = ubi_vmt_init_scan(ubi, si);
+	if (err)
+		goto out_si;
+
+	err = ubi_wl_init_scan(ubi, si);
+	if (err)
+		goto out_vmt;
+
+	err = ubi_eba_init_scan(ubi, si);
+	if (err)
+		goto out_wl;
+
+	ubi_msg("mean erase counter:         %d", si->mean_ec);
+	ubi_scan_destroy_si(si);
+	return 0;
+
+out_wl:
+	ubi_wl_close(ubi);
+out_vmt:
+	ubi_vmt_close(ubi);
+out_si:
+	ubi_scan_destroy_si(si);
+	return err;
+}
diff --git a/drivers/mtd/ubi/build.h b/drivers/mtd/ubi/build.h
new file mode 100644
index 0000000..0e6eb47
--- /dev/null
+++ b/drivers/mtd/ubi/build.h
@@ -0,0 +1,64 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI build unit.
+ *
+ * This unit is responsible for attaching MTD devices to UBI devices. At the
+ * moment there is only one attachment method exists - full scan. But in future
+ * one may add a superblock-based attachment method and improve UBI
+ * scalability. But anyways, the scanning method will always be useful because
+ * in case of superblock corruptions UBI can always scan the device and
+ * re-build all the core data structures.
+ */
+
+#ifndef __UBI_BUILD_H__
+#define __UBI_BUILD_H__
+
+#include <linux/init.h>
+
+struct ubi_info;
+
+/**
+ * ubi_bld_attach_mtd_dev - attach an MTD device.
+ *
+ * @ubi: the UBI device description object
+ * @mtd_num: MTD device number
+ * @vid_hdr_offset: volume identifier headers offset
+ * @data_offset: data offset
+ *
+ * This function attaches an MTD device number @mtd_num. If @vid_hdr_offset and
+ * @data_offset are NULL, the default layout of UBI headers is assumed. See the
+ * I/O unit.
+ *
+ * This function returns a positive number of the new UBI device in case of
+ * success and a negative error code in case of failure.
+ */
+int ubi_bld_attach_mtd_dev(struct ubi_info *ubi, int mtd_num,
+			   int vid_hdr_offset, int data_offset);
+
+/**
+ * ubi_bld_detach_mtd_dev - detach an MTD device.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_bld_detach_mtd_dev(struct ubi_info *ubi);
+
+#endif /* __UBI_BUILD_H__ */
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
new file mode 100644
index 0000000..aa840f0
--- /dev/null
+++ b/drivers/mtd/ubi/cdev.c
@@ -0,0 +1,1115 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/stat.h>
+#include <linux/ioctl.h>
+#include <linux/cdev.h>
+#include <linux/capability.h>
+#include <linux/types.h>
+#include <linux/mtd/ubi.h>
+#include <mtd/ubi-user.h>
+#include <mtd/ubi-header.h>
+#include <asm/uaccess.h>
+#include <asm/div64.h>
+#include "ubi.h"
+#include "uif.h"
+#include "eba.h"
+#include "cdev.h"
+#include "account.h"
+#include "debug.h"
+#include "alloc.h"
+#include "vtbl.h"
+#include "io.h"
+#include "dtbl.h"
+#include "volmgmt.h"
+
+static int vol_cdev_open(struct inode *inode, struct file *file);
+static int vol_cdev_release(struct inode *inode, struct file *file);
+loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin);
+static ssize_t vol_cdev_read(struct file *file, __user char *buf,
+			     size_t count, loff_t * offp);
+ssize_t vol_cdev_write(struct file *file, const char __user *buf, size_t count,
+		       loff_t *offp);
+static int vol_cdev_ioctl(struct inode *inode, struct file *file,
+			  unsigned int cmd, unsigned long arg);
+
+/*
+ * Volume character device operations.
+ */
+static struct file_operations vol_cdev_operations = {
+	.owner   = THIS_MODULE,
+	.open    = vol_cdev_open,
+	.release = vol_cdev_release,
+	.llseek  = vol_cdev_llseek,
+	.read    = vol_cdev_read,
+	.write   = vol_cdev_write,
+	.ioctl   = vol_cdev_ioctl
+};
+
+int ubi_volume_cdev_init(const struct ubi_info *ubi, struct ubi_uif_volume *vol)
+{
+	int err;
+	const struct ubi_uif_info *uif = ubi->uif;
+
+	cdev_init(&vol->cdev, &vol_cdev_operations);
+	vol->cdev.owner = THIS_MODULE;
+	err = cdev_add(&vol->cdev, MKDEV(uif->major, vol->vol_id + 1), 1);
+	if (err) {
+		ubi_err("cannot add volume %d character device", vol->vol_id);
+		goto out;
+	}
+
+	return 0;
+out:
+	cdev_del(&vol->cdev);
+	return err;
+}
+
+void ubi_volume_cdev_close(struct ubi_uif_volume *vol)
+{
+	cdev_del(&vol->cdev);
+}
+
+static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
+			  unsigned int cmd, unsigned long arg);
+
+/*
+ * UBI character device operations.
+ */
+static struct file_operations ubi_cdev_operations = {
+	.owner = THIS_MODULE,
+	.ioctl = ubi_cdev_ioctl,
+	.llseek = no_llseek
+};
+
+int ubi_cdev_init(struct ubi_info *ubi)
+{
+	int err;
+	dev_t dev;
+	struct ubi_uif_info *uif = ubi->uif;
+	const struct ubi_acc_info *acc = ubi->acc;
+
+	/*
+	 * Major numbers for the UBI character devices are allocated
+	 * dynamically. Major numbers of volume character devices are
+	 * equivalent to ones of the corresponding UBI character device. Minor
+	 * numbers of UBI character devices are 0, while minor numbers of
+	 * volume character devices start from 1. Thus, we allocate one major
+	 * number and acc->max_volumes + 1 minor numbers.
+	 */
+	err = alloc_chrdev_region(&dev, 0, acc->max_volumes + 1, uif->ubi_name);
+	if (err) {
+		ubi_err("cannot register UBI character devices");
+		return err;
+	}
+
+	cdev_init(&uif->cdev, &ubi_cdev_operations);
+	uif->major = MAJOR(dev);
+	uif->cdev.owner = THIS_MODULE;
+
+	dev = MKDEV(uif->major, 0);
+	err = cdev_add(&uif->cdev, dev, 1);
+	if (err) {
+		ubi_err("cannot add character device %s", uif->ubi_name);
+		goto out_unreg;
+	}
+
+	dbg_uif("%s major:minor is %u:0", uif->ubi_name, uif->major);
+	return 0;
+
+out_unreg:
+	unregister_chrdev_region(MKDEV(uif->major, 0), acc->max_volumes + 1);
+	return err;
+
+}
+
+void ubi_cdev_close(const struct ubi_info *ubi)
+{
+	struct ubi_uif_info *uif = ubi->uif;
+	const struct ubi_acc_info *acc = ubi->acc;
+
+	cdev_del(&uif->cdev);
+	unregister_chrdev_region(MKDEV(uif->major, 0), acc->max_volumes + 1);
+}
+
+static struct ubi_info *major2ubi_info(int major);
+
+/**
+ * vol_cdev_open - open method of volume character devices.
+ *
+ * @inode: inode of the volume character device
+ * @file: &struct file object of the volume character device
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int vol_cdev_open(struct inode *inode, struct file *file)
+{
+	struct ubi_vol_desc *desc;
+	const struct ubi_info *ubi = major2ubi_info(imajor(inode));
+	int vol_id = iminor(inode) - 1;
+	int mode;
+
+	if (file->f_mode & FMODE_WRITE)
+		mode = UBI_READWRITE;
+	else
+		mode = UBI_READONLY;
+
+	desc = ubi_open_volume(ubi->ubi_num, vol_id, mode);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	file->private_data = desc;
+	return 0;
+}
+
+/**
+ * vol_cdev_release - release method of volume character devices.
+ *
+ * @inode: inode of the volume character device
+ * @file: &struct file object of the volume character device
+ */
+static int vol_cdev_release(struct inode *inode, struct file *file)
+{
+	struct ubi_vol_desc *desc = file->private_data;
+
+	ubi_close_volume(desc);
+	return 0;
+}
+
+/**
+ * vol_cdev_llseek - llseek method of volume character devices.
+ *
+ * @file: &struct file object of the volume character device
+ * @offset: file offset
+ * @origin: defines the starting point of the @offset
+ *
+ * If an update is in progress, seeking is prohibited. This function returns
+ * positive offset in case of success and a negative error code in case of
+ * failure.
+ */
+loff_t vol_cdev_llseek(struct file * file, loff_t offset, int origin)
+{
+	const struct ubi_dtbl_dtr *dtr;
+	struct ubi_vol_desc *desc = file->private_data;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	struct ubi_uif_volume *vol = desc->vol;
+	loff_t new_offset;
+
+	if (vol->updating) {
+		dbg_uif("updating");
+		return -EBUSY;
+	}
+
+	dtr = ubi_dtbl_get_dtr(ubi, vol->vol_id);
+
+	switch (origin) {
+	case 0: /* SEEK_SET */
+		new_offset = offset;
+		break;
+	case 1: /* SEEK_CUR */
+		new_offset = file->f_pos + offset;
+		break;
+	case 2: /* SEEK_END */
+		new_offset = dtr->used_bytes + offset;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (new_offset < 0 || new_offset > dtr->used_bytes) {
+		dbg_uif("bad seek (%lld)", new_offset);
+		return -EINVAL;
+	}
+
+	dbg_uif("set volume %d offset at %lld", vol->vol_id, new_offset);
+	file->f_pos = new_offset;
+	return new_offset;
+}
+
+/**
+ * vol_cdev_read - read method of volume character devices
+ *
+ * @file: &struct file object of volume character device
+ * @buf: user-space buffer where to put read data
+ * @count: how many bytes to read
+ * @offp: the read position
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static ssize_t vol_cdev_read(struct file *file, __user char *buf,
+			     size_t count, loff_t * offp)
+{
+	int err;
+	const struct ubi_dtbl_dtr *dtr;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vol_desc *desc = file->private_data;
+	struct ubi_uif_volume *vol = desc->vol;
+	const struct ubi_info *ubi = vol->ubi;
+	const struct ubi_io_info *io = ubi->io;
+	int lnum, off, len, vol_id = desc->vol->vol_id;
+	size_t tbuf_size, count_save = count;
+	void *tbuf;
+	uint64_t tmp;
+
+	dbg_uif("request: read %zd bytes from offset %lld of volume %u",
+		count, *offp, desc->vol->vol_id);
+
+	if (vol->updating) {
+		dbg_uif("updating");
+		return -EBUSY;
+	}
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	dtr = ubi_dtbl_get_dtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+	ubi_assert(!IS_ERR(dtr));
+	ubi_assert(*offp >= 0 && *offp <= dtr->used_bytes);
+
+	if (*offp == dtr->used_bytes)
+		return 0;
+
+	if (*offp + count > dtr->used_bytes)
+		count_save = count = dtr->used_bytes - *offp;
+
+	/*
+	 * To optimize reading, we read in fractions of the minimum
+	 * input/output units of the flash.
+	 */
+	tbuf_size = (PAGE_SIZE / io->min_io_size) * io->min_io_size;
+	if (tbuf_size == 0)
+		tbuf_size = io->min_io_size;
+	if (tbuf_size > io->leb_size)
+		tbuf_size = io->leb_size;
+
+	tbuf = ubi_kmalloc(tbuf_size, GFP_KERNEL);
+	if (!tbuf)
+		return -ENOMEM;
+
+	/*
+	 * We read in portions of the minimal flash input/output unit. If we are
+	 * requested to read form a non-aligned offset, we first read up to the
+	 * nearest boundary, and later only read in units of 'tbuf_size'.
+	 */
+	if (count > tbuf_size) {
+		int rem;
+
+		tmp = *offp;
+		rem = do_div(tmp, io->min_io_size);
+		if (rem == 0)
+			len = tbuf_size;
+		else
+			len = io->min_io_size - rem;
+	} else
+		len = count;
+
+	tmp = *offp;
+	off = do_div(tmp, vtr->usable_leb_size);
+	lnum = tmp;
+
+	do {
+		int read;
+
+		cond_resched();
+		//dbg_uif("read %d bytes from LEB %d, offset %d", len, lnum, off);
+
+		if (off + len >= vtr->usable_leb_size)
+			len = vtr->usable_leb_size - off;
+
+		err = ubi_eba_read_leb(ubi, vol_id, lnum, tbuf, off, len, 0,
+				       &read);
+		if (unlikely(err)) {
+			int err1;
+
+			err1 = copy_to_user(buf, tbuf, read);
+			if (unlikely(err1)) {
+				dbg_uif("memory access error");
+				err = err1;
+				break;
+			}
+
+			dbg_uif("%d bytes were read, return error next time",
+				read);
+			count -= read;
+			*offp += read;
+			break;
+		}
+
+		off += len;
+		if (off == vtr->usable_leb_size) {
+			lnum += 1;
+			off -= vtr->usable_leb_size;
+		}
+
+		count -= len;
+		*offp += len;
+
+		err = copy_to_user(buf, tbuf, len);
+		if (unlikely(err)) {
+			dbg_uif("memory access error");
+			break;
+		}
+
+		buf += len;
+		len = count > tbuf_size ? tbuf_size : count;
+	} while (count);
+
+	ubi_kfree(tbuf);
+	return count_save - count;
+}
+
+/**
+ * vol_cdev_write - write method of volume character devices
+ *
+ * @file: &struct file object of volume character device
+ * @buf: user-space buffer with the data to write
+ * @count: how many bytes to write
+ * @offp: the write position
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+ssize_t vol_cdev_write(struct file *file, const char __user *buf, size_t count,
+		       loff_t *offp)
+{
+	int written, err = 0, pad = 0;
+	const struct ubi_dtbl_dtr *dtr;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vol_desc *desc = file->private_data;
+	struct ubi_uif_volume *vol = desc->vol;
+	const struct ubi_info *ubi = vol->ubi;
+	const struct ubi_io_info *io = ubi->io;
+	int lnum, off, len, vol_id = vol->vol_id;
+	size_t tbuf_size, count_save = count;
+	char *tbuf;
+	uint64_t tmp;
+	long long used_bytes;
+
+	dbg_uif("requested: write %zd bytes to offset %lld of volume %u",
+		count, *offp, desc->vol->vol_id);
+
+#ifndef CONFIG_MTD_UBI_USERSPACE_IO
+	if (!vol->updating) {
+		dbg_uif("writes are forbidden");
+		return -EROFS;
+	} else
+#endif
+
+	if (vol->updating)
+		ubi_assert(vol->upd_received == *offp);
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+
+	if (vtr->vol_type == UBI_STATIC_VOLUME && !vol->updating) {
+		dbg_uif("static volume");
+		return -EROFS;
+	}
+
+	tmp = *offp;
+	off = do_div(tmp, vtr->usable_leb_size);
+	lnum = tmp;
+
+	if (off % io->min_io_size) {
+		dbg_uif("unaligned position");
+		return -EIO;
+	}
+
+	dtr = ubi_dtbl_get_dtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(dtr));
+
+	if (vol->updating)
+		used_bytes = vol->upd_bytes;
+	else
+		used_bytes = dtr->used_bytes;
+
+	ubi_assert(!dtr->corrupted);
+	ubi_assert(*offp >= 0 && *offp <= used_bytes);
+
+	if (*offp + count > used_bytes)
+		count_save = count = used_bytes - *offp;
+
+	/*
+	 * We can only write in fractions of the minimum input/output unit of
+	 * the flash.
+	 */
+	if (count % io->min_io_size) {
+		if (vol->updating && *offp + count == vol->upd_bytes) {
+			/*
+			 * These are the final bytes, so the count may be
+			 * unaligned, this is OK. We will have to pad it.
+			 */
+			pad = io->min_io_size - (count % io->min_io_size);
+			dbg_uif("final write, padding %d", pad);
+		} else {
+			dbg_uif("unaligned write length");
+			return -EINVAL;
+		}
+	}
+
+	/*
+	 * If we update static volumes, we accumulate whole eraseblock and
+	 * write it at once.
+	 */
+	if (vtr->vol_type == UBI_STATIC_VOLUME) {
+		tbuf = vol->upd_buf;
+		tbuf_size = vtr->usable_leb_size;
+
+		if (off != 0) {
+			/*
+			 * This is one more write to the middle of the logical
+			 * eraseblock. We copy the data to our update buffer
+			 * and wait for more data or flush it (if the whole
+			 * eraseblock is written to or the update is
+			 * finished).
+			 */
+
+			len = vtr->usable_leb_size - off;
+			if (len > count)
+				len = count;
+
+			dbg_uif("copy more %d bytes of user data", len);
+
+			err = copy_from_user(tbuf + off, buf, len);
+			if (err) {
+				dbg_uif("memory access error");
+				return -EFAULT;
+			}
+
+			if (off + len == vtr->usable_leb_size ||
+			    vol->upd_received + len == vol->upd_bytes) {
+				int flush_len = off + len;
+				/*
+				 * OK, we gathered either the whole eraseblock
+				 * or this is the last eraseblock, it's time to
+				 * flush it.
+				 *
+				 * If this is the final write in this update
+				 * operation, 'len' might be unaligned, we have
+				 * to align it.
+				 */
+				if (vol->upd_received + len == vol->upd_bytes) {
+					dbg_uif("padding %d to %d",
+						flush_len, flush_len + pad);
+					memset(tbuf + flush_len, 0, pad);
+					flush_len += pad;
+				}
+
+				dbg_uif("flush %d bytes to LEB %d:%d",
+					flush_len, vol_id, lnum);
+
+				ubi_assert(flush_len <= tbuf_size);
+				err = ubi_eba_write_leb(ubi, vol_id, lnum, tbuf,
+							0, flush_len,
+							UBI_DATA_UNKNOWN,
+							vol->upd_ebs, &written,
+							NULL);
+				if (err) {
+					*offp += written;
+					count -= written;
+					goto finish;
+				}
+			}
+
+			count -= len;
+			*offp += len;
+			buf += len;
+
+			/*
+			 * If we've got more to write, we'll continue in the
+			 * the below loop.
+			 */
+			lnum += 1;
+			off = 0;
+		}
+	} else {
+		tbuf_size = (PAGE_SIZE / io->min_io_size) * io->min_io_size;
+		if (tbuf_size == 0)
+			tbuf_size = io->min_io_size;
+		if (tbuf_size > io->leb_size)
+			tbuf_size = io->leb_size;
+
+		tbuf = ubi_kmalloc(tbuf_size, GFP_KERNEL);
+		if (!tbuf)
+			return -ENOMEM;
+	}
+
+	len = count > tbuf_size ? tbuf_size : count;
+
+	while (count) {
+		cond_resched();
+
+		if (off + len >= vtr->usable_leb_size)
+			len = vtr->usable_leb_size - off;
+
+		dbg_uif("copy %d bytes of user data", len);
+		err = copy_from_user(tbuf, buf, len);
+		if (err) {
+			dbg_uif("memory access error");
+			err = -EFAULT;
+			break;
+		}
+
+		written = count_save - count;
+		if (vtr->vol_type != UBI_STATIC_VOLUME || len == tbuf_size ||
+		    vol->upd_received + written + len == vol->upd_bytes) {
+			int write_len = len;
+
+			/*
+			 * Write only if this is a dynamic volume, if user
+			 * passed enough data to write a whole eraseblock, or
+			 * if this is the last piece of the update data.
+			 *
+			 * If this is the final write in this update operation,
+			 * 'len' might be unaligned, we have to align it.
+			 */
+			if (vol->upd_received + written + len ==
+			    vol->upd_bytes) {
+				dbg_uif("padding %d to %d",
+					write_len, write_len + pad);
+				memset(tbuf + write_len, 0, pad);
+				write_len += pad;
+			}
+
+			dbg_uif("write %d bytes to LEB %d:%d, offset %d",
+				write_len, vol_id, lnum, off);
+
+			ubi_assert(write_len <= tbuf_size);
+			err = ubi_eba_write_leb(ubi, vol_id, lnum, tbuf, off,
+						write_len, UBI_DATA_UNKNOWN,
+						vol->upd_ebs, &written, NULL);
+			if (unlikely(err)) {
+				count -= written;
+				*offp += written;
+				break;
+			}
+		}
+
+		off += len;
+		if (off == vtr->usable_leb_size) {
+			lnum += 1;
+			off -= vtr->usable_leb_size;
+		}
+
+		count -= len;
+		*offp += len;
+		buf += len;
+		len = count > tbuf_size ? tbuf_size : count;
+	}
+
+	if (vtr->vol_type != UBI_STATIC_VOLUME)
+		ubi_kfree(tbuf);
+
+finish:
+	written = count_save - count;
+
+	if (vol->updating) {
+		vol->upd_received += written;
+		if (vol->upd_received < vol->upd_bytes)
+			return written;
+		err = ubi_uif_finish_update(desc);
+		ubi_assert(!err);
+	}
+
+	return written;
+}
+
+/**
+ * vol_cdev_ioctl - ioctl method of volume character devices.
+ *
+ * @inode: inode of the volume character device
+ * @file: &struct file object of the volume character device
+ * @cmd: ioctl command
+ * @arg: ioctl arguments
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int vol_cdev_ioctl(struct inode *inode, struct file *file,
+			  unsigned int cmd, unsigned long arg)
+{
+	int err = 0;
+	struct ubi_vol_desc *desc = file->private_data;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	void __user *argp = (void __user *)arg;
+
+	if (_IOC_NR(cmd) > VOL_CDEV_IOC_MAX_SEQ ||
+	    _IOC_TYPE(cmd) != UBI_VOL_IOC_MAGIC) {
+		dbg_uif("bad ioctl command");
+		return -ENOTTY;
+	}
+
+	if (_IOC_DIR(cmd) && _IOC_READ)
+		err = !access_ok(VERIFY_WRITE, argp, _IOC_SIZE(cmd));
+	else if (_IOC_DIR(cmd) && _IOC_WRITE)
+		err = !access_ok(VERIFY_READ, argp, _IOC_SIZE(cmd));
+	if (err) {
+		dbg_uif("memory access error");
+		return -EFAULT;
+	}
+
+	switch (cmd) {
+
+	/* Volume update command */
+	case UBI_IOCVOLUP:
+	{
+		int64_t bytes;
+		long long rsvd_bytes;
+		const struct ubi_vtbl_vtr *vtr;
+
+		if (!capable(CAP_SYS_RESOURCE)) {
+			dbg_uif("no rights");
+			err = -EPERM;
+			break;
+		}
+
+		err = copy_from_user(&bytes, argp, sizeof(int64_t));
+		if (err) {
+			dbg_uif("memory access error");
+			err = -EFAULT;
+			break;
+		}
+
+		dbg_uif("update volume %u, %lld bytes",
+			desc->vol->vol_id, bytes);
+
+		if (desc->mode == UBI_READONLY) {
+			dbg_uif("read-only mode");
+			err = -EROFS;
+			break;
+		}
+
+		vtr = ubi_vtbl_get_vtr(ubi, desc->vol->vol_id);
+		rsvd_bytes = vtr->reserved_pebs *
+				(ubi->io->leb_size - vtr->data_pad);
+		if (bytes < 0 || bytes > rsvd_bytes) {
+			dbg_uif("bad data size %lld", bytes);
+			err = -EINVAL;
+			break;
+		}
+
+		err = ubi_uif_start_update(desc, bytes);
+		file->f_pos = 0;
+		break;
+	}
+
+#ifdef CONFIG_MTD_UBI_USERSPACE_IO
+	/* An eraseblock erasure command */
+	case UBI_IOCEBER:
+	{
+		int32_t lnum;
+		const struct ubi_vtbl_vtr *vtr;
+
+		err = __get_user(lnum, (__user int32_t *)argp);
+		if (err) {
+			dbg_uif("memory access error");
+			err = -EFAULT;
+			break;
+		}
+
+		if (desc->mode == UBI_READONLY) {
+			dbg_uif("read-only mode");
+			err = -EROFS;
+			break;
+		}
+
+		vtr = ubi_vtbl_get_vtr(ubi, desc->vol->vol_id);
+		ubi_assert(!IS_ERR(vtr));
+		if (lnum < 0 || lnum >= vtr->reserved_pebs) {
+			dbg_uif("bad lnum %d", lnum);
+			err = -EINVAL;
+			break;
+		}
+
+		if (vtr->vol_type != UBI_DYNAMIC_VOLUME) {
+			dbg_uif("static volume");
+			err = -EROFS;
+			break;
+		}
+
+		dbg_uif("erase LEB %d:%d", desc->vol->vol_id, lnum);
+		err = ubi_eba_erase_leb(ubi, desc->vol->vol_id, lnum);
+		break;
+	}
+#endif
+
+	default:
+		err = -ENOTTY;
+		break;
+	}
+
+	return err;
+}
+
+static int check_mkvol_req(const struct ubi_info *ubi,
+			   const struct ubi_mkvol_req *req);
+
+static int check_rsvol_req(const struct ubi_info *ubi,
+			   const struct ubi_rsvol_req *req);
+
+/**
+ * ubi_cdev_ioctl - ioctl method of UBI character devices.
+ *
+ * @inode: inode of the UBI character device
+ * @file: &struct file object of the UBI character device
+ * @cmd: ioctl command
+ * @arg: ioctl arguments
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
+			  unsigned int cmd, unsigned long arg)
+{
+	int err = 0;
+	const struct ubi_info *ubi;
+	void __user *argp = (void __user *)arg;
+
+	if (_IOC_NR(cmd) > UBI_CDEV_IOC_MAX_SEQ ||
+	    _IOC_TYPE(cmd) != UBI_IOC_MAGIC) {
+		dbg_uif("bad ioctl command");
+		return -ENOTTY;
+	}
+
+	if (_IOC_DIR(cmd) && _IOC_READ)
+		err = !access_ok(VERIFY_WRITE, argp, _IOC_SIZE(cmd));
+	else if (_IOC_DIR(cmd) && _IOC_WRITE)
+		err = !access_ok(VERIFY_READ, argp, _IOC_SIZE(cmd));
+	if (err)
+		return -EFAULT;
+
+	if (!capable(CAP_SYS_RESOURCE)) {
+		dbg_uif("no rights");
+		return -EPERM;
+	}
+
+	ubi = major2ubi_info(imajor(inode));
+	if (IS_ERR(ubi))
+		return PTR_ERR(ubi);
+
+	switch (cmd) {
+
+	/* Create volume command */
+	case UBI_IOCMKVOL:
+	{
+		char *name;
+		struct ubi_vtbl_vtr vtr;
+		struct ubi_mkvol_req req;
+		const struct ubi_io_info *io = ubi->io;
+		int pebs;
+
+		err = __copy_from_user(&req, argp,
+				       sizeof(struct ubi_mkvol_req));
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		/* Make sure that user passed us sane data */
+		pebs = check_mkvol_req(ubi, &req);
+		if (pebs < 0) {
+			err = pebs;
+			break;
+		}
+
+		name = ubi_kmalloc(req.name_len + 1, GFP_KERNEL);
+		if (!name) {
+			err = -ENOMEM;
+			break;
+		}
+
+		err = copy_from_user(name, req.name, req.name_len + 1);
+		if (err) {
+			err = -EFAULT;
+			goto out_free;
+		}
+
+		vtr.reserved_pebs = pebs;
+		vtr.alignment = req.alignment;
+		vtr.vol_type = req.vol_type;
+		vtr.name_len = req.name_len;
+		vtr.name = name;
+		vtr.data_pad = io->leb_size % vtr.alignment;
+
+		dbg_uif("create volume ID %d, size %d, type %d, name %s",
+		     req.vol_id, vtr.reserved_pebs, vtr.vol_type,
+		     vtr.name);
+
+		err = ubi_vmt_mkvol(ubi, req.vol_id, &vtr);
+		if (err < 0)
+			goto out_free;
+
+		req.vol_id = err;
+		err = ubi_uif_mkvol(ubi, req.vol_id);
+		if (err)
+			goto out_rmvol;
+
+		ubi_kfree(name);
+
+		err = __copy_to_user(argp, &req,
+				       sizeof(struct ubi_mkvol_req));
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		break;
+
+out_rmvol:
+		ubi_vmt_rmvol(ubi, req.vol_id);
+out_free:
+		ubi_kfree(name);
+		break;
+	}
+
+	/* Remove volume command */
+	case UBI_IOCRMVOL:
+	{
+		int32_t vol_id;
+		struct ubi_vol_desc *desc;
+
+		err = __get_user(vol_id, (__user int32_t *)argp);
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		dbg_uif("remove volume %u", vol_id);
+
+		desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_EXCLUSIVE);
+		if (IS_ERR(desc)) {
+			err = PTR_ERR(desc);
+			break;
+		}
+
+		err = ubi_uif_close_and_rmvol(desc);
+		if (err) {
+			ubi_close_volume(desc);
+			break;
+		}
+
+		err = ubi_vmt_rmvol(ubi, vol_id);
+		break;
+	}
+
+	/* Re-size volume command */
+	case UBI_IOCRSVOL:
+	{
+		int err, rem, pebs;
+		uint64_t tmp;
+		const struct ubi_vtbl_vtr *vtr;
+		struct ubi_rsvol_req req;
+		struct ubi_vol_desc *desc;
+
+		err = __copy_from_user(&req, argp,
+				       sizeof(struct ubi_rsvol_req));
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		/* Make sure that user passed us sane data */
+		err = check_rsvol_req(ubi, &req);
+		if (err)
+			break;
+
+		dbg_uif("re-size volume %d to size %lld bytes",
+			req.vol_id, req.bytes);
+
+		desc = ubi_open_volume(ubi->ubi_num, req.vol_id, UBI_EXCLUSIVE);
+		if (IS_ERR(desc)) {
+			err = PTR_ERR(desc);
+			break;
+		}
+
+		vtr = ubi_vtbl_get_vtr(ubi, req.vol_id);
+		ubi_assert(!IS_ERR(vtr));
+
+		tmp = req.bytes;
+		rem = do_div(tmp, vtr->usable_leb_size);
+		pebs = tmp;
+		if (rem)
+			pebs += 1;
+
+		err = ubi_uif_rsvol(desc, pebs);
+		if (err) {
+			ubi_close_volume(desc);
+			break;
+		}
+
+		err = ubi_vmt_rsvol(ubi, req.vol_id, pebs);
+		ubi_close_volume(desc);
+		break;
+	}
+
+	default:
+		err = -ENOTTY;
+		break;
+	}
+
+	return err;
+}
+
+/**
+ * major2ubi_info - find the UBI device description by major number of the
+ * corresponding character device.
+ *
+ * @major: major number
+ *
+ * This function returns a pointer to the UBI description object.
+ */
+static struct ubi_info *major2ubi_info(int major)
+{
+	int i;
+
+	for (i = 0; i < ubis_num; i++)
+		if (ubis[i] && ubis[i]->uif->major == major)
+			return ubis[i];
+
+	BUG();
+	return NULL;
+}
+
+/**
+ * check_mkvol_req - check sanity of a volume creation request.
+ *
+ * @ubi: the UBI device description object
+ * @req: the request to check
+ *
+ * This function returns a positive volume size in eraseblocks if the request
+ * is sane, and %-EINVAL if not.
+ */
+static int check_mkvol_req(const struct ubi_info *ubi,
+			   const struct ubi_mkvol_req *req)
+{
+	int n, err, rem, ebs, usable_leb_size;
+	char *name = NULL;
+	const struct ubi_io_info *io = ubi->io;
+	uint64_t bytes;
+
+	name = ubi_kmalloc(req->name_len + 1, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	if (req->bytes < 0 || req->alignment < 0 || req->vol_type < 0 ||
+	    req->name_len < 0) {
+		dbg_uif("negative values");
+		goto bad;
+	}
+
+	if ((req->vol_id < 0 || req->vol_id >= ubi->acc->max_volumes) &&
+	    req->vol_id != UBI_VOL_NUM_AUTO) {
+		dbg_uif("bad vol_id %d", req->vol_id);
+		goto bad;
+	}
+
+	if (req->alignment == 0) {
+		dbg_uif("zero alignment");
+		goto bad;
+	}
+
+	if (req->bytes == 0) {
+		dbg_uif("zero bytes");
+		goto bad;
+	}
+
+	if (req->vol_type != UBI_DYNAMIC_VOLUME &&
+	    req->vol_type != UBI_STATIC_VOLUME) {
+		dbg_uif("bad vol_type");
+		goto bad;
+	}
+
+	if (req->alignment > io->leb_size) {
+		dbg_uif("too large alignment");
+		goto bad;
+	}
+
+	n = req->alignment % io->min_io_size;
+	if (req->alignment != 1 && n) {
+		dbg_uif("alignment is not multiple of min I/O unit size");
+		goto bad;
+	}
+
+	if (req->name_len > UBI_VOL_NAME_MAX) {
+		dbg_uif("too long volume name, max is %d", UBI_VOL_NAME_MAX);
+		goto bad;
+	}
+
+	if (!req->name) {
+		dbg_uif("NULL volume name");
+		goto bad;
+	}
+
+	err = copy_from_user(name, req->name, req->name_len + 1);
+	if (err)
+		return err;
+
+	n = strnlen(name, req->name_len + 1);
+	if (n != req->name_len) {
+		dbg_uif("bad name_len");
+		goto bad;
+	}
+
+	ubi_kfree(name);
+
+	/* Calculate how many eraseblocks are requested */
+	usable_leb_size = io->leb_size - io->leb_size % req->alignment;
+	bytes = req->bytes;
+	rem = do_div(bytes, usable_leb_size);
+	ebs = bytes;
+	if (rem)
+		ebs += 1;
+
+	return ebs;
+
+bad:
+	if (ubi_debugging_uif)
+		ubi_dbg_dump_mkvol_req(req, name);
+	ubi_kfree(name);
+	return -EINVAL;
+}
+
+/**
+ * check_rsvol_req - check sanity of a volume re-size request.
+ *
+ * @ubi: the UBI device description object
+ * @req: the re-size request to check
+ *
+ * This function returns zero if the request is sane, and %-EINVAL if not.
+ */
+static int check_rsvol_req(const struct ubi_info *ubi,
+			   const struct ubi_rsvol_req *req)
+{
+	if (req->bytes <= 0) {
+		dbg_uif("bad bytes %lld", req->bytes);
+		return -EINVAL;
+	}
+
+	if (req->vol_id < 0 || req->vol_id >= ubi->acc->max_volumes) {
+		dbg_uif("bad vol_id %d", req->vol_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/mtd/ubi/cdev.h b/drivers/mtd/ubi/cdev.h
new file mode 100644
index 0000000..7451db0
--- /dev/null
+++ b/drivers/mtd/ubi/cdev.h
@@ -0,0 +1,83 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * This is a part of the user interface unit and includes all the character
+ * device-related stuff.
+ */
+
+#ifndef __UBI_CDEV_H__
+#define __UBI_CDEV_H__
+
+/* Maximum sequence numbers of UBI and volume character device IOCTLs */
+#define UBI_CDEV_IOC_MAX_SEQ 2
+
+#ifndef CONFIG_MTD_UBI_USERSPACE_IO
+#define VOL_CDEV_IOC_MAX_SEQ 1
+#else
+#define VOL_CDEV_IOC_MAX_SEQ 2
+#endif
+
+struct ubi_info;
+struct inode;
+struct file;
+struct ubi_uif_volume;
+
+/**
+ * ubi_volume_cdev_init - initialize all the character device-related stuff for
+ * an UBI volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol: an UIF volume description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_volume_cdev_init(const struct ubi_info *ubi,
+			 struct ubi_uif_volume *vol);
+
+/**
+ * ubi_volume_cdev_close - close all the character device-related stuff for an
+ * UBI volume.
+ *
+ * @vol: an UIF volume description object
+ */
+void ubi_volume_cdev_close(struct ubi_uif_volume *vol);
+
+/**
+ * ubi_cdev_init - initialize all the character device-related stuff for
+ * an UBI device.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_cdev_init(struct ubi_info *ubi);
+
+/**
+ * ubi_cdev_close - close all the character device-related stuff for an UBI
+ * device.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_cdev_close(const struct ubi_info *ubi);
+
+#endif /* !__UBI_CDEV_H__ */
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
new file mode 100644
index 0000000..bde523d
--- /dev/null
+++ b/drivers/mtd/ubi/debug.c
@@ -0,0 +1,276 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI debugging stuff.
+ */
+
+#include <linux/string.h>
+#include <linux/spinlock.h>
+#include <linux/config.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "debug.h"
+#include "vtbl.h"
+#include "dtbl.h"
+#include "scan.h"
+
+#ifdef CONFIG_MTD_UBI_DEBUG_RUNTIME
+/*
+ * The below flags show if the debugging messages from the corresponding unit
+ * are enabled or disabled. They are toggled by users via sysfs. The default
+ * values are set via configuretion options.
+ */
+int ubi_debugging_uif;
+int ubi_debugging_vmt;
+int ubi_debugging_upd;
+int ubi_debugging_vtbl;
+int ubi_debugging_dtbl;
+int ubi_debugging_acc;
+int ubi_debugging_eba;
+int ubi_debugging_wl;
+int ubi_debugging_bgt;
+int ubi_debugging_alloc;
+int ubi_debugging_io;
+int ubi_debugging_bld;
+int ubi_debugging_scan;
+#endif /* CONFIG_MTD_UBI_DEBUG_RUNTIME */
+
+#if defined(CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS) ||       \
+    defined(CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES) || \
+    defined(CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES)
+static spinlock_t random_lock = SPIN_LOCK_UNLOCKED;
+static unsigned long RandomValue = 1;
+
+/* Borrowed from XFS */
+static unsigned long random(void)
+{
+	/* cycles pseudo-randomly through all values between 1 and 2^31 - 2 */
+	register long rv;
+	register long lo;
+	register long hi;
+
+	spin_lock(&random_lock);
+	rv = RandomValue;
+	hi = rv / 127773;
+	lo = rv % 127773;
+	rv = 16807 * lo - 2836 * hi;
+	if (rv <= 0) rv += 2147483647;
+	RandomValue = rv;
+	spin_unlock(&random_lock);
+	return rv;
+}
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS
+int ubi_dbg_is_bitflip(void)
+{
+	return !(random() % 50);
+
+}
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES
+int ubi_dbg_is_write_failure(void)
+{
+	return !(random() % 100);
+}
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
+int ubi_dbg_is_erase_failure(void)
+{
+	return !(random() % 100);
+}
+#endif
+
+void ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr)
+{
+	ubi_msg("erase counter header dump:")
+	ubi_msg("magic          %#08x", ubi32_to_cpu(ec_hdr->magic));
+	ubi_msg("version        %d",    (int)ec_hdr->version);
+	ubi_msg("ec             %llu",  ubi64_to_cpu(ec_hdr->ec));
+	ubi_msg("vid_hdr_offset %d",    ubi32_to_cpu(ec_hdr->vid_hdr_offset));
+	ubi_msg("data_offset    %d",    ubi32_to_cpu(ec_hdr->data_offset));
+	ubi_msg("hdr_crc        %#08x", ubi32_to_cpu(ec_hdr->hdr_crc));
+	ubi_msg("erase counter header hexdump:")
+	ubi_dbg_hexdump(ec_hdr, UBI_EC_HDR_SIZE);
+}
+
+void ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
+{
+	ubi_msg("volume identifier header dump:");
+	ubi_msg("magic     %08x", ubi32_to_cpu(vid_hdr->magic));
+	ubi_msg("version   %d",   (int)vid_hdr->version);
+	ubi_msg("vol_type  %d",   (int)vid_hdr->vol_type);
+	ubi_msg("copy_flag %d",   (int)vid_hdr->copy_flag);
+	ubi_msg("compat    %d",   (int)vid_hdr->compat);
+	ubi_msg("vol_id    %d",   ubi32_to_cpu(vid_hdr->vol_id));
+	ubi_msg("lnum      %d",   ubi32_to_cpu(vid_hdr->lnum));
+	ubi_msg("leb_ver   %u",   ubi32_to_cpu(vid_hdr->leb_ver));
+	ubi_msg("data_size %d",   ubi32_to_cpu(vid_hdr->data_size));
+	ubi_msg("used_ebs  %d",   ubi32_to_cpu(vid_hdr->used_ebs));
+	ubi_msg("data_pad  %d",   ubi32_to_cpu(vid_hdr->data_pad));
+	ubi_msg("hdr_crc   %08x", ubi32_to_cpu(vid_hdr->hdr_crc));
+	ubi_msg("volume identifier header hexdump:");
+	ubi_dbg_hexdump(vid_hdr, UBI_VID_HDR_SIZE_CRC);
+}
+
+void ubi_dbg_dump_vtr(const struct ubi_vtbl_vtr *vtr)
+{
+	ubi_msg("volume table record dump:");
+	ubi_msg("reserved_pebs   %d", vtr->reserved_pebs);
+	ubi_msg("alignment       %d", vtr->alignment);
+	ubi_msg("data_pad        %d", vtr->data_pad);
+	ubi_msg("vol_type        %d", vtr->vol_type);
+	ubi_msg("name_len        %d", vtr->name_len);
+	ubi_msg("usable_leb_size %d", vtr->usable_leb_size);
+
+	if (vtr->name == NULL) {
+		ubi_msg("name          NULL");
+		return;
+	}
+
+	if (vtr->name_len <= UBI_VOL_NAME_MAX &&
+	    strnlen(vtr->name, vtr->name_len + 1) == vtr->name_len) {
+		ubi_msg("name          %s", vtr->name);
+	} else {
+		ubi_msg("the 1st 5 characters of the name: %c%c%c%c%c",
+			vtr->name[0], vtr->name[1], vtr->name[2],
+			vtr->name[3], vtr->name[4]);
+	}
+}
+
+void ubi_dbg_dump_dtr(const struct ubi_dtbl_dtr *dtr)
+{
+	ubi_msg("data table record dump:");
+	ubi_msg("used_ebs      %d", dtr->used_ebs);
+	ubi_msg("used_bytes    %lld", dtr->used_bytes);
+	ubi_msg("last_eb_bytes %d", dtr->last_eb_bytes);
+	ubi_msg("corrupted     %d", dtr->corrupted);
+}
+
+void ubi_dbg_dump_raw_vtr(const struct ubi_vol_tbl_record *r)
+{
+	int name_len = ubi16_to_cpu(r->name_len);
+
+	ubi_msg("raw volume table record dump:");
+	ubi_msg("reserved_pebs   %d", ubi32_to_cpu(r->reserved_pebs));
+	ubi_msg("alignment       %d", ubi32_to_cpu(r->alignment));
+	ubi_msg("data_pad        %d", ubi32_to_cpu(r->data_pad));
+	ubi_msg("vol_type        %d", (int)r->vol_type);
+	ubi_msg("name_len        %d", name_len);
+
+	if (r->name[0] == '\0') {
+		ubi_msg("name          NULL");
+		return;
+	}
+
+	if (name_len <= UBI_VOL_NAME_MAX &&
+	    strnlen(&r->name[0], name_len + 1) == name_len) {
+		ubi_msg("name          %s", &r->name[0]);
+	} else {
+		ubi_msg("the 1st 5 characters of the name: %c%c%c%c%c",
+			r->name[0], r->name[1], r->name[2], r->name[3],
+			r->name[4]);
+	}
+}
+
+void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv)
+{
+	ubi_msg("volume scanning information dump:");
+	ubi_msg("vol_id         %d", sv->vol_id);
+	ubi_msg("highest_lnum   %d", sv->highest_lnum);
+	ubi_msg("leb_count      %d", sv->leb_count);
+	ubi_msg("compat         %d", sv->compat);
+	ubi_msg("vol_type       %d", sv->vol_type);
+	ubi_msg("used_ebs       %d", sv->used_ebs);
+	ubi_msg("last_data_size %d", sv->last_data_size);
+	ubi_msg("data_pad       %d", sv->data_pad);
+}
+
+void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type)
+{
+	ubi_msg("eraseblock scanning information dump:");
+	ubi_msg("ec       %d", seb->ec);
+	ubi_msg("pnum     %d", seb->pnum);
+	switch (type) {
+		case 0:
+			ubi_msg("lnum     %d", seb->lnum);
+			ubi_msg("leb_ver  %u", seb->leb_ver);
+			break;
+		case 1:
+			break;
+	}
+}
+
+void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req, const char *name)
+{
+	ubi_msg("volume creation request dump:");
+	ubi_msg("vol_id    %d",   req->vol_id);
+	ubi_msg("alignment %d",   req->alignment);
+	ubi_msg("bytes     %lld", req->bytes);
+	ubi_msg("vol_type  %d",   req->vol_type);
+	ubi_msg("name_len  %d",   req->name_len);
+
+	if (name == NULL) {
+		ubi_msg("name      NULL");
+		return;
+	}
+
+	if (req->name_len <= UBI_VOL_NAME_MAX &&
+	    strnlen(name, req->name_len + 1) == req->name_len) {
+		ubi_msg("name      %s", name);
+	} else {
+		ubi_msg("the 1st 5 characters of the name: %c%c%c%c%c",
+			name[0], name[1], name[2], name[3], name[4]);
+	}
+}
+
+#define BYTES_PER_LINE 32
+void ubi_dbg_hexdump(const void *ptr, int size)
+{
+	int i, k = 0;
+	int rows, columns;
+	const uint8_t *p = ptr;
+
+	size = ALIGN(size, 4);
+	rows = size/BYTES_PER_LINE + size % BYTES_PER_LINE;
+	for (i = 0; i < rows; i++) {
+		int j;
+
+		columns = min(size - k, BYTES_PER_LINE) / 4;
+		if (columns == 0)
+			break;
+
+		printk(UBI_DBG_LEVEL "%5d:  ", i*BYTES_PER_LINE);
+
+		for (j = 0; j < columns; j++) {
+			int n, N;
+
+			N = size - k > 4 ? 4 : size - k;
+			for (n = 0; n < N; n++)
+				printk("%02x", p[k++]);
+			printk(" ");
+		}
+		printk("\n");
+	}
+}
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
new file mode 100644
index 0000000..49b9736
--- /dev/null
+++ b/drivers/mtd/ubi/debug.h
@@ -0,0 +1,389 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * There are two debugging modes - compile-time and run-time. The fomer means
+ * that users configure debugging before compiling UBI, the latter means that
+ * users may configure it dynamically via sysfs.
+ */
+
+#ifndef __UBI_DEBUG_H__
+#define __UBI_DEBUG_H__
+
+#include <linux/config.h>
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/kallsyms.h>
+#include <linux/spinlock.h>
+
+/* A lock that serializes UBI output */
+extern spinlock_t __ubi_output_lock;
+
+#ifdef CONFIG_MTD_UBI_DEBUG_ASSERTS
+#define ubi_assert(expr) BUG_ON(!(expr));
+#else
+#define ubi_assert(expr) do {} while(0)
+#endif
+
+/* Prefixes of debugging messages */
+#define UBI_DBG_LEVEL      KERN_CRIT
+#define UBI_DBG_UIF_PREF   UBI_DBG_LEVEL "[UBI DBG uif]"
+#define UBI_DBG_VMT_PREF   UBI_DBG_LEVEL "[UBI DBG vmt]"
+#define UBI_DBG_UPD_PREF   UBI_DBG_LEVEL "[UBI DBG upd]"
+#define UBI_DBG_VTBL_PREF  UBI_DBG_LEVEL "[UBI DBG vtbl]"
+#define UBI_DBG_DTBL_PREF  UBI_DBG_LEVEL "[UBI DBG dtbl]"
+#define UBI_DBG_ACC_PREF   UBI_DBG_LEVEL "[UBI DBG acc]"
+#define UBI_DBG_EBA_PREF   UBI_DBG_LEVEL "[UBI DBG eba]"
+#define UBI_DBG_WL_PREF    UBI_DBG_LEVEL "[UBI DBG wl]"
+#define UBI_DBG_BGT_PREF   UBI_DBG_LEVEL "[UBI DBG bgt]"
+#define UBI_DBG_ALLOC_PREF UBI_DBG_LEVEL "[UBI DBG alloc]"
+#define UBI_DBG_IO_PREF    UBI_DBG_LEVEL "[UBI DBG io]"
+#define UBI_DBG_BLD_PREF   UBI_DBG_LEVEL "[UBI DBG bld]"
+#define UBI_DBG_SCAN_PREF  UBI_DBG_LEVEL "[UBI DBG scan]"
+
+#ifdef CONFIG_MTD_UBI_DEBUG_RUNTIME
+/* Run-time debugging */
+extern int ubi_debugging_uif;
+extern int ubi_debugging_vmt;
+extern int ubi_debugging_upd;
+extern int ubi_debugging_vtbl;
+extern int ubi_debugging_dtbl;
+extern int ubi_debugging_acc;
+extern int ubi_debugging_eba;
+extern int ubi_debugging_wl;
+extern int ubi_debugging_bgt;
+extern int ubi_debugging_alloc;
+extern int ubi_debugging_io;
+extern int ubi_debugging_bld;
+extern int ubi_debugging_scan;
+
+#else
+
+/* Compile-time debugging */
+
+#ifdef CONFIG_MTD_UBI_DEBUG_UIF
+#define ubi_debugging_uif 1
+#else
+#define ubi_debugging_uif 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_VMT
+#define ubi_debugging_vmt 1
+#else
+#define ubi_debugging_vmt 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_UPD
+#define ubi_debugging_upd 1
+#else
+#define ubi_debugging_upd 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_VTBL
+#define ubi_debugging_vtbl 1
+#else
+#define ubi_debugging_vtbl 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_DTBL
+#define ubi_debugging_dtbl 1
+#else
+#define ubi_debugging_dtbl 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_ACC
+#define ubi_debugging_acc 1
+#else
+#define ubi_debugging_acc 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EBA
+#define ubi_debugging_eba 1
+#else
+#define ubi_debugging_eba 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_WL
+#define ubi_debugging_wl 1
+#else
+#define ubi_debugging_wl 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_BGT
+#define ubi_debugging_bgt 1
+#else
+#define ubi_debugging_bgt 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_ALLOC
+#define ubi_debugging_alloc 1
+#else
+#define ubi_debugging_alloc 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_IO
+#define ubi_debugging_io 1
+#else
+#define ubi_debugging_io 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_BLD
+#define ubi_debugging_bld 1
+#else
+#define ubi_debugging_bld 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_SCAN
+#define ubi_debugging_scan 1
+#else
+#define ubi_debugging_scan 0
+#endif
+
+#endif /* !CONFIG_MTD_UBI_DEBUG_RUNTIME */
+
+/* Debugging messages from different subsystems */
+
+/* User interface unit */
+#define dbg_uif(fmt, ...) do {                                      \
+	if (ubi_debugging_uif) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_UIF_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Volume management unit */
+#define dbg_vmt(fmt, ...) do {                                      \
+	if (ubi_debugging_vmt) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_VMT_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Update unit */
+#define dbg_upd(fmt, ...) do {                                      \
+	if (ubi_debugging_upd) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_UPD_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Volume table unit */
+#define dbg_vtbl(fmt, ...) do {                                     \
+	if (ubi_debugging_vtbl) {                                   \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_VTBL_PREF " (pid:%d) %s: " fmt "\n", \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* UBI data table unit */
+#define dbg_dtbl(fmt, ...) do {                                     \
+	if (ubi_debugging_dtbl) {                                   \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_DTBL_PREF " (pid:%d) %s: " fmt "\n", \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Accounting unit */
+#define dbg_acc(fmt, ...) do {                                      \
+	if (ubi_debugging_acc) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_ACC_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Eraseblock association unit */
+#define dbg_eba(fmt, ...) do {                                      \
+	if (ubi_debugging_eba) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_EBA_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Wear-levelling unit */
+#define dbg_wl(fmt, ...) do {                                       \
+	if (ubi_debugging_wl) {                                     \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_WL_PREF " (pid:%d) %s: " fmt "\n",   \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Background thread unit */
+#define dbg_bgt(fmt, ...) do {                                      \
+	if (ubi_debugging_bgt) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_BGT_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Memory allocation unit */
+#define dbg_alloc(fmt, ...) do {                                               \
+	if (ubi_debugging_alloc) {                                             \
+		spin_lock(&__ubi_output_lock);                                 \
+		printk(UBI_DBG_ALLOC_PREF " (caller:");                        \
+		print_symbol("%s",(unsigned long)__builtin_return_address(0)); \
+		printk(") (pid:%d) %s: " fmt "\n",                             \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);             \
+		spin_unlock(&__ubi_output_lock);                               \
+	}                                                                      \
+} while (0)
+
+/* Input/output unit */
+#define dbg_io(fmt, ...) do {                                       \
+	if (ubi_debugging_io) {                                     \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_IO_PREF " (pid:%d) %s: " fmt "\n",   \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Build unit */
+#define dbg_bld(fmt, ...) do {                                      \
+	if (ubi_debugging_bld) {                                    \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_BLD_PREF " (pid:%d) %s: " fmt "\n",  \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+/* Scanning unit */
+#define dbg_scan(fmt, ...) do {                                     \
+	if (ubi_debugging_scan) {                                   \
+		spin_lock(&__ubi_output_lock);                      \
+		printk(UBI_DBG_SCAN_PREF " (pid:%d) %s: " fmt "\n", \
+		       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+		spin_unlock(&__ubi_output_lock);                    \
+	}                                                           \
+} while (0)
+
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS
+int ubi_dbg_is_bitflip(void);
+#else
+#define ubi_dbg_is_bitflip() 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES
+int ubi_dbg_is_write_failure(void);
+#else
+#define ubi_dbg_is_write_failure() 0
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
+int ubi_dbg_is_erase_failure(void);
+#else
+#define ubi_dbg_is_erase_failure() 0
+#endif
+
+struct ubi_info;
+struct ubi_ec_hdr;
+struct ubi_vid_hdr;
+struct ubi_vtbl_vtr;
+struct ubi_dtbl_dtr;
+struct ubi_vol_tbl_record;
+struct ubi_scan_volume;
+struct ubi_scan_leb;
+
+/**
+ * ubi_dbg_dump_ec_hdr - dump an erase counter header.
+ *
+ * @ec_hdr: the erase counter header to dump
+ */
+void ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
+
+/**
+ * ubi_dbg_dump_vid_hdr - dump a volume identifier header.
+ *
+ * @vid_hdr: the volume identifier header to dump
+ */
+void ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
+
+/**
+ * ubi_dbg_dump_vtr - dump a &struct ubi_vtbl_vtr object.
+ *
+ * @vtr: the object to dump
+ */
+void ubi_dbg_dump_vtr(const struct ubi_vtbl_vtr *vtr);
+
+/**
+ * ubi_dbg_dump_dtr - dump a &struct ubi_vtbl_dtr object.
+ *
+ * @dtr: the object to dump
+ */
+void ubi_dbg_dump_dtr(const struct ubi_dtbl_dtr *dtr);
+
+/**
+ * ubi_dbg_dump_raw_vtr - dump a &struct ubi_vol_tbl_record object.
+ *
+ * @r: the object to dump
+ */
+void ubi_dbg_dump_raw_vtr(const struct ubi_vol_tbl_record *r);
+
+/**
+ * ubi_dbg_dump_sv - dump a &struct ubi_scan_volume object.
+ *
+ * @sv: the object to dump
+ */
+void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
+
+/**
+ * ubi_dbg_dump_seb - dump a &struct ubi_scan_leb object.
+ *
+ * @seb: the object to dump
+ * @type: object type: 0 - not corrupted, 1 - corrupted
+ */
+void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
+
+/**
+ * ubi_dbg_dump_mkvol_req - dump a &struct ubi_mkvol_req object.
+ *
+ * @req: the object to dump
+ * @name: volume name in kernel's memory
+ */
+void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req, const char *name);
+
+/**
+ * ubi_dbg_hexdump - dump a buffer.
+ *
+ * @ptr: the buffer to dump
+ * @size: buffer size which must be multiple of 4 bytes
+ */
+void ubi_dbg_hexdump(const void *buf, int size);
+
+#endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/dtbl.c b/drivers/mtd/ubi/dtbl.c
new file mode 100644
index 0000000..0dc445b
--- /dev/null
+++ b/drivers/mtd/ubi/dtbl.c
@@ -0,0 +1,286 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/sched.h>
+#include <linux/err.h>
+#include "ubi.h"
+#include "dtbl.h"
+#include "alloc.h"
+#include "scan.h"
+#include "vtbl.h"
+#include "io.h"
+#include "ivol.h"
+#include "account.h"
+#include "debug.h"
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_DTBL
+static int paranoid_check_dtr(const struct ubi_info *ubi, int vol_id);
+#else
+#define paranoid_check_dtr(ubi, vol_id) 0
+#endif
+
+const struct ubi_dtbl_dtr *ubi_dtbl_get_dtr(const struct ubi_info *ubi,
+					    int vol_id)
+{
+	int err;
+	const struct ubi_dtbl_info *dtbl = ubi->dtbl;
+
+	if (ubi_is_ivol(vol_id))
+		return ubi_ivol_get_dtr(ubi, vol_id);
+
+	ubi_assert(vol_id >= 0 && vol_id < dtbl->dt_slots);
+	ubi_assert(!IS_ERR(ubi_vtbl_get_vtr(ubi, vol_id)));
+	err = paranoid_check_dtr(ubi, vol_id);
+	return &dtbl->dt[vol_id];
+}
+
+void ubi_dtbl_set_corrupted(const struct ubi_info *ubi, int vol_id)
+{
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_dtbl_info *dtbl = ubi->dtbl;
+
+	dbg_dtbl("mark volume %d as corrupted", vol_id);
+	ubi_assert(vol_id >= 0 && vol_id < dtbl->dt_slots);
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+
+	if (vtr->vol_type == UBI_STATIC_VOLUME)
+		dtbl->dt[vol_id].corrupted = 1;
+}
+
+void ubi_dtbl_set_dtr(const struct ubi_info *ubi, int vol_id, long long bytes)
+{
+	int err;
+	uint64_t tmp;
+	struct ubi_dtbl_dtr *dtr;
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_dtbl_info *dtbl = ubi->dtbl;
+
+	ubi_assert(vol_id >= 0 && vol_id < dtbl->dt_slots);
+	ubi_assert(bytes >= 0);
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+
+	ubi_assert(!IS_ERR(vtr));
+	ubi_assert(bytes <= vtr->reserved_pebs * vtr->usable_leb_size);
+
+	dtr = &dtbl->dt[vol_id];
+
+	if (vtr->vol_type == UBI_DYNAMIC_VOLUME) {
+		dtr->last_eb_bytes = vtr->usable_leb_size;
+		dtr->used_ebs = vtr->reserved_pebs;
+		dtr->used_bytes = dtr->used_ebs * vtr->usable_leb_size;
+		dtr->corrupted = 0;
+		dbg_dtbl("set DTR for volume %d: last_eb_bytes %d, "
+			 "used_ebs %d, used_bytes %lld", vol_id,
+			 dtr->last_eb_bytes, dtr->used_ebs, dtr->used_bytes);
+		err = paranoid_check_dtr(ubi, vol_id);
+		return;
+	}
+
+	tmp = bytes;
+	dtr->last_eb_bytes = do_div(tmp, vtr->usable_leb_size);
+	dtr->used_ebs = tmp;
+	if (dtr->last_eb_bytes)
+		dtr->used_ebs += 1;
+	dtr->used_bytes = bytes;
+	dtr->corrupted = 0;
+	dbg_dtbl("set DTR for volume %d: last_eb_bytes %d, used_ebs %d, "
+		 "used_bytes %lld", vol_id, dtr->last_eb_bytes, dtr->used_ebs,
+		 dtr->used_bytes);
+	err = paranoid_check_dtr(ubi, vol_id);
+}
+
+static void init_dtbl(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+int ubi_dtbl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err;
+	struct ubi_dtbl_info *dtbl;
+
+	dbg_dtbl("initialize the data table unit");
+
+	dtbl = ubi_kzalloc(sizeof(struct ubi_dtbl_info), GFP_KERNEL);
+	if (!dtbl)
+		return -ENOMEM;
+	ubi->dtbl = dtbl;
+
+	dtbl->dt_slots = ubi->vtbl->vt_slots;
+	dtbl->dt = ubi_kzalloc(sizeof(struct ubi_dtbl_dtr) * dtbl->dt_slots,
+			       GFP_KERNEL);
+	if (!dtbl->dt) {
+		err = -ENOMEM;
+		goto out_dtbl;
+	}
+
+	init_dtbl(ubi, si);
+	dbg_dtbl("the data table unit is initialized");
+	return 0;
+
+out_dtbl:
+	ubi_kfree(ubi->dtbl);
+	return err;
+}
+
+void ubi_dtbl_close(const struct ubi_info *ubi)
+{
+	dbg_dtbl("close the data table unit");
+	ubi_kfree(ubi->dtbl->dt);
+	ubi_kfree(ubi->dtbl);
+}
+
+/**
+ * init_dtbl - initialize the data table using scanning information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ */
+static void init_dtbl(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int i, err;
+
+	for (i = 0; i < ubi->acc->max_volumes; i++) {
+		const struct ubi_vtbl_vtr *vtr;
+		struct ubi_scan_volume *sv;
+		struct ubi_dtbl_dtr *dtr = &ubi->dtbl->dt[i];
+
+		cond_resched();
+
+		vtr = ubi_vtbl_get_vtr(ubi, i);
+		if (IS_ERR(vtr))
+			continue;
+
+		if (vtr->vol_type == UBI_DYNAMIC_VOLUME) {
+			dtr->used_ebs = vtr->reserved_pebs;
+			dtr->last_eb_bytes = vtr->usable_leb_size;
+			dtr->used_bytes = dtr->used_ebs * vtr->usable_leb_size;
+			dtr->corrupted = 0;
+			continue;
+		}
+
+		sv = ubi_scan_get_scan_volume(si, i);
+		if (!sv)
+			/*
+			 * We don't actually know whether this volume is
+			 * completely corrupted or just contains no data. And
+			 * we cannot know this as long as the data table is not
+			 * maintained on flash. So we assume the latter.
+			 */
+			continue;
+
+		if (unlikely(sv->leb_count != sv->used_ebs)) {
+			ubi_warn("static volume %d misses %d LEBs",
+				 sv->vol_id, sv->used_ebs - sv->leb_count);
+			dtr->corrupted = 1;
+			continue;
+		}
+
+		dtr->used_ebs = sv->used_ebs;
+		dtr->used_bytes = (dtr->used_ebs - 1) * vtr->usable_leb_size;
+		dtr->used_bytes += sv->last_data_size;
+		dtr->last_eb_bytes = sv->last_data_size;
+
+		err = paranoid_check_dtr(ubi, i);
+	}
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_DTBL
+
+/**
+ * paranoid_check_dtr - check that the data table record of a volume is sane.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to check
+ *
+ * This function returns %0 if the data table record is sane and %1 if it is
+ * not.
+ */
+static int paranoid_check_dtr(const struct ubi_info *ubi, int vol_id)
+{
+	long long n;
+	struct ubi_dtbl_dtr *dtr;
+	const struct ubi_vtbl_vtr *vtr;
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	if (IS_ERR(vtr))
+		return 0;
+
+	dtr = &ubi->dtbl->dt[vol_id];
+	n = dtr->used_ebs * vtr->usable_leb_size;
+
+	if (vtr->vol_type == UBI_DYNAMIC_VOLUME) {
+		if (unlikely(dtr->used_ebs != vtr->reserved_pebs)) {
+			ubi_err("bad used_ebs");
+			goto bad_dtr;
+		}
+
+		if (unlikely(dtr->last_eb_bytes != vtr->usable_leb_size)) {
+			ubi_err("bad last_eb_bytes");
+			goto bad_dtr;
+		}
+
+		if (unlikely(dtr->used_bytes != n)) {
+			ubi_err("bad used_bytes");
+			goto bad_dtr;
+		}
+
+		if (unlikely(dtr->corrupted)) {
+			ubi_err("corrupted dynamic volume");
+			goto bad_dtr;
+		}
+
+		return 0;
+	}
+
+	if (unlikely(dtr->corrupted != 0 && dtr->corrupted != 1)) {
+		ubi_err("bad corrupted");
+		goto bad_dtr;
+	}
+
+	if (unlikely(dtr->used_ebs < 0 ||
+		     dtr->used_ebs > vtr->reserved_pebs)) {
+		ubi_err("bad used_ebs");
+		goto bad_dtr;
+	}
+
+	if (unlikely(dtr->last_eb_bytes < 0 ||
+		     dtr->last_eb_bytes > vtr->usable_leb_size)) {
+		ubi_err("bad last_eb_bytes");
+		goto bad_dtr;
+	}
+
+	if (unlikely(dtr->used_bytes < 0 || dtr->used_bytes > n ||
+		     dtr->used_bytes < n - vtr->usable_leb_size)) {
+		ubi_err("bad used_bytes");
+		goto bad_dtr;
+	}
+
+	return 0;
+
+bad_dtr:
+	ubi_msg("bad data table record %d", vol_id);
+	ubi_dbg_dump_dtr(dtr);
+	ubi_dbg_dump_vtr(vtr);
+	dump_stack();
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_DTBL */
diff --git a/drivers/mtd/ubi/dtbl.h b/drivers/mtd/ubi/dtbl.h
new file mode 100644
index 0000000..3b4970d
--- /dev/null
+++ b/drivers/mtd/ubi/dtbl.h
@@ -0,0 +1,137 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * The data table unit.
+ *
+ * This unit is responsible for maintaining the data table. The data table
+ * describes data stored in volumes. UBI only cares about the contents of
+ * static volumes, and mostly does not care about the contents of dynamic
+ * volumes. Indeed, UBI protects static volumes, so this is a relation wit
+ * hit's data. UBI has to know how many data are stored in static volumes,
+ * whether the data are all right tor corrupted, etc.
+ *
+ * In this implementation the data table is maintained only in RAM and there is
+ * no on-flash data table. The data table is initialized using the scanning
+ * information.
+ *
+ * There is an advantage of keeping data table on flash. Suppose we have a
+ * volume X, and all its physical eraseblocks have gone bad. Suppose we are
+ * attaching the corresponding MTD device, the scanning unit finds no logical
+ * eraseblocks of the volume X. According to the volume table volume X does
+ * exist. So we don't know whether it is just empty or all its physical
+ * eraseblocks went bad.
+ *
+ * In future, one may add an on-flash data table support.
+ */
+
+#ifndef __UBI_DTBL_H__
+#define __UBI_DTBL_H__
+
+struct ubi_info;
+struct ubi_scan_info;
+
+/**
+ * ubi_dtbl_get_dtr - retrieve the data table record of a volume
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume
+ *
+ * This function returns the requested data table record. The requested volume
+ * must exist.
+ */
+const struct ubi_dtbl_dtr *ubi_dtbl_get_dtr(const struct ubi_info *ubi,
+					    int vol_id);
+
+/**
+ * ubi_dtbl_set_corrupted - mark a volume as corrupted.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume
+ *
+ * This function must only be used with existing user volumes. The requested
+ * volume must exist and must not be an internal volume. As dynamic volumes
+ * cannot be in corrupted state, this function does nothing in case of a
+ * dynamic volume.
+ */
+void ubi_dtbl_set_corrupted(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_dtbl_set_dtr - set data table record of a volume
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume
+ * @bytes: how many bytes of data this volume contains
+ *
+ * The requested volume must exist and must not be an internal volume.
+ */
+void ubi_dtbl_set_dtr(const struct ubi_info *ubi, int vol_id, long long bytes);
+
+/**
+ * ubi_dtbl_init_scan - initialize the UBI data table unit using scanning
+ * information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_dtbl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_dtbl_close - close the UBI data table unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_dtbl_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_dtbl_dtr - a data table record.
+ *
+ * @used_ebs: how many eraseblock the data occupies
+ * @last_eb_bytes: how many bytes are stored in the last eraseblock
+ * @used_bytes: how many bytes of data this volume contains
+ * @corrupted: non-zero if the data is corrupted
+ *
+ * This data structure mostly matters only for static volumes. For dynamic
+ * volumes, @used_ebs is always equivalent to the number of reserved
+ * eraseblocks, @used_bytes is always equivalent to the total size of the
+ * reserved space.
+ */
+struct ubi_dtbl_dtr {
+	int used_ebs;
+	int last_eb_bytes;
+	long long used_bytes;
+	int corrupted;
+};
+
+/**
+ * struct ubi_dtbl_info - UBI data table unit description data structure.
+ *
+ * @dt_slots: how many data table records are stored in the data table
+ * @dt: the data table
+ */
+struct ubi_dtbl_info {
+	int dt_slots;            /* public  */
+	struct ubi_dtbl_dtr *dt; /* private */
+};
+
+#endif /* __UBI_DTBL_H__ */
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
new file mode 100644
index 0000000..09f9a37
--- /dev/null
+++ b/drivers/mtd/ubi/eba.c
@@ -0,0 +1,1080 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/rbtree.h>
+#include <linux/sched.h>
+#include <linux/crc32.h>
+#include <linux/spinlock.h>
+#include <linux/rwsem.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "eba.h"
+#include "badeb.h"
+#include "io.h"
+#include "wl.h"
+#include "volmgmt.h"
+#include "vtbl.h"
+#include "ivol.h"
+#include "account.h"
+#include "background.h"
+#include "scan.h"
+#include "misc.h"
+#include "debug.h"
+
+/*
+ * The highest bit in logical-to-physical eraseblock mappings is used to
+ * indicate that the logical eraseblock is not mapped.
+ */
+#define NOT_MAPPED 0x80000000
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_EBA
+static int paranoid_check_leb(const struct ubi_info *ubi, int pnum, int vol_id,
+			      int lnum, int leb_ver,
+			      const struct ubi_vid_hdr *vid_hdr);
+static int paranoid_check_leb_locked(const struct ubi_info *ubi, int vol_id,
+				     int lnum);
+#else
+#define paranoid_check_leb(ubi, vol_id, pnum, lnum, leb_ver, vid_hdr) 0
+#define paranoid_check_leb_locked(ubi, vol_id, lnum)
+#endif
+
+/**
+ * vol_id2idx - turn a volume ID to the EBA table index.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ */
+static inline int vol_id2idx(const struct ubi_info *ubi, int vol_id)
+{
+	const struct ubi_acc_info *acc = ubi->acc;
+
+	if (vol_id >= UBI_INTERNAL_VOL_START)
+		return vol_id - UBI_INTERNAL_VOL_START + acc->max_volumes;
+	else
+		return vol_id;
+}
+
+/**
+ * idx2vol_id - turn an EBA table index to the volume ID.
+ *
+ * @ubi: the UBI device description object
+ * @idx: the EBA table index
+ */
+static inline int idx2vol_id(const struct ubi_info *ubi, int idx)
+{
+	const struct ubi_acc_info *acc = ubi->acc;
+
+	if (idx >= acc->max_volumes)
+		return idx - acc->max_volumes + UBI_INTERNAL_VOL_START;
+	else
+		return idx;
+}
+
+/**
+ * leb_get_ver - get logical eraseblock version.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number
+ *
+ * The logical eraseblock has to be locked.
+ */
+static inline int leb_get_ver(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	int idx, leb_ver;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba->eba_tbl[idx].recs);
+	leb_ver = eba->eba_tbl[idx].recs[lnum].leb_ver;
+	spin_unlock(&eba->eba_tbl_lock);
+	return leb_ver;
+}
+
+/**
+ * leb_map - map a logical eraseblock to a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number
+ * @pnum: the physical eraseblock
+ *
+ * The logical eraseblock has to be locked.
+ */
+static inline void leb_map(const struct ubi_info *ubi, int vol_id, int lnum,
+			   int pnum)
+{
+	int idx;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba->eba_tbl[idx].recs);
+	ubi_assert(eba->eba_tbl[idx].recs[lnum].pnum < 0);
+	eba->eba_tbl[idx].recs[lnum].pnum = pnum;
+	spin_unlock(&eba->eba_tbl_lock);
+}
+
+/**
+ * leb_unmap - unmap a logical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number to unmap
+ *
+ * This function unmaps a logical eraseblock and increases its version. The
+ * logical eraseblock has to be locked.
+ */
+static inline void leb_unmap(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	int idx;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba->eba_tbl[idx].recs);
+	ubi_assert(eba->eba_tbl[idx].recs[lnum].pnum >= 0);
+
+	eba->eba_tbl[idx].recs[lnum].pnum |= NOT_MAPPED;
+	eba->eba_tbl[idx].recs[lnum].leb_ver += 1;
+	spin_unlock(&eba->eba_tbl_lock);
+}
+
+/**
+ * leb2peb - get physical eraseblock number the logical eraseblock is mapped
+ * to.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number
+ *
+ * If the logical eraseblock is mapped, this function returns a positive
+ * physical eraseblock number. If it is not mapped, this function returns
+ * a negative number.
+ */
+static inline int leb2peb(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	int idx, pnum;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba->eba_tbl[idx].recs);
+	pnum = eba->eba_tbl[idx].recs[lnum].pnum;
+	spin_unlock(&eba->eba_tbl_lock);
+
+	return pnum;
+}
+
+int ubi_eba_mkvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs)
+{
+	int i, idx, sz;
+	struct ubi_eba_tbl_rec *new_ebs;
+	struct ubi_eba_info *eba = ubi->eba;
+	struct ubi_eba_tbl_volume *eba_tbl = eba->eba_tbl;
+
+	dbg_eba("create volume %d, size %d", vol_id, reserved_pebs);
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(reserved_pebs > 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+	ubi_assert(vol_id < ubi->acc->max_volumes);
+
+	if (ubi->io->ro_mode) {
+		dbg_eba("read-only mode");
+		return -EROFS;
+	}
+
+	sz = reserved_pebs * sizeof(struct ubi_eba_tbl_rec);
+	new_ebs = ubi_kmalloc(sz, GFP_KERNEL);
+	if (!new_ebs)
+		return -ENOMEM;
+
+	for (i = 0; i < reserved_pebs; i++) {
+		new_ebs[i].pnum = NOT_MAPPED;
+		new_ebs[i].leb_ver = 0xFFFFFFF0;
+	}
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(!eba_tbl[idx].recs);
+	eba_tbl[idx].recs = new_ebs;
+	eba_tbl[idx].leb_count = reserved_pebs;
+	spin_unlock(&eba->eba_tbl_lock);
+
+	return 0;
+}
+
+int ubi_eba_rmvol(const struct ubi_info *ubi, int vol_id)
+{
+	int idx;
+	struct ubi_eba_tbl_rec *rm_ebs;
+	struct ubi_eba_info *eba = ubi->eba;
+	struct ubi_eba_tbl_volume *eba_tbl = eba->eba_tbl;
+
+	dbg_eba("remove volume %d", vol_id);;
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+	ubi_assert(vol_id < ubi->acc->max_volumes);
+
+	if (ubi->io->ro_mode) {
+		dbg_eba("read-only mode");
+		return -EROFS;
+	}
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba_tbl[idx].recs);
+	rm_ebs = eba_tbl[idx].recs;
+	eba_tbl[idx].recs = NULL;
+	eba_tbl[idx].leb_count = 0;
+	spin_unlock(&eba->eba_tbl_lock);
+
+	ubi_kfree(rm_ebs);
+	return 0;
+}
+
+int ubi_eba_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs)
+{
+	int err = 0, i, idx, min, to_put, sz;
+	struct ubi_eba_tbl_rec *new_ebs, *old_ebs;
+	struct ubi_eba_info *eba = ubi->eba;
+	struct ubi_eba_tbl_volume *eba_tbl = eba->eba_tbl;
+
+	dbg_eba("re-size volume %d to %d PEBs", vol_id, reserved_pebs);
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+	ubi_assert(vol_id < ubi->acc->max_volumes);
+	ubi_assert(reserved_pebs > 0);
+
+	if (ubi->io->ro_mode) {
+		dbg_eba("read-only mode");
+		return -EROFS;
+	}
+
+	sz = reserved_pebs * sizeof(struct ubi_eba_tbl_rec);
+	new_ebs = ubi_kmalloc(sz, GFP_KERNEL);
+	if (!new_ebs)
+		return -ENOMEM;
+
+	for (i = 0; i < reserved_pebs; i++) {
+		new_ebs[i].pnum = NOT_MAPPED;
+		new_ebs[i].leb_ver = 0;
+	}
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba_tbl[idx].recs);
+
+	if (reserved_pebs < eba_tbl[idx].leb_count) {
+		min = reserved_pebs;
+		to_put = eba_tbl[idx].leb_count - reserved_pebs;
+	} else {
+		min = eba_tbl[idx].leb_count;
+		to_put = 0;
+	}
+
+	for (i = 0; i < min; i++) {
+		new_ebs[i].pnum = eba_tbl[idx].recs[i].pnum;
+		new_ebs[i].leb_ver = eba_tbl[idx].recs[i].leb_ver;
+	}
+	old_ebs = eba_tbl[idx].recs;
+	eba_tbl[idx].recs = new_ebs;
+	eba_tbl[idx].leb_count = reserved_pebs;
+	spin_unlock(&eba->eba_tbl_lock);
+
+	for (i = 0; i < to_put; i++)
+		if (old_ebs[i].pnum >= 0) {
+			err = ubi_wl_put_peb(ubi, old_ebs[i].pnum, 0);
+			if (err)
+				break;
+		}
+
+	ubi_kfree(old_ebs);
+	return err;
+}
+
+int ubi_eba_erase_leb(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	int err, pnum;
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(vol_id < ubi->acc->max_volumes || ubi_is_ivol(vol_id));
+	ubi_assert(lnum >= 0);
+	ubi_assert(ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].recs);
+	ubi_assert(lnum < ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
+
+	if (unlikely(ubi->io->ro_mode)) {
+		dbg_eba("read-only mode");
+		return -EROFS;
+	}
+
+	err = ubi_eba_leb_write_lock(ubi, vol_id, lnum);
+	if (unlikely(err))
+		return err;
+
+	pnum = leb2peb(ubi, vol_id, lnum);
+	if (pnum < 0) {
+		/* This logical eraseblock is already unmapped */
+		dbg_eba("erase LEB %d:%d (unmapped)", vol_id, lnum);
+		goto out_unlock;
+	}
+	dbg_eba("erase LEB %d:%d, PEB %d", vol_id, lnum, pnum);
+
+	leb_unmap(ubi, vol_id, lnum);
+
+	err = ubi_wl_put_peb(ubi, pnum, 0);
+
+out_unlock:
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	return err;
+}
+
+int ubi_eba_read_leb(const struct ubi_info *ubi, int vol_id, int lnum,
+		     void *buf, int offset, int len, int check, int *read)
+{
+	int err, pnum, scrub = 0;
+	const struct ubi_vtbl_vtr *vtr;
+	uint32_t data_crc;
+	struct ubi_vid_hdr *vid_hdr;
+
+	*read = 0;
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(vol_id < ubi->acc->max_volumes || ubi_is_ivol(vol_id));
+	ubi_assert(lnum >= 0);
+	ubi_assert(offset >= 0);
+	ubi_assert(len > 0);
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+	ubi_assert(offset + len <= ubi->io->leb_size - vtr->data_pad);
+	ubi_assert(lnum < ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
+
+	err = ubi_eba_leb_read_lock(ubi, vol_id, lnum);
+	if (unlikely(err))
+		return err;
+
+	pnum = leb2peb(ubi, vol_id, lnum);
+
+	if (pnum < 0) {
+		/*
+		 * The logical eraseblock is not mapped, fill the whole buffer
+		 * by 0xFF bytes. The exception is static volumes for which it
+		 * is an error to read unmapped logical eraseblocks.
+		 */
+		dbg_eba("read %d bytes from offset %d of LEB %d:%d (unmapped)",
+		len, offset, vol_id, lnum);
+		ubi_eba_leb_read_unlock(ubi, vol_id, lnum);
+		ubi_assert(vtr->vol_type != UBI_STATIC_VOLUME);
+		memset(buf, 0xFF, len);
+		*read = len;
+		return 0;
+	}
+	dbg_eba("read %d bytes from offset %d of LEB %d:%d, PEB %d",
+		len, offset, vol_id, lnum, pnum);
+
+	if (vtr->vol_type == UBI_DYNAMIC_VOLUME)
+		/* In case of dynamic volumes no checking is needed */
+		check = 0;
+
+	if (check) {
+		vid_hdr = ubi_alloc_vid_hdr(ubi);
+		if (unlikely(!vid_hdr)) {
+			err = -ENOMEM;
+			goto out_unlock;
+		}
+
+		err = ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
+		if (unlikely(err) && err != UBI_IO_BITFLIPS) {
+			if (err > 0) {
+				/*
+				 * The header is either absent or corrupted.
+				 * The former case means there is a bug -
+				 * switch to read-only mode just in case.
+				 * The latter case means a real corruption - we
+				 * may try to recover data. FIXME: but this is
+				 * not implemented.
+				 */
+				if (err == UBI_IO_BAD_VID_HDR) {
+					ubi_err("bad VID header at PEB %d, LEB %d:%d",
+						pnum, vol_id, lnum);
+					err = -EBADMSG;
+				} else {
+					ubi_eba_ro_mode(ubi);
+				}
+			}
+			goto out_free;
+		}
+
+		if (unlikely(err == UBI_IO_BITFLIPS))
+			scrub = 1;
+
+		err = paranoid_check_leb(ubi, vol_id, pnum, lnum,
+					 leb_get_ver(ubi, vol_id, lnum),
+					 vid_hdr);
+		if (unlikely(err)) {
+			if (err > 0)
+				err = -EINVAL;
+			goto out_free;
+		}
+
+		ubi_assert(lnum < ubi32_to_cpu(vid_hdr->used_ebs));
+		ubi_assert(len == ubi32_to_cpu(vid_hdr->data_size));
+
+		data_crc = ubi32_to_cpu(vid_hdr->data_crc);
+		ubi_free_vid_hdr(ubi, vid_hdr);
+	}
+
+	err = ubi_io_read_data(ubi, buf, pnum, offset, len, read);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS && len != *read)
+		goto out_unlock;
+	if (unlikely(err == UBI_IO_BITFLIPS))
+		scrub = 1;
+
+	if (check) {
+		uint32_t crc;
+
+		crc = crc32(UBI_CRC32_INIT, buf, len);
+		if (unlikely(crc != data_crc)) {
+			ubi_warn("CRC error: calculated %#08x, must be %#08x",
+				 crc, data_crc);
+			err = -EBADMSG;
+			goto out_unlock;
+		}
+
+		err = 0;
+		dbg_eba("data is OK, CRC matches");
+	}
+
+	if (unlikely(scrub))
+		err = ubi_wl_scrub_peb(ubi, pnum);
+
+	ubi_eba_leb_read_unlock(ubi, vol_id, lnum);
+	return err;
+
+out_free:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+out_unlock:
+	ubi_eba_leb_read_unlock(ubi, vol_id, lnum);
+	return err;
+}
+
+int ubi_eba_write_leb(const struct ubi_info *ubi, int vol_id, int lnum,
+		      const void *buf, int offset, int len,
+		      enum ubi_data_type dtype, int used_ebs, int *written,
+		      const void *ivol_data)
+{
+	int err, pnum, tries = 0;
+	uint32_t leb_ver;
+	struct ubi_vid_hdr *vid_hdr;
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_io_info *io = ubi->io;
+
+retry:
+	*written = 0;
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(vol_id < ubi->acc->max_volumes || ubi_is_ivol(vol_id));
+	ubi_assert(lnum >= 0);
+	ubi_assert(offset >= 0);
+	ubi_assert(len >= 0);
+	ubi_assert(dtype == UBI_DATA_LONGTERM || dtype == UBI_DATA_SHORTTERM ||
+		   dtype == UBI_DATA_UNKNOWN);
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+	ubi_assert(offset + len <= io->leb_size - vtr->data_pad);
+	ubi_assert(lnum < ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
+	ubi_assert(offset % io->min_io_size == 0);
+	ubi_assert(len % io->min_io_size == 0);
+	if (vtr->vol_type == UBI_STATIC_VOLUME) {
+		ubi_assert(offset == 0);
+		ubi_assert(used_ebs >= 0);
+		ubi_assert(lnum < used_ebs);
+		if (lnum < used_ebs - 1) {
+			ubi_assert(len == io->leb_size - vtr->data_pad);
+		}
+	}
+
+	if (unlikely(ubi->io->ro_mode)) {
+		dbg_eba("read-only mode");
+		return -EROFS;
+	}
+
+	err = ubi_eba_leb_write_lock(ubi, vol_id, lnum);
+	if (unlikely(err))
+		return err;
+
+	pnum = leb2peb(ubi, vol_id, lnum);
+	leb_ver = leb_get_ver(ubi, vol_id, lnum);
+	if (pnum >= 0) {
+		ubi_assert(vtr->vol_type != UBI_STATIC_VOLUME);
+
+		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
+			len, offset, vol_id, lnum, pnum);
+
+		if (len != 0) {
+			err = ubi_io_write_data(ubi, buf, pnum, offset, len,
+						written);
+			if (unlikely(err))
+				goto data_write_error;
+		}
+		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+		return err;
+	}
+
+	/*
+	 * The logical eraseblock is not mapped. We have to get a free physical
+	 * eraseblock and write the volume identifier header there first.
+	 */
+	vid_hdr = ubi_alloc_vid_hdr(ubi);
+	if (unlikely(!vid_hdr)) {
+		err = -ENOMEM;
+		goto out_unlock;
+	}
+
+	vid_hdr->leb_ver = cpu_to_ubi32(leb_ver);
+	vid_hdr->vol_id = cpu_to_ubi32(vol_id);
+	vid_hdr->lnum = cpu_to_ubi32(lnum);
+	vid_hdr->compat = ubi_ivol_get_compat(ubi, vol_id);
+	vid_hdr->data_pad = cpu_to_ubi32(vtr->data_pad);
+	if (ivol_data) {
+		ubi_assert(ubi_is_ivol(vol_id));
+		memcpy(&vid_hdr->ivol_data[0], ivol_data,
+		       UBI_VID_HDR_IVOL_DATA_SIZE);
+	}
+
+	if (vtr->vol_type == UBI_DYNAMIC_VOLUME) {
+		vid_hdr->vol_type = UBI_VID_DYNAMIC;
+	} else {
+		uint32_t crc;
+
+		crc = crc32(UBI_CRC32_INIT, buf, len);
+		vid_hdr->vol_type = UBI_VID_STATIC;
+		vid_hdr->data_size = cpu_to_ubi32(len);
+		vid_hdr->used_ebs = cpu_to_ubi32(used_ebs);
+		vid_hdr->data_crc = cpu_to_ubi32(crc);
+	}
+
+	pnum = ubi_wl_get_peb(ubi, dtype);
+	if (unlikely(pnum < 0)) {
+		err = pnum;
+		goto out_vid_hdr;
+	}
+	dbg_eba("write VID hdr and %d bytes at offset %d of LEB %d:%d, PEB %d",
+		len, offset, vol_id, lnum, pnum);
+
+	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
+	if (unlikely(err))
+		goto hdr_write_error;
+
+	leb_map(ubi, vol_id, lnum, pnum);
+
+	if (len == 0)
+		*written = 0;
+	else {
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len, written);
+		if (unlikely(err))
+			goto data_write_error_free;
+	}
+
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	return 0;
+
+out_vid_hdr:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+out_unlock:
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	return err;
+
+	/* Failed to write the volume identifier header */
+hdr_write_error:
+	ubi_warn("failed to write VID header to PEB %d", pnum);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	if (err != -EIO || !io->bad_allowed)
+		goto no_bad_eraseblocks;
+
+	/*
+	 * Fortunately, we did not write any data there yet, so just put this
+	 * physical eraseblock and request a new one. We assume that if this
+	 * physical eraseblock went bad, the erase code will handle that.
+	 */
+	ubi_msg("try to recover form the error");
+	err = ubi_wl_put_peb(ubi, pnum, 1);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	if (err || ++tries > 5)
+		return err;
+	goto retry;
+
+	/* Failed to write data */
+data_write_error_free:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+data_write_error:
+	ubi_warn("failed to write data to PEB %d", pnum);
+	if (err != -EIO || !io->bad_allowed)
+		goto no_bad_eraseblocks;
+
+	err = ubi_beb_recover_peb(ubi, pnum, vol_id, lnum, buf, offset, len);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	return err;
+
+	/*
+	 * This flash device does not admit of bad eraseblocks or something
+	 * nasty and unexpected happened. Switch to read-only mode just in
+	 * case.
+	 */
+no_bad_eraseblocks:
+	ubi_eba_ro_mode(ubi);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	return err;
+}
+
+void ubi_eba_ro_mode(const struct ubi_info *ubi)
+{
+	ubi_bgt_disable(ubi);
+	ubi->io->ro_mode = 1;
+	ubi_msg("switched to read-only mode");
+}
+
+/**
+ * ltree_lookup - look up the lock tree.
+ *
+ * @eba: the EBA unit description data structure
+ * @vol_id: volume ID of the logical eraseblock to look up
+ * @lnum: the logical eraseblock number to look up
+ *
+ * This function returns a pointer to the corresponding &struct ubi_eba_info
+ * object if the logical eraseblock is locked and %NULL if it is not locked.
+ *
+ * The @eba->ltree_lock has to be locked.
+ *
+ * This is a helper function for the logical eraseblock locking/unlocking
+ * functions.
+ */
+static inline struct ubi_eba_ltree_entry *
+ltree_lookup(struct ubi_eba_info *eba, int vol_id, int lnum)
+{
+	struct rb_node *p;
+
+	p = eba->ltree.rb_node;
+	while (p) {
+		struct ubi_eba_ltree_entry *le;
+
+		le = rb_entry(p, struct ubi_eba_ltree_entry, rb);
+
+		if (vol_id < le->vol_id)
+			p = p->rb_left;
+		else if (vol_id > le->vol_id)
+			p = p->rb_right;
+		else {
+			if (lnum < le->lnum)
+				p = p->rb_left;
+			else if (lnum > le->lnum)
+				p = p->rb_right;
+			else
+				return le;
+		}
+	}
+
+	return NULL;
+}
+
+static struct ubi_eba_ltree_entry *ltree_add_entry(const struct ubi_info *ubi,
+						   int vol_id, int lnum);
+
+int ubi_eba_leb_read_lock(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	struct ubi_eba_ltree_entry *le;
+
+	le = ltree_add_entry(ubi, vol_id, lnum);
+	if (unlikely(IS_ERR(le)))
+		return PTR_ERR(le);
+	down_read(&le->mutex);
+	return 0;
+}
+
+int ubi_eba_leb_write_lock(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	struct ubi_eba_ltree_entry *le;
+
+	le = ltree_add_entry(ubi, vol_id, lnum);
+	if (unlikely(IS_ERR(le)))
+		return PTR_ERR(le);
+	down_write(&le->mutex);
+	return 0;
+}
+
+void ubi_eba_leb_read_unlock(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	int free = 0;
+	struct ubi_eba_ltree_entry *le;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	spin_lock(&eba->ltree_lock);
+	le = ltree_lookup(ubi->eba, vol_id, lnum);
+	le->users -= 1;
+	ubi_assert(le->users >= 0);
+	if (le->users == 0) {
+		rb_erase(&le->rb, &eba->ltree);
+		free = 1;
+	}
+	spin_unlock(&eba->ltree_lock);
+
+	up_read(&le->mutex);
+	if (free)
+		ubi_free_eba_ltree_entry(le);
+}
+
+void ubi_eba_leb_write_unlock(const struct ubi_info *ubi, int vol_id, int lnum)
+{
+	int free;
+	struct ubi_eba_ltree_entry *le;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	spin_lock(&eba->ltree_lock);
+	le = ltree_lookup(ubi->eba, vol_id, lnum);
+	le->users -= 1;
+	ubi_assert(le->users >= 0);
+	if (le->users == 0) {
+		rb_erase(&le->rb, &eba->ltree);
+		free = 1;
+	} else
+		free = 0;
+	spin_unlock(&eba->ltree_lock);
+
+	up_write(&le->mutex);
+	if (free)
+		ubi_free_eba_ltree_entry(le);
+}
+
+void ubi_eba_leb_remap(const struct ubi_info *ubi, int vol_id, int lnum,
+		       int pnum)
+{
+	/* The logical eraseblock is supposed to be locked */
+	paranoid_check_leb_locked(ubi, vol_id, lnum);
+	leb_unmap(ubi, vol_id, lnum);
+	leb_map(ubi, vol_id, lnum, pnum);
+}
+
+static int build_eba_tbl(const struct ubi_info *ubi,
+			 const struct ubi_scan_info *si);
+
+int ubi_eba_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err;
+	size_t sz;
+	struct ubi_eba_info *eba;
+	struct ubi_acc_info *acc = ubi->acc;
+
+	dbg_eba("initialize the EBA unit");
+
+	eba = ubi_kzalloc(sizeof(struct ubi_eba_info), GFP_KERNEL);
+	if (!eba)
+		return -ENOMEM;
+	ubi->eba = eba;
+
+	spin_lock_init(&eba->eba_tbl_lock);
+	spin_lock_init(&eba->ltree_lock);
+	eba->ltree = RB_ROOT;
+
+	eba->num_volumes = acc->max_volumes + acc->ivol_count;
+	sz = eba->num_volumes * sizeof(struct ubi_eba_tbl_volume);
+	eba->eba_tbl = ubi_kzalloc(sz, GFP_KERNEL);
+	if (!eba->eba_tbl) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	err = build_eba_tbl(ubi, si);
+	if (err)
+		goto out;
+
+	dbg_eba("the EBA unit is initialized");
+	return 0;
+
+out:
+	ubi_kfree(eba->eba_tbl);
+	ubi_kfree(eba);
+	return err;
+}
+
+void ubi_eba_close(const struct ubi_info *ubi)
+{
+	unsigned int i;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	dbg_eba("close EBA management unit");
+
+
+	for (i = 0; i < eba->num_volumes; i++)
+		ubi_kfree(eba->eba_tbl[i].recs);
+	ubi_kfree(eba->eba_tbl);
+	ubi_kfree(eba);
+}
+
+/**
+ * build_eba_tbl - build the eraseblock association table.
+ *
+ * @ubi: the UBI device description object
+ * @si: scanning info
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int build_eba_tbl(const struct ubi_info *ubi,
+			 const struct ubi_scan_info *si)
+{
+	int i, err, idx;
+	struct ubi_eba_info *eba = ubi->eba;
+	struct ubi_eba_tbl_volume *eba_tbl = eba->eba_tbl;
+
+	for (idx = 0; idx < eba->num_volumes; idx++) {
+		struct rb_node *rb;
+		struct ubi_scan_leb *seb;
+		struct ubi_scan_volume *sv;
+		const struct ubi_vtbl_vtr *vtr;
+		size_t sz;
+
+		cond_resched();
+
+		vtr = ubi_vtbl_get_vtr(ubi, idx2vol_id(ubi, idx));
+		if (IS_ERR(vtr))
+			continue;
+
+		dbg_eba("found volume %d (idx %d)", idx2vol_id(ubi, idx), idx);
+
+		eba_tbl[idx].leb_count = vtr->reserved_pebs;
+
+		sz = vtr->reserved_pebs * sizeof(struct ubi_eba_tbl_rec);
+		eba_tbl[idx].recs = ubi_kmalloc(sz, GFP_KERNEL);
+		if (unlikely(!eba_tbl[idx].recs)) {
+			err = -ENOMEM;
+			goto out;
+		}
+
+		for (i = 0; i < vtr->reserved_pebs; i++) {
+			eba->eba_tbl[idx].recs[i].pnum = NOT_MAPPED;
+			eba->eba_tbl[idx].recs[i].leb_ver = 0;
+		}
+
+		sv = ubi_scan_get_scan_volume(si, idx2vol_id(ubi, idx));
+		if (!sv)
+			continue;
+
+		rb_for_each_entry(rb, seb, &sv->root, rb) {
+			eba->eba_tbl[idx].recs[seb->lnum].pnum = seb->pnum;
+			eba->eba_tbl[idx].recs[seb->lnum].leb_ver = seb->leb_ver;
+		}
+	}
+
+	return 0;
+
+out:
+	for (i = 0; i < eba->num_volumes; i++)
+		ubi_kfree(eba->eba_tbl[i].recs);
+
+	return err;
+}
+
+/**
+ * ltree_add_entry - add new entry to the lock tree.
+ *
+ * @eba: the EBA unit description data structure
+ * @vol_id: volume ID of the logical eraseblock
+ * @lnum: the logical eraseblock number
+ *
+ * This function add new lock tree entry for logical eraseblock
+ * (@vol_id,@lnum). If the corresponding entry is already there, its usage
+ * counter is increased. This function returns a pointer to the lock tree
+ * entry.
+ */
+static struct ubi_eba_ltree_entry *ltree_add_entry(const struct ubi_info *ubi,
+						   int vol_id, int lnum)
+{
+	struct ubi_eba_info *eba = ubi->eba;
+	struct ubi_eba_ltree_entry *le, *le1, *le_free;
+
+	le = ubi_alloc_eba_ltree_entry();
+	if (unlikely(!le))
+		return ERR_PTR(-ENOMEM);
+
+	le->vol_id = vol_id;
+	le->lnum = lnum;
+
+	spin_lock(&eba->ltree_lock);
+	le1 = ltree_lookup(eba, vol_id, lnum);
+
+	if (le1) {
+		/*
+		 * This logical eraseblock is already locked. The newly
+		 * allocated lock entry is not needed.
+		 */
+		le_free = le;
+		le = le1;
+	} else {
+		struct rb_node **p, *parent = NULL;
+
+		/*
+		 * No lock entry, add the newly allocated one to the
+		 * @eba->ltree RB-tree.
+		 */
+		le_free = NULL;
+
+		p = &eba->ltree.rb_node;
+		while (*p) {
+			parent = *p;
+			le1 = rb_entry(parent, struct ubi_eba_ltree_entry, rb);
+
+			if (vol_id < le1->vol_id)
+				p = &(*p)->rb_left;
+			else if (vol_id > le1->vol_id)
+				p = &(*p)->rb_right;
+			else {
+				ubi_assert(lnum != le1->lnum);
+				if (lnum < le1->lnum)
+					p = &(*p)->rb_left;
+				else
+					p = &(*p)->rb_right;
+			}
+		}
+
+		rb_link_node(&le->rb, parent, p);
+		rb_insert_color(&le->rb, &eba->ltree);
+	}
+	le->users += 1;
+	spin_unlock(&eba->ltree_lock);
+
+	if (le_free)
+		ubi_free_eba_ltree_entry(le_free);
+
+	return le;
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_EBA
+
+/**
+ * paranoid_check_leb - check that a logical eraseblock has correct erase
+ * counter and volume identifier headers.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number
+ * @vol_id: the volume ID to check
+ * @lnum: the logical eraseblock number to check
+ * @leb_ver: the logical eraseblock version to check
+ *
+ * This function returns zero if the headers are all right, %1 if not, and a
+ * negative error code in case of error.
+ */
+static int paranoid_check_leb(const struct ubi_info *ubi, int pnum, int vol_id,
+			      int lnum, int leb_ver,
+			      const struct ubi_vid_hdr *vid_hdr)
+{
+	int err, hdr_vol_id, hdr_lnum, hdr_leb_ver;
+	struct ubi_ec_hdr *ec_hdr;
+
+	/* Check the EC header */
+	ec_hdr = ubi_alloc_ec_hdr(ubi);
+	if (unlikely(!ec_hdr))
+		return -ENOMEM;
+
+	err = ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 1);
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS) {
+		if (err < 0)
+			return err;
+		goto fail;
+	}
+
+	hdr_vol_id = ubi32_to_cpu(vid_hdr->vol_id);
+	hdr_lnum = ubi32_to_cpu(vid_hdr->lnum);
+	hdr_leb_ver = ubi32_to_cpu(vid_hdr->leb_ver);
+
+	if (unlikely(vol_id != hdr_vol_id)) {
+		ubi_err("bad vol_id %d, should be %d", hdr_vol_id, vol_id);
+		goto fail;
+	}
+
+	if (unlikely(lnum != hdr_lnum)) {
+		ubi_err("bad lnum %d, should be %d", hdr_lnum, lnum);
+		goto fail;
+	}
+
+	if (unlikely(leb_ver != hdr_leb_ver)) {
+		ubi_err("bad leb_ver %d, should be %d", hdr_leb_ver, leb_ver);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	ubi_msg("paranoid check failed");
+	dump_stack();
+	return 1;
+}
+
+/**
+ * paranoid_check_leb_locked - ensure that a logical eraseblock is locked.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID to check
+ * @lnum: the logical eraseblock number to check
+ *
+ * This function returns zero if the logical eraseblock is locked and %1 if
+ * not.
+ */
+static int paranoid_check_leb_locked(const struct ubi_info *ubi, int vol_id,
+				     int lnum)
+{
+	struct ubi_eba_ltree_entry *le;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	spin_lock(&eba->ltree_lock);
+	le = ltree_lookup(ubi->eba, vol_id, lnum);
+	spin_unlock(&eba->ltree_lock);
+	if (likely(le))
+		return 0;
+
+	ubi_msg("paranoid check failed");
+	dump_stack();
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_EBA */
diff --git a/drivers/mtd/ubi/eba.h b/drivers/mtd/ubi/eba.h
new file mode 100644
index 0000000..f39eb5e
--- /dev/null
+++ b/drivers/mtd/ubi/eba.h
@@ -0,0 +1,313 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * The UBI Eraseblock Association (EBA) unit.
+ *
+ * The main goal of this unit is to maintain the Eraseblock Association Table
+ * (EBA table). The EBA table is a data structure which maps (volume ID,
+ * logical eraseblock number) pairs to physical eraseblock numbers.
+ *
+ * Note, it is supposed that all the UBI input/output goes via the EBA unit.
+ * The only reservation should be made for the initialization time when
+ * different units may directly do input/output from physical eraseblocks.
+ *
+ * Although in this implementation the EBA table is fully kept and managed in
+ * RAM, which assumes poor UBI scalability, it might be (partially) maintained
+ * on flash in future implementations.
+ */
+
+#ifndef __UBI_EBA_H__
+#define __UBI_EBA_H__
+
+#include <linux/spinlock.h>
+#include <linux/rwsem.h>
+#include <linux/rbtree.h>
+#include <linux/mtd/ubi.h>
+
+struct ubi_info;
+struct ubi_scan_info;
+
+/**
+ * ubi_eba_mkvol - create EBA mapping for a new volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the new volume
+ * @leb_count: how many eraseblocks are reserved for this volume
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_mkvol(const struct ubi_info *ubi, int vol_id, int leb_count);
+
+/**
+ * ubi_eba_rmvol - remove EBA mapping for a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to be removed
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_rmvol(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_eba_rsvol - re-size EBA mapping for a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to be re-sized
+ * @reserved_pebs: new count of physical eraseblocks in this volume
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs);
+
+/**
+ * ubi_eba_erase_leb - erase a logical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: volume ID
+ * @lnum: the logical eraseblock number to erase
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_erase_leb(const struct ubi_info *ubi, int vol_id, int lnum);
+
+/**
+ * ubi_eba_read_leb - read data from a logical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID from where to read
+ * @lnum: the logical eraseblock number to read from
+ * @buf: the buffer to store the read data
+ * @offset: the offset within the logical eraseblock from where to read
+ * @len: how many bytes to read
+ * @check: data CRC check flag
+ * @read: the number of actually read bytes is returned here
+ *
+ * If the logical eraseblock @lnum is unmapped, @buf is filled by 0xFF bytes.
+ * The @check flag only makes sense for static volumes and forces eraseblock
+ * data CRC checking. The @read field contains the number of successfully read
+ * bytes.
+ *
+ * In case of success this function returns zero. If the @check flag is set,
+ * @vol_id is a static volume, and the data CRC mismatches - %-EBADMSG is
+ * returned. %-EBADMSG may also be returned for any volume type if an ECC error
+ * was detected by the MTD device driver.
+ *
+ * Other negative error cored may be returned in case of other errors. In any
+ * case, the @read argument contains the number of read bytes. Note, if an
+ * error is returned, the read data may be incorrect.
+ */
+int ubi_eba_read_leb(const struct ubi_info *ubi, int vol_id, int lnum,
+		     void *buf, int offset, int len, int check, int *read);
+
+/**
+ * ubi_eba_write_leb - write data to a logical eraseblock of a dynamic volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID where to write
+ * @leb: the logical eraseblock number to write
+ * @buf: the data to write
+ * @offset: the offset within the logical eraseblock where to write
+ * @len: how many bytes to write
+ * @dtype: data type
+ * @used_ebs: how many logical eraseblocks will this volume contain
+ * @written: how many bytes were actually written
+ * @ivol_data: private data to put to the VID header (may be used only for
+ * internal volumes)
+ *
+ * The @used_ebs argument is only required for static volumes and is ignored
+ * for dynamic ones. In case of static volumes, all data of this logical
+ * eraseblock must be written at once. It is prohibited to write more then once
+ * to logical eraseblocks of static volumes. This function returns zero in case
+ * of success and a negative error code in case of failure. The @written field
+ * contains the number of successfully written bytes.
+ */
+int ubi_eba_write_leb(const struct ubi_info *ubi, int vol_id, int lnum,
+		      const void *buf, int offset, int len,
+		      enum ubi_data_type dtype, int used_ebs, int *written,
+		      const void *ivol_data);
+
+/**
+ * ubi_eba_leb_read_lock - lock a logical eraseblock for reading.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number to lock
+ *
+ * This function locks a logical eraseblock for reading which means that all
+ * writers will be locked waiting while the logical eraseblock is stopped being
+ * used.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_leb_read_lock(const struct ubi_info *ubi, int vol_id, int lnum);
+
+/**
+ * ubi_eba_leb_write_lock - lock a logical eraseblock for writing.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number to lock
+ *
+ * This function locks a logical eraseblock for writing which means that all
+ * further readers and writers will be locked waiting while the logical
+ * eraseblock is stopped being used.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_leb_write_lock(const struct ubi_info *ubi, int vol_id, int lnum);
+
+/**
+ * ubi_eba_leb_read_unlock - unlock a logical eraseblock locked for reading.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number to unlock
+ */
+void ubi_eba_leb_read_unlock(const struct ubi_info *ubi, int vol_id, int lnum);
+
+/**
+ * ubi_eba_leb_write_unlock - unlock a logical eraseblock locked for writing.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number to unlock
+ */
+void ubi_eba_leb_write_unlock(const struct ubi_info *ubi, int vol_id, int lnum);
+
+/**
+ * ubi_eba_leb_remap - re-map a logical eraseblock to another physical
+ * eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number
+ * @pnum: new physical eraseblock to map to
+ *
+ * The logical eraseblock must be locked before re-mapping.
+ */
+void ubi_eba_leb_remap(const struct ubi_info *ubi, int vol_id, int lnum,
+		       int pnum);
+
+/**
+ * ubi_eba_ro_mode - switch to read-only mode.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_eba_ro_mode(const struct ubi_info *ubi);
+
+/**
+ * ubi_eba_init_scan - initialize the EBA unit using scanning information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_eba_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_eba_close - close the EBA unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_eba_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_eba_tbl_rec - a record in the eraseblock association table.
+ *
+ * @pnum: physical eraseblock number
+ * @leb_ver: logical eraseblock version
+ *
+ * This structure represents a record in the eraseblock association table.
+ */
+struct ubi_eba_tbl_rec {
+	int pnum;
+	uint32_t leb_ver;
+};
+
+/**
+ * struct ubi_eba_tbl_volume - a volume in the the eraseblock association
+ * table.
+ *
+ * @recs: an array of per-logical eraseblock records (for each logical
+ * eraseblock of this volume)
+ * @leb_count: how many logical eraseblock this volume has
+ */
+struct ubi_eba_tbl_volume {
+	struct ubi_eba_tbl_rec *recs;
+	int leb_count;
+};
+
+/**
+ * struct ubi_eba_ltree_entry - an entry in the lock tree.
+ *
+ * @rb: link in the RB-tree
+ * @vol_id: volume ID of the locked logical eraseblock
+ * @lnum: the locked logical eraseblock number
+ * @users: how many tasks are using this logical eraseblock or wait for it
+ * @mutex: a read/write mutex to implement read/write access serialization to
+ * the (@vol_id, @lnum) logical eraseblock
+ *
+ * This data structured is used to lock a logical eraseblock - a corresponding
+ * &struct ubi_eba_ltree_entry is created and inserted to the lock tree
+ * (@eba->ltree).
+ */
+struct ubi_eba_ltree_entry {
+	struct rb_node rb;
+	int vol_id;
+	int lnum;
+	int users;
+	struct rw_semaphore mutex;
+};
+
+/**
+ * struct ubi_eba_info - UBI EBA unit description data structure.
+ *
+ * @eba_tbl: the eraseblock association table
+ * @eba_tbl_lock: protects the EBA table
+ * @ltree: the lock tree
+ * @ltree_lock: protects the lock tree
+ * @num_volumes: number of volumes mapped by the EBA table
+ *
+ * The EBA unit implements per-logical eraseblock locking. Before accessing a
+ * logical eraseblock it is locked for reading or writing. The per-logical
+ * eraseblock locking is implemented by means of the lock tree.
+ *
+ * The lock tree is an RB-tree which refers all the currently locked logical
+ * eraseblocks. The lock tree elements are &struct ubi_eba_ltree_entry objects.
+ * They are indexed by (@vol_id,@lnum) pairs.
+ */
+struct ubi_eba_info {
+	struct ubi_eba_tbl_volume *eba_tbl; /* private */
+	spinlock_t eba_tbl_lock;            /* private */
+	struct rb_root ltree;               /* private */
+	spinlock_t ltree_lock;              /* private */
+	size_t num_volumes;                 /* private */
+};
+
+#endif /* !__UBI_EBA_H__ */
diff --git a/drivers/mtd/ubi/init.c b/drivers/mtd/ubi/init.c
new file mode 100644
index 0000000..b9e7bd4
--- /dev/null
+++ b/drivers/mtd/ubi/init.c
@@ -0,0 +1,238 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/sched.h>
+#include <linux/stringify.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/stat.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "uif.h"
+#include "build.h"
+#include "debug.h"
+
+/* Number of UBI devices in system */
+int ubis_num = 0;
+
+/* All the UBI devices in system */
+struct ubi_info *ubis[UBI_MAX_INSTANCES];
+
+/* A lock that serializes UBI output */
+spinlock_t __ubi_output_lock = SPIN_LOCK_UNLOCKED;
+
+/* A list of MTD devices to attach specified as a module parameter */
+static char *mtd_devs[UBI_MAX_INSTANCES];
+
+/*
+ * Offsets of data and VID headers in physical eraseblocks for each MTD device.
+ */
+static int vid_hdr_offsets[UBI_MAX_INSTANCES];
+static int data_offsets[UBI_MAX_INSTANCES];
+
+/* Numbers of elements set in the @vid_hdr_offsets and @data_offsets arrays */
+static int vid_hdr_offsets_num;
+static int data_offsets_num;
+
+module_param_array(mtd_devs, charp, &ubis_num, S_IRUGO);
+module_param_array(vid_hdr_offsets, int, &vid_hdr_offsets_num, S_IRUGO);
+module_param_array(data_offsets, int, &data_offsets_num, S_IRUGO);
+
+MODULE_PARM_DESC(mtd_devs, "The list of underlying MTD devices."
+		 "A distinct UBI device is created for each MTD device.\n"
+		 "Usage example: insmod ubi.ko mtd_devs=0,3 - create"
+		 "two UBI devices on top of mtd0 and mtd3 correspondingly.\n");
+
+MODULE_PARM_DESC(vid_hdr_offsets, "Offset of volume identifier headers in "
+				  "physical eraseblocks (0 means to use default"
+				  " offset).\n"
+				  "Usage example: insmod ubi.ko mtd_devs=0,3 "
+				  "vid_hdr_offsets=512,0 - 512 for mtd0 and "
+				  "default for mtd3.\n");
+
+MODULE_PARM_DESC(data_offsets, "Offset of data headers in physical "
+			       "eraseblocks (0 means to use default offset).\n"
+			       "Usage example: insmod ubi.ko mtd_devs=0,3 "
+			       "data_offsets=1024,0 - 1024 for mtd0 and default "
+			       "for mtd3.\n");
+
+/*
+ * UBI headers must take 64 bytes. The below is a hacky way to ensure this.
+ */
+static int __ubi_check_ec_hdr_size[(UBI_EC_HDR_SIZE == 64) - 1]
+    __attribute__ ((__unused__));
+static int __ubi_check_ec_hdr_size[(UBI_VID_HDR_SIZE == 64) - 1]
+    __attribute__ ((__unused__));
+
+static int __init ubi_init(void)
+{
+	int err, i, k;
+
+	if (ubis_num > UBI_MAX_INSTANCES) {
+		ubi_err("too many MTD devices, max. is %d", UBI_MAX_INSTANCES);
+		return -EINVAL;
+	}
+	if (vid_hdr_offsets_num > ubis_num) {
+		ubi_err("too many VID header offsets specified");
+		return -EINVAL;
+	}
+	if (data_offsets_num != vid_hdr_offsets_num) {
+		ubi_err("%d VID header offsets, but %d data offsets",
+			vid_hdr_offsets_num, data_offsets_num);
+		return -EINVAL;
+	}
+
+	err = ubi_create_slab_caches();
+	if (err)
+		return err;
+
+	/* Initialize the user interface unit */
+	err = ubi_uif_global_init();
+	if (err)
+		goto out_slabs;
+
+	/* Attach MTD devices */
+	for (i = 0; i < ubis_num; i++) {
+		int mtd_num;
+		char *endp;
+
+		cond_resched();
+		printk("\n");
+		err = -EINVAL;
+
+		/* Parse MTD number string */
+		mtd_num = simple_strtoul(mtd_devs[i], &endp, 0);
+		if (*endp != '\0' || mtd_devs[i] == endp || mtd_num < 0) {
+			ubi_err("incorrect MTD device: \"%s\"", mtd_devs[i]);
+			goto out_detach;
+		}
+
+		if (mtd_num < 0) {
+			ubi_err("bad MTD device number %d", mtd_num);
+			goto out_detach;
+		}
+
+		if (ubis[i] != NULL) {
+			/* The same mtd device is specified twice */
+			ubi_err("MTD device %d is specified twice", mtd_num);
+			goto out_detach;
+		}
+
+		ubis[i] = ubi_kzalloc(sizeof(struct ubi_info), GFP_KERNEL);
+		if (!ubis[i])
+			goto out_detach;
+		ubis[i]->ubi_num = i;
+
+		err = ubi_bld_attach_mtd_dev(ubis[i], mtd_num,
+					     vid_hdr_offsets[i],
+					     data_offsets[i]);
+		if (err) {
+			ubi_kfree(ubis[i]);
+			goto out_detach;
+		}
+	}
+
+	return 0;
+
+out_detach:
+	for (k = 0; k < i; k++) {
+		ubi_bld_detach_mtd_dev(ubis[k]);
+		ubi_kfree(ubis[k]);
+	}
+
+	ubi_uif_global_close();
+
+out_slabs:
+	ubi_destroy_slab_caches();
+	return err;
+}
+module_init(ubi_init);
+
+static void __exit ubi_exit(void)
+{
+	int i;
+
+	for (i = 0; i < ubis_num; i++) {
+		if (ubis[i]) {
+			ubi_bld_detach_mtd_dev(ubis[i]);
+			ubi_kfree(ubis[i]);
+		}
+	}
+
+	ubi_uif_global_close();
+	ubi_destroy_slab_caches();
+}
+module_exit(ubi_exit);
+
+int ubi_attach_mtd_dev(int mtd_num, int vid_hdr_offset, int data_offset)
+{
+	int i, err;
+	int ubi_num = -1;
+
+	if (mtd_num < 0) {
+		ubi_err("bad MTD device number %d", mtd_num);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ubis_num; i++)
+		if (!ubis[i]) {
+			ubi_num = i;
+			break;
+		}
+
+	if (ubi_num < 0) {
+		if (ubis_num + 1 > UBI_MAX_INSTANCES) {
+			ubi_err("too many UBI devices, max. is %d",
+				UBI_MAX_INSTANCES);
+			return -EINVAL;
+		}
+		ubi_num = ubis_num;
+	}
+
+	ubis[ubi_num] = ubi_kzalloc(sizeof(struct ubi_info), GFP_KERNEL);
+	if (!ubis[ubi_num])
+		return -ENOMEM;
+
+	ubis[ubi_num]->ubi_num = ubi_num;
+
+	err = ubi_bld_attach_mtd_dev(ubis[ubi_num], mtd_num, vid_hdr_offset,
+				     data_offset);
+	if (err)
+		goto out_free;
+
+	if (ubi_num == ubis_num)
+		ubis_num += 1;
+
+	return ubi_num;
+
+out_free:
+	ubi_kfree(ubis[i]);
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(ubi_attach_mtd_dev);
+
+MODULE_VERSION(__stringify(UBI_VERSION));
+MODULE_DESCRIPTION("UBI - Unsorted Block Images");
+MODULE_AUTHOR("Artem B. Bityutskiy");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
new file mode 100644
index 0000000..bc00a1f
--- /dev/null
+++ b/drivers/mtd/ubi/io.c
@@ -0,0 +1,1146 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/crc32.h>
+#include <linux/wait.h>
+#include <linux/sched.h>
+#include <linux/mtd/mtd.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "io.h"
+#include "misc.h"
+#include "debug.h"
+
+/*
+ * In case of an input/output error, UBI tries to repeat the operation several
+ * times before returning error. The below constant defines how many times
+ * UBI re-tries.
+ */
+#define IO_RETRIES 3
+
+/*
+ * "Paranoid" checks of the UBI I/O unit. Note, they substantially slow down
+ * the system.
+ */
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_IO
+
+/* Check if the flash allows to clear single bits, like NOR */
+#define can_change_single_bits(mtd) \
+	(mtd->type == MTD_NORFLASH && mtd->writesize == 1)
+
+static int paranoid_check_not_bad(const struct ubi_info *ubi, int pnum);
+static int paranoid_check_peb_ec_hdr(const struct ubi_info *ubi, int pnum);
+static int paranoid_check_ec_hdr(const struct ubi_info *ubi, int pnum,
+				 const struct ubi_ec_hdr *ec_hdr);
+static int paranoid_check_peb_vid_hdr(const struct ubi_info *ubi, int pnum);
+static int paranoid_check_vid_hdr(const struct ubi_info *ubi, int pnum,
+				  const struct ubi_vid_hdr *vid_hdr);
+static int paranoid_check_all_ff(const struct ubi_info *ubi, int pnum,
+				 int offset, int len);
+#else
+#define can_change_single_bits(mtd) 1
+#define paranoid_check_not_bad(ubi, pnum) 0
+#define paranoid_check_peb_ec_hdr(ubi, pnum)  0
+#define paranoid_check_ec_hdr(ubi, pnum, ec_hdr)  0
+#define paranoid_check_peb_vid_hdr(ubi, pnum) 0
+#define paranoid_check_vid_hdr(ubi, pnum, vid_hdr) 0
+#define paranoid_check_all_ff(ubi, pnum, offset, len) 0
+#endif /* !CONFIG_MTD_UBI_DEBUG_PARANOID_IO */
+
+/**
+ * mtd_read - read data from flash.
+ *
+ * A simple wrapper over mtd->read().
+ */
+static inline int mtd_read(const struct ubi_info *ubi, void *buf,
+			   loff_t addr, int len, int *read)
+{
+	struct mtd_info *mtd = ubi->io->mtd;
+
+	return mtd->read(mtd, addr, len, read, buf);
+}
+
+/**
+ * mtd_write - write data to flash.
+ *
+ * A simple wrapper over mtd->write().
+ */
+static inline int mtd_write(const struct ubi_info *ubi, const void *buf,
+			    loff_t addr, int len, int *written)
+{
+	struct mtd_info *mtd = ubi->io->mtd;
+
+	return mtd->write(mtd, addr, len, written, buf);
+}
+
+int ubi_io_read(const struct ubi_info *ubi, void *buf, int pnum, int offset,
+		int len, int *read)
+{
+	int err, tries = 0;
+	const struct ubi_io_info *io = ubi->io;
+	loff_t addr;
+
+	dbg_io("read %d bytes from PEB %d, offset %d", len, pnum, offset);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(offset >= 0);
+	ubi_assert(len > 0);
+	ubi_assert(pnum < io->peb_count);
+	ubi_assert(offset + len <= io->peb_size);
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_not_bad(ubi, pnum);
+	if (unlikely(err != 0))
+		return err > 0 ? -EINVAL : err;
+
+	addr = (loff_t)pnum * io->peb_size + offset;
+
+retry:
+	err = mtd_read(ubi, buf, addr, len, read);
+	if (unlikely(err) && *read != len) {
+		if (++tries <= IO_RETRIES) {
+			yield();
+			goto retry;
+		}
+		ubi_err("error %d while reading %d bytes from PEB %d, "
+			"offset %d, read %d bytes",
+			err, len, pnum, offset, *read);
+		dump_stack();
+	}
+
+	if (unlikely(err == -EUCLEAN))
+		err = UBI_IO_BITFLIPS;
+
+	/* The below is just for debugging and is compiled out if disabled */
+	if (ubi_dbg_is_bitflip() && !err)
+		return UBI_IO_BITFLIPS;
+
+	return err;
+}
+
+int ubi_io_write(const struct ubi_info *ubi, const void *buf, int pnum,
+		 int offset, int len, int *written)
+{
+	int err;
+	loff_t addr;
+	const struct ubi_io_info *io = ubi->io;
+
+	dbg_io("write %d bytes to PEB %d, offset %d", len, pnum, offset);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(offset >= 0);
+	ubi_assert(len > 0);
+	ubi_assert(pnum < io->peb_count);
+	ubi_assert(offset + len <= io->peb_size);
+	ubi_assert(offset % io->min_io_size == 0);
+	ubi_assert(len % io->min_io_size == 0);
+
+	/* Ensure we are not in read-only mode */
+	if (unlikely(io->ro_mode)) {
+		dbg_io("read-only mode");
+		return -EROFS;
+	}
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_not_bad(ubi, pnum);
+	if (unlikely(err != 0))
+		return err > 0 ? -EINVAL : err;
+        if (!can_change_single_bits(io->mtd)) {
+		/*
+		 * If the flash does not allow to change individual bits (like
+		 * NOR), we assume we are writing to a flash region with all
+		 * 0xFF bytes.
+		 */
+		err = paranoid_check_all_ff(ubi, pnum, offset, len);
+		if (unlikely(err))
+			return -EINVAL;
+	}
+	if (offset >= io->leb_start) {
+		/*
+		 * We write to the data area of the physical eraseblock. Make
+		 * sure it has valid EC and VID headers.
+		 */
+		err = paranoid_check_peb_ec_hdr(ubi, pnum);
+		if (unlikely(err > 0))
+			return -EINVAL;
+		err = paranoid_check_peb_vid_hdr(ubi, pnum);
+		if (unlikely(err))
+			return -EINVAL;
+	}
+
+	addr = (loff_t)pnum * io->peb_size + offset;
+
+	err = mtd_write(ubi, buf, addr, len, written);
+	if (unlikely(err)) {
+		ubi_err("error %d while writing %d bytes to PEB %d, offset %d, "
+			"written %d bytes",
+			err, len, pnum, offset, *written);
+		dump_stack();
+	}
+
+	/* The below is just for debugging and is compiled out if disabled */
+	if (ubi_dbg_is_write_failure() && !err) {
+		ubi_err("cannot write %d bytes to PEB %d, offset %d (emulated)",
+			len, pnum, offset);
+		dump_stack();
+		return -EIO;
+	}
+
+	return err;
+}
+
+static void erase_callback(struct erase_info *ei)
+{
+	wake_up_interruptible((wait_queue_head_t *)ei->priv);
+}
+
+static int _ubi_io_sync_erase(const struct ubi_info *ubi, int pnum);
+static int ubi_io_torture_peb(const struct ubi_info *ubi, int pnum);
+
+int ubi_io_sync_erase(const struct ubi_info *ubi, int pnum, int torture)
+{
+	int err, ret;
+
+	/* Ensure we are not in read-only mode */
+	if (unlikely(ubi->io->ro_mode)) {
+		dbg_io("read-only mode");
+		return -EROFS;
+	}
+
+	if (!torture) {
+		err = _ubi_io_sync_erase(ubi, pnum);
+		if (unlikely(err))
+			return err;
+		return 1;
+	}
+
+	ret = ubi_io_torture_peb(ubi, pnum);
+	if (unlikely(!ret))
+		return -EIO;
+	if (unlikely(ret < 0))
+		return ret;
+
+	err = _ubi_io_sync_erase(ubi, pnum);
+	if (unlikely(err))
+		return err;
+
+	return ret + 1;
+}
+
+int ubi_io_is_bad(const struct ubi_info *ubi, int pnum)
+{
+	const struct ubi_io_info *io = ubi->io;
+	struct mtd_info *mtd = io->mtd;
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < io->peb_count);
+
+	if (io->bad_allowed) {
+		int ret;
+
+		ret = mtd->block_isbad(mtd, (loff_t)pnum * io->peb_size);
+		if (unlikely(ret < 0))
+			ubi_err("error %d while checking if PEB %d is bad",
+				ret, pnum);
+		else if (ret)
+			dbg_io("PEB %d is bad", pnum);
+		return ret;
+	}
+
+	return 0;
+}
+
+int ubi_io_mark_bad(const struct ubi_info *ubi, int pnum)
+{
+	int err;
+	const struct ubi_io_info *io = ubi->io;
+	struct mtd_info *mtd = io->mtd;
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < io->peb_count);
+
+	/* Ensure we are not in read-only mode */
+	if (unlikely(io->ro_mode)) {
+		dbg_io("read-only mode");
+		return -EROFS;
+	}
+
+	if (!io->bad_allowed)
+		return 0;
+
+	err = mtd->block_markbad(mtd, (loff_t)pnum * io->peb_size);
+	if (unlikely(err))
+		ubi_err("cannot mark PEB %d bad, error %d", pnum, err);
+	return err;
+}
+
+int ubi_io_read_ec_hdr(const struct ubi_info *ubi, int pnum,
+		       struct ubi_ec_hdr *ec_hdr, int verbose)
+{
+	int err, err1, read;
+	uint32_t crc, magic, hdr_crc;
+
+	dbg_io("read EC header from PEB %d", pnum);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < ubi->io->peb_count);
+
+	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE, &read);
+	if (unlikely(err)) {
+		if (err == -EIO || read != UBI_EC_HDR_SIZE)
+			return err;
+
+		/*
+		 * Although an error occurred, we have read the requested
+		 * number of bytes, so keep working. The read data may be
+		 * corrupted, but the CRC checksum has to identify this. If the
+		 * CRC checksum is OK, this physical eraseblock needs
+		 * scrubbing.
+		 */
+		err = UBI_IO_BITFLIPS;
+	}
+
+	magic = ubi32_to_cpu(ec_hdr->magic);
+	if (unlikely(magic != UBI_EC_HDR_MAGIC)) {
+		/*
+		 * The magic field is wrong. Let's check if we have read all
+		 * 0xFF. If yes, this physical eraseblock is assumed to be
+		 * empty.
+		 */
+		if (ubi_buf_all_ff(ec_hdr, UBI_EC_HDR_SIZE)) {
+			/* The physical eraseblock is supposedly empty */
+
+			/*
+			 * The below is just a paranoid check, it has to be
+			 * compiled out if paranoid checks are disabled.
+			 */
+			err1 = paranoid_check_all_ff(ubi, pnum, 0,
+						     ubi->io->peb_size);
+			if (unlikely(err1))
+				return UBI_IO_BAD_EC_HDR;
+
+			if (verbose)
+				ubi_err("no EC header found at PEB %d", pnum);
+			return UBI_IO_PEB_EMPTY;
+		}
+		if (verbose) {
+			ubi_err("bad magic number at PEB %d", pnum);
+			ubi_dbg_dump_ec_hdr(ec_hdr);
+		}
+		return UBI_IO_BAD_EC_HDR;
+	}
+
+	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
+	hdr_crc = ubi32_to_cpu(ec_hdr->hdr_crc);
+
+	if (unlikely(hdr_crc != crc)) {
+		if (verbose) {
+			ubi_err("bad CRC at PEB %d, calculated %#08x, "
+				"read %#08x", pnum, crc, hdr_crc);
+			ubi_dbg_dump_ec_hdr(ec_hdr);
+		}
+		return UBI_IO_BAD_EC_HDR;
+	}
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err1 = paranoid_check_ec_hdr(ubi, pnum, ec_hdr);
+	if (unlikely(err1 > 0))
+		return -EINVAL;
+
+	return err;
+}
+
+int ubi_io_write_ec_hdr(const struct ubi_info *ubi, int pnum,
+			struct ubi_ec_hdr *ec_hdr)
+{
+	int err, written;
+	uint32_t crc;
+	const struct ubi_io_info *io = ubi->io;
+
+	dbg_io("write EC header to PEB %d", pnum);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < io->peb_count);
+
+	ec_hdr->magic = cpu_to_ubi32(UBI_EC_HDR_MAGIC);
+	ec_hdr->version = UBI_VERSION;
+	ec_hdr->vid_hdr_offset = cpu_to_ubi32(io->vid_hdr_offset);
+	ec_hdr->data_offset = cpu_to_ubi32(io->leb_start);
+	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
+	ec_hdr->hdr_crc = cpu_to_ubi32(crc);
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_ec_hdr(ubi, pnum, ec_hdr);
+	if (unlikely(err > 0))
+		return -EINVAL;
+
+	err = ubi_io_write(ubi, ec_hdr, pnum, 0, io->ec_hdr_alsize, &written);
+	return err;
+}
+
+int ubi_io_read_vid_hdr(const struct ubi_info *ubi, int pnum,
+			struct ubi_vid_hdr *vid_hdr, int verbose)
+{
+	int err, err1, read;
+	uint32_t crc, magic, hdr_crc;
+	const struct ubi_io_info *io = ubi->io;
+	void *p;
+
+	dbg_io("read VID header from PEB %d", pnum);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < io->peb_count);
+
+	p = (char *)vid_hdr - io->vid_hdr_shift;
+	err = ubi_io_read(ubi, p, pnum, io->vid_hdr_aloffset,
+			  io->vid_hdr_alsize, &read);
+	if (unlikely(err)) {
+		if (err == -EIO || read != io->vid_hdr_alsize)
+			return err;
+
+		/*
+		 * Although an error occurred, we have read the requested
+		 * number of bytes, so keep working. The read data may be
+		 * corrupted, but the CRC checksum has to identify this. If the
+		 * CRC checksum is OK, this physical eraseblock needs
+		 * scrubbing.
+		 */
+		err = UBI_IO_BITFLIPS;
+	}
+
+	magic = ubi32_to_cpu(vid_hdr->magic);
+	if (unlikely(magic != UBI_VID_HDR_MAGIC)) {
+		/*
+		 * If we have read all 0xFF bytes, the VID header probably does
+		 * not exist and the physical eraseblock is assumed to be free.
+		 */
+		if (ubi_buf_all_ff(vid_hdr, UBI_VID_HDR_SIZE)) {
+			/* The physical eraseblock is supposedly free */
+
+			/*
+			 * The below is just a paranoid check, it has to be
+			 * compiled out if paranoid checks are disabled.
+			 */
+			err1 = paranoid_check_all_ff(ubi, pnum, io->leb_start,
+						     io->leb_size);
+			if (unlikely(err1))
+				return UBI_IO_BAD_VID_HDR;
+			if (verbose)
+				ubi_err("no VID header found at PEB %d", pnum);
+			return UBI_IO_PEB_FREE;
+		}
+		if (verbose) {
+			ubi_err("bad magic number at PEB %d", pnum);
+			ubi_dbg_dump_vid_hdr(vid_hdr);
+		}
+		return UBI_IO_BAD_VID_HDR;
+	}
+
+	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
+	hdr_crc = ubi32_to_cpu(vid_hdr->hdr_crc);
+
+	if (unlikely(hdr_crc != crc)) {
+		if (verbose) {
+			ubi_warn("bad CRC at PEB %d, calculated %#08x, "
+				 "read %#08x", pnum, crc, hdr_crc);
+			ubi_dbg_dump_vid_hdr(vid_hdr);
+		}
+		return UBI_IO_BAD_VID_HDR;
+	}
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err1 = paranoid_check_vid_hdr(ubi, pnum, vid_hdr);
+	if (unlikely(err1 > 0))
+		return -EINVAL;
+
+	return err;
+}
+
+int ubi_io_write_vid_hdr(const struct ubi_info *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdr)
+{
+	int err, written;
+	uint32_t crc;
+	const struct ubi_io_info *io = ubi->io;
+	void *p;
+
+	dbg_io("write VID header to PEB %d", pnum);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < io->peb_count);
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_peb_ec_hdr(ubi, pnum);
+	if (unlikely(err > 0))
+		return -EINVAL;
+
+	vid_hdr->magic = cpu_to_ubi32(UBI_VID_HDR_MAGIC);
+	vid_hdr->version = UBI_VERSION;
+	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_EC_HDR_SIZE_CRC);
+	vid_hdr->hdr_crc = cpu_to_ubi32(crc);
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_vid_hdr(ubi, pnum, vid_hdr);
+	if (unlikely(err > 0))
+		return -EINVAL;
+
+	/*
+	 * The VID header may reside on a non-aligned offset, take care about
+	 * this.
+	 */
+	p = (char *)vid_hdr - io->vid_hdr_shift;
+	err = ubi_io_write(ubi, p, pnum, io->vid_hdr_aloffset,
+			   io->vid_hdr_alsize, &written);
+	return err;
+}
+
+static int mtd_device_check(const struct mtd_info *mtd);
+
+int ubi_io_init(struct ubi_info *ubi, int mtd_num, int vid_hdr_offset,
+		int data_offset)
+{
+	int err;
+	struct mtd_info *mtd;
+	struct ubi_io_info *io;
+
+	dbg_io("initialize the UBI I/O unit for MTD device %d", mtd_num);
+
+	io = ubi_kzalloc(sizeof(struct ubi_io_info), GFP_KERNEL);
+	if (!io)
+		return -ENOMEM;
+	ubi->io = io;
+
+	mtd = io->mtd = get_mtd_device(NULL, mtd_num);
+	if (!mtd) {
+		ubi_err("cannot open MTD device %d", mtd_num);
+		err = -EINVAL;
+		goto out_io;
+	}
+	io->mtd_num = mtd_num;
+
+	/* Ensure that we can work with this MTD device */
+	err = mtd_device_check(mtd);
+	if (err)
+		goto out_mtd;
+
+	io->mtd_name   = mtd->name;
+	io->peb_size   = mtd->erasesize;
+	io->peb_count  = mtd->size / mtd->erasesize;
+	io->flash_size = mtd->size;
+
+	if (mtd->block_isbad && mtd->block_markbad)
+		io->bad_allowed = 1;
+
+	io->min_io_size = mtd->writesize;
+
+	/*
+	 * Calculate default sizes of EC and VID headers which are aligned to
+	 * the minimal flash I/O unit.
+	 */
+	if (io->min_io_size > 1) {
+		int x;
+
+		x = UBI_EC_HDR_SIZE/io->min_io_size;
+		x *= io->min_io_size;
+		x += io->min_io_size;
+		io->ec_hdr_alsize = x;
+
+		x = UBI_VID_HDR_SIZE/io->min_io_size;
+		x *= io->min_io_size;
+		x += io->min_io_size;
+		io->vid_hdr_alsize = x;
+	} else {
+		io->ec_hdr_alsize = UBI_EC_HDR_SIZE;
+		io->vid_hdr_alsize = UBI_VID_HDR_SIZE;
+	}
+
+	if (!vid_hdr_offset)
+		/* default offset */
+		io->vid_hdr_offset = io->vid_hdr_aloffset = io->ec_hdr_alsize;
+	else {
+		io->vid_hdr_offset = vid_hdr_offset;
+		io->vid_hdr_aloffset = vid_hdr_offset;
+		io->vid_hdr_aloffset -= vid_hdr_offset % io->min_io_size;
+		io->vid_hdr_shift = vid_hdr_offset - io->vid_hdr_aloffset;
+
+		/* The shift must be aligned to 32-bit boundary */
+		if (io->vid_hdr_shift % 4) {
+			ubi_err("unaligned VID header shift %d",
+				io->vid_hdr_shift);
+			return -EINVAL;
+		}
+	}
+
+	/* Similar for the data offset */
+	if (!data_offset)
+		io->leb_start = io->vid_hdr_offset + io->vid_hdr_alsize;
+	else
+		io->leb_start = data_offset;
+
+	/* Check sanity */
+	if (io->vid_hdr_offset < UBI_EC_HDR_SIZE ||
+	    io->leb_start < io->vid_hdr_offset + UBI_VID_HDR_SIZE ||
+	    io->leb_start > io->peb_size - UBI_VID_HDR_SIZE ||
+	    io->leb_start % io->min_io_size) {
+		ubi_err("bad VID header (%d) or data offsets (%d)",
+			io->vid_hdr_offset, io->leb_start);
+		return -EINVAL;
+	}
+
+	/*
+	 * It may happen that EC and VID headers are situated in one minimal
+	 * I/O unit. In this case we can only accept this UBI image in
+	 * read-only mode.
+	 */
+	if (io->vid_hdr_offset + UBI_VID_HDR_SIZE <= io->min_io_size) {
+		ubi_warn("EC and VID headers are in the same minimal I/O unit, "
+			 "switch to read-only mode");
+		io->ro_mode = 1;
+	}
+
+	io->leb_size = io->peb_size - io->leb_start;
+
+	if (!(mtd->flags & MTD_WRITEABLE)) {
+		ubi_msg("MTD device %d is write-protected, attach in "
+			"read-only mode", mtd_num);
+		io->ro_mode = 1;
+	}
+
+	/*
+	 * FIXME: ideally, we have to initialize io->bad_peb_count here. But
+	 * unfortunately, MTD does not provide this information. We should loop
+	 * over all physical eraseblocks and invoke mtd->block_is_bad() which
+	 * is not optimal. So, we skip io->bad_peb_count uninitialized and let
+	 * the scanning unit to initialize it. This is not nice.
+	 */
+
+	dbg_io("the UBI I/O unit is initialized");
+	return 0;
+
+out_mtd:
+	put_mtd_device(mtd);
+out_io:
+	ubi_kfree(io);
+	return err;
+}
+
+void ubi_io_close(const struct ubi_info *ubi)
+{
+	const struct ubi_io_info *io = ubi->io;
+
+	dbg_io("close the UBI I/O unit for mtd device %d", io->mtd_num);
+	put_mtd_device(io->mtd);
+	ubi_kfree(io);
+}
+
+/**
+ * _ubi_io_sync_erase - synchronously erase a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to erase
+ *
+ * This function synchronously erases physical eraseblock @pnum and returns
+ * zero in case of success and a negative error code in case of failure. If
+ * %-EIO is returned, the physical eraseblock went bad.
+ */
+static int _ubi_io_sync_erase(const struct ubi_info *ubi, int pnum)
+{
+	int err, tries = 0;
+	struct erase_info ei;
+	wait_queue_head_t wq;
+	const struct ubi_io_info *io = ubi->io;
+
+	/*
+	 * Note, even though MTD erase interface is asynchronous, all the
+	 * current implementations are synchronous.
+	 */
+
+	dbg_io("erase PEB %d", pnum);
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < io->peb_count);
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_not_bad(ubi, pnum);
+	if (unlikely(err != 0))
+		return err > 0 ? -EINVAL : err;
+
+retry:
+	init_waitqueue_head(&wq);
+	memset(&ei, 0, sizeof(struct erase_info));
+
+	ei.mtd      = io->mtd;
+	ei.addr     = pnum * io->peb_size;
+	ei.len      = io->peb_size;
+	ei.retries  = 2;
+	ei.callback = erase_callback;
+	ei.priv     = (unsigned long)&wq;
+
+	err = io->mtd->erase(io->mtd, &ei);
+	if (unlikely(err)) {
+		ubi_err("error while erasing PEB %d", pnum);
+		if (++tries <= IO_RETRIES) {
+			yield();
+			ubi_msg("retry");
+			goto retry;
+		}
+		dump_stack();
+		return err;
+	}
+
+	err = wait_event_interruptible(wq, ei.state == MTD_ERASE_DONE ||
+					   ei.state == MTD_ERASE_FAILED);
+	if (unlikely(err)) {
+		ubi_err("interrupted PEB %d erasure", pnum);
+		return -EINTR;
+	}
+
+	if (unlikely(ei.state == MTD_ERASE_FAILED)) {
+		ubi_err("cannot erase PEB %d", pnum);
+		if (++tries <= IO_RETRIES) {
+			yield();
+			ubi_msg("retry");
+			goto retry;
+		}
+		dump_stack();
+		return -EIO;
+	}
+
+	/* The below has to be compiled out if paranoid checks are disabled */
+	err = paranoid_check_all_ff(ubi, pnum, 0, io->peb_size);
+	if (unlikely(err))
+		return -EINVAL;
+
+	/* The below is just for debugging and is compiled out if disabled */
+	if (ubi_dbg_is_erase_failure() && !err) {
+		ubi_err("cannot erase PEB %d (emulated)", pnum);
+		dump_stack();
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* Patterns to write to a physical eraseblock when torturing it */
+static int patterns[] = {0xa5, 0xa5, 0x0};
+
+/**
+ * ubi_io_torture_peb - test a supposedly bad physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to test
+ *
+ * This function returns %0 if the physical eraseblock did not pass the test,
+ * the number of erase operations done if the test was successfully passed, and
+ * a negative error code if an error occurred.
+ */
+static int ubi_io_torture_peb(const struct ubi_info *ubi, int pnum)
+{
+	int err, i, patt_count;
+	void *buf;
+	const struct ubi_io_info *io = ubi->io;
+
+	buf = ubi_kmalloc(io->peb_size, GFP_KERNEL);
+	if (unlikely(!buf))
+		return -ENOMEM;
+
+	patt_count = sizeof(patterns)/sizeof(patterns[0]);
+	for (i = 0; i < patt_count; i++) {
+		int read, written;
+
+		err = _ubi_io_sync_erase(ubi, pnum);
+		if (unlikely(err))
+			goto out;
+
+		/* Make sure the PEB contains only 0xFF bytes */
+		err = ubi_io_read(ubi, buf, pnum, 0, io->peb_size, &read);
+		if (unlikely(err))
+			goto out;
+
+		err = ubi_buf_all_ff(buf, io->peb_size);
+		if (unlikely(err == 0)) {
+			ubi_err("erased PEB %d, but a non-0xFF byte found",
+				pnum);
+			goto out;
+		}
+
+		/* Write a pattern and check it */
+		memset(buf, patterns[i], io->peb_size);
+		err = ubi_io_write(ubi, buf, pnum, 0, io->peb_size, &written);
+		if (unlikely(err))
+			goto out;
+
+		memset(buf, ~patterns[i], io->peb_size);
+		err = ubi_io_read(ubi, buf, pnum, 0, io->peb_size, &read);
+		if (unlikely(err))
+			goto out;
+
+		err = ubi_check_pattern(buf, patterns[i], io->peb_size);
+		if (unlikely(err == 0)) {
+			ubi_err("pattern %x checking failed for PEB %d",
+				patterns[i], pnum);
+			goto out;
+		}
+	}
+
+	err = patt_count;
+out:
+	ubi_kfree(buf);
+	return err;
+}
+
+
+/**
+ * mtd_device_check - check that characteristics of underlying MTD
+ * device are OK for us.
+ *
+ * @mtd - MTD device descriptor.
+ */
+static int mtd_device_check(const struct mtd_info *mtd)
+{
+	/*
+	 * Note, in this implementation we support MTD devices with 0x7FFFFFFF
+	 * physical eraseblocks maximum.
+	 */
+
+	if (mtd->numeraseregions != 0) {
+		/*
+		 * Some flashes have several erase regions. Different regions
+		 * may have different eraseblock size and other
+		 * characteristics. It looks like mostly multi-region flashes
+		 * have one "main" region and one or more small regions to
+		 * store boot loader code or boot parameters or whatever. I
+		 * guess we should just pick the largest region. But this is
+		 * not implemented.
+		 *
+		 * Later note by dedekind: it is better is to re-work MTD and
+		 * to get rid of this "regions" stuff. It is better to expose
+		 * different regions as different MTD devices, I think.
+		 */
+		ubi_err("not implemented");
+		goto out;
+	}
+
+	return 0;
+
+out:
+	ubi_err("bad or unsupported mtd device");
+	return -EIO;
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_IO
+
+/**
+ * paranoid_check_not_bad - ensure that a physical eraseblock is not bad.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: physical eraseblock number to check
+ *
+ * This function returns zero if the physical eraseblock is good, a positive
+ * number if it is bad and a negative error code if an error occurred.
+ */
+static int paranoid_check_not_bad(const struct ubi_info *ubi, int pnum)
+{
+	int err;
+
+	err = ubi_io_is_bad(ubi, pnum);
+	if (likely(!err))
+		return err;
+
+	ubi_err("paranoid check failed for PEB %d", pnum);
+	dump_stack();
+	return err;
+}
+
+/**
+ * paranoid_check_ec_hdr - check if an erase counter header is all right.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: physical eraseblock number the erase counter header belongs to
+ * @ec_hdr: the erase counter header to check
+ *
+ * This function returns zero if the erase counter header contains valid
+ * values, and %1 if not.
+ */
+static int paranoid_check_ec_hdr(const struct ubi_info *ubi, int pnum,
+				 const struct ubi_ec_hdr *ec_hdr)
+{
+	uint32_t magic;
+	int64_t ec;
+	int vid_hdr_offset, leb_start;
+	const struct ubi_io_info *io = ubi->io;
+
+	magic = ubi32_to_cpu(ec_hdr->magic);
+	if (unlikely(magic != UBI_EC_HDR_MAGIC)) {
+		ubi_err("bad magic %#08x, must be %#08x",
+			magic, UBI_EC_HDR_MAGIC);
+		goto fail;
+	}
+
+	ec = ubi64_to_cpu(ec_hdr->ec);
+	vid_hdr_offset = ubi32_to_cpu(ec_hdr->vid_hdr_offset);
+	leb_start = ubi32_to_cpu(ec_hdr->data_offset);
+
+	if (unlikely(ec < 0 || ec > UBI_MAX_ERASECOUNTER)) {
+		ubi_err("bad erase counter %lld", ec);
+		goto fail;
+	}
+	if (unlikely(ec_hdr->version != UBI_VERSION)) {
+		ubi_err("bad version %d", (int)ec_hdr->version);
+		goto fail;
+	}
+	if (unlikely(vid_hdr_offset != io->vid_hdr_offset)) {
+		ubi_err("bad vid_hdr_offset %d", vid_hdr_offset);
+		goto fail;
+	}
+	if (unlikely(leb_start != io->leb_start)) {
+		ubi_err("bad leb_start %d", leb_start);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	ubi_msg("paranoid check failed for PEB %d", pnum);
+	ubi_dbg_dump_ec_hdr(ec_hdr);
+	dump_stack();
+	return 1;
+}
+
+/**
+ * paranoid_check_peb_ec_hdr - check that the erase counter header of a
+ * physical eraseblock is in-place and is all right.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to check
+ *
+ * This function returns zero if the erase counter header is all right,
+ * %-EINVAL if not, and a negative error code if an error occurred.
+ */
+static int paranoid_check_peb_ec_hdr(const struct ubi_info *ubi, int pnum)
+{
+	int err, read;
+	uint32_t crc, hdr_crc;
+	struct ubi_ec_hdr *ec_hdr;
+
+	ec_hdr = ubi_alloc_ec_hdr(ubi);
+	if (unlikely(!ec_hdr))
+		return -ENOMEM;
+
+	err = ubi_io_read(ubi, ec_hdr, pnum, 0, UBI_EC_HDR_SIZE, &read);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS)
+		goto exit;
+
+	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
+	hdr_crc = ubi32_to_cpu(ec_hdr->hdr_crc);
+	if (unlikely(hdr_crc != crc)) {
+		ubi_err("bad CRC, calculated %#08x, read %#08x", crc, hdr_crc);
+		goto fail;
+	}
+
+	err = paranoid_check_ec_hdr(ubi, pnum, ec_hdr);
+exit:
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	return err;
+
+fail:
+	ubi_msg("paranoid check failed for PEB %d", pnum);
+	ubi_dbg_dump_ec_hdr(ec_hdr);
+	dump_stack();
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	return 1;
+}
+
+/**
+ * paranoid_check_vid_hdr - check that a volume identifier header is all right.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: physical eraseblock number the volume identifier header belongs to
+ * @ec_hdr: the volume identifier header to check
+ *
+ * This function returns zero if the volume identifier header is all right, and
+ * %1 if not.
+ */
+static int paranoid_check_vid_hdr(const struct ubi_info *ubi, int pnum,
+				  const struct ubi_vid_hdr *vid_hdr)
+{
+	uint32_t magic;
+	const struct ubi_io_info *io = ubi->io;
+	int vol_id, lnum, data_size, used_ebs, data_pad;
+
+	magic = ubi32_to_cpu(vid_hdr->magic);
+	if (unlikely(magic != UBI_VID_HDR_MAGIC)) {
+		ubi_err("bad magic %#08x, must be %#08x",
+			magic, UBI_VID_HDR_MAGIC);
+		goto fail;
+	}
+
+	vol_id = ubi32_to_cpu(vid_hdr->vol_id);
+	lnum = ubi32_to_cpu(vid_hdr->lnum);
+	data_size = ubi32_to_cpu(vid_hdr->data_size);
+	used_ebs = ubi32_to_cpu(vid_hdr->used_ebs);
+	data_pad = ubi32_to_cpu(vid_hdr->data_pad);
+
+	if (unlikely(vol_id < 0)) {
+		ubi_err("bad vol_id %d", vol_id);
+		goto fail;
+	}
+	if (unlikely(lnum < 0)) {
+		ubi_err("bad lnum %d", lnum);
+		goto fail;
+	}
+	if (unlikely(data_size < 0)) {
+		ubi_err("bad data_size %d", data_size);
+		goto fail;
+	}
+	if (unlikely(used_ebs < 0)) {
+		ubi_err("bad used_ebs %d", used_ebs);
+		goto fail;
+	}
+	if (unlikely(data_pad < 0 || data_pad >= io->leb_size)) {
+		ubi_err("bad data_pad %d", data_pad);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	ubi_msg("paranoid check failed for PEB %d", pnum);
+	ubi_dbg_dump_vid_hdr(vid_hdr);
+	dump_stack();
+	return 1;
+}
+
+/**
+ * paranoid_check_peb_vid_hdr - check that the volume identifier header of a
+ * physical eraseblock is in-place and is all right.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to check
+ *
+ * This function returns zero if the volume identifier header is all right,
+ * %-EINVAL if not, and a negative error code if an error occurred.
+ */
+static int paranoid_check_peb_vid_hdr(const struct ubi_info *ubi, int pnum)
+{
+	int err, read;
+	uint32_t crc, hdr_crc;
+	struct ubi_vid_hdr *vid_hdr;
+	const struct ubi_io_info *io = ubi->io;
+	void *p;
+
+	vid_hdr = ubi_alloc_vid_hdr(ubi);
+	if (unlikely(!vid_hdr))
+		return -ENOMEM;
+
+	p = (char *)vid_hdr - io->vid_hdr_shift;
+	err = ubi_io_read(ubi, p, pnum, io->vid_hdr_aloffset,
+			  io->vid_hdr_alsize, &read);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS)
+		goto exit;
+
+	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_EC_HDR_SIZE_CRC);
+	hdr_crc = ubi32_to_cpu(vid_hdr->hdr_crc);
+	if (unlikely(hdr_crc != crc)) {
+		ubi_err("bad VID header CRC at PEB %d, calculated %#08x, "
+			"read %#08x", pnum, crc, hdr_crc);
+		goto fail;
+	}
+
+	err = paranoid_check_vid_hdr(ubi, pnum, vid_hdr);
+
+exit:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	return err;
+
+fail:
+	ubi_err("paranoid check failed for PEB %d", pnum);
+	ubi_dbg_dump_vid_hdr(vid_hdr);
+	dump_stack();
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	return -EINVAL;
+}
+
+/**
+ * paranoid_check_all_ff - check that a region of flash is empty.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to check
+ * @offset: the starting offset within the physical eraseblock to check
+ * @len: the length of the region to check
+ *
+ * This function returns zero if only 0xFF bytes are present at offset
+ * @offset of the physical eraseblock @pnum, %1 if not, and a negative error
+ * code if an error occurred.
+ */
+static int paranoid_check_all_ff(const struct ubi_info *ubi, int pnum,
+				 int offset, int len)
+{
+	int read, err;
+	void *buf;
+	const struct ubi_io_info *io = ubi->io;
+	loff_t off;
+
+	buf = ubi_kzalloc(len, GFP_KERNEL);
+	if (unlikely(!buf))
+		return -ENOMEM;
+
+	off = (loff_t)pnum * io->peb_size + offset;
+
+	err = mtd_read(ubi, buf, off, len, &read);
+	if (unlikely(err) && read != len) {
+		ubi_err("error %d while reading %d bytes from PEB %d, "
+			"offset %d, read %d bytes",
+			err, len, pnum, offset, read);
+		ubi_kfree(buf);
+		return err;
+	}
+
+	err = ubi_buf_all_ff(buf, len);
+	if (unlikely(err == 0)) {
+		ubi_err("flash region at PEB %d, offset %d, length %d does "
+			"not contain all 0xFF bytes", pnum, offset, len);
+		goto fail;
+	}
+
+	ubi_kfree(buf);
+	return 0;
+
+fail:
+	ubi_msg("paranoid check failed for PEB %d", pnum);
+	ubi_msg("hex dump of the %d-%d region", offset, offset + len);
+	ubi_dbg_hexdump(buf, len);
+	dump_stack();
+	ubi_kfree(buf);
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_IO */
diff --git a/drivers/mtd/ubi/io.h b/drivers/mtd/ubi/io.h
new file mode 100644
index 0000000..aa8af48
--- /dev/null
+++ b/drivers/mtd/ubi/io.h
@@ -0,0 +1,347 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI input/output unit.
+ *
+ * This unit provides a uniform way to work with all kinds of the underlying
+ * MTD devices.
+ */
+
+#ifndef __UBI_IO_H__
+#define __UBI_IO_H__
+
+struct ubi_info;
+struct ubi_ec_hdr;
+struct ubi_vid_hdr;
+struct ubi_io_info;
+struct mtd_info;
+
+/**
+ * Physical eraseblock status returned by some functions of the I/O unit.
+ *
+ * @UBI_IO_PEB_EMPTY: the physical eraseblock is empty, i.e. it contains only
+ * %0xFF bytes
+ * @UBI_IO_PEB_FREE: the physical eraseblock is free, i.e. it only contains a
+ * valid erase counter header, and the rest are %0xFF bytes
+ * @UBI_IO_BAD_EC_HDR: the erase counter header is corrupted (bad magic or CRC)
+ * @UBI_IO_BAD_VID_HDR: the volume identifier header is corrupted (bad magic or
+ * CRC)
+ * @UBI_IO_BITFLIPS: bit-flips were detected and corrected
+ */
+enum {
+	UBI_IO_PEB_EMPTY = 1,
+	UBI_IO_PEB_FREE,
+	UBI_IO_BAD_EC_HDR,
+	UBI_IO_BAD_VID_HDR,
+	UBI_IO_BITFLIPS
+};
+
+/**
+ * ubi_io_read - read data from a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @buf: a buffer where to store the read data
+ * @pnum: the physical eraseblock number to read from
+ * @offset: the offset within the physical eraseblock from where to read
+ * @len: how many bytes to read
+ * @read: how many bytes were actually read is returned here
+ *
+ * This function reads data from offset @offset of physical eraseblock @pnum
+ * and stores the read data in the @buf buffer. The following are return codes:
+ *
+ * o %0 if all the requested data were successfully read;
+ * o %UBI_IO_BITFLIPS if all the requested data were successfully read, but
+ *   correctable bit-flips were detected;
+ * o %-EBADMSG if an ECC error occurred;
+ * o %-EIO if some I/O error occurred;
+ * o Other negative error codes in case of other errors.
+ *
+ * In any case, the number of read bytes is returned at @read. In case of an
+ * error, the read data does not have to be correct.
+ */
+int ubi_io_read(const struct ubi_info *ubi, void *buf, int pnum, int offset,
+		int len, int *read);
+
+/**
+ * ubi_io_read_data - read data from a physical eraseblock owned by a logical
+ * eraseblock.
+ *
+ * This function is equivalent to 'ubi_io_read()', but @offset is relative to
+ * the beginning of the logical eraseblock, not to the beginning of the
+ * physical eraseblock.
+ */
+#define ubi_io_read_data(ubi, buf, pnum, offset, len, read)  ({             \
+	int __err;                                                          \
+	ubi_assert((offset) >= 0);                                          \
+	__err = ubi_io_read(ubi, buf, pnum, (offset) + ubi->io->leb_start,  \
+			    len, read);                                     \
+	__err = __err;                                                      \
+})
+
+/**
+ * ubi_io_write - write data to a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @buf: the data to write
+ * @pnum: the physical eraseblock number to write to
+ * @offset: offset within the physical eraseblock where to write
+ * @len: how many bytes from @buf to write
+ * @written: how many bytes were actually written
+ *
+ * This function writes @len bytes of data from buffer @buf to offset @offset
+ * of physical eraseblock @pnum. If all the data were successfully written,
+ * zero is returned. If an error occurred, this function returns a negative
+ * error code and stores the number of written bytes at @written (but there is
+ * no guarantee they were written correctly). If %-EIO is returned, the
+ * physical eraseblock most probably went bad.
+ */
+int ubi_io_write(const struct ubi_info *ubi, const void *buf, int pnum,
+		 int offset, int len, int *written);
+
+/**
+ * ubi_io_write_data - write data to a physical eraseblock owned by a logical
+ * eraseblock.
+ *
+ * This function is equivalent to 'ubi_io_write()', but @offset is relative to
+ * the beginning of the logical eraseblock, not to the beginning of the
+ * physical eraseblock.
+ */
+#define ubi_io_write_data(ubi, buf, pnum, offset, len, written) ({          \
+	int __err;                                                          \
+	ubi_assert((offset) >= 0);                                          \
+	__err = ubi_io_write(ubi, buf, pnum, (offset) + ubi->io->leb_start, \
+			     len, written);                                 \
+	__err = __err;                                                      \
+})
+
+/**
+ * ubi_io_sync_erase - synchronously erase a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to erase
+ * @torture: if this physical eraseblock has to be tortured
+ *
+ * This function synchronously erases physical eraseblock @pnum. If @torture
+ * flag is not zero, the physical eraseblock is checked by means of writing
+ * different patterns and reading them back. If the torturing is enabled, the
+ * physical eraseblock is erased more then onece.
+ *
+ * This function returns the number of erasures made in case of success, %-EIO
+ * if eraseure failed or the torturing test failed, and other negative error
+ * codes in case of other errors. Note, %-EIO means that the physical
+ * eraseblock went bad.
+ */
+int ubi_io_sync_erase(const struct ubi_info *ubi, int pnum, int torture);
+
+/**
+ * ubi_io_is_bad - check if a physical eraseblock is bad.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to check
+ *
+ * This function returns a positive number if the physical eraseblock is bad,
+ * zero if not, and a negative error code if an error occurred.
+ */
+int ubi_io_is_bad(const struct ubi_info *ubi, int pnum);
+
+/**
+ * ubi_io_mark_bad - mark a physical eraseblock as bad.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to mark
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_io_mark_bad(const struct ubi_info *ubi, int pnum);
+
+/**
+ * ubi_io_read_ec_hdr - read and check an erase counter header.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock to read from
+ * @ec_hrd: a &struct ubi_ec_hdr object where to store the read erase counter
+ * header
+ * @verbose: be verbose in error-cases if non-zero
+ *
+ * This function reads the erase counter header from physical eraseblock @pnum
+ * and stores it in @ec_hdr. This function also checks CRC checksum of the read
+ * erase counter header. The following may be returned:
+ *
+ * o %0 if the CRC checksum is correct and the header was successfully read;
+ * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
+ *   and corrected by the flash driver;
+ * o %UBI_IO_BAD_EC_HDR if the erase counter header is corrupted due to a CRC
+ *   error;
+ * o %UBI_IO_PEB_EMPTY if the physical eraseblock is empty;
+ * o %-EIO if an input/output error occurred and this function failed to read
+ *   the erase counter header; this may indicate serious problems;
+ * o other negative values in case of other errors.
+ */
+int ubi_io_read_ec_hdr(const struct ubi_info *ubi, int pnum,
+		       struct ubi_ec_hdr *ec_hdr, int verbose);
+
+/**
+ * ubi_io_write_ec_hdr - write an erase counter header.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock to write to
+ * @ec_hdr: the erase counter header to write
+ *
+ * This function writes the erase counter header described by @ec_hdr to
+ * physical eraseblock @pnum. This function also fills some of the fields of
+ * @ec_hdrs before writing, so callers do not have to fill them. Callers
+ * must only fill the @ec_hdr->ec field.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. If %-EIO is returned, the physical eraseblock probably went
+ * bad.
+ */
+int ubi_io_write_ec_hdr(const struct ubi_info *ubi, int pnum,
+			struct ubi_ec_hdr *ec_hdr);
+
+/**
+ * ubi_io_read_vid_hdr - read and check a volume identifier header.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to read from
+ * @vid_hdr: the &struct ubi_vid_hdr object where to store the read volume
+ * identifier header
+ * @verbose: be verbose in errors printing if non-zero
+ *
+ * This function reads the volume identifier header from physical eraseblock
+ * @pnum and stores it in @vid_hdr. It also checks the CRC checksum of the read
+ * volume identifier header.
+ *
+ * o %0 if the CRC checksum is correct and the header was successfully read;
+ * o %UBI_IO_BITFLIPS if the CRC is correct, but bit-flips were detected
+ *   and corrected by the flash driver;
+ * o %UBI_IO_BAD_VID_HRD if the volume identifier header is corrupted - a CRC
+ *   error detected;
+ * o %UBI_IO_PEB_FREE if the physical eraseblock is free;
+ * o %-EIO if an input/output error occurred and this function failed to read
+ *   the erase counter header; this may indicate serious problems;
+ * o other negative values in case of other errors.
+ */
+int ubi_io_read_vid_hdr(const struct ubi_info *ubi, int pnum,
+			struct ubi_vid_hdr *vid_hdr, int verbose);
+
+/**
+ * ubi_io_write_vid_hdr - write a volume identifier header.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to write to
+ * @vid_hdr: the contents of the volume identifier header
+ *
+ * This function writes the volume identifier header described by @vid_hdr to
+ * physical eraseblock @pnum. Callers do not have to fill all the fields of the
+ * passed volume identifier header object as this function fills many of them
+ * automatically. Callers have to only fill @vid_hdr->vol_type,
+ * @vid_hdr->leb_ver, @vid_hdr->vol_id, @vid_hdr->lnum, @vid_hdr->compat,
+ * @vid_hdr->data_size, @vid_hdr->used_ebs, @vid_hdr->ivol_data, and
+ * @vid_hdr->data_pad fields.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. If %-EIO is returned, the physical eraseblock probably went
+ * bad.
+ */
+int ubi_io_write_vid_hdr(const struct ubi_info *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdr);
+
+/**
+ * ubi_io_init - initialize the UBI I/O unit for a given UBI device.
+ *
+ * @ubi: the UBI device description object
+ * @mtd_num: the underlying MTD device number
+ * @vid_hdr_offset: volume identifier headers offset
+ * @data_offset: logical eraseblock data offset
+ *
+ * If the @vid_hdr_offset and @data_offset parameters are zero, the default
+ * offsets are assumed, otherwise these ones are used. This function returns
+ * zero in case of success and a negative error code in case of failure.
+ */
+int ubi_io_init(struct ubi_info *ubi, int mtd_num, int vid_hdr_offset,
+		int data_offset);
+
+/**
+ * ubi_io_close - close the UBI I/O unit for a given UBI device.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_io_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_io_info - UBI I/O units description data structure.
+ *
+ * @flash_size: the underlying MTD device size (in bytes)
+ * @peb_count: count of physical eraseblocks on the MTD device
+ * @peb_size: physical eraseblock size
+ * @bad_peb_count: number of bad physical eraseblocks
+ * @good_peb_count: number of good physical eraseblocks
+ * @min_io_size: the minimal input/output unit size of the underlying MTD
+ * device
+ * @ro_mode: if the UBI device is in read-only mode
+ * @leb_size: logical eraseblock size
+ * @leb_start: starting offset of logical eraseblocks within physical
+ * eraseblocks
+ * @ec_hdr_alsize: size of the erase counter header aligned to the minimal flash
+ * I/O unit
+ * @vid_hdr_alsize: size of the volume identifier header aligned to the minimal
+ * flash I/O unit
+ * @vid_hdr_offset: starting offset of volume identifier headers (might be
+ * unaligned)
+ * @vid_hdr_aloffset: aligned starting offset of volume identifier headers
+ * @vid_hdr_shift: contains @vid_hdr_offset - @vid_hdr_aloffset
+ * @bad_allowed: whether the underlying MTD device admits of bad physical
+ * eraseblocks or not
+ * @mtd_num: the underlying MTD device number
+ * @mtd_name: the underlying MTD device name
+ * @mtd: the underlying MTD device descriptor
+ *
+ * The erase counter header is always stored at offset zero. By default, the
+ * VID header is stored after the EC header at the closest aligned offset
+ * (note, aligned means aligned to the minimum I/O unit in this context). Data
+ * starts next to the VID header at the closest aligned offset. But for
+ * different reasons, UBI may be asked to put the VID header at another offset,
+ * and even at an unaligned offset.
+ */
+struct ubi_io_info {
+	long long flash_size;  /* public  */
+	int peb_count;         /* public  */
+	int peb_size;          /* public  */
+	int bad_peb_count;     /* public  */
+	int good_peb_count;    /* public  */
+	int min_io_size;       /* public  */
+	int ro_mode;           /* public  */
+	int leb_size;          /* public  */
+	int leb_start;         /* public  */
+	int ec_hdr_alsize;     /* public  */
+	int vid_hdr_alsize;    /* public  */
+	int vid_hdr_offset;    /* public  */
+	int vid_hdr_aloffset;  /* public  */
+	int vid_hdr_shift;     /* public  */
+	int bad_allowed;       /* public  */
+	int mtd_num;           /* public  */
+	const char *mtd_name;  /* public  */
+	struct mtd_info *mtd;  /* private */
+};
+
+#endif /* !__UBI_IO_H__ */
diff --git a/drivers/mtd/ubi/ivol.c b/drivers/mtd/ubi/ivol.c
new file mode 100644
index 0000000..307fbb9
--- /dev/null
+++ b/drivers/mtd/ubi/ivol.c
@@ -0,0 +1,122 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "scan.h"
+#include "debug.h"
+#include "alloc.h"
+#include "vtbl.h"
+#include "dtbl.h"
+#include "io.h"
+#include "ivol.h"
+#include "account.h"
+
+const struct ubi_vtbl_vtr *ubi_ivol_get_vtr(const struct ubi_info *ubi,
+					    int vol_id)
+{
+	const struct ubi_ivol_info *ivol = ubi->ivol;
+
+	ubi_assert(ubi_is_ivol(vol_id));
+	return &ivol->ivol_vtrs[vol_id - UBI_INTERNAL_VOL_START];
+}
+
+const struct ubi_dtbl_dtr *ubi_ivol_get_dtr(const struct ubi_info *ubi,
+					    int vol_id)
+{
+	const struct ubi_ivol_info *ivol = ubi->ivol;
+
+	ubi_assert(ubi_is_ivol(vol_id));
+	return &ivol->ivol_dtrs[vol_id - UBI_INTERNAL_VOL_START];
+}
+
+int ubi_ivol_get_compat(const struct ubi_info *ubi, int vol_id)
+{
+	if (!ubi_is_ivol(vol_id)) {
+		ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
+		return 0;
+	}
+
+	switch (vol_id) {
+		case UBI_LAYOUT_VOL_ID:
+			return UBI_LAYOUT_VOLUME_COMPAT;
+		case UBI_UPDATE_VOL_ID:
+			return UBI_UPDATE_VOLUME_COMPAT;
+		default:
+			BUG();
+	}
+
+	return -ENODEV;
+}
+
+int ubi_ivol_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	struct ubi_vtbl_vtr *vtr;
+	struct ubi_dtbl_dtr *dtr;
+	struct ubi_ivol_info *ivol;
+	const struct ubi_io_info *io = ubi->io;
+
+	ivol = ubi_kzalloc(sizeof(struct ubi_ivol_info), GFP_KERNEL);
+	if (!ivol)
+		return -ENOMEM;
+	ubi->ivol = ivol;
+
+	/* The layout volume */
+	vtr = &ivol->ivol_vtrs[0];
+	vtr->reserved_pebs = UBI_LAYOUT_VOLUME_EBS;
+	vtr->alignment = 1;
+	vtr->data_pad = 0;
+	vtr->vol_type = UBI_DYNAMIC_VOLUME;
+	vtr->name_len = sizeof(UBI_LAYOUT_VOLUME_NAME) - 1;
+	vtr->name = UBI_LAYOUT_VOLUME_NAME;
+	vtr->usable_leb_size = io->leb_size;
+
+	dtr = &ivol->ivol_dtrs[0];
+	dtr->used_ebs = vtr->reserved_pebs;
+	dtr->last_eb_bytes = vtr->reserved_pebs;
+	dtr->used_bytes = dtr->used_ebs * (io->leb_size - vtr->data_pad);
+	dtr->corrupted = 0;
+
+	/* The update volume */
+	vtr = &ivol->ivol_vtrs[1];
+	vtr->reserved_pebs = UBI_UPDATE_VOLUME_EBS;
+	vtr->alignment = 1;
+	vtr->data_pad = 0;
+	vtr->vol_type = UBI_DYNAMIC_VOLUME;
+	vtr->name_len = sizeof(UBI_UPDATE_VOLUME_NAME) - 1;
+	vtr->name = UBI_UPDATE_VOLUME_NAME;
+	vtr->usable_leb_size = io->leb_size;
+
+	dtr = &ivol->ivol_dtrs[1];
+	dtr->used_ebs = vtr->reserved_pebs;
+	dtr->last_eb_bytes = vtr->reserved_pebs;
+	dtr->used_bytes = dtr->used_ebs * (io->leb_size - vtr->data_pad);
+	dtr->corrupted = 0;
+
+	return 0;
+}
+
+void ubi_ivol_close(const struct ubi_info *ubi)
+{
+	ubi_kfree(ubi->ivol);
+}
diff --git a/drivers/mtd/ubi/ivol.h b/drivers/mtd/ubi/ivol.h
new file mode 100644
index 0000000..9707062
--- /dev/null
+++ b/drivers/mtd/ubi/ivol.h
@@ -0,0 +1,132 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * Internal volume management unit.
+ *
+ * This unit provides information about internal volumes (this information is
+ * not stored on flash on flash).
+ */
+
+#ifndef __UBI_IVOL_H__
+#define __UBI_IVOL_H__
+
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "vtbl.h"
+#include "dtbl.h"
+
+struct ubi_info;
+struct ubi_scan_info;
+
+/**
+ * ubi_ivol_get_vtr - get volume table record of an internal volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the requested volume ID
+ *
+ * This function returns a pointer to the volume tabe record. The @vol_id must
+ * be correct.
+ */
+const struct ubi_vtbl_vtr *ubi_ivol_get_vtr(const struct ubi_info *ubi,
+					    int vol_id);
+
+/**
+ * ubi_ivol_get_dtr - get data table record of an internal volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the requested volume ID
+ *
+ * This function returns a pointer to the data table record. The @vol_id must be
+ * correct.
+ */
+const struct ubi_dtbl_dtr *ubi_ivol_get_dtr(const struct ubi_info *ubi,
+					    int vol_id);
+
+/**
+ * ubi_ivol_get_compat - get compatibility flags of a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: volume ID
+ *
+ * This function returns compatibility flags of volumes. User volumes have no
+ * compatibility flags, so %0 is returned. The @vol_id must be correct.
+ */
+int ubi_ivol_get_compat(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_ivol_init_scan - initialize the internal volume management unit
+ * using scanning information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_ivol_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_ivol_close - close the internal volume management unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_ivol_close(const struct ubi_info *ubi);
+
+/**
+ * ubi_is_ivol - test if a volume is internal volume.
+ *
+ * @vol_id: ID of the volume to test.
+ *
+ * If the volume is internal volume, %1 is returned, otherwise %0 is returned.
+ */
+static inline int ubi_is_ivol(int vol_id)
+{
+	return vol_id >= UBI_INTERNAL_VOL_START &&
+	    vol_id < UBI_INTERNAL_VOL_START + UBI_INT_VOL_COUNT;
+}
+
+/*
+ * ubi_ivol_is_known - check if this is a known internal volume.
+ *
+ * @vol_id: ID of the volume to check.
+ *
+ * This function returns non-zero if this is a supported internal volume and
+ * non-zero if not.
+ */
+static inline int ubi_ivol_is_known(int vol_id)
+{
+	return vol_id == UBI_LAYOUT_VOL_ID || vol_id == UBI_UPDATE_VOL_ID;
+}
+
+/**
+ * struct ubi_ivol_info - internal volume management unit description data
+ * structure.
+ *
+ * @ivol_vtrs: volume table records correspondind to internal volumes
+ * @ivol_dtrs: data table records correspondind to internal volumes
+ */
+struct ubi_ivol_info {
+	struct ubi_vtbl_vtr ivol_vtrs[UBI_INT_VOL_COUNT]; /* private */
+	struct ubi_dtbl_dtr ivol_dtrs[UBI_INT_VOL_COUNT]; /* private */
+};
+
+#endif /* !__UBI_IVOL_H__ */
+
diff --git a/drivers/mtd/ubi/misc.h b/drivers/mtd/ubi/misc.h
new file mode 100644
index 0000000..d9830b9
--- /dev/null
+++ b/drivers/mtd/ubi/misc.h
@@ -0,0 +1,136 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#ifndef __UBI_MISC_H__
+#define __UBI_MISC_H__
+
+#include <linux/string.h>
+#include <linux/rbtree.h>
+#include "alloc.h"
+#include "debug.h"
+
+#define xquotise(s) #s
+#define quotise(s) xquotise(s)
+
+/**
+ * rb_for_each_entry - walk an RB-tree.
+ *
+ * @rb: a pointer to type 'struct rb_node' to to use as a loop counter
+ * @pos: a pointer to RB-tree entry type to use as a loop counter
+ * @root: RB-tree's root
+ * @member: the name of the 'struct rb_node' within the RB-tree entry
+ */
+#define rb_for_each_entry(rb, pos, root, member)                             \
+	for (rb = rb_first(root),                                            \
+	     pos = (rb ? container_of(rb, typeof(*pos), member) : NULL);     \
+	     rb;                                                             \
+	     rb = rb_next(rb), pos = container_of(rb, typeof(*pos), member))
+
+/**
+ * ubi_buf_all_ff - check if buffer contains only 0xFF bytes.
+ *
+ * @buf: buffer to check
+ * @size: buffer size in bytes
+ *
+ * This function returns non-zero in there are only 0xFF bytes in @buf, and
+ * zero if something else was also found.
+ */
+static inline int ubi_buf_all_ff(const void *buf, size_t size)
+{
+	int i;
+
+	for (i = 0; i < size / sizeof(unsigned int); i++)
+		if (((const unsigned int *)buf)[i] != ~((unsigned int)0))
+			return 0;
+
+	for (i = i; i < size; i++)
+		if (((const uint8_t *) buf)[i] != 0xFF)
+			return 0;
+
+	return 1;
+}
+
+/**
+ * ubi_buf_all_zeroes - check if buffer contains only zeroes.
+ *
+ * @buf: buffer to check
+ * @size: buffer size in bytes
+ *
+ * This function returns non-zero in there are only 0 bytes in @buf, and
+ * zero if something else was also found.
+ */
+static inline int ubi_buf_all_zeroes(const void *buf, size_t size)
+{
+	int i;
+
+	for (i = 0; i < size / sizeof(unsigned int); i++)
+		if (((const unsigned int *)buf)[i] != 0)
+			return 0;
+
+	for (i = i; i < size; i++)
+		if (((const uint8_t *) buf)[i] != '\0')
+			return 0;
+
+	return 1;
+}
+
+/**
+ * ubi_buf_all_ff - check if buffer contains only a certain byte pattern.
+ *
+ * @buf: buffer to check
+ * @patt: the pattern to check
+ * @size: buffer size in bytes
+ *
+ * This function returns non-zero in there are only @patt bytes in @buf, and
+ * zero if something else was also found.
+ */
+static inline int ubi_check_pattern(const void *buf, uint8_t patt, size_t size)
+{
+	int i;
+
+	for (i = 0; i < size; i++)
+		if (((const uint8_t *)buf)[i] != patt)
+			return 0;
+	return 1;
+}
+
+/**
+ * strdup_len - duplacate a string.
+ *
+ * @str: original string
+ * @len: the length of the string
+ */
+static inline char *strdup_len(const char *str, int len)
+{
+	char *dup;
+
+	ubi_assert(strnlen(str, len + 1) == len);
+
+	dup = ubi_kmalloc(len + 1, GFP_KERNEL);
+	if (!dup)
+		return NULL;
+
+	memcpy(dup, str, len);
+	dup[len] = '\0';
+
+	return dup;
+}
+
+#endif /* !__UBI_MISC_H__ */
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
new file mode 100644
index 0000000..cc0b6a3
--- /dev/null
+++ b/drivers/mtd/ubi/scan.c
@@ -0,0 +1,1468 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/list.h>
+#include <linux/rbtree.h>
+#include <linux/err.h>
+#include <linux/crc32.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "scan.h"
+#include "io.h"
+#include "misc.h"
+#include "ivol.h"
+#include "debug.h"
+
+static int vid_hdr_sanity_check(const struct ubi_info *ubi,
+				const struct ubi_vid_hdr *vid_hdr,
+				const struct ubi_scan_volume *sv, int pnum);
+
+static int add_to_erase(const struct ubi_info *ubi, struct ubi_scan_info *si,
+			int pnum, int ec);
+
+static int add_volume(const struct ubi_info *ubi, struct ubi_scan_info *si,
+		      int vol_id, int pnum, const struct ubi_vid_hdr *vid_hdr,
+		      struct ubi_scan_volume **vol_info);
+
+static int compare_lebs(const struct ubi_info *ubi,
+			const struct ubi_scan_leb *seb, int pnum,
+			const struct ubi_vid_hdr *vid_hdr);
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_SCAN
+static int paranoid_check_si(const struct ubi_info *ubi,
+			     struct ubi_scan_info *si);
+#else
+#define paranoid_check_si(ubi, si) 0
+#endif
+
+int ubi_scan_add_volume(const struct ubi_info *ubi, struct ubi_scan_info *si,
+			int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
+			int bitflips)
+{
+	int err, vol_id, lnum;
+	uint32_t leb_ver;
+	struct ubi_scan_volume *sv;
+	struct ubi_scan_leb *seb;
+	struct rb_node **p, *parent = NULL;
+
+	vol_id = ubi32_to_cpu(vid_hdr->vol_id);
+	lnum = ubi32_to_cpu(vid_hdr->lnum);
+	leb_ver = ubi32_to_cpu(vid_hdr->leb_ver);
+
+	dbg_scan("PEB %d, LEB %d, volume ID %d, EC %d, LEB ver %u, bitflips %d",
+		 pnum, lnum, vol_id, ec, leb_ver, bitflips);
+
+	err = add_volume(ubi, si, vol_id, pnum, vid_hdr, &sv);
+	if (unlikely(err) < 0)
+		return err;
+	else if (unlikely(err > 0)) {
+		/* Data CRC failed, drop this physical eraseblock */
+		return add_to_erase(ubi, si, pnum, ec);
+	}
+
+	/*
+	 * Walk the RB-tree of logical eraseblocks of volume @volume ID to look
+	 * if this is the first instance of this logical eraseblock or not.
+	 */
+	p = &sv->root.rb_node;
+	while (*p) {
+		int cmp_res;
+
+		parent = *p;
+		seb = rb_entry(parent, struct ubi_scan_leb, rb);
+
+		if (lnum != seb->lnum) {
+			if (lnum < seb->lnum)
+				p = &(*p)->rb_left;
+			else
+				p = &(*p)->rb_right;
+			continue;
+		}
+
+		/*
+		 * There is already a logical eraseblock with this logical
+		 * eraseblock number present.
+		 */
+
+		dbg_scan("this LEB already exists: PEB %d, LEB ver %u, EC %d",
+			 seb->pnum, seb->leb_ver, seb->ec);
+
+		/*
+		 * Make sure that the logical eraseblocks have different
+		 * versions. Otherwise the image is bad.
+		 */
+		if (unlikely(seb->leb_ver == leb_ver)) {
+			ubi_err("two LEBs with same version %u", leb_ver);
+			ubi_msg("the first one (PEB %d):", seb->pnum);
+			ubi_dbg_dump_seb(seb, 0);
+			ubi_msg("the second one (PEB %d):", pnum);
+			ubi_dbg_dump_vid_hdr(vid_hdr);
+			return -EINVAL;
+		}
+
+		/*
+		 * Now we have to drop the older one and get the newer
+		 * one.
+		 */
+		cmp_res = compare_lebs(ubi, seb, pnum, vid_hdr);
+		if (unlikely(cmp_res < 0))
+			return cmp_res;
+
+		if (cmp_res) {
+			/*
+			 * This logical eraseblock is newer then the one we
+			 * found earlier.
+			 */
+			err = vid_hdr_sanity_check(ubi, vid_hdr, sv,
+						   pnum);
+			if (unlikely(err))
+				return err;
+
+			err = add_to_erase(ubi, si, seb->pnum, seb->ec);
+			if (unlikely(err))
+				return err;
+
+			seb->ec = ec;
+			seb->pnum = pnum;
+			seb->leb_ver = leb_ver;
+			seb->scrub = cmp_res == 2 ? 1 : 0;
+			seb->scrub = bitflips;
+
+			if (sv->highest_lnum == lnum)
+				sv->last_data_size =
+					ubi32_to_cpu(vid_hdr->data_size);
+
+			return 0;
+		} else
+			/* This logical eraseblock is old, wipe it */
+			return add_to_erase(ubi, si, pnum, ec);
+	}
+
+	/*
+	 * We've met this logical eraseblock for the first time, add it to the
+	 * scanning information.
+	 */
+
+	err = vid_hdr_sanity_check(ubi, vid_hdr, sv, pnum);
+	if (unlikely(err))
+		return err;
+
+	seb = ubi_alloc_scan_leb();
+	if (unlikely(!seb))
+		return -ENOMEM;
+
+	seb->ec = ec;
+	seb->pnum = pnum;
+	seb->lnum = lnum;
+	seb->leb_ver = leb_ver;
+	seb->scrub = bitflips;
+
+	if (sv->highest_lnum <= lnum) {
+		sv->highest_lnum = lnum;
+		sv->last_data_size = ubi32_to_cpu(vid_hdr->data_size);
+	}
+
+	sv->leb_count += 1;
+	rb_link_node(&seb->rb, parent, p);
+	rb_insert_color(&seb->rb, &sv->root);
+	return 0;
+}
+
+int ubi_scan_add_to_corrupted(struct ubi_scan_info *si, int pnum, int ec)
+{
+	struct ubi_scan_leb *seb;
+
+	dbg_scan("PEB %d (EC %d) is corrupted", pnum, ec);
+
+	seb = ubi_alloc_scan_leb();
+	if (unlikely(!seb))
+		return -ENOMEM;
+
+	seb->pnum = pnum;
+	seb->ec = ec;
+	list_add_tail(&seb->list, &si->corr);
+	return 0;
+}
+
+struct ubi_scan_volume *ubi_scan_get_scan_volume(const struct ubi_scan_info *si,
+						 int vol_id)
+{
+	struct ubi_scan_volume *sv;
+	struct rb_node *p = si->volumes.rb_node;
+
+	while (p) {
+		sv = rb_entry(p, struct ubi_scan_volume, rb);
+
+		if (vol_id == sv->vol_id)
+			return sv;
+
+		if (vol_id > sv->vol_id)
+			p = p->rb_left;
+		else
+			p = p->rb_right;
+	}
+
+	return NULL;
+}
+
+struct ubi_scan_leb *ubi_scan_get_scan_leb(const struct ubi_scan_volume *sv,
+					   int lnum)
+{
+	struct ubi_scan_leb *seb;
+	struct rb_node *p = sv->root.rb_node;
+
+	while (p) {
+		seb = rb_entry(p, struct ubi_scan_leb, rb);
+
+		if (lnum == seb->lnum)
+			return seb;
+
+		if (lnum > seb->lnum)
+			p = p->rb_left;
+		else
+			p = p->rb_right;
+	}
+
+	return NULL;
+}
+
+static int process_eb(const struct ubi_info *ubi, struct ubi_scan_info *si,
+		      int pnum);
+static void commit_to_mean_value(struct ubi_scan_info *si);
+
+/*
+ * Temporary variables used during scanning.
+ */
+static struct ubi_ec_hdr *ec_hdr;
+static struct ubi_vid_hdr *vid_hdr;
+
+int ubi_scan(struct ubi_info *ubi, struct ubi_scan_info **info)
+{
+	int err, pnum;
+	struct rb_node *rb1, *rb2;
+	struct ubi_scan_volume *sv;
+	struct ubi_scan_leb *seb;
+	struct ubi_scan_info *si;
+	struct ubi_io_info *io = ubi->io;
+
+	*info = NULL;
+
+	si = ubi_kzalloc(sizeof(struct ubi_scan_info), GFP_KERNEL);
+	if (!si)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&si->corr);
+	INIT_LIST_HEAD(&si->free);
+	INIT_LIST_HEAD(&si->erase);
+	INIT_LIST_HEAD(&si->alien);
+	si->volumes = RB_ROOT;
+	si->is_empty = 1;
+
+	err = -ENOMEM;
+	ec_hdr = ubi_alloc_ec_hdr(ubi);
+	if (!ec_hdr)
+		goto out_si;
+
+	vid_hdr = ubi_alloc_vid_hdr(ubi);
+	if (!vid_hdr)
+		goto out_ec_hdr;
+
+	for (pnum = 0; pnum < io->peb_count; pnum++) {
+		cond_resched();
+
+		err = process_eb(ubi, si, pnum);
+		if (unlikely(err < 0))
+			goto out_vid_hdr;
+
+		if (err != UBI_IO_PEB_EMPTY)
+			si->is_empty = 0;
+	}
+
+	/* Finish mean erase counter calculations */
+	if (si->ec_count)
+		commit_to_mean_value(si);
+
+	/*
+	 * FIXME: this is actually duty of the I/O unit to initialize this, but
+	 * MTD does not provide enough information.
+	 */
+	io->bad_peb_count = si->bad_peb_count;
+	io->good_peb_count = io->peb_count - io->bad_peb_count;
+
+	*info = si;
+
+	if (si->is_empty)
+		ubi_msg("empty MTD device detected");
+
+	/*
+	 * In case of unknown erase counter we use the mean erase counter
+	 * value.
+	 */
+	rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+		cond_resched();
+		rb_for_each_entry(rb2, seb, &sv->root, rb)
+			if (seb->ec == -1)
+				seb->ec = si->mean_ec;
+	}
+
+	cond_resched();
+	list_for_each_entry(seb, &si->free, list)
+		if (seb->ec == -1)
+			seb->ec = si->mean_ec;
+
+	cond_resched();
+	list_for_each_entry(seb, &si->corr, list)
+		if (seb->ec == -1)
+			seb->ec = si->mean_ec;
+
+	cond_resched();
+	list_for_each_entry(seb, &si->erase, list)
+		if (seb->ec == -1)
+			seb->ec = si->mean_ec;
+
+	err = paranoid_check_si(ubi, si);
+	if (err > 0) {
+		err = -EINVAL;
+		goto out_vid_hdr;
+	}
+
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	return err;
+
+out_vid_hdr:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+out_ec_hdr:
+	ubi_free_ec_hdr(ubi, ec_hdr);
+out_si:
+	ubi_scan_destroy_si(si);
+	return err;
+}
+
+void ubi_scan_rm_volume(const struct ubi_info *ubi, struct ubi_scan_info *si,
+			struct ubi_scan_volume *sv)
+{
+	struct rb_node *rb;
+	struct ubi_scan_leb *seb;
+
+	dbg_scan("remove scanning information about volume %d", sv->vol_id);
+
+	while ((rb = rb_first(&sv->root))) {
+		cond_resched();
+
+		seb = rb_entry(rb, struct ubi_scan_leb, rb);
+
+		/* The physical eraseblock will be erased later */
+		rb_erase(&seb->rb, &sv->root);
+		list_add_tail(&seb->list, &si->erase);
+	}
+
+	rb_erase(&sv->rb, &si->volumes);
+	ubi_free_scan_volume(sv);
+	si->vols_found -= 1;
+}
+
+int ubi_scan_early_erase_peb(const struct ubi_info *ubi,
+			     const struct ubi_scan_info *si, int pnum, int ec)
+{
+	int err;
+	struct ubi_ec_hdr *ec_hdr;
+
+	ec_hdr = ubi_alloc_ec_hdr(ubi);
+	if (!ec_hdr)
+		return -ENOMEM;
+
+	if (unlikely(ec >= UBI_MAX_ERASECOUNTER)) {
+		/*
+		 * Erase counter overflow. Upgrade UBI and use 64-bit
+		 * erase counters internally.
+		 */
+		ubi_err("erase counter overflow at PEB %d, EC %d",
+			pnum, ec);
+		return -EINVAL;
+	}
+
+	ec_hdr->ec = cpu_to_ubi64(ec);
+
+	err = ubi_io_sync_erase(ubi, pnum, 0);
+	if (unlikely(err < 0))
+		goto out_free;
+
+	err = ubi_io_write_ec_hdr(ubi, pnum, ec_hdr);
+
+out_free:
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	return err;
+}
+
+struct ubi_scan_leb *ubi_scan_get_free_peb(const struct ubi_info *ubi,
+					   struct ubi_scan_info *si)
+{
+	int err = 0, i;
+	struct ubi_scan_leb *seb;
+
+	if (!list_empty(&si->free)) {
+		seb = list_entry(si->free.next, struct ubi_scan_leb,
+				 list);
+		list_del(&seb->list);
+		return seb;
+	}
+
+	if (unlikely(list_empty(&si->erase) && list_empty(&si->corr))) {
+		ubi_err("no vacant eraseblocks found");
+		return ERR_PTR(-ENOSPC);
+	}
+
+	for (i = 0; i < 2; i++) {
+		struct list_head *head;
+		struct ubi_scan_leb *tmp_seb;
+
+		if (i == 0)
+			head = &si->erase;
+		else
+			head = &si->corr;
+
+		/*
+		 * We try to erase the first physical eraseblock from the @head
+		 * listand pick it if we succeed, or try to erase the
+		 * next one if not. And so forth. We don't want to take care
+		 * about bad eraseblocks here - they'll be handled later.
+		 */
+		list_for_each_entry_safe(seb, tmp_seb, head, list) {
+			cond_resched();
+
+			if (seb->ec == -1)
+				seb->ec = si->mean_ec;
+
+			err = ubi_scan_early_erase_peb(ubi, si, seb->pnum,
+						       seb->ec);
+			if (unlikely(err))
+				continue;
+
+			list_del(&seb->list);
+			dbg_scan("return PEB %d, EC %d", seb->pnum, seb->ec);
+			return seb;
+		}
+	}
+
+	return ERR_PTR(err ? err : -ENOSPC);
+}
+
+/**
+ * add_to_alien - add a physical eraseblock to the @si->alien list.
+ *
+ * @si: a pointer to the scanning information
+ * @pnum: the physical eraseblock number
+ *
+ * This function returns zero in case of success and a negative error
+ * code in case of failure.
+ */
+static int add_to_alien(struct ubi_scan_info *si, int pnum)
+{
+	struct ubi_scan_leb *seb;
+
+	dbg_scan("PEB %d is alien", pnum);
+
+	seb = ubi_alloc_scan_leb();
+	if (unlikely(!seb))
+		return -ENOMEM;
+
+	seb->pnum = pnum;
+	list_add_tail(&seb->list, &si->alien);
+	return 0;
+}
+
+/**
+ * add_volume - add a volume tho the scanning information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ * @vol_id: ID of the volume to add
+ * @pnum: physical eraseblock number
+ * @vid_hdr: volume identifier header
+ * @vol_info: a pointer to the corresponding volume scanning information is
+ * returned here.
+ *
+ * If the volume corresponding to the @vid_hdr logical eraseblock is already
+ * present in the scanning information, this function does nothing and just
+ * returns. This function returns zero in case of success and a negative error
+ * code in case of failure.
+ */
+static int add_volume(const struct ubi_info *ubi, struct ubi_scan_info *si,
+		      int vol_id, int pnum, const struct ubi_vid_hdr *vid_hdr,
+		      struct ubi_scan_volume **vol_info)
+{
+	int ret = 0;
+	struct ubi_scan_volume *sv;
+	struct rb_node **p = &si->volumes.rb_node, *parent = NULL;
+
+	ubi_assert(vol_id == ubi32_to_cpu(vid_hdr->vol_id));
+
+	/*
+	 * Walk the volume RB-tree to look if a volume @vol_id is already
+	 * present there.
+	 */
+	while (*p) {
+		parent = *p;
+		sv = rb_entry(parent, struct ubi_scan_volume, rb);
+
+		if (vol_id == sv->vol_id) {
+			*vol_info = sv;
+			return 0;
+		}
+
+		if (vol_id > sv->vol_id)
+			p = &(*p)->rb_left;
+		else
+			p = &(*p)->rb_right;
+	}
+
+	/*
+	 * The volume is absent, we have to add it. But before this, we have to
+	 * check data CRC of this logical eraseblock.
+	 */
+	if (vid_hdr->copy_flag) {
+		int len, read, err;
+		void *buf;
+		uint32_t data_crc, crc;
+
+		len = ubi32_to_cpu(vid_hdr->data_size);
+		buf = ubi_kmalloc(len, GFP_KERNEL);
+		if (unlikely(!buf))
+			return -ENOMEM;
+
+		err = ubi_io_read_data(ubi, buf, pnum, 0, len, &read);
+		if (unlikely(read != len)) {
+			ubi_kfree(buf);
+			return err;
+		}
+
+		data_crc = ubi32_to_cpu(vid_hdr->data_crc);
+		crc = crc32(UBI_CRC32_INIT, buf, len);
+		if (unlikely(crc != data_crc)) {
+			dbg_scan("PEB %d CRC error: calculated %#08x, must be %#08x",
+				 pnum, crc, data_crc);
+			ubi_kfree(buf);
+			return 1;
+		}
+		ubi_kfree(buf);
+	}
+
+	sv = ubi_alloc_scan_volume();
+	if (unlikely(!sv))
+		return -ENOMEM;
+	*vol_info = sv;
+
+	sv->highest_lnum = sv->leb_count = 0;
+	sv->vol_id = vol_id;
+	sv->root = RB_ROOT;
+	sv->used_ebs = ubi32_to_cpu(vid_hdr->used_ebs);
+	sv->data_pad = ubi32_to_cpu(vid_hdr->data_pad);
+	sv->compat = vid_hdr->compat;
+	sv->vol_type = vid_hdr->vol_type == UBI_VID_DYNAMIC ? UBI_DYNAMIC_VOLUME
+							    : UBI_STATIC_VOLUME;
+	if (vol_id > si->highest_vol_id)
+		si->highest_vol_id = vol_id;
+
+	rb_link_node(&sv->rb, parent, p);
+	rb_insert_color(&sv->rb, &si->volumes);
+	si->vols_found += 1;
+	dbg_scan("added volume %d", vol_id);
+	return ret;
+}
+
+/**
+ * compare_lebs - find out which logical eraseblock is newer.
+ *
+ * @ubi: the UBI device description object
+ * @seb: the first logical eraseblock to compare
+ * @pnum: the physical eraseblock number of the second logical eraseblock to
+ * compare
+ * @vid_hdr: the volume identifier header of the second logical eraseblock
+ *
+ * This function returns zero if the first logical eraseblock (described by
+ * @seb) is newer then the second logical eraseblock (described by @pnum and
+ * @vid_hdr), %1 if the second is newer, and %2 id the second is newer, but
+ * needs scrubbing. In case of failure, a negative error code is returned.
+ */
+static int compare_lebs(const struct ubi_info *ubi,
+			const struct ubi_scan_leb *seb, int pnum,
+			const struct ubi_vid_hdr *vid_hdr)
+{
+	void *buf;
+	int err, ret, read, len;
+	uint32_t data_crc, crc;
+	uint32_t leb_ver = ubi32_to_cpu(vid_hdr->leb_ver);
+	long long abs, v1 = seb->leb_ver, v2 = leb_ver;
+
+	/*
+	 * UBI constantly increases the logical eraseblock version number and
+	 * it can overflow. Thus, we have to bear in mind that versions that
+	 * are close to %0xFFFFFFFF are less then versions that are close to
+	 * %0.
+	 *
+	 * The UBI WL unit guarantees that the number of pending tasks is not
+	 * greater then %0x7FFFFFFF. So, if the difference between any two
+	 * versions is greater or equivalent to %0x7FFFFFFF, there was an
+	 * overflow and the logical eraseblock with lower version is actually
+	 * newer then the one with higher version.
+	 */
+
+
+	abs = v1 - v2;
+	if (abs < 0)
+		abs = -abs;
+
+	if (abs < 0x7FFFFFFF) {
+		/* Non-overflow situation */
+		if (seb->leb_ver > leb_ver)
+			return 0;
+		if (!vid_hdr->copy_flag)
+			return 1;
+	} else {
+		if (seb->leb_ver > leb_ver)
+			return 1;
+		if (!vid_hdr->copy_flag)
+			return 0;
+	}
+
+	/* OK, the second LEB is newer */
+
+	if (!vid_hdr->copy_flag)
+		return 1;
+
+	/*
+	 * The second logical eraseblock has 'copy_flag' set which means that
+	 * it was moved by the wear-leveling unit. We have to check its data
+	 * CRC to ensure the copy process was not interrupted and the logical
+	 * eraseblock was copied fully.
+	 */
+
+	len = ubi32_to_cpu(vid_hdr->data_size);
+	buf = ubi_kmalloc(len, GFP_KERNEL);
+	if (unlikely(!buf))
+		return -ENOMEM;
+
+	err = ubi_io_read_data(ubi, buf, pnum, 0, len, &read);
+	if (unlikely(read != len)) {
+		ubi_kfree(buf);
+		return err;
+	}
+
+	data_crc = ubi32_to_cpu(vid_hdr->data_crc);
+	crc = crc32(UBI_CRC32_INIT, buf, len);
+	if (unlikely(crc != data_crc)) {
+		dbg_scan("PEB %d CRC error: calculated %#08x, must be %#08x",
+			 pnum, crc, data_crc);
+		ret = 0;
+	} else
+		ret = err == UBI_IO_BITFLIPS ? 2 : 1;
+	dbg_scan("PEB %d CRC is OK", pnum);
+	ubi_kfree(buf);
+	return ret;
+}
+
+/**
+ * add_to_erase - add a physical eraseblock to the list of physical eraseblocks
+ * which have to be erased.
+ *
+ * @si: a pointer to the scanning information
+ * @pnum: the physical eraseblock number
+ * @ec: erase counter of this physical eraseblock
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int add_to_erase(const struct ubi_info *ubi, struct ubi_scan_info *si,
+			int pnum, int ec)
+{
+	struct ubi_scan_leb *seb;
+
+	dbg_scan("PEB %d, EC %d", pnum, ec);
+
+	seb = ubi_alloc_scan_leb();
+	if (unlikely(!seb))
+		return -ENOMEM;
+
+	seb->pnum = pnum;
+	seb->ec = ec;
+	list_add_tail(&seb->list, &si->erase);
+	return 0;
+}
+
+static void destroy_sv(struct ubi_scan_volume *sv);
+
+void ubi_scan_destroy_si(struct ubi_scan_info *si)
+{
+	struct ubi_scan_leb *seb, *seb_tmp;
+	struct ubi_scan_volume *sv;
+	struct rb_node *rb;
+
+	list_for_each_entry_safe(seb, seb_tmp, &si->alien, list) {
+		list_del(&seb->list);
+		ubi_free_scan_leb(seb);
+	}
+	list_for_each_entry_safe(seb, seb_tmp, &si->erase, list) {
+		list_del(&seb->list);
+		ubi_free_scan_leb(seb);
+	}
+	list_for_each_entry_safe(seb, seb_tmp, &si->corr, list) {
+		list_del(&seb->list);
+		ubi_free_scan_leb(seb);
+	}
+	list_for_each_entry_safe(seb, seb_tmp, &si->free, list) {
+		list_del(&seb->list);
+		ubi_free_scan_leb(seb);
+	}
+
+	/* Destroy the volume RB-tree */
+	rb = si->volumes.rb_node;
+	while (rb) {
+		if (rb->rb_left)
+			rb = rb->rb_left;
+		else if (rb->rb_right)
+			rb = rb->rb_right;
+		else {
+			sv = rb_entry(rb, struct ubi_scan_volume, rb);
+
+			rb = rb->rb_parent;
+			if (rb) {
+				if (rb->rb_left == &sv->rb)
+					rb->rb_left = NULL;
+				else
+					rb->rb_right = NULL;
+			}
+
+			destroy_sv(sv);
+		}
+	}
+
+	ubi_kfree(si);
+}
+
+/**
+ * add_to_free - add a physical eraseblock to the list of free physical
+ * eraseblocks.
+ *
+ * @si: a pointer to the scanning information
+ * @pnum: the physical eraseblock number
+ * @ec: erase counter of this physical eraseblock
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static inline int add_to_free(struct ubi_scan_info *si, int pnum, int ec)
+{
+	struct ubi_scan_leb *seb;
+
+	dbg_scan("PEB %d, EC %d", pnum, ec);
+	ubi_assert(ec >= 0);
+
+	seb = ubi_alloc_scan_leb();
+	if (unlikely(!seb))
+		return -ENOMEM;
+
+	seb->pnum = pnum;
+	seb->ec = ec;
+	list_add_tail(&seb->list, &si->free);
+	return 0;
+}
+
+/**
+ * process_eb - read UBI headers, check them and add corresponding data
+ * to the scanning information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ * @pnum: the physical eraseblock number
+ *
+ * This function returns a negative error code in case of failure, or th
+ * physical eraseblock type (%UBI_IO_PEB_EMPTY, %UBI_IO_PEB_FREE,
+ * %UBI_IO_BAD_EC_HDR, or %UBI_IO_BAD_VID_HDR), or %0 if the physical
+ * eraseblock is bad.
+ */
+static int process_eb(const struct ubi_info *ubi, struct ubi_scan_info *si,
+		      int pnum)
+{
+	int64_t ec;
+	int vid_hdr_offset, data_offset, err, bitflips = 0, vol_id, ec_corr = 0;
+	const struct ubi_io_info *io = ubi->io;
+
+	/* Skip bad physical eraseblocks */
+	err = ubi_io_is_bad(ubi, pnum);
+	if (unlikely(err < 0))
+		return err;
+	else if (err) {
+		si->bad_peb_count += 1;
+		return UBI_IO_PEB_EMPTY;
+	}
+
+	err = ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 0);
+	if (unlikely(err < 0))
+		return err;
+	else if (unlikely(err == UBI_IO_BITFLIPS))
+		bitflips = 1;
+	else if (err == UBI_IO_PEB_EMPTY) {
+		int err1;
+
+		err1 = ubi_scan_add_to_corrupted(si, pnum, -1);
+		if (unlikely(err1))
+			err = err1;
+		return err;
+	} else if (err == UBI_IO_BAD_EC_HDR) {
+		/*
+		 * We have to also look at the VID header, possibly it is not
+		 * corrupted. Set %bitflips flag in order to make this PEB be
+		 * moved and EC be re-created.
+		 */
+		ec_corr = 1;
+		ec = -1;
+		bitflips = 1;
+	}
+
+	if (!ec_corr) {
+		/* Make sure UBI version is OK */
+		if (unlikely(ec_hdr->version != UBI_VERSION)) {
+			ubi_err("this UBI version is %d, image version is %d",
+				UBI_VERSION, (int)ec_hdr->version);
+			return -EINVAL;
+		}
+
+		/* Make sure the VID header and data offsets are correct */
+		vid_hdr_offset = ubi32_to_cpu(ec_hdr->vid_hdr_offset);
+		data_offset = ubi32_to_cpu(ec_hdr->data_offset);
+		if (unlikely(vid_hdr_offset != io->vid_hdr_offset ||
+			     data_offset != io->leb_start)) {
+			ubi_err("bad offsets at PEB %d", pnum);
+			ubi_msg("assumed VID header offset %d, data offset %d",
+				io->vid_hdr_offset, io->leb_start);
+			ubi_dbg_dump_ec_hdr(ec_hdr);
+			return -EINVAL;
+		}
+
+		ec = ubi64_to_cpu(ec_hdr->ec);
+		if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
+			/*
+			 * Erase counter overflow. The EC headers have 64 bits
+			 * reserved, but we anyway make use of only 31 bit
+			 * values, as this seems to be enough for any existing
+			 * flash. Upgrade UBI and use 64-bit erase counters
+			 * internally.
+			 */
+			ubi_err("erase counter overflow, max is %d",
+				UBI_MAX_ERASECOUNTER);
+			ubi_dbg_dump_ec_hdr(ec_hdr);
+			return -EINVAL;
+		}
+	}
+
+	/* OK, we've done with the EC header, let's look at the VID header */
+
+	err = ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 0);
+	if (unlikely(err < 0))
+		return err;
+
+	if (err == UBI_IO_BAD_VID_HDR ||
+	    (err == UBI_IO_PEB_FREE && ec_corr)) {
+		/* VID header is corrupted */
+		err = ubi_scan_add_to_corrupted(si, pnum, ec);
+		if (unlikely(err))
+			return err;
+		err = UBI_IO_BAD_VID_HDR;
+		goto adjust_mean_ec;
+	}
+
+	if (err == UBI_IO_PEB_FREE) {
+		/* No VID header - the physical eraseblock is free */
+		err = add_to_free(si, pnum, ec);
+		if (unlikely(err))
+			return err;
+		err = UBI_IO_PEB_FREE;
+		goto adjust_mean_ec;
+	}
+
+	if (unlikely(err == UBI_IO_BITFLIPS))
+		bitflips = 1;
+
+	vol_id = ubi32_to_cpu(vid_hdr->vol_id);
+	if (unlikely(!ubi_ivol_is_known(vol_id))) {
+		int lnum = ubi32_to_cpu(vid_hdr->lnum);
+
+		/* Unsupported internal volume */
+		switch (vid_hdr->compat) {
+		case UBI_COMPAT_DELETE:
+			ubi_msg("\"delete\" compatible internal volume %d:%d"
+				" found, remove it", vol_id, lnum);
+			err = ubi_scan_add_to_corrupted(si, pnum, ec);
+			if (unlikely(err))
+				return err;
+			break;
+
+		case UBI_COMPAT_RO:
+			ubi_msg("read-only compatible internal volume %d:%d"
+				" found, switch to read-only mode",
+				vol_id, lnum);
+			ubi->io->ro_mode = 1;
+			break;
+
+		case UBI_COMPAT_PRESERVE:
+			ubi_msg("\"preserve\" compatible internal volume %d:%d"
+				" found", vol_id, lnum);
+			err = add_to_alien(si, pnum);
+			si->alien_peb_count += 1;
+			err = UBI_IO_PEB_EMPTY;
+			return err;
+
+		case UBI_COMPAT_REJECT:
+			ubi_err("incompatible internal volume %d:%d found",
+				vol_id, lnum);
+			return -EINVAL;
+		}
+	}
+
+	/* Both UBI headers seem to be fine */
+	err = ubi_scan_add_volume(ubi, si, pnum, ec, vid_hdr, bitflips);
+	if (unlikely(err))
+		return err;
+
+adjust_mean_ec:
+	if (!ec_corr) {
+		if (si->ec_sum + ec < ec) {
+			commit_to_mean_value(si);
+			si->ec_sum = 0;
+			si->ec_count = 0;
+		} else {
+			si->ec_sum += ec;
+			si->ec_count += 1;
+		}
+
+		if (ec > si->max_ec)
+			si->max_ec = ec;
+		if (ec < si->min_ec)
+			si->min_ec = ec;
+	}
+
+	return err;
+}
+
+/**
+ * destroy_sv - free the scanning volume information
+ *
+ * @sv: scanning volume information
+ *
+ * This function destroys the volume RB-tree (@sv->root) and the scanning
+ * volume information.
+ */
+static void destroy_sv(struct ubi_scan_volume *sv)
+{
+	struct ubi_scan_leb *seb;
+	struct rb_node *this = sv->root.rb_node;
+
+	while (this) {
+		if (this->rb_left)
+			this = this->rb_left;
+		else if (this->rb_right)
+			this = this->rb_right;
+		else {
+			seb = rb_entry(this, struct ubi_scan_leb, rb);
+			this = this->rb_parent;
+			if (this) {
+				if (this->rb_left == &seb->rb)
+					this->rb_left = NULL;
+				else
+					this->rb_right = NULL;
+			}
+
+			ubi_free_scan_leb(seb);
+		}
+	}
+	ubi_free_scan_volume(sv);
+}
+
+/**
+ * commit_to_mean_value - commit intermediate results to the final mean erase
+ * counter value.
+ *
+ * @si: the scanning information
+ *
+ * This function is a helper function which calculates partial mean value and
+ * adds it to the resulting mean value. As we can work only in integer
+ * arithmetics and we want to calculate the mean value of erase counter
+ * accurately, we first sum erase counter values in @si->ec_sum variable and
+ * count these components in @si->ec_count. If this temporary @si->ec_sum is
+ * going to overflow, we calculate the partial mean value
+ * (@si->ec_sum/@si->ec_count) and add it to @si->mean_ec.
+ */
+static void commit_to_mean_value(struct ubi_scan_info *si)
+{
+	int rem;
+
+	rem = si->ec_sum % si->ec_count;
+	si->ec_sum /= si->ec_count;
+	if (rem >= si->ec_count / 2)
+		si->mean_ec += 1;
+	si->mean_ec += si->ec_sum;
+}
+
+/**
+ * vid_hdr_sanity_check - check that a volume identifier header is sane.
+ *
+ * @ubi: the UBI device description object
+ * @vid_hdr: the volume identifier header to check
+ * @sv: information about the volume this logical eraseblock belongs to
+ * @pnum: the physical eraseblock number the VID header came from
+ *
+ * This function checks that data stored in the volume identifier header
+ * @vid_hdr is sane and consistent. This function returns non-zero if an
+ * inconsistency was found and zero if not.
+ */
+static int vid_hdr_sanity_check(const struct ubi_info *ubi,
+				const struct ubi_vid_hdr *vid_hdr,
+				const struct ubi_scan_volume *sv, int pnum)
+{
+	const struct ubi_io_info *io = ubi->io;
+	int vol_type = vid_hdr->vol_type;
+	int copy_flag = vid_hdr->copy_flag;
+	int vol_id = ubi32_to_cpu(vid_hdr->vol_id);
+	int lnum = ubi32_to_cpu(vid_hdr->lnum);
+	int compat = vid_hdr->compat;
+	int data_size = ubi32_to_cpu(vid_hdr->data_size);
+	int used_ebs = ubi32_to_cpu(vid_hdr->used_ebs);
+	int data_pad = ubi32_to_cpu(vid_hdr->data_pad);
+	int data_crc = ubi32_to_cpu(vid_hdr->data_crc);
+	int usable_leb_size = io->leb_size - data_pad;
+
+	if (unlikely(copy_flag != 0 && copy_flag != 1)) {
+		ubi_err("bad copy_flag");
+		goto bad;
+	}
+
+	if (unlikely(vol_id < 0 || lnum < 0 || data_size < 0 || used_ebs < 0 ||
+		     data_pad < 0)) {
+		ubi_err("negative values");
+		goto bad;
+	}
+
+	if (unlikely(vol_id >= UBI_MAX_VOLUMES &&
+		     vol_id < UBI_INTERNAL_VOL_START)) {
+		ubi_err("bad vol_id");
+		goto bad;
+	}
+
+	if (unlikely(vol_id < UBI_INTERNAL_VOL_START && compat != 0)) {
+		ubi_err("bad compat");
+		goto bad;
+	}
+
+	if (unlikely(vol_id >= UBI_INTERNAL_VOL_START &&
+		     compat != UBI_COMPAT_DELETE &&
+		     compat != UBI_COMPAT_RO &&
+		     compat != UBI_COMPAT_PRESERVE &&
+		     compat != UBI_COMPAT_REJECT)) {
+		ubi_err("bad compat");
+		goto bad;
+	}
+
+	if (unlikely(vol_type != UBI_VID_DYNAMIC && vol_type != UBI_VID_STATIC)) {
+		ubi_err("bad vol_type");
+		goto bad;
+	}
+
+	if (unlikely(data_pad >= io->leb_size / 2)) {
+		ubi_err("bad data_pad");
+		goto bad;
+	}
+
+	if (vol_type == UBI_VID_STATIC) {
+		if (unlikely(used_ebs == 0)) {
+			ubi_err("zero used_ebs");
+			goto bad;
+		}
+		if (unlikely(data_size == 0)) {
+			ubi_err("zero data_size");
+			goto bad;
+		}
+		if (lnum < used_ebs - 1) {
+			if (unlikely(data_size != usable_leb_size)) {
+				ubi_err("bad data_size");
+				goto bad;
+			}
+		} else if (lnum == used_ebs - 1) {
+			if (unlikely(data_size == 0)) {
+				ubi_err("bad data_size at last LEB");
+				goto bad;
+			}
+		} else {
+			ubi_err("too high lnum %d", lnum);
+			goto bad;
+		}
+	} else {
+		if (copy_flag == 0) {
+			if (unlikely(data_crc != 0)) {
+				ubi_err("bad data CRC");
+				goto bad;
+			}
+			if (unlikely(data_size != 0)) {
+				ubi_err("bad data_size");
+				goto bad;
+			}
+		} else {
+			if (unlikely(data_size == 0)) {
+				ubi_err("zero data_size of copy");
+				goto bad;
+			}
+		}
+		if (unlikely(used_ebs != 0)) {
+			ubi_err("bad used_ebs");
+			goto bad;
+		}
+	}
+
+	if (sv->leb_count != 0) {
+		/*
+		 * This is not the first logical eraseblock belonging to this
+		 * volume. Ensure that the data in its VID header is consistent
+		 * to the data in previous logical eraseblocks' headers.
+		 */
+		int sv_vol_type;
+
+		if (unlikely(vol_id != sv->vol_id)) {
+			ubi_err("inconsistent vol_id");
+			goto bad;
+		}
+
+		if (sv->vol_type == UBI_STATIC_VOLUME)
+			sv_vol_type = UBI_VID_STATIC;
+		else
+			sv_vol_type = UBI_VID_DYNAMIC;
+
+		if (unlikely(vol_type != sv_vol_type)) {
+			ubi_err("inconsistent vol_type");
+			goto bad;
+		}
+
+		if (unlikely(used_ebs != sv->used_ebs)) {
+			ubi_err("inconsistent used_ebs");
+			goto bad;
+		}
+
+		if (unlikely(data_pad != sv->data_pad)) {
+			ubi_err("inconsistent data_pad");
+			goto bad;
+		}
+	}
+
+	return 0;
+
+bad:
+	ubi_msg("bad VID header at PEB %d:", pnum);
+	ubi_dbg_dump_vid_hdr(vid_hdr);
+	ubi_dbg_dump_sv(sv);
+	return -EINVAL;
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_SCAN
+
+/**
+ * paranoid_check_si - check if the scanning information is sane and correct.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero if the scanning information is all right, %1 if
+ * not and a negative error code if an error occurred.
+ */
+static int paranoid_check_si(const struct ubi_info *ubi,
+			     struct ubi_scan_info *si)
+{
+	int pnum, err, vols_found = 0;
+	struct rb_node *rb1, *rb2;
+	struct ubi_scan_volume *sv;
+	struct ubi_scan_leb *seb, *last_seb;
+	const struct ubi_io_info *io = ubi->io;
+	uint8_t *buf;
+
+	/*
+	 * At first, check that scanning information is sane.
+	 */
+	rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+		int leb_count = 0;
+
+		cond_resched();
+
+		vols_found += 1;
+
+		if (unlikely(si->is_empty)) {
+			ubi_err("bad is_empty flag");
+			goto bad_sv;
+		}
+
+		if (unlikely(sv->vol_id < 0 || sv->highest_lnum < 0 ||
+			     sv->leb_count < 0 || sv->vol_type < 0 ||
+			     sv->used_ebs < 0 || sv->data_pad < 0 ||
+			     sv->last_data_size < 0)) {
+			ubi_err("negative values");
+			goto bad_sv;
+		}
+
+		if (unlikely(sv->vol_id >= UBI_MAX_VOLUMES &&
+			     sv->vol_id < UBI_INTERNAL_VOL_START)) {
+			ubi_err("bad vol_id");
+			goto bad_sv;
+		}
+
+		if (unlikely(sv->vol_id > si->highest_vol_id)) {
+			ubi_err("highest_vol_id is %d, but vol_id %d is there",
+				si->highest_vol_id, sv->vol_id);
+			goto out;
+		}
+
+		if (unlikely(sv->vol_type != UBI_DYNAMIC_VOLUME &&
+			     sv->vol_type != UBI_STATIC_VOLUME)) {
+			ubi_err("bad vol_type");
+			goto bad_sv;
+		}
+
+		if (unlikely(sv->data_pad > io->leb_size / 2)) {
+			ubi_err("bad data_pad");
+			goto bad_sv;
+		}
+
+		last_seb = NULL;
+		rb_for_each_entry(rb2, seb, &sv->root, rb) {
+			cond_resched();
+
+			last_seb = seb;
+			leb_count += 1;
+
+			if (unlikely(seb->pnum < 0 || seb->ec < 0)) {
+				ubi_err("negative values");
+				goto bad_seb;
+			}
+
+			if (unlikely(seb->ec < si->min_ec)) {
+				ubi_err("bad si->min_ec (%d), %d found",
+					si->min_ec, seb->ec);
+				goto bad_seb;
+			}
+
+			if (unlikely(seb->ec > si->max_ec)) {
+				ubi_err("bad si->max_ec (%d), %d found",
+					si->max_ec, seb->ec);
+				goto bad_seb;
+			}
+
+			if (unlikely(seb->pnum >= io->peb_count)) {
+				ubi_err("too high PEB number %d, total PEBs %d",
+					seb->pnum, io->peb_count);
+				goto bad_seb;
+			}
+
+			if (sv->vol_type == UBI_STATIC_VOLUME) {
+				if (unlikely(seb->lnum >= sv->used_ebs)) {
+					ubi_err("bad lnum or used_ebs");
+					goto bad_seb;
+				}
+			} else {
+				if (unlikely(sv->used_ebs != 0)) {
+					ubi_err("non-zero used_ebs");
+					goto bad_seb;
+				}
+			}
+
+			if (unlikely(seb->lnum > sv->highest_lnum)) {
+				ubi_err("incorrect highest_lnum or lnum");
+				goto bad_seb;
+			}
+		}
+
+		if (unlikely(sv->leb_count != leb_count)) {
+			ubi_err("bad leb_count, %d objects in the tree",
+				leb_count);
+			goto bad_sv;
+		}
+
+		if (!last_seb)
+			continue;
+
+		seb = last_seb;
+
+		if (unlikely(seb->lnum != sv->highest_lnum)) {
+			ubi_err("bad highest_lnum");
+			goto bad_seb;
+		}
+	}
+
+	if (vols_found != si->vols_found) {
+		ubi_err("bad si->vols_found %d, should be %d",
+			si->vols_found, vols_found);
+		goto out;
+	}
+
+	/* Check that scanning information is correct */
+	rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+		last_seb = NULL;
+		rb_for_each_entry(rb2, seb, &sv->root, rb) {
+			int vol_type;
+
+			cond_resched();
+
+			last_seb = seb;
+
+			err = ubi_io_read_vid_hdr(ubi, seb->pnum, vid_hdr, 1);
+			if (unlikely(err) && err != UBI_IO_BITFLIPS) {
+				ubi_err("VID header is not OK (%d)", err);
+				if (err > 0)
+					err = -EIO;
+				return err;
+			}
+
+			vol_type = vid_hdr->vol_type == UBI_VID_DYNAMIC ?
+				   UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
+			if (unlikely(sv->vol_type != vol_type)) {
+				ubi_err("bad vol_type");
+				goto bad_vid_hdr;
+			}
+
+			if (unlikely(seb->leb_ver !=
+				     ubi32_to_cpu(vid_hdr->leb_ver))) {
+				ubi_err("bad leb_ver %u", seb->leb_ver);
+				goto bad_vid_hdr;
+			}
+
+			if (unlikely(sv->vol_id !=
+				     ubi32_to_cpu(vid_hdr->vol_id))) {
+				ubi_err("bad vol_id %d", sv->vol_id);
+				goto bad_vid_hdr;
+			}
+
+			if (unlikely(sv->compat != vid_hdr->compat)) {
+				ubi_err("bad compat %d", vid_hdr->compat);
+				goto bad_vid_hdr;
+			}
+
+			if (unlikely(seb->lnum !=
+				     ubi32_to_cpu(vid_hdr->lnum))) {
+				ubi_err("bad lnum %d", seb->lnum);
+				goto bad_vid_hdr;
+			}
+
+			if (unlikely(sv->used_ebs !=
+				     ubi32_to_cpu(vid_hdr->used_ebs))) {
+				ubi_err("bad used_ebs %d", sv->used_ebs);
+				goto bad_vid_hdr;
+			}
+
+			if (unlikely(sv->data_pad !=
+				     ubi32_to_cpu(vid_hdr->data_pad))) {
+				ubi_err("bad data_pad %d", sv->data_pad);
+				goto bad_vid_hdr;
+			}
+		}
+
+		if (!last_seb)
+			continue;
+
+		if (unlikely(sv->highest_lnum != ubi32_to_cpu(vid_hdr->lnum))) {
+			ubi_err("bad highest_lnum %d", sv->highest_lnum);
+			goto bad_vid_hdr;
+		}
+
+		if (unlikely(sv->last_data_size !=
+			     ubi32_to_cpu(vid_hdr->data_size))) {
+			ubi_err("bad last_data_size %d", sv->last_data_size);
+			goto bad_vid_hdr;
+		}
+	}
+
+	/*
+	 * Make sure that all the physical eraseblocks are in one of the lists
+	 * or trees.
+	 */
+	buf = ubi_kmalloc(io->peb_count,  GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memset(buf, 1, io->peb_count);
+	for (pnum = 0; pnum < io->peb_count; pnum++) {
+		err = ubi_io_is_bad(ubi, pnum);
+		if (unlikely(err < 0))
+			return err;
+		else if (err)
+			buf[pnum] = 0;
+	}
+
+	rb_for_each_entry(rb1, sv, &si->volumes, rb)
+		rb_for_each_entry(rb2, seb, &sv->root, rb)
+			buf[seb->pnum] = 0;
+
+	cond_resched();
+	list_for_each_entry(seb, &si->free, list)
+		buf[seb->pnum] = 0;
+
+	cond_resched();
+	list_for_each_entry(seb, &si->corr, list)
+		buf[seb->pnum] = 0;
+
+	cond_resched();
+	list_for_each_entry(seb, &si->erase, list)
+		buf[seb->pnum] = 0;
+
+	cond_resched();
+	list_for_each_entry(seb, &si->alien, list)
+		buf[seb->pnum] = 0;
+
+	err = 0;
+	for (pnum = 0; pnum < io->peb_count; pnum++)
+		if (unlikely(buf[pnum])) {
+			ubi_err("PEB %d is not referred", pnum);
+			err = 1;
+		}
+
+	ubi_kfree(buf);
+	if (err)
+		goto out;
+	return 0;
+
+bad_seb:
+	ubi_msg("bad scanning information about LEB %d", seb->lnum);
+	ubi_dbg_dump_seb(seb, 0);
+	ubi_dbg_dump_sv(sv);
+	goto out;
+
+bad_sv:
+	ubi_msg("bad scanning information about volume %d", sv->vol_id);
+	ubi_dbg_dump_sv(sv);
+	goto out;
+
+bad_vid_hdr:
+	ubi_msg("bad scanning information about volume %d", sv->vol_id);
+	ubi_dbg_dump_sv(sv);
+	ubi_dbg_dump_vid_hdr(vid_hdr);
+
+out:
+	dump_stack();
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_SCAN */
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
new file mode 100644
index 0000000..e551ab7
--- /dev/null
+++ b/drivers/mtd/ubi/scan.h
@@ -0,0 +1,274 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI scanning unit.
+ *
+ * This unit is responsible for scanning the flash media, checking UBI
+ * headers and providing complete information about the UBI flash image.
+ *
+ * This unit  properly handles old or corrupted logical eraseblocks which may
+ * appear due to UBI crashes (if an eraseblock movement was interrupted or some
+ * eraseblocks scheduled for erasure were not erased).
+ */
+
+#ifndef __UBI_SCAN_H__
+#define __UBI_SCAN_H__
+
+#include <linux/list.h>
+#include <linux/rbtree.h>
+
+struct ubi_info;
+struct ubi_scan_info;
+struct ubi_scan_volume;
+struct ubi_scan_leb;
+struct ubi_vid_hdr;
+
+/**
+ * ubi_scan_add_volume - add information about a physical eraseblock to the
+ * scanning information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ * @pnum: the physical eraseblock number
+ * @ec: erase counter
+ * @vid_hdr: the volume identifier header
+ * @bitflips: if a bit-flips were detected while reading this physical
+ * eraseblock
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_scan_add_volume(const struct ubi_info *ubi, struct ubi_scan_info *si,
+			int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
+			int bitflips);
+
+/**
+ * ubi_scan_add_to_corrupted - add a physical eraseblock to the list of
+ * corrupted physical eraseblocks.
+ *
+ * @si: a pointer to the scanning information
+ * @pnum: the physical eraseblock number
+ * @ec: erase counter of this physical eraseblock
+ *
+ * If @ec is not known, %-1 has to be passed and mean erase counter will be
+ * used. This function returns zero in case of success and a negative error
+ * code in case of failure.
+ */
+int ubi_scan_add_to_corrupted(struct ubi_scan_info *si, int pnum, int ec);
+
+/**
+ * ubi_scan_get_scan_volume - find information about a particular volume in the
+ * scanning information.
+ *
+ * @si: a pointer to the scanning information
+ * @vol_id: the requested volume ID
+ *
+ * This function returns a pointer to the volume description or %NULL if there
+ * are no data about this volume in the scanning information.
+ */
+struct ubi_scan_volume *ubi_scan_get_scan_volume(const struct ubi_scan_info *si,
+						 int vol_id);
+
+/**
+ * ubi_scan_get_scan_leb - find information about a particular logical
+ * eraseblock in the volume scanning information.
+ *
+ * @sv: a pointer to the volume scanning information
+ * @lnum: the requested logical eraseblock
+ *
+ * This function returns a pointer to the scanning logical eraseblock or %NULL
+ * if there are no data about it in the scanning volume information.
+ */
+struct ubi_scan_leb *ubi_scan_get_scan_leb(const struct ubi_scan_volume *sv,
+					   int lnum);
+
+/**
+ * ubi_scan_early_erase_peb - erase a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ * @pnum: physical eraseblock number to erase;
+ * @ec: erase counter value to write (-1 if it is unknown)
+ */
+int ubi_scan_early_erase_peb(const struct ubi_info *ubi,
+			     const struct ubi_scan_info *si, int pnum, int ec);
+
+/**
+ * ubi_scan_get_free_peb - get a free physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns a free physical eraseblock. It is supposed to be
+ * called on the UBI initialization stages when the wear-leveling unit is not
+ * initialized yet. This function picks a physical eraseblocks from one of the
+ * lists, writes the EC header if it is needed, and removes it from the list.
+ *
+ * This function returns scanning physical eraseblock information in case of
+ * success and an error code in case of failure.
+ */
+struct ubi_scan_leb *ubi_scan_get_free_peb(const struct ubi_info *ubi,
+					   struct ubi_scan_info *si);
+
+/**
+ * ubi_scan_rm_volume - delete scanning information about a volume.
+ *
+ * @ubi: the UBI device description object
+ * @sv: the volume scanning information to delete
+ */
+void ubi_scan_rm_volume(const struct ubi_info *ubi, struct ubi_scan_info *si,
+			struct ubi_scan_volume *sv);
+
+/**
+ * ubi_scan - scan an MTD device.
+ *
+ * @ubi: the UBI device description object
+ * @info: full scanning information is returned here
+ *
+ * This function does full scanning of an MTD device and returns complete
+ * information about it in @info. This function returns zero in case of success
+ * and a negative error code in case of failure.
+ */
+int ubi_scan(struct ubi_info *ubi, struct ubi_scan_info **info);
+
+/**
+ * ubi_scan_destroy_si - destroy scanning information.
+ *
+ * @si: a pointer to the scanning information
+ */
+void ubi_scan_destroy_si(struct ubi_scan_info *si);
+
+/**
+ * struct ubi_scan_volume - scanning information about a volume.
+ *
+ * @vol_id: volume ID
+ * @highest_lnum: the highest logical eraseblock number found in this volume
+ * @leb_count: the number of found logical eraseblocks belonging to this volume
+ * @vol_type: volume type
+ * @data_pad: how many bytes at the end of logical eraseblocks of this volume
+ * are not used (due to the volume alignment)
+ * @used_ebs: the number of used logical eraseblocks in this volume (only for
+ * static volumes)
+ * @last_data_size: amount of data in the last found logical eraseblock of this
+ * volume (always equivalent to the usable logical eraseblock size fro dynamic
+ * volumes)
+ * @data_size: how many bytes of data logical eraseblock contain (only for static
+ * volumes, invalid for the last logical eraseblock)
+ * @compat: compatibility flags of the volume
+ * @rb: link in the volume RB-tree
+ * @root: the root of RB-tree containing all the found eraseblock belonging to
+ * this volume (&struct ubi_scan_leb objects)
+ */
+struct ubi_scan_volume {
+	int vol_id;
+	int highest_lnum;
+	int leb_count;
+	int vol_type;
+	int used_ebs;
+	int last_data_size;
+	int data_pad;
+	int compat;
+	struct rb_node rb;
+	struct rb_root root;
+};
+
+/**
+ * struct ubi_scan_leb - scanning information about a physical eraseblock.
+ *
+ * @ec: erase counter (%-1 if it is unknown)
+ * @pnum: physical eraseblock number
+ * @lnum: logical eraseblock number
+ * @scrub: if this physical eraseblock needs scrubbing
+ * @leb_ver: version of this logical eraseblock
+ * @rb: link in the per-volume RB-tree of &struct ubi_scan_leb objects
+ * @list: link in one of the eraseblock lists
+ *
+ * One object of this type is allocated for each physical eraseblock during
+ * scanning.
+ */
+struct ubi_scan_leb {
+	int ec;
+	int pnum;
+	int lnum;
+	int scrub;
+	uint32_t leb_ver;
+	/* FIXME: the below 2 fields may be actually union-ed */
+	struct rb_node rb;
+	struct list_head list;
+};
+
+/**
+ * struct ubi_scan_info - UBI scanning information.
+ *
+ * @volumes: root of the volume RB-tree
+ * @corr: list of corrupted eraseblocks
+ * @free: list of free eraseblocks
+ * @erase: list of eraseblocks which have to be erased
+ * @alien: count of physical eraseblocks which should not be used by UBI (e.g.,
+ * those belonging to "preserve"-compatible internal volumes)
+ * @vols_found: total count of volumes found during scanning
+ * @highest_vol_id: highest volume ID found during scanning
+ * @bad_peb_count: count of bad physical eraseblocks found during scanning
+ * @alien_peb_count: count of physical eraseblocks in the @@alien list
+ * @is_empty: a flag indicating whether the flash device is empty or not
+ * @min_ec: the lowest found erase counter value
+ * @max_ec: the highest found erase counter value
+ * @mean_ec: mean erase counter value
+ * @ec_sum: a temporary variable used when calculating @mean_ec
+ * @ec_count: a temporary variable used when calculating @mean_ec
+ *
+ * This data structure contains the result of scanning and may be used by other
+ * UBI units to build final UBI data structures, further error-recovery and so
+ * on.
+ *
+ * Information about found volumes is represented by &struct ubi_scan_volume
+ * objects which are kept in volume RB-tree with root at the @volumes field. The
+ * RB-tree is indexed by the volume ID.
+ *
+ * Found logical eraseblocks are represented by &struct ubi_scan_leb objects.
+ * These objects are kept in per-volume RB-trees with the root at the
+ * corresponding &struct ubi_scan_volume object. To put it differently, we keep
+ * an RB-tree of per-volume objects and each of these objects is the root of
+ * RB-tree of per-eraseblock objects.
+ *
+ * Corrupted physical eraseblocks are put to the @corr list, free physical
+ * eraseblocks are put to the @free list and the physical eraseblock to be
+ * erased are put to the @erase list.
+ */
+struct ubi_scan_info {
+	struct rb_root volumes;  /* public  */
+	struct list_head corr;   /* public  */
+	struct list_head free;   /* public  */
+	struct list_head erase;  /* public  */
+	struct list_head alien;  /* public  */
+	int vols_found;          /* public  */
+	int highest_vol_id;      /* public  */
+	int bad_peb_count;       /* public  */
+	int alien_peb_count;     /* public  */
+	int is_empty;            /* public  */
+	int min_ec;              /* public  */
+	int max_ec;              /* public  */
+	int mean_ec;             /* public  */
+	int ec_sum;              /* private */
+	int ec_count;            /* private */
+};
+
+#endif /* !__UBI_SCAN_H__ */
diff --git a/drivers/mtd/ubi/sysfs.c b/drivers/mtd/ubi/sysfs.c
new file mode 100644
index 0000000..b0f4e2a
--- /dev/null
+++ b/drivers/mtd/ubi/sysfs.c
@@ -0,0 +1,983 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/device.h>
+#include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/config.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "uif.h"
+#include "upd.h"
+#include "debug.h"
+#include "sysfs.h"
+#include "io.h"
+#include "wl.h"
+#include "badeb.h"
+#include "account.h"
+#include "vtbl.h"
+#include "dtbl.h"
+#include "alloc.h"
+
+static struct class *ubi_class;
+
+static ssize_t ubi_version_show(struct class *class, char *buf);
+
+#ifdef CONFIG_MTD_UBI_DEBUG_RUNTIME
+static int create_debugging_stuff(struct class *class);
+static void remove_debugging_stuff(void);
+#else
+#define create_debugging_stuff(class) 0
+#define remove_debugging_stuff()
+#endif
+
+/* Class attributes corresponding to files in '/<sysfs>/class/ubi/' */
+static struct class_attribute ubi_version =
+	__ATTR(version, S_IRUGO, ubi_version_show, NULL);
+
+int ubi_sysfs_global_init(void)
+{
+ 	int err;
+
+	ubi_class = class_create(THIS_MODULE, UBI_NAME_STR);
+	if (IS_ERR(ubi_class)) {
+		err = PTR_ERR(ubi_class);
+		goto out;
+	}
+
+	err = class_create_file(ubi_class, &ubi_version);
+	if (err)
+		goto out_class;
+	err = create_debugging_stuff(ubi_class);
+	if (err)
+		goto out_version;
+
+	return 0;
+
+out_version:
+	class_remove_file(ubi_class, &ubi_version);
+out_class:
+	class_destroy(ubi_class);
+out:
+ 	return err;
+}
+
+void ubi_sysfs_global_close(void)
+{
+	remove_debugging_stuff();
+	class_remove_file(ubi_class, &ubi_version);
+	class_destroy(ubi_class);
+}
+
+static void dev_release(struct class_device *dev);
+static ssize_t dev_eraseblock_size_show(struct class_device *dev, char *buf);
+static ssize_t dev_avail_eraseblocks_show(struct class_device *dev, char *buf);
+static ssize_t dev_total_eraseblocks_show(struct class_device *dev, char *buf);
+static ssize_t dev_volumes_count_show(struct class_device *dev, char *buf);
+static ssize_t dev_max_ec_show(struct class_device *dev, char *buf);
+static ssize_t dev_update_show(struct class_device *dev, char *buf);
+static ssize_t dev_reserved_for_bad_show(struct class_device *dev, char *buf);
+static ssize_t dev_bad_peb_count_show(struct class_device *dev, char *buf);
+static ssize_t dev_max_vol_count_show(struct class_device *dev, char *buf);
+static ssize_t dev_min_io_size_show(struct class_device *dev, char *buf);
+
+/*
+ * Class device attributes corresponding to files in '/<sysfs>/class/ubi/ubiX'.
+ */
+static struct class_device_attribute dev_eraseblock_size =
+	__ATTR(eraseblock_size, S_IRUGO, dev_eraseblock_size_show, NULL);
+static struct class_device_attribute dev_avail_eraseblocks =
+	__ATTR(avail_eraseblocks, S_IRUGO, dev_avail_eraseblocks_show, NULL);
+static struct class_device_attribute dev_total_eraseblocks =
+	__ATTR(total_eraseblocks, S_IRUGO, dev_total_eraseblocks_show, NULL);
+static struct class_device_attribute dev_volumes_count =
+	__ATTR(volumes_count, S_IRUGO, dev_volumes_count_show, NULL);
+static struct class_device_attribute dev_max_ec =
+	__ATTR(max_ec, S_IRUGO, dev_max_ec_show, NULL);
+static struct class_device_attribute dev_update =
+	__ATTR(update, S_IRUGO, dev_update_show, NULL);
+static struct class_device_attribute dev_reserved_for_bad =
+	__ATTR(reserved_for_bad, S_IRUGO, dev_reserved_for_bad_show, NULL);
+static struct class_device_attribute dev_bad_peb_count =
+	__ATTR(bad_peb_count, S_IRUGO, dev_bad_peb_count_show, NULL);
+static struct class_device_attribute dev_max_vol_count =
+	__ATTR(max_vol_count, S_IRUGO, dev_max_vol_count_show, NULL);
+static struct class_device_attribute dev_min_io_size =
+	__ATTR(min_io_size, S_IRUGO, dev_min_io_size_show, NULL);
+
+int ubi_sysfs_init(const struct ubi_info *ubi)
+{
+	int err;
+	struct ubi_uif_info *uif = ubi->uif;
+
+	uif->dev.release = dev_release;
+	uif->dev.devt = MKDEV(uif->major, 0);
+	uif->dev.class = ubi_class;
+	sprintf(&uif->dev.class_id[0], UBI_NAME_STR"%d", ubi->ubi_num);
+	err = class_device_register(&uif->dev);
+	if (err) {
+		ubi_err("register class device for ubi%d, error %d",
+			ubi->ubi_num, err);
+		return err;
+	}
+
+	err = class_device_create_file(&uif->dev, &dev_eraseblock_size);
+	if (err)
+		goto out_unregister;
+	err = class_device_create_file(&uif->dev, &dev_avail_eraseblocks);
+	if (err)
+		goto out_eraseblock_size;
+	err = class_device_create_file(&uif->dev, &dev_total_eraseblocks);
+	if (err)
+		goto out_avail_eraseblocks;
+	err = class_device_create_file(&uif->dev, &dev_volumes_count);
+	if (err)
+		goto out_total_eraseblocks;
+	err = class_device_create_file(&uif->dev, &dev_max_ec);
+	if (err)
+		goto out_volumes_count;
+	err = class_device_create_file(&uif->dev, &dev_update);
+	if (err)
+		goto out_volumes_max_ec;
+	err = class_device_create_file(&uif->dev, &dev_reserved_for_bad);
+	if (err)
+		goto out_update;
+	err = class_device_create_file(&uif->dev, &dev_bad_peb_count);
+	if (err)
+		goto out_reserved_for_bad;
+	err = class_device_create_file(&uif->dev, &dev_max_vol_count);
+	if (err)
+		goto out_bad_peb_count;
+	err = class_device_create_file(&uif->dev, &dev_min_io_size);
+	if (err)
+		goto out_max_vol_count;
+
+	return 0;
+
+out_max_vol_count:
+	class_device_remove_file(&uif->dev, &dev_max_vol_count);
+out_bad_peb_count:
+	class_device_remove_file(&uif->dev, &dev_bad_peb_count);
+out_reserved_for_bad:
+	class_device_remove_file(&uif->dev, &dev_reserved_for_bad);
+out_update:
+	class_device_remove_file(&uif->dev, &dev_update);
+out_volumes_max_ec:
+	class_device_remove_file(&uif->dev, &dev_max_ec);
+out_volumes_count:
+	class_device_remove_file(&uif->dev, &dev_volumes_count);
+out_total_eraseblocks:
+	class_device_remove_file(&uif->dev, &dev_total_eraseblocks);
+out_avail_eraseblocks:
+	class_device_remove_file(&uif->dev, &dev_avail_eraseblocks);
+out_eraseblock_size:
+	class_device_remove_file(&uif->dev, &dev_eraseblock_size);
+out_unregister:
+	ubi_err("failed, UBI device %d", ubi->ubi_num);
+	class_device_unregister(&uif->dev);
+	return err;
+}
+
+void ubi_sysfs_close(const struct ubi_info *ubi)
+{
+	struct ubi_uif_info *uif = ubi->uif;
+
+	class_device_remove_file(&uif->dev, &dev_min_io_size);
+	class_device_remove_file(&uif->dev, &dev_max_vol_count);
+	class_device_remove_file(&uif->dev, &dev_bad_peb_count);
+	class_device_remove_file(&uif->dev, &dev_reserved_for_bad);
+	class_device_remove_file(&uif->dev, &dev_update);
+	class_device_remove_file(&uif->dev, &dev_max_ec);
+	class_device_remove_file(&uif->dev, &dev_volumes_count);
+	class_device_remove_file(&uif->dev, &dev_total_eraseblocks);
+	class_device_remove_file(&uif->dev, &dev_avail_eraseblocks);
+	class_device_remove_file(&uif->dev, &dev_eraseblock_size);
+	class_device_unregister(&uif->dev);
+}
+
+static void vol_release(struct class_device *dev);
+static ssize_t vol_reserved_ebs_show(struct class_device *dev, char *buf);
+static ssize_t vol_type_show(struct class_device *dev, char *buf);
+static ssize_t vol_name_show(struct class_device *dev, char *buf);
+static ssize_t vol_corrupted_show(struct class_device *dev, char *buf);
+static ssize_t vol_alignment_show(struct class_device *dev, char *buf);
+static ssize_t vol_usable_eb_size_show(struct class_device *dev, char *buf);
+static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf);
+
+/*
+ * Class device attributes corresponding to files in
+ * '/<sysfs>/class/ubi/ubiX/Y'.
+ */
+static struct class_device_attribute vol_reserved_ebs =
+	__ATTR(reserved_ebs, S_IRUGO, vol_reserved_ebs_show, NULL);
+static struct class_device_attribute vol_type =
+	__ATTR(type, S_IRUGO, vol_type_show, NULL);
+static struct class_device_attribute vol_name =
+	__ATTR(name, S_IRUGO, vol_name_show, NULL);
+static struct class_device_attribute vol_corrupted =
+	__ATTR(corrupted, S_IRUGO, vol_corrupted_show, NULL);
+static struct class_device_attribute vol_alignment =
+	__ATTR(alignment, S_IRUGO, vol_alignment_show, NULL);
+static struct class_device_attribute vol_usable_eb_size =
+	__ATTR(usable_eb_size, S_IRUGO, vol_usable_eb_size_show, NULL);
+static struct class_device_attribute vol_data_bytes =
+	__ATTR(data_bytes, S_IRUGO, vol_data_bytes_show, NULL);
+
+/*
+ * Note, this function does not free allocated resources in case of failure -
+ * the caller does it. This is because this would cause release() here and the
+ * caller would oops.
+ */
+int ubi_vol_sysfs_init(const struct ubi_info *ubi, struct ubi_uif_volume *vol)
+{
+	int err;
+
+	vol->dev.release = vol_release;
+	vol->dev.parent = &ubi->uif->dev;
+	vol->dev.devt = MKDEV(ubi->uif->major, vol->vol_id + 1);
+	vol->dev.class = ubi_class;
+	sprintf(&vol->dev.class_id[0], "%d", vol->vol_id);
+	err = class_device_register(&vol->dev);
+	if (err) {
+		ubi_err("register class device for volume %d, error %d",
+			vol->vol_id, err);
+		return err;
+	}
+
+	err = class_device_create_file(&vol->dev, &vol_reserved_ebs);
+	if (err)
+		return err;
+	err = class_device_create_file(&vol->dev, &vol_type);
+	if (err)
+		return err;
+	err = class_device_create_file(&vol->dev, &vol_name);
+	if (err)
+		return err;
+	err = class_device_create_file(&vol->dev, &vol_corrupted);
+	if (err)
+		return err;
+	err = class_device_create_file(&vol->dev, &vol_alignment);
+	if (err)
+		return err;
+	err = class_device_create_file(&vol->dev, &vol_usable_eb_size);
+	if (err)
+		return err;
+	err = class_device_create_file(&vol->dev, &vol_data_bytes);
+	if (err)
+		return err;
+	return 0;
+}
+
+void ubi_vol_sysfs_close(struct ubi_uif_volume *vol)
+{
+	class_device_remove_file(&vol->dev, &vol_data_bytes);
+	class_device_remove_file(&vol->dev, &vol_usable_eb_size);
+	class_device_remove_file(&vol->dev, &vol_alignment);
+	class_device_remove_file(&vol->dev, &vol_corrupted);
+	class_device_remove_file(&vol->dev, &vol_name);
+	class_device_remove_file(&vol->dev, &vol_type);
+	class_device_remove_file(&vol->dev, &vol_reserved_ebs);
+	class_device_unregister(&vol->dev);
+}
+
+/**
+ * dev2ubi -- find UBI device description object by the pointer to the class
+ * device object.
+ *
+ * @dev: class device object pointer
+ *
+ * This function returns a pointer to the UBI device description object.
+ */
+static inline struct ubi_info *dev2ubi(struct class_device *dev)
+{
+	struct ubi_uif_info *uif;
+
+	uif = container_of(dev, struct ubi_uif_info, dev);
+	return uif->ubi;
+}
+
+/*
+ * "Show" and "store" methods for files in '/<sysfs>/class/ubi/'.
+ */
+static ssize_t ubi_version_show(struct class *class, char *buf)
+{
+	return sprintf(buf, "%d\n", UBI_VERSION);
+}
+
+/*
+ * "Release" method for UBI devices.
+ */
+static void dev_release(struct class_device *dev)
+{
+	return;
+}
+
+/*
+ * "Show" method for files in '/<sysfs>/class/ubi/ubiX/'.
+ */
+static ssize_t dev_eraseblock_size_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->io->leb_size);
+}
+
+static ssize_t dev_avail_eraseblocks_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->acc->avail_pebs);
+}
+
+static ssize_t dev_total_eraseblocks_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->io->good_peb_count);
+}
+
+static ssize_t dev_volumes_count_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->acc->uvol_count);
+}
+
+static ssize_t dev_max_ec_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->wl->max_ec);
+}
+
+static ssize_t dev_update_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+	int vol_id = ubi->upd->vol_id;
+
+	if (vol_id == -1)
+		return 0;
+	return sprintf(buf, "%d\n", vol_id);
+}
+
+static ssize_t dev_reserved_for_bad_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->beb->reserved_pebs);
+}
+
+static ssize_t dev_bad_peb_count_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->io->bad_peb_count);
+}
+
+static ssize_t dev_max_vol_count_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->acc->max_volumes);
+}
+
+static ssize_t dev_min_io_size_show(struct class_device *dev, char *buf)
+{
+	const struct ubi_info *ubi = dev2ubi(dev);
+
+	return sprintf(buf, "%d\n", ubi->io->min_io_size);
+}
+
+/**
+ * dev2ubi -- find volume description object by the pointer to the class device
+ * object.
+ *
+ * @dev: class device object pointer
+ *
+ * This function returns a pointer to the UBI volume description object.
+ */
+static inline struct ubi_uif_volume *dev2vol(struct class_device *dev)
+{
+	return container_of(dev, struct ubi_uif_volume, dev);
+}
+
+/*
+ * Release method for volume devices.
+ */
+static void vol_release(struct class_device *dev)
+{
+	const struct ubi_uif_volume *vol = dev2vol(dev);
+
+	dbg_uif("release volume %d", vol->vol_id);
+	ubi_kfree(vol);
+}
+
+/*
+ * "Show" methods for files in '/<sysfs>/class/ubi/ubiX/Y/'.
+ *
+ * Consider a situation:
+ * A. process 1 opens a sysfs file related to volume Y, say
+ *    /<sysfs>/class/ubi/ubiX/Y/reserved_ebs;
+ * B. process 2 removes volume Y;
+ * C. process 1 starts reading the /<sysfs>/class/ubi/ubiX/Y/reserved_ebs file;
+ *
+ * What we want to do in a situation like that is to return error when the file
+ * is read. This is done by means of the 'removed' flag and the 'vol_lock' of
+ * the UBI UIF volume information structure.
+ */
+
+static ssize_t vol_reserved_ebs_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+	ret = sprintf(buf, "%d\n", vtr->reserved_pebs);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+static ssize_t vol_type_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const char *tp;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+	tp = vtr->vol_type == UBI_DYNAMIC_VOLUME ? "dynamic" : "static";
+	ret = sprintf(buf, "%s\n", tp);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+static ssize_t vol_name_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+	ret = sprintf(buf, "%s\n", vtr->name);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+static ssize_t vol_corrupted_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const struct ubi_dtbl_dtr *dtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	dtr = ubi_dtbl_get_dtr(vol->ubi, vol->vol_id);
+	if (vol->ubi->upd->vol_id == vol->vol_id)
+		ret = sprintf(buf, "1\n");
+	else
+		ret = sprintf(buf, "%d\n", dtr->corrupted);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+static ssize_t vol_alignment_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+	ret = sprintf(buf, "%d\n", vtr->alignment);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+static ssize_t vol_usable_eb_size_show(struct class_device *dev, char *buf)
+{
+	int ret, usable_eb_size;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+	const struct ubi_io_info *io = vol->ubi->io;
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+	usable_eb_size = io->leb_size - vtr->data_pad;
+	ret = sprintf(buf, "%d\n", usable_eb_size);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf)
+{
+	int ret;
+	const struct ubi_dtbl_dtr *dtr;
+	struct ubi_uif_volume *vol = dev2vol(dev);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->removed) {
+		spin_unlock(&vol->vol_lock);
+		ubi_err("volume %d was removed", vol->vol_id);
+		return -EIO;
+	}
+	dtr = ubi_dtbl_get_dtr(vol->ubi, vol->vol_id);
+	ret = sprintf(buf, "%lld\n", dtr->used_bytes);
+	spin_unlock(&vol->vol_lock);
+	return ret;
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_RUNTIME
+
+static struct class_device dbg_dev;
+
+static ssize_t ubi_debug_uif_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_uif_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_vmt_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_vmt_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_upd_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_upd_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_vtbl_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_vtbl_store(struct class_device *dev, const char *buf,
+				    size_t count);
+static ssize_t ubi_debug_dtbl_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_dtbl_store(struct class_device *dev, const char *buf,
+				    size_t count);
+static ssize_t ubi_debug_acc_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_acc_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_eba_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_eba_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_wl_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_wl_store(struct class_device *dev, const char *buf,
+				  size_t count);
+static ssize_t ubi_debug_bgt_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_bgt_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_alloc_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_alloc_store(struct class_device *dev, const char *buf,
+				     size_t count);
+static ssize_t ubi_debug_io_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_io_store(struct class_device *dev, const char *buf,
+				  size_t count);
+static ssize_t ubi_debug_bld_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_bld_store(struct class_device *dev, const char *buf,
+				   size_t count);
+static ssize_t ubi_debug_scan_show(struct class_device *dev, char *buf);
+static ssize_t ubi_debug_scan_store(struct class_device *dev, const char *buf,
+				    size_t count);
+
+static struct class_device_attribute  ubi_debug_uif =
+	__ATTR(debug_uif, S_IRUGO | S_IWUGO,
+	       ubi_debug_uif_show, ubi_debug_uif_store);
+static struct class_device_attribute  ubi_debug_vmt =
+	__ATTR(debug_vmt, S_IRUGO | S_IWUGO,
+	       ubi_debug_vmt_show, ubi_debug_vmt_store);
+static struct class_device_attribute  ubi_debug_upd =
+	__ATTR(debug_upd, S_IRUGO | S_IWUGO,
+	       ubi_debug_upd_show, ubi_debug_upd_store);
+static struct class_device_attribute  ubi_debug_vtbl =
+	__ATTR(debug_vtbl, S_IRUGO | S_IWUGO,
+	       ubi_debug_vtbl_show, ubi_debug_vtbl_store);
+static struct class_device_attribute  ubi_debug_dtbl =
+	__ATTR(debug_dtbl, S_IRUGO | S_IWUGO,
+	       ubi_debug_dtbl_show, ubi_debug_dtbl_store);
+static struct class_device_attribute  ubi_debug_acc =
+	__ATTR(debug_acc, S_IRUGO | S_IWUGO,
+	       ubi_debug_acc_show, ubi_debug_acc_store);
+static struct class_device_attribute  ubi_debug_eba =
+	__ATTR(debug_eba, S_IRUGO | S_IWUGO,
+	       ubi_debug_eba_show, ubi_debug_eba_store);
+static struct class_device_attribute  ubi_debug_wl =
+	__ATTR(debug_wl, S_IRUGO | S_IWUGO,
+	       ubi_debug_wl_show, ubi_debug_wl_store);
+static struct class_device_attribute  ubi_debug_bgt =
+	__ATTR(debug_bgt, S_IRUGO | S_IWUGO,
+	       ubi_debug_bgt_show, ubi_debug_bgt_store);
+static struct class_device_attribute  ubi_debug_alloc =
+	__ATTR(debug_alloc, S_IRUGO | S_IWUGO,
+	       ubi_debug_alloc_show, ubi_debug_alloc_store);
+static struct class_device_attribute  ubi_debug_io =
+	__ATTR(debug_io, S_IRUGO | S_IWUGO,
+	       ubi_debug_io_show, ubi_debug_io_store);
+static struct class_device_attribute  ubi_debug_bld =
+	__ATTR(debug_bld, S_IRUGO | S_IWUGO,
+	       ubi_debug_bld_show, ubi_debug_bld_store);
+static struct class_device_attribute  ubi_debug_scan =
+	__ATTR(debug_scan, S_IRUGO | S_IWUGO,
+	       ubi_debug_scan_show, ubi_debug_scan_store);
+
+/*
+ * "Release" method for the "debugging class device".
+ */
+static void dbg_class_release(struct class_device *dev)
+{
+}
+
+/**
+ * create_debugging_stuff - create debugging-related sysfs files.
+ *
+ * @class: the parent class where to create the files
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int create_debugging_stuff(struct class *class)
+{
+	int err;
+
+	dbg_dev.release = &dbg_class_release;
+	dbg_dev.class = class;
+	sprintf(&dbg_dev.class_id[0], "debug");
+	err = class_device_register(&dbg_dev);
+	if (err)
+		return err;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_uif);
+	if (err)
+		goto out_class;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_vmt);
+	if (err)
+		goto out_uif;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_upd);
+	if (err)
+		goto out_vmt;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_vtbl);
+	if (err)
+		goto out_upd;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_dtbl);
+	if (err)
+		goto out_vtbl;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_acc);
+	if (err)
+		goto out_dtbl;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_eba);
+	if (err)
+		goto out_acc;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_wl);
+	if (err)
+		goto out_eba;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_bgt);
+	if (err)
+		goto out_wl;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_alloc);
+	if (err)
+		goto out_bgt;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_io);
+	if (err)
+		goto out_alloc;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_bld);
+	if (err)
+		goto out_io;
+
+	err = class_device_create_file(&dbg_dev, &ubi_debug_scan);
+	if (err)
+		goto out_bld;
+
+	return 0;
+
+out_bld:
+	class_device_remove_file(&dbg_dev, &ubi_debug_bld);
+out_io:
+	class_device_remove_file(&dbg_dev, &ubi_debug_io);
+out_alloc:
+	class_device_remove_file(&dbg_dev, &ubi_debug_alloc);
+out_bgt:
+	class_device_remove_file(&dbg_dev, &ubi_debug_bgt);
+out_wl:
+	class_device_remove_file(&dbg_dev, &ubi_debug_wl);
+out_eba:
+	class_device_remove_file(&dbg_dev, &ubi_debug_eba);
+out_acc:
+	class_device_remove_file(&dbg_dev, &ubi_debug_acc);
+out_dtbl:
+	class_device_remove_file(&dbg_dev, &ubi_debug_dtbl);
+out_vtbl:
+	class_device_remove_file(&dbg_dev, &ubi_debug_vtbl);
+out_upd:
+	class_device_remove_file(&dbg_dev, &ubi_debug_upd);
+out_vmt:
+	class_device_remove_file(&dbg_dev, &ubi_debug_vmt);
+out_uif:
+	class_device_remove_file(&dbg_dev, &ubi_debug_uif);
+out_class:
+	class_device_unregister(&dbg_dev);
+	return err;
+}
+
+/**
+ * remove_debugging_stuff - remove debugging-related sysfs files.
+ *
+ * @class: the parent class
+ */
+static void remove_debugging_stuff(void)
+{
+	class_device_remove_file(&dbg_dev, &ubi_debug_scan);
+	class_device_remove_file(&dbg_dev, &ubi_debug_bld);
+	class_device_remove_file(&dbg_dev, &ubi_debug_io);
+	class_device_remove_file(&dbg_dev, &ubi_debug_alloc);
+	class_device_remove_file(&dbg_dev, &ubi_debug_bgt);
+	class_device_remove_file(&dbg_dev, &ubi_debug_wl);
+	class_device_remove_file(&dbg_dev, &ubi_debug_eba);
+	class_device_remove_file(&dbg_dev, &ubi_debug_acc);
+	class_device_remove_file(&dbg_dev, &ubi_debug_dtbl);
+	class_device_remove_file(&dbg_dev, &ubi_debug_vtbl);
+	class_device_remove_file(&dbg_dev, &ubi_debug_upd);
+	class_device_remove_file(&dbg_dev, &ubi_debug_vmt);
+	class_device_remove_file(&dbg_dev, &ubi_debug_uif);
+	class_device_unregister(&dbg_dev);
+}
+
+/**
+ * dbg_input_check - check that user writes sane data to the debugging-related
+ * files.
+ *
+ * @buf: the buffer with data
+ * @count: how many bytes were written
+ *
+ * This function returns zero if the data is OK and %-EINVAL if not.
+ */
+static inline int dbg_input_check(const char *buf, size_t count)
+{
+	if (count > 2 || (buf[0] != '1' && buf[0] != '0'))
+		return -EINVAL;
+	return 0;
+}
+
+static ssize_t ubi_debug_uif_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_uif);
+}
+static ssize_t ubi_debug_uif_store(struct class_device *dev,
+				   const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_uif = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_vmt_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_vmt);
+}
+static ssize_t ubi_debug_vmt_store(struct class_device *dev,
+				   const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_vmt = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_upd_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_upd);
+}
+static ssize_t ubi_debug_upd_store(struct class_device *dev,
+				   const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_upd = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_vtbl_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_vtbl);
+}
+static ssize_t ubi_debug_vtbl_store(struct class_device *dev,
+				    const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_vtbl = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_dtbl_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_dtbl);
+}
+static ssize_t ubi_debug_dtbl_store(struct class_device *dev,
+				    const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_dtbl = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_acc_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_acc);
+}
+static ssize_t ubi_debug_acc_store(struct class_device *dev,
+				   const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_acc = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_eba_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_eba);
+}
+static ssize_t ubi_debug_eba_store(struct class_device *dev,
+				   const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_eba = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_wl_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_wl);
+}
+static ssize_t ubi_debug_wl_store(struct class_device *dev,
+				  const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_wl = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_bgt_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_bgt);
+}
+static ssize_t ubi_debug_bgt_store(struct class_device *dev,
+				   const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_bgt = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_alloc_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_alloc);
+}
+static ssize_t ubi_debug_alloc_store(struct class_device *dev,
+				     const char *buf, size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_alloc = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_io_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_alloc);
+}
+static ssize_t ubi_debug_io_store(struct class_device *dev,
+				  const char *buf,  size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_io = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_bld_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_alloc);
+}
+static ssize_t ubi_debug_bld_store(struct class_device *dev,
+				   const char *buf,  size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_bld = (buf[0] == '1');
+	return 1;
+}
+
+static ssize_t ubi_debug_scan_show(struct class_device *dev, char *buf)
+{
+	return sprintf(buf, "%d\n", ubi_debugging_alloc);
+}
+static ssize_t ubi_debug_scan_store(struct class_device *dev,
+				    const char *buf,  size_t count)
+{
+	if (dbg_input_check(buf, count))
+		return -EINVAL;
+	ubi_debugging_scan = (buf[0] == '1');
+	return 1;
+}
+
+#endif /* !CONFIG_MTD_UBI_DEBUG_RUNTIME */
diff --git a/drivers/mtd/ubi/sysfs.h b/drivers/mtd/ubi/sysfs.h
new file mode 100644
index 0000000..03e38ce
--- /dev/null
+++ b/drivers/mtd/ubi/sysfs.h
@@ -0,0 +1,80 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * This is a part of the UBI user interface unit and contains all the
+ * sysfs-related stuff.
+ */
+
+#ifndef __UBI_SYSFS_H__
+#define __UBI_SYSFS_H__
+
+struct ubi_info;
+struct ubi_uif_volume;
+
+/**
+ * ubi_vol_sysfs_init - initialize sysfs for an UBI volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol: an UIF volume description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_vol_sysfs_init(const struct ubi_info *ubi, struct ubi_uif_volume *vol);
+
+/**
+ * ubi_vol_sysfs_init - close sysfs for an UBI volume.
+ *
+ * @vol: an UIF volume description object
+ */
+void ubi_vol_sysfs_close(struct ubi_uif_volume *vol);
+
+/**
+ * ubi_sysfs_init - initialize sysfs for an UBI device.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_sysfs_init(const struct ubi_info *ubi);
+
+/**
+ * ubi_sysfs_close - close sysfs for an UBI device.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_sysfs_close(const struct ubi_info *ubi);
+
+/**
+ * ubi_sysfs_global_init - initialize UBI sysfs support.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_sysfs_global_init(void);
+
+/**
+ * ubi_sysfs_global_close - close UBI sysfs support.
+ */
+void ubi_sysfs_global_close(void);
+
+#endif /* !__UBI_SYSFS_H__ */
diff --git a/drivers/mtd/ubi/tests/Makefile b/drivers/mtd/ubi/tests/Makefile
new file mode 100644
index 0000000..e9580b5
--- /dev/null
+++ b/drivers/mtd/ubi/tests/Makefile
@@ -0,0 +1,4 @@
+CHECK = sparse -Wbitwise
+
+obj-m += test_eba_stress.o
+test_eba_stress-objs := eba_stress.o
diff --git a/drivers/mtd/ubi/tests/common.h b/drivers/mtd/ubi/tests/common.h
new file mode 100644
index 0000000..5b83e2f
--- /dev/null
+++ b/drivers/mtd/ubi/tests/common.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#ifndef __UBI_TESTS_COMMON_H__
+#define __UBI_TESTS_COMMON_H__
+
+#include <linux/kernel.h>
+
+#define UT_MSG_PREF KERN_CRIT "[UBI unit test]"
+#define UT_ERR_PREF KERN_CRIT "UBI unit test error!"
+
+/* UBI unit test messages */
+#define ut_msg(fmt, ...) do {                            \
+	printk(UT_MSG_PREF " " fmt "\n", ##__VA_ARGS__); \
+} while (0)
+
+/* UBI unit test error messages */
+#define ut_err(fmt, ...) do {                                              \
+	printk(UT_ERR_PREF " %s: " fmt "\n", __FUNCTION__, ##__VA_ARGS__); \
+} while (0)
+
+/* If a function call fails, this macro is used to print the error message */
+#define ut_func_fail(func, err) do {                                   \
+	printk(UT_ERR_PREF " %s: function \"%s\" returned error %s\n", \
+	                   __FUNCTION__, func, ut_err_str(err));       \
+} while (0)
+
+#endif /* __UBI_TESTS_COMMON_H__ */
diff --git a/drivers/mtd/ubi/tests/eba_stress.c b/drivers/mtd/ubi/tests/eba_stress.c
new file mode 100644
index 0000000..f9e6b9c
--- /dev/null
+++ b/drivers/mtd/ubi/tests/eba_stress.c
@@ -0,0 +1,303 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * A stress test for the EBA subsystem. This test is primarily made for
+ * detecting locking problems in the EBA and WL units.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/completion.h>
+#include <linux/spinlock.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/mtd/ubi.h>
+#include <mtd/ubi-header.h>
+#include "common.h"
+#include "../ubi.h"
+#include "../eba.h"
+#include "../io.h"
+#include "../account.h"
+#include "../vtbl.h"
+#include "../volmgmt.h"
+
+/* The UBI device number to run the test on */
+static unsigned int ubi_num;
+module_param(ubi_num, uint, 0);
+
+/* How many volumes to use */
+static unsigned int vols_num = 1;
+module_param(vols_num,  uint, 0);
+
+/* How many threads to run */
+static unsigned int threads_num = 2;
+module_param(threads_num,  uint, 0);
+
+/* How many iterations do tasks have to make */
+static unsigned int iters_num = 1000;
+module_param(iters_num, uint, 0);
+
+static volatile int error;
+static volatile int exit = 0;
+static int vols_size;
+static struct completion *compl;
+static struct mutex *mutexes;
+static char *leb_busy;
+
+static int tester_thread(void *u);
+
+__init int eba_stress_init(void)
+{
+	int i;
+	const struct ubi_info *ubi;
+	struct ubi_vtbl_vtr vtr;
+	char name_buf[20];
+
+	ut_msg("test UBI %u, %u volumes, %u threads, %u iterations",
+	       ubi_num, vols_num, threads_num, iters_num);
+
+	if (ubi_num >= ubis_num || !ubis[ubi_num] || threads_num > 100)
+		return -EINVAL;
+
+	ubi = ubis[ubi_num];
+	if (vols_num > ubi->acc->avail_pebs || vols_num == 0)
+		return -EINVAL;
+
+	compl = kmalloc(sizeof(struct completion) * threads_num, GFP_KERNEL);
+	if (!compl)
+		return -ENOMEM;
+	for (i = 0; i < threads_num; i++)
+		init_completion(&compl[i]);
+
+	vols_size = ubi->acc->avail_pebs / vols_num;
+	mutexes = kmalloc(sizeof(struct mutex)*vols_num*vols_size, GFP_KERNEL);
+	if (!mutexes) {
+		error = -ENOMEM;
+		goto out_compl;
+	}
+	for (i = 0; i < vols_num*vols_size; i++)
+		mutex_init(&mutexes[i]);
+
+	leb_busy = kzalloc(vols_num*vols_size, GFP_KERNEL);
+	if (!leb_busy) {
+		error = -ENOMEM;
+		goto out_mutexes;
+	}
+
+	vtr.alignment = 1;
+	vtr.data_pad = 0;
+	vtr.vol_type = UBI_DYNAMIC_VOLUME;
+
+	for (i = 0; i < vols_num; i++) {
+		vtr.reserved_pebs = vols_size;
+		vtr.name_len = sprintf(&name_buf[0], "vol_%d", i);
+		vtr.name = &name_buf[0];
+		error = ubi_vmt_mkvol(ubi, i, &vtr);
+		if (error != i) {
+			int j;
+
+			ut_err("cannot create volume %d, error %d", i, error);
+			for (j = 0; j < i; j++)
+				ubi_vmt_rmvol(ubi, j);
+			goto out_leb_busy;
+		}
+	}
+
+	for (i = 0; i < threads_num; i++) {
+		pid_t pid;
+
+		pid = kernel_thread(tester_thread, (void *)i, CLONE_FS | CLONE_FILES);
+		if (pid < 0) {
+			int j;
+			ut_err("cannot spawn tread %d, error %d", i, pid);
+			error = pid;
+			for (j = 0; j < i; j++) {
+				exit = 1;
+				wait_for_completion(&compl[j]);
+			}
+			goto out_rmvol;
+		}
+	}
+
+	wait_for_completion(&compl[0]);
+	exit = 1;
+
+	for (i = 1; i < threads_num; i++)
+		wait_for_completion(&compl[i]);
+
+out_rmvol:
+	for (i = 0; i < vols_num; i++)
+		ubi_vmt_rmvol(ubi, i);
+out_leb_busy:
+	kfree(leb_busy);
+out_mutexes:
+	kfree(mutexes);
+out_compl:
+	kfree(compl);
+	return error;
+}
+module_init(eba_stress_init);
+
+static unsigned long random(void);
+static int leb_read(void *buf);
+static int leb_write(void *buf);
+static int leb_erase(void);
+
+static int tester_thread(void *u)
+{
+	int err, num = (int)u;
+	void *read_buf, *write_buf;
+	const struct ubi_info *ubi = ubis[ubi_num];
+
+	read_buf = kmalloc(ubi->io->leb_size, GFP_KERNEL);
+	if (!read_buf) {
+		error = -ENOMEM;
+		exit = 1;
+	}
+	write_buf = kmalloc(ubi->io->leb_size, GFP_KERNEL);
+	if (!write_buf) {
+		error = -ENOMEM;
+		exit = 1;
+	}
+
+	ut_msg("thread %d has started (PID %d)", num, current->pid);
+	for (;;) {
+		cond_resched();
+
+		if (exit || (num == 0 && iters_num-- <= 0))
+			break;
+
+		switch (random() % 3) {
+		case 0:
+			err = leb_read(read_buf);
+			if (unlikely(err)) {
+				ut_err("leb_read() returned error %d", err);
+				error = err;
+				goto out;
+			}
+			break;
+		case 1:
+			err = leb_write(write_buf);
+			if (unlikely(err)) {
+				ut_err("leb_write() returned error %d", err);
+				error = err;
+				goto out;
+			}
+			break;
+		case 2:
+			err = leb_erase();
+			if (unlikely(err)) {
+				ut_err("leb_erase() returned error %d", err);
+				error = err;
+				goto out;
+			}
+			break;
+		}
+	}
+
+out:
+	exit = 1;
+	kfree(read_buf);
+	kfree(write_buf);
+	ut_msg("thread %d (PID %d) has finished", num, current->pid);
+	complete_and_exit(&compl[num], 0);
+}
+
+static int leb_read(void *buf)
+{
+	int err, read, vol_id = random() % vols_num;
+	int lnum = random() % vols_size;
+	const struct ubi_info *ubi = ubis[ubi_num];
+
+	//ut_msg("pid %d: read from LEB %d:%d", current->pid, vol_id, lnum);
+	err = ubi_eba_read_leb(ubi, vol_id, lnum, buf, 0, ubi->io->leb_size, 0,
+			       &read);
+	return err;
+}
+
+static int leb_write(void *buf)
+{
+	int err, written, vol_id = random() % vols_num;
+	int lnum = random() % vols_size;
+	int n = vol_id*vols_size + lnum;
+	const struct ubi_info *ubi = ubis[ubi_num];
+
+	mutex_lock(&mutexes[n]);
+	if (leb_busy[n]) {
+		mutex_unlock(&mutexes[n]);
+		return 0;
+	}
+	//ut_msg("pid %d: write to LEB %d:%d, n = %d",
+	//       current->pid, vol_id, lnum, n);
+	err = ubi_eba_write_leb(ubi, vol_id, lnum, buf, 0, ubi->io->leb_size,
+				UBI_DATA_UNKNOWN, 0, &written, NULL);
+	leb_busy[n] = 1;
+	mutex_unlock(&mutexes[n]);
+	return err;
+}
+
+static int leb_erase(void)
+{
+	int err, vol_id = random() % vols_num, lnum = random() % vols_size;
+	int n = vol_id*vols_size + lnum;
+	const struct ubi_info *ubi = ubis[ubi_num];
+
+	//ut_msg("pid %d: erase LEB %d:%d, n = %d",
+	//       current->pid, vol_id, lnum, n);
+	mutex_lock(&mutexes[n]);
+	err = ubi_eba_erase_leb(ubi, vol_id, lnum);
+	leb_busy[n] = 0;
+	mutex_unlock(&mutexes[n]);
+	return err;
+}
+
+
+static spinlock_t random_lock = SPIN_LOCK_UNLOCKED;
+static unsigned long RandomValue = 1;
+
+/* Borrowed from XFS */
+static unsigned long random(void)
+{
+	/* cycles pseudo-randomly through all values between 1 and 2^31 - 2 */
+	register long rv;
+	register long lo;
+	register long hi;
+
+	spin_lock(&random_lock);
+	rv = RandomValue;
+	hi = rv / 127773;
+	lo = rv % 127773;
+	rv = 16807 * lo - 2836 * hi;
+	if (rv <= 0) rv += 2147483647;
+	RandomValue = rv;
+	spin_unlock(&random_lock);
+	return rv;
+}
+
+__exit static void eba_stress_exit(void)
+{
+}
+module_exit(eba_stress_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Artem B. Bityutskiy <dedekind@infradead.org>");
+MODULE_DESCRIPTION("EBA unit stress test");
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
new file mode 100644
index 0000000..55eed58
--- /dev/null
+++ b/drivers/mtd/ubi/ubi.h
@@ -0,0 +1,145 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#ifndef __UBI_UBI_H__
+#define __UBI_UBI_H__
+
+#include <linux/mtd/ubi.h>
+#include <linux/spinlock.h>
+
+/*
+ * The following abbreviations are used throughout the code:
+ *
+ * dtr  - data table record
+ * EB   - Erasable Block
+ * ebs  - eraseblocks
+ * EC   - Erase Counter
+ * ivol - internal volume
+ * LEB  - Logical EraseBlock
+ * leb  - logical eraseblock
+ * lnum - logical eraseblock number
+ * PEB  - Physical EraseBlock
+ * pnum - physical eraseblock number
+ * si   - scanning information
+ * VID  - Volume IDentifier
+ * vol  - volume
+ * vtr  - volume table record
+ */
+
+/*
+ * Version of this UBI implementation.
+ */
+#define UBI_VERSION 1
+
+/*
+ * Maximum number of supported UBI devices.
+ */
+#define UBI_MAX_INSTANCES 32
+
+/*
+ * Prefixes of UBI messages.
+ */
+#define UBI_MSG_PREF  KERN_CRIT "UBI:"
+#define UBI_ERR_PREF  KERN_CRIT "UBI error !!!"
+#define UBI_WARN_PREF KERN_CRIT "UBI warning !!!"
+
+/*
+ * A lock that serializes UBI output.
+ */
+extern spinlock_t __ubi_output_lock;
+
+/*
+ * Normal UBI messages.
+ */
+#define ubi_msg(fmt, ...) do {                              \
+	spin_lock(&__ubi_output_lock);                      \
+	printk(UBI_MSG_PREF " " fmt "\n", ##__VA_ARGS__);   \
+	spin_unlock(&__ubi_output_lock);                    \
+} while (0);
+
+/*
+ * UBI error messages.
+ */
+#define ubi_err(fmt, ...) do {                              \
+	spin_lock(&__ubi_output_lock);                      \
+	printk(UBI_ERR_PREF " (pid:%d) %s: " fmt "\n",      \
+	       current->pid, __FUNCTION__,  ##__VA_ARGS__); \
+	spin_unlock(&__ubi_output_lock);                    \
+} while (0)
+
+/*
+ * UBI warning messages.
+ */
+#define ubi_warn(fmt, ...) do {                             \
+	spin_lock(&__ubi_output_lock);                      \
+	printk(UBI_WARN_PREF " (pid:%d) %s: " fmt "\n",     \
+	       current->pid, __FUNCTION__, ##__VA_ARGS__);  \
+	spin_unlock(&__ubi_output_lock);                    \
+} while (0)
+
+struct ubi_io_info;
+struct ubi_wl_info;
+struct ubi_beb_info;
+struct ubi_vmt_info;
+struct ubi_ivol_info;
+struct ubi_vtbl_info;
+struct ubi_dtbl_info;
+struct ubi_acc_info;
+struct ubi_upd_info;
+struct ubi_eba_info;
+struct ubi_uif_info;
+struct ubi_bgt_info;
+
+/**
+ * struct ubi_info - UBI device description structure
+ *
+ * @ubi_num: number of the UBI device
+ * @io: input/output unit's data
+ * @bgt: background thread unit's data
+ * @wl: wear-leveling unit's data
+ * @vmt: volume management unit's data
+ * @ivol: internal volume management unit's data
+ * @vtbl: volume table unit's data
+ * @dtbl: data table unit's data
+ * @acc: accounting unit's data
+ * @upd: update unit's data
+ * @eba: EBA unit's data unit's data
+ * @uif: user interface unit's data
+ */
+struct ubi_info {
+	int ubi_num;
+	struct ubi_io_info   *io;
+	struct ubi_bgt_info  *bgt;
+	struct ubi_wl_info   *wl;
+	struct ubi_beb_info  *beb;
+	struct ubi_vmt_info  *vmt;
+	struct ubi_ivol_info *ivol;
+	struct ubi_vtbl_info *vtbl;
+	struct ubi_dtbl_info *dtbl;
+	struct ubi_acc_info  *acc;
+	struct ubi_upd_info  *upd;
+	struct ubi_eba_info  *eba;
+	struct ubi_uif_info  *uif;
+};
+
+extern int ubis_num;
+extern struct ubi_info *ubis[UBI_MAX_INSTANCES];
+
+#endif /* !__UBI_UBI_H__ */
diff --git a/drivers/mtd/ubi/uif.c b/drivers/mtd/ubi/uif.c
new file mode 100644
index 0000000..3c07e13
--- /dev/null
+++ b/drivers/mtd/ubi/uif.c
@@ -0,0 +1,985 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/sched.h>
+#include <linux/err.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "misc.h"
+#include "sysfs.h"
+#include "upd.h"
+#include "wl.h"
+#include "uif.h"
+#include "cdev.h"
+#include "alloc.h"
+#include "debug.h"
+#include "vtbl.h"
+#include "dtbl.h"
+#include "volmgmt.h"
+#include "io.h"
+#include "eba.h"
+#include "account.h"
+
+/*
+ * Global UBI callbacks which may be registered by the
+ * 'ubi_register_callbacks()' function.
+ */
+static const struct ubi_client_callbacks *ubi_callbacks;
+/* Protects @ubi_callbacks */
+static struct mutex callbacks_lock;
+
+static int check_volume(struct ubi_uif_volume *vol);
+
+ubi_desc_t ubi_open_volume(int ubi_num, int vol_id, enum ubi_open_mode mode)
+{
+	int err, found = 0;
+	struct ubi_vol_desc *desc;
+	const struct ubi_info *ubi;
+	struct ubi_uif_info *uif;
+	struct ubi_uif_volume *vol;
+
+	dbg_uif("open device %d volume %d, mode %d", ubi_num, vol_id, mode);
+
+	err = -ENODEV;
+	if (!try_module_get(THIS_MODULE))
+		return ERR_PTR(err);
+
+	if (!ubis[ubi_num]) {
+		dbg_uif("UBI device %d does not exist", ubi_num);
+		goto out_put;
+	}
+
+	ubi = ubis[ubi_num];
+	ubi_assert(ubi->ubi_num == ubi_num);
+	uif = ubi->uif;
+
+	desc = ubi_kzalloc(sizeof(struct ubi_vol_desc), GFP_KERNEL);
+	if (!desc) {
+		err = -ENOMEM;
+		goto out_put;
+	}
+
+	err = -EINVAL;
+	if (vol_id < 0 || vol_id >= ubi->acc->max_volumes) {
+		dbg_uif("bad vol_id %d", vol_id);
+		goto out_free;
+	}
+
+	if (mode != UBI_READONLY && mode != UBI_READWRITE &&
+	    mode != UBI_EXCLUSIVE) {
+		dbg_uif("mad mode %d", mode);
+		goto out_free;
+	}
+
+	mutex_lock(&uif->list_lock);
+	list_for_each_entry(vol, &uif->volumes, list)
+		if (vol->vol_id == vol_id) {
+			found = 1;
+			break;
+		}
+	if (!found) {
+		dbg_uif("volume %d does not exist", vol_id);
+		err = -ENODEV;
+		goto out_unlock;
+	}
+
+	err = -EBUSY;
+	spin_lock(&vol->vol_lock);
+	if (vol->updating) {
+		/* If the volume is being updated, no one can open it */
+		dbg_uif("device busy - updating");
+		goto out_unlock_vol;
+	}
+
+	switch (mode) {
+	case UBI_READONLY:
+		if (vol->exclusive) {
+			dbg_uif("device is busy - exclusive");
+			goto out_unlock_vol;
+		}
+		vol->readers += 1;
+		break;
+
+	case UBI_READWRITE:
+		if (vol->exclusive || vol->writers > 0) {
+			if (vol->exclusive)
+				dbg_uif("device is busy - exclusive");
+			else
+				dbg_uif("device is busy - writers");
+			goto out_unlock_vol;
+		}
+		vol->writers += 1;
+		break;
+
+	case UBI_EXCLUSIVE:
+		if (vol->exclusive || vol->writers || vol->readers) {
+			if (vol->exclusive)
+				dbg_uif("device is busy - exclusive");
+			else if (vol->writers)
+				dbg_uif("device is busy - writers");
+			else
+				dbg_uif("device is busy - readers");
+			goto out_unlock_vol;
+		}
+		vol->exclusive = 1;
+		break;
+	}
+	spin_unlock(&vol->vol_lock);
+	mutex_unlock(&uif->list_lock);
+
+	desc->vol = vol;
+	desc->mode = mode;
+
+	mutex_lock(&uif->vol_check);
+	if (!vol->checked) {
+		/*
+		 * This is the first time this volume is being opened, we have
+		 * to check it. If the volume is corrupted, we still return
+		 * success.
+		 */
+		err = check_volume(vol);
+		if (err) {
+			mutex_unlock(&uif->vol_check);
+			ubi_close_volume(desc);
+			return ERR_PTR(err);
+		}
+		vol->checked = 1;
+	}
+	mutex_unlock(&uif->vol_check);
+
+	return desc;
+
+out_unlock_vol:
+	spin_unlock(&vol->vol_lock);
+out_unlock:
+	mutex_unlock(&uif->list_lock);
+out_free:
+	ubi_kfree(desc);
+out_put:
+	module_put(THIS_MODULE);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(ubi_open_volume);
+
+ubi_desc_t ubi_open_volume_nm(int ubi_num, const char *name,
+			      enum ubi_open_mode mode)
+{
+	int err, len, vol_id = -1;
+	ubi_desc_t ret;
+	const struct ubi_info *ubi;
+	struct ubi_uif_info *uif;
+	struct ubi_uif_volume *vol;
+
+	dbg_uif("open volume by name %s, mode %d", name, mode);
+
+	if (!name) {
+		dbg_uif("bad name");
+		return ERR_PTR(-EINVAL);
+	}
+	len = strnlen(name, UBI_VOL_NAME_MAX + 1);
+	if (len > UBI_VOL_NAME_MAX) {
+		dbg_uif("bad name");
+		return ERR_PTR(-EINVAL);
+	}
+
+	err = -ENODEV;
+	if (!try_module_get(THIS_MODULE))
+		return ERR_PTR(err);
+
+	if (!ubis[ubi_num]) {
+		dbg_uif("UBI device %d does not exist", ubi_num);
+		goto out_put;
+	}
+
+	ubi = ubis[ubi_num];
+	ubi_assert(ubi->ubi_num == ubi_num);
+	uif = ubi->uif;
+
+	/* Walk all volumes of this UBI device */
+	mutex_lock(&uif->list_lock);
+	list_for_each_entry(vol, &uif->volumes, list) {
+		const struct ubi_vtbl_vtr *vtr;
+
+		spin_lock(&vol->vol_lock);
+		vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
+		if (len == vtr->name_len && !strcmp(name, vtr->name)) {
+			vol_id = vol->vol_id;
+			dbg_uif("found volume volume %d", vol_id);
+			spin_unlock(&vol->vol_lock);
+			break;
+		}
+		spin_unlock(&vol->vol_lock);
+	}
+	mutex_unlock(&uif->list_lock);
+
+	if (vol_id < 0) {
+		dbg_uif("volume %s does not exist", name);
+		goto out_put;
+	}
+
+	ret = ubi_open_volume(ubi_num, vol_id, mode);
+	if (!IS_ERR(ret))
+		return ret;
+
+	err = PTR_ERR(ret);
+
+out_put:
+	module_put(THIS_MODULE);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(ubi_open_volume_nm);
+
+void ubi_close_volume(ubi_desc_t udesc)
+{
+	struct ubi_vol_desc *desc = udesc;
+	struct ubi_uif_volume *vol = desc->vol;
+	void *free_buf = NULL;
+
+	dbg_uif("close volume %d, mode %d", vol->vol_id, desc->mode);
+
+	spin_lock(&vol->vol_lock);
+	if (vol->updating) {
+		/*
+		 * Update was not finished. The update marker is still there
+		 * and no other volumes may be updated until this update is
+		 * finished.
+		 */
+		ubi_warn("update of volume %d was not finished", vol->vol_id);
+		free_buf = vol->upd_buf;
+		vol->upd_buf = NULL;
+		vol->updating = 0;
+	}
+
+	switch (desc->mode) {
+	case UBI_READONLY:
+		ubi_assert(vol->readers > 0);
+		vol->readers -= 1;
+		break;
+
+	case UBI_READWRITE:
+		ubi_assert(vol->writers > 0);
+		vol->writers -= 1;
+		break;
+
+	case UBI_EXCLUSIVE:
+		ubi_assert(vol->exclusive > 0);
+		vol->exclusive = 0;
+	}
+	spin_unlock(&vol->vol_lock);
+
+	ubi_kfree(free_buf);
+	ubi_kfree(desc);
+	module_put(THIS_MODULE);
+}
+EXPORT_SYMBOL_GPL(ubi_close_volume);
+
+static void init_ubi_vol_info(const struct ubi_info *ubi, int vol_id,
+			      struct ubi_vol_info *vi);
+
+int ubi_register_callbacks(const struct ubi_client_callbacks *cbs)
+{
+	int i, err;
+	const struct ubi_info *ubi;
+	struct ubi_uif_info *uif;
+	const struct ubi_uif_volume *vol;
+
+	if (!cbs) {
+		dbg_uif("cbs = NULL");
+		return -EINVAL;
+	}
+
+	if (!try_module_get(THIS_MODULE))
+		return-ENODEV;
+
+	mutex_lock(&callbacks_lock);
+	if (ubi_callbacks) {
+		dbg_uif("callbacks are already installed");
+		mutex_unlock(&callbacks_lock);
+		return -EBUSY;
+	}
+
+	if (!cbs->ubi_mkvol) {
+		ubi_callbacks = cbs;
+		mutex_unlock(&callbacks_lock);
+		return 0;
+	}
+
+	/* Walk all UBI devices */
+	for (i = 0; i < ubis_num; i++) {
+		ubi = ubis[i];
+		ubi_assert(ubi->ubi_num == i);
+		uif = ubi->uif;
+
+		mutex_lock(&uif->list_lock);
+		list_for_each_entry(vol, &uif->volumes, list) {
+			struct ubi_vol_info vi;
+
+			init_ubi_vol_info(ubi, vol->vol_id, &vi);
+			err = cbs->ubi_mkvol(i, &vi);
+			if (err) {
+				dbg_uif("ubi_mkvol callback for UBI dev %d, "
+					"volume %d returned error %d",
+					i, vol->vol_id, err);
+				goto out_unlock;
+			}
+		}
+		mutex_unlock(&uif->list_lock);
+	}
+	ubi_callbacks = cbs;
+	mutex_unlock(&callbacks_lock);
+	return 0;
+
+out_unlock:
+	mutex_unlock(&callbacks_lock);
+	mutex_unlock(&uif->list_lock);
+	module_put(THIS_MODULE);
+	return err;
+}
+EXPORT_SYMBOL_GPL(ubi_register_callbacks);
+
+int ubi_unregister_callbacks(void)
+{
+	int err = 0;
+
+	mutex_lock(&callbacks_lock);
+	if (!ubi_callbacks)
+		err = -EEXIST;
+	else
+		ubi_callbacks = NULL;
+	mutex_unlock(&callbacks_lock);
+	return err;
+}
+EXPORT_SYMBOL_GPL(ubi_unregister_callbacks);
+
+int ubi_eraseblock_read(ubi_desc_t udesc, int lnum, char *buf, int offset,
+			int len, int check, int *read)
+{
+	const struct ubi_dtbl_dtr *dtr;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vol_desc *desc = udesc;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	int err, vol_id = desc->vol->vol_id;
+
+	dbg_uif("read %d bytes from offset %d of LEB %d:%d",
+		len, offset, vol_id, lnum);
+
+	if (unlikely(vol_id < 0 || vol_id >= ubi->acc->max_volumes)) {
+		dbg_uif("bad vol_id %d", vol_id);
+		return -EINVAL;
+	}
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+	dtr = ubi_dtbl_get_dtr(ubi, vol_id);
+
+	if (unlikely(lnum < 0 || lnum >= dtr->used_ebs)) {
+		dbg_uif("bad lnum %d", lnum);
+		return -EINVAL;
+	}
+
+	if (unlikely(offset < 0 || len < 0 ||
+		     offset + len > vtr->usable_leb_size)) {
+		dbg_uif("bad offset %d or len %d", offset, len);
+		return -EINVAL;
+	}
+
+	if (unlikely(vtr->vol_type == UBI_STATIC_VOLUME &&
+		     lnum == dtr->used_ebs - 1 &&
+		     offset + len > dtr->last_eb_bytes)) {
+		dbg_uif("bad offset %d or len %d for last LEB", offset, len);
+		return -EINVAL;
+	}
+
+	err = ubi_eba_read_leb(ubi, vol_id, lnum, buf, offset, len, check,
+			       read);
+	if (unlikely(err))
+		return err;
+	if (unlikely(dtr->corrupted)) {
+		ubi_assert(vtr->vol_type == UBI_STATIC_VOLUME);
+		dbg_uif("corrupted volume");
+		err = -EUCLEAN;
+	}
+	return err;
+}
+EXPORT_SYMBOL_GPL(ubi_eraseblock_read);
+
+int ubi_eraseblock_write(ubi_desc_t udesc, int lnum, const void *buf,
+			 int offset, int len, enum ubi_data_type dtype,
+			 int *written)
+{
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vol_desc *desc = udesc;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	const struct ubi_io_info *io = ubi->io;
+	int vol_id = desc->vol->vol_id;
+
+	dbg_uif("write %d bytes at offset %d of LEB %d:%d",
+		len, offset, vol_id, lnum);
+
+	if (unlikely(vol_id < 0 || vol_id >= ubi->acc->max_volumes)) {
+		dbg_uif("bad vol_id %d", vol_id);
+		return -EINVAL;
+	}
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+
+	if (unlikely(desc->mode == UBI_READONLY)) {
+		dbg_uif("read-only mode");
+		return -EROFS;
+	}
+
+	if (unlikely(vtr->vol_type == UBI_STATIC_VOLUME)) {
+		dbg_uif("static volume");
+		return -EROFS;
+	}
+
+	if (unlikely(lnum < 0 || lnum >= vtr->reserved_pebs)) {
+		dbg_uif("bad lnum %d", lnum);
+		return -EINVAL;
+	}
+
+	if (unlikely(offset < 0 || len < 0 ||
+		     offset + len > vtr->usable_leb_size)) {
+		dbg_uif("bad offset %d or len %d", offset, len);
+		return -EINVAL;
+	}
+
+	if (unlikely(offset % io->min_io_size || len % io->min_io_size)) {
+		dbg_uif("unaligned offset %d or len %d", offset, len);
+		return -EINVAL;
+	}
+
+	if (unlikely(dtype != UBI_DATA_LONGTERM &&
+		     dtype != UBI_DATA_SHORTTERM &&
+		     dtype != UBI_DATA_UNKNOWN)) {
+		dbg_uif("bad dtype %d", dtype);
+		return -EINVAL;
+	}
+
+	return ubi_eba_write_leb(ubi, vol_id, lnum, buf, offset, len, dtype, 0,
+				 written, NULL);
+}
+EXPORT_SYMBOL_GPL(ubi_eraseblock_write);
+
+int ubi_eraseblock_erase(ubi_desc_t udesc, int lnum)
+{
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vol_desc *desc = udesc;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	int vol_id = desc->vol->vol_id;
+
+
+	dbg_uif("erase LEB %d:%d", vol_id, lnum);
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+
+	if (unlikely(desc->mode == UBI_READONLY)) {
+		dbg_uif("read-only mode");
+		return -EROFS;
+	}
+
+	if (unlikely(vtr->vol_type == UBI_STATIC_VOLUME)) {
+		dbg_uif("static volume");
+		return -EROFS;
+	}
+
+	if (unlikely(lnum < 0 || lnum >= vtr->reserved_pebs)) {
+		dbg_uif("bad lnum %d", lnum);
+		return -EINVAL;
+	}
+
+	return ubi_eba_erase_leb(ubi, vol_id, lnum);
+}
+EXPORT_SYMBOL_GPL(ubi_eraseblock_erase);
+
+void ubi_get_volume_info(ubi_desc_t udesc, struct ubi_vol_info *vi)
+{
+	struct ubi_vol_desc *desc = udesc;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	int vol_id = desc->vol->vol_id;
+
+	init_ubi_vol_info(ubi, vol_id, vi);
+}
+EXPORT_SYMBOL_GPL(ubi_get_volume_info);
+
+int ubi_uif_mkvol(const struct ubi_info *ubi, int vol_id)
+{
+	int err;
+	struct ubi_uif_volume *vol;
+	struct ubi_uif_info *uif = ubi->uif;
+	const struct ubi_vtbl_vtr *vtr;
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+
+	dbg_uif("create volume %d, size %d, type %d",
+		vol_id, vtr->reserved_pebs, vtr->vol_type);
+
+	vol = ubi_kzalloc(sizeof(struct ubi_uif_volume), GFP_KERNEL);
+	if (!vol)
+		return -ENOMEM;
+	vol->ubi = ubi;
+	vol->vol_id = vol_id;
+	vol->exclusive = 1;
+	spin_lock_init(&vol->vol_lock);
+
+	mutex_lock(&uif->list_lock);
+	list_add(&vol->list, &uif->volumes);
+	mutex_unlock(&uif->list_lock);
+
+	err = ubi_vol_sysfs_init(ubi, vol);
+	if (err)
+		goto out_sysfs;
+
+	err = ubi_volume_cdev_init(ubi, vol);
+	if (err)
+		goto out_sysfs;
+
+	/* Invoke the 'ubi_mkvol()' callback */
+	mutex_lock(&uif->list_lock);
+	if (ubi_callbacks && ubi_callbacks->ubi_mkvol) {
+		const struct ubi_dtbl_dtr *dtr;
+		struct ubi_vol_info vi;
+
+		dtr = ubi_dtbl_get_dtr(ubi, vol_id);
+		ubi_assert(!IS_ERR(dtr));
+
+		vi.vol_id = vol_id;
+		vi.size = vtr->reserved_pebs;
+		vi.used_bytes = dtr->used_bytes;
+		vi.vol_type = vtr->vol_type;
+		vi.corrupted = dtr->corrupted;
+		vi.alignment = vtr->alignment;
+		vi.usable_leb_size = vtr->usable_leb_size;
+		vi.name_len = vtr->name_len;
+		vi.name = vtr->name;
+
+		err = ubi_callbacks->ubi_mkvol(ubi->ubi_num, &vi);
+		if (err) {
+			dbg_uif("ubi_mkvol callback returned error %d", err);
+			mutex_unlock(&uif->list_lock);
+			goto out_sysfs;
+		}
+	}
+	spin_lock(&vol->vol_lock);
+	vol->exclusive = 0;
+	spin_unlock(&vol->vol_lock);
+	mutex_unlock(&uif->list_lock);
+
+	return 0;
+
+out_sysfs:
+	mutex_lock(&uif->list_lock);
+	spin_lock(&vol->vol_lock);
+	vol->removed = 1;
+	spin_unlock(&vol->vol_lock);
+	list_del(&vol->list);
+	mutex_unlock(&uif->list_lock);
+	ubi_vol_sysfs_close(vol);
+	return err;
+}
+
+int ubi_uif_close_and_rmvol(struct ubi_vol_desc *desc)
+{
+	struct ubi_uif_volume *vol = desc->vol;
+	const struct ubi_info *ubi = vol->ubi;
+	struct ubi_uif_info *uif = ubi->uif;
+
+	dbg_uif("remove UBI volume %d", vol->vol_id);
+	ubi_assert(desc->mode == UBI_EXCLUSIVE);
+
+	mutex_lock(&uif->list_lock);
+	if (ubi_callbacks && ubi_callbacks->ubi_rmvol) {
+		int err;
+
+		err = ubi_callbacks->ubi_rmvol(ubi->ubi_num, vol->vol_id);
+		if (err) {
+			dbg_uif("ubi_rmvol callback returned error %d", err);
+			mutex_unlock(&uif->list_lock);
+			return err;
+		}
+	}
+	spin_lock(&vol->vol_lock);
+	vol->removed = 1;
+	spin_unlock(&vol->vol_lock);
+	list_del(&vol->list);
+	mutex_unlock(&uif->list_lock);
+
+	ubi_volume_cdev_close(vol);
+	ubi_vol_sysfs_close(vol);
+	ubi_kfree(desc);
+	module_put(THIS_MODULE);
+	return 0;
+}
+
+int ubi_uif_rsvol(struct ubi_vol_desc *desc, int reserved_pebs)
+{
+	struct ubi_uif_volume *vol = desc->vol;
+	const struct ubi_info *ubi = vol->ubi;
+	struct ubi_uif_info *uif = ubi->uif;
+
+	dbg_uif("Re-size volume %d to %d PEBs", vol->vol_id, reserved_pebs);
+	ubi_assert(desc->mode == UBI_EXCLUSIVE);
+
+	mutex_lock(&uif->list_lock);
+	if (ubi_callbacks && ubi_callbacks->ubi_rsvol) {
+		int err;
+
+		err = ubi_callbacks->ubi_rsvol(ubi->ubi_num, vol->vol_id,
+					       reserved_pebs);
+		if (err) {
+			dbg_uif("ubi_rsvol callback returned error %d", err);
+			mutex_unlock(&uif->list_lock);
+			return err;
+		}
+	}
+	mutex_unlock(&uif->list_lock);
+	return 0;
+}
+
+int ubi_uif_finish_update(struct ubi_vol_desc *desc);
+
+int ubi_uif_start_update(struct ubi_vol_desc *desc, long long bytes)
+{
+	int users, err = -EBUSY, rem;
+	struct ubi_uif_volume *vol = desc->vol;
+	const struct ubi_info *ubi = vol->ubi;
+	const struct ubi_vtbl_vtr *vtr;
+	void *upd_buf = NULL;
+	uint64_t tmp;
+
+	dbg_uif("remove UBI volume %d (%lld bytes)", vol->vol_id, bytes);
+	vtr = ubi_vtbl_get_vtr(ubi, vol->vol_id);
+
+	if (vtr->vol_type == UBI_STATIC_VOLUME) {
+		/*
+		 * When updating static volumes we may only write by whole
+		 * eraseblocks. So allocate a buffer which will be used for
+		 * gathering small writes.
+		 */
+		upd_buf = ubi_kmalloc(vtr->usable_leb_size, GFP_KERNEL);
+		if (!upd_buf)
+			return -ENOMEM;
+	}
+
+	spin_lock(&vol->vol_lock);
+	if (vol->updating) {
+		dbg_uif("already being updated");
+		goto out_unlock;
+	}
+
+	/* The volume must only have one user */
+	users = vol->readers + vol->writers + vol->exclusive;
+	if (users > 1) {
+		dbg_uif("multiple users (%d)", users);
+		goto out_unlock;
+	}
+	vol->updating = 1;
+	spin_unlock(&vol->vol_lock);
+
+	tmp = bytes;
+	rem = do_div(tmp, vtr->usable_leb_size);
+	vol->upd_ebs = tmp + !!rem;
+	vol->upd_bytes = bytes;
+	vol->upd_received = 0;
+
+	err = ubi_upd_put_marker(ubi, vol->vol_id);
+	if (err) {
+		if (err != -EBUSY)
+			goto out_cancel;
+
+		/*
+		 * The update marker is busy. If this update
+		 * marker belongs to this volume, we
+		 * proceed. This may happen if the previous
+		 * update of this volume was interrupted.
+		 */
+		if (ubi->upd->vol_id != vol->vol_id)
+			goto out_cancel;
+	}
+
+	/* Before updating, we erase the whole volume */
+	err = ubi_vmt_truncate_volume(ubi, vol->vol_id);
+	if (err)
+		goto out_corrupted;
+
+	vol->upd_buf = upd_buf;
+
+	/*
+	 * Special case: f the number of bytes is zero, the volume is just
+	 * fully freed.
+	 */
+	if (bytes == 0)
+		return ubi_uif_finish_update(desc);
+
+	return 0;
+
+out_unlock:
+	spin_unlock(&vol->vol_lock);
+	ubi_kfree(upd_buf);
+	return err;
+
+out_corrupted:
+	ubi_dtbl_set_corrupted(ubi, vol->vol_id);
+out_cancel:
+	ubi_kfree(upd_buf);
+	spin_lock(&vol->vol_lock);
+	vol->updating = 0;
+	spin_unlock(&vol->vol_lock);
+	return err;
+}
+
+/**
+ * ubi_uif_finish_update - finish volume update.
+ *
+ * @desc: volume descriptor
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_finish_update(struct ubi_vol_desc *desc)
+{
+	int err;
+	struct ubi_uif_volume *vol = desc->vol;
+	const struct ubi_info *ubi = vol->ubi;
+
+	dbg_uif("finish volume %d update", vol->vol_id);
+	spin_lock(&vol->vol_lock);
+	if (!vol->updating || ubi->upd->vol_id != vol->vol_id) {
+		dbg_uif("not under update");
+		spin_unlock(&vol->vol_lock);
+		return -EINVAL;
+	}
+	spin_unlock(&vol->vol_lock);
+
+	ubi_kfree(vol->upd_buf);
+	vol->upd_buf = NULL;
+
+	err = ubi_upd_remove_marker(ubi);
+	if (!err)
+		ubi_dtbl_set_dtr(ubi, vol->vol_id, vol->upd_bytes);
+	else
+		ubi_dtbl_set_corrupted(ubi, vol->vol_id);
+
+	spin_lock(&vol->vol_lock);
+	vol->updating = 0;
+	spin_unlock(&vol->vol_lock);
+	return 0;
+}
+
+
+static void delete_volumes(const struct ubi_info *ubi);
+
+int ubi_uif_init(struct ubi_info *ubi)
+{
+	int i, err;
+	struct ubi_uif_info *uif;
+	const struct ubi_acc_info *acc = ubi->acc;
+
+	dbg_uif("initialize the user interface unit");
+
+	uif = ubi_kzalloc(sizeof(struct ubi_uif_info), GFP_KERNEL);
+	if (!uif)
+		return -ENOMEM;
+	ubi->uif = uif;
+	uif->ubi = ubi;
+
+	mutex_init(&uif->list_lock);
+	mutex_init(&uif->vol_check);
+	INIT_LIST_HEAD(&uif->volumes);
+
+	uif->ubi_name = ubi_kmalloc(sizeof(UBI_NAME_STR) + 5, GFP_KERNEL);
+	if (!uif->ubi_name) {
+		err = -ENOMEM;
+		goto out_uif;
+	}
+	sprintf(uif->ubi_name, UBI_NAME_STR "%d", ubi->ubi_num);
+
+	err = ubi_cdev_init(ubi);
+	if (err)
+		goto out_name;
+
+	err = ubi_sysfs_init(ubi);
+	if (err)
+		goto out_cdev;
+
+	for (i = 0; i < acc->max_volumes; i++) {
+		const struct ubi_vtbl_vtr *vtr;
+
+		cond_resched();
+
+		vtr = ubi_vtbl_get_vtr(ubi, i);
+		if (IS_ERR(vtr))
+			continue;
+
+		err = ubi_uif_mkvol(ubi, i);
+		if (unlikely(err))
+			goto out_volumes;
+	}
+
+	dbg_uif("the user interface unit is initialized");
+	return 0;
+
+out_volumes:
+	delete_volumes(ubi);
+	ubi_sysfs_close(ubi);
+
+out_cdev:
+	ubi_cdev_close(ubi);
+
+out_name:
+	ubi_kfree(uif->ubi_name);
+
+out_uif:
+	ubi_kfree(uif);
+	return err;
+}
+
+void ubi_uif_close(const struct ubi_info *ubi)
+{
+	struct ubi_uif_info *uif = ubi->uif;
+
+	dbg_uif("close the user interface unit for %s", uif->ubi_name);
+
+	delete_volumes(ubi);
+	ubi_sysfs_close(ubi);
+	ubi_cdev_close(ubi);
+	ubi_kfree(uif->ubi_name);
+	ubi_kfree(uif);
+}
+
+int ubi_uif_global_init(void)
+{
+	return ubi_sysfs_global_init();
+}
+
+void ubi_uif_global_close(void)
+{
+	return ubi_sysfs_global_close();
+}
+
+/**
+ * delete_volumes - delete all the volume information.
+ *
+ * @ubi: the UBI device description object
+ */
+static void delete_volumes(const struct ubi_info *ubi)
+{
+	struct ubi_uif_volume *vol, *vol_tmp;
+	struct ubi_uif_info *uif = ubi->uif;
+
+	list_for_each_entry_safe(vol, vol_tmp, &uif->volumes, list) {
+		list_del(&vol->list);
+		vol->removed = 1;
+		ubi_volume_cdev_close(vol);
+		ubi_vol_sysfs_close(vol);
+	}
+}
+
+/**
+ * check_volume - check the contents of a static volume.
+ *
+ * @vol: the volume to check
+ *
+ * This function checks that a static volume is not corrupted by fully reading
+ * it and checking data CRC. This function returns zero if the volume is not
+ * corrupted, %-EUCLEAN if it is corrupted and a negative error code in case of
+ * failure.
+ */
+static int check_volume(struct ubi_uif_volume *vol)
+{
+	void *buf;
+	int err = 0, i, read;
+	const struct ubi_dtbl_dtr *dtr;
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_info *ubi = vol->ubi;
+
+	dtr = ubi_dtbl_get_dtr(ubi, vol->vol_id);
+	vtr = ubi_vtbl_get_vtr(ubi, vol->vol_id);
+
+	if (vtr->vol_type != UBI_STATIC_VOLUME)
+		return 0;
+
+	buf = ubi_kmalloc(vtr->usable_leb_size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = 0; i < dtr->used_ebs; i++) {
+		int size;
+
+		if (i == dtr->used_ebs - 1)
+			size = dtr->last_eb_bytes;
+		else
+			size = vtr->usable_leb_size;
+
+		err = ubi_eba_read_leb(ubi, vol->vol_id, i, buf, 0, size, 1,
+				       &read);
+		if (err) {
+			if (err == -EUCLEAN) {
+				ubi_warn("static volume %d is corrupted",
+					 vol->vol_id);
+				ubi_dtbl_set_corrupted(ubi, vol->vol_id);
+				err = 0;
+			}
+			break;
+		}
+	}
+
+	ubi_kfree(buf);
+	return err;
+}
+
+/**
+ * init_ubi_vol_info - fill an "user volume information data structure".
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume
+ * @vi: the volume information to fill
+ *
+ * This function must be invoked when the @vol_id volume will for sure not go.
+ */
+static void init_ubi_vol_info(const struct ubi_info *ubi, int vol_id,
+			      struct ubi_vol_info *vi)
+{
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_dtbl_dtr *dtr;
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	dtr = ubi_dtbl_get_dtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+	ubi_assert(!IS_ERR(dtr));
+
+	vi->vol_id = vol_id;
+	vi->size = vtr->reserved_pebs;
+	vi->used_bytes = dtr->used_bytes;
+	vi->vol_type = vtr->vol_type;
+	vi->corrupted = dtr->corrupted;
+	vi->alignment = vtr->alignment;
+	vi->usable_leb_size = vtr->usable_leb_size;
+	vi->name_len = vtr->name_len;
+	vi->name = vtr->name;
+}
diff --git a/drivers/mtd/ubi/uif.h b/drivers/mtd/ubi/uif.h
new file mode 100644
index 0000000..86712de
--- /dev/null
+++ b/drivers/mtd/ubi/uif.h
@@ -0,0 +1,224 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI user interface unit.
+ *
+ * This unit implements all the UBI user interfaces: kernel interfaces,
+ * character device interfaces, and sysfs interfaces.
+ *
+ * There are two kinds of character devices: UBI character devices and volume
+ * character devices. UBI character devices allow users to manipulate by whole
+ * volumes: create, remove, and resize them. Volume character devices provide
+ * volume read and update capabilities.
+ *
+ * Major and minor numbers are assigned dynamically to both UBI and volume
+ * character devices.
+ */
+
+#ifndef __UBI_UIF_H__
+#define __UBI_UIF_H__
+
+#include <linux/init.h>
+#include <linux/spinlock.h>
+#include <linux/fs.h>
+#include <linux/cdev.h>
+#include <linux/list.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#define UBI_NAME_STR "ubi"
+
+struct ubi_info;
+struct ubi_vtbl_vtr;
+struct ubi_vol_desc;
+struct ubi_client_callbacks;
+
+/**
+ * ubi_uif_mkvol - create a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the new volume
+ *
+ * This functions creates all the user interface-related data structures of a
+ * new volume. Returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_mkvol(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_uif_close_and_rmvol - close a and remove a volume.
+ *
+ * @desc: volume descriptor
+ *
+ * This functions closes a volume and removes all the user interface-related
+ * data structures of this volume. Returns zero in case of success and a
+ * negative error code in case of failure.
+ */
+int ubi_uif_close_and_rmvol(struct ubi_vol_desc *desc);
+
+/**
+ * ubi_uif_rsvol - re-size a volume.
+ *
+ * @desc: volume descriptor
+ * @reserved_pebs: new volume size
+ *
+ * This functions creates all the user interface-related data structures of a
+ * new volume. Returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_rsvol(struct ubi_vol_desc *desc, int reserved_pebs);
+
+/**
+ * ubi_uif_start_update - start a volume update.
+ *
+ * @desc: volume descriptor
+ * @bytes: how many bytes will be written
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_start_update(struct ubi_vol_desc *desc, long long bytes);
+
+/**
+ * ubi_uif_finish_update - finish volume update.
+ *
+ * @desc: volume descriptor
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_finish_update(struct ubi_vol_desc *desc);
+
+/**
+ * ubi_uif_init - initialize the UBI user interface unit for an UBI device.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_init(struct ubi_info *ubi);
+
+/**
+ * ubi_uif_close - close the UBI user interface unit for an UBI device.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_uif_close(const struct ubi_info *ubi);
+
+/**
+ * ubi_uif_global_init - initialize the UBI user interface unit.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_uif_global_init(void);
+
+/**
+ * ubi_uif_global_close - close the UBI user interface unit.
+ */
+void ubi_uif_global_close(void);
+
+/**
+ * struct ubi_uif_volume - a per-volume user interface data structure.
+ *
+ * @dev: a class device object to make use of the the Linux device model
+ * @cdev: a Linux character device object to create a character device of this
+ * volume
+ * @ubi: a reference to the UBI description object this volume belongs to
+ * @vol_id: volume ID
+ * @list: the link in the list of UIF volume information
+ * @readers: number of users who are using this volume in read-only mode
+ * @writers: number of users who are using this volume in read-write mode
+ * @exclusive: whether somebody is using this volume in exclusive mode
+ * @removed: if the volume was removed from the UBI device
+ * @checked: if this static volume was checked
+ * @vol_lock: protects the @readers, @writers, @exclusive, @removed and
+ * @updating fields
+ * @updating: whether the volume is being updated
+ * @upd_ebs: how many eraseblocks are going to be updated
+ * @upd_received: how many bytes were already received from userspace
+ * @upd_bytes: how many bytes are expected to be received more
+ * @upd_buf: a temporary buffer where small update writes are gathered
+ */
+struct ubi_uif_volume {
+	struct class_device dev;
+	struct cdev cdev;
+	const struct ubi_info *ubi;
+	int vol_id;
+	struct list_head list;
+	int readers;
+	int writers;
+	int exclusive;
+	int removed;
+	int checked;
+	spinlock_t vol_lock;
+	int updating;
+	int upd_ebs;
+	long long upd_received;
+	long long upd_bytes;
+	void *upd_buf;
+};
+
+/**
+ * struct ubi_vol_desc - UBI opened volume descriptor
+ *
+ * @vol: reference to the corresponding volume description object
+ * @mode: volume open mode
+ * @read_err: the code of error occurred during last volume character device
+ * read operation
+ * @the code of error occurred during last volume character device
+ * write operation
+ * @read_err_off: volume offset where the read operation happened
+ * @write_err_off: volume offset where the write operation happened
+ */
+struct ubi_vol_desc {
+	struct ubi_uif_volume *vol;
+	enum ubi_open_mode mode;
+};
+
+/**
+ * struct ubi_uif_info - UBI user interfaces unit description structure.
+ *
+ * @cdev: a Linux character device object to create a character device of this
+ * UBI device
+ * @dev: the class device structure to use the the Linux device model
+ * @ubi: a reference to the UBI description structure this volume belongs to
+ * @major: major number of the UBI character device
+ * @ubi_name: name of this UBI device
+ * @volumes: a list of 'struct ubi_uif_volume' object for all existing volumes
+ * @list_lock: protects the @volumes list and the @callbacks field
+ * @callbacks: per UBI-device client callbacks
+ * @vol_check: serializes volume checking
+ */
+struct ubi_uif_info {
+	struct cdev cdev;
+	struct class_device dev;
+	struct ubi_info *ubi;
+	int major;
+	char *ubi_name;
+	struct list_head volumes;
+	struct mutex list_lock;
+	const struct ubi_client_callbacks *callbacks;
+	struct mutex vol_check;
+};
+
+#endif /* !__UBI_UIF_H__ */
diff --git a/drivers/mtd/ubi/unittest.c b/drivers/mtd/ubi/unittest.c
new file mode 100644
index 0000000..b8712ed
--- /dev/null
+++ b/drivers/mtd/ubi/unittest.c
@@ -0,0 +1,43 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Thomas Gleixner
+ */
+
+/* Export interfaces which we want to use for testing */
+
+#include <linux/module.h>
+#include "ubi.h"
+#include "eba.h"
+#include "volmgmt.h"
+#include "uif.h"
+
+EXPORT_SYMBOL_GPL(ubis_num);
+EXPORT_SYMBOL_GPL(ubis);
+
+/* Interfaces of the  EBA unit */
+EXPORT_SYMBOL_GPL(ubi_eba_erase_leb);
+EXPORT_SYMBOL_GPL(ubi_eba_read_leb);
+EXPORT_SYMBOL_GPL(ubi_eba_write_leb);
+
+/* Interfaces of the volume management unit */
+EXPORT_SYMBOL_GPL(ubi_vmt_mkvol);
+EXPORT_SYMBOL_GPL(ubi_vmt_rmvol);
+
+/* Interfaces of the UIF unit */
+EXPORT_SYMBOL_GPL(ubi_uif_mkvol);
+EXPORT_SYMBOL_GPL(ubi_uif_close_and_rmvol);
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
new file mode 100644
index 0000000..ba8a5c4
--- /dev/null
+++ b/drivers/mtd/ubi/upd.c
@@ -0,0 +1,183 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/mutex.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "upd.h"
+#include "wl.h"
+#include "ivol.h"
+#include "io.h"
+#include "eba.h"
+#include "account.h"
+#include "alloc.h"
+#include "scan.h"
+#include "debug.h"
+
+int ubi_upd_put_marker(const struct ubi_info *ubi, int vol_id)
+{
+	int err, written;
+	struct ubi_upd_info *upd = ubi->upd;
+
+	dbg_upd("put update marker for volume %d", vol_id);
+
+	mutex_lock(&upd->mutex);
+	if (upd->vol_id != -1) {
+		dbg_upd("update marker is already used by volume %d",
+			upd->vol_id);
+		mutex_unlock(&upd->mutex);
+		return -EBUSY;
+	}
+
+	upd->vol_id = vol_id;
+	upd->hdr_data.vol_id = cpu_to_ubi32(vol_id);
+
+	err = ubi_eba_write_leb(ubi, UBI_UPDATE_VOL_ID, 0,  NULL, 0, 0,
+				UBI_DATA_SHORTTERM, 0, &written,
+				&upd->hdr_data);
+
+	mutex_unlock(&upd->mutex);
+	return err;
+}
+
+int ubi_upd_remove_marker(const struct ubi_info *ubi)
+{
+	int err;
+	struct ubi_upd_info *upd = ubi->upd;
+
+	mutex_lock(&upd->mutex);
+
+	dbg_upd("remove update marker for volume %d", upd->vol_id);
+
+	err = ubi_eba_erase_leb(ubi, UBI_UPDATE_VOL_ID, 0);
+	if (err) {
+		mutex_unlock(&upd->mutex);
+		return err;
+	}
+	upd->vol_id = -1;
+	err = ubi_wl_erase_flush(ubi);
+	mutex_unlock(&upd->mutex);
+	return err;
+}
+
+int ubi_upd_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err;
+	struct ubi_scan_volume *sv;
+	struct ubi_vid_hdr *vid_hdr;
+	struct ubi_upd_info *upd;
+
+	dbg_upd("initialize the update unit");
+
+	upd = ubi_kzalloc(sizeof(struct ubi_upd_info), GFP_KERNEL);
+	if (!upd)
+		return -ENOMEM;
+	ubi->upd = upd;
+
+	mutex_init(&upd->mutex);
+	upd->vol_id = -1;
+
+	sv = ubi_scan_get_scan_volume(si, UBI_UPDATE_VOL_ID);
+	if (sv) {
+		const struct ubi_vtbl_vtr *vtr;
+		const struct ubi_scan_leb *seb;
+
+		/*
+		 * Some transaction was interrupted. We have to mark the
+		 * corresponding volume as corrupted.
+		 */
+
+		/* There may be only one update marker */
+		err = -EINVAL;
+		if (sv->leb_count > 1) {
+			ubi_err("too many update markers %d", sv->leb_count);
+			goto out_free_upd;
+		}
+
+		seb = ubi_scan_get_scan_leb(sv, 0);
+		if (!seb) {
+			ubi_err("bad update marker");
+			goto out_free_upd;
+		}
+
+		vid_hdr = ubi_alloc_vid_hdr(ubi);
+		if (!vid_hdr) {
+			err = -ENOMEM;
+			goto out_free_upd;
+		}
+
+		err = ubi_io_read_vid_hdr(ubi, seb->pnum, vid_hdr, 1);
+		if (unlikely(err < 0))
+			goto out_vid_hdr;
+		else if (unlikely(err > 0) && err != UBI_IO_BITFLIPS) {
+			/*
+			 * Cannot read the update marker. But we read it
+			 * earlier, during scanning. No idea what happened.
+			 * Don't erase this physical eraseblock because some
+			 * corrupted volume will then be treated as good.
+			 */
+			err = -EIO;
+			goto out_vid_hdr;
+		}
+
+		memcpy(&upd->hdr_data, &vid_hdr->ivol_data[0],
+		       UBI_VID_HDR_IVOL_DATA_SIZE);
+		upd->vol_id = ubi32_to_cpu(upd->hdr_data.vol_id);
+		ubi_free_vid_hdr(ubi, vid_hdr);
+
+		/* Check sanity */
+		if (upd->vol_id < 0 || upd->vol_id >= ubi->acc->max_volumes) {
+			ubi_err("bad updated volume ID %d", upd->vol_id);
+			goto out_free_upd;
+		}
+
+		/*
+		 * Lets see if the update marker belongs to an existing volume.
+		 * It yes, this volume is marked as corrupted and the marker is
+		 * not removed.If not, remove the marker. This is probably
+		 * owing to an unclean reboot during volume removal.
+		 */
+		ubi_warn("volume %d update was interrupted", upd->vol_id);
+		vtr = ubi_vtbl_get_vtr(ubi, upd->vol_id);
+		if (IS_ERR(vtr)) {
+			err = ubi_upd_remove_marker(ubi);
+			if (err)
+				goto out_free_upd;
+		} else
+			ubi_dtbl_set_corrupted(ubi, upd->vol_id);
+	}
+
+	dbg_upd("the update unit is initialized");
+	return 0;
+
+out_vid_hdr:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+out_free_upd:
+	ubi_kfree(upd);
+	return err;
+}
+
+void ubi_upd_close(const struct ubi_info *ubi)
+{
+	dbg_upd("close the update unit");
+	ubi_kfree(ubi->upd);
+}
diff --git a/drivers/mtd/ubi/upd.h b/drivers/mtd/ubi/upd.h
new file mode 100644
index 0000000..c91ea04
--- /dev/null
+++ b/drivers/mtd/ubi/upd.h
@@ -0,0 +1,111 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * The update unit.
+ *
+ * This unit is responsible for maintaining atomicity of the update operation.
+ * This is achieved using so-called "update marker". The update marker is
+ * written to flash before the update starts, and removed from flash after the
+ * update has been finished. So, if the update was interrupted by an unclean
+ * reboot, the scanning will hit on the update marker and we'll know that the
+ * volume is corrupted.
+ *
+ * The update marker is implemented as follows. We maintain an internal
+ * volume, called "the update volume", which has only one logical eraseblock.
+ * And this logical eraseblock is effectively the update marker. Thus, to put
+ * the update marker means to write to the only eraseblock of the update
+ * volume, and to remove the update marker is to erase that eraseblock.
+ *
+ * Note, more generic approach for things like this is a journal, but we
+ * avoided introducing journal because it is more complex. Indeed, for
+ * boot loaders it would be much more difficult to parse the journal. In the
+ * next UBI generation, when the EBA table is maintained on flash, the journal
+ * will be needed anyway, so the update volume will go.
+ */
+
+#ifndef __UBI_UPD_H__
+#define __UBI_UPD_H__
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+
+struct ubi_info;
+struct ubi_scan_info;
+
+/**
+ * ubi_upd_put_marker - put update marker.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: for which volume to put the update marker.
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_upd_put_marker(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_upd_remove_marker - remove update marker.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_upd_remove_marker(const struct ubi_info *ubi);
+
+/**
+ * ubi_upd_init_scan - initialize the update volume unit using scanning
+ * information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_upd_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_upd_close - close the update volume unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_upd_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_upd_info - UBI update unit description data structure.
+ *
+ * @vol_id: which volume utilizes the update marker
+ * @hdr_data: data put to the VID header of the update marker eraseblock
+ * @mutex: serializes access to the update marker
+ *
+ * Note, at this implementation the update volume consists on only one
+ * eraseblock, so only one update marker may be put at a time, so only one
+ * update at a time is allowed.
+ */
+struct ubi_upd_info {
+	int vol_id;                          /* public  */
+	struct ubi_vid_hdr_upd_vol hdr_data; /* private */
+	struct mutex mutex;                  /* private */
+};
+
+#endif /* !__UBI_UPD_H__ */
diff --git a/drivers/mtd/ubi/volmgmt.c b/drivers/mtd/ubi/volmgmt.c
new file mode 100644
index 0000000..cc8610b
--- /dev/null
+++ b/drivers/mtd/ubi/volmgmt.c
@@ -0,0 +1,445 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/string.h>
+#include <linux/sched.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "io.h"
+#include "wl.h"
+#include "upd.h"
+#include "volmgmt.h"
+#include "vtbl.h"
+#include "dtbl.h"
+#include "ivol.h"
+#include "misc.h"
+#include "eba.h"
+#include "account.h"
+#include "scan.h"
+#include "debug.h"
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_VMT
+static int paranoid_check_vtr(const struct ubi_info *ubi,
+			 const struct ubi_vtbl_vtr *vtr);
+#else
+#define paranoid_check_vtr(ubi, vtr) 0
+#endif
+
+static int find_vacant_vol_id(const struct ubi_info *ubi);
+
+int ubi_vmt_mkvol(const struct ubi_info *ubi, int vol_id,
+		  const struct ubi_vtbl_vtr *vtr)
+{
+	int i, err = 0;
+	struct ubi_vmt_info *vmt = ubi->vmt;
+	const struct ubi_vtbl_vtr *vtr_ck;
+
+	dbg_vmt("create volume ID %d, reserved_pebs %d, type %d, name %s",
+		vol_id, vtr->reserved_pebs, vtr->vol_type, vtr->name);
+
+	if (vol_id == UBI_VOL_NUM_AUTO) {
+		vol_id = find_vacant_vol_id(ubi);
+		if (vol_id < 0) {
+			err = vol_id;
+			goto out_unlock;
+		}
+	} else
+		ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
+
+	err = paranoid_check_vtr(ubi, vtr);
+	if (err)
+		return -EINVAL;
+
+	mutex_lock(&vmt->mutex);
+
+	/* Get sure that this volume does not exist */
+	err = -EEXIST;
+	vtr_ck = ubi_vtbl_get_vtr(ubi, vol_id);
+	if (!IS_ERR(vtr_ck)) {
+		dbg_vmt("volume %d already exists", vol_id);
+		goto out_unlock;
+	}
+
+	/* Ensure that this volume has a unique name */
+	for (i = 0; i < ubi->acc->max_volumes; i++) {
+		cond_resched();
+
+		vtr_ck = ubi_vtbl_get_vtr(ubi, i);
+		if (IS_ERR(vtr_ck))
+			continue;
+
+		if (unlikely(vtr->name_len == vtr_ck->name_len &&
+			     !strcmp(vtr->name, vtr_ck->name))) {
+			dbg_vmt("not unique name \"%s\", volume %d has it",
+				vtr->name, i);
+			goto out_unlock;
+		}
+	}
+
+	err = ubi_acc_mkvol(ubi, vtr->reserved_pebs);
+	if (err)
+		goto out_unlock;
+
+	/*
+	 * Finish all the pending erases because there may be some LEBs
+	 * belonging to the same volume ID. We don't want to be messed-up.
+	 */
+	err = ubi_wl_erase_flush(ubi);
+	if (err)
+		goto out_acc;
+
+	err = ubi_eba_mkvol(ubi, vol_id, vtr->reserved_pebs);
+	if (err)
+		goto out_acc;
+
+	err = ubi_vtbl_mkvol(ubi, vol_id, vtr);
+	if (err)
+		goto out_eba;
+
+	ubi_dtbl_set_dtr(ubi, vol_id, 0);
+
+	mutex_unlock(&vmt->mutex);
+	return vol_id;
+
+out_eba:
+	ubi_eba_rmvol(ubi, vol_id);
+out_acc:
+	ubi_acc_rmvol(ubi, vtr->reserved_pebs);
+out_unlock:
+	mutex_unlock(&vmt->mutex);
+	return err;
+}
+
+int ubi_vmt_rmvol(const struct ubi_info *ubi, int vol_id)
+{
+	int err, reserved_pebs;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vmt_info *vmt = ubi->vmt;
+
+	dbg_vmt("remove volume %d", vol_id);
+	ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
+
+	mutex_lock(&vmt->mutex);
+
+	/* Ensure that this volume exists */
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	if (IS_ERR(vtr)) {
+		err = PTR_ERR(vtr);
+		goto out_unlock;
+	}
+
+	err = ubi_vmt_truncate_volume(ubi, vol_id);
+	if (err)
+		goto out_corr;
+
+	reserved_pebs = vtr->reserved_pebs;
+
+	err = ubi_vtbl_rmvol(ubi, vol_id);
+	if (err)
+		goto out_corr;
+
+	/* If there is an update marker for this volume, remove it */
+	if (ubi->upd->vol_id == vol_id) {
+		err = ubi_upd_remove_marker(ubi);
+		if (err)
+			goto out_unlock;
+	}
+
+	err = ubi_eba_rmvol(ubi, vol_id);
+	if (err)
+		goto out_unlock;
+
+	ubi_acc_rmvol(ubi, reserved_pebs);
+
+	err = ubi_wl_erase_flush(ubi);
+	if (err)
+		return err;
+
+out_unlock:
+	mutex_unlock(&vmt->mutex);
+	return err;
+
+out_corr:
+	ubi_dtbl_set_corrupted(ubi, vol_id);
+	mutex_unlock(&vmt->mutex);
+	return err;
+}
+
+int ubi_vmt_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs)
+{
+	int err, pebs;
+	struct ubi_vmt_info *vmt = ubi->vmt;
+	const struct ubi_vtbl_vtr *vtr;
+	const struct ubi_dtbl_dtr *dtr;
+
+	dbg_vmt("re-size volume %d to %d PEBs", vol_id, reserved_pebs);
+	ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
+	ubi_assert(reserved_pebs > 0);
+
+	mutex_lock(&vmt->mutex);
+
+	/* Ensure that this volume exists */
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	if (IS_ERR(vtr)) {
+		err = PTR_ERR(vtr);
+		goto out_unlock;
+	}
+
+	dtr = ubi_dtbl_get_dtr(ubi, vol_id);
+
+	if (vtr->vol_type == UBI_STATIC_VOLUME &&
+	    reserved_pebs < dtr->used_ebs) {
+		dbg_vmt("too small size %d, static volume %d has %d used LEBs",
+			reserved_pebs, vol_id, dtr->used_ebs);
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* If the size is the same, we have nathing to do */
+	if (reserved_pebs == vtr->reserved_pebs) {
+		err = 0;
+		goto out_unlock;
+	}
+
+	err = ubi_vtbl_rsvol(ubi, vol_id, reserved_pebs);
+	if (err)
+		goto out_unlock;
+
+	pebs = reserved_pebs - vtr->reserved_pebs;
+	if (pebs > 0) {
+		err = ubi_acc_reserve(ubi, pebs);
+		if (err)
+			goto out_unlock;
+	} else
+		ubi_acc_free(ubi, -pebs);
+
+	err = ubi_eba_rsvol(ubi, vol_id, reserved_pebs);
+	if (err)
+		goto out_unlock;
+
+	ubi_dtbl_set_dtr(ubi, vol_id, reserved_pebs * vtr->usable_leb_size);
+
+	err = ubi_wl_erase_flush(ubi);
+
+out_unlock:
+	mutex_unlock(&vmt->mutex);
+	return err;
+}
+
+int ubi_vmt_truncate_volume(const struct ubi_info *ubi, int vol_id)
+{
+	int i, err;
+	const struct ubi_vtbl_vtr *vtr;
+
+	dbg_vmt("truncate volume %d", vol_id);
+	ubi_assert(vol_id >= 0 && vol_id < ubi->acc->max_volumes);
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	for (i = 0; i < vtr->reserved_pebs; i++) {
+		cond_resched();
+
+		err = ubi_eba_erase_leb(ubi, vol_id, i);
+		if (unlikely(err))
+			return err;
+	}
+
+	/*
+	 * As we don't have an on-flash data table, we have to ensure the
+	 * eraseblocks were really erased, not just scheduled for erasure.
+	 * If we had a on-flash data table, we could make a mark there instead.
+	 */
+	err = ubi_wl_erase_flush(ubi);
+	if (err)
+		return err;
+
+	ubi_dtbl_set_dtr(ubi, vol_id, 0);
+	return 0;
+}
+
+int ubi_vmt_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err;
+	struct ubi_vmt_info *vmt;
+
+	dbg_vmt("initialize the volume management unit");
+
+	vmt = ubi_kzalloc(sizeof(struct ubi_vmt_info), GFP_KERNEL);
+	if (!vmt)
+		return -ENOMEM;
+	ubi->vmt = vmt;
+
+	mutex_init(&vmt->mutex);
+
+	err = ubi_ivol_init_scan(ubi, si);
+	if (err)
+		goto out_vmt;
+
+	err = ubi_vtbl_init_scan(ubi, si);
+	if (err)
+		goto out_ivol;
+
+	err = ubi_acc_init_scan(ubi, si);
+	if (err)
+		goto out_vtbl;
+
+	err = ubi_dtbl_init_scan(ubi, si);
+	if (err)
+		goto out_acc;
+
+	err = ubi_upd_init_scan(ubi, si);
+	if (err)
+		goto out_dtbl;
+
+	dbg_vmt("the volume management unit is initialized");
+	return 0;
+
+out_dtbl:
+	ubi_dtbl_close(ubi);
+out_acc:
+	ubi_acc_close(ubi);
+out_vtbl:
+	ubi_vtbl_close(ubi);
+out_ivol:
+	ubi_ivol_close(ubi);
+out_vmt:
+	ubi_kfree(vmt);
+	return err;
+}
+
+void ubi_vmt_close(const struct ubi_info *ubi)
+{
+	dbg_vmt("close the volume management unit");
+	ubi_upd_close(ubi);
+	ubi_dtbl_close(ubi);
+	ubi_acc_close(ubi);
+	ubi_vtbl_close(ubi);
+	ubi_ivol_close(ubi);
+	ubi_kfree(ubi->vmt);
+}
+
+/**
+ * find_vacant_vol_id - find an unused volume ID.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns a positive volume ID or %-ENOSPC if there are no free
+ * volume IDs.
+ */
+static int find_vacant_vol_id(const struct ubi_info *ubi)
+{
+	int i;
+
+	for (i = 0; i < ubi->acc->max_volumes; i++) {
+		const struct ubi_vtbl_vtr *vtr;
+
+		cond_resched();
+
+		vtr = ubi_vtbl_get_vtr(ubi, i);
+		if (IS_ERR(vtr)) {
+			dbg_vmt("found volume ID %d", i);
+			return i;
+		}
+	}
+
+	dbg_vmt("vacant volume ID not found");
+	return -ENOSPC;
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_VMT
+
+/**
+ * paranoid_check_vtr - check sanity of a &struct ubi_vtbl_vtr object.
+ *
+ * @ubi: the UBI device description object
+ * @vtr: an object to check
+ *
+ * This function returns zero if the volume table record is sane, and %1 if
+ * not.
+ */
+static int paranoid_check_vtr(const struct ubi_info *ubi,
+			      const struct ubi_vtbl_vtr *vtr)
+{
+	int n;
+	const struct ubi_io_info *io = ubi->io;
+
+	if (vtr->reserved_pebs == 0)
+		return 0;
+
+	if (unlikely(vtr->reserved_pebs < 0 || vtr->alignment < 0 ||
+		     vtr->data_pad < 0 || vtr->name_len < 0)) {
+		ubi_err("negative values");
+		goto bad;
+	}
+
+	if (unlikely(vtr->alignment > io->leb_size)) {
+		ubi_err("too large alignment");
+		goto bad;
+	}
+
+	if (unlikely(vtr->alignment == 0)) {
+		ubi_err("zero alignment");
+		goto bad;
+	}
+
+	n = vtr->alignment % io->min_io_size;
+	if (vtr->alignment != 1 && unlikely(n)) {
+		ubi_err("alignment is not multiple of min I/O unit size");
+		goto bad;
+	}
+
+	n = io->leb_size % vtr->alignment;
+	if (unlikely(vtr->data_pad != n)) {
+		ubi_err("bad data_pad, has to be %d", n);
+		goto bad;
+	}
+
+	if (unlikely(vtr->vol_type != UBI_DYNAMIC_VOLUME &&
+		     vtr->vol_type != UBI_STATIC_VOLUME)) {
+		ubi_err("bad vol_type");
+		goto bad;
+	}
+
+	if (unlikely(vtr->name_len > UBI_VOL_NAME_MAX)) {
+		ubi_err("too long volume name, max is %d", UBI_VOL_NAME_MAX);
+		goto bad;
+	}
+
+	if (unlikely(!vtr->name)) {
+		ubi_err("NULL volume name");
+		goto bad;
+	}
+
+	n = strnlen(vtr->name, vtr->name_len + 1);
+	if (unlikely(n != vtr->name_len)) {
+		ubi_err("bad name_len");
+		goto bad;
+	}
+
+	return 0;
+
+bad:
+	ubi_dbg_dump_vtr(vtr);
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_VMT */
diff --git a/drivers/mtd/ubi/volmgmt.h b/drivers/mtd/ubi/volmgmt.h
new file mode 100644
index 0000000..c115742
--- /dev/null
+++ b/drivers/mtd/ubi/volmgmt.h
@@ -0,0 +1,129 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * UBI volume management unit.
+ *
+ * The unit is responsible for creation, deletion, updating and resizing
+ * of volumes.
+ */
+
+#ifndef __UBI_VOLMGMT_H__
+#define __UBI_VOLMGMT_H__
+
+#include <linux/mutex.h>
+
+struct ubi_info;
+struct ubi_scan_info;
+struct ubi_vol_info;
+struct ubi_vtbl_vtr;
+
+/**
+ * ubi_vmt_get_data_info - get volume data description.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the requested volume
+ *
+ * This function returns a pointer to the corresponding data description
+ * object.
+ */
+const struct ubi_vmt_data_info *
+ubi_vmt_get_data_info(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_vmt_mkvol - create a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID to assign to the new volume
+ * @vtr: volume table record corresponding to the new volume
+ *
+ * If @vol_id id %UBI_VOL_NUM_AUTO then new volume is automatically given an
+ * unused volume identifier. The @vtr->usable_leb_size field is ignored.
+ *
+ * This function returns the ID of the newly created volume in case of success,
+ * and a negative error code in case of failure.
+ */
+int ubi_vmt_mkvol(const struct ubi_info *ubi, int vol_id,
+		  const struct ubi_vtbl_vtr *vtr);
+
+/**
+ * ubi_vmt_rmvol - remove a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to remove
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_vmt_rmvol(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_vmt_rsvol - re-size a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to re-size
+ * @reserved_pebs: new volume size
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_vmt_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs);
+
+/**
+ * ubi_vmt_truncate_volume - make sure the volume contains only 0xFF bytes.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to free
+ *
+ * This function erases all the volume's eraseblocks. Returns zero in case of
+ * success, and a negative error code in case of failure.
+ */
+int ubi_vmt_truncate_volume(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_vmt_init_scan - initialize the volume management unit using scanning
+ * information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_vmt_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_vmt_close - close the volume management unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_vmt_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_vmt_info - volume management unit description data
+ * structure.
+ *
+ * @mutex: a mutex to serialize volume changes
+ */
+struct ubi_vmt_info {
+	struct mutex mutex; /* private */
+};
+
+#endif /* !__UBI_VOLMGMT_H__ */
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
new file mode 100644
index 0000000..fc8a158
--- /dev/null
+++ b/drivers/mtd/ubi/vtbl.c
@@ -0,0 +1,1077 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#include <linux/init.h>
+#include <linux/string.h>
+#include <linux/crc32.h>
+#include <linux/sched.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "wl.h"
+#include "io.h"
+#include "vtbl.h"
+#include "ivol.h"
+#include "eba.h"
+#include "scan.h"
+#include "misc.h"
+#include "debug.h"
+
+static int change_volume(const struct ubi_info *ubi,
+			 int vol_id, const struct ubi_vtbl_vtr *vtr);
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_VTBL
+static int paranoid_check_vtr(const struct ubi_info *ubi,
+			      const struct ubi_vtbl_vtr *vtr);
+#else
+#define paranoid_check_vtr(ubi, vtr) 0
+#endif
+
+/*
+ * Empty volume table record pattern.
+ */
+static const struct ubi_vol_tbl_record empty_rec;
+
+int ubi_vtbl_mkvol(const struct ubi_info *ubi, int vol_id,
+		   const struct ubi_vtbl_vtr *vtr)
+{
+	int err;
+
+	dbg_vtbl("create volume: vol_id %d, reserved_pebs %d, "
+		 "alignment %d, data_pad %d, vol_type %d, "
+		 "name_len %d, name %s", vol_id, vtr->reserved_pebs,
+		 vtr->alignment, vtr->data_pad, vtr->vol_type,
+		 vtr->name_len, vtr->name);
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0 && vol_id < ubi->vtbl->vt_slots);
+	ubi_assert(vtr->reserved_pebs > 0);
+	ubi_assert(ubi->vtbl->vt[vol_id].reserved_pebs == 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+
+
+	err = change_volume(ubi, vol_id, vtr);
+	return err;
+}
+
+int ubi_vtbl_rmvol(const struct ubi_info *ubi, int vol_id)
+{
+	int err;
+	struct ubi_vtbl_vtr empty_vtr;
+
+	dbg_vtbl("remove volume %d", vol_id);
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0 && vol_id < ubi->vtbl->vt_slots);
+	ubi_assert(ubi->vtbl->vt[vol_id].reserved_pebs != 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+
+	empty_vtr.reserved_pebs = 0;
+	err = change_volume(ubi, vol_id, &empty_vtr);
+	return err;
+}
+
+int ubi_vtbl_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs)
+{
+	int err;
+	struct ubi_vtbl_vtr *vtr;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	dbg_vtbl("re-size volume %d to %d EBs, old size %d EBs", vol_id,
+		 reserved_pebs, vtbl->vt[vol_id].reserved_pebs);
+
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0 && vol_id < vtbl->vt_slots);
+	ubi_assert(reserved_pebs > 0);
+	ubi_assert(vtbl->vt[vol_id].reserved_pebs != 0);
+	ubi_assert(!ubi_is_ivol(vol_id));
+
+	vtr = ubi_kmalloc(sizeof(struct ubi_vtbl_vtr), GFP_KERNEL);
+	if (unlikely(!vtr))
+		return -ENOMEM;
+
+	memcpy(vtr, &vtbl->vt[vol_id], sizeof(struct ubi_vtbl_vtr));
+
+	vtr->name = strdup_len(vtbl->vt[vol_id].name,
+			       vtbl->vt[vol_id].name_len);
+	if (!vtr->name) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	vtr->reserved_pebs = reserved_pebs;
+	err = change_volume(ubi, vol_id, vtr);
+out:
+	ubi_kfree(vtr->name);
+	ubi_kfree(vtr);
+	return err;
+}
+
+const struct ubi_vtbl_vtr *ubi_vtbl_get_vtr(const struct ubi_info *ubi,
+					    int vol_id)
+{
+	int err;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	if (ubi_is_ivol(vol_id))
+		return ubi_ivol_get_vtr(ubi, vol_id);
+
+	ubi_assert(vol_id >= 0 && vol_id < vtbl->vt_slots);
+
+	if (vtbl->vt[vol_id].reserved_pebs == 0)
+		return ERR_PTR(-ENODEV);
+
+	err = paranoid_check_vtr(ubi, &vtbl->vt[vol_id]);
+	return &vtbl->vt[vol_id];
+}
+
+static int init_ram_vt(const struct ubi_info *ubi,
+		       const struct ubi_vol_tbl_record *vol_tbl);
+
+static struct ubi_vol_tbl_record *create_empty_lvol(const struct ubi_info *ubi,
+						    struct ubi_scan_info *si);
+
+static struct ubi_vol_tbl_record *process_lvol(const struct ubi_info *ubi,
+					       struct ubi_scan_info *si,
+					       struct ubi_scan_volume *sv);
+
+static int check_scanning_info(const struct ubi_info *ubi,
+			       struct ubi_scan_info *si);
+
+static void free_volume_info(const struct ubi_info *ubi);
+
+int ubi_vtbl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err;
+	uint32_t crc;
+	struct ubi_vol_tbl_record *vol_tbl;
+	struct ubi_vtbl_info *vtbl;
+	struct ubi_scan_volume *sv;
+	const struct ubi_io_info *io = ubi->io;
+
+	dbg_vtbl("initialize the volume table unit");
+
+	vtbl = ubi_kzalloc(sizeof(struct ubi_vtbl_info), GFP_KERNEL);
+	if (!vtbl)
+		return -ENOMEM;
+	ubi->vtbl = vtbl;
+
+	/* Initialize the empty volume table record pattern */
+	vol_tbl = (struct ubi_vol_tbl_record *)&empty_rec;
+	crc = crc32(UBI_CRC32_INIT, vol_tbl, UBI_VTBL_RECORD_SIZE_CRC);
+	vol_tbl->crc = cpu_to_ubi32(crc);
+
+	/*
+	 * The number of supported volumes is restricted by the eraseblock size
+	 * and by the UBI_MAX_VOLUMES constant.
+	 */
+	vtbl->vt_slots = io->leb_size / UBI_VTBL_RECORD_SIZE;
+	if (vtbl->vt_slots > UBI_MAX_VOLUMES)
+		vtbl->vt_slots = UBI_MAX_VOLUMES;
+
+	/*
+	 * We are going to calculate size of the volume table. It must be less
+	 * then the logical eraseblock size or equivalent to it. Here we also
+	 * ensure that @vtbl->vt_size has correct alignment (i.e., it is
+	 * multiple of the flash input/output unit size).
+	 */
+	vtbl->vt_size = vtbl->vt_slots * UBI_VTBL_RECORD_SIZE;
+	if (io->min_io_size > 1) {
+		int mod, rest;
+
+		mod = vtbl->vt_size % io->min_io_size;
+		rest = io->min_io_size - mod;
+		if (vtbl->vt_size + rest <= io->leb_size)
+			vtbl->vt_size += rest;
+		else {
+			vtbl->vt_size -= mod;
+			vtbl->vt_slots -= mod / UBI_VTBL_RECORD_SIZE;
+		}
+	}
+
+	sv = ubi_scan_get_scan_volume(si, UBI_LAYOUT_VOL_ID);
+	if (!sv) {
+		/*
+		 * No logical eraseblocks belonging to the layout volume were
+		 * found. This could mean that the flash is just empty. In
+		 * this case we "UBI-nize" this flash creating an empty layout
+		 * volume.
+		 *
+		 * But if flash is not empty this must be a serious corruption
+		 * or we were just fed by an bad/random/etc data. We could try
+		 * to do some recovery, but it seems its better to do this
+		 * using some userspace tool.
+		 */
+		if (si->is_empty) {
+			vol_tbl = create_empty_lvol(ubi, si);
+			if (IS_ERR(vol_tbl)) {
+				err = PTR_ERR(vol_tbl);
+				goto out;
+			}
+		} else {
+			ubi_err("the layout volume was not found");
+			err = -EINVAL;
+			goto out;
+		}
+	} else {
+		if (sv->leb_count > UBI_LAYOUT_VOLUME_EBS) {
+			/* This must not happen with sane UBI images */
+			ubi_err("too many logical LEBs (%d) belonging to the "
+				"layout volume found", sv->leb_count);
+			err = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * The layout volume was found during scanning, lets look at
+		 * it, check it, etc.
+		 */
+		vol_tbl = process_lvol(ubi, si, sv);
+		if (IS_ERR(vol_tbl)) {
+			err = PTR_ERR(vol_tbl);
+			goto out;
+		}
+	}
+
+	/*
+	 * The layout volume is OK, initialize the corresponding in-RAM data
+	 * structures.
+	 */
+	err = init_ram_vt(ubi, vol_tbl);
+	if (err)
+		goto out;
+
+	ubi_kfree(vol_tbl);
+	ubi->vtbl = vtbl;
+
+	/*
+	 * Get sure that the scanning information about the layout volume is
+	 * consistent to what it contains.
+	 */
+	err = check_scanning_info(ubi, si);
+	if (err)
+		goto out_vi;
+
+	dbg_vtbl("the volume table unit is initialized");
+	return 0;
+
+out_vi:
+	free_volume_info(ubi);
+out:
+	ubi_kfree(vtbl);
+	return err;
+}
+
+void ubi_vtbl_close(const struct ubi_info *ubi)
+{
+	dbg_vtbl("close the volume table unit");
+	free_volume_info(ubi);
+	ubi_kfree(ubi->vtbl);
+}
+
+/**
+ * change_volume - change geometry of an user volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to change
+ * @vtr: new volume table record
+ *
+ * This function accepts a new volume table record in @vtr and changes the
+ * volume table correspondingly (both in RAM and on flash). If
+ * @vtr->reserved_pebs contains zero, the volume is be deleted.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int change_volume(const struct ubi_info *ubi,
+			 int vol_id, const struct ubi_vtbl_vtr *vtr)
+{
+	int i, err, tries = 0;
+	struct ubi_vol_tbl_record *vol_tbl;
+	const struct ubi_io_info *io = ubi->io;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	vol_tbl = ubi_kzalloc(vtbl->vt_size, GFP_KERNEL);
+	if (!vol_tbl)
+		return -ENOMEM;
+
+	/* Generate the on-flash volume table contents */
+	for (i = 0; i < vtbl->vt_slots; i++) {
+		uint32_t crc;
+		const struct ubi_vtbl_vtr *tmp_vtr;
+
+		cond_resched();
+		tmp_vtr = &vtbl->vt[i];
+
+		err = paranoid_check_vtr(ubi, tmp_vtr);
+		if (unlikely(err))
+			goto out;
+
+		if (unlikely(i == vol_id))
+			tmp_vtr = vtr;
+
+		if (tmp_vtr->reserved_pebs == 0) {
+			/* Volume is empty */
+			memcpy(&vol_tbl[i], &empty_rec, UBI_VTBL_RECORD_SIZE);
+			continue;
+		}
+
+		vol_tbl[i].reserved_pebs = cpu_to_ubi32(tmp_vtr->reserved_pebs);
+		vol_tbl[i].alignment = cpu_to_ubi32(tmp_vtr->alignment);
+		vol_tbl[i].data_pad = cpu_to_ubi32(tmp_vtr->data_pad);
+		if (tmp_vtr->vol_type == UBI_DYNAMIC_VOLUME)
+			vol_tbl[i].vol_type = UBI_VID_DYNAMIC;
+		else
+			vol_tbl[i].vol_type = UBI_VID_STATIC;
+		vol_tbl[i].name_len = cpu_to_ubi16((uint16_t)tmp_vtr->name_len);
+
+		memcpy(&vol_tbl[i].name, tmp_vtr->name, tmp_vtr->name_len);
+		vol_tbl[i].name[tmp_vtr->name_len] = '\0';
+
+		crc = crc32(UBI_CRC32_INIT, &vol_tbl[i],
+			    UBI_VTBL_RECORD_SIZE_CRC);
+		vol_tbl[i].crc = cpu_to_ubi32(crc);
+	}
+
+
+	/* Now just update both volume table copies */
+	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
+		int written;
+
+		cond_resched();
+
+		err = ubi_eba_erase_leb(ubi, UBI_LAYOUT_VOL_ID, i);
+		if (unlikely(err))
+			goto out;
+
+		err = ubi_wl_erase_flush(ubi);
+		if (unlikely(err))
+			goto out;
+
+		err = ubi_eba_write_leb(ubi, UBI_LAYOUT_VOL_ID, i, vol_tbl, 0,
+					vtbl->vt_size, UBI_DATA_LONGTERM, 0,
+					&written, NULL);
+		if (unlikely(err)) {
+			if (++tries <= 5)
+				/* Try again */
+				i -= 1;
+			else
+				goto out;
+		}
+	}
+
+	/* Change the in-RAM volume table correspondingly */
+	ubi_kfree(vtbl->vt[vol_id].name);
+	if (vtr->reserved_pebs != 0) {
+		memcpy(&vtbl->vt[vol_id], vtr, sizeof(struct ubi_vtbl_vtr));
+		vtbl->vt[vol_id].usable_leb_size = io->leb_size - vtr->data_pad;
+		vtbl->vt[vol_id].name = strdup_len(vtr->name, vtr->name_len);
+		if (!vtbl->vt[vol_id].name) {
+			err = -ENOMEM;
+			goto out;
+		}
+		if (unlikely(paranoid_check_vtr(ubi, &vtbl->vt[vol_id]))) {
+			err = -EINVAL;
+			goto out;
+		}
+	} else
+		memset(&vtbl->vt[vol_id], 0, sizeof(struct ubi_vtbl_vtr));
+
+	ubi_kfree(vol_tbl);
+	return 0;
+
+out:
+	/*
+	 * The volume table is probably in an inconsistent state now, so switch
+	 * to read-only mode.
+	 */
+	ubi_eba_ro_mode(ubi);
+	ubi_kfree(vol_tbl);
+	return err;
+}
+
+static int create_vtbl(const struct ubi_info *ubi, struct ubi_scan_info *si,
+		       int copy, void *vol_tbl);
+
+/**
+ * create_empty_lvol - create an empty layout volume.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * If during scanning it was found out that the flash device is empty, this
+ * function is called to create an empty layout volume.
+ *
+ * This function returns the volume table contents in case of success and an
+ * error code in case of failure.
+ */
+static struct ubi_vol_tbl_record *create_empty_lvol(const struct ubi_info *ubi,
+						    struct ubi_scan_info *si)
+{
+	int i, err;
+	struct ubi_vol_tbl_record *vol_tbl;
+	struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	vol_tbl = ubi_kmalloc(vtbl->vt_size, GFP_KERNEL);
+	if (!vol_tbl)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < vtbl->vt_slots; i++)
+		memcpy(&vol_tbl[i], &empty_rec, UBI_VTBL_RECORD_SIZE);
+
+	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
+		cond_resched();
+
+		err = create_vtbl(ubi, si, i, vol_tbl);
+		if (unlikely(err))
+			goto out_free;
+	}
+
+	return vol_tbl;
+
+out_free:
+	ubi_kfree(vol_tbl);
+	return ERR_PTR(err);
+}
+
+static int vol_tbl_check(const struct ubi_info *ubi,
+			 const struct ubi_vol_tbl_record *vol_tbl);
+
+/**
+ * process_lvol - process the layout volume.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ * @sv: scanning information about the layout volume
+ *
+ * This function is responsible for reading the layout volume, ensuring it is
+ * not corrupted, and recovering from corruptions if needed.
+ *
+ * This function returns the volume table in case of success and a negative
+ * error code in case of failure.
+ */
+static struct ubi_vol_tbl_record *process_lvol(const struct ubi_info *ubi,
+					       struct ubi_scan_info *si,
+					       struct ubi_scan_volume *sv)
+{
+	int err, read;
+	struct rb_node *rb;
+	struct ubi_scan_leb *seb;
+	struct ubi_vtbl_info *vtbl = ubi->vtbl;
+	struct ubi_vol_tbl_record *leb[UBI_LAYOUT_VOLUME_EBS] = { NULL, NULL };
+	int leb_corrupted[UBI_LAYOUT_VOLUME_EBS] = { 1, 1 };
+
+	/*
+	 * UBI goes through the following steps when it updates the layout
+	 * volume:
+	 * a. erase LEB 0;
+	 * b. write new data to LEB 0;
+	 * c. erase LEB 1;
+	 * d. write new data to LEB 1.
+	 * Before being updated, LEBs 0 and 1 contain the same data.
+	 *
+	 * Owing to unclean reboots, we may lose the contents of LEB 0 but there
+	 * is always LEB 1 present. Thus, it is normal situation when LEB 0 is
+	 * corrupted while LEB 1 is OK. Also, due to unclean reboots, the LEB 1
+	 * may be corrupted, but there has to be LEB 0. And finally, unclean
+	 * reboots may result in a situation when neither LEB 0 nor LEB 1 are
+	 * corrupted, but are different. In this case, LEB 0 contains more
+	 * recent information.
+	 *
+	 * So the plan is to first check LEB 0. Then
+	 * a. if LEB 0 is OK, it contains the most resent data; then we
+	 * compare its contents with LEB 1, and if they are different, we copy
+	 * LEB 0 to LEB 1.
+	 * b. if LEB 0 is corrupted, but LEB 1 is OK, we copy LEB 1 to LEB 0.
+	 */
+
+	dbg_vtbl("check the layout volume");
+
+	/* Read both LEB 0 and LEB 1 into RAM */
+	rb_for_each_entry(rb, seb, &sv->root, rb) {
+		cond_resched();
+
+		leb[seb->lnum] = ubi_kzalloc(vtbl->vt_size, GFP_KERNEL);
+		if (!leb[seb->lnum]) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+
+		err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
+				      vtbl->vt_size, &read);
+		/* FIXME: if there is a bitflip, we could try to move it */
+		if (err == UBI_IO_BITFLIPS)
+			seb->scrub = 1;
+		else if (err)
+			goto out_free;
+	}
+
+	if (leb[0])
+		leb_corrupted[0] = vol_tbl_check(ubi, leb[0]);
+
+	if (leb_corrupted[0] == 0) {
+		/* LEB 0 is OK */
+
+		if (leb[1])
+			leb_corrupted[1] = memcmp(leb[0], leb[1],
+						  vtbl->vt_size);
+		if (leb_corrupted[1]) {
+			ubi_warn("the volume table copy #2 is corrupted");
+			err = create_vtbl(ubi, si, 1, leb[0]);
+			if (err)
+				goto out_free;
+		}
+
+		/* Both LEB 1 and LEB 2 are OK and consistent */
+		ubi_kfree(leb[1]);
+		return leb[0];
+	} else {
+		/* LEB 0 is corrupted or does not exist */
+		if (leb[1])
+			leb_corrupted[1] = vol_tbl_check(ubi, leb[1]);
+		if (leb_corrupted[1]) {
+			/*
+			 * Both LEB 0 and LEB 1 are corrupted. We don't try to
+			 * restore them and let userspace tools do this.
+			 */
+			ubi_err("the layout volume is corrupted");
+			err = -EINVAL;
+			goto out_free;
+		}
+
+		ubi_warn("the volume table copy #1 is corrupted");
+		err = create_vtbl(ubi, si, 0, leb[1]);
+		if (err)
+			goto out_free;
+
+		ubi_kfree(leb[0]);
+		return leb[1];
+	}
+
+out_free:
+	ubi_kfree(leb[0]);
+	ubi_kfree(leb[1]);
+	return ERR_PTR(err);
+}
+
+/**
+ * create_vtbl - create a copy of the volume table.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ * @copy: the number of the volume table copy
+ * @vol_tbl: the contents of the volume table
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int create_vtbl(const struct ubi_info *ubi, struct ubi_scan_info *si,
+		       int copy, void *vol_tbl)
+{
+	int written, err, tries = 0, pnum, ec;
+	unsigned int leb_ver;
+	struct ubi_vtbl_info *vtbl = ubi->vtbl;
+	static struct ubi_vid_hdr *vid_hdr;
+	struct ubi_scan_volume *sv;
+	struct ubi_scan_leb *new_seb, *old_seb = NULL;
+
+	ubi_msg("create volume table (copy #%d)", copy + 1);
+
+	vid_hdr = ubi_alloc_vid_hdr(ubi);
+	if (!vid_hdr)
+		return -ENOMEM;
+
+	/*
+	 * First we look if there is a logical eraseblock which would have to
+	 * contain this volume table copy was found during scanning. We have
+	 * to wipe it.
+	 */
+	sv = ubi_scan_get_scan_volume(si, UBI_LAYOUT_VOL_ID);
+	if (sv)
+		old_seb = ubi_scan_get_scan_leb(sv, copy);
+
+retry:
+	new_seb = ubi_scan_get_free_peb(ubi, si);
+	if (IS_ERR(new_seb)) {
+		err = PTR_ERR(new_seb);
+		goto out_free;
+	}
+	pnum = new_seb->pnum;
+	ec = new_seb->ec;
+	ubi_free_scan_leb(new_seb);
+
+	vid_hdr->vol_type = UBI_VID_DYNAMIC;
+	vid_hdr->vol_id = cpu_to_ubi32(UBI_LAYOUT_VOL_ID);
+	vid_hdr->compat = UBI_LAYOUT_VOLUME_COMPAT;
+	vid_hdr->data_size = vid_hdr->used_ebs =
+			     vid_hdr->data_pad = cpu_to_ubi32(0);
+	vid_hdr->lnum = cpu_to_ubi32(copy);
+	leb_ver = old_seb ? old_seb->leb_ver + 1: 0;
+	vid_hdr->leb_ver = cpu_to_ubi32(leb_ver);
+
+	/* The EC header is already there, write the VID header */
+	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
+	if (err)
+		goto write_error;
+
+	/* Write the layout volume contents */
+	err = ubi_io_write_data(ubi, vol_tbl, pnum, 0, vtbl->vt_size, &written);
+	if (err)
+		goto write_error;
+
+	/*
+	 * And add it to the scanning information. Don't delete the old
+	 * @old_seb as it will be deleted and freed in
+	 * 'ubi_scan_add_volume()'.
+	 */
+	err = ubi_scan_add_volume(ubi, si, pnum, ec, vid_hdr, 0);
+	if (err)
+		goto out_free;
+
+out_free:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	return err;
+
+write_error:
+	/* May be this physical eraseblock went bad, try to pick another one */
+	if (++tries <= 5) {
+		err = ubi_scan_add_to_corrupted(si, pnum, ec);
+		if (err)
+			goto out_free;
+		goto retry;
+	}
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	return err;
+}
+
+/**
+ * init_ram_vt - initialize the in-RAM copy of the volume table.
+ *
+ * @ubi: the UBI device description object
+ * @vol_tbl: the volume table
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int init_ram_vt(const struct ubi_info *ubi,
+		       const struct ubi_vol_tbl_record *vol_tbl)
+{
+	int i;
+	struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	vtbl->vt = ubi_kzalloc(vtbl->vt_slots * sizeof(struct ubi_vtbl_vtr),
+			       GFP_KERNEL);
+	if (!vtbl->vt)
+		return -ENOMEM;
+
+	for (i = 0; i < vtbl->vt_slots; i++) {
+		struct ubi_vtbl_vtr *vtr = &vtbl->vt[i];
+		int name_len;
+		char *name;
+
+		cond_resched();
+
+		vtr->reserved_pebs = ubi32_to_cpu(vol_tbl[i].reserved_pebs);
+
+		/* Skip empty records */
+		if (vtr->reserved_pebs == 0)
+			continue;
+
+		vtr->alignment = ubi32_to_cpu(vol_tbl[i].alignment);
+		vtr->data_pad = ubi32_to_cpu(vol_tbl[i].data_pad);
+		vtr->vol_type = vol_tbl[i].vol_type == UBI_VID_DYNAMIC ?
+		    UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
+		name_len = ubi16_to_cpu(vol_tbl[i].name_len);
+		vtr->name_len = name_len;
+		vtr->usable_leb_size = ubi->io->leb_size - vtr->data_pad;
+
+		vtr->name = ubi_kmalloc(name_len + 1, GFP_KERNEL);
+		if (unlikely(!vtr->name)) {
+			free_volume_info(ubi);
+			return -ENOMEM;
+		}
+
+		name = (char *)vtr->name;
+		memcpy(name, vol_tbl[i].name, name_len + 1);
+		name[name_len] = '\0';
+	}
+
+	return 0;
+}
+
+/**
+ * free_volume_info - free the in-RAM copy of the volume table.
+ *
+ * @ubi: the UBI device description object
+ */
+static void free_volume_info(const struct ubi_info *ubi)
+{
+	int i;
+
+	for (i = 0; i < ubi->vtbl->vt_slots; i++)
+		ubi_kfree(ubi->vtbl->vt[i].name);
+
+	ubi_kfree(ubi->vtbl->vt);
+}
+
+/**
+ * vol_tbl_check - check if the volume table is not corrupted and contains sane
+ * data.
+ *
+ * @ubi: the UBI device description object
+ * @vol_tbl: the volume table
+ *
+ * This function returns zero if the volume table is all right and %-EINVAL if
+ * not.
+ */
+static int vol_tbl_check(const struct ubi_info *ubi,
+			 const struct ubi_vol_tbl_record *vol_tbl)
+{
+	int i, reserved_pebs, alignment, data_pad, vol_type, name_len;
+	const char *name;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+	const struct ubi_io_info *io = ubi->io;
+
+	for (i = 0; i < vtbl->vt_slots; i++) {
+		int n;
+		uint32_t crc;
+
+		cond_resched();
+
+		reserved_pebs = ubi32_to_cpu(vol_tbl[i].reserved_pebs);
+		alignment = ubi32_to_cpu(vol_tbl[i].alignment);
+		data_pad = ubi32_to_cpu(vol_tbl[i].data_pad);
+		vol_type = vol_tbl[i].vol_type;
+		name_len = ubi16_to_cpu(vol_tbl[i].name_len);
+		name = &vol_tbl[i].name[0];
+
+		crc = crc32(UBI_CRC32_INIT, &vol_tbl[i],
+			    UBI_VTBL_RECORD_SIZE_CRC);
+
+		if (unlikely(ubi32_to_cpu(vol_tbl[i].crc) != crc)) {
+			ubi_warn("wrong CRC at record %u: %#08x, not %#08x",
+				i, crc, ubi32_to_cpu(vol_tbl[i].crc));
+			return -EINVAL;
+		}
+
+		if (reserved_pebs == 0) {
+			int is_zero;
+
+			is_zero = ubi_buf_all_zeroes(&vol_tbl[i],
+						     UBI_VTBL_RECORD_SIZE_CRC);
+			if (unlikely(is_zero == 0)) {
+				ubi_err("zero reserved_pebs");
+				goto bad;
+			}
+
+			continue;
+		}
+
+		if (unlikely(reserved_pebs < 0 || alignment < 0 ||
+			     data_pad < 0 || name_len < 0)) {
+			ubi_err("negative values");
+			goto bad;
+		}
+
+		if (unlikely(alignment > io->leb_size)) {
+			ubi_err("too large alignment");
+			goto bad;
+		}
+
+		if (unlikely(alignment == 0)) {
+			ubi_err("zero alignment");
+			goto bad;
+		}
+
+		n = alignment % io->min_io_size;
+		if (alignment != 1 && unlikely(n)) {
+			ubi_err
+			    ("alignment is not multiple of min I/O unit size");
+			goto bad;
+		}
+
+		n = io->leb_size % alignment;
+		if (unlikely(data_pad != n)) {
+			ubi_err("bad data_pad, has to be %d", n);
+			goto bad;
+		}
+
+		if (likely(vol_type != UBI_VID_DYNAMIC &&
+			   vol_type != UBI_VID_STATIC)) {
+			ubi_err("bad vol_type");
+			goto bad;
+		}
+
+		if (unlikely(reserved_pebs > io->good_peb_count)) {
+			ubi_err("too large reserved_pebs");
+			goto bad;
+		}
+
+		if (unlikely(name_len > UBI_VOL_NAME_MAX)) {
+			ubi_err("too long volume name, max is %d",
+				UBI_VOL_NAME_MAX);
+			goto bad;
+		}
+
+		if (unlikely(name[0] == '\0')) {
+			ubi_err("NULL volume name");
+			goto bad;
+		}
+
+		n = strnlen(name, name_len + 1);
+		if (unlikely(name_len != n)) {
+			ubi_err("bad name_len");
+			goto bad;
+		}
+	}
+
+	return 0;
+
+bad:
+	ubi_msg("volume record %d dump:", i);
+	ubi_dbg_dump_raw_vtr(&vol_tbl[i]);
+	return -EINVAL;
+}
+
+static int check_sv(const struct ubi_info *ubi,
+		    const struct ubi_scan_volume *sv,
+		    const struct ubi_vtbl_vtr *vtr);
+
+/**
+ * check_scanning_info - check that scanning information is consistent to the
+ * information from the volume table.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * Even though we protect on-flash data by CRC checksums, we still don't trust
+ * the media. Who knows what users are trying to feed us.
+ *
+ * This function returns zero if the scanning information is sane and %-EINVAL
+ * if it is not.
+ */
+static int check_scanning_info(const struct ubi_info *ubi,
+			       struct ubi_scan_info *si)
+{
+	int err, i;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_scan_volume *sv;
+	const struct ubi_vtbl_info *vtbl = ubi->vtbl;
+
+	for (i = 0; i < vtbl->vt_slots; i++) {
+		cond_resched();
+
+		vtr = &vtbl->vt[i];
+		sv = ubi_scan_get_scan_volume(si, i);
+
+		if (vtr->reserved_pebs == 0) {
+			if (likely(!sv))
+				continue;
+
+			/*
+			 * The scanning unit has found a volume which does not
+			 * exist according to the information in the volume
+			 * table. This must have happened due to an unclean
+			 * reboot while the volume was being removed, or if the
+			 * eraseblocks of a removed volumes were not erased.
+			 * Get rid of this volume.
+			 */
+			dbg_vtbl("volume %d removal was interrupted, finish it",
+				 sv->vol_id);
+			ubi_scan_rm_volume(ubi, si, sv);
+			continue;
+		}
+
+		if (!sv)
+			continue;
+
+		err = check_sv(ubi, sv, vtr);
+		if (unlikely(err))
+			goto out;
+	}
+
+	/* Check that scanning information about internal UBI volumes is sane */
+	for (i = 0; i < UBI_INT_VOL_COUNT; i++) {
+		cond_resched();
+
+		vtr = ubi_ivol_get_vtr(ubi, i + UBI_INTERNAL_VOL_START);
+		ubi_assert(!IS_ERR(vtr));
+
+		sv = ubi_scan_get_scan_volume(si, i + UBI_INTERNAL_VOL_START);
+
+		/*
+		 * If an internal volume was not found, the corresponding
+		 * UBI unit will handle this.
+		 */
+		if (!sv)
+			continue;
+
+		err = check_sv(ubi, sv, vtr);
+		if (unlikely(err))
+			goto out;
+	}
+
+	return 0;
+
+out:
+	return -EINVAL;
+}
+
+/**
+ * check_sv - check sanity of scanning information about a volume.
+ *
+ * @sv: volume scanning information
+ * @vtr: corresponding volume table record (supposed to be correct)
+ *
+ * This function returns zero if the volume scanning information is sane, and
+ * %-EINVAL if not.
+ */
+static int check_sv(const struct ubi_info *ubi,
+		    const struct ubi_scan_volume *sv,
+		    const struct ubi_vtbl_vtr *vtr)
+{
+	if (unlikely(sv->highest_lnum >= vtr->reserved_pebs)) {
+		ubi_err("bad highest_lnum");
+		goto bad;
+	}
+
+	if (unlikely(sv->leb_count > vtr->reserved_pebs)) {
+		ubi_err("bad leb_count");
+		goto bad;
+	}
+
+	if (unlikely(sv->vol_type != vtr->vol_type)) {
+		ubi_err("bad vol_type");
+		goto bad;
+	}
+
+	if (unlikely(sv->used_ebs > vtr->reserved_pebs)) {
+		ubi_err("bad used_ebs");
+		goto bad;
+	}
+
+	if (unlikely(sv->data_pad != vtr->data_pad)) {
+		ubi_err("bad data_pad");
+		goto bad;
+	}
+
+	return 0;
+
+bad:
+	ubi_dbg_dump_sv(sv);
+	ubi_dbg_dump_vtr(vtr);
+	return -EINVAL;
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_VTBL
+
+/**
+ * paranoid_check_vtr - check a &struct ubi_vtbl_vtr object.
+ *
+ * @ubi: the UBI device description object
+ * @vtr: the object pointer to check
+ *
+ * This function returns zero if the volume table record is sane, and %1 if
+ * not.
+ */
+static int paranoid_check_vtr(const struct ubi_info *ubi,
+			      const struct ubi_vtbl_vtr *vtr)
+{
+	int n;
+	const struct ubi_io_info *io = ubi->io;
+
+	if (vtr->reserved_pebs == 0)
+		return 0;
+
+	if (unlikely(vtr->reserved_pebs < 0 || vtr->alignment < 0 ||
+		     vtr->data_pad < 0 || vtr->name_len < 0)) {
+		ubi_err("negative values");
+		goto fail;
+	}
+
+	if (unlikely(vtr->alignment > io->leb_size)) {
+		ubi_err("too large alignment %d", vtr->alignment);
+		goto fail;
+	}
+
+	if (unlikely(vtr->alignment == 0)) {
+		ubi_err("zero alignment");
+		goto fail;
+	}
+
+	n = vtr->alignment % io->min_io_size;
+	if (vtr->alignment != 1 && unlikely(n)) {
+		ubi_err("alignment %d is not multiple of min I/O unit size",
+			vtr->alignment);
+		goto fail;
+	}
+
+	n = io->leb_size % vtr->alignment;
+	if (unlikely(vtr->data_pad != n)) {
+		ubi_err("bad data_pad %d, has to be %d", vtr->data_pad, n);
+		goto fail;
+	}
+
+	if (unlikely(vtr->vol_type != UBI_DYNAMIC_VOLUME &&
+		     vtr->vol_type != UBI_STATIC_VOLUME)) {
+		ubi_err("bad vol_type %d", vtr->vol_type);
+		goto fail;
+	}
+
+	if (unlikely(vtr->reserved_pebs > io->good_peb_count)) {
+		ubi_err("too large reserved_pebs %d", vtr->reserved_pebs);
+		goto fail;
+	}
+
+	if (unlikely(vtr->usable_leb_size != io->leb_size - vtr->data_pad)) {
+		ubi_err("bad usable_leb_size %d, has to be %d",
+			vtr->usable_leb_size, io->leb_size - vtr->data_pad);
+		goto fail;
+	}
+
+	if (unlikely(vtr->name_len > UBI_VOL_NAME_MAX)) {
+		ubi_err("too long volume name %d, max is %d",
+			vtr->name_len, UBI_VOL_NAME_MAX);
+		goto fail;
+	}
+
+	if (unlikely(!vtr->name)) {
+		ubi_err("NULL volume name");
+		goto fail;
+	}
+
+	n = strnlen(vtr->name, vtr->name_len + 1);
+	if (unlikely(n != vtr->name_len)) {
+		ubi_err("bad name_len %d", vtr->name_len);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	ubi_err("paranoid check failed");
+	ubi_dbg_dump_vtr(vtr);
+	dump_stack();
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_VTBL */
diff --git a/drivers/mtd/ubi/vtbl.h b/drivers/mtd/ubi/vtbl.h
new file mode 100644
index 0000000..4bde199
--- /dev/null
+++ b/drivers/mtd/ubi/vtbl.h
@@ -0,0 +1,163 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+/*
+ * The volume table unit.
+ *
+ * This unit is responsible for maintaining the volume table.  The volume table
+ * is an on-flash table containing volume metadata like volume name, number of
+ * reserved physical eraseblocks, type, etc. The volume table is stored in the
+ * so-called "layout volume".
+ *
+ * The layout volume is an internal volume where the volume tables are stored.
+ * It it organized as follows. It consists of two logical eraseblocks - LEB 0
+ * and LEB 1. Each logical eraseblock stores a copy the volume table, i.e. LEB
+ * 0 and LEB 1 duplicate each other. This redundancy guarantees robustness and
+ * tolerance to unclean reboots. The volume table is a mere array of so-called
+ * "volume table records". Each record contains full information about the
+ * volume and is protected by a CRC checksum.
+ *
+ * The volume table is changed as follows. It is first changed in RAM. Then LEB
+ * 0 is erased, and the updated volume table is written back to LEB 0. The same
+ * is done with LEB 1. This scheme guarantees recoverability from unclean
+ * reboots.
+ *
+ * NOTE: this unit does not do any serialization and it is supposed that the
+ * serialization is provided by its users. This means that it is prohibited to
+ * change a volume while somebody else is working with it.
+ */
+
+#ifndef __UBI_VTBL_H__
+#define __UBI_VTBL_H__
+
+struct ubi_info;
+struct ubi_scan_info;
+struct ubi_vtbl_vtr;
+
+/**
+ * ubi_vtbl_mkvol - create volume table record for a new volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the new volume
+ * @vtr: volume table record of the new volume
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. The @vtr->usable_leb_size field is ignored.
+ */
+int ubi_vtbl_mkvol(const struct ubi_info *ubi, int vol_id,
+		   const struct ubi_vtbl_vtr *vtr);
+
+/**
+ * ubi_vtbl_rmvol - clear the volume table record of a volume.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of the volume to remove
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_vtbl_rmvol(const struct ubi_info *ubi, int vol_id);
+
+/**
+ * ubi_vtbl_rsvol - change volume size in the volume table record.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: re-sized volume's ID
+ * @reserved_pebs: new size, i.e. new number of reserved eraseblocks.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_vtbl_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs);
+
+/**
+ * ubi_vtbl_get_vtr - retrieve a volume table record.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the requested volume ID
+ *
+ * This function returns a pointer to the volume record or an error code.
+ * If the volume ID is incorrect, %-EINVAL is returned, if the volume does
+ * not exist, %-ENODEV is returned.
+ *
+ * This function does not access the flash media as retrieves the information
+ * from the in-RAM volume table copy. So it does not sleep.
+ */
+const struct ubi_vtbl_vtr *ubi_vtbl_get_vtr(const struct ubi_info *ubi,
+					    int vol_id);
+
+/**
+ * ubi_vtbl_init_scan - initialize the volume table unit using scanning
+ * information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_vtbl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_vtbl_close - close the volume table unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_vtbl_close(const struct ubi_info *ubi);
+
+/**
+ * struct ubi_vtbl_vtr - in-memory representation of volume table records.
+ *
+ * @reserved_pebs: how many physical eraseblocks are reserved for this volume
+ * @alignment: volume alignment
+ * @data_pad: how many bytes are not used at the end of eraseblocks to
+ * satisfy the requested alignment
+ * @name_len: volume name length
+ * @name: volume name
+ * @usable_leb_size: logical eraseblock size without padding
+ *
+ * Note, the @usable_leb_size field is not stored on flash, as it is easily
+ * calculated with help of the @data_pad field. But it is just very handy, so
+ * we keep it in the in-RAM volume table record representation.
+ */
+struct ubi_vtbl_vtr {
+	int reserved_pebs;
+	int alignment;
+	int data_pad;
+	int vol_type;
+	int name_len;
+	const char *name;
+	int usable_leb_size;
+};
+
+/**
+ * struct ubi_vtbl_info - volume table unit description data structure.
+ *
+ * @vt_slots: how many volume table records are stored in the volume table
+ * @vt_size: size of the volume table in bytes
+ * @vt: the in-RAM copy of the volume table
+ */
+struct ubi_vtbl_info {
+	int vt_slots;            /* public  */
+	int vt_size;             /* private */
+	struct ubi_vtbl_vtr *vt; /* private */
+};
+
+#endif /* __UBI_VTBL_H__ */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
new file mode 100644
index 0000000..c6caa2d
--- /dev/null
+++ b/drivers/mtd/ubi/wl.c
@@ -0,0 +1,1752 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Authors: Artem B. Bityutskiy, Thomas Gleixner
+ */
+
+#include <linux/config.h>
+#include <linux/list.h>
+#include <linux/rbtree.h>
+#include <linux/wait.h>
+#include <linux/crc32.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <mtd/ubi-header.h>
+#include "ubi.h"
+#include "alloc.h"
+#include "wl.h"
+#include "badeb.h"
+#include "io.h"
+#include "account.h"
+#include "eba.h"
+#include "background.h"
+#include "scan.h"
+#include "misc.h"
+#include "debug.h"
+
+/* Number of physical eraseblocks reserved for wear-leveling purposes */
+#define WL_RESERVED_PEBS 1
+
+/*
+ * How many erase cycles are short term, unknown, and long term physical
+ * eraseblocks protected.
+ */
+#define ST_PROTECTION 16
+#define U_PROTECTION  10
+#define LT_PROTECTION 4
+
+/*
+ * Maximum difference between two erase counters. If this threshold is
+ * exceeded, the WL unit starts moving data from used physical eraseblocks with
+ * low erase counter to free physical eraseblocks with high erase counter.
+ */
+#define UBI_WL_THRESHOLD CONFIG_MTD_UBI_WL_THRESHOLD
+
+/*
+ * When a physical eraseblock is moved, the WL unit has to pick the target
+ * physical eraseblock to move to. The simplest way would be just to pick the
+ * one with the highest erase counter. But in certain workload this could lead
+ * to an unbounded wearing of one or few physical eraseblock. Indeed, imagine a
+ * situation when the picked physical eraseblock is constantly erased after the
+ * data is written to it. So, we have a constant which limits the highest
+ * erase counter of the free physical eraseblock to pick. Namely, the WL unit
+ * does not pick eraseblocks with erase counter greater then the lowest erase
+ * counter plus %WL_FREE_MAX_DIFF.
+ */
+#define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_WL
+static int paranoid_check_ec(const struct ubi_info *ubi, int pnum, int ec);
+static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root);
+#else
+#define paranoid_check_ec(ubi, pnum, ec) 0
+#define paranoid_check_in_wl_tree(e, root)
+#endif
+
+/**
+ * tree_empty - a helper function to check if an RB-tree is empty.
+ *
+ * @root: the root of the tree
+ *
+ * This function returns non-zero if the tree is empty and zero if not.
+ */
+static inline int tree_empty(struct rb_root *root)
+{
+	return root->rb_node == NULL;
+}
+
+static void wl_tree_add(struct ubi_wl_entry *e, struct rb_root *root);
+
+/*
+ * Functions to add and delete wear-leveling entries from different trees.
+ */
+
+static inline void free_tree_add(struct ubi_wl_info *wl,
+				 struct ubi_wl_entry *e)
+{
+	wl_tree_add(e, &wl->free);
+}
+static inline void used_tree_add(struct ubi_wl_info *wl,
+				 struct ubi_wl_entry *e)
+{
+	wl_tree_add(e, &wl->used);
+}
+static inline void scrub_tree_add(struct ubi_wl_info *wl,
+				  struct ubi_wl_entry *e)
+{
+	wl_tree_add(e, &wl->scrub);
+}
+
+static inline void free_tree_del(struct ubi_wl_info *wl,
+				 struct ubi_wl_entry *e)
+{
+	paranoid_check_in_wl_tree(e, &wl->free);
+	rb_erase(&e->rb, &wl->free);
+}
+static inline void used_tree_del(struct ubi_wl_info *wl,
+				 struct ubi_wl_entry *e)
+{
+	paranoid_check_in_wl_tree(e, &wl->used);
+	rb_erase(&e->rb, &wl->used);
+}
+static inline void scrub_tree_del(struct ubi_wl_info *wl,
+				  struct ubi_wl_entry *e)
+{
+	paranoid_check_in_wl_tree(e, &wl->scrub);
+	rb_erase(&e->rb, &wl->scrub);
+}
+
+static int erase_one_pending(const struct ubi_info *ubi);
+static struct ubi_wl_entry *pick_long_term(struct ubi_wl_info *wl);
+static struct ubi_wl_entry *pick_unknown(struct ubi_wl_info *wl);
+static struct ubi_wl_entry *pick_short_term(struct ubi_wl_info *wl);
+static void prot_tree_add(struct ubi_wl_info *wl, struct ubi_wl_entry *e,
+			  struct ubi_wl_prot_entry *pe, int abs_ec);
+
+int ubi_wl_get_peb(const struct ubi_info *ubi, enum ubi_data_type dtype)
+{
+	int err, protect;
+	struct ubi_wl_entry *e;
+	struct ubi_wl_info *wl = ubi->wl;
+	struct ubi_wl_prot_entry *pe;
+
+	might_sleep();
+
+	/* Input arguments sanity check */
+	ubi_assert(dtype == UBI_DATA_LONGTERM || dtype == UBI_DATA_SHORTTERM ||
+		   dtype == UBI_DATA_UNKNOWN);
+
+	pe = ubi_alloc_wl_prot_entry();
+	if (unlikely(!pe))
+		return -ENOMEM;
+
+retry:
+	spin_lock(&wl->lock);
+	if (unlikely(tree_empty(&wl->free))) {
+		if (unlikely(wl->erase_pending == 0)) {
+			ubi_err("no free eraseblocks");
+			spin_unlock(&wl->lock);
+			ubi_free_wl_prot_entry(pe);
+			return -ENOSPC;
+		}
+		spin_unlock(&wl->lock);
+
+		err = erase_one_pending(ubi);
+		if (unlikely(err < 0)) {
+			ubi_free_wl_prot_entry(pe);
+			return err;
+		}
+		goto retry;
+	}
+
+	switch (dtype) {
+		case UBI_DATA_LONGTERM:
+			e = pick_long_term(wl);
+			protect = LT_PROTECTION;
+			break;
+		case UBI_DATA_UNKNOWN:
+			e = pick_unknown(wl);
+			protect = U_PROTECTION;
+			break;
+		case UBI_DATA_SHORTTERM:
+			e = pick_short_term(wl);
+			protect = ST_PROTECTION;
+			break;
+	}
+
+	/*
+	 * Move the physical eraseblock to the protection trees where it will
+	 * be protected from being moved for some time.
+	 */
+	free_tree_del(wl, e);
+	prot_tree_add(wl, e, pe, protect);
+
+	dbg_wl("PEB %d EC %d, protection %d", e->pnum, e->ec, protect);
+	spin_unlock(&wl->lock);
+
+	return e->pnum;
+}
+
+static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root);
+static int schedule_erase(const struct ubi_info *ubi, struct ubi_wl_entry *e,
+			  int torture);
+static void check_protection_over(struct ubi_wl_info *wl);
+static void prot_tree_del(struct ubi_wl_info *wl, int pnum);
+
+int ubi_wl_put_peb(const struct ubi_info *ubi, int pnum, int torture)
+{
+	int err;
+	struct ubi_wl_entry *e;
+	struct ubi_wl_info *wl = ubi->wl;
+
+	dbg_wl("PEB %d", pnum);
+	might_sleep();
+
+	/* Input arguments sanity check */
+	ubi_assert(pnum >= 0);
+	ubi_assert(pnum < ubi->io->peb_count);
+
+	spin_lock(&wl->lock);
+	ubi_assert(wl->erase_pending >= 0);
+	wl->erase_pending += 1;
+
+	e = wl->lookuptbl[pnum];
+	if (unlikely(e == wl->move)) {
+		/*
+		 * User is putting a physical eraseblock which was selected to
+		 * be moved. We cancel the movement by setting @wl->move to
+		 * %NULL. The wear-leveling worker has to notice this and
+		 * cancel.
+		 *
+		 * Note, the physical eraseblock was removed from the @wl->used
+		 * tree by the wear-leveling worker and is not in any tree now.
+		 */
+		dbg_wl("cancel PEB %d movement", pnum);
+		wl->move = NULL;
+	} else {
+		if (in_wl_tree(e, &wl->used))
+			used_tree_del(wl, e);
+		else if (unlikely(in_wl_tree(e, &wl->scrub)))
+			scrub_tree_del(wl, e);
+		else
+			prot_tree_del(wl, e->pnum);
+	}
+	spin_unlock(&wl->lock);
+
+	err = schedule_erase(ubi, e, torture);
+	if (unlikely(err)) {
+		spin_lock(&wl->lock);
+		wl->erase_pending -= 1;
+		used_tree_add(wl, e);
+		spin_unlock(&wl->lock);
+	}
+
+	return err;
+}
+
+static int ensure_wear_leveling(const struct ubi_info *ubi);
+
+int ubi_wl_scrub_peb(const struct ubi_info *ubi, int pnum)
+{
+	struct ubi_wl_entry *e;
+	struct ubi_wl_info *wl = ubi->wl;
+
+	dbg_wl("schedule PEB %d for scrubbing", pnum);
+
+	spin_lock(&wl->lock);
+	e = wl->lookuptbl[pnum];
+	if (e == wl->move || in_wl_tree(e, &wl->scrub)) {
+		spin_unlock(&wl->lock);
+		return 0;
+	}
+
+	if (in_wl_tree(e, &wl->used))
+		used_tree_del(wl, e);
+	else
+		prot_tree_del(wl, pnum);
+
+	scrub_tree_add(wl, e);
+	spin_unlock(&wl->lock);;
+
+	/*
+	 * Technically scrubbing is the same as wear-levelling, so it is done
+	 * by the WL worker. Schedule it.
+	 */
+	return ensure_wear_leveling(ubi);
+}
+
+static int erase_worker(const struct ubi_info *ubi, struct ubi_bgt_work *wrk,
+			int cancel);
+
+int ubi_wl_erase_flush(const struct ubi_info *ubi)
+{
+	int err, pending_count;
+	struct ubi_bgt_work *wrk;
+	const struct ubi_bgt_info *bgt = ubi->bgt;
+
+	pending_count = bgt->pending_works_count;
+
+	dbg_wl("flush (%d pending works)", pending_count);
+
+	/*
+	 * Erase while the pending works queue is not empty, but not more then
+	 * the number of currently pending works.
+	 */
+	while (pending_count != 0 && (wrk = ubi_bgt_next_work(ubi))) {
+		pending_count -= 1;
+
+		if (wrk->func != &erase_worker) {
+			/* We are only interested in "erase" works" */
+			err = ubi_bgt_reschedule(ubi, wrk);
+			if (unlikely(err)) {
+				/*
+				 * The background thread was killed. Cancel
+				 * this work. We cannot really operate without
+				 * the background thread, so switch to
+				 * read-only mode.
+				 */
+				wrk->func(ubi, wrk, 1);
+				ubi_eba_ro_mode(ubi);
+				return err;
+			}
+		} else {
+			err = wrk->func(ubi, wrk, 0);
+			if (unlikely(err))
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static void tree_destroy(struct rb_root *root);
+
+int ubi_wl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si)
+{
+	int err;
+	struct rb_node *rb1, *rb2;
+	struct ubi_scan_volume *sv;
+	struct ubi_scan_leb *seb, *tmp;
+	struct ubi_wl_entry *e;
+	struct ubi_wl_info *wl;
+	const struct ubi_io_info *io = ubi->io;
+
+	dbg_wl("initialize the UBI wear-leveling unit");
+
+	wl = ubi_kzalloc(sizeof(struct ubi_wl_info), GFP_KERNEL);
+	if (!wl)
+		return -ENOMEM;
+	ubi->wl = wl;
+
+	wl->used = wl->free = wl->scrub = RB_ROOT;
+	wl->prot.pnum = wl->prot.aec = RB_ROOT;
+	spin_lock_init(&wl->lock);
+	wl->max_ec = si->max_ec;
+
+	err = -ENOMEM;
+	wl->lookuptbl = ubi_kzalloc(io->peb_count * sizeof(void *), GFP_KERNEL);
+	if (!wl->lookuptbl)
+		goto out_free;
+
+	/*
+	 * The way how we distinguish between older LEB and newer LEB is based
+	 * on the following principles:
+	 * 1 if we have LEB with versions A and B, A < B, then B is newer then
+	 *   A when abs(B - A) < %0x7FFFFFFF
+	 * 2 as the WL unit guarantees that the length of the pending works
+	 *   queue is shorter then %0x7FFFFFFF works, and the works are put at
+	 *   the tail of the queue and got from its head, the above algorithm
+	 *   works correctly.
+	 *
+	 * Now we've got a list of eraseblocks to erase, and they are now
+	 * out-of-order, which does not satisfy the 2nd item, so we've got to
+	 * erase them now instead of deferring this.
+	 */
+	list_for_each_entry_safe(seb, tmp, &si->erase, list) {
+		cond_resched();
+
+		dbg_wl("erase PEB %d", seb->pnum);
+		err = ubi_scan_early_erase_peb(ubi, si, seb->pnum, seb->ec);
+		if (unlikely(err)) {
+			if (err != -EIO && err != -EROFS)
+				goto out_free;
+			list_del(&seb->list);
+			list_add_tail(&seb->list, &si->corr);
+		} else {
+			list_del(&seb->list);
+			list_add_tail(&seb->list, &si->free);
+			seb->ec += 1;
+		}
+	}
+
+	list_for_each_entry(seb, &si->free, list) {
+		cond_resched();
+
+		e = ubi_alloc_wl_entry();
+		if (unlikely(!e))
+			goto out_free;
+
+		e->pnum = seb->pnum;
+		e->ec = seb->ec;
+		ubi_assert(e->ec >= 0);
+		free_tree_add(wl, e);
+		wl->lookuptbl[e->pnum] = e;
+	}
+
+	list_for_each_entry(seb, &si->corr, list) {
+		cond_resched();
+
+		e = ubi_alloc_wl_entry();
+		if (unlikely(!e)) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+
+		e->pnum = seb->pnum;
+		e->ec = seb->ec;
+		wl->lookuptbl[e->pnum] = e;
+		wl->erase_pending += 1;
+		err = schedule_erase(ubi, e, 0);
+		if (unlikely(err)) {
+			ubi_free_wl_entry(e);
+			goto out_free;
+		}
+	}
+
+	rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+		rb_for_each_entry(rb2, seb, &sv->root, rb) {
+			cond_resched();
+
+			e = ubi_alloc_wl_entry();
+			if (unlikely(!e))
+				goto out_free;
+
+			e->pnum = seb->pnum;
+			e->ec = seb->ec;
+			wl->lookuptbl[e->pnum] = e;
+			if (!seb->scrub) {
+				dbg_wl("add PEB %d EC %d to the used tree",
+				       e->pnum, e->ec);
+				used_tree_add(wl, e);
+			} else {
+				dbg_wl("add PEB %d EC %d to the scrub tree",
+				       e->pnum, e->ec);
+				scrub_tree_add(wl, e);
+			}
+		}
+	}
+
+	err = ubi_acc_reserve(ubi, WL_RESERVED_PEBS);
+	if (err)
+		goto out_free;
+
+	/* Schedule wear-leveling if needed */
+	err = ensure_wear_leveling(ubi);
+	if (err)
+		goto out_free;
+
+	return 0;
+
+out_free:
+	tree_destroy(&wl->used);
+	tree_destroy(&wl->free);
+	tree_destroy(&wl->scrub);
+	ubi_kfree(wl->lookuptbl);
+	ubi_kfree(wl);
+	return err;
+}
+
+/**
+ * find_wl_entry - find a wl entry closest to certain erase counter.
+ *
+ * @root: the RB-tree where to look for
+ * @max: highest erase possible counter
+ *
+ * This function looks for a wear leveling entry erase counter closest to @max
+ * and less then @max.
+ */
+static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
+{
+	struct rb_node *p;
+	struct ubi_wl_entry *e;
+
+	e = rb_entry(rb_first(root), struct ubi_wl_entry, rb);
+	max += e->ec;
+
+	p = root->rb_node;
+	while (p) {
+		struct ubi_wl_entry *e1;
+
+		e1 = rb_entry(p, struct ubi_wl_entry, rb);
+		if (e1->ec >= max)
+			p = p->rb_left;
+		else {
+			p = p->rb_right;
+			e = e1;
+		}
+	}
+
+	return e;
+}
+
+/**
+ * pick_long_term - select a "long-term" physical eraseblock.
+ *
+ * @wl: the wear-leveling unit description data structure
+ *
+ * This function returns the requested physical eraseblock. The wl->lock must
+ * be locked. The @wl->free list must not be empty.
+ */
+static struct ubi_wl_entry *pick_long_term(struct ubi_wl_info *wl)
+{
+	struct ubi_wl_entry *e;
+
+	/*
+	 * For long term data we pick a physical eraseblock with high erase
+	 * counter. But the highest erase counter we can pick is bounded by
+	 * the the lowest erase counter plus %WL_FREE_MAX_DIFF.
+	 */
+	e = find_wl_entry(&wl->free, WL_FREE_MAX_DIFF);
+	return e;
+}
+
+/**
+ * pick_unknown - select an "unknown" physical eraseblock.
+ *
+ * @wl: the wear-leveling unit description data structure
+ *
+ * This function returns the requested physical eraseblock. The wl->lock must
+ * be locked. The @wl->free list must not be empty.
+ */
+static struct ubi_wl_entry *pick_unknown(struct ubi_wl_info *wl)
+{
+	int medium_ec;
+	struct rb_node *p;
+	struct ubi_wl_entry *first, *last, *e;
+
+	/*
+	 * For unknown data we are trying to pick a physical eraseblock with
+	 * medium erase counter. But we by no means can pick a physical
+	 * eraseblock with erase counter greater or equivalent then the the
+	 * lowest erase counter plus %WL_FREE_MAX_DIFF.
+	 */
+
+	first = rb_entry(rb_first(&wl->free), struct ubi_wl_entry, rb);
+	last = rb_entry(rb_last(&wl->free), struct ubi_wl_entry, rb);
+
+	if (last->ec - first->ec < WL_FREE_MAX_DIFF)
+		return rb_entry(wl->free.rb_node, struct ubi_wl_entry, rb);
+
+	medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
+	e = first;
+
+	p = wl->free.rb_node;
+	while (p) {
+		struct ubi_wl_entry *e1;
+
+		e1 = rb_entry(p, struct ubi_wl_entry, rb);
+		if (e1->ec >= medium_ec)
+			p = p->rb_left;
+		else {
+			p = p->rb_right;
+			e = e1;
+		}
+	}
+
+	return e;
+}
+
+/**
+ * pick_short_term - select a "short term" physical eraseblock.
+ *
+ * @wl: the wear-leveling unit description data structure
+ *
+ * This function returns the requested physical eraseblock. The wl->lock must
+ * be locked. The @wl->free list must not be empty.
+ */
+static struct ubi_wl_entry *pick_short_term(struct ubi_wl_info *wl)
+{
+	struct ubi_wl_entry *e;
+
+	/*
+	 * For short term data we pick a physical eraseblock with the lowest
+	 * erase counter as we expect it will be erased soon.
+	 */
+	e = rb_entry(rb_first(&wl->free), struct ubi_wl_entry, rb);
+	return e;
+}
+
+/**
+ * prot_tree_add - add a the physical eraseblock to the protection trees.
+ *
+ * @wl: the wear-leveling unit description data structure
+ * @e: the physical eraseblock to add
+ * @pe: a protection entry object to use
+ * @abs_ec: the absolute erase counter value when this physical eraseblock has
+ * to be removed from the protection trees.
+ *
+ * @wl->lock has to be locked.
+ */
+static void prot_tree_add(struct ubi_wl_info *wl, struct ubi_wl_entry *e,
+			  struct ubi_wl_prot_entry *pe, int abs_ec)
+{
+	struct rb_node **p, *parent = NULL;
+	struct ubi_wl_prot_entry *pe1;
+
+	pe->e = e;
+	pe->abs_ec = wl->abs_ec + abs_ec;
+
+	p = &wl->prot.pnum.rb_node;
+	while (*p) {
+		parent = *p;
+		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_pnum);
+
+		if (e->pnum < pe1->e->pnum)
+			p = &(*p)->rb_left;
+		else
+			p = &(*p)->rb_right;
+	}
+	rb_link_node(&pe->rb_pnum, parent, p);
+	rb_insert_color(&pe->rb_pnum, &wl->prot.pnum);
+
+	p = &wl->prot.aec.rb_node;
+	parent = NULL;
+	while (*p) {
+		parent = *p;
+		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_aec);
+
+		if (pe->abs_ec < pe1->abs_ec)
+			p = &(*p)->rb_left;
+		else
+			p = &(*p)->rb_right;
+	}
+	rb_link_node(&pe->rb_aec, parent, p);
+	rb_insert_color(&pe->rb_aec, &wl->prot.aec);
+}
+
+/**
+ * check_protection_over - check if it is time to stop protecting some
+ * physical eraseblocks.
+ *
+ * @wl: the wear-leveling unit description data structure
+ *
+ * This function is called after each erase operation, when the absolute erase
+ * counter is incremented, to check if some physical eraseblock  have not to be
+ * protected any longer. These physical eraseblocks are moved from the
+ * protection trees to the used tree.
+ */
+static void check_protection_over(struct ubi_wl_info *wl)
+{
+	struct ubi_wl_prot_entry *pe;
+
+	/*
+	 * There may be several protected physical eraseblock to remove,
+	 * process them all.
+	 */
+	while (1) {
+		spin_lock(&wl->lock);
+		if (tree_empty(&wl->prot.aec)) {
+			spin_unlock(&wl->lock);
+			break;
+		}
+
+		pe = rb_entry(rb_first(&wl->prot.aec),
+			      struct ubi_wl_prot_entry, rb_aec);
+
+		if (pe->abs_ec > wl->abs_ec) {
+			spin_unlock(&wl->lock);
+			break;
+		}
+
+		dbg_wl("PEB %d protection over, abs_ec %lld, PEB abs_ec %lld",
+		       pe->e->pnum, wl->abs_ec, pe->abs_ec);
+		rb_erase(&pe->rb_aec, &wl->prot.aec);
+		rb_erase(&pe->rb_pnum, &wl->prot.pnum);
+		used_tree_add(wl, pe->e);
+		spin_unlock(&wl->lock);
+
+		ubi_free_wl_prot_entry(pe);
+		cond_resched();
+	}
+}
+
+/**
+ * prot_tree_del - remove a physical eraseblock from the protection trees
+ *
+ * @wl: the wear-leveling unit description data structure
+ * @pnum: the physical eraseblock number to remove
+ */
+static void prot_tree_del(struct ubi_wl_info *wl, int pnum)
+{
+	struct rb_node *p;
+	struct ubi_wl_prot_entry *pe;
+
+	p = wl->prot.pnum.rb_node;
+	while (p) {
+
+		pe = rb_entry(p, struct ubi_wl_prot_entry, rb_pnum);
+
+		if (pnum == pe->e->pnum)
+			break;
+
+		if (pnum < pe->e->pnum)
+			p = p->rb_left;
+		else
+			p = p->rb_right;
+	}
+
+	ubi_assert(pe->e->pnum == pnum);
+	rb_erase(&pe->rb_aec, &wl->prot.aec);
+	rb_erase(&pe->rb_pnum, &wl->prot.pnum);
+	ubi_free_wl_prot_entry(pe);
+}
+
+
+static void protection_trees_destroy(struct ubi_wl_info *wl);
+
+void ubi_wl_close(struct ubi_info *ubi)
+{
+	struct ubi_wl_info *wl = ubi->wl;
+
+	dbg_wl("close the UBI wear-leveling unit");
+
+	protection_trees_destroy(wl);
+	tree_destroy(&wl->used);
+	tree_destroy(&wl->free);
+	tree_destroy(&wl->scrub);
+	ubi_kfree(wl->lookuptbl);
+	ubi_kfree(wl);
+}
+
+static int wear_leveling_worker(const struct ubi_info *ubi,
+				struct ubi_bgt_work *wrk, int cancel);
+
+/**
+ * ensure_wear_leveling - schedule wear-leveling if it is needed.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function checks if it is time to start wear-leveling and schedules it
+ * if yes. This function returns zero in case of success and a negative error
+ * code in case of failure.
+ */
+static int ensure_wear_leveling(const struct ubi_info *ubi)
+{
+	int err = 0;
+	struct ubi_wl_entry *e1;
+	struct ubi_wl_entry *e2;
+	struct ubi_bgt_work *wrk;
+	struct ubi_wl_info *wl = ubi->wl;
+
+	spin_lock(&wl->lock);
+	if (wl->wl_scheduled)
+		/* Wear-leveling is already in the work queue */
+		goto out_unlock;
+
+	/*
+	 * If the wl->scrub tree is not empty, scrubbing is needed, and the the
+	 * WL worker has to be scheduled anyway.
+	 */
+	if (tree_empty(&wl->scrub)) {
+		if (tree_empty(&wl->used) || tree_empty(&wl->free))
+			/* No physical eraseblocks - no deal */
+			goto out_unlock;
+
+		/*
+		 * We schedule wear-leveling only if the difference between the
+		 * lowest erase counter of used physical eraseblocks and a high
+		 * erase counter of free physical eraseblocks is greater then
+		 * %UBI_WL_THRESHOLD.
+		 */
+		e1 = rb_entry(rb_first(&wl->used), struct ubi_wl_entry, rb);
+		e2 = find_wl_entry(&wl->free, WL_FREE_MAX_DIFF);
+
+		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
+			goto out_unlock;
+		dbg_wl("schedule wear-leveling");
+	} else
+		dbg_wl("schedule scrubbing");
+
+	wl->wl_scheduled = 1;
+	spin_unlock(&wl->lock);
+
+	wrk = ubi_alloc_bgt_work();
+	if (unlikely(!wrk)) {
+		err = -ENOMEM;
+		goto out_cancel;
+	}
+
+	wrk->func = &wear_leveling_worker;
+	err = ubi_bgt_schedule(ubi, wrk);
+	if (unlikely(err)) {
+		/*
+		 * The background was thread is killed, don't clear the
+		 * @wl->wl_scheduled flag to prevent this error from happening
+		 * again and again. And switch to read-only mode.
+		 */
+		ubi_free_bgt_work(wrk);
+		ubi_eba_ro_mode(ubi);
+	}
+	return err;
+
+out_unlock:
+	spin_unlock(&wl->lock);
+	return err;
+
+out_cancel:
+	spin_lock(&wl->lock);
+	wl->wl_scheduled = 0;
+	spin_unlock(&wl->lock);
+	return err;
+}
+
+/**
+ * schedule_erase - schedule an erase work.
+ *
+ * @ubi: the UBI device description object
+ * @e: the WL entry of the physical eraseblock to erase
+ * @torture: if the physical eraseblock has to be tortured
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ *
+ * Note: @wl->erase_pending must be incremented before this function is called.
+ */
+static int schedule_erase(const struct ubi_info *ubi, struct ubi_wl_entry *e,
+			  int torture)
+{
+	int err;
+	struct ubi_wl_erase_work *wl_wrk;
+
+	dbg_wl("schedule erasure of PEB %d, EC %d, torture %d",
+	       e->pnum, e->ec, torture);
+
+	wl_wrk = ubi_alloc_wl_erase_work();
+	if (unlikely(!wl_wrk))
+		return -ENOMEM;
+
+	wl_wrk->wrk.func = &erase_worker;
+	wl_wrk->wrk.priv = wl_wrk;
+	wl_wrk->e = e;
+	wl_wrk->torture = torture;
+
+	err = ubi_bgt_schedule(ubi, &wl_wrk->wrk);
+	if (unlikely(err)) {
+		/*
+		 * The background thread was killed, but we really need it. We
+		 * can only work in read-only mode without it.
+		 */
+		ubi_free_wl_erase_work(wl_wrk);
+		ubi_eba_ro_mode(ubi);
+	}
+	return err;
+}
+
+static int sync_erase(const struct ubi_info *ubi, struct ubi_wl_entry *e,
+		      int torture);
+
+/**
+ * erase_worker - physical eraseblock erase worker function.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work object
+ * @cancel: non-zero if the worker has to free memory and exit
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. This function also takes care about marking the physical
+ * eraseblock bad if it cannot be erased.
+ */
+static int erase_worker(const struct ubi_info *ubi, struct ubi_bgt_work *wrk,
+			int cancel)
+{
+	int err;
+	struct ubi_wl_info *wl = ubi->wl;
+	struct ubi_wl_erase_work *wl_wrk = wrk->priv;
+	struct ubi_wl_entry *e = wl_wrk->e;
+	int pnum = e->pnum;
+
+	if (unlikely(cancel)) {
+		dbg_wl("cancel erasure of PEB %d EC %d", pnum, e->ec);
+		ubi_free_wl_erase_work(wl_wrk);
+		ubi_free_wl_entry(e);
+		return 0;
+	}
+
+	dbg_wl("erase PEB %d EC %d", pnum, e->ec);
+
+	err = sync_erase(ubi, e, wl_wrk->torture);
+	if (likely(!err)) {
+		/* Fine, we've erased it successfully */
+		ubi_free_wl_erase_work(wl_wrk);
+
+		spin_lock(&wl->lock);
+		wl->erase_pending -= 1;
+		ubi_assert(wl->erase_pending >= 0);
+		wl->abs_ec += 1;
+		free_tree_add(wl, e);
+		spin_unlock(&wl->lock);
+
+		/*
+		 * One more erase operation has happened, take care about protected
+		 * physical eraseblocks.
+		 */
+		check_protection_over(wl);
+
+		/* And take care about wear-leveling */
+		err = ensure_wear_leveling(ubi);
+		return err;
+	}
+
+	/*
+	 * Some error occurred during erasure. If this is something like
+	 * %-EINTR, we just re-schedule this physical eraseblock for
+	 * erasure.
+	 */
+
+	if (err == -EINTR || err == -EAGAIN || err == -ENOMEM ||
+	    err == -EBUSY) {
+		ubi_bgt_reschedule(ubi, wrk); /* Must not return error */
+		return err;
+	}
+
+	ubi_free_wl_erase_work(wl_wrk);
+	ubi_free_wl_entry(e);
+
+	spin_lock(&wl->lock);
+	wl->erase_pending -= 1;
+	spin_unlock(&wl->lock);
+
+	/*
+	 * If this is not %-EIO, we have no idea what to do. Scheduling
+	 * this physical eraseblock for erasure again will cause repeated
+	 * errors.
+	 */
+	if (err != -EIO) {
+		ubi_eba_ro_mode(ubi);
+		return err;
+	}
+
+	/* It is %-EIO, the PEB went bad */
+
+	if (!ubi->io->bad_allowed) {
+		ubi_err("flash device is decaying");
+		ubi_eba_ro_mode(ubi);
+		err = -EIO;
+	} else {
+		err = ubi_beb_mark_bad(ubi, pnum);
+		if (err)
+			ubi_eba_ro_mode(ubi);
+	}
+	return err;
+}
+
+static int calc_data_len(const struct ubi_info *ubi, const unsigned char *buf,
+			 int length);
+
+/**
+ * wear_leveling_worker - wear-leveling worker function.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work object
+ * @cancel: non-zero if the worker has to free memory and exit
+ *
+ * This function copies a less worn out physical eraseblock to a more worn out
+ * one. Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+static int wear_leveling_worker(const struct ubi_info *ubi,
+				struct ubi_bgt_work *wrk, int cancel)
+{
+	int err, tmp, data_size, aldata_size, vol_id, lnum, scrub = 0;
+	struct ubi_wl_entry *e1, *e2;
+	struct ubi_vid_hdr *vid_hdr;
+	void *buf;
+	uint32_t crc;
+	struct ubi_wl_info *wl = ubi->wl;
+	struct ubi_wl_prot_entry *pe;
+	const struct ubi_io_info *io = ubi->io;
+
+	ubi_free_bgt_work(wrk);
+
+	if (unlikely(cancel))
+		return 0;
+
+	spin_lock(&wl->lock);
+	if (tree_empty(&wl->free) ||
+	    (tree_empty(&wl->used) && tree_empty(&wl->scrub))) {
+		/*
+		 * No free physical eraseblocks? Well, we cancel wear-leveling
+		 * then. It will be triggered again when a free physical
+		 * eraseblock appears.
+		 *
+		 * No used physical eraseblocks? They must be temporarily
+		 * protected from being moved. They will be moved to the
+		 * @wl->used tree later and the wear-leveling will be
+		 * triggered again.
+		 */
+		dbg_wl("cancel WL, a list is empty: free %d, used %d",
+		       tree_empty(&wl->free), tree_empty(&wl->used));
+		goto out;
+	}
+
+	if (tree_empty(&wl->scrub)) {
+		/*
+		 * Now pick the least worn-out used physical eraseblock and a
+		 * highly worn-out free physical eraseblock. If the erase
+		 * counters differ much enough, start wear-leveling.
+		 */
+		e1 = rb_entry(rb_first(&wl->used), struct ubi_wl_entry, rb);
+		e2 = find_wl_entry(&wl->free, WL_FREE_MAX_DIFF);
+
+		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
+			dbg_wl("no WL needed: min used EC %d, max free EC %d",
+			       e1->ec, e2->ec);
+			goto out;
+		}
+		used_tree_del(wl, e1);
+		dbg_wl("move PEB %d EC %d to PEB %d EC %d",
+		       e1->pnum, e1->ec, e2->pnum, e2->ec);
+	} else {
+		scrub = 1;
+		e1 = rb_entry(rb_first(&wl->scrub), struct ubi_wl_entry, rb);
+		e2 = find_wl_entry(&wl->free, WL_FREE_MAX_DIFF);
+		scrub_tree_del(wl, e1);
+		dbg_wl("scrub PEB %d to PEB %d", e1->pnum, e2->pnum);
+	}
+
+	free_tree_del(wl, e2);
+	wl->move = e1;
+	spin_unlock(&wl->lock);
+
+	vid_hdr = ubi_alloc_vid_hdr(ubi);
+	if (unlikely(!vid_hdr)) {
+		err = -ENOMEM;
+		goto out_err_cancel;
+	}
+
+	/*
+	 * Now we are going to copy physical eraseblock @e1->pnum to @e2->pnum.
+	 * We've selected a victim (@e1) and @wl->move refers it. But, user may
+	 * call 'ubi_wl_put_peb()' for @e1, and the movement has to be
+	 * canceled.
+	 *
+	 * We so far do not know which logical eraseblock our physical
+	 * eraseblock (@e1) belongs to. This means we cannot lock it. We have
+	 * to read the volume identifier header first. But if @e1 is put, it is
+	 * scheduled for erasure, and we may have a race with the erasure.
+	 * So, we may easily get an I/O error when we read the VID header.
+	 * This does not necessarily mean something nasty.
+	 */
+
+	err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS) {
+		/* OK, error. If the movement was canceled, don't panic */
+		spin_lock(&wl->lock);
+		if (!wl->move) {
+			spin_unlock(&wl->lock);
+			/* This physical eraseblock was put meanwhile */
+			goto out_cancel_wl;
+		}
+		spin_unlock(&wl->lock);
+		/* Well, this means there is a problem */
+		dbg_wl("VID hdr read error (%d)", err);
+		goto vid_hdr_read_error;
+	}
+
+	if (vid_hdr->vol_type == UBI_VID_STATIC) {
+		int rem;
+
+		aldata_size = data_size = ubi32_to_cpu(vid_hdr->data_size);
+		rem = aldata_size % io->min_io_size;
+		if (rem)
+			aldata_size += io->min_io_size - rem;
+	} else
+		data_size = aldata_size =
+			    io->leb_size - ubi32_to_cpu(vid_hdr->data_pad);
+
+	ubi_assert(aldata_size % io->min_io_size == 0);
+
+	buf = ubi_kmalloc(aldata_size, GFP_KERNEL);
+	if (unlikely(!buf)) {
+		err = -ENOMEM;
+		goto out_err_cancel_vid_hdr;
+	}
+
+	vol_id = ubi32_to_cpu(vid_hdr->vol_id);
+	lnum = ubi32_to_cpu(vid_hdr->lnum);
+
+	/*
+	 * We do not want anybody to write to this physical eraseblock while
+	 * we are copying it, so we lock it.
+	 */
+	err = ubi_eba_leb_write_lock(ubi, vol_id, lnum);
+	if (unlikely(err))
+		goto out_err_cancel_buf;
+
+	spin_lock(&wl->lock);
+	if (!wl->move)
+		/* This physical eraseblock was put meanwhile, cancel */
+		goto out_cancel_wl_unlock;
+	spin_unlock(&wl->lock);
+
+	/*
+	 * From now on nobody can access this physical eraseblock as we locked
+	 * the corresponding logical eraseblock.
+	 */
+	dbg_wl("read %d bytes of data", aldata_size);
+	err = ubi_io_read_data(ubi, buf, e1->pnum, 0, aldata_size, &tmp);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS) {
+		ubi_warn("error %d while reading data from PEB %d",
+			 err, e1->pnum);
+		goto data_read_error;
+	}
+
+	/*
+	 * Now we have got to calculate how much data we have to to copy. In
+	 * case of a static volume it is fairly easy - the VID header contains
+	 * the data size. In case of a dynamic volume it is more difficult - we
+	 * have to read the contents, cut 0xFF bytes from the end and copy only
+	 * the first part. We must do this to avoid writing 0xFF bytes as it
+	 * may have some side-effects.
+	 */
+	if (vid_hdr->vol_type == UBI_VID_DYNAMIC)
+		aldata_size = data_size = calc_data_len(ubi, buf, data_size);
+
+	cond_resched();
+	crc = crc32(UBI_CRC32_INIT, buf, data_size);
+
+	/*
+	 * It may turn out that the whole @e1->pnum physical eraseblock
+	 * contains only 0xFF bytes. Then we have to only write the VID header
+	 * and do not write any data. This also means we should not set
+	 * @vid_hdr->copy_flag, @vid_hdr->data_size, and @vid_hdr->data_crc.
+	 */
+	if (likely(data_size > 0)) {
+		vid_hdr->copy_flag = 1;
+		vid_hdr->data_size = cpu_to_ubi32(data_size);
+		vid_hdr->data_crc = cpu_to_ubi32(crc);
+	}
+	vid_hdr->leb_ver = cpu_to_ubi32(ubi32_to_cpu(vid_hdr->leb_ver) + 1);
+
+	cond_resched();
+	err = ubi_io_write_vid_hdr(ubi, e2->pnum, vid_hdr);
+	if (unlikely(err))
+		goto write_error;
+
+	/* Read the VID header back and check if it was written correctly */
+	cond_resched();
+	err = ubi_io_read_vid_hdr(ubi, e2->pnum, vid_hdr, 1);
+	if (unlikely(err)) {
+		if (err != UBI_IO_BITFLIPS) {
+			ubi_warn("cannot read VID header back from PEB %d", e2->pnum);
+			goto write_error;
+		}
+		goto bitflip;
+	}
+
+	if (likely(data_size > 0)) {
+		void *buf1;
+
+		err = ubi_io_write_data(ubi, buf, e2->pnum, 0, aldata_size,
+					&tmp);
+		if (unlikely(err))
+			goto write_error;
+
+		/*
+		 * We've written the data and are going to read it back to make
+		 * sure it was written correctly.
+		 */
+		buf1 = ubi_kmalloc(aldata_size, GFP_KERNEL);
+		if (unlikely(!buf1)) {
+			err = -ENOMEM;
+			goto write_error;
+		}
+
+		cond_resched();
+		err = ubi_io_read_data(ubi, buf1, e2->pnum, 0, aldata_size,
+				       &tmp);
+		if (unlikely(err)) {
+			ubi_kfree(buf1);
+			if (err != UBI_IO_BITFLIPS) {
+				ubi_warn("cannot read data back from PEB %d",
+					 e2->pnum);
+				goto write_error;
+			}
+			goto bitflip;
+		}
+
+		cond_resched();
+		if (unlikely(memcmp(buf, buf1, aldata_size))) {
+			ubi_warn("read data back from PEB %d - it is different",
+				 e2->pnum);
+			err = -EINVAL;
+			ubi_kfree(buf1);
+			goto write_error;
+		}
+		ubi_kfree(buf1);
+	}
+
+	/*
+	 * Re-map the logical eraseblock to the new physical eraseblock
+	 * (@e2->pnum).
+	 */
+	ubi_eba_leb_remap(ubi, vol_id, lnum, e2->pnum);
+
+	/*
+	 * The physical eraseblock was successfully copied and re-mapped. Add
+	 * the new copy to the @wl->used tree and schedule the old one for
+	 * erasure.
+	 */
+	spin_lock(&wl->lock);
+	wl->erase_pending += 1;
+	used_tree_add(wl, e2);
+	wl->wl_scheduled = 0;
+	ubi_assert(wl->move);
+	wl->move = NULL;
+	spin_unlock(&wl->lock);
+
+	/* Unlock the logical eraseblock */
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+
+	ubi_kfree(buf);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+
+	/*
+	 * Note, we do not check if more wear-leveling is needed here. We
+	 * schedule the physical eraseblock for erasure so we know that the
+	 * erase worker will take care about that.
+	 */
+	err = schedule_erase(ubi, e1, 0);
+	if (unlikely(err)) {
+		/* This may only happen if there is no memory */
+		ubi_free_wl_entry(e1);
+		ubi_eba_ro_mode(ubi);
+	}
+	dbg_wl("done");
+	return err;
+
+out:
+	wl->wl_scheduled = 0;
+	spin_unlock(&wl->lock);
+	return 0;
+
+	/*
+	 * The physical eraseblock we have selected was put. It was scheduled
+	 * for erasure and removed from the @wl->used tree, so we only need to
+	 * return @e2 back to the @wl->free tree.
+	 */
+out_cancel_wl_unlock:
+	spin_unlock(&wl->lock);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	ubi_kfree(buf);
+out_cancel_wl:
+	dbg_wl("PEB %d was put, don't move it, cancel", e1->pnum);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	spin_lock(&wl->lock);
+	ubi_assert(wl->move == NULL);
+	free_tree_add(wl, e2);
+	wl->wl_scheduled = 0;
+	spin_unlock(&wl->lock);
+	return 0;
+
+	/*
+	 * Some non-I/O error occurred. Neither @e1 nor @e2 were changed, just
+	 * get them back to the lists they were taken from.
+	 */
+out_err_cancel_buf:
+	ubi_kfree(buf);
+out_err_cancel_vid_hdr:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+out_err_cancel:
+	spin_lock(&wl->lock);
+	wl->wl_scheduled = 0;
+	if (wl->move) {
+		if (scrub)
+			scrub_tree_add(wl, e1);
+		else
+			used_tree_add(wl, e1);
+		wl->move = NULL;
+	}
+	free_tree_add(wl, e2);
+	spin_unlock(&wl->lock);
+	return err;
+
+	/*
+	 * Failed to read from the @e1->pnum physical eraseblock. Something
+	 * nasty happened. We don't want to move this physical eraseblock.
+	 * We also don't want this physical eraseblock to be repeatedly
+	 * selected for wear-leveling, so protect it.
+	 *
+	 * FIXME: It would be better to notify upper layers about this and let
+	 * them handle this. But this is not implemented.
+	 */
+data_read_error:
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	ubi_kfree(buf);
+vid_hdr_read_error:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	spin_lock(&wl->lock);
+	free_tree_add(wl, e2);
+	spin_unlock(&wl->lock);
+
+	pe = ubi_alloc_wl_prot_entry();
+	if (!pe) {
+		spin_lock(&wl->lock);
+		wl->wl_scheduled = 0;
+		if (wl->move)
+			used_tree_add(wl, e1);
+		wl->move = NULL;
+		spin_unlock(&wl->lock);
+		return -ENOMEM;
+	}
+	spin_lock(&wl->lock);
+	wl->wl_scheduled = 0;
+	if (wl->move) {
+		prot_tree_add(wl, e1, pe, ST_PROTECTION);
+		wl->move = NULL;
+		spin_unlock(&wl->lock);
+	} else {
+		spin_unlock(&wl->lock);
+		ubi_free_wl_prot_entry(pe);
+	}
+	return 0;
+
+	/*
+	 * An error occurred during writing. Something was written to @e2-pnum,
+	 * so we cannot treat it as free any longer. Put @e1 back to the
+	 * @wl->used tree and schedule @e2->pnum for erasure.
+	 *
+	 * Normally, this happens if @e2->pnum went bad - then it will be
+	 * handled in the erase function. But if the flash does not admit of
+	 * bad physical eraseblock, we switch to read-only mode.
+	 */
+write_error:
+	ubi_kfree(buf);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+
+	spin_lock(&wl->lock);
+	wl->wl_scheduled = 0;
+	ubi_assert(wl->move);
+	used_tree_add(wl, e1);
+	wl->move = NULL;
+	spin_unlock(&wl->lock);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+
+	if (ubi->io->bad_allowed) {
+		spin_lock(&wl->lock);
+		wl->erase_pending += 1;
+		spin_unlock(&wl->lock);
+		tmp = schedule_erase(ubi, e2, 1);
+		if (tmp) {
+			/* No memory - bad, switch to read-only mode */
+			ubi_free_wl_entry(e2);
+			spin_lock(&wl->lock);
+			wl->erase_pending -= 1;
+			spin_unlock(&wl->lock);
+			ubi_eba_ro_mode(ubi);
+			err = tmp;
+		}
+	} else {
+		ubi_err("flash device is decaying");
+		ubi_free_wl_entry(e2);
+		ubi_eba_ro_mode(ubi);
+	}
+	return err;
+
+	/*
+	 * We successfully wrote the data to @e2->pnum, but when we red it back
+	 * we detected a bit-flip. So we cancel the operation.
+	 */
+bitflip:
+	dbg_wl("bit-flip at the copied data, cancel");
+	ubi_kfree(buf);
+	ubi_free_vid_hdr(ubi, vid_hdr);
+
+	spin_lock(&wl->lock);
+	wl->wl_scheduled = 0;
+	ubi_assert(wl->move);
+	if (scrub)
+		scrub_tree_add(wl, e1);
+	else
+		used_tree_add(wl, e1);
+	wl->move = NULL;
+	spin_unlock(&wl->lock);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+
+	spin_lock(&wl->lock);
+	wl->erase_pending += 1;
+	spin_unlock(&wl->lock);
+	err = schedule_erase(ubi, e2, 0);
+	if (err) {
+		/* No memory - bad, switch to read-only mode */
+		ubi_free_wl_entry(e2);
+		spin_lock(&wl->lock);
+		wl->erase_pending -= 1;
+		spin_unlock(&wl->lock);
+		ubi_eba_ro_mode(ubi);
+	}
+
+	return err;
+
+}
+
+/**
+ * sync_erase - synchronously erase a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @e: the the physical eraseblock to erase
+ * @torture: if the physical eraseblock has to be tortured
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int sync_erase(const struct ubi_info *ubi, struct ubi_wl_entry *e,
+		      int torture)
+{
+	int err;
+	struct ubi_ec_hdr *ec_hdr;
+	struct ubi_wl_info *wl = ubi->wl;
+	uint64_t ec = e->ec + 1;
+
+	dbg_wl("erase PEB %d, new EC %lld", e->pnum, ec);
+
+	err = paranoid_check_ec(ubi, e->pnum, e->ec);
+	if (unlikely(err > 0))
+		return -EINVAL;
+
+	if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
+		/*
+		 * Erase counter overflow. Upgrade UBI and use 64-bit
+		 * erase counters internally.
+		 */
+		ubi_err("erase counter overflow at PEB %d, EC %d",
+			e->pnum, e->ec);
+		return -EINVAL;
+	}
+
+	ec_hdr = ubi_alloc_ec_hdr(ubi);
+	if (unlikely(!ec_hdr))
+		return -ENOMEM;
+
+	err = ubi_io_sync_erase(ubi, e->pnum, torture);
+	if (unlikely(err < 0))
+		goto out_free;
+
+	ec_hdr->ec = cpu_to_ubi64(ec);
+
+	err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
+	if (unlikely(err))
+		goto out_free;
+
+	e->ec += 1;
+	if (e->ec > wl->max_ec)
+		wl->max_ec = e->ec;
+
+out_free:
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	return err;
+}
+
+/**
+ * erase_one_pending - erase one pending physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns %1 if a physical eraseblock was successfully erased,
+ * %0 if no physical eraseblocks were erased and a negative error code in case
+ * of error.
+ */
+static int erase_one_pending(const struct ubi_info *ubi)
+{
+	int err, pending_count;
+	struct ubi_bgt_work *wrk;
+	const struct ubi_bgt_info *bgt = ubi->bgt;
+
+	pending_count = bgt->pending_works_count;
+	while (pending_count != 0 && (wrk = ubi_bgt_next_work(ubi))) {
+		pending_count -= 1;
+
+		if (wrk->func != &erase_worker) {
+			/* We are only interested in "erase" works" */
+			err = ubi_bgt_reschedule(ubi, wrk);
+			if (unlikely(err)) {
+				/*
+				 * The background thread was killed. Cancel
+				 * this work. We cannot normally operate
+				 * without the background thread, so switch to
+				 * read-only mode.
+				 */
+				wrk->func(ubi, wrk, 1);
+				ubi_eba_ro_mode(ubi);
+				return err;
+			}
+		} else {
+			dbg_wl("erase");
+			err = wrk->func(ubi, wrk, 0);
+			if (unlikely(err)) {
+				return err;
+			}
+			return 1;
+		}
+	}
+
+	dbg_wl("no PEB was erased");
+	return 0;
+}
+
+/**
+ * calc_data_len - calculate how much data is stored in a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @buf: a buffer with the contents of the physical eraseblock
+ * @length: the buffer length
+ *
+ * This function calculates how much data is stored in @buf. Continuous 0xFF
+ * bytes at the end of the buffer are not considered as data.
+ */
+static int calc_data_len(const struct ubi_info *ubi, const unsigned char *buf,
+			 int length)
+{
+	int res = length, i, rem;
+
+	ubi_assert(length % ubi->io->min_io_size == 0);
+
+	for (i = length - 1; i <= 0; i--)
+		if (buf[i] != 0xFF) {
+			res = i + 1;
+			break;
+		}
+
+	/* The resulting length must be aligned to the minimum flash I/O size */
+	rem = res % ubi->io->min_io_size;
+	if (rem != 0)
+		res += ubi->io->min_io_size - rem;
+
+	return res;
+}
+
+
+/**
+ * wl_tree_add - add a wear-leveling entry to a WL RB-tree.
+ *
+ * @e: the wear-leveling entry to add
+ * @root: the root of the tree
+ *
+ * Note, we use (erase counter, physical eraseblock number) pairs as keys in
+ * the @wl->used and @wl->free RB-trees.
+ */
+static void wl_tree_add(struct ubi_wl_entry *e, struct rb_root *root)
+{
+	struct rb_node **p, *parent = NULL;
+
+	p = &root->rb_node;
+	while (*p) {
+		struct ubi_wl_entry *e1;
+
+		parent = *p;
+		e1 = rb_entry(parent, struct ubi_wl_entry, rb);
+
+		if (e->ec < e1->ec)
+			p = &(*p)->rb_left;
+		else if (e->ec > e1->ec)
+			p = &(*p)->rb_right;
+		else {
+			ubi_assert(e->pnum != e1->pnum);
+			if (e->pnum < e1->pnum)
+				p = &(*p)->rb_left;
+			else
+				p = &(*p)->rb_right;
+		}
+	}
+
+	rb_link_node(&e->rb, parent, p);
+	rb_insert_color(&e->rb, root);
+}
+
+/**
+ * in_wl_tree - check if a wear-leveling entry is present in a WL RB-tree.
+ *
+ * @e: the wear-leveling entry to check
+ * @root: the root of the tree
+ *
+ * This function returns non-zero if @e is in the @root RB-tree and zero if it
+ * is not.
+ */
+static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
+{
+	struct rb_node *p;
+
+	p = root->rb_node;
+	while (p) {
+		struct ubi_wl_entry *e1;
+
+		e1 = rb_entry(p, struct ubi_wl_entry, rb);
+
+		if (e->pnum == e1->pnum) {
+			ubi_assert(e == e1);
+			return 1;
+		}
+
+		if (e->ec < e1->ec)
+			p = p->rb_left;
+		else if (e->ec > e1->ec)
+			p = p->rb_right;
+		else {
+			ubi_assert(e->pnum != e1->pnum);
+			if (e->pnum < e1->pnum)
+				p = p->rb_left;
+			else
+				p = p->rb_right;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * tree_destroy - destroy an RB-tree.
+ *
+ * @root: the root of the tree to destroy
+ */
+static void tree_destroy(struct rb_root *root)
+{
+	struct rb_node *rb;
+	struct ubi_wl_entry *e;
+
+	rb = root->rb_node;
+	while (rb) {
+		if (rb->rb_left)
+			rb = rb->rb_left;
+		else if (rb->rb_right)
+			rb = rb->rb_right;
+		else {
+			e = rb_entry(rb, struct ubi_wl_entry, rb);
+
+			rb = rb->rb_parent;
+			if (rb) {
+				if (rb->rb_left == &e->rb)
+					rb->rb_left = NULL;
+				else
+					rb->rb_right = NULL;
+			}
+
+			ubi_free_wl_entry(e);
+		}
+	}
+}
+
+/**
+ * protection_trees_destroy - destroy the protection RB-trees.
+ *
+ * @wl: the wear-leveling unit description data structure
+ */
+static void protection_trees_destroy(struct ubi_wl_info *wl)
+{
+	struct rb_node *rb;
+	struct ubi_wl_prot_entry *pe;
+
+	rb = wl->prot.aec.rb_node;
+	while (rb) {
+		if (rb->rb_left)
+			rb = rb->rb_left;
+		else if (rb->rb_right)
+			rb = rb->rb_right;
+		else {
+			pe = rb_entry(rb, struct ubi_wl_prot_entry, rb_aec);
+
+			rb = rb->rb_parent;
+			if (rb) {
+				if (rb->rb_left == &pe->rb_aec)
+					rb->rb_left = NULL;
+				else
+					rb->rb_right = NULL;
+			}
+
+			ubi_free_wl_entry(pe->e);
+			ubi_free_wl_prot_entry(pe);
+		}
+	}
+}
+
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_WL
+
+/**
+ * paranoid_check_ec - make sure that the erase counter of a physical eraseblock
+ * is correct.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock number to check
+ * @ec: the erase counter to check
+ *
+ * This function returns zero if the erase counter of physical eraseblock @pnum
+ * is equivalent to @ec, %1 if not, and a negative error code if an error
+ * occurred.
+ */
+static int paranoid_check_ec(const struct ubi_info *ubi, int pnum, int ec)
+{
+	int err;
+	int64_t read_ec;
+	struct ubi_ec_hdr *ec_hdr;
+
+	ec_hdr = ubi_alloc_ec_hdr(ubi);
+	if (unlikely(!ec_hdr))
+		return -ENOMEM;
+
+	err = ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 0);
+	if (unlikely(err) && err != UBI_IO_BITFLIPS) {
+		/* The header does not have to exist */
+		err = 0;
+		goto out_free;
+	}
+
+	read_ec = ubi64_to_cpu(ec_hdr->ec);
+	if (unlikely(ec != read_ec)) {
+		ubi_err("paranoid check failed for PEB %d", pnum);
+		ubi_err("read EC is %lld, should be %d", read_ec, ec);
+		dump_stack();
+		err = 1;
+	} else
+		err = 0;
+
+out_free:
+	ubi_free_ec_hdr(ubi, ec_hdr);
+	return err;
+}
+
+/**
+ * paranoid_check_in_wl_tree - make sure that a wear-leveling entry is present
+ * in a WL RB-tree.
+ *
+ * @e: the wear-leveling entry to check
+ * @root: the root of the tree
+ *
+ * This function returns zero if @e is in the @root RB-tree and %1 if it
+ * is not.
+ */
+static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
+{
+	if (likely(in_wl_tree(e, root)))
+		return 0;
+
+	ubi_err("paranoid check failed for PEB %d, EC %d, RB-tree %p ",
+		e->pnum, e->ec, root);
+	dump_stack();
+	return 1;
+}
+
+#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID_WL */
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
new file mode 100644
index 0000000..eedaba6
--- /dev/null
+++ b/drivers/mtd/ubi/wl.h
@@ -0,0 +1,282 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Authors: Artem B. Bityutskiy, Thomas Gleixner
+ */
+
+/*
+ * UBI wear-leveling unit.
+ *
+ * This unit is responsible for wear-leveling. This unit works in terms of
+ * physical eraseblocks and erase counters and knows nothing about logical
+ * eraseblocks, volumes, etc (with one exception). From this unit's perspective
+ * all physical eraseblocks are of two types - used and free. Used physical
+ * eraseblocks are those that were "get" by the 'ubi_wl_get_peb()' function,
+ * and free physical eraseblocks are those that were put by the
+ * 'ubi_wl_put_peb()' function. Actually, the above two functions are the main
+ * in this unit.
+ *
+ * Physical eraseblocks returned by 'ubi_wl_get_peb()' have only the erase
+ * counter header. The rest of the physical eraseblock contains only 0xFF bytes.
+ *
+ * When physical eraseblocks are returned to the WL unit by means of the
+ * 'ubi_wl_put_peb()' function, they are scheduled for erasure. The erasure is
+ * not done synchronously. Instead, it is done in background in context of the
+ * per-UBI device background thread (see the background thread unit). Actually,
+ * the WL unit strongly depends on the background thread and cannot operate
+ * without it.
+ *
+ * The wear-leveling is ensured by means of moving the contents of used
+ * physical eraseblocks with low erase counter to free physical eraseblocks
+ * with high erase counter. The movement is also done in background.
+ *
+ * When eraseblocks are moved, the WL unit cooperates with the EBA unit to
+ * provide proper eraseblock locking. This means, the WL unit uses the EBA unit
+ * to lock the logical eraseblock corresponding to the physical eraseblock
+ * which is being moved. This is the only place where the WL unit "knows" about
+ * logical eraseblocks and volume identifier headers.
+ *
+ * The 'ubi_wl_get_peb()' function accepts data type hints which help to pick
+ * an "optimal" physical eraseblock. Indeed, for example, when it knows that
+ * the physical eraseblock will be "put" soon, it may pick a free physical
+ * eraseblock with low erase counter, and so forth.
+ *
+ * If the WL unit fails to erase a physical eraseblock, it marks the physical
+ * eraseblock as bad (using the bad eraseblock handling unit).
+ *
+ * This unit is also responsible for scrubbing. If a bit-flip is detected in a
+ * physical eraseblock, it has to be moved. Technically this is the same as
+ * moving it for wear-leveling reasons.
+ *
+ * As it was said, for the UBI unit all physical eraseblocks are either "free"
+ * or "used". Free eraseblock are kept in the @wl->free RB-tree, while used
+ * eraseblocks are kept in a set of different RB-trees: @wl->used,
+ * @wl->prot.pnum, @wl->prot.aec, and @wl->scrub.
+ *
+ * Note, in this implementation, we keep a small in-RAM object for each physical
+ * eraseblock. This is surely not a scalable solution. But it appears to be good
+ * enough for moderately large flashes and it is simple. In future, one may
+ * re-work this unit and make it more scalable.
+ */
+
+#ifndef __UBI_WL_H__
+#define __UBI_WL_H__
+
+#include <linux/rbtree.h>
+#include <linux/wait.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/mtd/ubi.h>
+#include "background.h"
+
+struct ubi_info;
+struct ubi_scan_info;
+
+/**
+ * ubi_wl_get_peb - get a physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @dtype: type of data which will be stored in this physical eraseblock
+ *
+ * This function returns a physical eraseblock in case of success and a
+ * negative error code in case of failure. Might sleep.
+ */
+int ubi_wl_get_peb(const struct ubi_info *ubi, enum ubi_data_type dtype);
+
+/**
+ * ubi_wl_put_peb - return a physical eraseblock to the wear-leveling
+ * unit.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: physical eraseblock to return
+ * @torture: if this physical eraseblock has to be tortured
+ *
+ * If an error occurred during I/O to @pnum, and the caller suspects @pnum to be
+ * bad, it will be tested for badness if @torture flag is not zero. This function
+ * returns zero in case of success and a negative error code in case of
+ * failure. Might sleep.
+ */
+int ubi_wl_put_peb(const struct ubi_info *ubi, int pnum, int torture);
+
+/**
+ * ubi_wl_erase_flush - erase all pending physical eraseblocks.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_wl_erase_flush(const struct ubi_info *ubi);
+
+/**
+ * ubi_wl_scrub_peb - schedule a physical eraseblock for scrubbing.
+ *
+ * @ubi: the UBI device description object
+ * @pnum: the physical eraseblock to schedule
+ *
+ * If a bit-flip in a physical eraseblock is detected, this physical eraseblock
+ * needs scrubbing. This function schedules a physical eraseblock for
+ * scrubbing which is done in background. This function returns zero in case of
+ * success and a negative error code in case of failure.
+ */
+int ubi_wl_scrub_peb(const struct ubi_info *ubi, int pnum);
+
+/**
+ * ubi_wl_init_scan - initialize the wear-leveling unit using scanning
+ * information.
+ *
+ * @ubi: the UBI device description object
+ * @si: a pointer to the scanning information
+ *
+ * This function returns zero in case of success, and a negative error code in
+ * case of failure.
+ */
+int ubi_wl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
+
+/**
+ * ubi_wl_close - close the wear-leveling unit.
+ *
+ * @ubi: the UBI device description object
+ */
+void ubi_wl_close(struct ubi_info *ubi);
+
+/**
+ * struct ubi_wl_entry - a wear-leveling entry.
+ *
+ * @rb: link in the corresponding RB-tree
+ * @ec: erase counter
+ * @pnum: physical eraseblock number
+ *
+ * Each physical eraseblock has a corresponding &struct wl_entry object which
+ * may be kept in different RB-trees.
+ */
+struct ubi_wl_entry {
+	struct rb_node rb;
+	int ec;
+	int pnum;
+};
+
+/**
+ * struct ubi_wl_prot_entry - a protection entry.
+ *
+ * @rb_pnum: link in the @wl->prot.pnum RB-tree
+ * @rb_aec: link in the @wl->prot.aec RB-tree
+ * @abs_ec: the absolute erase counter value when the protection ends
+ * @e: the wear-levelling entry of the physical eraseblock under protection
+ *
+ * When the WL unit returns a physical eraseblock, the physical eraseblock is
+ * protected from being moved for some "time". For this reason, the physical
+ * eraseblock is not directly moved from the @wl->free tree to the @wl->used
+ * tree. There is one more tree in between where this physical eraseblock is
+ * temporarily stored (@wl->prot).
+ *
+ * All this protection stuff is needed because:
+ *  o we don't want to move physical eraseblocks just after we have given them
+ *    to the user; instead, we first want to let users fill them up with data;
+ *
+ *  o there is a chance that the user will put the physical eraseblock very
+ *    soon, so it makes sense not to move it for some time, but wait; this is
+ *    especially important in case of "short term" physical eraseblocks.
+ *
+ * Physical eraseblocks stay protected only for limited time. But the "time" is
+ * measured in erase cycles in this case. This is implemented with help of the
+ * absolute erase counter (@wl->abs_ec). When it reaches certain value, the
+ * physical eraseblocks are moved from the protection trees (@wl->prot.*) to
+ * the @wl->used tree.
+ *
+ * Protected physical eraseblocks are searched by physical eraseblock number
+ * (when they are put) and by the absolute erase counter (to check if it is
+ * time to move them to the @wl->used tree). So there are actually 2 RB-trees
+ * storing the protected physical eraseblocks: @wl->prot.pnum and
+ * @wl->prot.aec. They are referred to as the "protection" trees. The
+ * first one is indexed by the physical eraseblock number. The second one is
+ * indexed by the absolute erase counter. Both trees store
+ * &struct ubi_wl_prot_entry objects.
+ */
+struct ubi_wl_prot_entry {
+	struct rb_node rb_pnum;
+	struct rb_node rb_aec;
+	unsigned long long abs_ec;
+	struct ubi_wl_entry *e;
+};
+
+/**
+ * struct ubi_wl_erase_work - physical eraseblock erasure work description data
+ * structure.
+ *
+ * @wrk: the background thread work descriptor
+ * @e: the physical eraseblock to erase
+ * @torture: if the physical eraseblock has to be tortured
+ *
+ * This data structure is used for erasure background works. The @torture flag
+ * indicates whether the physical eraseblock should be tested. Testing physical
+ * eraseblocks may be needed if an error occurred and they are likely to become
+ * bad.
+ */
+struct ubi_wl_erase_work {
+	struct ubi_bgt_work wrk;
+	struct ubi_wl_entry *e;
+	int torture;
+};
+
+/**
+ * struct ubi_wl_info - the UBI WL unit description data structure.
+ *
+ * @used: RB-tree of used physical eraseblocks
+ * @free: RB-tree of free physical eraseblocks
+ * @scrub: RB-tree of physical eraseblocks which need scrubbing
+ * @prot.pnum: the protection tree indexed by physical eraseblock numbers
+ * @prot.aec: the protection tree indexed the absolute erase counter
+ * @lock: protects the @used, @free, @prot, @lookuptbl, @abs_ec, @move,
+ * @wl_scheduled, and @erase_pending fields
+ * @wl_scheduled: non-zero if the wear leveling was scheduled
+ * @lookuptbl: a table to quickly find a &struct ubi_wl_entry object for any
+ * physical eraseblock
+ * @abs_ec: the absolute erase counter
+ * @move: if a physical eraseblock is being moved, it is referred to here
+ * @max_ec: current highest erase counter value
+ *
+ * Each physical eraseblock has 2 main states: free and used. The former state
+ * corresponds to the @free RB-tree. The latter state is split up on several
+ * sub-states:
+ * o the WL movement is allowed (@used RB-tree);
+ * o the WL movement is temporarily prohibited (@prot.pnum and @prot.aec
+ * RB-trees);
+ * o scrubbing is needed (@scrub RB-tree),
+ *
+ * Depending on the sub-state, wear-levelling entries of the used physical
+ * eraseblocks may be kept in one of those trees.
+ */
+struct ubi_wl_info {
+	struct rb_root used;             /* private */
+	struct rb_root free;             /* private */
+	struct rb_root scrub;            /* private */
+	struct {
+		struct rb_root pnum;     /* private */
+		struct rb_root aec;      /* private */
+	} prot;
+	spinlock_t lock;                 /* private */
+	int wl_scheduled;                /* private */
+	struct ubi_wl_entry **lookuptbl; /* private */
+	int erase_pending;               /* private */
+	unsigned long long abs_ec;       /* public  */
+	struct ubi_wl_entry *move;       /* private */
+	int max_ec;                      /* public  */
+};
+
+#endif /* __UBI_WL_H__ */
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
new file mode 100644
index 0000000..e8cb9cf
--- /dev/null
+++ b/include/linux/mtd/ubi.h
@@ -0,0 +1,346 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#ifndef __LINUX_UBI_H__
+#define __LINUX_UBI_H__
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+#include <mtd/ubi-user.h>
+
+/**
+ * enum ubi_data_type - UBI data type hint constants.
+ *
+ * @UBI_DATA_LONGTERM: long-term data
+ * @UBI_DATA_SHORTTERM: short-term data
+ * @UBI_DATA_UNKNOWN: data persistency is unknown
+ *
+ * These constants are used when data is written to UBI volumes in order to
+ * help the UBI wear-leveling unit to find more appropriate physical
+ * eraseblocks.
+ */
+enum ubi_data_type {
+	UBI_DATA_LONGTERM = 1,
+	UBI_DATA_SHORTTERM,
+	UBI_DATA_UNKNOWN
+};
+
+/**
+ * enum ubi_open_mode - UBI volume open mode constants.
+ *
+ * @UBI_READONLY: read-only mode
+ * @UBI_READWRITE: read-write mode
+ * @UBI_EXCLUSIVE: exclusive mode
+ */
+enum ubi_open_mode {
+	UBI_READONLY = 1,
+	UBI_READWRITE,
+	UBI_EXCLUSIVE
+};
+
+/**
+ * struct ubi_vol_info - UBI volume description data structure.
+ *
+ * @vol_id: volume ID
+ * @size: how many physical eraseblocks are reserved for this volume
+ * @used_bytes: how many bytes of data this volume contains
+ * @used_ebs: how many physical eraseblocks of this volume actually contain any
+ * data
+ * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
+ * @alignment: volume alignment
+ * @usable_leb_size: how many bytes are available in logical eraseblocks of
+ * this volume
+ * @name_len: volume name length
+ * @name: volume name
+ *
+ * The @used_bytes and @used_ebs fields are only really needed for static volumes
+ * and contain the number of bytes stored in this static volume and how many
+ * eraseblock this data occupies. In case of dynamic volumes, the @used_bytes
+ * field is equivalent to @size*@usable_leb_size, and the @used_ebs field is
+ * equivalent to @size.
+ *
+ * In general, logical eraseblock size is a property of the UBI device, not
+ * of the UBI volume. Indeed, the logical eraseblock size depends on the
+ * physical eraseblock size and on how much bytes UBI headers consume. But
+ * because of the volume alignment (@alignment), the usable size of logical
+ * eraseblocks if a volume may be less. The following equation is true:
+ * 	@usable_leb_size = LEB size - (LEB size mod @alignment),
+ * where LEB size is the logical eraseblock size defined by the UBI device.
+ *
+ * The alignment is multiple to the minimal flash input/output unit size or %1
+ * if all the available space is used.
+ *
+ * To put this differently, alignment may be considered is a way to change
+ * volume logical eraseblock sizes.
+ */
+struct ubi_vol_info {
+	int vol_id;
+	int size;
+	long long used_bytes;
+	int used_ebs;
+	int vol_type;
+	int corrupted;
+	int alignment;
+	int usable_leb_size;
+	int name_len;
+	const char *name;
+};
+
+/**
+ * struct ubi_client_callbacks - UBI device client's callbacks.
+ *
+ * @ubi_mkvol: called every time a volume is created
+ * @ubi_rmvol: called every time a volume is removed
+ * @ubi_rsvol: called every time a volume is re-sized
+ *
+ * 1. The 'ubi_mkvol()' callback is called after a volume is created. When the
+ * client callbacks are being registered, 'ubi_mkvol()' is called for every
+ * already existing volume. The callback has to return zero in case of success
+ * and a negative error code in case of failure. In the latter case, volume
+ * creation is canceled.
+ *
+ * 2. The 'ubi_rmvol()' callback is called before a volume is removed. The
+ * callback has to return zero in case of success and a negative error code in
+ * case of failure. In the latter case the UBI volume removal is canceled.
+ *
+ * 3. The 'ubi_rsvol()' callback is called before a volume is re-sized. The
+ * callback has to return zero in case of success and a negative error code in
+ * case of failure. In the latter case the UBI volume re-sizing is canceled.
+ *
+ * If a callback is not installed, the corresponding function pointer has to be
+ * set to NULL.
+ */
+struct ubi_client_callbacks {
+	int (*ubi_mkvol)(int ubi_num, struct ubi_vol_info *vi);
+	int (*ubi_rmvol)(int ubi_num, int vol_id);
+	int (*ubi_rsvol)(int ubi_num, int vol_id, int new_size);
+};
+
+/**
+ * ubi_attach_mtd_dev - attach an MTD device.
+ *
+ * @mtd_num: the MTD device number to attach
+ * @vid_hdr_offset: volume identifier headers offset in physical eraseblocks
+ * @data_offset: data offset in physical eraseblock
+ *
+ * To use the default settings, zeroes have to be passed in the @vid_hdr_offset
+ * and @data_offset arguments. This function returns a positive number of the
+ * new UBI device in case of success or a negative error code in case of
+ * failure.
+ *
+ * In this implementation UBI devices cannot come and go. So there is no
+ * detach function and this function must only be used during initialization.
+ */
+int ubi_attach_mtd_dev(int mtd_num, int vid_hdr_offset, int data_offset);
+
+/**
+ * ubi_register_callbacks - register client's callbacks for an UBI device.
+ *
+ * @ubi_num: the UBI device number
+ * @cbs: the callbacks to register
+ *
+ * This function registers global UBI client callbacks. Returns zero in case of
+ * success and a negative error code in case of failure.
+ *
+ * This function calls the 'ubi_mkvol()' callback for each already existing
+ * volume on each UBI device before returning. If a 'ubi_mkvol()' returns an
+ * error, this function also returns this error.
+ */
+int ubi_register_callbacks(const struct ubi_client_callbacks *cbs);
+
+/**
+ * ubi_unregister_callbacks - unregister client's callbacks for an UBI device.
+ *
+ * This function unregisters global UBI client callbacks. Returns zero in case
+ * of success and a negative error code in case of failure.
+ */
+int ubi_unregister_callbacks(void);
+
+/**
+ * ubi_desc_t - UBI descriptor given to users when they open UBI volumes.
+ */
+typedef struct ubi_vol_desc *ubi_desc_t;
+
+/*
+ * ubi_open_volume - open an UBI volume.
+ *
+ * @ubi_num: the UBI device number
+ * @vol_id: ID of the volume to open
+ * @mode: volume open mode
+ *
+ * This function opens a UBI volume. The @mode parameter specifies if the
+ * volume is opened in read-only mode, read-write mode, or exclusive mode. The
+ * exclusive mode means that nobody else will be allowed to open this volume.
+ * Note, UBI allows to have many volume readers and one writer at a time. And
+ * note, static volumes may only be opened in read-only mode.
+ *
+ * In case of success, this function returns an UBI volume descriptor. In case
+ * of failure, the following error codes may be returned:
+ *
+ * o %-EBUSY if the volume is busy (it is being updated, or it is already
+ *   opened in exclusive or read-write mode by somebody else);
+ * o %-EINVAL if the input arguments are invalid;
+ * o %-ENODEV if this volume does not exist or the UBI device does not exist;
+ * o other negative error codes in case of other errors.
+ *
+ * If a volume is corrupted for some other reasons (e.g., because of an
+ * interrupted update), this function returns success so that it is still
+ * possible to read some useful valid data from it. So users have to check
+ * status of volumes after open (with help of the 'ubi_get_volume_info()'
+ * function).
+ *
+ * Additional node: if the volume is being opened for the first time since the
+ * last reboot, it is fully checked by this function.
+ */
+ubi_desc_t ubi_open_volume(int ubi_num, int vol_id, enum ubi_open_mode mode);
+
+/*
+ * ubi_open_volume_nm - open an UBI volume by volume name.
+ *
+ * @ubi_num: the UBI device number
+ * @name: volume name
+ * @mode: volume open mode
+ *
+ * This function is similar to the 'ubi_open_volume()' function, but opens UBI
+ * volumes by name.
+ */
+ubi_desc_t ubi_open_volume_nm(int ubi_num, const char *name,
+			      enum ubi_open_mode mode);
+
+/**
+ * ubi_close_volume - close an UBI volume.
+ *
+ * @udesc: UBI volume descriptor
+ */
+void ubi_close_volume(ubi_desc_t desc);
+
+/**
+ * ubi_eraseblock_read - read data from a logical eraseblock.
+ *
+ * @udesc: volume descriptor
+ * @lnum: the logical eraseblock number to read from
+ * @buf: a buffer where to store the read data
+ * @offset: the offset within the logical eraseblock from where to read
+ * @len: how many bytes to read
+ * @check: whether UBI has to check the read data's CRC or not.
+ * @read: how many bytes were actually read is returned here
+ *
+ * This function reads data from offset @offset of the logical eraseblock @lnum
+ * and stores the read data at @buf. When reading from static volumes, @check
+ * may be used to specify whether the read data has to be checked or not. If
+ * checking is requested, the whole logical eraseblock will be read and its CRC
+ * checksum will be checked, so checking may substantially slow down the read
+ * speed. The @check argument is ignored in case of a dynamic volume.
+ *
+ * In case of success, this function returns zero and the @read argument has
+ * to contain @len. In case of error, this function returns a negative error
+ * code and the @read argument contains the number of read bytes, but they
+ * don't have to be correct.
+ *
+ * %-EBADMSG error code may be returned:
+ * o for both static and dynamic volumes if the MTD driver has detected an ECC
+ *   checksum mismatch;
+ * o for static volumes if the data CRC mismatches
+ *
+ * If a corrupted static volume is read, and the data were read from flash
+ * without errors, this function anyway returns %-EUCLEAN, not zero. So, there
+ * is still a possibility to read from corrupted static volumes.
+ */
+int ubi_eraseblock_read(ubi_desc_t udesc, int lnum, char *buf, int offset,
+			int len, int check, int *read);
+
+/**
+ * ubi_read - read data from an logical eraseblock (simplified).
+ *
+ * This function is the same as the 'ubi_eraseblock_read()' function, but it
+ * does not provide the checking capability.
+ */
+static inline int ubi_read(ubi_desc_t udesc, int lnum, char *buf, int offset,
+			   int len, int *read)
+{
+	return ubi_eraseblock_read(udesc, lnum, buf, offset, len, 0, read);
+}
+
+/**
+ * ubi_eraseblock_write - write data to a logical eraseblock.
+ *
+ * @udesc: volume descriptor
+ * @lnum: the logical eraseblock number to write to
+ * @buf: the data to write
+ * @offset: offset within the logical eraseblock where to write
+ * @len: how many bytes from @buf to write
+ * @dtype: expected data type
+ * @written: how many bytes were actually written
+ *
+ * This function writes @len bytes of data from buffer @buf to offset @offset
+ * of logical eraseblock @lnum. The @dtype argument describes the expected
+ * lifetime of the data being written.
+ *
+ * Note, this function takes care about write failures. If a write to this
+ * logical eraseblock fails, it is re-mapped to another physical eraseblock,
+ * the data is recovered, and the write finishes.
+ *
+ * If all the data were successfully written, zero is returned. If an error
+ * occurred, this function returns a negative error code and stores the number
+ * of written bytes at @written. But there is no guarantee that the were
+ * written correctly.
+ */
+int ubi_eraseblock_write(ubi_desc_t udesc, int lnum, const void *buf,
+			 int offset, int len, enum ubi_data_type dtype,
+			 int *written);
+
+/**
+ * ubi_write - write data to a logical eraseblock (simplified).
+ *
+ * This function is the same as the 'ubi_eraseblock_write()' functions, but it
+ * does not have the data type argument.
+ */
+static inline int ubi_write(ubi_desc_t udesc, int lnum, const void *buf,
+			    int offset, int len, int *written)
+{
+	return ubi_eraseblock_write(udesc, lnum, buf, offset, len,
+				    UBI_DATA_UNKNOWN, written);
+}
+
+/**
+ * ubi_eraseblock_erase - erase a logical eraseblock.
+ *
+ * @udesc: volume descriptor
+ * @lnum: the logical eraseblock number to erase
+ *
+ * This function returns zero in case of success and a negative error code on
+ * case of failure.
+ *
+ * Note, UBI erases eraseblocks asynchronously. This means that this function
+ * will basically unmap this logical eraseblock from its physical eraseblock,
+ * schedule the physical eraseblock for erasure and return. Thus, logical
+ * eraseblock erasure is much faster then physical eraseblock erasure.
+ */
+int ubi_eraseblock_erase(ubi_desc_t udesc, int lnum);
+
+/**
+ * ubi_get_volume_info - get information about an UBI volume.
+ *
+ * @udesc: volume descriptor
+ * @vi: the volume information is stored here
+ */
+void ubi_get_volume_info(ubi_desc_t udesc, struct ubi_vol_info *vi);
+
+#endif /* !__LINUX_UBI_H__ */
diff --git a/include/mtd/ubi-header.h b/include/mtd/ubi-header.h
new file mode 100644
index 0000000..687bf52
--- /dev/null
+++ b/include/mtd/ubi-header.h
@@ -0,0 +1,386 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Authors: Artem B. Bityutskiy
+ *          Thomas Gleixner
+ *          Frank Haverkamp
+ *          Oliver Lohmann
+ *          Andreas Arnez
+ */
+
+/*
+ * This file defines the layout of UBI headers and all the other UBI on-flash
+ * data structures.
+ */
+
+#ifndef __UBI_HEADER_H__
+#define __UBI_HEADER_H__
+
+#include <asm/byteorder.h>
+
+/* The version of this UBI implementation */
+#define UBI_VERSION 1
+
+/* The highest erase counter value supported by this implementation of UBI */
+#define UBI_MAX_ERASECOUNTER 0x7FFFFFFF
+
+/* The initial CRC32 value used when calculating CRC checksums */
+#define UBI_CRC32_INIT 0xFFFFFFFFU
+
+/**
+ * Magic numbers of the UBI headers.
+ *
+ * @UBI_EC_HDR_MAGIC: erase counter header magic number (ASCII "UBI#")
+ * @UBI_VID_HDR_MAGIC: volume identifier header magic number (ASCII "UBI!")
+ */
+enum {
+	UBI_EC_HDR_MAGIC  = 0x55424923,
+	UBI_VID_HDR_MAGIC = 0x55424921
+};
+
+/**
+ * Molume type constants used in volume identifier headers.
+ *
+ * @UBI_VID_DYNAMIC: dynamic volume
+ * @UBI_VID_STATIC: static volume
+ */
+enum {
+	UBI_VID_DYNAMIC = 1,
+	UBI_VID_STATIC  = 2
+};
+
+/**
+ * Compatibility constants used by internal volumes.
+ *
+ * @UBI_COMPAT_DELETE: delete this internal volume before anything is written
+ * to the flash
+ * @UBI_COMPAT_RO: attach this device in read-only mode
+ * @UBI_COMPAT_PRESERVE: preserve this internal volume - do not touch its
+ * physical eraseblocks, don't allow the wear-leveling unit to move them
+ * @UBI_COMPAT_REJECT: reject this UBI image
+ */
+enum {
+	UBI_COMPAT_DELETE   = 1,
+	UBI_COMPAT_RO       = 2,
+	UBI_COMPAT_PRESERVE = 4,
+	UBI_COMPAT_REJECT   = 5
+};
+
+/*
+ * ubi16_t/ubi32_t/ubi64_t - 16, 32, and 64-bit integers used in UBI on-flash
+ * data structures.
+ */
+typedef struct {
+	uint16_t int16;
+} __attribute__ ((packed)) ubi16_t;
+
+typedef struct {
+	uint32_t int32;
+} __attribute__ ((packed)) ubi32_t;
+
+typedef struct {
+	uint64_t int64;
+} __attribute__ ((packed)) ubi64_t;
+
+/*
+ * In this implementation UBI uses the big-endian format for on-flash integers.
+ * The below are the corresponding endianess conversion macros.
+ */
+#define cpu_to_ubi16(x) ((ubi16_t){__cpu_to_be16(x)})
+#define ubi16_to_cpu(x) ((uint16_t)__be16_to_cpu((x).int16))
+
+#define cpu_to_ubi32(x) ((ubi32_t){__cpu_to_be32(x)})
+#define ubi32_to_cpu(x) ((uint32_t)__be32_to_cpu((x).int32))
+
+#define cpu_to_ubi64(x) ((ubi64_t){__cpu_to_be64(x)})
+#define ubi64_to_cpu(x) ((uint64_t)__be64_to_cpu((x).int64))
+
+/*
+ * Sizes of UBI headers.
+ */
+#define UBI_EC_HDR_SIZE  sizeof(struct ubi_ec_hdr)
+#define UBI_VID_HDR_SIZE sizeof(struct ubi_vid_hdr)
+
+/*
+ * Sizes of UBI headers without the ending CRC.
+ */
+#define UBI_EC_HDR_SIZE_CRC  (UBI_EC_HDR_SIZE  - sizeof(ubi32_t))
+#define UBI_VID_HDR_SIZE_CRC (UBI_VID_HDR_SIZE - sizeof(ubi32_t))
+
+/*
+ * How much private data may internal volumes store in the VID header.
+ */
+#define UBI_VID_HDR_IVOL_DATA_SIZE 12
+
+/**
+ * struct ubi_ec_hdr - UBI erase counter header.
+ *
+ * @magic: the erase counter header magic number (%UBI_EC_HDR_MAGIC)
+ * @version: the version of UBI implementation which is supposed to accept this
+ * UBI image (%UBI_VERSION)
+ * @padding1: reserved for future, zeroes
+ * @ec: the erase counter
+ * @vid_hdr_offset: where the VID header begins
+ * @data_offset: where the user data begins
+ * @padding2: reserved for future, zeroes
+ * @hdr_crc: the erase counter header CRC checksum
+ *
+ * The erase counter header takes 64 bytes and has a plenty of unused space for
+ * future usage. The unused fields are zeroed. The @version field is used to
+ * indicate the version of UBI implementation which is supposed to be able to
+ * work with this UBI image. If @version is greater then the current UBI
+ * version, the image is rejecter. This may be useful in future if something
+ * is changed radically. This field is duplicated in the volume identifier
+ * header.
+ *
+ * The @vid_hdr_offset and @data_offset fields contain the offset of the the
+ * volume identifier header and user data, relative to the beginning of the
+ * eraseblock. These values have to be the same for all eraseblocks.
+ */
+struct ubi_ec_hdr {
+	ubi32_t magic;
+	uint8_t version;
+	uint8_t padding1[3];
+	ubi64_t ec; /* Warning: the current limit is 31-bit anyway! */
+	ubi32_t vid_hdr_offset;
+	ubi32_t data_offset;
+	uint8_t padding2[36];
+	ubi32_t hdr_crc;
+} __attribute__ ((packed));
+
+/**
+ * struct ubi_vid_hdr - on-flash UBI volume identifier header.
+ *
+ * @magic: volume identifier header magic number (%UBI_VID_HDR_MAGIC)
+ * @version: UBI implementation version which is supposed to accept this UBI
+ * image (%UBI_VERSION)
+ * @vol_type: volume type (%UBI_VID_DYNAMIC or %UBI_VID_STATIC)
+ * @copy_flag: a flag indicating if this physical eraseblock was created by
+ * means of copying an original physical eraseblock to ensure wear-leveling.
+ * @compat: compatibility of this volume (%UBI_COMPAT_DELETE,
+ * %UBI_COMPAT_IGNORE, %UBI_COMPAT_PRESERVE, or %UBI_COMPAT_REJECT)
+ * @vol_id: volume ID
+ * @lnum: logical eraseblock number
+ * @leb_ver: eraseblock copy number
+ * @data_size: how many bytes of data this eraseblock contains.
+ * @used_ebs: total number of used logical eraseblocks in this volume
+ * @data_pad: how many bytes at the end of this eraseblock are not used
+ * @data_crc: CRC checksum of data containing in this eraseblock
+ * @padding1: reserved for future, zeroes
+ * @ivol_data: private data of internal volumes
+ * @hdr_crc: volume identifier header CRC checksum
+ *
+ * The @leb_ver and the @copy_flag fields are used to distinguish between older
+ * and newer copies of logical eraseblocks, as well as to guarantee robustness
+ * to unclean reboots. As UBI erases logical eraseblocks asynchronously, it has
+ * to distinguish between older and newer copies of eraseblocks. This is done
+ * using the @version field. On the other hand, when UBI moves an eraseblock,
+ * its version is also increased and the @copy_flag is set to 1. Additionally,
+ * when moving eraseblocks, UBI calculates data CRC and stores it in the
+ * @data_crc field, even for dynamic volumes.
+ *
+ * Thus, if there are 2 eraseblocks of the same volume and logical number, UBI
+ * uses the following algorithm to pick one of them. It first picks the one
+ * with larger version (say, A). If @copy_flag is not set, then A is picked. If
+ * @copy_flag is set, UBI checks the CRC of the eraseblock (@data_crc). This is
+ * needed to ensure that copying was finished. If the CRC is all right, A is
+ * picked. If not, the older eraseblock is picked.
+ *
+ * Note, the @leb_ver field may overflow. Thus, if you have 2 versions A and B,
+ * then A > B if abs(A-B) < 0x7FFFFFFF, and A < B otherwise.
+ *
+ * There are 2 sorts of volumes in UBI: user volumes and internal volumes.
+ * Internal volumes are not seen from outside and are used for different
+ * internal UBI purposes. In this implementation there are only two internal
+ * volumes: the layout volume and the update volume. Internal volumes are the
+ * main mechanism of UBI extensions. For example, in future one may introduce a
+ * journal internal volume.
+ *
+ * The @compat field is only used for internal volumes and contains the degree
+ * of their compatibility. This field is always zero for user volumes. This
+ * field provides a mechanism to introduce UBI extensions and to be still
+ * compatible with older UBI binaries. For example, if someone introduced an
+ * journal internal volume in future, he would probably use %UBI_COMPAT_DELETE
+ * compatibility.  And in this case, older UBI binaries, which know nothing
+ * about the journal volume, would just delete this and work perfectly fine.
+ * This is somewhat similar to what Ext2fs does when it is fed by an Ext3fs
+ * image - it just ignores the Ext3fs journal.
+ *
+ * The @data_crc field contains the CRC checksum of the contents of the logical
+ * eraseblock if this is a static volume.  In case of dynamic volumes, it does
+ * not contain the CRC checksum as a rule. The only exception is when the
+ * logical eraseblock was moved by the wear-leveling unit, then the
+ * wear-leveling unit calculates the eraseblocks' CRC and stores it at
+ * @data_crc.
+ *
+ * The @data_size field is always used for static volumes because we want to
+ * know about how many bytes of data are stored in this eraseblock.  For
+ * dynamic eraseblocks, this field usually contains zero. The only exception is
+ * when the logical eraseblock is moved to another physical eraseblock due to
+ * wear-leveling reasons. In this case, UBI calculates CRC checksum of the
+ * contents and uses both @data_crc and @data_size fields. In this case, the
+ * @data_size field contains the size of logical eraseblock of this volume
+ * (which may vary owing to @alignment).
+ *
+ * The @used_ebs field is used only for static volumes and indicates how many
+ * eraseblocks the data of the volume takes. For dynamic volumes this field is
+ * not used and always contains zero.
+ *
+ * The @data_pad is calculated when volumes are created using the alignment
+ * parameter. So, effectively, the @data_pad field reduces the size of logical
+ * eraseblocks of this volume. This is very handy when one uses block-oriented
+ * software (say, cramfs) on top of the UBI volume.
+ *
+ * The @ivol_data contains private data of internal volumes. This might be very
+ * handy to store data in the VID header, not in the eraseblock's contents. For
+ * example it may make life of simple boot-loaders easier. The @ivol_data field
+ * contains zeroes for user volumes.
+ */
+struct ubi_vid_hdr {
+	ubi32_t magic;
+	uint8_t version;
+	uint8_t vol_type;
+	uint8_t copy_flag;
+	uint8_t compat;
+	ubi32_t vol_id;
+	ubi32_t lnum;
+	ubi32_t leb_ver;
+	ubi32_t data_size;
+	ubi32_t used_ebs;
+	ubi32_t data_pad;
+	ubi32_t data_crc;
+	uint8_t padding1[12];
+	uint8_t ivol_data[UBI_VID_HDR_IVOL_DATA_SIZE];
+	ubi32_t hdr_crc;
+} __attribute__ ((packed));
+
+/**
+ * struct ubi_vid_hdr_upd_vol - private data of the update internal volume
+ * stored in volume identifier headers.
+ *
+ * @vol_id: volume ID of the volume under update
+ * @padding: zeroes
+ */
+struct ubi_vid_hdr_upd_vol {
+	ubi32_t vol_id;
+	uint8_t padding[UBI_VID_HDR_IVOL_DATA_SIZE - 4];
+} __attribute__ ((packed));
+
+/*
+ * Count of internal UBI volumes.
+ */
+#define UBI_INT_VOL_COUNT 2
+
+/*
+ * Internal volume IDs start from this digit. There is a reserved room for 4096
+ * internal volumes.
+ */
+#define UBI_INTERNAL_VOL_START (0x7FFFFFFF - 4096)
+
+/**
+ * enum ubi_internal_volume_numbers - volume IDs of internal UBI volumes.
+ *
+ * %UBI_LAYOUT_VOL_ID: volume ID of the layout volume
+ * %UBI_UPDATE_VOL_ID: volume ID of the update volume
+ */
+enum ubi_internal_volume_ids {
+	UBI_LAYOUT_VOL_ID = UBI_INTERNAL_VOL_START,
+	UBI_UPDATE_VOL_ID = UBI_INTERNAL_VOL_START + 1
+};
+
+/*
+ * Number of logical eraseblocks reserved for internal volumes.
+ */
+#define UBI_LAYOUT_VOLUME_EBS 2
+#define UBI_UPDATE_VOLUME_EBS 1
+
+/*
+ * Names of internal volumes
+ */
+#define UBI_LAYOUT_VOLUME_NAME "The layout volume"
+#define UBI_UPDATE_VOLUME_NAME "The update volume"
+
+/*
+ * Compatibility flags of internal volumes.
+ */
+#define UBI_LAYOUT_VOLUME_COMPAT UBI_COMPAT_REJECT
+#define UBI_UPDATE_VOLUME_COMPAT UBI_COMPAT_REJECT
+
+/*
+ * The maximum number of volumes per one UBI device.
+ */
+#define UBI_MAX_VOLUMES 128
+
+/*
+ * The maximum volume name length.
+ */
+#define UBI_VOL_NAME_MAX 127
+
+/*
+ * Size of volume table records.
+ */
+#define UBI_VTBL_RECORD_SIZE sizeof(struct ubi_vol_tbl_record)
+
+/*
+ * Size of volume table records without the ending CRC.
+ */
+#define UBI_VTBL_RECORD_SIZE_CRC (UBI_VTBL_RECORD_SIZE - sizeof(ubi32_t))
+
+/**
+ * struct ubi_vol_tbl_record - a record in the volume table.
+ *
+ * @reserved_pebs: how many physical eraseblocks are reserved for this volume
+ * @alignment: volume alignment
+ * @data_pad: how many bytes are not used at the end of the eraseblocks to
+ * satisfy the requested alignment
+ * @padding1: reserved, zeroes
+ * @name_len: the volume name length
+ * @name: the volume name
+ * @padding2: reserved, zeroes
+ * @crc: a CRC32 checksum of the record
+ *
+ * The layout volume consists of 2 logical eraseblock, each of which contains
+ * the volume table (i.e., the volume table is duplicated). The volume table is
+ * an array of &struct ubi_vol_tbl_record objects indexed by the volume ID.
+ *
+ * If the size of the logical eraseblock is large enough to fit
+ * %UBI_MAX_VOLUMES, the volume table contains %UBI_MAX_VOLUMES records.
+ * Otherwise, it contains as much records as can be fit (i.e., size of logical
+ * eraseblock divided by sizeof(struct ubi_vol_tbl_record)).
+ *
+ * The @alignment field is specified when the volume is created and cannot be
+ * later changed. It may be useful, for example, when a block-oriented file
+ * system works on top of UBI. The @data_pad field is calculated using the
+ * logical eraseblock size and @alignment. The alignment must be multiple to the
+ * minimal flash I/O unit. If @alignment is 1, all the available space of
+ * eraseblocks is used.
+ *
+ * Empty records contain all zeroes and the CRC checksum of those zeroes.
+ */
+struct ubi_vol_tbl_record {
+	ubi32_t reserved_pebs;
+	ubi32_t alignment;
+	ubi32_t data_pad;
+	uint8_t vol_type;
+	uint8_t padding1;
+	ubi16_t name_len;
+	uint8_t name[UBI_VOL_NAME_MAX + 1];
+	uint8_t padding2[24];
+	ubi32_t crc;
+} __attribute__ ((packed));
+
+#endif /* !__UBI_HEADER_H__ */
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
new file mode 100644
index 0000000..5bc0c27
--- /dev/null
+++ b/include/mtd/ubi-user.h
@@ -0,0 +1,128 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem B. Bityutskiy
+ */
+
+#ifndef __UBI_USER_H__
+#define __UBI_USER_H__
+
+#ifndef __KERNEL__
+#define __user
+#endif
+
+/*
+ * When a new volume is created, users may either specify the volume number they
+ * want to create or to let UBI automatically assign a volume number using this
+ * constant.
+ */
+#define UBI_VOL_NUM_AUTO (-1)
+
+/*
+ * IOCTL commands of UBI character devices
+ */
+
+#define UBI_IOC_MAGIC 'o'
+
+/* Create an UBI volume */
+#define UBI_IOCMKVOL _IOW(UBI_IOC_MAGIC, 0, struct ubi_mkvol_req)
+/* Remove an UBI volume */
+#define UBI_IOCRMVOL _IOW(UBI_IOC_MAGIC, 1, int32_t)
+/* Re-size an UBI volume */
+#define UBI_IOCRSVOL _IOW(UBI_IOC_MAGIC, 2, struct ubi_rsvol_req)
+
+/*
+ * IOCTL commands of UBI volume character devices.
+ */
+
+#define UBI_VOL_IOC_MAGIC 'O'
+
+/* Start UBI volume update */
+#define UBI_IOCVOLUP _IOW(UBI_VOL_IOC_MAGIC, 0, int64_t)
+/* An eraseblock erasure command, used for debugging, disabled by dafault */
+#define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 0, int32_t)
+
+/**
+ * UBI volume type constants.
+ *
+ * @UBI_DYNAMIC_VOLUME: dynamic volume
+ * @UBI_STATIC_VOLUME:  static volume
+ */
+enum {
+	UBI_DYNAMIC_VOLUME = 3,
+	UBI_STATIC_VOLUME = 4
+};
+
+/**
+ * struct ubi_mkvol_req - volume description data structure used in
+ * volume creation requests.
+ *
+ * @vol_id: volume number
+ * @alignment: volume alignment
+ * @bytes: volume size in bytes
+ * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
+ * @padding: reserved for future, not used
+ * @name_len: volume name length
+ * @name: volume name
+ *
+ * This structure is used by userspace programs when creating new volumes. The
+ * @used_bytes field is only necessary when creating static volumes.
+ *
+ * The @alignment field specifies the required alignment of the volume logical
+ * eraseblock. This means, that the size of logical eraseblocks will be aligned
+ * to this number, i.e.,
+ * 	(UBI device logical eraseblock size) mod (@alignment) = 0.
+ *
+ * To put it differently, the logical eraseblock of this volume may be slightly
+ * shortened in order to make it properly aligned. The alignment has to be
+ * multiple of the flash minimal input/output unit, or %1 to utilize the entire
+ * available space of logical eraseblocks.
+ *
+ * The @alignment field may be useful, for example, when one wants to maintain
+ * a block device on top of an UBI volume. In this case, it is desirable to fit
+ * an integer number of blocks in logical eraseblocks of this UBI volume. With
+ * alignment it is possible to update this volume using plane UBI volume image
+ * BLOBs, without caring about how to properly write them.
+ */
+struct ubi_mkvol_req {
+	int32_t vol_id;
+	int32_t alignment;
+	int64_t bytes;
+	int8_t vol_type;
+	int8_t padding[9];
+	int16_t name_len;
+	__user const char *name;
+} __attribute__ ((packed));
+
+/**
+ * struct ubi_rsvol_req - a data structure used in volume re-size requests.
+ *
+ * @vol_id: ID of the volume to re-size
+ * @bytes: new size of the volume in bytes
+ *
+ * Re-sizing is possible for both dynamic and static volumes. But while dynamic
+ * volumes may be re-sized arbitrarily, static volumes cannot be made to be
+ * smaller then the number of bytes they bear. To arbitrarily shrink a static
+ * volume, it must be wiped out first (by means of volume update operation with
+ * zero number of bytes).
+ */
+struct ubi_rsvol_req {
+	int64_t bytes;
+	int32_t vol_id;
+} __attribute__ ((packed));
+
+#endif /* __UBI_USER_H__ */

--=-CoAbFEuy4iWwa5tSA1G1--
