Received: from mtagate2.uk.ibm.com ([195.212.29.135])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iaxuu-0008DH-Tm
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 19:16:57 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate2.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l8RIGXVk070906
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 18:16:33 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l8RIGXR83018912
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 19:16:33 +0100
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l8RIGGu1024473
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 19:16:16 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4 try2] ubi-utils: migrate pfiflash
References: <200709271952.06870.alexs@linux.vnet.ibm.com>
In-Reply-To: <200709271952.06870.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709272015.30218.alexs@linux.vnet.ibm.com>
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
Date: Thu, 27 Sep 2007 18:17:18 -0000

Migrate pfiflash to the new libubi.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/Makefile          |    2 
 ubi-utils/src/libpfiflash.c |  141 ++++++++++++++++++++++++++++++--------------
 ubi-utils/src/pfiflash.c    |    3 
 3 files changed, 102 insertions(+), 44 deletions(-)

--- mtd-utils.orig/ubi-utils/Makefile
+++ mtd-utils/ubi-utils/Makefile
@@ -47,7 +47,7 @@ pddcustomize: pddcustomize.o error.o lib
 	$(CC) $(LDFLAGS) -o $@ $^
 
 pfiflash: pfiflash.o libpfiflash.o list.o reader.o error.o libubimirror.o \
-		bootenv.o hashmap.o pfi.o libubiold.o libubiold_sysfs.o crc32.o
+		bootenv.o hashmap.o pfi.o libubi.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 ubimirror: ubimirror.o error.o libubimirror.o bootenv.o hashmap.o \
--- mtd-utils.orig/ubi-utils/src/libpfiflash.c
+++ mtd-utils/ubi-utils/src/libpfiflash.c
@@ -31,12 +31,13 @@
 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <unistd.h>
 #define __USE_GNU
 #include <string.h>
 #include <stdlib.h>
 #include <sys/ioctl.h>
 
-#include <libubiold.h>
+#include <libubi.h>
 #include <pfiflash.h>
 
 #include <mtd/ubi-user.h>	/* FIXME Is this ok here? */
@@ -57,6 +58,10 @@
 
 #define COMPARE_BUFFER_SIZE 2048
 
+#define DEFAULT_DEV_PATTERN    "/dev/ubi%d"
+#define DEFAULT_VOL_PATTERN    "/dev/ubi%d_%d"
+#define MAXPATH          1024
+
 static const char copyright [] ubi_unused =
 	"Copyright International Business Machines Corp., 2006, 2007";
 
@@ -153,7 +158,9 @@ my_ubi_mkvol(int devno, int s, pfi_ubi_t
 	     char *err_buf, size_t err_buf_size)
 {
 	int rc, type;
-	ubi_lib_t ulib;
+	char path[MAXPATH];
+	libubi_t ulib;
+	struct ubi_mkvol_request req;
 
 	rc = 0;
 	ulib = NULL;
@@ -163,8 +170,8 @@ my_ubi_mkvol(int devno, int s, pfi_ubi_t
 		u->ids[s], u->size, u->data_size, u->type, u->alignment,
 		strnlen(u->names[s], PFI_UBI_VOL_NAME_LEN), u->names[s]);
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc]);
 		goto err;
@@ -178,8 +185,15 @@ my_ubi_mkvol(int devno, int s, pfi_ubi_t
 		type = UBI_DYNAMIC_VOLUME;
 	}
 
-	rc = ubi_mkvol(ulib, devno, u->ids[s], type, u->size, u->alignment,
-		       u->names[s]);
+	snprintf(path, MAXPATH, DEFAULT_DEV_PATTERN, devno);
+
+	req.vol_id = u->ids[s];
+	req.alignment = u->alignment;
+	req.bytes = u->size;
+	req.vol_type = type;
+	req.name = u->names[s];
+
+	rc = ubi_mkvol(ulib, path, &req);
 	if (rc != 0) {
 		rc = -PFIFLASH_ERR_UBI_MKVOL;
 		EBUF(PFIFLASH_ERRSTR[-rc], u->ids[s]);
@@ -188,7 +202,7 @@ my_ubi_mkvol(int devno, int s, pfi_ubi_t
 
  err:
 	if (ulib != NULL)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 
 	return rc;
 }
@@ -214,34 +228,41 @@ my_ubi_rmvol(int devno, uint32_t id,
 	     char *err_buf, size_t err_buf_size)
 {
 	int rc, fd;
-	ubi_lib_t ulib;
+	char path[MAXPATH];
+	libubi_t ulib;
 
 	rc = 0;
 	ulib = NULL;
 
 	log_msg("[ ubirmvol id=%d", id);
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
+	snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devno, id);
+
 	/* truncate whether it exist or not */
-	fd = ubi_vol_open(ulib, devno, id, O_RDWR);
-	if (fd == -1)
+	fd = open(path, O_RDWR);
+	if (fd < 0) {
+		libubi_close(ulib);
 		return 0;	/* not existent, return 0 */
+	}
 
-	rc = ubi_vol_update(fd, 0);
-	ubi_vol_close(fd);
+	rc = ubi_update_start(ulib, fd, 0);
+	close(fd);
 	if (rc < 0) {
 		rc = -PFIFLASH_ERR_UBI_VOL_UPDATE;
 		EBUF(PFIFLASH_ERRSTR[-rc], id);
 		goto err;	/* if EBUSY than empty device, continue */
 	}
 
-	rc = ubi_rmvol(ulib, devno, id);
+	snprintf(path, MAXPATH, DEFAULT_DEV_PATTERN, devno);
+
+	rc = ubi_rmvol(ulib, path, id);
 	if (rc != 0) {
 #ifdef DEBUG
 		int rc_old = rc;
@@ -266,7 +287,7 @@ my_ubi_rmvol(int devno, uint32_t id,
 
  err:
 	if (ulib != NULL)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 
 	return rc;
 }
@@ -292,20 +313,23 @@ read_bootenv_volume(int devno, uint32_t 
 {
 	int rc;
 	FILE* fp_in;
-	ubi_lib_t ulib;
+	char path[MAXPATH];
+	libubi_t ulib;
 
 	rc = 0;
 	fp_in = NULL;
 	ulib = NULL;
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
-	fp_in = ubi_vol_fopen_read(ulib, devno, id);
+	snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devno, id);
+
+	fp_in = fopen(path, "r");
 	if (!fp_in) {
 		rc = -PFIFLASH_ERR_UBI_VOL_FOPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc], id);
@@ -326,7 +350,7 @@ read_bootenv_volume(int devno, uint32_t 
 	if (fp_in)
 		fclose(fp_in);
 	if (ulib)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 
 	return rc;
 }
@@ -366,12 +390,13 @@ write_bootenv_volume(int devno, uint32_t
 		     uint32_t pfi_crc,
 		     char *err_buf, size_t err_buf_size)
 {
-	int rc, warnings;
+	int rc, warnings, fd_out;
 	uint32_t crc;
+	char path[MAXPATH];
 	size_t update_size;
 	FILE *fp_out;
 	bootenv_t bootenv_new, bootenv_res;
-	ubi_lib_t ulib;
+	libubi_t ulib;
 
 	rc = 0;
 	warnings = 0;
@@ -393,8 +418,8 @@ write_bootenv_volume(int devno, uint32_t
 	 * 4. Write to FILE*
 	 */
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc]);
 		goto err;
@@ -443,12 +468,26 @@ write_bootenv_volume(int devno, uint32_t
 		goto err;
 	}
 
-	fp_out = ubi_vol_fopen_update(ulib, devno, id, update_size);
+	snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devno, id);
+
+	fd_out = open(path, O_RDWR);
+	if (fd_out < 0) {
+		rc = -PFIFLASH_ERR_UBI_VOL_FOPEN;
+		EBUF(PFIFLASH_ERRSTR[-rc], id);
+		goto err;
+	}
+	fp_out = fdopen(fd_out, "r+");
 	if (!fp_out) {
 		rc = -PFIFLASH_ERR_UBI_VOL_FOPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc], id);
 		goto err;
 	}
+	rc = ubi_update_start(ulib, fd_out, update_size);
+	if (rc < 0) {
+		rc = -PFIFLASH_ERR_UBI_VOL_UPDATE;
+		EBUF(PFIFLASH_ERRSTR[-rc], id);
+		goto err;
+	}
 
 	rc = bootenv_write(fp_out, bootenv_res);
 	if (rc != 0) {
@@ -459,7 +498,7 @@ write_bootenv_volume(int devno, uint32_t
 
  err:
 	if (ulib != NULL)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 	if (bootenv_new != NULL)
 		bootenv_destroy(&bootenv_new);
 	if (bootenv_res != NULL)
@@ -496,11 +535,12 @@ write_normal_volume(int devno, uint32_t 
 		    uint32_t pfi_crc,
 		    char *err_buf, size_t err_buf_size)
 {
-	int rc;
+	int rc, fd_out;
 	uint32_t crc, crc32_table[256];
+	char path[MAXPATH];
 	size_t bytes_left;
 	FILE* fp_out;
-	ubi_lib_t ulib;
+	libubi_t ulib;
 
 	rc = 0;
 	crc = UBI_CRC32_INIT;
@@ -511,19 +551,33 @@ write_normal_volume(int devno, uint32_t 
 	log_msg("[ ubiupdatevol id=%d, update_size=%d fp_in=%p",
 		id, update_size, fp_in);
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
-	fp_out = ubi_vol_fopen_update(ulib, devno, id, update_size);
+	snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devno, id);
+
+	fd_out = open(path, O_RDWR);
+	if (fd_out < 0) {
+		rc = -PFIFLASH_ERR_UBI_VOL_FOPEN;
+		EBUF(PFIFLASH_ERRSTR[-rc], id);
+		goto err;
+	}
+	fp_out = fdopen(fd_out, "r+");
 	if (!fp_out) {
 		rc = -PFIFLASH_ERR_UBI_VOL_FOPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc], id);
 		goto err;
 	}
+	rc = ubi_update_start(ulib, fd_out, update_size);
+	if (rc < 0) {
+		rc = -PFIFLASH_ERR_UBI_VOL_UPDATE;
+		EBUF(PFIFLASH_ERRSTR[-rc], id);
+		goto err;
+	}
 
 	init_crc32_table(crc32_table);
 	while (bytes_left) {
@@ -554,7 +608,7 @@ write_normal_volume(int devno, uint32_t 
 	if (fp_out)
 		fclose(fp_out);
 	if (ulib)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 
 	return rc;
 }
@@ -684,11 +738,12 @@ static int compare_volumes(int devno, pf
 {
 	int rc, is_bootenv = 0;
 	unsigned int i;
-	ubi_lib_t ulib = NULL;
+	char path[MAXPATH];
+	libubi_t ulib = NULL;
 	FILE *fp_flash[u->ids_size];
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		goto err;
 	}
@@ -698,7 +753,9 @@ static int compare_volumes(int devno, pf
 		    u->ids[i] == EXAMPLE_BOOTENV_VOL_ID_2)
 			is_bootenv = 1;
 
-		fp_flash[i] = ubi_vol_fopen_read(ulib, devno, u->ids[i]);
+		snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devno, u->ids[i]);
+
+		fp_flash[i] = fopen(path, "r");
 		if (fp_flash[i] == NULL) {
 			rc = -PFIFLASH_ERR_UBI_OPEN;
 			goto err;
@@ -718,7 +775,7 @@ err:
 	for (i = 0; i < u->ids_size; i++)
 		fclose(fp_flash[i]);
 	if (ulib)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 
 	return rc;
 }
@@ -1070,15 +1127,15 @@ mirror_ubi_volumes(uint32_t devno, list_
 	uint32_t j;
 	list_t ptr;
 	pfi_ubi_t i;
-	ubi_lib_t ulib;
+	libubi_t ulib;
 
 	rc = 0;
 	ulib = NULL;
 
 	log_msg("[ mirror ...");
 
-	rc = ubi_open(&ulib);
-	if (rc != 0) {
+	ulib = libubi_open();
+	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
 		EBUF(PFIFLASH_ERRSTR[-rc]);
 		goto err;
@@ -1118,7 +1175,7 @@ mirror_ubi_volumes(uint32_t devno, list_
 
  err:
 	if (ulib != NULL)
-		ubi_close(&ulib);
+		libubi_close(ulib);
 
 	return rc;
 }
--- mtd-utils.orig/ubi-utils/src/pfiflash.c
+++ mtd-utils/ubi-utils/src/pfiflash.c
@@ -27,6 +27,7 @@
  * 1.3 removed argp parsing to be able to use uClib.
  * 1.4 Minor cleanups.
  * 1.5 Forgot to delete raw block before updating it.
+ * 1.6 Migrated to new libubi.
  */
 
 #include <unistd.h>
@@ -43,7 +44,7 @@
 #include "error.h"
 #include "config.h"
 
-#define PROGRAM_VERSION  "1.5"
+#define PROGRAM_VERSION  "1.6"
 
 static char doc[] = "\nVersion: " PROGRAM_VERSION "\n"
 	"pfiflash - a tool for updating a controller with PFI files.\n";
