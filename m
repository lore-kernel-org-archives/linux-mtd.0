Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwGVU-0003Uj-BK
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 16:40:49 +0000
From: David Wagner <david.wagner@free-electrons.com>
To: David Wagner <david.wagner@free-electrons.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] Tools for controling ubiblk
Date: Wed, 24 Aug 2011 18:43:59 +0200
Message-Id: <1314204239-7782-1-git-send-email-david.wagner@free-electrons.com>
Cc: David Wagner <david.wagner@free-electrons.com>,
	linux-embedded <linux-embedded@vger.kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubiblk_ctrl sends an appropriate ioctl to ubiblk control node.

ubiblkadd and ubiblkdel are wrapper around ubiblk_ctrl.
The syntax is:
	ubiblk{add,del} x y
where x is the UBI device number and y the volume ID.

Signed-off-by: David Wagner <david.wagner@free-electrons.com>
---

	Hi

This tool is intended to add and remove ubiblk devices on top of specified UBI
volumes.

ubiblk is a new module proposal (WIP) ; full description can be found at
https://lkml.org/lkml/2011/8/24/244


changes since v1:
~~~~~~~~~~~~~~~~~
 - update ubiblk-user.h from the latest version of ubiblk (PATCHv4) and copy it
   from <linux sources>/usr/include/mtd/ubi/

 - more foolproof and correct stupid mistakes

	Regards,
	David.


PS: I had troubles integrating it in buildroot: they use the 1.4.6 version or
mtd-utils (latest to date of writing) but 1.4.6 doesn't contain the build system
rework.  However, the fix is trivial and when the next mtd-utils version gets
released, that won't be a problem anymore.


 Makefile                  |    6 ++-
 include/mtd/ubiblk-user.h |   46 +++++++++++++++++++
 ubi-utils/ubiblk_ctrl.c   |  106 +++++++++++++++++++++++++++++++++++++++++++++
 ubi-utils/ubiblkadd       |    2 +
 ubi-utils/ubiblkdel       |    2 +
 5 files changed, 161 insertions(+), 1 deletions(-)
 create mode 100644 include/mtd/ubiblk-user.h
 create mode 100644 ubi-utils/ubiblk_ctrl.c
 create mode 100755 ubi-utils/ubiblkadd
 create mode 100755 ubi-utils/ubiblkdel

diff --git a/Makefile b/Makefile
index 5a0044b..e7856d2 100644
--- a/Makefile
+++ b/Makefile
@@ -27,12 +27,16 @@ MTD_BINS = \
 	sumtool #jffs2reader
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol \
+	ubiblk_ctrl
+UBI_SCRIPTS = \
+	ubiblkadd ubiblkdel
 
 BINS = $(MTD_BINS)
 BINS += mkfs.ubifs/mkfs.ubifs
 BINS += $(addprefix ubi-utils/,$(UBI_BINS))
 SCRIPTS = flash_eraseall
+SCRIPTS += $(addprefix ubi-utils/,$(UBI_SCRIPTS))
 
 TARGETS = $(BINS)
 TARGETS += lib/libmtd.a
diff --git a/include/mtd/ubiblk-user.h b/include/mtd/ubiblk-user.h
new file mode 100644
index 0000000..229d2da
--- /dev/null
+++ b/include/mtd/ubiblk-user.h
@@ -0,0 +1,46 @@
+/*
+ * Copyright © Free Electrons, 2011
+ * Copyright © International Business Machines Corp., 2006
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
+ * Author: David Wagner
+ * Some code taken from ubi-user.h
+ */
+
+#ifndef __UBIBLK_USER_H__
+#define __UBIBLK_USER_H__
+
+#include <linux/types.h>
+
+/**
+ * ubiblk_ctrl_req - additional ioctl data structure
+ * @ubi_num: UBI device number
+ * @vol_id: UBI volume identifier
+ */
+struct ubiblk_ctrl_req {
+	__s32 ubi_num;
+	__s32 vol_id;
+} __packed;
+
+/* ioctl commands of the UBI control character device */
+#define UBIBLK_CTRL_IOC_MAGIC 'O'
+
+/* Create a ubiblk device from a UBI volume */
+#define UBIBLK_IOCADD _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x10, struct ubiblk_ctrl_req)
+/* Delete a ubiblk device */
+#define UBIBLK_IOCDEL _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x11, struct ubiblk_ctrl_req)
+
+#endif
diff --git a/ubi-utils/ubiblk_ctrl.c b/ubi-utils/ubiblk_ctrl.c
new file mode 100644
index 0000000..7b309aa
--- /dev/null
+++ b/ubi-utils/ubiblk_ctrl.c
@@ -0,0 +1,106 @@
+/*
+ * Copyright (c) Free Electrons, 2011
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
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: David Wagner
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <libgen.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <mtd/ubiblk-user.h>
+
+#define PROGRAM_NAME "ubiblk_ctrl"
+#include <common.h>
+
+#define CONTROL_NODE "/dev/ubiblk_ctrl"
+
+void usage(char *exec_path)
+{
+	fprintf(stderr, "%s <-a|-d> <-u UBI_DEVICE_NUMBER> <-v VOLUME_ID>\n",
+			basename(exec_path));
+}
+
+int main(int argc, char *argv[])
+{
+	int ubi_num = -1, vol_id = -1;
+	int fd;
+	struct ubiblk_ctrl_req req;
+	int ret, err = 0;
+	int command = 0;
+
+	int option;
+
+	while ((option = getopt(argc, argv, "adu:v:")) != -1) {
+		switch (option) {
+		case 'a':
+			command = UBIBLK_IOCADD;
+			break;
+		case 'd':
+			command = UBIBLK_IOCDEL;
+			break;
+		case 'u':
+			ubi_num = simple_strtol(optarg, &err);
+			if (err) {
+				usage(argv[0]);
+				return EXIT_FAILURE;
+			}
+			break;
+		case 'v':
+			vol_id = simple_strtol(optarg, &err);
+			if (err) {
+				usage(argv[0]);
+				return EXIT_FAILURE;
+			}
+			break;
+		}
+	}
+
+	if (command != UBIBLK_IOCDEL && command != UBIBLK_IOCADD) {
+		usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+	if (vol_id == -1 || vol_id == -1) {
+		usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+
+	req.ubi_num = ubi_num;
+	req.vol_id = vol_id;
+
+	fd = open(CONTROL_NODE, O_RDONLY);
+	if (fd == -1) {
+		fprintf(stderr, "Error while opening the control node: %s\n",
+				strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	ret = ioctl(fd, command, &req);
+	if (ret == -1) {
+		fprintf(stderr, "Error while ioctl: %s\n", strerror(errno));
+		close(fd);
+		return EXIT_FAILURE;
+	}
+	close(fd);
+	return EXIT_SUCCESS;
+}
diff --git a/ubi-utils/ubiblkadd b/ubi-utils/ubiblkadd
new file mode 100755
index 0000000..92f9992
--- /dev/null
+++ b/ubi-utils/ubiblkadd
@@ -0,0 +1,2 @@
+#! /bin/sh
+ubiblk_ctrl -a -u $1 -v $2
diff --git a/ubi-utils/ubiblkdel b/ubi-utils/ubiblkdel
new file mode 100755
index 0000000..4c7660d
--- /dev/null
+++ b/ubi-utils/ubiblkdel
@@ -0,0 +1,2 @@
+#! /bin/sh
+ubiblk_ctrl -d -u $1 -v $2
-- 
1.7.0.4
