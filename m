Received: from mail-qa0-f50.google.com ([209.85.216.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRjKk-0008HL-Ia
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 14:57:23 +0000
Received: by mail-qa0-f50.google.com with SMTP id cm18so17111017qab.23
 for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2014 07:56:59 -0700 (PDT)
From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] libmtd: fix mtd_dev_present return value on legacy systems
Date: Wed, 10 Sep 2014 11:56:40 -0300
Message-Id: <1410361000-4821-1-git-send-email-guido@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Ezequiel=20Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On legacy systems, if "/proc/mtd" doesn't exist or gives a read error,
mtd_dev_present returns -1 (since it calls legacy_dev_present), contrary
to what's specified in the header file.

This causes checks like

  if (mtd_dev_present(n)) {
    ...
  }

to give false positives. Fix this by comparing the return value to 1.

Signed-off-by: Guido Martínez <guido@vanguardiasur.com.ar>
---
 lib/libmtd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 2089373..aff4c8b 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -647,9 +647,9 @@ int mtd_dev_present(libmtd_t desc, int mtd_num) {
 	struct stat st;
 	struct libmtd *lib = (struct libmtd *)desc;
 
-	if (!lib->sysfs_supported)
-		return legacy_dev_present(mtd_num);
-	else {
+	if (!lib->sysfs_supported) {
+		return legacy_dev_present(mtd_num) == 1;
+	} else {
 		char file[strlen(lib->mtd) + 10];
 
 		sprintf(file, lib->mtd, mtd_num);
-- 
2.1.0
