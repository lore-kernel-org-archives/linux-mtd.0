Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMnw5-0005pY-JC
	for linux-mtd@lists.infradead.org; Wed, 18 May 2011 21:05:42 +0000
Received: by mail-yw0-f44.google.com with SMTP id 31so983109ywp.17
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2011 14:05:36 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mkfs.ubifs: free-space-fixup: note supported kernels
Date: Wed, 18 May 2011 16:57:23 -0400
Message-Id: <1305752243-4095-1-git-send-email-bengardiner@nanometrics.ca>
In-Reply-To: <1305147748-13632-1-git-send-email-mlcreech@gmail.com>
References: <1305147748-13632-1-git-send-email-mlcreech@gmail.com>
Cc: linux-mtd@lists.infradead.org, "Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The free space fixup flag will only have an action taken on up-to-date
kernels.

Note in the help text and comment that kernel release 2.6.39 is required
for the free space fixup to be performed.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Matthew L. Creech <mlcreech@gmail.com>

---
 mkfs.ubifs/mkfs.ubifs.c  |    4 +++-
 mkfs.ubifs/ubifs-media.h |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 96e17a3..f4cf09d 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -184,7 +184,9 @@ static const char *helptext =
 "                         how many percent better zlib should compress to make\n"
 "                         mkfs.ubifs use zlib instead of LZO (default 20%)\n"
 "-f, --fanout=NUM         fanout NUM (default: 8)\n"
-"-F, --space-fixup        fixup free space on first mount (needed for some NANDs)\n"
+"-F, --space-fixup        fixup free space on first mount (needed for some NANDs;\n"
+"                         the free space fixup will be performed only by kernel\n"
+"                         releases 2.6.39 or greater)\n"
 "-k, --keyhash=TYPE       key hash type - \"r5\" or \"test\" (default: \"r5\")\n"
 "-p, --orph-lebs=COUNT    count of erase blocks for orphans (default: 1)\n"
 "-D, --devtable=FILE      use device table FILE\n"
diff --git a/mkfs.ubifs/ubifs-media.h b/mkfs.ubifs/ubifs-media.h
index fe62d0e..a710589 100644
--- a/mkfs.ubifs/ubifs-media.h
+++ b/mkfs.ubifs/ubifs-media.h
@@ -374,6 +374,8 @@ enum {
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
  * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
+ *                        the free space fixup will be performed only by kernel
+ *                        releases 2.6.39 or greater.
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
-- 
1.7.4.1
