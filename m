Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsLbO-0004kO-JV
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 19:09:43 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] UBIFS: Use ubi_open_volume_path() in open_ubi()
Date: Mon, 28 Sep 2009 21:10:12 +0200
Message-Id: <1254165012-10798-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1254165012-10798-1-git-send-email-corentincj@iksaif.net>
References: <1254165012-10798-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is needed to use $ mount /dev/ubi0_0 /mnt/nand
You'll also need a recent libblkid with UBI and UBIFS
support.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 fs/ubifs/super.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7e2b3d4..146289b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1847,6 +1847,7 @@ const struct super_operations ubifs_super_operations = {
  * o ubiY      - UBI device number 0, volume Y;
  * o ubiX:NAME - mount UBI device X, volume with name NAME;
  * o ubi:NAME  - mount UBI device 0, volume with name NAME.
+ * o PATH      - For example /dev/ubi0_0
  *
  * Alternative '!' separator may be used instead of ':' (because some shells
  * like busybox may interpret ':' as an NFS host name separator). This function
@@ -1855,9 +1856,15 @@ const struct super_operations ubifs_super_operations = {
  */
 static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 {
+	struct ubi_volume_desc *ubi;
 	int dev, vol;
 	char *endptr;
 
+	/* path method */
+	ubi = ubi_open_volume_path(name, mode);
+	if (!IS_ERR(ubi))
+		return ubi;
+
 	if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
 		return ERR_PTR(-EINVAL);
 
-- 
1.6.5.rc1
