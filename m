Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163bDV-0004X2-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 10:54:57 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id DAA10813
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 03:00:44 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.2/8.11.2) id fADB4FM11028
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2001 11:04:15 GMT
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: Intel protection register access
Date: Tue, 13 Nov 2001 11:04:15 +0000
MIME-Version: 1.0
Message-Id: <01111311041500.11006@uk-proclin2>
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

An updated version of the patch to access the Intel protection registers. Its 
a pretty fundamental rewrite of the previous attempt. I've refined the 
interface so that the factory data (read only) and user data (one the 
programmable) are treated seperately. For multiple chips, the data is 
addressed as if it were one big area with the data from the lowest 
numbered chip in the map coming first.

The write function is still unimplemented but the framework is there. I'll add 
this in a few weeks time. 

Please let me know if you have any comments/suggestions.

Clive

--- linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Oct  4 23:14:59 2001
+++ linux/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Nov 12 10:27:16 2001
@@ -31,6 +31,8 @@
 #include <linux/mtd/compatmac.h>
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
@@ -151,15 +153,16 @@ struct mtd_info *cfi_cmdset_0001(struct 
 		/* Do some byteswapping if necessary */
 		extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
 		extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);
-		
+		extp->ProtRegAddr = cfi32_to_cpu(extp->ProtRegAddr);
+			
 #ifdef DEBUG_CFI_FEATURES
 		/* Tell the user about it in lots of lovely detail */
 		cfi_tell_features(extp);
 #endif	
 
 		/* Install our own private info structure */
-		cfi->cmdset_priv = extp;
-	}	
+		cfi->cmdset_priv = extp;	
+	}
 
 	for (i=0; i< cfi->numchips; i++) {
 		cfi->chips[i].word_write_time = 128;
@@ -247,6 +250,8 @@ static struct mtd_info *cfi_intelext_set
 		//printk(KERN_INFO "Using word write method\n" );
 		mtd->write = cfi_intelext_write_words;
 	}
+	mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;
+	mtd->read_fact_prot_reg = cfi_intelext_read_fact_prot_reg;
 	mtd->sync = cfi_intelext_sync;
 	mtd->lock = cfi_intelext_lock;
 	mtd->unlock = cfi_intelext_unlock;
@@ -432,6 +437,115 @@ static int cfi_intelext_read (struct mtd
 	}
 	return ret;
 }
+
+static int cfi_intelext_read_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf, int base_offst, int reg_sz)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
+	int ofs_factor = cfi->interleave * cfi->device_type;
+	int   count=len;
+	struct flchip *chip;
+	int chip_num,offst;
+	unsigned long timeo;
+	DECLARE_WAITQUEUE(wait, current);
+
+	/* Calculate which chip & protection register offset we need */
+	chip_num=((unsigned int)from/reg_sz);
+	offst=from-(reg_sz*chip_num)+base_offst;
+
+	while(count){
+		
+		if(chip_num>=cfi->numchips)
+			goto out;
+
+		/* Make sure that the chip is in the right state */
+
+		timeo = jiffies + HZ;
+		chip=&cfi->chips[chip_num];
+	retry:		
+		spin_lock_bh(chip->mutex);
+	
+		switch (chip->state) {
+		case FL_READY:
+		case FL_STATUS:
+		case FL_CFI_QUERY:
+		case FL_JEDEC_QUERY:
+			break;
+		
+		default:
+				/* Stick ourselves on a wait queue to be woken when
+				   someone changes the status */
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			spin_unlock_bh(chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			timeo = jiffies + HZ;
+			goto retry;
+		}
+			
+		/* Now read the data required from this flash */
+       
+		cfi_send_gen_cmd(0x90, 0x55,chip->start, map, cfi, cfi->device_type, NULL);
+		while(count && ((offst-base_offst)<reg_sz)){
+			*buf=map->read8(map,(chip->start+(extp->ProtRegAddr*ofs_factor)+offst));
+			buf++;
+			offst++;
+			count--;
+		}
+	       
+		chip->state=FL_CFI_QUERY;
+		spin_unlock_bh(chip->mutex);
+		/* Move on to the next chip */
+		chip_num++;
+		offst=base_offst;
+	
+	}
+	
+ out:	
+	wake_up(&chip->wq);
+	return len-count;
+}
+	
+static int cfi_intelext_read_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
+	int base_offst,reg_sz;
+	
+	/* Check that we actually have some protection registers */
+	if(!(extp->FeatureSupport&64)){
+		printk(KERN_WARNING "%s: This flash device has no protection data to read!\n",map->name);
+		return 0;
+	}
+
+	base_offst=(1<<extp->FactProtRegSize);
+	reg_sz=(1<<extp->UserProtRegSize);
+
+	return cfi_intelext_read_prot_reg(mtd, from, len, retlen, buf, base_offst, reg_sz);
+}
+
+static int cfi_intelext_read_fact_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
+	int base_offst,reg_sz;
+	
+	/* Check that we actually have some protection registers */
+	if(!(extp->FeatureSupport&64)){
+		printk(KERN_WARNING "%s: This flash device has no protection data to read!\n",map->name);
+		return 0;
+	}
+
+	base_offst=0;
+	reg_sz=(1<<extp->FactProtRegSize);
+
+	return cfi_intelext_read_prot_reg(mtd, from, len, retlen, buf, base_offst, reg_sz);
+}
+
 
 static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, __u32 datum)
 {
--- linux_2.4.13/include/linux/mtd/mtd.h	Tue Jun 12 18:30:27 2001
+++ linux/include/linux/mtd/mtd.h	Tue Nov 13 09:51:20 2001
@@ -180,6 +180,18 @@ struct mtd_info {
 	int (*read_oob) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
+	/* 
+	 * Methods to access the protection register area, present in some 
+	 * flash devices. The user data is one time programmable but the
+	 * factory data is read only. 
+	 */
+	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
+
+	int (*read_fact_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
+
+	/* This function is not yet implemented */
+	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
+
 	/* iovec-based read/write methods. We need these especially for NAND flash,
 	   with its limited number of write cycles per erase.
 	   NB: The 'count' parameter is the number of _vectors_, each of 
--- linux_2.4.13/drivers/mtd/mtdpart.c	Thu Oct  4 23:14:59 2001
+++ linux/drivers/mtd/mtdpart.c	Fri Nov  9 15:14:53 2001
@@ -195,6 +195,9 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.oobsize = master->oobsize;
 		slave->mtd.ecctype = master->ecctype;
 		slave->mtd.eccsize = master->eccsize;
+		slave->mtd.read_user_prot_reg = master->read_user_prot_reg;
+		slave->mtd.read_fact_prot_reg = master->read_fact_prot_reg;
+		slave->mtd.write_user_prot_reg = master->write_user_prot_reg;
 
 		slave->mtd.name = parts[i].name;
 		slave->mtd.bank_size = master->bank_size;
--- linux_2.4.13/include/linux/mtd/cfi.h	Thu Oct  4 23:13:18 2001
+++ linux/include/linux/mtd/cfi.h	Mon Nov 12 16:20:22 2001
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
