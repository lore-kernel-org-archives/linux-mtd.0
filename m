Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSXJu-0005wo-Sv
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 14:57:15 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o06EtpCG014800
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jan 2010 08:57:10 -0600
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] UBI: add more checks to chdev open
Date: Wed,  6 Jan 2010 16:56:19 +0200
Message-Id: <1262789779-31354-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When opening UBI volumes by their character device names, make
sure we are opening character devices, not block devices or any
other inode type.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/kapi.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 277786e..1361574 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -291,8 +291,7 @@ EXPORT_SYMBOL_GPL(ubi_open_volume_nm);
  */
 struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
 {
-	int error, ubi_num, vol_id;
-	struct ubi_volume_desc *ret;
+	int error, ubi_num, vol_id, mod;
 	struct inode *inode;
 	struct path path;
 
@@ -306,16 +305,16 @@ struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
 		return ERR_PTR(error);
 
 	inode = path.dentry->d_inode;
+	mod = inode->i_mode;
 	ubi_num = ubi_major2num(imajor(inode));
 	vol_id = iminor(inode) - 1;
+	path_put(&path);
 
+	if (!S_ISCHR(mod))
+		return ERR_PTR(-EINVAL);
 	if (vol_id >= 0 && ubi_num >= 0)
-		ret = ubi_open_volume(ubi_num, vol_id, mode);
-	else
-		ret = ERR_PTR(-ENODEV);
-
-	path_put(&path);
-	return ret;
+		return ubi_open_volume(ubi_num, vol_id, mode);
+	return ERR_PTR(-ENODEV);
 }
 EXPORT_SYMBOL_GPL(ubi_open_volume_path);
 
-- 
1.6.2.5
