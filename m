Received: from na3sys009aog109.obsmtp.com ([74.125.149.201])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QN283-0003eE-0K
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 12:15:00 +0000
Received: by mail-yi0-f47.google.com with SMTP id 13so1162921yia.34
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 05:14:53 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] mkfs.ubifs: free-space-fixup: note supported kernels
Date: Thu, 19 May 2011 08:14:51 -0400
Message-Id: <1305807291-12774-1-git-send-email-bengardiner@nanometrics.ca>
In-Reply-To: <1305784599.2630.41.camel@localhost>
References: <1305784599.2630.41.camel@localhost>
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

Note in the help text and comment that kernel release 2.6.40 is required
for the free space fixup to be performed.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Matthew L. Creech <mlcreech@gmail.com>

---
Changes since v1:
 * updated references to the kernel release to reflect the reality that
   2.6.39 is a done deal

---
 mkfs.ubifs/mkfs.ubifs.c  |    4 +++-
 mkfs.ubifs/ubifs-media.h |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 96e17a3..1ce1db3 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -184,7 +184,9 @@ static const char *helptext =
 "                         how many percent better zlib should compress to make\n"
 "                         mkfs.ubifs use zlib instead of LZO (default 20%)\n"
 "-f, --fanout=NUM         fanout NUM (default: 8)\n"
-"-F, --space-fixup        fixup free space on first mount (needed for some NANDs)\n"
+"-F, --space-fixup        fixup free space on first mount (needed for some NANDs;\n"
+"                         the free space fixup will be performed only by kernel\n"
+"                         releases 2.6.40 or greater)\n"
 "-k, --keyhash=TYPE       key hash type - \"r5\" or \"test\" (default: \"r5\")\n"
 "-p, --orph-lebs=COUNT    count of erase blocks for orphans (default: 1)\n"
 "-D, --devtable=FILE      use device table FILE\n"
diff --git a/mkfs.ubifs/ubifs-media.h b/mkfs.ubifs/ubifs-media.h
index fe62d0e..16683de 100644
--- a/mkfs.ubifs/ubifs-media.h
+++ b/mkfs.ubifs/ubifs-media.h
@@ -374,6 +374,8 @@ enum {
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
  * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
+ *                        the free space fixup will be performed only by kernel
+ *                        releases 2.6.40 or greater.
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
-- 
1.7.4.1
