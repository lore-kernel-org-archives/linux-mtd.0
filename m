Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkQj-0000W8-ES
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:52:03 -0500
Date: Tue, 21 Dec 2004 14:51:39 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221135139.GO22636@wohnheim.fh-wedel.de>
References: <1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134901.GN22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 9/22] Change parameter interface to phram-style
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Much nicer.  Same interface at boot time, module load and runtime via
/sys/.  It also groups by device, so you can add devices on the fly if
you wish to.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |  141 +++++++++++++++++++++++++++++++++++++++++--------------------
 1 files changed, 97 insertions(+), 44 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_interface	2004-12-20 21:38:46.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:07:09.000000000 +0100
@@ -33,6 +33,8 @@
 #include <linux/mtd/mtd.h>
 #include <linux/buffer_head.h>
 
+#define ERROR(fmt, args...) printk(KERN_ERR "blockmtd: " fmt , ## args)
+
 #define err(format, arg...) printk(KERN_ERR "blkmtd: " format "\n" , ## arg)
 #define info(format, arg...) printk(KERN_INFO "blkmtd: " format "\n" , ## arg)
 #define warn(format, arg...) printk(KERN_WARNING "blkmtd: " format "\n" , ## arg)
@@ -57,18 +59,6 @@
 
 #define MAX_DEVICES 4
 
-/* Module parameters passed by insmod/modprobe */
-char *device[MAX_DEVICES];    /* the block device to use */
-int erasesz[MAX_DEVICES];     /* optional default erase size */
-
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Simon Evans <spse@secret.org.uk>");
-MODULE_DESCRIPTION("Emulate an MTD using a block device");
-MODULE_PARM(device, "1-4s");
-MODULE_PARM_DESC(device, "block device to use");
-MODULE_PARM(erasesz, "1-4i");
-MODULE_PARM_DESC(erasesz, "optional erase size to use in KiB. eg 4=4KiB.");
 
 #define PAGE_READAHEAD 64
 
@@ -516,63 +506,122 @@
 	return NULL;
 }
 
-#ifndef MODULE
 
-/* Handle kernel boot params */
+static int ustrtoul(const char *cp, char **endp, unsigned int base)
+{
+	unsigned long result = simple_strtoul(cp, endp, base);
+	switch (**endp) {
+	case 'G' :
+		result *= 1024;
+	case 'M':
+		result *= 1024;
+	case 'k':
+		result *= 1024;
+	/* By dwmw2 editorial decree, "ki", "Mi" or "Gi" are to be used. */
+		if ((*endp)[1] == 'i')
+			(*endp) += 2;
+	}
+	return result;
+}
 
 
-static int __init param_blkmtd_device(char *str)
+static int parse_num32(u32 *num32, const char *token)
 {
-	int i;
+	char *endp;
+	unsigned long n;
 
-	for (i = 0; i < MAX_DEVICES; i++) {
-		device[i] = str;
-		strsep(&str, ",");
-	}
-	return 1;
+	n = ustrtoul(token, &endp, 0);
+	if (*endp)
+		return -EINVAL;
+
+	*num32 = n;
+	return 0;
 }
 
 
-static int __init param_blkmtd_erasesz(char *str)
+static int parse_name(char **pname, const char *token, size_t limit)
 {
-	int i;
-	for (i = 0; i < MAX_DEVICES; i++) {
-		char *val = strsep(&str, ",");
-		if (val)
-			erasesz[i] = simple_strtoul(val, NULL, 0);
-	}
+	size_t len;
+	char *name;
 
-	return 1;
-}
+	len = strlen(token) + 1;
+	if (len > limit)
+		return -ENOSPC;
 
+	name = kmalloc(len, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
 
-__setup("blkmtd_device=", param_blkmtd_device);
-__setup("blkmtd_erasesz=", param_blkmtd_erasesz);
+	strcpy(name, token);
 
-#endif
+	*pname = name;
+	return 0;
+}
 
 
-static int __init blockmtd_init(void)
+#define parse_err(fmt, args...) do {		\
+	ERROR("blockmtd: " fmt "\n", ## args);	\
+	return 0;				\
+} while (0)
+
+static int blockmtd_setup(const char *val, struct kernel_param *kp)
 {
-	int i;
+	char buf[80+12], *str=buf; /* 80 for device, 12 for erase size */
+	char *token[2];
+	char *name;
+	size_t erase_size = 0;
+	int i, ret;
 
-	info("version " VERSION);
-	/* Check args - device[0] is the bare minimum */
-	if (!device[0]) {
-		err("error: missing `device' name\n");
-		return -EINVAL;
+	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
+		parse_err("parameter too long");
+
+	strcpy(str, val);
+
+	for (i=0; i<2; i++)
+		token[i] = strsep(&str, ",");
+
+	{ /* people dislike typing "echo -n".  and it's simple enough */
+		char *newline = strrchr(token[1], '\n');
+		if (newline && !newline[1])
+			*newline = 0;
 	}
 
-	for (i = 0; i < MAX_DEVICES; i++)
-		add_device(device[i], erasesz[i] << 10);
+	if (str)
+		parse_err("too many arguments");
 
-	if (list_empty(&blkmtd_device_list))
-		return -EINVAL;
+	if (!token[0])
+		parse_err("no argument");
+
+	ret = parse_name(&name, token[0], 80);
+	if (ret == -ENOMEM)
+		parse_err("out of memory");
+	if (ret == -ENOSPC)
+		parse_err("name too long");
+	if (ret)
+		return 0;
+
+	if (token[1]) {
+		ret = parse_num32(&erase_size, token[1]);
+		if (ret)
+			parse_err("illegal erase size");
+	}
+
+	add_device(name, erase_size);
 
 	return 0;
 }
 
 
+module_param_call(blockmtd, blockmtd_setup, NULL, NULL, 0200);
+MODULE_PARM_DESC(blockmtd, "Device to use. \"blockmtd=<dev>[,<erasesize>]\"");
+
+static int __init blockmtd_init(void)
+{
+	info("version " VERSION);
+	return 0;
+}
+
+
 static void __devexit blockmtd_exit(void)
 {
 	struct list_head *temp1, *temp2;
@@ -593,3 +642,7 @@
 
 module_init(blockmtd_init);
 module_exit(blockmtd_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Simon Evans <spse@secret.org.uk>");
+MODULE_DESCRIPTION("Emulate an MTD using a block device");
