Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TO5fx-0001TI-WA
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 11:51:12 +0000
Subject: [PATCH] mtd: mkfs.ubifs: Improve error handling of is_contained()
From: Marcus Prebble <marcus.prebble@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: multipart/mixed; boundary="=-TkMpzh3UxBfLprSWL/Gd"
Date: Tue, 16 Oct 2012 13:51:01 +0200
Message-ID: <1350388261.25368.92.camel@lnxprebble2.se.axis.com>
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-TkMpzh3UxBfLprSWL/Gd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

mtd: mtd-utils/mkfs.ubifs: Improve error handling of is_contained()

The is_contained() function returns -1 if an error occurs when
canonicalizing the output file path/root directory. This resulted in the
confusing error message 'Error: The output file cannot be in the UBIFS
root' when specifying a non-existent directory for the output.
This patch changes the error handling to display a different error
message for the case when is_contained() returns -1.
Additionally it frees all memory allocated by is_contained().

Signed-off-by: Marcus Prebble <marcus.prebble@axis.com>



--=-TkMpzh3UxBfLprSWL/Gd
Content-Disposition: attachment;
	filename="0001-mkfs.ubifs-is-contained-err-handling.patch"
Content-Type: text/x-patch;
	name="0001-mkfs.ubifs-is-contained-err-handling.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/mtd-utils/mkfs.ubifs/mkfs.ubifs.c b/mtd-utils/mkfs.ubifs/mkfs.ubifs.c
index a361df9..24554de 100644
--- a/mtd-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/mtd-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -252,7 +252,10 @@ static char *make_path(const char *dir, const char *name)
  */
 static int is_contained(const char *file, const char *dir)
 {
-	char *file_base, *copy, *real_file, *real_dir, *p;
+	char *real_file = NULL;
+	char *real_dir = NULL;
+	char *file_base, *copy;
+	int ret = -1;
 
 	/* Make a copy of the file path because 'dirname()' can modify it */
 	copy = strdup(file);
@@ -262,31 +265,29 @@ static int is_contained(const char *file, const char *dir)
 
 	/* Turn the paths into the canonical form */
 	real_file = malloc(PATH_MAX);
-	if (!real_file) {
-		free(copy);
-		return -1;
-	}
+	if (!real_file)
+		goto out_free;
 
 	real_dir = malloc(PATH_MAX);
-	if (!real_dir) {
-		free(real_file);
-		free(copy);
-		return -1;
-	}
+	if (!real_dir)
+		goto out_free;
+
 	if (!realpath(file_base, real_file)) {
-		perror("realpath");
-		return -1;
+		perror("Could not canonicalize file path");
+		goto out_free;
 	}
 	if (!realpath(dir, real_dir)) {
-		perror("realpath");
-		return -1;
+		perror("Could not canonicalize directory");
+		goto out_free;
 	}
 
-	p = strstr(real_file, real_dir);
-	free(real_dir);
-	free(real_file);
+	ret = !!strstr(real_file, real_dir);
+
+out_free:
 	free(copy);
-	return !!p;
+	free(real_file);
+	free(real_dir);
+	return ret;
 }
 
 /**
@@ -346,9 +347,13 @@ static int validate_options(void)
 
 	if (!output)
 		return err_msg("no output file or UBI volume specified");
-	if (root && is_contained(output, root))
-		return err_msg("output file cannot be in the UBIFS root "
-			       "directory");
+	if (root) {
+		if ((tmp = is_contained(output, root)) < 0)
+			return err_msg("failed to perform output file root check");
+		else if (tmp)
+			return err_msg("output file cannot be in the UBIFS root "
+			               "directory");
+	}
 	if (!is_power_of_2(c->min_io_size))
 		return err_msg("min. I/O unit size should be power of 2");
 	if (c->leb_size < c->min_io_size)

--=-TkMpzh3UxBfLprSWL/Gd--
