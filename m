Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Shoa-0007pO-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 15:56:28 +0000
Received: from shell9.ba.best.com ([206.184.139.140] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ShoY-0007pI-00
	for mtd@infradead.org; Tue, 13 Feb 2001 15:56:27 +0000
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200102131555.HAA26937@shell9.ba.best.com>
Subject: Trying to get CFI to work on my board.
To: jffs-dev@axis.com, mtd@infradead.org
Date: Tue, 13 Feb 2001 07:55:52 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I am trying to get CFI to work on my PowerPC 860 board so I can try jffs.
The CFI probe is failing would appriciate any help.  

My board has Intel 28F160S3 flash on it and my chip select CS0 is connected
to flash and value of BR0     0X28000000      OR0     0XFFC00742

Now when configuring the kernel I have following parameters set

CONFIG_MTD_CFI=m
CONFIG_MTD_CFI_INTELEXT=m
# CONFIG_MTD_CFI_AMDSTD is not set
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=m
# CONFIG_MTD_JEDEC is not set
CONFIG_MTD_PHYSMAP=m
CONFIG_MTD_PHYSMAP_START=28000000
CONFIG_MTD_PHYSMAP_LEN=3FFFFF
CONFIG_MTD_PHYSMAP_BUSWIDTH=2   

Now when I execute command modprobe -a physmap as suggested in recent HOWTO
I output shown at the end, 

In file physmap.c following statement remaps the flash address space to some
kernel space. 

 physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE); 

Correct?  So when I  execute virt_to_phys on physmap_map.map_priv_1 shouldn't
I get my "original" physical address of 0x28000000 back? but I am getting 
following output

  printk(KERN_NOTICE "physmap.map_priv_1 0x%08X, physical address 0x%08X\n",
    physmap_map.map_priv_1, virt_to_phys((void *)physmap_map.map_priv_1));  

 physmap.map_priv_1 0xC500F000, physical address 0x0500F000 
[ Sorry if this is too elementary question never played with ioremap before]

Output of modprobe -a physmap is 

sh-2.04# modprobe -a physmap
physmap flash device: size 0x003FFFFF at address 0x28000000
physmap.map_priv_1 0xC500F000, physical address 0x0500F000
Call to cfi_probe received
cfi_probe_new_chip  buswidth is 2 size 0x003FFFFF
physmap_read16::virtual address 0xC500F0AA maps to physical 0x0500F0AA
physmap_write8 at address 0xC500F0AA value 0x00009898
physmap_write16::virtual address 0xC500F0AA maps to physical 0x0500F0AA
physmap_read16::virtual address 0xC500F020 maps to physical 0x0500F020
physmap_read16::virtual address 0xC500F020 maps to physical 0x0500F020
physmap_read16::virtual address 0xC500F0AA maps to physical 0x0500F0AA
Physically mapped flash: Found no CFI device at location zero
cfi_cfi_probe returned NULL
/lib/modules/2.4.2-pre3/kernel/drivers/mtd/physmap.o: init_module: Device not configured
Hint: insmod errors can be caused by incorrect module parameters, including invalid IO or IRQ parameters
/lib/modules/2.4.2-pre3/kernel/drivers/mtd/physmap.o: insmod /lib/modules/2.4.2-pre3/kernel/drivers/mtd/physmap.o failed
/lib/modules/2.4.2-pre3/kernel/drivers/mtd/physmap.o: insmod physmap failed     

/Subodh Nijsure


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
