Received: from na3sys009aog104.obsmtp.com ([74.125.149.73])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRlnp-0004bd-9n
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 13:49:42 +0000
Received: by mail-gx0-f179.google.com with SMTP id 1so2546222gxk.38
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 06:49:39 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mkfs.ubifs: trivial: 2.6.40 -> 3.0
Date: Wed,  1 Jun 2011 09:49:36 -0400
Message-Id: <1306936176-24533-1-git-send-email-bengardiner@nanometrics.ca>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In commit 04665066ebedb0a31335b525fb5f19df32cb8cfe it was noted that the free
space fixup feature would be available in kernels 2.6.40 or greater. Since
then it has been decided that the release following 2.6.39 will be 3.0.

Replace the instances of 2.6.40 with 3.0.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 mkfs.ubifs/mkfs.ubifs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index e3ccb32..ac3c8d3 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -185,7 +185,7 @@ static const char *helptext =
 "                         mkfs.ubifs use zlib instead of LZO (default 20%)\n"
 "-f, --fanout=NUM         fanout NUM (default: 8)\n"
 "-F, --space-fixup        file-system free space has to be fixed up on first mount\n"
-"                         (requires kernel version 2.6.40 or greater)\n"
+"                         (requires kernel version 3.0 or greater)\n"
 "-k, --keyhash=TYPE       key hash type - \"r5\" or \"test\" (default: \"r5\")\n"
 "-p, --orph-lebs=COUNT    count of erase blocks for orphans (default: 1)\n"
 "-D, --devtable=FILE      use device table FILE\n"
@@ -233,7 +233,7 @@ static const char *helptext =
 "when flashing the image and the second time when UBIFS is mounted and writes useful\n"
 "data there. A proper UBI-aware flasher should skip such NAND pages, though. Note, this\n"
 "flag may make the first mount very slow, because the \"free space fixup\" procedure\n"
-"takes time. This feature is supported by the Linux kernel starting from version 2.6.40.\n";
+"takes time. This feature is supported by the Linux kernel starting from version 3.0.\n";
 
 /**
  * make_path - make a path name from a directory and a name.
-- 
1.7.4.1
