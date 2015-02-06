Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJlrL-0004Ch-EL
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 16:34:24 +0000
Received: by mail-ig0-f172.google.com with SMTP id l13so3843297iga.5
 for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2015 08:34:01 -0800 (PST)
From: namnguyen@chromium.org
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: Add nandpart to add/delete partition
Date: Fri,  6 Feb 2015 08:33:55 -0800
Message-Id: <1423240435-30206-1-git-send-email-namnguyen@chromium.org>
Cc: "Nam T. Nguyen" <namnguyen@chromium.org>, vapier@chromium.org,
 dehrenberg@chromium.org
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
 Makefile   |   2 +-
 nandpart.c | 179 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 nandpart.c

diff --git a/Makefile b/Makefile
index eade234..712ff14 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MTD_BINS = \
 	ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock \
 	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
-	mtd_debug flashcp nandwrite nandtest \
+	mtd_debug flashcp nandwrite nandtest nandpart \
 	jffs2dump \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
diff --git a/nandpart.c b/nandpart.c
new file mode 100644
index 0000000..ff84a69
--- /dev/null
+++ b/nandpart.c
@@ -0,0 +1,179 @@
+/*
+ *  nandpart.c
+ *
+ *  Copyright (C) 2015 Nam T. Nguyen (namnguyen@chromium.org)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This utility adds or removes a partition from an MTD device.
+ */
+
+#define PROGRAM_NAME "nandpart"
+
+#include <fcntl.h>
+#include <getopt.h>
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
+"Usage: " PROGRAM_NAME " add MTD-device part-name start size\n"
+"       " PROGRAM_NAME " del MTD-device part-number\n"
+"Adds a partition to an MTD device, or remove an existing partition from it.\n"
+"\n"
+"-h         --help               Display this help and exit\n"
+"           --version            Output version information and exit\n"
+"\n"
+"start location and size of the partition are in bytes. They should align on\n"
+"eraseblock size.\n"
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
+// Command arguments
+
+typedef enum {
+	add_partition,
+	del_partition
+} command_type;
+
+static command_type		command;		// add or del
+static const char		*mtddev;		// mtd device name
+static const char		*part_name;		// partition name
+static unsigned long		part_no;		// partition number
+static unsigned long long	start_addr;		// start address
+static unsigned long long	length;			// partition size
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
+		part_no = simple_strtoul(s_part_no, &error);
+		command = del_partition;
+	} else if (strcmp(s_command, "add") == 0 && (argc - optind) == 3) {
+		part_name = argv[optind++];
+		const char *s_start = argv[optind++];
+		const char *s_length = argv[optind++];
+
+		start_addr = simple_strtoull(s_start, &error);
+		length = simple_strtoull(s_length, &error);
+		command = add_partition;
+	} else
+		display_help(EXIT_FAILURE);
+
+	if (error)
+		display_help(EXIT_FAILURE);
+}
+
+
+/*
+ * Main program
+ */
+int main(int argc, char * const argv[])
+{
+	process_options(argc, argv);
+
+	/* Open MTD device */
+	int fd;
+	if ((fd = open(mtddev, O_RDWR)) == -1) {
+		perror(mtddev);
+		exit(EXIT_FAILURE);
+	}
+
+	struct blkpg_partition part;
+	memset(&part, 0, sizeof(part));
+
+	struct blkpg_ioctl_arg arg;
+	memset(&arg, 0, sizeof(arg));
+	arg.datalen = sizeof(part);
+	arg.data = &part;
+
+	switch (command) {
+		case add_partition:
+			part.start = start_addr;
+			part.length = length;
+			strncpy(part.devname, part_name, sizeof(part.devname));
+			arg.op = BLKPG_ADD_PARTITION;
+			break;
+		case del_partition:
+			part.pno = part_no;
+			arg.op = BLKPG_DEL_PARTITION;
+			break;
+	}
+
+	if (ioctl(fd, BLKPG, &arg)) {
+		perror("ioctl");
+		goto closeall;
+	}
+
+	close(fd);
+
+	/* Exit happy */
+	return EXIT_SUCCESS;
+
+closeall:
+	close(fd);
+	exit(EXIT_FAILURE);
+}
-- 
2.2.0.rc0.207.ga3a616c
