Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZnNOI-0006ev-2Z
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2015 09:03:03 +0000
Message-ID: <56220E89.90608@huawei.com>
Date: Sat, 17 Oct 2015 17:02:01 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Yanjiantao
 <yanjiantao@hisilicon.com>
CC: Caizhiyong <caizhiyong@hisilicon.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dmw2@infradead.org" <dmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 pengjiancheng <pengjiancheng@huawei.com>
Subject: Re: =?UTF-8?B?562U5aSNOiBbUEFUQ0hdIG10ZDogY21kbGluZXBhcnQ6IGFsbG8=?=
 =?UTF-8?B?dyBmaWxsLXVwIHBhcnRpdGlvbiBhdCBhbnkgcG9pbnQ=?=
References: <C3050A4DBA34F345975765E43127F10F62D61353@SZXEMA512-MBX.china.huawei.com>
 <A5C805F07496A54EAFF48B92DEC9C1057AECB167@SZXEMA501-MBX.china.huawei.com>
 <20151013175136.GX107187@google.com>
In-Reply-To: <20151013175136.GX107187@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 10/14/2015 1:51 AM, Brian Norris wrote:
> Hi,
> 
> First of all, I don't know why this message is in reply to the $subject
> thread. Bad block markers have nothing to do with cmdlineparts.
> 
> On Tue, Oct 13, 2015 at 08:53:04AM +0000, Yanjiantao wrote:
>> Hi,
>> In linux-3.10 and later kernel versions, block 'markbad' or 'checkbad' method is to mark or check 1st, 2nd/last page, which depends on chip->bbt_options:
>> markbad flows is as follows:
>>                 /* Write to first/last page(s) if necessary */
>>                 if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
>>                         wr_ofs += mtd->erasesize - mtd->writesize;
>>                 do {
>>                         res = nand_do_write_oob(mtd, wr_ofs, &ops);
>>                         if (!ret)
>>                                 ret = res;
>>
>>                         i++;
>>                         wr_ofs += mtd->writesize;
>>                 } while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
>> Check bad flows is the same.
>>
>> 1. when NAND_BBT_SCANLASTPAGE is set, markbad and checkbad on the last page only.
>> 2. when NAND_BBT_SCAN2NDPAGE is set, markbad and checkbad on the 1st and 2nd page.
> 
> Sounds right.
> 
>> Questions:
>> 1. for some NAND Flash, badblock marker is on 1st or 2nd or last page(spansion), in this case , check badblock my fail.
>> 2. for some NAND Flash, bad block marker is on 1st or last page(hynix H27UBG8T2CTR) , in this case, check badblock may fail too.
>> 3. set NAND_BBT_SCANLASTPAGE means only mark or check the last page, which is not compliant with SAMSUNG/ TOSHIBA/ HYNIX/MICRON/spansion. they claim bad block marker is on 1st/2nd, or 1st/last, or 1st/2nd/last, or the 1st only. 
> 
> We try our best to get the BBM locations correct. But we have
> acknowledged that there are corner cases out there that we don't get
> right. So far, I guess nobody really cares.
> 
> FWIW, in practice it seems that even when the datasheet says something
> specific like the descriptions you mention above, the factory process
> just fuses all bytes to zero (not just OOB, and not just in certain
> pages; but ALL bytes in the factory-marked bad block). Have you seen any
> failures as a result of bad BBM scans? Or is the problem just
> theoretical?
> 
Hi, Brian, Cai, Yan,

We triggered a BBM scan failure because of power cut. The chip is Micron
MT29F1G08ABAEAWP:E, whose BBM locates in the OOB of the first page in a
block.

However, nand_decode_bbm_options() sets NAND_BBT_SCAN2NDPAGE option, because
the chip satisifies: 1) manufacture is NAND_MFR_MICRON, 2) page size is 2048.

When checking bad, the BBM in the first OOB is correct, while the BBM in the
second OOB is 0. This leads to a lot of blocks are regarded as bad blocks.

I don't know what that means if the BBM in the second OOB is not 0xff. Can
we say that the block is good (the datasheet indicates "the first spare area
location in each bad block is guaranteed to contain the bad block mark")?

If we should follow the datasheet, maybe we could add some code to fix this:
* add a fixup table, which describes where the BBM locates
* when decoding bbm, lookup the table, and fix some specific chips

---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d87c7d0..44f0240 100644
index d87c7d0..44f0240 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3701,6 +3701,39 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
        }
 }

+static void nand_decode_bbm_fixup(struct nand_chip *chip, u8 id_data[8])
+{
+       struct nand_bbm_page *bbm;
+       int i, j;
+
+       for (i = 0;;i++) {
+               bbm = &nand_bbm_page_fixup[i];
+               if (!bbm->name)
+                       /* At the end of the table */
+                       break;
+               for (j = 0; j < NAND_MAX_ID_LEN; i++) {
+                       if (id_data[i] != bbm->id[i])
+                               continue;
+               }
+               /* Now we find the chip */
+               break;
+       }
+
+       if (bbm) {
+               if (bbm->bbm_pages & NAND_BBM_FIRSTPAGE) {
+                       chip->bbt_options &= ~NAND_BBT_SCANLASTPAGE;
+                       chip->bbt_options &= ~NAND_BBT_SCAN2NDPAGE;
+               }
+               if (bbm->bbm_pages & NAND_BBM_SECONDPAGE) {
+                       chip->bbt_options &= ~NAND_BBT_SCANLASTPAGE;
+                       chip->bbt_options |= NAND_BBT_SCAN_SCAN2NDPAGE;
+               }
+               if (bbm->bbm_pages & NAND_BBM_LASTPAGE) {
+                       chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+               }
+       }
+}
+
 /*
  * Set the bad block marker/indicator (BBM/BBI) patterns according to some
  * heuristic patterns using various detected parameters (e.g., manufacturer,
@@ -3736,6 +3769,8 @@ static void nand_decode_bbm_options(struct mtd_info *mtd,
                        (mtd->writesize == 2048 &&
                         maf_id == NAND_MFR_MICRON))
                chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
s00292274@linux-4hy3:linux$ git diff > 1
s00292274@linux-4hy3:linux$ cat 1
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d87c7d0..44f0240 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3701,6 +3701,39 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 }

+static void nand_decode_bbm_fixup(struct nand_chip *chip, u8 id_data[8])
+{
+	struct nand_bbm_page *bbm;
+	int i, j;
+
+	for (i = 0;;i++) {
+		bbm = &nand_bbm_page_fixup[i];
+		if (!bbm->name)
+			/* At the end of the table */
+			break;
+		for (j = 0; j < NAND_MAX_ID_LEN; i++) {
+			if (id_data[i] != bbm->id[i])
+				continue;
+		}
+		/* Now we find the chip */
+		break;
+	}
+
+	if (bbm) {
+		if (bbm->bbm_pages & NAND_BBM_FIRSTPAGE) {
+			chip->bbt_options &= ~NAND_BBT_SCANLASTPAGE;
+			chip->bbt_options &= ~NAND_BBT_SCAN2NDPAGE;
+		}
+		if (bbm->bbm_pages & NAND_BBM_SECONDPAGE) {
+			chip->bbt_options &= ~NAND_BBT_SCANLASTPAGE;
+			chip->bbt_options |= NAND_BBT_SCAN_SCAN2NDPAGE;
+		}
+		if (bbm->bbm_pages & NAND_BBM_LASTPAGE) {
+			chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+		}
+	}
+}
+
 /*
  * Set the bad block marker/indicator (BBM/BBI) patterns according to some
  * heuristic patterns using various detected parameters (e.g., manufacturer,
@@ -3736,6 +3769,8 @@ static void nand_decode_bbm_options(struct mtd_info *mtd,
 			(mtd->writesize == 2048 &&
 			 maf_id == NAND_MFR_MICRON))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	nand_decode_bbm_fixup(chip, id_data)
 }

 static inline bool is_full_id_nand(struct nand_flash_dev *type)
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index a8804a3..56e59b4 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -184,8 +184,18 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{0x0, "Unknown"}
 };

+/* BBM page fixup table */
+struct nand_bbm_page nand_bbm_page_fixup[] = {
+	{"MT29F1G08ABAEAWP:E",
+	 {0x2C, 0xF1, 0x80, 0x95, 0x04, 0x00, 0x00, 0x00},
+	 NAND_BBM_FIRSTPAGE
+	},
+	{NULL}
+};
+
 EXPORT_SYMBOL(nand_manuf_ids);
 EXPORT_SYMBOL(nand_flash_ids);
+EXPORT_SYMBOL(nand_bbm_page_fixup);

 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5a9d1d4..287874b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -829,8 +829,28 @@ struct nand_manufacturers {
 	char *name;
 };

+/**
+ * struct nand_bbm_page - NAND Flash Bad Block Marker Position
+ * @name:	NAND chip name
+ * @id:		Full device ID
+ * @bbm_page:	Which page the BBM locates: NAND_BBM_FIRSTPAGE,
+ *              NAND_BBM_SECONDPAGE, NAND_BBM_LASTPAGE
+ */
+struct nand_bbm_page {
+	char *name;
+	union {
+		struct {
+			uint8_t mfr_id;
+			uint8_t dev_id;
+		};
+		uint8_t id[NAND_MAX_ID_LEN];
+	};
+	unsigned int bbm_page;
+};
+
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
+extern struct nand_bbm_page nand_bbm_page_fixup[];

 extern int nand_default_bbt(struct mtd_info *mtd);
 extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);

thanks,
Sheng

> Also, you can refer to this (old) table of NAND flash [1] that I and a few
> others catalogued, and it notes a few flash that are not supported
> correctly. It may be a bit out of date.
> 
> Brian
> 
> [1] http://linux-mtd.infradead.org/nand-data/nanddata.html
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
