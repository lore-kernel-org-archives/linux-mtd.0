Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EBFC00145
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4r0UReDOHzVKArHlChOlQE11aJthV3X1kUT1ek0Q488=; b=BLZA78O89Pfh5Y
	m3AOLeMmfshQ4VRlYWNLr1SZggaKH351ml7mmi535JXuQB+cGMqVoLuehBfw1baZLPa9WjciUdC3q
	7W61Uj7VSk9Rm4gKkxvzGvq4u7BxjPnWNrTKw3c+4/VNCsLl5p0boDgLe/wYOnlkGmkhp9y8QqOnj
	4H10I+1GdXFWwVJPSGTEGZc2fibIu5ijldXJGMaqeDVmOk9hRKGNgtk1jQrc+zrk47JHqAY6yPHEY
	cR0MOZ56uOfUCjwWj3zMuzB7310ptritZme7ZlXlbgZlr2nE7ulqvQx4v0RM//53T69FSlLdcDaxy
	c7WmKMixbRD3d/GIjRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n8I-003Ocq-Ew; Mon, 12 Dec 2022 18:02:30 +0000
Received: from mx0b-00105401.pphosted.com ([67.231.152.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n8C-003OWu-N2
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 18:02:27 +0000
Received: from pps.filterd (m0074334.ppops.net [127.0.0.1])
	by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2BCHxEmD004751;
	Mon, 12 Dec 2022 18:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=GuNYFGyH9Nlp3LquvN8+j/Ql/o5oRPsruOOvfPeIuGo=;
 b=bqCLWO7niY2q/dBNnyp2Zsh91XwzGsuXNSf+ecwFX2sHPtywS+YAr0IFECsoME/zzVTo
 roL5OPEu/u6AKVsIxHqpAMEpcVYlcsCYgzIFsy+1JDB8dIozLwFnfT37EMF1Kezz3/Ct
 zDvw0ZQihTK9vYX2Ge8LQmScvKQj0IxDmSIx5lmZZI8cngXmEoL0ERbDMnNz2a/ub2fN
 P5fIKEXCuwW6s9Q+pGlhDAvJ/lbzqx3xUPSzm+3OZPWROJHHD+YsPHOzgxEolvNkKPgw
 3+77MJrKTq2XHXswBJZzHqgcBb63/b4RD5BB9DsOb0xKjDkeQhJjk8i5LrjEMDEcY3Qq mA== 
Received: from xmnpv38.utc.com ([167.17.239.12])
	by mx0b-00105401.pphosted.com with ESMTP id 3md445pdsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 18:02:15 +0000
Received: from qusnwafg.utcapp.com (qusnwafg.utcapp.com [10.161.48.103])
	by xmnpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCI2EOq129612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 18:02:14 GMT
Received: from dtulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwafg.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCI2EA5014040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 12 Dec 2022 18:02:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id E94802006C;
	Mon, 12 Dec 2022 12:02:13 -0600 (CST)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 2/2] mtd-utils: Add new syntax to get devices by name
Date: Mon, 12 Dec 2022 12:01:58 -0600
Message-Id: <20221212180158.57833-3-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221212180158.57833-1-brandon.maier@collins.com>
References: <20221212180158.57833-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ESrpmErtG61EJVU6A9BykAKXoPCtgVlR
X-Proofpoint-ORIG-GUID: ESrpmErtG61EJVU6A9BykAKXoPCtgVlR
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1011 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_100224_927869_96FA91B7 
X-CRM114-Status: GOOD (  33.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This introduces a new feature to the MTD command line utilities that
allows MTD devices to be referenced by name instead of device node. For
example this looks like:

> # Display info for the MTD device with name "data"
> mtdinfo mtd:data
> # Copy file to MTD device with name "data"
> flashcp /my/file mtd:data

This follows the syntax supported by the kernel which allows MTD
device's to be mounted by name[1].

Add the function mtd_find_dev_node() that accepts an MTD "identifier"
and returns the MTD's device node. The function accepts a string
starting with "mtd:" which it treats as the MTD's name. It then attempts
to search for the MTD, and if found maps it back to the /dev/mtdX device
node. If the string does not start with "mtd:", then assume it's the old
style and refers directly to a MTD device node.

The function is then hooked into existing tools like flashcp, mtdinfo,
flash_unlock, etc. To load in the new MTD parsing code in a consistent
way across programs.

[1] http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 include/common.h                 |  1 +
 lib/common.c                     | 46 ++++++++++++++++++++++++++++++++
 misc-utils/Makemodule.am         |  5 ++++
 misc-utils/flash_erase.c         |  6 ++++-
 misc-utils/flash_unlock.c        |  9 ++++++-
 misc-utils/flashcp.c             |  7 +++--
 misc-utils/mtd_debug.c           |  7 ++++-
 misc-utils/mtdpart.c             |  7 ++++-
 tests/mtd-tests/flash_readtest.c | 10 ++++---
 tests/mtd-tests/flash_speed.c    | 10 ++++---
 tests/mtd-tests/flash_stress.c   | 10 ++++---
 tests/mtd-tests/flash_torture.c  | 10 ++++---
 ubi-utils/mtdinfo.c              | 13 ++++++---
 13 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/include/common.h b/include/common.h
index 31b6cd1..303d30d 100644
--- a/include/common.h
+++ b/include/common.h
@@ -236,6 +236,7 @@ do { \
 long long util_get_bytes(const char *str);
 void util_print_bytes(long long bytes, int bracket);
 int util_srand(void);
+char *mtd_find_dev_node(const char *id);
 
 /*
  * The following helpers are here to avoid compiler complaints about unchecked
diff --git a/lib/common.c b/lib/common.c
index 8041878..e278593 100644
--- a/lib/common.c
+++ b/lib/common.c
@@ -33,6 +33,9 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include "common.h"
+#include "libmtd.h"
+
+#define MTD_DEV_PATT  "/dev/mtd%d"
 
 /**
  * get_multiplier - convert size specifier to an integer multiplier.
@@ -162,3 +165,46 @@ int util_srand(void)
 	srand(seed);
 	return 0;
 }
+
+/**
+ * mtd_find_dev_node - Find the device node for an MTD
+ * @id:  Identifier for the MTD. this can be the device node itself, or
+ *       "mtd:<name>" to look up MTD by name
+ *
+ * This is a helper function to convert MTD device identifiers into their
+ * device node.
+ *
+ * Returns a pointer to a string containing the device node that must be
+ * free'd, or NULL on failure.
+ */
+char *mtd_find_dev_node(const char *id)
+{
+	struct mtd_dev_info info;
+	struct libmtd_t *lib_mtd;
+	char *node;
+	int ret;
+
+	if (strncmp(id, "mtd:", 4)) {
+		/* Assume @id is the device node */
+		return strdup(id);
+	}
+
+	/* Search for MTD matching name */
+	id += 4;
+
+	lib_mtd = libmtd_open();
+	if (!lib_mtd)
+		return NULL;
+
+	ret = mtd_get_dev_info2(lib_mtd, id, &info);
+	libmtd_close(lib_mtd);
+	if (ret < 0)
+		return NULL;
+
+	node = malloc(strlen(MTD_DEV_PATT) + 20);
+	if (!node)
+		return NULL;
+
+	sprintf(node, MTD_DEV_PATT, info.mtd_num);
+	return node;
+}
diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
index bc69b1c..1ce1a68 100644
--- a/misc-utils/Makemodule.am
+++ b/misc-utils/Makemodule.am
@@ -7,8 +7,10 @@ ftl_check_SOURCES = misc-utils/ftl_check.c include/mtd_swab.h
 ftl_check_SOURCES += include/mtd/ftl-user.h
 
 mtd_debug_SOURCES = misc-utils/mtd_debug.c
+mtd_debug_LDADD = libmtd.a
 
 mtdpart_SOURCES = misc-utils/mtdpart.c
+mtdpart_LDADD = libmtd.a
 
 docfdisk_SOURCES = misc-utils/docfdisk.c include/mtd_swab.h
 docfdisk_SOURCES += include/mtd/inftl-user.h include/mtd/ftl-user.h
@@ -23,8 +25,10 @@ fectest_SOURCES = misc-utils/fectest.c misc-utils/mcast_image.h
 fectest_LDADD = libmtd.a
 
 flash_lock_SOURCES = misc-utils/flash_lock.c
+flash_lock_LDADD = libmtd.a
 
 flash_unlock_SOURCES = misc-utils/flash_unlock.c
+flash_unlock_LDADD = libmtd.a
 
 flash_otp_info_SOURCES = misc-utils/flash_otp_info.c
 
@@ -37,6 +41,7 @@ flash_otp_erase_SOURCES = misc-utils/flash_otp_erase.c
 flash_otp_write_SOURCES = misc-utils/flash_otp_write.c
 
 flashcp_SOURCES = misc-utils/flashcp.c
+flashcp_LDADD = libmtd.a
 
 flash_erase_SOURCES = misc-utils/flash_erase.c
 flash_erase_LDADD = libmtd.a
diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 49a880f..000f94a 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -71,6 +71,8 @@ static void display_help (void)
 			"      --silent      same as --quiet\n"
 			"      --help        display this help and exit\n"
 			"      --version     output version information and exit\n",
+			"\n"
+			"  MTD_DEVICE  MTD device node or 'mtd:<name>'\n"
 			PROGRAM_NAME);
 }
 
@@ -169,7 +171,9 @@ int main(int argc, char *argv[])
 	}
 	switch (argc - optind) {
 	case 3:
-		mtd_device = argv[optind];
+		mtd_device = mtd_find_dev_node(argv[optind]);
+		if (!mtd_device)
+			return errmsg("Can't find MTD device %s", argv[optind]);
 		start = simple_strtoull(argv[optind + 1], &error);
 		eb_cnt = simple_strtoul(argv[optind + 2], &error);
 		break;
diff --git a/misc-utils/flash_unlock.c b/misc-utils/flash_unlock.c
index fbbfa51..fa5decb 100644
--- a/misc-utils/flash_unlock.c
+++ b/misc-utils/flash_unlock.c
@@ -51,6 +51,8 @@ static NORETURN void usage(int status)
 		" -l         --lock              Lock a region of flash\n"
 		" -u         --unlock            Unlock a region of flash\n"
 		"\n"
+		" <mtd device>  MTD device node or 'mtd:<name>'\n"
+		"\n"
 		"If offset is not specified, it defaults to 0.\n"
 		"If block count is not specified, it defaults to all blocks.\n"
 		"A block count of -1 means all blocks.\n",
@@ -125,7 +127,12 @@ static void process_args(int argc, char *argv[])
 	}
 
 	/* First non-option argument */
-	dev = argv[arg_idx++];
+	dev = mtd_find_dev_node(argv[arg_idx]);
+	if (!dev) {
+		errmsg("MTD device not found %s", argv[arg_idx]);
+		usage(EXIT_FAILURE);
+	}
+	arg_idx++;
 
 	/* Second non-option argument */
 	if (arg_idx < argc)
diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 2e8d4c1..1411b2d 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -110,7 +110,7 @@ static NORETURN void showusage(bool error)
 			"   -A | --erase-all Erases the whole device regardless of the image size\n"
 			"   -V | --version   Show version information and exit\n"
 			"   <filename>       File which you want to copy to flash\n"
-			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
+			"   <device>         Flash device node or 'mtd:<name>' to write to (e.g. /dev/mtd0, /dev/mtd1, mtd:data, etc.)\n"
 			"\n",
 			PROGRAM_NAME);
 
@@ -275,7 +275,10 @@ int main (int argc,char *argv[])
 		DEBUG("Got filename: %s\n",filename);
 
 		flags |= FLAG_DEVICE;
-		device = argv[optind+1];
+		device = mtd_find_dev_node(argv[optind+1]);
+		if (!device)
+			log_failure("Failed to find device %s\n", argv[optind+1]);
+
 		DEBUG("Got device: %s\n",device);
 	}
 
diff --git a/misc-utils/mtd_debug.c b/misc-utils/mtd_debug.c
index c0b7109..abee5e3 100644
--- a/misc-utils/mtd_debug.c
+++ b/misc-utils/mtd_debug.c
@@ -348,6 +348,7 @@ int main(int argc, char *argv[])
 {
 	int err = 0, fd;
 	int open_flag;
+	char *dev;
 
 	enum {
 		OPT_INFO,
@@ -369,8 +370,12 @@ int main(int argc, char *argv[])
 		showusage();
 
 	/* open device */
+	dev = mtd_find_dev_node(argv[2]);
+	if (!dev)
+		errmsg_die("Failed to find MTD device %s", argv[2]);
+
 	open_flag = (option == OPT_INFO || option == OPT_READ) ? O_RDONLY : O_RDWR;
-	if ((fd = open(argv[2], O_SYNC | open_flag)) < 0)
+	if ((fd = open(dev, O_SYNC | open_flag)) < 0)
 		errmsg_die("open()");
 
 	switch (option) {
diff --git a/misc-utils/mtdpart.c b/misc-utils/mtdpart.c
index c8cd79b..a341148 100644
--- a/misc-utils/mtdpart.c
+++ b/misc-utils/mtdpart.c
@@ -36,6 +36,8 @@ static void display_help(int status)
 "  -h, --help    Display this help and exit\n"
 "  -V, --version Output version information and exit\n"
 "\n"
+"  <MTD_DEVICE>  MTD device node or 'mtd:<name>'\n"
+"\n"
 "START location and SIZE of the partition are in bytes. They should align on\n"
 "eraseblock size. If SIZE is 0 the partition will go to end of MTD device.\n",
 	PROGRAM_NAME
@@ -106,7 +108,10 @@ static void process_options(int argc, char * const argv[])
 		display_help(EXIT_FAILURE);
 
 	const char *s_command = argv[optind++];
-	mtddev = argv[optind++];
+	mtddev = mtd_find_dev_node(argv[optind]);
+	if (!mtddev)
+		errmsg_die("MTD device not found %s", argv[optind]);
+	optind++;
 
 	if (strcmp(s_command, "del") == 0 && (argc - optind) == 1) {
 		const char *s_part_no = argv[optind++];
diff --git a/tests/mtd-tests/flash_readtest.c b/tests/mtd-tests/flash_readtest.c
index b4f4e10..519ff89 100644
--- a/tests/mtd-tests/flash_readtest.c
+++ b/tests/mtd-tests/flash_readtest.c
@@ -125,10 +125,14 @@ static void process_options(int argc, char **argv)
 		}
 	}
 
-	if (optind < argc)
-		mtddev = argv[optind++];
-	else
+	if (optind < argc) {
+		mtddev = mtd_find_dev_node(argv[optind]);
+		if (!mtddev)
+			errmsg_die("Can't find MTD device %s", argv[optind]);
+		optind++;
+	} else {
 		errmsg_die("No device specified!\n");
+	}
 
 	if (optind < argc)
 		usage(EXIT_FAILURE);
diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 0f82047..5721dfb 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -141,10 +141,14 @@ static void process_options(int argc, char **argv)
 		}
 	}
 
-	if (optind < argc)
-		mtddev = argv[optind++];
-	else
+	if (optind < argc) {
+		mtddev = mtd_find_dev_node(argv[optind]);
+		if (!mtddev)
+			errmsg_die("Can't find MTD device %s", argv[optind]);
+		optind++;
+	} else {
 		errmsg_die("No device specified!\n");
+	}
 
 	if (optind < argc)
 		usage(EXIT_FAILURE);
diff --git a/tests/mtd-tests/flash_stress.c b/tests/mtd-tests/flash_stress.c
index b7a0fec..da39e14 100644
--- a/tests/mtd-tests/flash_stress.c
+++ b/tests/mtd-tests/flash_stress.c
@@ -126,10 +126,14 @@ static void process_options(int argc, char **argv)
 		}
 	}
 
-	if (optind < argc)
-		mtddev = argv[optind++];
-	else
+	if (optind < argc) {
+		mtddev = mtd_find_dev_node(argv[optind]);
+		if (!mtddev)
+			errmsg_die("Can't find MTD device %s", argv[optind]);
+		optind++;
+	} else {
 		errmsg_die("No device specified!\n");
+	}
 
 	if (optind < argc)
 		usage(EXIT_FAILURE);
diff --git a/tests/mtd-tests/flash_torture.c b/tests/mtd-tests/flash_torture.c
index 5aad8e0..6363f9e 100644
--- a/tests/mtd-tests/flash_torture.c
+++ b/tests/mtd-tests/flash_torture.c
@@ -144,10 +144,14 @@ static void process_options(int argc, char **argv)
 		}
 	}
 
-	if (optind < argc)
-		mtddev = argv[optind++];
-	else
+	if (optind < argc) {
+		mtddev = mtd_find_dev_node(argv[optind]);
+		if (!mtddev)
+			errmsg_die("Can't find MTD device %s", argv[optind]);
+		optind++;
+	} else {
 		errmsg_die("No device specified!\n");
+	}
 
 	if (optind < argc)
 		usage(EXIT_FAILURE);
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 8bd0fc8..154872d 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -54,7 +54,7 @@ static void display_help(void)
 	printf(
 		"%1$s version %2$s - a tool to print MTD information.\n"
 		"\n"
-		"Usage: %1$s <MTD node file path> [--map | -M] [--ubi-info | -u]\n"
+		"Usage: %1$s <mtd device> [--map | -M] [--ubi-info | -u]\n"
 		"       %1$s --all [--ubi-info | -u]\n"
 		"       %1$s [--help | --version]\n"
 		"\n"
@@ -68,6 +68,8 @@ static void display_help(void)
 		"-h, --help                      print help message\n"
 		"-V, --version                   print program version\n"
 		"\n"
+		"<mtd device>  MTD device node or 'mtd:<name>'\n"
+		"\n"
 		"Examples:\n"
 		"  %1$s /dev/mtd0             print information MTD device /dev/mtd0\n"
 		"  %1$s /dev/mtd0 -u          print information MTD device /dev/mtd0\n"
@@ -124,10 +126,13 @@ static int parse_opt(int argc, char * const argv[])
 		}
 	}
 
-	if (optind == argc - 1)
-		args.node = argv[optind];
-	else if (optind < argc)
+	if (optind == argc - 1) {
+		args.node = mtd_find_dev_node(argv[optind]);
+		if (!args.node)
+			return errmsg("Failed to find MTD device %s", argv[optind]);
+	} else if (optind < argc) {
 		return errmsg("more then one MTD device specified (use -h for help)");
+	}
 
 	if (args.all && args.node)
 		args.node = NULL;
-- 
2.38.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
