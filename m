Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfN-00043N-FR
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:06 +0000
Received: by pabzx8 with SMTP id zx8so152930916pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:48 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 07/11] flash_{un,
 }lock: support both lock/unlock in the same binary
Date: Mon, 31 Aug 2015 15:34:28 -0700
Message-Id: <1441060472-82169-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
References: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add new --lock/--unlock flags, so we can do either with the same binary.
This will prepare for the addition of other features, so we don't have
to keep duplicating the same binary via #include "flash_unlock.c".

The defaults still work as expected: flash_unlock will default to
REQUEST_UNLOCK, and flash_lock will default to REQUEST_LOCK.

Eventually, we might deprecate one of the two (flash_unlock, probably),
so we only have to ship one flash_{un,}lock binary.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 67277493d4b3..be09347faa92 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -4,13 +4,16 @@
  * utilities for locking/unlocking sectors of flash devices
  */
 
+enum flash_lock_request {
+	REQUEST_LOCK,
+	REQUEST_UNLOCK,
+};
+
 #ifndef PROGRAM_NAME
-#define PROGRAM_NAME "flash_unlock"
-#define FLASH_MSG    "unlock"
-#define FLASH_UNLOCK 1
+#define PROGRAM_NAME		"flash_unlock"
+#define DEFAULT_REQUEST		REQUEST_UNLOCK
 #else
-#define FLASH_MSG    "lock"
-#define FLASH_UNLOCK 0
+#define DEFAULT_REQUEST		REQUEST_LOCK
 #endif
 
 #include <getopt.h>
@@ -26,34 +29,48 @@
 #include "common.h"
 #include <mtd/mtd-user.h>
 
+static const char *flash_msg[] = {
+	[ REQUEST_LOCK ]	= "lock",
+	[ REQUEST_UNLOCK ]	= "unlock",
+};
+
 static void usage(int status)
 {
 	fprintf(status ? stderr : stdout,
+		"Utility to lock or unlock the flash. Default action: %s\n"
+		"\n"
 		"Usage: %s [options] [--] <mtd device> [offset [block count]]\n"
 		"\n"
 		"Options:\n"
 		" -h         --help              Display this help and exit\n"
 		"            --version           Display version information and exit\n"
+		" -l         --lock              Lock a region of flash\n"
+		" -u         --unlock            Unlock a region of flash\n"
 		"\n"
 		"If offset is not specified, it defaults to 0.\n"
 		"If block count is not specified, it defaults to all blocks.\n",
+		flash_msg[DEFAULT_REQUEST],
 		PROGRAM_NAME);
 	exit(status);
 }
 
-static const char short_opts[] = "h";
+static const char short_opts[] = "hlu";
 static const struct option long_opts[] = {
 	{ "help",	no_argument,	0, 'h' },
+	{ "lock",	no_argument,	0, 'l' },
+	{ "unlock",	no_argument,	0, 'u' },
 	{ "version",	no_argument,	0, 'v' },
 	{ NULL,		0,		0, 0 },
 };
 
 /* Program arguments */
 static const char *dev, *offs_s, *count_s;
+static enum flash_lock_request req = DEFAULT_REQUEST;
 
 static void process_args(int argc, char *argv[])
 {
 	int arg_idx;
+	int req_set = 0;
 
 	for (;;) {
 		int c;
@@ -66,6 +83,14 @@ static void process_args(int argc, char *argv[])
 		case 'h':
 			usage(0);
 			break;
+		case 'l':
+			req = REQUEST_LOCK;
+			req_set++;
+			break;
+		case 'u':
+			req = REQUEST_UNLOCK;
+			req_set++;
+			break;
 		case 'v':
 			common_print_version();
 			exit(0);
@@ -75,6 +100,11 @@ static void process_args(int argc, char *argv[])
 		}
 	}
 
+	if (req_set > 1) {
+		errmsg("cannot specify more than one lock/unlock option");
+		usage(1);
+	}
+
 	arg_idx = optind;
 
 	/* Sanity checks */
@@ -142,10 +172,20 @@ int main(int argc, char *argv[])
 			mtdLockInfo.start, mtdLockInfo.length, mtdInfo.size);
 
 	/* Finally do the operation */
-	request = FLASH_UNLOCK ? MEMUNLOCK : MEMLOCK;
+	switch (req) {
+	case REQUEST_LOCK:
+		request = MEMLOCK;
+		break;
+	case REQUEST_UNLOCK:
+		request = MEMUNLOCK;
+		break;
+	default:
+		errmsg_die("unknown request type: %d", req);
+		break;
+	}
 	if (ioctl(fd, request, &mtdLockInfo))
 		sys_errmsg_die("could not %s device: %s\n",
-			FLASH_MSG, dev);
+				flash_msg[req], dev);
 
 	return 0;
 }
-- 
2.5.0.457.gab17608
