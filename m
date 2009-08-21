Received: from mail-px0-f193.google.com ([209.85.216.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeP3d-0002i8-3P
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 08:01:13 +0000
Received: by pxi31 with SMTP id 31so1159624pxi.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Aug 2009 01:01:03 -0700 (PDT)
MIME-Version: 1.0
From: Wick <izhangxc@gmail.com>
Date: Fri, 21 Aug 2009 16:00:42 +0800
Message-ID: <ad2083bf0908210100l746717bcvcc7b394c00774e9c@mail.gmail.com>
Subject: physmap flash issue: buffer write error in ARM linux-2.6.23
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am using Micrel's BSP on my KS8695X development board, which contains
linux-2.6.23 built with arm-linux-gcc-4.2.1.

I've got a problem here - when I write to the flash, it reports many "buffer
write error" messages.

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "uboot"
mtd1: 00320000 00020000 "mImage"
mtd2: 000a0000 00020000 "syscfg"

/ # dd if=syscfg.fs of=/dev/mtdblock2
physmap-flash.0: buffer write error (status timeout)
end_request: I/O error, dev mtdblock2, sector 256
Buffer I/O error on device mtdblock2, logical block 32
lost page write due to I/O error on mtdblock2
physmap-flash.0: buffer write error (status timeout)
end_request: I/O error, dev mtdblock2, sector 264
Buffer I/O error on device mtdblock2, logical block 33
lost page write due to I/O error on mtdblock2
physmap-flash.0: buffer write error (status timeout)
end_request: I/O error, dev mtdblock2, sector 272
Buffer I/O error on device mtdblock2, logical block 34
lost page write due to I/O error on mtdblock2
physmap-flash.0: buffer write error (status timeout)
end_request: I/O error, dev mtdblock2, sector 280
... ...
physmap-flash.0: buffer write error (status timeout)
end_request: I/O error, dev mtdblock2, sector 1272
physmap-flash.0: buffer write error (status timeout)
5+0 records in
5+0 records out

However, this works fine in linux-2.4.17. I am able to dd a jffs2 loop file
and mount the flash as a mtdblock device on linux-2.4.

My flash is Intel 23F320J3(4MB, buswidth 8), and MTD configs is as below:

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=03000000
CONFIG_MTD_PHYSMAP_LEN=00400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=1

Really appreciate for your help.
