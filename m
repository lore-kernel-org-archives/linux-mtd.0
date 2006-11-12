Received: from bay0-omc2-s19.bay0.hotmail.com ([65.54.246.155])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GjGlX-0003GH-8x
	for linux-mtd@lists.infradead.org; Sun, 12 Nov 2006 09:57:11 -0500
Message-ID: <BAY110-F32A6EB9F3E87C5E05CF04EB2F50@phx.gbl>
In-Reply-To: <Pine.LNX.4.63.0611121438500.21876@redbean.intranet.gw-instruments.de>
From: "Ming Liu" <eemingliu@hotmail.com>
To: pewi@gw-instruments.de
Subject: Re: how to adress flash memory in Linux
Date: Sun, 12 Nov 2006 14:56:53 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Peter,
Here is the booting information about my cfi flash. Maybe it's useful for 
you to help on my questions. :-)

eth%d: XTemac using sgDMA mode.
eth%d: XTemac buffer_descriptor_space: phy: 0x3c90000, virt: 0xff100000, 
size: 0x5000
eth0: Xilinx TEMAC #0 at 0x81200000 mapped to 0xC4000000, irq=0
physmap flash device: 800000 at 22000000
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Searching for RedBoot partition table in phys_mapped_flash at offset 
0x7c0000
No RedBoot partition table detected in phys_mapped_flash
NAND device: Manufacturer ID: 0x98, Chip ID: 0x39 (Toshiba NAND 8MiB 1,8V 
8-bit)
flash size: 8 MiB
page size: 512 bytes
OOB area size: 16 bytes
sector size: 8 KiB
pages number: 16384
pages per sector: 16
bus width: 8
bits in sector size: 13
bits in page size: 9
bits in OOB size: 4
flash size with OOB: 8448 KiB
page address bytes: 3
sector address bytes: 2
options: 0x62
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 8MiB 1,8V 8-bit":
0x00000000-0x00800000 : "NAND simulator partition"
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2

Here it says "Creating 1 MTD partitions on "NAND 8MiB 1,8V 8-bit":". So it 
looks like that I have not yet provided my own partition information. So 
what shall I do?..... Thank you for helping.

Regards
Ming

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
