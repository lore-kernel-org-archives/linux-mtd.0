Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3b95-0002Vt-4v
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2010 21:03:27 +0000
Received: by wyb38 with SMTP id 38so9089963wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Oct 2010 14:03:25 -0700 (PDT)
From: Karl Beldan <karl.beldan@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
Date: Wed,  6 Oct 2010 23:02:54 +0200
Message-Id: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
Cc: Karl Beldan <karl.beldan@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been using this tweak for some time now, and I am getting tired of 
having to resort to it so often.
It allows to pass such cmdline root as: 
 "root=mtdb:ubivolx rootfstype=squashfs"
I am pretty sure many people use squashfs/cramfs filesystems on top of nand, 
for example, and I thought that this might initiate discussion.

-- 
Karl

Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
---
 init/do_mounts.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 02e3ca4..20d9380 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -20,6 +20,7 @@
 #include <linux/nfs_fs.h>
 #include <linux/nfs_fs_sb.h>
 #include <linux/nfs_mount.h>
+#include <linux/mtd/mtd.h>
 
 #include "do_mounts.h"
 
@@ -386,8 +387,18 @@ void __init prepare_namespace(void)
 
 	if (saved_root_name[0]) {
 		root_device_name = saved_root_name;
-		if (!strncmp(root_device_name, "mtd", 3) ||
-		    !strncmp(root_device_name, "ubi", 3)) {
+		if (!strncmp(root_device_name, "mtdb:", 4)) {
+			struct mtd_info *mtd = get_mtd_device_nm(root_device_name + 4);
+			if (!IS_ERR(mtd))
+				sprintf(root_device_name, "/dev/mtdblock%d", mtd->index);
+			else {
+				printk(KERN_ERR "VFS: Unable to find mtd \"%s\"\n", root_device_name + 4);
+				printk("List of all partitions:\n");
+				printk_all_partitions();
+				panic("VFS: Unable to mount root fs");
+			}
+		} else if (!strncmp(root_device_name, "mtd", 3) ||
+			   !strncmp(root_device_name, "ubi", 3)) {
 			mount_block_root(root_device_name, root_mountflags);
 			goto out;
 		}
-- 
1.7.1.422.g049e9
