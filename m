Received: from mtagate1.uk.ibm.com ([195.212.29.134])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Icgj5-000135-Vk
	for linux-mtd@lists.infradead.org; Tue, 02 Oct 2007 13:19:52 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate1.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l92CIj7k159806
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 12:18:45 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l92CIiUu2973912
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 13:18:44 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l92CISXZ032678
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 13:18:28 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/4 try3] ubi-utils: migrate ubimirror
Date: Tue, 2 Oct 2007 14:18:17 +0200
References: <200710021416.02621.alexs@linux.vnet.ibm.com>
In-Reply-To: <200710021416.02621.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710021418.17660.alexs@linux.vnet.ibm.com>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Migrate ubimirror to the new libubi.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/Makefile           |    2 -
 ubi-utils/src/libubimirror.c |   51 ++++++++++++++++++++++++++++++-------------
 ubi-utils/src/ubimirror.c    |    3 +-
 3 files changed, 39 insertions(+), 17 deletions(-)

Index: mtd-utils/ubi-utils/Makefile
===================================================================
--- mtd-utils.orig/ubi-utils/Makefile	2007-10-02 13:49:01.000000000 +0200
+++ mtd-utils/ubi-utils/Makefile	2007-10-02 13:51:51.000000000 +0200
@@ -51,7 +51,7 @@
 	$(CC) $(LDFLAGS) -o $@ $^
 
 ubimirror: ubimirror.o error.o libubimirror.o bootenv.o hashmap.o \
-		libubiold.o libubiold_sysfs.o crc32.o
+		libubi.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 nand2bin: nand2bin.o nandecc.o nandcorr.o
Index: mtd-utils/ubi-utils/src/libubimirror.c
===================================================================
--- mtd-utils.orig/ubi-utils/src/libubimirror.c	2007-10-02 12:19:11.000000000 +0200
+++ mtd-utils/ubi-utils/src/libubimirror.c	2007-10-02 13:52:23.000000000 +0200
@@ -20,13 +20,17 @@
 #include <errno.h>
 #include <unistd.h>
 #include <memory.h>
+#include <limits.h>
 #include <fcntl.h>
 
-#include <libubiold.h>
+#include <libubi.h>
 #include "ubimirror.h"
 
 #define COMPARE_BUF_SIZE    (128 * 1024)
 
+#define DEFAULT_DEV_PATTERN    "/dev/ubi%d"
+#define DEFAULT_VOL_PATTERN    "/dev/ubi%d_%d"
+
 #define EBUF(fmt...) do {			\
 	snprintf(err_buf, err_buf_size, fmt);	\
 } while (0)
@@ -125,14 +129,26 @@
 	return rc;
 }
 
-static int copy_files(int fd_in, int fd_out)
+int vol_get_used_bytes(int vol_fd, unsigned long long *bytes)
+{
+	off_t res;
+
+	res = lseek(vol_fd, 0, SEEK_END);
+	if (res == (off_t)-1)
+		return -1;
+	*bytes = (unsigned long long) res;
+	res = lseek(vol_fd, 0, SEEK_SET);
+	return res == (off_t)-1 ? -1 : 0;
+}
+
+static int copy_files(libubi_t ulib, int fd_in, int fd_out)
 {
 	unsigned char buf_a[COMPARE_BUF_SIZE];
 	ssize_t len_a, len_b;
 	unsigned long long update_size, copied;
 
-	if (ubi_vol_get_used_bytes(fd_in, &update_size) == -1 ||
-	    ubi_vol_update(fd_out, update_size) == -1)
+	if (vol_get_used_bytes(fd_in, &update_size) == -1 ||
+	    ubi_update_start(ulib, fd_out, update_size) == -1)
 		return update_error;
 	for (copied = 0; copied < update_size; copied += len_b ) {
 		len_a = fill_buffer(fd_in, buf_a, sizeof(buf_a));
@@ -152,7 +168,8 @@
 {
 	int rc = 0;
 	uint32_t src_id;
-	ubi_lib_t ulib = NULL;
+	char path[PATH_MAX];
+	libubi_t ulib;
 	int fd_in = -1, i = 0, fd_out = -1;
 
 	if (ids_size == 0)
@@ -165,11 +182,13 @@
 		src_id = ids[seqnum];
 	}
 
-	rc = ubi_open(&ulib);
-	if (rc != 0)
+	ulib = libubi_open();
+	if (ulib == NULL)
 		return ubi_error;
 
-	fd_in = ubi_vol_open(ulib, devno, src_id, O_RDONLY);
+	snprintf(path, PATH_MAX, DEFAULT_VOL_PATTERN, devno, src_id);
+
+	fd_in = open(path, O_RDONLY);
 	if (fd_in == -1) {
 		EBUF("open error source volume %d", ids[i]);
 		rc = open_error;
@@ -180,8 +199,10 @@
 		if (ids[i] == src_id)		/* skip self-mirror */
 			continue;
 
-		fd_out = ubi_vol_open(ulib, devno, ids[i], O_RDWR);
-		if (fd_out == -1){
+		snprintf(path, PATH_MAX, DEFAULT_VOL_PATTERN, devno, ids[i]);
+
+		fd_out = open(path, O_RDWR);
+		if (fd_out < 0){
 			EBUF("open error destination volume %d", ids[i]);
 			rc = open_error;
 			goto err;
@@ -191,14 +212,14 @@
 			EBUF("compare error volume %d and %d", src_id, ids[i]);
 			goto err;
 		} else if (rc == compare_different) {
-			rc = copy_files(fd_in, fd_out);
+			rc = copy_files(ulib, fd_in, fd_out);
 			if (rc != 0) {
 				EBUF("mirror error volume %d to %d", src_id,
 						ids[i]);
 				goto err;
 			}
 		}
-		if ((rc = ubi_vol_close(fd_out)) == -1) {
+		if ((rc = close(fd_out)) == -1) {
 			EBUF("close error volume %d", ids[i]);
 			rc = close_error;
 			goto err;
@@ -207,10 +228,10 @@
 	}
 err:
 	if (fd_out != -1)
-		ubi_vol_close(fd_out);
+		close(fd_out);
 	if (fd_in != -1)
-		ubi_vol_close(fd_in);
+		close(fd_in);
 	if (ulib != NULL)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 	return rc;
 }
Index: mtd-utils/ubi-utils/src/ubimirror.c
===================================================================
--- mtd-utils.orig/ubi-utils/src/ubimirror.c	2007-10-02 12:19:11.000000000 +0200
+++ mtd-utils/ubi-utils/src/ubimirror.c	2007-10-02 13:51:51.000000000 +0200
@@ -19,6 +19,7 @@
  *
  * 1.2 Removed argp because we want to use uClibc.
  * 1.3 Minor cleanups
+ * 1.4 Migrated to new libubi
  */
 
 #include <stdio.h>
@@ -35,7 +36,7 @@
 #include "example_ubi.h"
 #include "ubimirror.h"
 
-#define PROGRAM_VERSION "1.3"
+#define PROGRAM_VERSION "1.4"
 
 typedef enum action_t {
 	ACT_NORMAL = 0,
