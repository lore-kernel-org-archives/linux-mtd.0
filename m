Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mqx64-0008PD-8B
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 22:47:36 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: dedekind1@gmail.com
Subject: [PATCH] UBIFS: Add /dev/ubiX_Y naming scheme in open_ubi
Date: Fri, 25 Sep 2009 00:47:57 +0200
Message-Id: <1253832477-29064-1-git-send-email-corentincj@iksaif.net>
In-Reply-To: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>
References: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>
Cc: Corentin Chary <corentincj@iksaif.net>, util-linux-ng@vger.kernel.org,
	linux-mtd@lists.infradead.org
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
 fs/ubifs/super.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7e2b3d4..38320ad 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1843,10 +1843,11 @@ const struct super_operations ubifs_super_operations = {
  * @mode: UBI volume open mode
  *
  * There are several ways to specify UBI volumes when mounting UBIFS:
- * o ubiX_Y    - UBI device number X, volume Y;
- * o ubiY      - UBI device number 0, volume Y;
- * o ubiX:NAME - mount UBI device X, volume with name NAME;
- * o ubi:NAME  - mount UBI device 0, volume with name NAME.
+ * o /dev/ubiX_Y - UBI device number X, volume Y;
+ * o ubiX_Y      - UBI device number X, volume Y;
+ * o ubiY        - UBI device number 0, volume Y;
+ * o ubiX:NAME   - mount UBI device X, volume with name NAME;
+ * o ubi:NAME    - mount UBI device 0, volume with name NAME.
  *
  * Alternative '!' separator may be used instead of ':' (because some shells
  * like busybox may interpret ':' as an NFS host name separator). This function
@@ -1858,6 +1859,9 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	int dev, vol;
 	char *endptr;
 
+	if (!strncmp("/dev/", name, 5))
+		name = name + 5;
+
 	if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
 		return ERR_PTR(-EINVAL);
 
-- 
1.6.5.rc1
