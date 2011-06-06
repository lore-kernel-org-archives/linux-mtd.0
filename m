Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTeRP-0003ye-43
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 18:22:20 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 32D0A1B4014
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 18:22:16 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=203/4=5D=20include/mtd=3A=20sync=20with=20kernel?=
Date: Mon,  6 Jun 2011 14:22:16 -0400
Message-Id: <1307384537-9607-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/mtd/mtd-abi.h  |   34 ++++++++++++++++++++++++++++------
 include/mtd/mtd-user.h |   19 ++++++++++++++++---
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index c6954ed..a86364a 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -1,5 +1,20 @@
 /*
- * Portions of MTD ABI definition which are shared by kernel and user space
+ * Copyright © 1999-2010 David Woodhouse <dwmw2@infradead.org> et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ *
  */
 
 #ifndef __MTD_ABI_H__
@@ -37,6 +52,7 @@ struct mtd_oob_buf64 {
 #define MTD_NANDFLASH		4
 #define MTD_DATAFLASH		6
 #define MTD_UBIVOLUME		7
+#define MTD_MLCNANDFLASH	8
 
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
@@ -104,12 +120,13 @@ struct otp_info {
 #define OTPGETREGIONCOUNT	_IOW('M', 14, int)
 #define OTPGETREGIONINFO	_IOW('M', 15, struct otp_info)
 #define OTPLOCK			_IOR('M', 16, struct otp_info)
-#define ECCGETLAYOUT		_IOR('M', 17, struct nand_ecclayout)
+#define ECCGETLAYOUT		_IOR('M', 17, struct nand_ecclayout_user)
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
@@ -128,13 +145,18 @@ struct nand_oobfree {
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES	8
+#define MTD_MAX_ECCPOS_ENTRIES	64
 /*
- * ECC layout control structure. Exported to userspace for
- * diagnosis and to allow creation of raw images
+ * OBSOLETE: ECC layout control structure. Exported to user-space via ioctl
+ * ECCGETLAYOUT for backwards compatbility and should not be mistaken as a
+ * complete set of ECC information. The ioctl truncates the larger internal
+ * structure to retain binary compatibility with the static declaration of the
+ * ioctl. Note that the "MTD_MAX_..._ENTRIES" macros represent the max size of
+ * the user struct, not the MAX size of the internal struct nand_ecclayout.
  */
-struct nand_ecclayout {
+struct nand_ecclayout_user {
 	__u32 eccbytes;
-	__u32 eccpos[64];
+	__u32 eccpos[MTD_MAX_ECCPOS_ENTRIES];
 	__u32 oobavail;
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
 };
diff --git a/include/mtd/mtd-user.h b/include/mtd/mtd-user.h
index 713f34d..83327c8 100644
--- a/include/mtd/mtd-user.h
+++ b/include/mtd/mtd-user.h
@@ -1,7 +1,20 @@
 /*
- * $Id: mtd-user.h,v 1.2 2004/05/05 14:44:57 dwmw2 Exp $
+ * Copyright © 1999-2010 David Woodhouse <dwmw2@infradead.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  *
- * MTD ABI header for use by user space only.
  */
 
 #ifndef __MTD_USER_H__
@@ -16,6 +29,6 @@ typedef struct mtd_info_user mtd_info_t;
 typedef struct erase_info_user erase_info_t;
 typedef struct region_info_user region_info_t;
 typedef struct nand_oobinfo nand_oobinfo_t;
-typedef struct nand_ecclayout nand_ecclayout_t;
+typedef struct nand_ecclayout_user nand_ecclayout_t;
 
 #endif /* __MTD_USER_H__ */
-- 
1.7.5.3
