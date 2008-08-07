Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KR0Mb-00072d-Rw
	for linux-mtd@lists.infradead.org; Thu, 07 Aug 2008 07:56:50 +0000
Message-ID: <489AAA81.8000603@cetrtapot.si>
Date: Thu, 07 Aug 2008 09:55:45 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: hartleys <hartleys@visionengravers.com>
Subject: Re: flash_info and MEMGETREGIONCOUNT
References: <48986C4E.4060901@cetrtapot.si>
	<BD79186B4FD85F4B8E60E381CAEE190960DD5A@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190960DD5A@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hartleys wrote:
> On Tuesday, August 05, 2008 8:06 AM, Hinko Kocevar wrote:
>> Hi,
>>
>> I would like to know some info about the flash chip present
>> on the board. I found flash_info utility and can't seem to
>> get information about the region count with MEMGETREGIONCOUNT.
>> # /flash_info /dev/mtd0
>> Device /dev/mtd0 has 0 erase regions
>> # /flash_info /dev/mtd1
>> Device /dev/mtd1 has 0 erase regions
>> # /flash_info /dev/mtd2
>> Device /dev/mtd2 has 0 erase regions
> 
> I get the same results on my system. I'm not sure what "flash_info" is
> actually meant for.
> 
> Try the mtd_debug utility instead and see if that information is more
> helpful. Here's a sample output from one of my mtd partitions:
> 
> / # mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_WRITEABLE | MTD_BIT_WRITEABLE
> mtd.size = 262144 (256K)
> mtd.erasesize = 131072 (128K)
> mtd.writesize = 1
> mtd.oobsize = 0
> regions = 0
> 
> BTW, the regions = 0 is why the flash_info utility reports 0 erase
> regions.
> 

[Just a side note, patch is inlined just for evaluation, yesterdays reply with attached patch didn't go through the MTD maintainer/mail server]

Same here...
# /mtd_debug info /dev/mtd0 
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 65536 (64K)
mtd.erasesize = 32768 (32K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

# /mtd_debug info /dev/mtd1 
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 1179648 (1M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

Looking at the code I see that cfi_amdstd_setup() sets the erase region parameters to detected values. The same info can be also dumped in my flash map driver.

My investigation lead to add_mtd_partitions() that creates slave partitions out of master mtd partition - and where erase regions are not set for each slave partition.

Attached is a *dirty* patch that makes each slave partition hold the erase region info in addition to just erasesize.
Patch is just a proof of concept and should be rewritten, thus any pointers on how to improve it are welcomed!

And here are some of the results (lines with [xxxx..] are from kernel log):
# ./flash_info /dev/mtd0
[42949395.891554] Nr erase regions 3
[42949395.894925] 0: offset=0x0,size=0x4000,blocks=1
[42949395.905162] 1: offset=0x4000,size=0x2000,blocks=2
[42949395.910202] 2: offset=0x8000,size=0x8000,blocks=1
Device /dev/mtd0 has 3 erase regions
Region 0 is at 0x0 with size 0x4000 and has 0x1 blocks
Region 1 is at 0x4000 with size 0x2000 and has 0x2 blocks
Region 2 is at 0x8000 with size 0x8000 and has 0x1 blocks

# ./mtd_debug info /dev/mtd0
[42949414.642758] Nr erase regions 3
[42949414.646124] 0: offset=0x0,size=0x4000,blocks=1
[42949414.656363] 1: offset=0x4000,size=0x2000,blocks=2
[42949414.661395] 2: offset=0x8000,size=0x8000,blocks=1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 65536 (64K)
mtd.erasesize = 32768 (32K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 3

region[0].offset = 0x00000000
region[0].erasesize = 16384 (16K)
region[0].numblocks = 1
region[0].regionindex = 0
region[1].offset = 0x00004000
region[1].erasesize = 8192 (8K)
region[1].numblocks = 2
region[1].regionindex = 0
region[2].offset = 0x00008000
region[2].erasesize = 32768 (32K)
region[2].numblocks = 1
region[2].regionindex = 0

# flash_erase /dev/mtd0 0 1
Erase Total 1 Units
[42949452.398375] Nr erase regions 3
[42949452.408603] 0: offset=0x0,size=0x4000,blocks=1
[42949452.413376] 1: offset=0x4000,size=0x2000,blocks=2
[42949452.423585] 2: offset=0x8000,size=0x8000,blocks=1
Region 0 is at 0 of 1 sector and with sector size 4000
Region 1 is at 16384 of 2 sector and with sector size 2000
Region 2 is at 32768 of 1 sector and with sector size 8000
Performing Flash Erase of length 16384 at offset 0x0
Moving to region 1
 done
# flash_erase /dev/mtd0 0 2
Erase Total 2 Units
[42949458.054011] Nr erase regions 3
[42949458.057376] 0: offset=0x0,size=0x4000,blocks=1
[42949458.062136] 1: offset=0x4000,size=0x2000,blocks=2
[42949458.072363] 2: offset=0x8000,size=0x8000,blocks=1
Region 0 is at 0 of 1 sector and with sector size 4000
Region 1 is at 16384 of 2 sector and with sector size 2000
Region 2 is at 32768 of 1 sector and with sector size 8000
Performing Flash Erase of length 16384 at offset 0x0
Moving to region 1
Performing Flash Erase of length 8192 at offset 0x4000 done
# flash_erase /dev/mtd0 0 3
Erase Total 3 Units
[42949465.054067] Nr erase regions 3
[42949465.057435] 0: offset=0x0,size=0x4000,blocks=1
[42949465.062193] 1: offset=0x4000,size=0x2000,blocks=2
[42949465.072413] 2: offset=0x8000,size=0x8000,blocks=1
Region 0 is at 0 of 1 sector and with sector size 4000
Region 1 is at 16384 of 2 sector and with sector size 2000
Region 2 is at 32768 of 1 sector and with sector size 8000
Performing Flash Erase of length 16384 at offset 0x0
Moving to region 1
Performing Flash Erase of length 8192 at offset 0x6000
Moving to region 2
 done
# flash_erase /dev/mtd0 0 4
Erase Total 4 Units
[42949474.454087] Nr erase regions 3
[42949474.457454] 0: offset=0x0,size=0x4000,blocks=1
[42949474.462212] 1: offset=0x4000,size=0x2000,blocks=2
[42949474.472429] 2: offset=0x8000,size=0x8000,blocks=1
Region 0 is at 0 of 1 sector and with sector size 4000
Region 1 is at 16384 of 2 sector and with sector size 2000
Region 2 is at 32768 of 1 sector and with sector size 8000
Performing Flash Erase of length 16384 at offset 0x0
Moving to region 1
Performing Flash Erase of length 8192 at offset 0x6000
Moving to region 2
Performing Flash Erase of length 32768 at offset 0x8000
Moving to region 3
 done

PATCH:
------
diff -urN linux-2.6.26-clean/drivers/mtd/mtdpart.c linux-2.6.26/drivers/mtd/mtdpart.c
--- linux-2.6.26-clean/drivers/mtd/mtdpart.c	2008-07-13 23:51:29.000000000 +0200
+++ linux-2.6.26/drivers/mtd/mtdpart.c	2008-08-06 10:27:33.000000000 +0200
@@ -339,6 +339,14 @@
 
 	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
+	printk("Nr master erase regions %d\n", master->numeraseregions);
+	for (i=0; i<master->numeraseregions;i++){
+		printk("%d: offset=0x%x,size=0x%x,blocks=%d\n",
+		       i,master->eraseregions[i].offset,
+		       master->eraseregions[i].erasesize,
+		       master->eraseregions[i].numblocks);
+	}
+
 	for (i = 0; i < nbparts; i++) {
 
 		/* allocate the partition structure */
@@ -443,6 +451,7 @@
 			printk ("mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
 				parts[i].name, master->name, slave->mtd.size);
 		}
+
 		if (master->numeraseregions>1) {
 			/* Deal with variable erase size stuff */
 			int i;
@@ -451,12 +460,31 @@
 			/* Find the first erase regions which is part of this partition. */
 			for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
 				;
+			printk("first erase region %d for slave @ %d\n", i-1, slave->offset);
 
+			slave->mtd.eraseregions = kzalloc(sizeof(struct mtd_erase_region_info) * 
+				4, GFP_KERNEL);
+			
+			int j = 0;
 			for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
 				if (slave->mtd.erasesize < regions[i].erasesize) {
 					slave->mtd.erasesize = regions[i].erasesize;
 				}
+				slave->mtd.eraseregions[j].offset = regions[i].offset;
+				slave->mtd.eraseregions[j].erasesize = regions[i].erasesize;
+				slave->mtd.eraseregions[j].numblocks = regions[i].numblocks;
+				j++;
 			}
+			slave->mtd.numeraseregions = j;
+
+			printk("Nr slave erase regions %d\n", slave->mtd.numeraseregions);
+			for (i=0; i<slave->mtd.numeraseregions;i++){
+				printk("%d: offset=0x%x,size=0x%x,blocks=%d\n",
+				       i,slave->mtd.eraseregions[i].offset,
+				       slave->mtd.eraseregions[i].erasesize,
+				       slave->mtd.eraseregions[i].numblocks);
+			}
+
 		} else {
 			/* Single erase size */
 			slave->mtd.erasesize = master->erasesize;

------


Thanks,
Hinko
-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
