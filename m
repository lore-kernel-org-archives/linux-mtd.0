Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7yg1-0000ov-0I
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 13:41:29 -0500
Date: Fri, 19 Jan 2007 19:40:48 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [-mm patch] drivers/mtd/ubi/: possible cleanups
Message-ID: <20070119184048.GR9093@stusta.de>
References: <20070111222627.66bb75ab.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070111222627.66bb75ab.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 11, 2007 at 10:26:27PM -0800, Andrew Morton wrote:
>...
> Changes since 2.6.20-rc3-mm1:
>...
>  git-ubi.patch
>...
>  git trees
>...


This patch contains the following possible cleanups:
- make needlessly global code static
- remove the following unused variable:
  - debug.c: alloc_prints

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

BTW: Do you really need that many different 
     CONFIG_MTD_UBI_DEBUG_* options?

 drivers/mtd/ubi/cdev.c  |    4 +-
 drivers/mtd/ubi/debug.c |   57 ++++++++++++++++++----------------------
 2 files changed, 28 insertions(+), 33 deletions(-)

--- linux-2.6.20-rc4-mm1/drivers/mtd/ubi/cdev.c.old	2007-01-19 17:49:47.000000000 +0100
+++ linux-2.6.20-rc4-mm1/drivers/mtd/ubi/cdev.c	2007-01-19 17:50:03.000000000 +0100
@@ -47,7 +47,7 @@
 
 static int vol_cdev_open(struct inode *inode, struct file *file);
 static int vol_cdev_release(struct inode *inode, struct file *file);
-loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin);
+static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin);
 static ssize_t vol_cdev_read(struct file *file, __user char *buf,
 			     size_t count, loff_t * offp);
 static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
@@ -224,7 +224,7 @@
  * positive offset in case of success and a negative error code in case of
  * failure.
  */
-loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
+static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
 {
 	const struct ubi_vtbl_vtr *vtr;
 	struct ubi_vol_desc *desc = file->private_data;
--- linux-2.6.20-rc4-mm1/drivers/mtd/ubi/debug.c.old	2007-01-19 17:50:42.000000000 +0100
+++ linux-2.6.20-rc4-mm1/drivers/mtd/ubi/debug.c	2007-01-19 18:43:59.000000000 +0100
@@ -67,74 +67,69 @@
 static int vb_err_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_UIF
-int uif_prints = 1;
+static int uif_prints = 1;
 #else
-int uif_prints;
+static int uif_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_CDEV
-int cdev_prints = 1;
+static int cdev_prints = 1;
 #else
-int cdev_prints;
+static int cdev_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_GLUEBI
-int gluebi_prints = 1;
+static int gluebi_prints = 1;
 #else
-int gluebi_prints;
+static int gluebi_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_VMT
-int vmt_prints = 1;
+static int vmt_prints = 1;
 #else
-int vmt_prints;
+static int vmt_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_UPD
-int upd_prints = 1;
+static int upd_prints = 1;
 #else
-int upd_prints;
+static int upd_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_VTBL
-int vtbl_prints = 1;
+static int vtbl_prints = 1;
 #else
-int vtbl_prints;
+static int vtbl_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_ACC
-int acc_prints = 1;
+static int acc_prints = 1;
 #else
-int acc_prints;
+static int acc_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_EBA
-int eba_prints = 1;
+static int eba_prints = 1;
 #else
-int eba_prints;
+static int eba_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_WL
-int wl_prints = 1;
+static int wl_prints = 1;
 #else
-int wl_prints;
+static int wl_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_BGT
-int bgt_prints = 1;
+static int bgt_prints = 1;
 #else
-int bgt_prints;
-#endif
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG_ALLOC
-int alloc_prints = 1;
-#else
-int alloc_prints;
+static int bgt_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_IO
-int io_prints = 1;
+static int io_prints = 1;
 #else
-int io_prints;
+static int io_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_BLD
-int bld_prints = 1;
+static int bld_prints = 1;
 #else
-int bld_prints;
+static int bld_prints;
 #endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_SCAN
-int scan_prints = 1;
+static int scan_prints = 1;
 #else
-int scan_prints;
+static int scan_prints;
 #endif
 
 /* If debugging messages should also go to the console */
