Received: from smtp17.mail.ru ([94.100.176.154])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WczVx-0006Vp-NO
 for linux-mtd@lists.infradead.org; Wed, 23 Apr 2014 15:55:14 +0000
Message-ID: <5357E248.20109@list.ru>
Date: Wed, 23 Apr 2014 19:54:48 +0400
From: Stas Sergeev <stsp@list.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] nandmarkblk: erase block before marking bad
References: <5357D808.5070101@list.ru>
In-Reply-To: <5357D808.5070101@list.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Stas Sergeev <stsp@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add ability to erase blocks before marking, and an option to
not do that.

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 nandmarkblk.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/nandmarkblk.c b/nandmarkblk.c
index 127219c..e5efb26 100644
--- a/nandmarkblk.c
+++ b/nandmarkblk.c
@@ -29,6 +29,7 @@ static void display_help(int status)
 "Writes to the specified MTD device.\n"
 "\n"
 "  -b num, --markbad=num   Mark block bad\n"
+"  -n  --noerase           Don't erase block before marking it bad\n"
 "  -q, --quiet             Don't display progress messages\n"
 "  -h, --help              Display this help and exit\n"
 "      --version           Output version information and exit\n"
@@ -54,6 +55,7 @@ static const char    *mtd_device;
 static bool        quiet = false;
 static int        markbad = -1;
 static int        markgood = -1;
+static bool        noerase = false;
 
 static void process_options(int argc, char * const argv[])
 {
@@ -61,13 +63,14 @@ static void process_options(int argc, char * const
argv[])
 
     for (;;) {
         int option_index = 0;
-        static const char short_options[] = "vhb:g:q";
+        static const char short_options[] = "vhb:g:nq";
         static const struct option long_options[] = {
             /* Order of these args with val==0 matters; see
option_index. */
             {"version", no_argument, 0, 'v'},
             {"help", no_argument, 0, 'h'},
             {"markbad", required_argument, 0, 'b'},
             {"markgood", required_argument, 0, 'g'},
+            {"noerase", no_argument, 0, 'n'},
             {"quiet", no_argument, 0, 'q'},
             {0, 0, 0, 0},
         };
@@ -90,6 +93,9 @@ static void process_options(int argc, char * const argv[])
         case 'b':
             markbad = simple_strtoll(optarg, &error);
             break;
+        case 'n':
+            noerase = true;
+            break;
         case 'h':
             display_help(EXIT_SUCCESS);
             break;
@@ -132,9 +138,15 @@ int main(int argc, char * const argv[])
     if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
         errmsg_die("mtd_get_dev_info failed");
 
-    if (markbad != -1 && mtd_mark_bad(&mtd, fd, markbad)) {
-        sys_errmsg("%s: MTD Mark bad block failure", mtd_device);
-        goto closeall;
+    if (markbad != -1) {
+        if (!noerase && mtd_erase(mtd_desc, &mtd, fd, markbad) != 0) {
+            sys_errmsg("%s: MTD Erase failure", mtd_device);
+            goto closeall;
+        }
+        if (mtd_mark_bad(&mtd, fd, markbad)) {
+            sys_errmsg("%s: MTD Mark bad block failure", mtd_device);
+            goto closeall;
+        }
     }
 
     if (markgood != -1) {
-- 
1.7.11.7
