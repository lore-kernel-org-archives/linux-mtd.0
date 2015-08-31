Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfS-00043Z-AP
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:10 +0000
Received: by pacdd16 with SMTP id dd16so152798430pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 08/11] flash_{un,}lock: add MEMISLOCKED support
Date: Mon, 31 Aug 2015 15:34:29 -0700
Message-Id: <1441060472-82169-9-git-send-email-computersforpeace@gmail.com>
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

With the -i / --islocked flags.

Sample output:

  # flash_lock --islocked /dev/mtd0
  Device: /dev/mtd0
  Start: 0
  Len: 0x400000
  Lock status: unlocked
  Return code: 0

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index be09347faa92..644360548601 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -7,6 +7,7 @@
 enum flash_lock_request {
 	REQUEST_LOCK,
 	REQUEST_UNLOCK,
+	REQUEST_ISLOCKED,
 };
 
 #ifndef PROGRAM_NAME
@@ -32,18 +33,21 @@ enum flash_lock_request {
 static const char *flash_msg[] = {
 	[ REQUEST_LOCK ]	= "lock",
 	[ REQUEST_UNLOCK ]	= "unlock",
+	[ REQUEST_ISLOCKED ]	= "check lock status",
 };
 
 static void usage(int status)
 {
 	fprintf(status ? stderr : stdout,
-		"Utility to lock or unlock the flash. Default action: %s\n"
+		"Utility to lock, unlock, or check the lock status of the flash.\n"
+		"Default action: %s\n"
 		"\n"
 		"Usage: %s [options] [--] <mtd device> [offset [block count]]\n"
 		"\n"
 		"Options:\n"
 		" -h         --help              Display this help and exit\n"
 		"            --version           Display version information and exit\n"
+		" -i         --islocked          Check if flash region is locked\n"
 		" -l         --lock              Lock a region of flash\n"
 		" -u         --unlock            Unlock a region of flash\n"
 		"\n"
@@ -54,9 +58,10 @@ static void usage(int status)
 	exit(status);
 }
 
-static const char short_opts[] = "hlu";
+static const char short_opts[] = "hilu";
 static const struct option long_opts[] = {
 	{ "help",	no_argument,	0, 'h' },
+	{ "islocked",	no_argument,	0, 'i' },
 	{ "lock",	no_argument,	0, 'l' },
 	{ "unlock",	no_argument,	0, 'u' },
 	{ "version",	no_argument,	0, 'v' },
@@ -83,6 +88,10 @@ static void process_args(int argc, char *argv[])
 		case 'h':
 			usage(0);
 			break;
+		case 'i':
+			req = REQUEST_ISLOCKED;
+			req_set++;
+			break;
 		case 'l':
 			req = REQUEST_LOCK;
 			req_set++;
@@ -101,7 +110,7 @@ static void process_args(int argc, char *argv[])
 	}
 
 	if (req_set > 1) {
-		errmsg("cannot specify more than one lock/unlock option");
+		errmsg("cannot specify more than one lock/unlock/islocked option");
 		usage(1);
 	}
 
@@ -139,6 +148,7 @@ int main(int argc, char *argv[])
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
 	int count;
+	int ret;
 
 	process_args(argc, argv);
 
@@ -179,13 +189,25 @@ int main(int argc, char *argv[])
 	case REQUEST_UNLOCK:
 		request = MEMUNLOCK;
 		break;
+	case REQUEST_ISLOCKED:
+		request = MEMISLOCKED;
+		break;
 	default:
 		errmsg_die("unknown request type: %d", req);
 		break;
 	}
-	if (ioctl(fd, request, &mtdLockInfo))
+	ret = ioctl(fd, request, &mtdLockInfo);
+	if (ret < 0)
 		sys_errmsg_die("could not %s device: %s\n",
 				flash_msg[req], dev);
 
+	if (req == REQUEST_ISLOCKED) {
+		printf("Device: %s\n", dev);
+		printf("Start: %#0x\n", mtdLockInfo.start);
+		printf("Len: %#0x\n", mtdLockInfo.length);
+		printf("Lock status: %s\n", ret ? "locked" : "unlocked");
+		printf("Return code: %d\n", ret);
+	}
+
 	return 0;
 }
-- 
2.5.0.457.gab17608
