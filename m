Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ua7DY-0006BU-SS
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 16:27:50 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 83F7933DEEC
 for <linux-mtd@lists.infradead.org>; Wed,  8 May 2013 16:27:27 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH [mtd-utils] 2/3] mtd-utils: new prompt() helper for talking to
 the user
Date: Wed,  8 May 2013 12:27:25 -0400
Message-Id: <1368030446-343-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1368030446-343-1-git-send-email-vapier@gentoo.org>
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've got a few tools that prompt the user for "yes/no" questions.
Add a common helper to simplify the various implementations.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_otp_lock.c      |  6 +++---
 ftl_format.c          | 11 +++--------
 include/common.h      | 39 ++++++++++++++++++++++++++++++++++++++-
 ubi-utils/ubiformat.c | 39 +++++++--------------------------------
 4 files changed, 51 insertions(+), 44 deletions(-)

diff --git a/flash_otp_lock.c b/flash_otp_lock.c
index cc8759e..3c39a2d 100644
--- a/flash_otp_lock.c
+++ b/flash_otp_lock.c
@@ -13,11 +13,12 @@
 #include <sys/ioctl.h>
 
 #include <mtd/mtd-user.h>
+#include "common.h"
 
 int main(int argc,char *argv[])
 {
 	int fd, val, ret, offset, size;
-	char *p, buf[8];
+	char *p;
 
 	if (argc != 5 || strcmp(argv[1], "-u")) {
 		fprintf(stderr, "Usage: %s -u <device> <offset> <size>\n", PROGRAM_NAME);
@@ -53,8 +54,7 @@ int main(int argc,char *argv[])
 
 	printf("About to lock OTP user data on %s from 0x%x to 0x%x\n",
 			argv[2], offset, offset + size);
-	printf("Are you sure (yes|no)? ");
-	if (fgets(buf, sizeof(buf), stdin) && strcmp(buf, "yes\n") == 0) {
+	if (prompt("Are you sure?", false)) {
 		struct otp_info info;
 		info.start = offset;
 		info.length = size;
diff --git a/ftl_format.c b/ftl_format.c
index 0f69b8f..b58677f 100644
--- a/ftl_format.c
+++ b/ftl_format.c
@@ -51,6 +51,7 @@
 #include <mtd/mtd-user.h>
 #include <mtd/ftl-user.h>
 #include <mtd_swab.h>
+#include "common.h"
 
 /*====================================================================*/
 
@@ -164,15 +165,9 @@ static int format_partition(int fd, int quiet, int interrogate,
 		fflush(stdout);
 	}
 
-	if (interrogate) {
-		char str[3];
-		printf("This will destroy all data on the target device.  "
-				"Confirm (y/n): ");
-		if (fgets(str, 3, stdin) == NULL)
+	if (interrogate)
+		if (!prompt("This will destroy all data on the target device. Confirm?", false))
 			return -1;
-		if ((strcmp(str, "y\n") != 0) && (strcmp(str, "Y\n") != 0))
-			return -1;
-	}
 
 	/* Create basic block allocation table for control blocks */
 	nbam = ((mtd.erasesize >> hdr.BlockSize) * sizeof(u_int)
diff --git a/include/common.h b/include/common.h
index d0c4146..4ffccea 100644
--- a/include/common.h
+++ b/include/common.h
@@ -19,6 +19,7 @@
 #ifndef __MTD_UTILS_COMMON_H__
 #define __MTD_UTILS_COMMON_H__
 
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <ctype.h>
@@ -101,9 +102,45 @@ extern "C" {
 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
 } while(0)
 
+/**
+ * prompt the user for confirmation
+ */
+static inline bool prompt(const char *msg, bool def)
+{
+	char *line = NULL;
+	size_t len;
+	bool ret = def;
+
+	do {
+		normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
+		fflush(stdout);
+
+		while (getline(&line, &len, stdin) == -1) {
+			printf("failed to read prompt; assuming '%s'\n",
+				def ? "yes" : "no");
+			break;
+		}
+
+		if (strcmp("\n", line) != 0) {
+			switch (rpmatch(line)) {
+			case 0: ret = false; break;
+			case 1: ret = true; break;
+			case -1:
+				puts("unknown response; please try again");
+				continue;
+			}
+		}
+		break;
+	} while (1);
+
+	free(line);
+
+	return ret;
+}
+
 static inline int is_power_of_2(unsigned long long n)
 {
-	        return (n != 0 && ((n & (n - 1)) == 0));
+	return (n != 0 && ((n & (n - 1)) == 0));
 }
 
 /**
diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 899f9fc..97a4eab 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -243,35 +243,12 @@ static int parse_opt(int argc, char * const argv[])
 
 static int want_exit(void)
 {
-	char buf[4];
-
-	while (1) {
-		normsg_cont("continue? (yes/no)  ");
-		if (scanf("%3s", buf) == EOF) {
-			sys_errmsg("scanf returned unexpected EOF, assume \"yes\"");
-			return 1;
-		}
-		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
-			return 0;
-		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
-			return 1;
-	}
+	return prompt("continue?", false) == true ? 0 : 1;
 }
 
-static int answer_is_yes(void)
+static int answer_is_yes(const char *msg)
 {
-	char buf[4];
-
-	while (1) {
-		if (scanf("%3s", buf) == EOF) {
-			sys_errmsg("scanf returned unexpected EOF, assume \"no\"");
-			return 0;
-		}
-		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
-			return 1;
-		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
-			return 0;
-	}
+	return prompt(msg ? : "continue?", false);
 }
 
 static void print_bad_eraseblocks(const struct mtd_dev_info *mtd,
@@ -412,11 +389,9 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 {
 	int err;
 
-	if (!args.yes) {
-		normsg_cont("mark it as bad? Continue (yes/no) ");
-		if (!answer_is_yes())
+	if (!args.yes)
+		if (!answer_is_yes("mark it as bad?"))
 			return -1;
-	}
 
 	if (!args.quiet)
 		normsg_cont("marking block %d bad", eb);
@@ -922,10 +897,10 @@ int main(int argc, char * const argv[])
 				"which is different to requested offsets %d and %d",
 				si->vid_hdr_offs, si->data_offs, ui.vid_hdr_offs,
 				ui.data_offs);
-			normsg_cont("use new offsets %d and %d? (yes/no)  ",
+			normsg_cont("use new offsets %d and %d? ",
 				    ui.vid_hdr_offs, ui.data_offs);
 		}
-		if (args.yes || answer_is_yes()) {
+		if (args.yes || answer_is_yes(NULL)) {
 			if (args.yes && !args.quiet)
 				printf("yes\n");
 		} else
-- 
1.8.2.1
