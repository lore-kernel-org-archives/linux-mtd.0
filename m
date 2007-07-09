Received: from mtagate6.de.ibm.com ([195.212.29.155])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I7yzg-0001yb-Bc
	for linux-mtd@lists.infradead.org; Mon, 09 Jul 2007 15:34:04 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id l69JWKf81602372
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2007 19:32:20 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l69JWJUi2171002
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2007 21:32:19 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l69JWJBO024405
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2007 21:32:19 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] Ubi-Utils: add compare feature
Date: Mon, 9 Jul 2007 21:32:02 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707092132.02839.alexs@linux.vnet.ibm.com>
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

Hi,

this is a new feature for pfiflash, called "--compare". It allows the user
to simulate a pfiflash session without actually changing the flash
content. If the flash content is equal to the data in the pfif file,
pfiflash returns zero. A positive value is returned when the flash
content differs from the pfi file, which indicates that an update is
necessary. This feature is useful when a controller mounts an NFS share
during boot and has to determine if a pfi file stored on this share
contains a code update. Modified PDD values are also registered by the
compare feature.

The patch is already usable but does not contain a check for modified
volume type, size or alignment yet. These values need to be read from
sysfs and compared to the values in the pfi file. I'm sending this out
to get comments/reviews on what I've done yet.

So comments are appreciated!

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/src/bootenv.c        |   48 ++++++++
 ubi-utils/src/bootenv.h        |   10 +
 ubi-utils/src/libpfiflash.c    |  234 ++++++++++++++++++++++++++++++++++++-----
 ubi-utils/src/pfiflash.c       |   24 ++--
 ubi-utils/src/pfiflash.h       |    3 
 ubi-utils/src/pfiflash_error.h |    8 +
 6 files changed, 290 insertions(+), 37 deletions(-)

--- mtd-utils.orig/ubi-utils/src/pfiflash.c
+++ mtd-utils/ubi-utils/src/pfiflash.c
@@ -63,6 +63,9 @@ static const char *optionsstr =
 "                             'keep', 'merge' or 'overwrite'.\n"
 "  -r, --raw-flash=<dev>      Flash the raw data. Use the specified mtd device.\n"
 "  -s, --side=<seqnum>        Select the side which shall be updated.\n"
+"  -x, --compare              Only compare on-flash and pfi data, print info if\n"
+"                             an update is neccessary and return appropriate\n"
+"                             error code.\n"
 "\n"
 "  -?, --help                 Give this help list\n"
 "      --usage                Give a short usage message\n"
@@ -72,7 +75,7 @@ static const char *usage =
 "Usage: pfiflash [-cvC?V] [-l <file>] [-p <type>] [-r <dev>] [-s <seqnum>]\n"
 "            [--copyright] [--logfile=<file>] [--verbose] [--complete]\n"
 "            [--pdd-update=<type>] [--raw-flash=<dev>] [--side=<seqnum>]\n"
-"            [--help] [--usage] [--version] [pfifile]\n";
+"            [--compare] [--help] [--usage] [--version] [pfifile]\n";
 
 static const char copyright [] __attribute__((unused)) =
 	"Copyright IBM Corp 2006";
@@ -85,6 +88,7 @@ struct option long_options[] = {
 	{ .name = "pdd-update", .has_arg = 1, .flag = NULL, .val = 'p' },
 	{ .name = "raw-flash", .has_arg = 1, .flag = NULL, .val = 'r' },
 	{ .name = "side", .has_arg = 1, .flag = NULL, .val = 's' },
+	{ .name = "compare", .has_arg = 0, .flag = NULL, .val = 'x' },
 	{ .name = "help", .has_arg = 0, .flag = NULL, .val = '?' },
 	{ .name = "usage", .has_arg = 0, .flag = NULL, .val = 0 },
 	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
@@ -98,6 +102,7 @@ typedef struct myargs {
 
 	pdd_handling_t pdd_handling;
 	int seqnum;
+	int compare;
 	int complete;
 
 	FILE* fp_in;
@@ -180,6 +185,9 @@ parse_opt(int argc, char **argv, myargs 
 						 "and '1'\n", optarg);
 				}
 				break;
+			case 'x':
+				args->compare = 1;
+				break;
 			case 'r':
 				args->raw_dev = optarg;
 				break;
@@ -222,6 +230,7 @@ int main (int argc, char** argv)
 	myargs args = {
 		.verbose    = 0,
 		.seqnum	    = -1,
+		.compare    = 0,
 		.complete   = 0,
 		.logfile    = NULL, /* "/tmp/pfiflash.log", */
 		.pdd_handling = PDD_KEEP,
@@ -239,16 +248,9 @@ int main (int argc, char** argv)
 		goto err;
 	}
 
-	if (!args.raw_dev) {
-		rc = pfiflash(args.fp_in, args.complete, args.seqnum,
-			      args.pdd_handling, err_buf,
-			      PFIFLASH_MAX_ERR_BUF_SIZE);
-	} else {
-		rc = pfiflash_with_raw(args.fp_in, args.complete, args.seqnum,
-			      args.pdd_handling, args.raw_dev, err_buf,
-			      PFIFLASH_MAX_ERR_BUF_SIZE);
-	}
-
+	rc = pfiflash_with_options(args.fp_in, args.complete, args.seqnum,
+			args.compare, args.pdd_handling, args.raw_dev, err_buf,
+			PFIFLASH_MAX_ERR_BUF_SIZE);
 	if (rc != 0) {
 		goto err_fp;
 	}
--- mtd-utils.orig/ubi-utils/src/libpfiflash.c
+++ mtd-utils/ubi-utils/src/libpfiflash.c
@@ -55,6 +55,8 @@
 
 #define __unused __attribute__((unused))
 
+#define COMPARE_BUFFER_SIZE 1024
+
 static const char copyright [] __unused =
 	"Copyright (c) International Business Machines Corp., 2006";
 
@@ -82,6 +84,7 @@ static pdd_func_t pdd_funcs[PDD_HANDLING
 typedef enum ubi_update_process_t {
 	UBI_REMOVE = 0,
 	UBI_WRITE,
+	UBI_COMPARE,
 
+#define COMPARE_BUFFER_SIZE 1024
+
 static const char copyright [] __unused =
 	"Copyright (c) International Business Machines Corp., 2006";
 
@@ -82,6 +84,7 @@ static pdd_func_t pdd_funcs[PDD_HANDLING
 typedef enum ubi_update_process_t {
 	UBI_REMOVE = 0,
 	UBI_WRITE,
+	UBI_COMPARE,
 } ubi_update_process_t;
 
 
@@ -556,6 +559,170 @@ write_normal_volume(int devno, uint32_t 
 	return rc;
 }
 
+static int compare_bootenv(FILE *fp_pfi, FILE **fp_flash, uint32_t ids_size,
+		uint32_t data_size, pdd_func_t pdd_f, char *err_buf,
+		size_t err_buf_size)
+{
+	int rc, warnings = 0;
+	unsigned int i;
+	bootenv_t bootenv_pfi, bootenv_res = NULL, bootenv_flash = NULL;
+
+	rc = bootenv_create(&bootenv_pfi);
+	if (rc != 0) {
+		rc = -PFIFLASH_ERR_BOOTENV_CREATE;
+		goto err;
+	}
+
+	rc = bootenv_create(&bootenv_res);
+	if (rc != 0) {
+		rc = -PFIFLASH_ERR_BOOTENV_CREATE;
+		goto err;
+	}
+
+	rc = bootenv_read(fp_pfi, bootenv_pfi, data_size);
+	if (rc != 0) {
+		rc = -PFIFLASH_ERR_BOOTENV_READ;
+		goto err;
+	}
+
+	for (i = 0; i < ids_size; i++) {
+		rc = bootenv_create(&bootenv_flash);
+		if (rc != 0) {
+			rc = -PFIFLASH_ERR_BOOTENV_CREATE;
+			goto err;
+		}
+
+		rc = bootenv_read(fp_flash[i], bootenv_flash, BOOTENV_MAXSIZE);
+		if (rc != 0) {
+			rc = -PFIFLASH_ERR_BOOTENV_READ;
+			goto err;
+		}
+
+		rc = pdd_f(bootenv_flash, bootenv_pfi, &bootenv_res,
+				&warnings, err_buf, err_buf_size);
+		if (rc != 0) {
+			rc = -PFIFLASH_ERR_PDD_UNKNOWN;
+			goto err;
+		}
+
+		rc = bootenv_compare(bootenv_flash, bootenv_res);
+		if (rc > 0) {
+			rc = -PFIFLASH_CMP_DIFF;
+			goto err;
+		} else if (rc < 0) {
+			rc = -PFIFLASH_ERR_COMPARE;
+			goto err;
+		}
+
+		bootenv_destroy(&bootenv_flash);
+		bootenv_flash = NULL;
+	}
+
+err:
+	if (bootenv_pfi)
+		bootenv_destroy(&bootenv_pfi);
+	if (bootenv_res)
+		bootenv_destroy(&bootenv_res);
+	if (bootenv_flash)
+		bootenv_destroy(&bootenv_flash);
+
+	return rc;
+}
+
+static int compare_data(FILE *fp_pfi, FILE **fp_flash, uint32_t ids_size,
+		uint32_t bytes_left)
+{
+	unsigned int i;
+	size_t read_bytes, rc = 0;
+	char buf_pfi[COMPARE_BUFFER_SIZE];
+	char *buf_flash[ids_size];
+
+	for (i = 0; i < ids_size; i++) {
+		buf_flash[i] = malloc(COMPARE_BUFFER_SIZE);
+		if (!buf_flash[i])
+			return -PFIFLASH_ERR_COMPARE;
+	}
+
+	while (bytes_left) {
+		if (bytes_left > COMPARE_BUFFER_SIZE)
+			read_bytes = COMPARE_BUFFER_SIZE;
+		else
+			read_bytes = bytes_left;
+
+		rc = fread(buf_pfi, 1, read_bytes, fp_pfi);
+		if (rc != read_bytes) {
+			rc = -PFIFLASH_ERR_COMPARE;
+			goto err;
+		}
+
+		for (i = 0; i < ids_size; i++) {
+			rc = fread(buf_flash[i], 1, read_bytes, fp_flash[i]);
+			if (rc != read_bytes) {
+				rc = -PFIFLASH_CMP_DIFF;
+				goto err;
+			}
+
+			rc = memcmp(buf_pfi, buf_flash[i], read_bytes);
+			if (rc != 0) {
+				rc = -PFIFLASH_CMP_DIFF;
+				goto err;
+			}
+		}
+
+		bytes_left -= read_bytes;
+	}
+
+err:
+	for (i = 0; i < ids_size; i++)
+		free(buf_flash[i]);
+
+	return rc;
+}
+
+static int compare_volumes(int devno, pfi_ubi_t u, FILE *fp_pfi,
+		pdd_func_t pdd_f, char *err_buf, size_t err_buf_size)
+{
+	int rc, is_bootenv = 0;
+	unsigned int i;
+	ubi_lib_t ulib = NULL;
+	FILE *fp_flash[u->ids_size];
+
+	rc = ubi_open(&ulib);
+	if (rc != 0) {
+		rc = -PFIFLASH_ERR_UBI_OPEN;
+		goto err;
+	}
+
+	for (i = 0; i < u->ids_size; i++) {
+		if (u->ids[i] == EXAMPLE_BOOTENV_VOL_ID_1 ||
+		    u->ids[i] == EXAMPLE_BOOTENV_VOL_ID_2)
+			is_bootenv = 1;
+
+		fp_flash[i] = ubi_vol_fopen_read(ulib, devno, u->ids[i]);
+		if (fp_flash[i] == NULL) {
+			rc = -PFIFLASH_ERR_UBI_OPEN;
+			goto err;
+		}
+	}
+
+	if (is_bootenv)
+		rc = compare_bootenv(fp_pfi, fp_flash, u->ids_size,
+				u->data_size, pdd_f, err_buf, err_buf_size);
+	else
+		rc = compare_data(fp_pfi, fp_flash, u->ids_size, u->data_size);
+
+err:
+	if (rc < 0)
+		EBUF(PFIFLASH_ERRSTR[-rc]);
+
+	for (i = 0; i < u->ids_size; i++)
+		fclose(fp_flash[i]);
+	if (ulib)
+		ubi_close(&ulib);
+
+	return rc;
+}
+
 static int
 erase_mtd_region(FILE* file_p, int start, int length)
 {
@@ -865,6 +1032,15 @@ process_ubi_volumes(FILE* pfi, int seqnu
 				goto err;
 
 			break;
+		case UBI_COMPARE:
+			rc = compare_volumes(EXAMPLE_UBI_DEVICE, u, pfi, pdd_f,
+					err_buf, err_buf_size);
+			if (rc != 0) {
+				EBUF_PREPEND("compare volume");
+				goto err;
+			}
+
+			break;
 		default:
 			rc = -PFIFLASH_ERR_UBI_UNKNOWN;
 			EBUF(PFIFLASH_ERRSTR[-rc]);
@@ -949,10 +1125,11 @@ mirror_ubi_volumes(uint32_t devno, list_
 
 
 /**
- * pfiflash_with_raw - exposed func to flash memory with a PFI file
+ * pfiflash_with_options - exposed func to flash memory with a PFI file
  * @pfi			PFI data file pointer
  * @complete		flag to erase unmapped volumes
  * @seqnum		sequence number
+ * @compare		flag to compare
  * @pdd_handling	method to handle pdd (keep, merge, overwrite...)
  *
  * Error handling:
@@ -967,7 +1144,7 @@ mirror_ubi_volumes(uint32_t devno, list_
  *	- passes rc, prepends err_buf with contextual aid
  **/
 int
-pfiflash_with_raw(FILE* pfi, int complete, int seqnum,
+pfiflash_with_options(FILE* pfi, int complete, int seqnum, int compare,
 		  pdd_handling_t pdd_handling, const char* rawdev,
 		  char *err_buf, size_t err_buf_size)
 {
@@ -1001,7 +1178,7 @@ pfiflash_with_raw(FILE* pfi, int complet
 		goto err;
 	}
 
-	if (rawdev == NULL)
+	if (rawdev == NULL || compare)
 		rc = skip_raw_volumes(pfi, pfi_raws, err_buf, err_buf_size);
 	else
 		rc = process_raw_volumes(pfi, pfi_raws, rawdev, err_buf,
@@ -1011,7 +1188,7 @@ pfiflash_with_raw(FILE* pfi, int complet
 		goto err;
 	}
 
-	if (complete) {
+	if (complete && !compare) {
 		rc = erase_unmapped_ubi_volumes(EXAMPLE_UBI_DEVICE, pfi_ubis,
 						err_buf, err_buf_size);
 		if (rc != 0) {
@@ -1029,25 +1206,40 @@ pfiflash_with_raw(FILE* pfi, int complet
 		goto err;
 	}
 
-	rc = process_ubi_volumes(pfi, curr_seqnum, pfi_ubis, bootenv, pdd_f,
-				 UBI_REMOVE, err_buf, err_buf_size);
-	if (rc != 0) {
-		EBUF_PREPEND("removing UBI volumes");
-		goto err;
-	}
+	if (!compare) {
+		rc = process_ubi_volumes(pfi, curr_seqnum, pfi_ubis, bootenv,
+				pdd_f, UBI_REMOVE, err_buf, err_buf_size);
+		if (rc != 0) {
+			EBUF_PREPEND("removing UBI volumes");
+			goto err;
+		}
 
-	rc = process_ubi_volumes(pfi, curr_seqnum, pfi_ubis, bootenv, pdd_f,
-				 UBI_WRITE, err_buf, err_buf_size);
-	if  (rc != 0) {
-		EBUF_PREPEND("writing UBI volumes");
-		goto err;
-	}
+		rc = process_ubi_volumes(pfi, curr_seqnum, pfi_ubis, bootenv,
+				pdd_f, UBI_WRITE, err_buf, err_buf_size);
+		if  (rc != 0) {
+			EBUF_PREPEND("writing UBI volumes");
+			goto err;
+		}
 
-	if (seqnum < 0) { /* mirror redundant pairs */
-		rc = mirror_ubi_volumes(EXAMPLE_UBI_DEVICE, pfi_ubis,
+		if (seqnum < 0) { /* mirror redundant pairs */
+			rc = mirror_ubi_volumes(EXAMPLE_UBI_DEVICE, pfi_ubis,
 					err_buf, err_buf_size);
-		if (rc != 0) {
-			EBUF_PREPEND("mirroring UBI volumes");
+			if (rc != 0) {
+				EBUF_PREPEND("mirroring UBI volumes");
+				goto err;
+			}
+		}
+	} else {
+		/* only compare volumes, don't alter the content */
+		rc = process_ubi_volumes(pfi, curr_seqnum, pfi_ubis, bootenv,
+				pdd_f, UBI_COMPARE, err_buf, err_buf_size);
+
+		if (rc == -PFIFLASH_CMP_DIFF)
+			/* update is necessary, return positive value */
+			rc = 1;
+
+		if (rc < 0) {
+			EBUF_PREPEND("comparing UBI volumes");
 			goto err;
 		}
 	}
@@ -1061,7 +1253,7 @@ pfiflash_with_raw(FILE* pfi, int complet
 
 
 /**
- * pfiflash - passes to pfiflash_with_raw
+ * pfiflash - passes to pfiflash_with_options
  * @pfi			PFI data file pointer
  * @complete		flag to erase unmapped volumes
  * @seqnum		sequence number
@@ -1069,8 +1261,8 @@ pfiflash_with_raw(FILE* pfi, int complet
  **/
 int
 pfiflash(FILE* pfi, int complete, int seqnum, pdd_handling_t pdd_handling,
-	 char *err_buf, size_t err_buf_size)
+		char *err_buf, size_t err_buf_size)
 {
-	return pfiflash_with_raw(pfi, complete, seqnum, pdd_handling,
+	return pfiflash_with_options(pfi, complete, seqnum, 0, pdd_handling,
 				 NULL, err_buf, err_buf_size);
 }
--- mtd-utils.orig/ubi-utils/src/pfiflash.h
+++ mtd-utils/ubi-utils/src/pfiflash.h
@@ -48,12 +48,13 @@ typedef enum pdd_handling_t
  * @brief Flashes a PFI file to UBI Device 0.
  * @param complete	[0|1] Do a complete system update.
  * @param seqnum	Index in a redundant group.
+ * @param compare	[0|1] Compare contents.
  * @param pdd_handling	The PDD handling algorithm.
  * @param rawdev	Device to use for raw flashing
  * @param err_buf	An error buffer.
  * @param err_buf_size	Size of the error buffer.
  */
-int pfiflash_with_raw(FILE* pfi, int complete, int seqnum,
+int pfiflash_with_options(FILE* pfi, int complete, int seqnum, int compare,
 		pdd_handling_t pdd_handling, const char* rawdev,
 		char *err_buf, size_t err_buf_size);
 
--- mtd-utils.orig/ubi-utils/src/pfiflash_error.h
+++ mtd-utils/ubi-utils/src/pfiflash_error.h
@@ -42,7 +42,9 @@ enum pfiflash_err {
 	PFIFLASH_ERR_MTD_OPEN,
 	PFIFLASH_ERR_MTD_CLOSE,
 	PFIFLASH_ERR_CRC_CHECK,
-	PFIFLASH_ERR_MTD_ERASE
+	PFIFLASH_ERR_MTD_ERASE,
+	PFIFLASH_ERR_COMPARE,
+	PFIFLASH_CMP_DIFF
 };
 
 const char *const PFIFLASH_ERRSTR[] = {
@@ -65,7 +67,9 @@ const char *const PFIFLASH_ERRSTR[] = {
 	"couldn't open MTD device %s",
 	"couldn't close MTD device %s",
 	"CRC check failed: given=0x%08x, calculated=0x%08x",
-	"couldn't erase raw mtd region"
+	"couldn't erase raw mtd region",
+	"couldn't compare volumes",
+	"on-flash data differ from pfi data, update is neccessary"
 };
 
 #endif /* __PFIFLASH_ERROR_H__ */
--- mtd-utils.orig/ubi-utils/src/bootenv.c
+++ mtd-utils/ubi-utils/src/bootenv.c
@@ -480,6 +480,54 @@ bootenv_write(FILE* fp, bootenv_t env)
 }
 
 int
+bootenv_compare(bootenv_t first, bootenv_t second)
+{
+	int rc;
+	size_t written_first, written_second;
+	char *buf_first, *buf_second;
+
+	if (first == NULL || second == NULL)
+		return -EINVAL;
+
+	buf_first = malloc(BOOTENV_MAXSIZE);
+	if (!buf_first)
+		return -ENOMEM;
+	buf_second = malloc(BOOTENV_MAXSIZE);
+	if (!buf_second) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	rc = fill_output_buffer(first, buf_first, BOOTENV_MAXSIZE,
+			&written_first);
+	if (rc < 0)
+		goto err;
+	rc = fill_output_buffer(second, buf_second, BOOTENV_MAXSIZE,
+			&written_second);
+	if (rc < 0)
+		goto err;
+
+	if (written_first != written_second) {
+		rc = 1;
+		goto err;
+	}
+
+	rc = memcmp(buf_first, buf_second, written_first);
+	if (rc != 0) {
+		rc = 2;
+		goto err;
+	}
+
+err:
+	if (buf_first)
+		free(buf_first);
+	if (buf_second)
+		free(buf_second);
+
+	return rc;
+ * @return 0 if bootenvs are equal
+ * @return < 0 if error
+ * @return > 0 if unequal
+ */
+int bootenv_compare(bootenv_t first, bootenv_t second);
+
+/**
  * @brief Prototype for a PDD handling funtion
  */
 
