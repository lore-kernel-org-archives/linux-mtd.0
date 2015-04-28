Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn7Bo-0008Op-Dc
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 15:12:49 +0000
Received: by iejt8 with SMTP id t8so20447384iej.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Apr 2015 08:12:26 -0700 (PDT)
From: namnguyen@chromium.org
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5] mtd-utils: Add mtdpart to add/delete partition
Date: Tue, 28 Apr 2015 08:12:12 -0700
Message-Id: <1430233932-8380-1-git-send-email-namnguyen@chromium.org>
Cc: "Nam T. Nguyen" <namnguyen@chromium.org>, vapier@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Nam T. Nguyen" <namnguyen@chromium.org>

Add a simple utility to exercise BLKPG ioctl.

Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
---
Changes since v4:

  * Check part_no parameter for INT_MAX overflow

 Makefile  |   2 +-
 mtdpart.c | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 mtdpart.c

diff --git a/Makefile b/Makefile
index eade234..f4ce313 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MTD_BINS = \
 	ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock \
 	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
-	mtd_debug flashcp nandwrite nandtest \
+	mtd_debug flashcp nandwrite nandtest mtdpart \
 	jffs2dump \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
diff --git a/mtdpart.c b/mtdpart.c
new file mode 100644
index 0000000..0016e34
--- /dev/null
+++ b/mtdpart.c
@@ -0,0 +1,194 @@
+/*
+ *  mtdpart.c
+ *
+ *  Copyright 2015 The Chromium OS Authors.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This utility adds or removes a partition from an MTD device.
+ */
+
+#define PROGRAM_NAME "mtdpart"
+
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <linux/blkpg.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "common.h"
+
+static void display_help(int status)
+{
+	fprintf(status == EXIT_SUCCESS ? stdout : stderr,
+"Usage: %1$s add [OPTION] <MTD_DEVICE> <PART_NAME> <START> <SIZE>\n"
+"       %1$s del [OPTION] <MTD_DEVICE> <PART_NUMBER>\n"
+"Adds a partition to an MTD device, or remove an existing partition from it.\n"
+"\n"
+"  -h, --help    Display this help and exit\n"
+"      --version Output version information and exit\n"
+"\n"
+"START location and SIZE of the partition are in bytes. They should align on\n"
+"eraseblock size.\n",
+	PROGRAM_NAME
+	);
+	exit(status);
+}
+
+static void display_version(void)
+{
+	printf("%1$s " VERSION "\n"
+			"\n"
+			"%1$s comes with NO WARRANTY\n"
+			"to the extent permitted by law.\n"
+			"\n"
+			"You may redistribute copies of %1$s\n"
+			"under the terms of the GNU General Public Licence.\n"
+			"See the file `COPYING' for more information.\n",
+			PROGRAM_NAME);
+	exit(EXIT_SUCCESS);
+}
+
+/* Command arguments */
+
+typedef enum {
+	COMMAND_ADD,
+	COMMAND_DEL
+} command_type;
+
+static command_type		command;		/* add or del */
+static const char		*mtddev;		/* mtd device name */
+static const char		*part_name;		/* partition name */
+static int			part_no;		/* partition number */
+static long long		start_addr;		/* start address */
+static long long		length;			/* partition size */
+
+static void process_options(int argc, char * const argv[])
+{
+	int error = 0;
+
+	for (;;) {
+		int option_index = 0;
+		static const char short_options[] = "h";
+		static const struct option long_options[] = {
+			{"version", no_argument, 0, 0},
+			{"help", no_argument, 0, 'h'},
+			{0, 0, 0, 0},
+		};
+
+		int c = getopt_long(argc, argv, short_options,
+				long_options, &option_index);
+		if (c == EOF) {
+			break;
+		}
+
+		switch (c) {
+			case 0:
+				display_version();
+				break;
+			case 'h':
+				display_help(EXIT_SUCCESS);
+				break;
+			case '?':
+				error++;
+				break;
+		}
+	}
+
+	if ((argc - optind) < 3 || error)
+		display_help(EXIT_FAILURE);
+
+	const char *s_command = argv[optind++];
+	mtddev = argv[optind++];
+
+	if (strcmp(s_command, "del") == 0 && (argc - optind) == 1) {
+		const char *s_part_no = argv[optind++];
+
+		long tmp = simple_strtol(s_part_no, &error);
+		if (tmp < 0)
+		       errmsg_die("Can't specify negative partition number: %ld",
+				  tmp);
+		if (tmp > INT_MAX)
+		       errmsg_die("Partition number exceeds INT_MAX: %ld",
+				  tmp);
+
+		part_no = tmp;
+		command = COMMAND_DEL;
+	} else if (strcmp(s_command, "add") == 0 && (argc - optind) == 3) {
+		const char *s_start;
+		const char *s_length;
+
+		part_name = argv[optind++];
+		s_start = argv[optind++];
+		s_length = argv[optind++];
+
+		if (strlen(part_name) >= BLKPG_DEVNAMELTH)
+			errmsg_die("Partition name (%s) should be less than %d characters",
+				   part_name, BLKPG_DEVNAMELTH);
+
+		start_addr = simple_strtoll(s_start, &error);
+		if (start_addr < 0)
+		       errmsg_die("Can't specify negative start offset: %lld",
+				  start_addr);
+
+		length = simple_strtoll(s_length, &error);
+		if (length < 0)
+		       errmsg_die("Can't specify negative length: %lld",
+				  length);
+
+		command = COMMAND_ADD;
+	} else
+		display_help(EXIT_FAILURE);
+
+	if (error)
+		display_help(EXIT_FAILURE);
+}
+
+
+int main(int argc, char * const argv[])
+{
+	int fd;
+	struct blkpg_partition part;
+	struct blkpg_ioctl_arg arg;
+
+	process_options(argc, argv);
+
+	fd = open(mtddev, O_RDWR | O_CLOEXEC);
+	if (fd == -1)
+		sys_errmsg_die("Cannot open %s", mtddev);
+
+	memset(&part, 0, sizeof(part));
+
+	memset(&arg, 0, sizeof(arg));
+	arg.datalen = sizeof(part);
+	arg.data = &part;
+
+	switch (command) {
+		case COMMAND_ADD:
+			part.start = start_addr;
+			part.length = length;
+			strncpy(part.devname, part_name, sizeof(part.devname));
+			arg.op = BLKPG_ADD_PARTITION;
+			break;
+		case COMMAND_DEL:
+			part.pno = part_no;
+			arg.op = BLKPG_DEL_PARTITION;
+			break;
+	}
+
+	if (ioctl(fd, BLKPG, &arg))
+		sys_errmsg_die("Failed to issue BLKPG ioctl");
+
+	close(fd);
+
+	/* Exit happy */
+	return EXIT_SUCCESS;
+}
-- 
2.2.0.rc0.207.ga3a616c
