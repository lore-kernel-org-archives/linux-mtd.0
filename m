Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyPAI-0002q8-NZ
	for linux-mtd@lists.infradead.org; Thu, 06 Jul 2006 04:25:00 -0400
Date: Thu, 6 Jul 2006 11:24:44 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] block2mtd.c: Make kernel boot command line arguments
	work
Message-ID: <20060706082443.GL15078@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-To: vherva@vianova.fi, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Trying to pass kernel command line arguments to block2mtd at boot-time does
not work currently. block2mtd_setup() is called so early that kmalloc()
fails nevermind being able to do open_bdev_excl() (which requires rootfs to
be mounted. This patch only saves the option string at the early boot stage,
and parses them later when block2mtd_init() is called. If open_bdev_excl()
fails, open_by_devnum(name_to_dev_t()) is tried instead, which makes it
possible to initialize the driver before rootfs has been mounted. Also gets
rid of the superfluous parse_name() that only checks if name is longer than
80 chars and copies it to a string that is not kfreed.

With this patch, I can boot statically compiled block2mtd, and mount jffs2
as rootfs (without modules or initrd), with lilo config like this:

   root=/dev/mtdblock0
   append="rootfstype=jffs2 block2mtd.block2mtd=/dev/hdc2,65536"

(Note that rootfstype=jffs2 is required, since the kernel only tries
filesystems without "nodev" attribute by default, and jffs is "nodev").


From: Ville Herva <vherva@vianova.fi>
Signed-off-by: Ville Herva <vherva@vianova.fi>

--- linux-mtd-GIT/drivers/mtd/devices/block2mtd.c	2006-07-05 23:06:10.000000000 +0300
+++ linux-2.6.17.3/drivers/mtd/devices/block2mtd.c	2006-07-06 11:03:28.000000000 +0300
@@ -18,6 +18,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/buffer_head.h>
 #include <linux/mutex.h>
+#include <linux/mount.h>
 
 #define VERSION "$Revision: 1.30 $"
 
@@ -236,6 +237,8 @@ static int _block2mtd_write(struct block
 	}
 	return 0;
 }
+
+
 static int block2mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
@@ -300,6 +303,17 @@ static struct block2mtd_dev *add_device(
 	/* Get a handle on the device */
 	bdev = open_bdev_excl(devname, O_RDWR, NULL);
 	if (IS_ERR(bdev)) {
+
+		/* We might not have rootfs mounted at this point. Try 
+		   to resolve the device name by other means. */
+
+		dev_t dev = name_to_dev_t(devname);
+		if (dev != 0) {
+			bdev = open_by_devnum(dev, FMODE_WRITE | FMODE_READ);
+		}
+	}
+
+	if (IS_ERR(bdev)) {
 		ERROR("error: cannot open device %s", devname);
 		goto devinit_err;
 	}
@@ -393,26 +407,6 @@ static int parse_num(size_t *num, const 
 }
 
 
-static int parse_name(char **pname, const char *token, size_t limit)
-{
-	size_t len;
-	char *name;
-
-	len = strlen(token) + 1;
-	if (len > limit)
-		return -ENOSPC;
-
-	name = kmalloc(len, GFP_KERNEL);
-	if (!name)
-		return -ENOMEM;
-
-	strcpy(name, token);
-
-	*pname = name;
-	return 0;
-}
-
-
 static inline void kill_final_newline(char *str)
 {
 	char *newline = strrchr(str, '\n');
@@ -426,14 +420,20 @@ static inline void kill_final_newline(ch
 	return 0;				\
 } while (0)
 
-static int block2mtd_setup(const char *val, struct kernel_param *kp)
+static int block2mtd_init_called = 0;
+static char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */
+
+
+static int block2mtd_setup2(void)
 {
-	char buf[80+12]; /* 80 for device, 12 for erase size */
+	char* val = (char*)block2mtd_paramline;
+
+	char buf[80 + 12], *str = buf; /* 80 for device, 12 for erase size */
 	char *str = buf;
 	char *token[2];
 	char *name;
 	size_t erase_size = PAGE_SIZE;
-	int i, ret;
+	int i;
 
 	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
 		parse_err("parameter too long");
@@ -450,16 +450,12 @@ static int block2mtd_setup(const char *v
 	if (!token[0])
 		parse_err("no argument");
 
-	ret = parse_name(&name, token[0], 80);
-	if (ret == -ENOMEM)
-		parse_err("out of memory");
-	if (ret == -ENOSPC)
-		parse_err("name too long");
-	if (ret)
-		return 0;
+	name = token[0];
+	if (strlen(name) + 1 > 80)
+		parse_err("device name too long");
 
 	if (token[1]) {
-		ret = parse_num(&erase_size, token[1]);
+		int ret = parse_num(&erase_size, token[1]);
 		if (ret) {
 			kfree(name);
 			parse_err("illegal erase size");
@@ -472,13 +468,40 @@ static int block2mtd_setup(const char *v
 }
 
 
+static int block2mtd_setup(const char *val, struct kernel_param *kp)
+{
+	/* Only save the parameters here. We must parse them later:
+	   if the param passed from kernel boot command line,
+	   block2mtd_setup() is called so early that it is not
+	   possible to resolve the device (even kmalloc() fails).
+	   Deter that work to block2mtd_setup2(). */
+
+	strlcpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
+
+	/* If more parameters are later passed in via
+	   /sys/module/block2mtd/parameters/block2mtd
+	   and block2mtd_init() has already been called,
+	   we can parse the argument now. */
+
+	if (block2mtd_init_called)
+		return block2mtd_setup2();
+	
+	return 0;
+}
+
+
 module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
 MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
 
 static int __init block2mtd_init(void)
 {
+	int ret = 0;
 	INFO("version " VERSION);
-	return 0;
+
+	ret = block2mtd_setup2();
+	block2mtd_init_called = 1;
+
+	return ret;
 }
 
 
