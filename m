Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9b3y-0002Za-JM
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 08:01:55 +0000
Date: Mon, 8 Dec 2008 01:02:00 -0700
From: Tom Rini <trini@embeddedalley.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: ubi-utils updates for gcc-4.3.x
Message-ID: <20081208080138.GJ15204@smtp.west.cox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

gcc-4.3.x introduces a number of new warnings (and we use -Werror) for
things like not checking scanf return values and not using explicit
formatting.  Finally, it caught that we were overflowing our own buffer
in unubi.c, so increate the variable size as we want to declare and
clear PATH_MAX + 1, then use only PATH_MAX of the variable.

Signed-off-by: Tom Rini <trini@embeddedalley.com>

diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/src/ubiformat.c
index 05caed9..9c3e0fb 100644
--- a/ubi-utils/new-utils/src/ubiformat.c
+++ b/ubi-utils/new-utils/src/ubiformat.c
@@ -225,7 +225,8 @@ static int want_exit(void)
 
 	while (1) {
 		normsg_cont("continue? (yes/no)  ");
-		scanf("%3s", buf);
+		if (!scanf("%3s", buf))
+			return 1;
 		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
 			return 0;
 		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
@@ -238,7 +239,8 @@ static int answer_is_yes(void)
 	char buf[4];
 
 	while (1) {
-		scanf("%3s", buf);
+		if (!scanf("%3s", buf))
+			return 0;
 		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
 			return 1;
 		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
diff --git a/ubi-utils/src/libpfiflash.c b/ubi-utils/src/libpfiflash.c
index 7e3d3b3..cf18ad3 100644
--- a/ubi-utils/src/libpfiflash.c
+++ b/ubi-utils/src/libpfiflash.c
@@ -136,7 +136,7 @@ skip_raw_volumes(FILE* pfi, list_t pfi_raws,
 	}
 
  err:
-	EBUF(PFIFLASH_ERRSTR[-rc]);
+	EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 	return rc;
 }
 
@@ -173,7 +173,7 @@ my_ubi_mkvol(int devno, int s, pfi_ubi_t u,
 	ulib = libubi_open();
 	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -239,7 +239,7 @@ my_ubi_rmvol(int devno, uint32_t id,
 	ulib = libubi_open();
 	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -323,7 +323,7 @@ read_bootenv_volume(int devno, uint32_t id, bootenv_t bootenv_old,
 	ulib = libubi_open();
 	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -342,7 +342,7 @@ read_bootenv_volume(int devno, uint32_t id, bootenv_t bootenv_old,
 	rc = bootenv_read(fp_in, bootenv_old, BOOTENV_MAXSIZE);
 	if (rc != 0) {
 		rc = -PFIFLASH_ERR_BOOTENV_READ;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -421,7 +421,7 @@ write_bootenv_volume(int devno, uint32_t id, bootenv_t bootenv_old,
 	ulib = libubi_open();
 	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -442,7 +442,7 @@ write_bootenv_volume(int devno, uint32_t id, bootenv_t bootenv_old,
 	rc = bootenv_read_crc(fp_in, bootenv_new, fp_in_size, &crc);
 	if (rc != 0) {
 		rc = -PFIFLASH_ERR_BOOTENV_READ;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	} else if (crc != pfi_crc) {
 		rc = -PFIFLASH_ERR_CRC_CHECK;
@@ -464,7 +464,7 @@ write_bootenv_volume(int devno, uint32_t id, bootenv_t bootenv_old,
 	rc = bootenv_size(bootenv_res, &update_size);
 	if (rc != 0) {
 		rc = -PFIFLASH_ERR_BOOTENV_SIZE;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -554,7 +554,7 @@ write_normal_volume(int devno, uint32_t id, size_t update_size, FILE* fp_in,
 	ulib = libubi_open();
 	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -586,13 +586,13 @@ write_normal_volume(int devno, uint32_t id, size_t update_size, FILE* fp_in,
 			bytes_left : sizeof buf;
 		if (fread(buf, 1, to_rw, fp_in) != to_rw) {
 			rc = -PFIFLASH_ERR_EOF;
-			EBUF(PFIFLASH_ERRSTR[-rc]);
+			EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 			goto err;
 		}
 		crc = clc_crc32(crc32_table, crc, buf, to_rw);
 		if (fwrite(buf, 1, to_rw, fp_out) != to_rw) {
 			rc = -PFIFLASH_ERR_FIO;
-			EBUF(PFIFLASH_ERRSTR[-rc]);
+			EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 			goto err;
 		}
 		bytes_left -= to_rw;
@@ -770,7 +770,7 @@ static int compare_volumes(int devno, pfi_ubi_t u, FILE *fp_pfi,
 
 err:
 	if (rc < 0)
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 
 	for (i = 0; i < u->ids_size; i++)
 		fclose(fp_flash[i]);
@@ -877,11 +877,11 @@ process_raw_volumes(FILE* pfi, list_t pfi_raws, const char* rawdev,
 			int c = fgetc(pfi);
 			if (c == EOF) {
 				rc = -PFIFLASH_ERR_EOF;
-				EBUF(PFIFLASH_ERRSTR[-rc]);
+				EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 				goto err;
 			} else if (ferror(pfi)) {
 				rc = -PFIFLASH_ERR_FIO;
-				EBUF(PFIFLASH_ERRSTR[-rc]);
+				EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 				goto err;
 			}
 			pfi_data[j] = (char)c;
@@ -906,7 +906,7 @@ process_raw_volumes(FILE* pfi, list_t pfi_raws, const char* rawdev,
 		for (j = 0; j < r->starts_size; j++) {
 			rc = erase_mtd_region(mtd, r->starts[j], r->data_size);
 			if (rc) {
-				EBUF(PFIFLASH_ERRSTR[-rc]);
+				EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 				goto err;
 			}
 
@@ -916,7 +916,7 @@ process_raw_volumes(FILE* pfi, list_t pfi_raws, const char* rawdev,
 				if (c == EOF) {
 					fclose(mtd);
 					rc = -PFIFLASH_ERR_EOF;
-					EBUF(PFIFLASH_ERRSTR[-rc]);
+					EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 					goto err;
 				}
 				if ((char)c != pfi_data[k]) {
@@ -1100,7 +1100,7 @@ process_ubi_volumes(FILE* pfi, int seqnum, list_t pfi_ubis,
 			break;
 		default:
 			rc = -PFIFLASH_ERR_UBI_UNKNOWN;
-			EBUF(PFIFLASH_ERRSTR[-rc]);
+			EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 			goto err;
 		}
 	}
@@ -1137,7 +1137,7 @@ mirror_ubi_volumes(uint32_t devno, list_t pfi_ubis,
 	ulib = libubi_open();
 	if (ulib == NULL) {
 		rc = -PFIFLASH_ERR_UBI_OPEN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
@@ -1259,7 +1259,7 @@ pfiflash_with_options(FILE* pfi, int complete, int seqnum, int compare,
 		pdd_f = pdd_funcs[pdd_handling];
 	else {
 		rc = -PFIFLASH_ERR_PDD_UNKNOWN;
-		EBUF(PFIFLASH_ERRSTR[-rc]);
+		EBUF("%s", PFIFLASH_ERRSTR[-rc]);
 		goto err;
 	}
 
diff --git a/ubi-utils/src/unubi.c b/ubi-utils/src/unubi.c
index ebd527c..7d65cfc 100644
--- a/ubi-utils/src/unubi.c
+++ b/ubi-utils/src/unubi.c
@@ -895,7 +895,7 @@ unubi_volumes(FILE* fpin, uint32_t *vols, size_t vc, struct args *a)
 	free(cur);
 
 	if (a->analyze) {
-		char fname[PATH_MAX];
+		char fname[PATH_MAX + 1];
 		FILE *fp;
 
 		unubi_analyze(&head, first, a->odir_path);

-- 
Tom Rini
