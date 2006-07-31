Received: from py-out-1112.google.com ([64.233.166.181])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7gLU-0007Q8-FK
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 18:34:53 -0400
Received: by py-out-1112.google.com with SMTP id x31so702314pye
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 15:34:40 -0700 (PDT)
Message-ID: <1b712b840607311534n2e67b5fcqde683b3469ccd65f@mail.gmail.com>
Date: Mon, 31 Jul 2006 17:34:40 -0500
From: "Brijesh Singh" <brijesh.ksingh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mtdparts kernel cmdline
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have enabled AMD NOR flash support in 2.6.10 kernel and using
mtdparts cmdline to partition NOR flash and mtd_debug utility to check
the flags and all.

1) If I use the below command line
Kernel cmdline: mtdparts=phys_mapped_flash:256k(uboot)ro,3M@0x40000(root)
Kernel creates two partitions as expected and if i exected mtd_debug command

     root~# mtd_debug info /dev/mtd0
        mtd.type = MTD_NORFLASH
       mtd.flags = MTD_ERASEABLE
        mtd.size = 262144 (256K)
         mtd.erasesize = 65536 (64K)
         mtd.oobblock = 0
         mtd.oobsize = 0
         mtd.ecctype = MTD_ECC_NONE
         regions = 0

# mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 3145728 (3M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

2) If i do not use any kernel command line  then


# mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 1

region[0].offset = 0x00000000
region[0].erasesize = 65536 (64K)
region[0].numblocks = 512
region[0].regionindex = 0



Can you give me a pointer on  why the "regions/offset/numblocks"
fields are blank when I use kernel cmdline parameter.



Thanks,

Brijesh

dmesg#
physmap flash device: 2000000 at 2000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
Using buffer write method
  Silicon revision: 4
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 1 sectors per group
  Temporary block unprotect: Supported
  Block protect/unprotect scheme: 4
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: 4 word page
  Vpp Supply Minimum Program/Erase Voltage: 11.5 V
  Vpp Supply Maximum Program/Erase Voltage: 12.5 V
  Top/Bottom Boot Block: Uniform, Top WP
phys_mapped_flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
0: offset=0x0,size=0x10000,blocks=512
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
DEBUG-CMDLINE-PART: parsing <256k(uboot)ro,3M@0x40000(root)>
DEBUG-CMDLINE-PART: partition 1: name <root>, offset 40000, size
300000, mask fl
ags 0
DEBUG-CMDLINE-PART: partition 0: name <uboot>, offset 0, size 40000, mask flags
3
DEBUG-CMDLINE-PART: mtdid=<phys_mapped_flash> num_parts=<2>
2 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 2 MTD partitions on "phys_mapped_flash":
0x00000000-0x00040000 : "uboot"
mtd: Giving out device 0 to uboot
0x00040000-0x00340000 : "root"
mtd: Giving out device 1 to root
