From: artem.bityutskiy@intel.com (Artem Bityutskiy)
Date: Fri, 14 Oct 2011 12:31:56 +0300
Subject: [PATCH] UBI: gluebi: remove useless checks
Message-ID: <mailman.189.1318585373.20020.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

drivers/mtd/ubi/gluebi.c +177 gluebi_read(6) warn: unsigned 'len' is never less than zero.
drivers/mtd/ubi/gluebi.c +221 gluebi_write(6) warn: unsigned 'len' is never less than zero.
drivers/mtd/ubi/gluebi.c +270 gluebi_erase(7) warn: unsigned 'instr->len' is never less than zero.

Remove the checks. However, there is an outstanding issue that we can
get huge offset and len which will wrap and pass the check against the
mtd size.

Reported by Dan Carpenter <dan.carpenter@oracle.com>, spotted by smatch.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
---
 drivers/mtd/ubi/gluebi.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 941bc3c..0b13fa2 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -171,10 +171,11 @@ static void gluebi_put_device(struct mtd_info *mtd)
 static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 		       size_t *retlen, unsigned char *buf)
 {
-	int err = 0, lnum, offs, total_read;
+	int err = 0, lnum, offs;
+	size_t total_read;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || from < 0 || from + len > mtd->size)
+	if (from < 0 || from + len > mtd->size)
 		return -EINVAL;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
@@ -215,10 +216,11 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
-	int err = 0, lnum, offs, total_written;
+	size_t total_written;
+	int err = 0, lnum, offs;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || to < 0 || len + to > mtd->size)
+	if (to < 0 || len + to > mtd->size)
 		return -EINVAL;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
@@ -265,9 +267,9 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int err, i, lnum, count;
 	struct gluebi_device *gluebi;
 
-	if (instr->addr < 0 || instr->addr > mtd->size - mtd->erasesize)
+	if (instr->addr > mtd->size - mtd->erasesize)
 		return -EINVAL;
-	if (instr->len < 0 || instr->addr + instr->len > mtd->size)
+	if (instr->addr + instr->len > mtd->size)
 		return -EINVAL;
 	if (mtd_mod_by_ws(instr->addr, mtd) || mtd_mod_by_ws(instr->len, mtd))
 		return -EINVAL;
-- 
1.7.7

-- 
Best Regards,
Artem Bityutskiy
