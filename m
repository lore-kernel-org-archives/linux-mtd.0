Received: from [213.39.233.138] (helo=wohnheim.fh-wedel.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19d8Nc-0007zg-E8
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jul 2003 14:01:04 +0100
Date: Thu, 17 Jul 2003 15:00:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030717130009.GB25081@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Jochen Schaeuble <psionic@psionic.de>
Subject: [PATCH] phram, an slram substitute
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David!

Jochen's slram driver has a lot of ugly warts and finally I grew tired
of scratching them, so this is a 80% rewritten driver.  It has cleaned
up most of the ugly bits, catches upper layer problems in the read,
write, erase and point functions for the paranoid, has a new interface
in addition to the old one, which is kept for migration.

All this is done with the exact same line count, there was quite a bit
of old code that could go.

Downside is that I don't ever want to port this driver back to 2.4.
Most of the ugliness in slram comes from the different interfaces for
modules and build-in drivers and who wants to get that mess back?

So if someone feels like there are other interesting improvements in
this driver that would be nice for 2.4, add them to slram.c and be
careful not to break anything. :)

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius

--- /dev/null	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.0-test1/drivers/mtd/devices/phram.c	2003-07-17 14:46:44.000000000 +0200
@@ -0,0 +1,362 @@
+/**
+ *
+ * $Id: just to make dwmw2 happy $
+ *
+ * Copyright (c) Jochen Schaeuble <psionic@psionic.de>
+ * 07/2003	rewritten by Joern Engel <joern@wh.fh-wedel.de>
+ *
+ * DISCLAIMER:  This driver makes use of Rusty's excellent module code,
+ * so it will not work for 2.4 without changes and it wont work for 2.4
+ * as a module without major changes.  Oh well!
+ *
+ * Usage:
+ *
+ * one commend line parameter per device, each in the form:
+ *   phram=<name>,<start>,<len>
+ * <name> may be up to 63 characters.
+ * <start> and <len> can be octal, decimal or hexadecimal.  If followed
+ * by "k", "M" or "G", the numbers will be interpreted as kilo, mega or
+ * gigabytes.
+ *
+ */
+
+#include <asm/io.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mtd/mtd.h>
+
+#define ERROR(fmt, args...) printk(KERN_ERR "phram: " fmt , ## args)
+
+struct phram_mtd_list {
+	struct list_head list;
+	struct mtd_info *mtdinfo;
+};
+
+static LIST_HEAD(phram_list);
+
+
+
+int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	u_char *start = (u_char *)mtd->priv;
+
+	if (instr->addr + instr->len > mtd->size)
+		return -EINVAL;
+	
+	memset(start + instr->addr, 0xff, instr->len);
+
+	/* This'll catch a few races. Free the thing before returning :) 
+	 * I don't feel at all ashamed. This kind of thing is possible anyway
+	 * with flash, but unlikely.
+	 */
+
+	instr->state = MTD_ERASE_DONE;
+
+	if (instr->callback)
+		(*(instr->callback))(instr);
+	else
+		kfree(instr);
+
+	return 0;
+}
+
+int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char **mtdbuf)
+{
+	u_char *start = (u_char *)mtd->priv;
+
+	if (from + len > mtd->size)
+		return -EINVAL;
+	
+	*mtdbuf = start + from;
+	*retlen = len;
+	return 0;
+}
+
+void phram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t from, size_t len)
+{
+}
+
+int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
+{
+	u_char *start = (u_char *)mtd->priv;
+
+	if (from + len > mtd->size)
+		return -EINVAL;
+	
+	memcpy(buf, start + from, len);
+
+	*retlen = len;
+	return 0;
+}
+
+int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
+{
+	u_char *start = (u_char *)mtd->priv;
+
+	if (to + len > mtd->size)
+		return -EINVAL;
+	
+	memcpy(start + to, buf, len);
+
+	*retlen = len;
+	return 0;
+}
+
+
+
+static void unregister_devices(void)
+{
+	struct phram_mtd_list *this;
+
+	list_for_each_entry(this, &phram_list, list) {
+		del_mtd_device(this->mtdinfo);
+		iounmap(this->mtdinfo->priv);
+		kfree(this->mtdinfo);
+		kfree(this);
+	}
+}
+
+static int register_device(char *name, unsigned long start, unsigned long len)
+{
+	struct phram_mtd_list *new;
+	int ret = -ENOMEM;
+
+	new = kmalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		goto out0;
+
+	new->mtdinfo = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+	if (!new->mtdinfo)
+		goto out1;
+	
+	memset(new->mtdinfo, 0, sizeof(struct mtd_info));
+
+	ret = -EIO;
+	new->mtdinfo->priv = ioremap(start, len);
+	if (!new->mtdinfo->priv) {
+		ERROR("ioremap failed\n");
+		goto out2;
+	}
+
+
+	new->mtdinfo->name = name;
+	new->mtdinfo->size = len;
+	new->mtdinfo->flags = MTD_CAP_RAM | MTD_ERASEABLE | MTD_VOLATILE;
+        new->mtdinfo->erase = phram_erase;
+	new->mtdinfo->point = phram_point;
+	new->mtdinfo->unpoint = phram_unpoint;
+	new->mtdinfo->read = phram_read;
+	new->mtdinfo->write = phram_write;
+	new->mtdinfo->owner = THIS_MODULE;
+	new->mtdinfo->type = MTD_RAM;
+	new->mtdinfo->erasesize = 0x0;
+
+	ret = -EAGAIN;
+	if (add_mtd_device(new->mtdinfo)) {
+		ERROR("Failed to register new device\n");
+		goto out3;
+	}
+
+	list_add_tail(&new->list, &phram_list);
+	return 0;	
+
+out3:
+	iounmap(new->mtdinfo->priv);
+out2:
+	kfree(new->mtdinfo);
+out1:
+	kfree(new);
+out0:
+	return ret;
+}
+
+static int ustrtoul(const char *cp, char **endp, unsigned int base)
+{
+	unsigned long result = simple_strtoul(cp, endp, base);
+
+	switch (**endp) {
+	case 'G':
+		result *= 1024;
+	case 'M':
+		result *= 1024;
+	case 'k':
+		result *= 1024;
+		endp++;
+	}
+	return result;
+}
+
+static int parse_num32(uint32_t *num32, const char *token)
+{
+	char *endp;
+	unsigned long n;
+
+	n = ustrtoul(token, &endp, 0);
+	if (*endp)
+		return -EINVAL;
+
+	*num32 = n;
+	return 0;
+}
+
+static int parse_name(char **pname, const char *token)
+{
+	size_t len;
+	char *name;
+
+	len = strlen(token) + 1;
+	if (len > 64)
+		return -ENOSPC;
+
+	name = kmalloc(len, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	strcpy(name, token);
+
+	*pname = name;
+	return 0;
+}
+
+#define parse_err(fmt, args...) do {	\
+	ERROR(fmt , ## args);	\
+	return 0;		\
+} while (0)
+
+static int phram_setup(const char *val, struct kernel_param *kp)
+{
+	char buf[64+12+12], *str = buf;
+	char *token[3];
+	char *name;
+	uint32_t start;
+	uint32_t len;
+	int i, ret;
+
+	if (strnlen(val, sizeof(str)) >= sizeof(str))
+		parse_err("parameter too long\n");
+
+	strcpy(str, val);
+
+	for (i=0; i<3; i++)
+		token[i] = strsep(&str, ",");
+
+	if (str)
+		parse_err("too many arguments\n");
+
+	if (!token[2])
+		parse_err("not enough arguments\n");
+
+	ret = parse_name(&name, token[0]);
+	if (ret == -ENOMEM)
+		parse_err("out of memory\n");
+	if (ret == -ENOSPC)
+		parse_err("name too long\n");
+	if (ret)
+		return 0;
+
+	ret = parse_num32(&start, token[1]);
+	if (ret)
+		parse_err("illegal start address\n");
+
+	ret = parse_num32(&len, token[2]);
+	if (ret)
+		parse_err("illegal device length\n");
+
+	register_device(name, start, len);
+
+	return 0;
+}
+
+module_param_call(phram, phram_setup, NULL, NULL, 000);
+MODULE_PARM_DESC(phram, "Memory region to map. \"map=<name>,<start><length>\"");
+
+/*
+ * Just for compatibility with slram, this is horrible and should go someday.
+ */
+static int __init slram_setup(const char *val, struct kernel_param *kp)
+{
+	char buf[256], *str = buf;
+
+	if (!val || !val[0])
+		parse_err("no arguments to \"slram=\"\n");
+
+	if (strnlen(val, sizeof(str)) >= sizeof(str))
+		parse_err("parameter too long\n");
+
+	strcpy(str, val);
+
+	while (str) {
+		char *token[3];
+		char *name;
+		uint32_t start;
+		uint32_t len;
+		int i, ret;
+
+		for (i=0; i<3; i++) {
+			token[i] = strsep(&str, ",");
+			if (token[i])
+				continue;
+			parse_err("wrong number of arguments to \"slram=\"\n");
+		}
+
+		/* name */
+		ret = parse_name(&name, token[0]);
+		if (ret == -ENOMEM)
+			parse_err("of memory\n");
+		if (ret == -ENOSPC)
+			parse_err("too long\n");
+		if (ret)
+			return 1;
+
+		/* start */
+		ret = parse_num32(&start, token[1]);
+		if (ret)
+			parse_err("illegal start address\n");
+
+		/* len */
+		if (token[2][0] == '+')
+			ret = parse_num32(&len, token[2] + 1);
+		else
+			ret = parse_num32(&len, token[2]);
+
+		if (ret)
+			parse_err("illegal device length\n");
+
+		if (token[2][0] != '+') {
+			if (len < start)
+				parse_err("end < start\n");
+			len -= start;
+		}
+
+		register_device(name, start, len);
+	}
+	return 1;
+}
+
+module_param_call(slram, slram_setup, NULL, NULL, 000);
+MODULE_PARM_DESC(slram, "List of memory regions to map. \"map=<name>,<start><length/end>\"");
+
+
+int __init init_phram(void)
+{
+	printk(KERN_ERR "phram loaded\n");
+	return 0;
+}
+
+static void __exit cleanup_phram(void)
+{
+	unregister_devices();
+}
+
+module_init(init_phram);
+module_exit(cleanup_phram);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jörn Engel <joern@wh.fh-wedel.de>");
+MODULE_DESCRIPTION("MTD driver for physical RAM");
--- linux-2.6.0-test1/drivers/mtd/devices/Kconfig~phram	2003-07-16 12:01:47.000000000 +0200
+++ linux-2.6.0-test1/drivers/mtd/devices/Kconfig	2003-07-16 12:02:42.000000000 +0200
@@ -52,6 +52,16 @@
 	  you can still use it for storage or swap by using this driver to
 	  present it to the system as a Memory Technology Device.
 
+config MTD_PHRAM
+	tristate "Physical system RAM"
+	depends on MTD
+	help
+	  This is a re-implementation of the slram driver above.
+	  
+	  Use this driver to access physical memory that the kernel proper
+	  doesn't have access to, memory beyond the mem=xxx limit, nvram,
+	  memory on the video card, etc...
+
 config MTD_LART
 	tristate "28F160xx flash driver for LART"
 	depends on SA1100_LART && MTD
--- linux-2.6.0-test1/drivers/mtd/devices/Makefile~phram	2003-07-16 12:01:47.000000000 +0200
+++ linux-2.6.0-test1/drivers/mtd/devices/Makefile	2003-07-16 12:02:42.000000000 +0200
@@ -15,6 +15,7 @@
 obj-$(CONFIG_MTD_DOC2001PLUS)	+= doc2001plus.o
 obj-$(CONFIG_MTD_DOCPROBE)	+= docprobe.o docecc.o
 obj-$(CONFIG_MTD_SLRAM)		+= slram.o
+obj-$(CONFIG_MTD_PHRAM)		+= phram.o
 obj-$(CONFIG_MTD_PMC551)	+= pmc551.o
 obj-$(CONFIG_MTD_MS02NV)	+= ms02-nv.o
 obj-$(CONFIG_MTD_MTDRAM)	+= mtdram.o
