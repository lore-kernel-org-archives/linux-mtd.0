Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161nYF-00039U-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 11:40:55 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id DAA05522
	for <linux-mtd@lists.infradead.org>; Thu, 8 Nov 2001 03:46:42 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.2/8.11.2) id fA8BoBI25024
	for linux-mtd@lists.infradead.org; Thu, 8 Nov 2001 11:50:11 GMT
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: Intel protection register read
Date: Thu, 8 Nov 2001 11:50:10 +0000
MIME-Version: 1.0
Message-Id: <01110811501001.09516@uk-proclin2>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I sent the patch below to this list a few days ago but had no response. Has 
anyone had a chance to look at it? If its ok, could someone apply it?
(its against 2.3.13-ac4-rmk1)

Thanks,
Clive

diff -purN linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c linux/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Oct  4 23:14:59 2001
+++ linux/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov  1 14:37:51 2001
@@ -31,6 +31,7 @@
 #include <linux/mtd/compatmac.h>
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_read_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
@@ -151,7 +152,23 @@ struct mtd_info *cfi_cmdset_0001(struct 
 		/* Do some byteswapping if necessary */
 		extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
 		extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);
+		extp->ProtRegAddr = cfi32_to_cpu(extp->ProtRegAddr);
 		
+		
+		/* Read the protection register area from flash */
+		if(extp->NumProtectionFields){
+			cfi_send_gen_cmd(0x90, 0x55, base, map, cfi, cfi->device_type, NULL);
+			cfi->ProtRegData=kmalloc((1<<extp->FactProtRegSize)+(1<<extp->UserProtRegSize),GFP_KERNEL);
+			if(!cfi->ProtRegData){
+				printk(KERN_ERR "Failed to allocate memory\n");
+				return 0;
+			}
+			for (i=0; i<((1<<extp->FactProtRegSize)+(1<<extp->UserProtRegSize));i++){
+				cfi->ProtRegData[i]=
+					map->read8(map,(base+(extp->ProtRegAddr*ofs_factor)+i));
+			}
+		}
+			
 #ifdef DEBUG_CFI_FEATURES
 		/* Tell the user about it in lots of lovely detail */
 		cfi_tell_features(extp);
@@ -247,6 +264,7 @@ static struct mtd_info *cfi_intelext_set
 		//printk(KERN_INFO "Using word write method\n" );
 		mtd->write = cfi_intelext_write_words;
 	}
+	mtd->read_prot_reg = cfi_intelext_read_prot_reg;
 	mtd->sync = cfi_intelext_sync;
 	mtd->lock = cfi_intelext_lock;
 	mtd->unlock = cfi_intelext_unlock;
@@ -432,6 +450,30 @@ static int cfi_intelext_read (struct mtd
 	}
 	return ret;
 }
+
+static int cfi_intelext_read_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
+	unsigned char* data=cfi->ProtRegData+from;
+	int   count=len;
+	
+	while(count){
+		if(data>=cfi->ProtRegData + 
+		   (1<<extp->FactProtRegSize)+(1<<extp->UserProtRegSize)){
+		   return len-count;
+		}
+		*buf=*data;
+		buf++;		
+		data++;
+		count--;	     
+	}
+	return len-count;
+}
+	
+	
+
 
 static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, __u32 datum)
 {
diff -purN linux_2.4.13/drivers/mtd/maps/Makefile linux/drivers/mtd/maps/Makefile
--- linux_2.4.13/drivers/mtd/maps/Makefile	Mon Oct 29 15:47:07 2001
+++ linux/drivers/mtd/maps/Makefile	Wed Oct 24 10:17:47 2001
@@ -31,6 +31,7 @@ obj-$(CONFIG_MTD_SUN_UFLASH)    += sun_u
 obj-$(CONFIG_MTD_VMAX)		+= vmax301.o
 obj-$(CONFIG_MTD_DBOX2)		+= dbox2-flash.o
 obj-$(CONFIG_MTD_OCELOT)	+= ocelot.o
+obj-$(CONFIG_MTD_EPXA10DB)	+= epxa10db-flash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
 obj-$(CONFIG_MTD_PCI)		+= pci.o
 
diff -purN linux_2.4.13/include/linux/mtd/mtd.h linux/include/linux/mtd/mtd.h
--- linux_2.4.13/include/linux/mtd/mtd.h	Tue Jun 12 18:30:27 2001
+++ linux/include/linux/mtd/mtd.h	Thu Nov  1 14:47:05 2001
@@ -180,6 +180,12 @@ struct mtd_info {
 	int (*read_oob) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
+	/* 
+	 * Method to access the protection register or OTP area, 
+	 * present in some flash devices
+	 */
+	int (*read_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
+
 	/* iovec-based read/write methods. We need these especially for NAND flash,
 	   with its limited number of write cycles per erase.
 	   NB: The 'count' parameter is the number of _vectors_, each of 
diff -purN linux_2.4.13/drivers/mtd/mtdpart.c linux/drivers/mtd/mtdpart.c
--- linux_2.4.13/drivers/mtd/mtdpart.c	Thu Oct  4 23:14:59 2001
+++ linux/drivers/mtd/mtdpart.c	Thu Nov  1 14:31:45 2001
@@ -195,6 +195,7 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.oobsize = master->oobsize;
 		slave->mtd.ecctype = master->ecctype;
 		slave->mtd.eccsize = master->eccsize;
+		slave->mtd.read_prot_reg = master->read_prot_reg;
 
 		slave->mtd.name = parts[i].name;
 		slave->mtd.bank_size = master->bank_size;
diff -purN linux_2.4.13/include/linux/mtd/cfi.h linux/include/linux/mtd/cfi.h
--- linux_2.4.13/include/linux/mtd/cfi.h	Thu Oct  4 23:13:18 2001
+++ linux/include/linux/mtd/cfi.h	Thu Nov  1 14:23:45 2001
@@ -206,6 +206,10 @@ struct cfi_pri_intelext {
   __u16 BlkStatusRegMask;
   __u8  VccOptimal;
   __u8  VppOptimal;
+  __u8  NumProtectionFields;
+  __u16 ProtRegAddr;
+  __u8  FactProtRegSize;
+  __u8  UserProtRegSize;
 } __attribute__((packed));
 
 struct cfi_pri_query {
@@ -248,6 +252,7 @@ struct cfi_private {
 	int numchips;
 	unsigned long chipshift; /* Because they're of the same type */
 	const char *im_name;	 /* inter_module name for cmdset_setup */
+	unsigned char *ProtRegData;  /* Protection register data bytes */
 	struct flchip chips[0];  /* per-chip data structure for each chip */
 };
 
