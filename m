Received: from mail.lingnu.com ([199.203.56.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1ODfvh-0006od-N3
	for linux-mtd@lists.infradead.org; Sun, 16 May 2010 15:39:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.lingnu.com (Postfix) with ESMTP id 3E6A1E74ACF7
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 May 2010 18:38:56 +0300 (IDT)
Received: from mail.lingnu.com ([127.0.0.1])
	by localhost (fiasco.lingnu.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfn7qKUAZmUT for <linux-mtd@lists.infradead.org>;
	Sun, 16 May 2010 18:38:55 +0300 (IDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.lingnu.com (Postfix) with ESMTP id 699D4E74ACF6
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 May 2010 18:38:55 +0300 (IDT)
Message-ID: <4BF011D7.4010907@shemesh.biz>
Date: Sun, 16 May 2010 18:40:07 +0300
From: Shachar Shemesh <shachar@shemesh.biz>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Wrong flash type in m25p80 driver
Content-Type: multipart/mixed; boundary="------------050407030006080306000801"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050407030006080306000801
Content-Type: multipart/alternative;
 boundary="------------030606050907010900050100"


--------------030606050907010900050100
Content-Type: text/plain; charset=windows-1255; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I've found a problem in the m25p80 driver (drives a bunch of SPI flash 
chips based on similar commands). While the commands that drive those 
chips are almost exactly the same, some variance between the chips does 
exist. Almost all of them have 64KB erase blocks, but some also have 
smaller 4KB erase sectors (terminology differs between chips, but the 
two sizes, fairly universally, don't).

My understanding of the mtd_info struct is that this is precisely what 
the "writesize" field is for - specifying different maximal and minimal 
erase sizes. The current m25p80 driver does not specify the two sizes 
correctly, which leads to total failure when trying to use it to create 
UBIFS volumes.

The second problem I'm having with this driver is that it reports itself 
as NOR flash. This is obviously not the case, but I'm a bit at a loss as 
to what is. These are not, exactly, NAND flashes. DATAFLASH is closer to 
the mark, as both these and the DATAFLASH had SPI interfaces, but 
setting the type to DATAFLASH triggers nasty behavior by the jffs2 code, 
which assumes that data flashes have erase blocks of either 536 or 1056 
bytes. The result is that it allocates 512KB of erase blocks, causing a 
1.5MB of overhead on each volume. For a 4MB flash, that is a large 
overhead to accept.

I'm attaching a patch to the m25p80 driver. I would love to receive 
comments on the correct flash type to put there for proper operation. 
Something that is compatible with jffs2 would be appreciated. I've 
written a fix to the jffs2 code, but I'm not sure of its correctness.

Thanks,
Shachar

-- 
Shachar Shemesh
Lingnu Open Source Consulting Ltd.
http://www.lingnu.com


--------------030606050907010900050100
Content-Type: text/html; charset=windows-1255
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body dir="ltr" bgcolor="#ffffff" text="#000000">
Hi all,<br>
<br>
I've found a problem in the m25p80 driver (drives a bunch of SPI flash
chips based on similar commands). While the commands that drive those
chips are almost exactly the same, some variance between the chips does
exist. Almost all of them have 64KB erase blocks, but some also have
smaller 4KB erase sectors (terminology differs between chips, but the
two sizes, fairly universally, don't).<br>
<br>
My understanding of the mtd_info struct is that this is precisely what
the "writesize" field is for - specifying different maximal and minimal
erase sizes. The current m25p80 driver does not specify the two sizes
correctly, which leads to total failure when trying to use it to create
UBIFS volumes.<br>
<br>
The second problem I'm having with this driver is that it reports
itself as NOR flash. This is obviously not the case, but I'm a bit at a
loss as to what is. These are not, exactly, NAND flashes. DATAFLASH is
closer to the mark, as both these and the DATAFLASH had SPI interfaces,
but setting the type to DATAFLASH triggers nasty behavior by the jffs2
code, which assumes that data flashes have erase blocks of either 536
or 1056 bytes. The result is that it allocates 512KB of erase blocks,
causing a 1.5MB of overhead on each volume. For a 4MB flash, that is a
large overhead to accept.<br>
<br>
I'm attaching a patch to the m25p80 driver. I would love to receive
comments on the correct flash type to put there for proper operation.
Something that is compatible with jffs2 would be appreciated. I've
written a fix to the jffs2 code, but I'm not sure of its correctness.<br>
<br>
Thanks,<br>
Shachar<br>
<pre class="moz-signature" cols="72">-- 
Shachar Shemesh
Lingnu Open Source Consulting Ltd.
<a class="moz-txt-link-freetext" href="http://www.lingnu.com">http://www.lingnu.com</a>
</pre>
</body>
</html>

--------------030606050907010900050100--

--------------050407030006080306000801
Content-Type: text/x-patch;
 name="erasesize.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="erasesize.patch"

Index: drivers/mtd/devices/m25p80.c
===================================================================
--- drivers/mtd/devices/m25p80.c	(revision 3333)
+++ drivers/mtd/devices/m25p80.c	(working copy)
@@ -212,7 +212,7 @@
 {
 	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB at 0x%08x\n",
 			dev_name(&flash->spi->dev), __func__,
-			flash->mtd.erasesize / 1024, offset);
+			flash->mtd.writesize / 1024, offset);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -255,7 +255,7 @@
 	/* sanity checks */
 	if (instr->addr + instr->len > flash->mtd.size)
 		return -EINVAL;
-	div_u64_rem(instr->len, mtd->erasesize, &rem);
+	div_u64_rem(instr->len, mtd->writesize, &rem);
 	if (rem)
 		return -EINVAL;
 
@@ -286,8 +286,8 @@
 				return -EIO;
 			}
 
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
+			addr += mtd->writesize;
+			len -= mtd->writesize;
 		}
 	}
 
@@ -831,9 +831,8 @@
 	else
 		flash->mtd.name = dev_name(&spi->dev);
 
-	flash->mtd.type = MTD_NORFLASH;
-	flash->mtd.writesize = 1;
-	flash->mtd.flags = MTD_CAP_NORFLASH;
+	flash->mtd.type = MTD_DATAFLASH;
+	flash->mtd.flags = MTD_WRITEABLE;
 	flash->mtd.size = info->sector_size * info->n_sectors;
 	flash->mtd.erase = m25p80_erase;
 	flash->mtd.read = m25p80_read;
@@ -845,12 +844,13 @@
 		flash->mtd.write = m25p80_write;
 
 	/* prefer "small sector" erase if possible */
-	if (info->flags & SECT_4K) {
+	flash->mtd.erasesize = info->sector_size;
+	if (info->flags & SECT_4K && (info->sector_size%4096)==0 ) {
 		flash->erase_opcode = OPCODE_BE_4K;
-		flash->mtd.erasesize = 4096;
+		flash->mtd.writesize = 4096;
 	} else {
 		flash->erase_opcode = OPCODE_SE;
-		flash->mtd.erasesize = info->sector_size;
+		flash->mtd.writesize = info->sector_size;
 	}
 
 	flash->mtd.dev.parent = &spi->dev;
@@ -860,10 +860,11 @@
 
 	DEBUG(MTD_DEBUG_LEVEL2,
 		"mtd .name = %s, .size = 0x%llx (%lldMiB) "
-			".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
+			".erasesize = 0x%.8x (%uKiB) .writesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
 		flash->mtd.name,
 		(long long)flash->mtd.size, (long long)(flash->mtd.size >> 20),
 		flash->mtd.erasesize, flash->mtd.erasesize / 1024,
+		flash->mtd.writesize, flash->mtd.writesize / 1024,
 		flash->mtd.numeraseregions);
 
 	if (flash->mtd.numeraseregions)

--------------050407030006080306000801--
