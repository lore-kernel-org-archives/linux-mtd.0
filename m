Received: from 62-177-159-132.static.bbeyond.nl ([62.177.159.132]
	helo=mail.opticon.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAs6M-0001DW-Ae
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 11:07:33 -0500
Received: from [192.168.0.70] (user70.opticon.com [192.168.0.70])
	by mail.opticon.com (8.12.11/8.12.11) with ESMTP id j2EG7OmL029062
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 17:07:25 +0100
Message-ID: <4235B6B9.9030608@opticon.com>
Date: Mon, 14 Mar 2005 17:07:21 +0100
From: Wolter Kamphuis <wolter.kamphuis@opticon.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <422EDE03.4080803@opticon.com> <423125F5.3070804@snapgear.com>
In-Reply-To: <423125F5.3070804@snapgear.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Can't load DOC driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Greg,

The 0xa4000000 address I mentioned in my previous emails seems to be the 
virtual address, not the physical address I thought it was. Thanks 
Dmitry for making that clear.

After changing the readdoc and writedoc macros to readb and writeb I was
able to get a correct manufactur id. The toggle bits also work so I'm
nearly there! Thanks Greg for the hint.

Now, for some reason the nand-chip id isn't found correctly, it should
be 0x75 (Toshiba:NAND 32MiB 3,3V 8-bit) but the driver find's 0xa5
(Toshiba:NAND 2GiB 1,8V 8-bit). If I hardcode the chip id to 0x75 and 
load the ftl module I'm able to read from /dev/mtdblock/0, however it's 
difficult to see if the information is correct.

I can't use the diskonchip module since that one doesn't support the 
32/64Mb DOC M+. I need to inftl module to be able to install a root 
filesystem right?

Will it be difficult to port the 32/64Mb DOC M+ to the new diskonchip 
driver? I'm certainly not an expert...

thanks in advance,
   Wolter Kamphuis


/ # modprobe -v ftl
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtdcore.ko
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtd_blkdevs.ko
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/ftl.ko
$Id: ftl.c,v 1.55 2005/01/17 13:47:21 hvr Exp $

/ # modprobe -v doc2001plus
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtdpart.ko
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docecc.ko
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/nand/nand_ids.ko
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/doc2001plus.ko

/ # modprobe -v docprobe
insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko
Using configured DiskOnChip probe address 0x0
drivers/mtd/devices/docprobe.c:250 (DoC_Probe) physadr=0x0 docptr=0xc4000000
drivers/mtd/devices/docprobe.c:142 (doccheck) physadr=0x0 ChipID=0x40
drivers/mtd/devices/docprobe.c:194 (doccheck) ChipID=0x40
drivers/mtd/devices/docprobe.c:203 (doccheck) tmp=0x0 tmpb=0x4 tmpc=0x0
drivers/mtd/devices/docprobe.c:256 (DoC_Probe) physadr=0x0 ChipID=0x40
DiskOnChip Millennium Plus found at address 0x0
drivers/mtd/devices/doc2001plus.c:364 (DoC_ScanChips) TAG
drivers/mtd/devices/doc2001plus.c:370 (DoC_ScanChips) TAG
drivers/mtd/devices/doc2001plus.c:381 (DoC_ScanChips) TAG
drivers/mtd/devices/doc2001plus.c:313 (DoC_IdentChip) mfr=0x98
drivers/mtd/devices/doc2001plus.c:318 (DoC_IdentChip) id=0xa5
Flash chip found: Manufacturer ID: 98, Chip ID: A5 (Toshiba:NAND 32MiB 
3,3V 8-bit (FAKE))
_DoC_WaitReady called for out-of-line wait 

drivers/mtd/devices/doc2001plus.c:313 (DoC_IdentChip) mfr=0x98
drivers/mtd/devices/doc2001plus.c:318 (DoC_IdentChip) id=0xa5
Flash chip found: Manufacturer ID: 98, Chip ID: A5 (Toshiba:NAND 32MiB 
3,3V 8-bit (FAKE))
drivers/mtd/devices/doc2001plus.c:393 (DoC_ScanChips) TAG 

drivers/mtd/devices/doc2001plus.c:400 (DoC_ScanChips) TAG
drivers/mtd/devices/doc2001plus.c:408 (DoC_ScanChips) TAG
2 flash chips found. Total DiskOnChip size: 64 MiB
mtd: Giving out device 0 to DiskOnChip Millennium Plus
_DoC_WaitReady called for out-of-line wait
<<above line times ~30>>
_DoC_WaitReady called for out-of-line wait
ftl_cs: FTL header not found.
insmod: cannot insert 
`/lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko': 
Resource temporarily unavailable (-1): Resource temporarily unavailae
modprobe: failed to load module docprobe




Greg Ungerer wrote:
> Hi Wolter,
> 
> Wolter Kamphuis wrote:
> 
>> We're working on the Linux port for the E-ten P700. We've got a 
>> problem accessing the DiskOnChip (Millennium Plus 64Mb). The spec's we 
>> have (possibly outdated) say it should be mapped at address 0xA4000000 
>> but the driver (doc2001plus) can't find it there.
>>
>> The driver does find a DOC on all addresses < 0x04000000 offset 0x1000 
>> but fails to find the flash chips. Doesn't look right.
> 
> 
> Given that your finding the primary ID (0x40) I would suspect
> that your access functions are probably not quite right.
> 
> Are you using the correct bus width (8/16/32 bit) access?
> Are you accessing the registers on the appropriate offset
> boundaries?
> The region is not cached, right?
> 
> I have found on a few ARM platforms where I used DoC parts
> that I had to use different ReadDOC and WriteDOC macros in
> ~/include/linux/mtd/doc2000.h
> 
> Regards
> Greg
> 
> 
> 
> 
>> Is there a way to figure where the DOC is mapped without the use of 
>> JTAG (which we haven't). Maybe through a WindowsCE program?
>>
>> The P700 has a M-systems DOC+ MD-3331-D64-V3
>> We start the kernel using HaRET, below is the output. I've added some 
>> debug to the docprobe and doc2001plus drivers.
>>
>>
>> E-ten bootloader starting:
>> *******Beginning System Initialization*******
>>          CPU ID     = A0 PXA255
>>          SDCLK[1]   = MemClk
>>          MemClk     = 99.53 MHz
>>          Run Mode   = 2 * MemClk
>>          Turbo Mode = 2 * Run Mode
>> Mode:    TURBO
>>
>> MMU Enabled!
>> ******************************************************
>> ******************************************************
>> ******************************************************
>> ******************************************************
>> ******************************************************
>> OEMInitDebugSerial using UART1
>>
>> *****************************************************************
>> *    Paladin, Version 2.30
>> *    Built: 13:00:27  Jan 26 2005
>> *
>> *
>> *    Copyright (C) 2003, E-TEN Information System Co., Ltd.
>> *****************************************************************
>> MSC1 Pre value = 7FF07FF0
>> MSC1 Post value = 7FF172FC
>> Tenerife ID = 1884D51
>> DC_0=0x1......
>> DC_1=0x43......
>> DC_2=0x1......
>> DC_4=0x4......
>> DC_5=0x1......
>> DC_8=0x868B8649......
>> M1_0=0x1......
>> M1_1=0x1B676CA0......
>> M1_2=0x117700B0......
>> M1_5=0x170211......
>> CC_0=0x2......
>> CC_2=0x200000......
>> CC_5=0x0......
>> SW_6=0xAABBCCDD......
>> ulStride=0x1E0......
>> (G1_BASE+GC_START_ADDR)=0x1B0......
>> ulStride=0x1E0..0x140..0x25800..
>> ulStride=0x1E0..0x140..0x9600..
>> FP06R=0x80000000......
>> FP07R=0x0......
>> FP08R=0x3......
>> FP08R aw=0x3......
>> FP07R aw=0x0......
>> FP0FR aw=0x10......
>> ====> Y = 320
>> ====> FB_BASE = B8300000
>> flRegisterComponents
>> Adapter Found....
>> flRegisterDOCPLUS()....
>> flRegisterINFTL()....
>> bdkReadInit OK!
>> read from 11 to 0x83FD0000  -> bdkReadBlock OK!
>> read from 12 to 0x83FD8000  -> bdkReadBlock OK!
>> read from 13 to 0x83FE0000  -> bdkReadBlock OK!
>> read from 14 to 0x83FE8000  -> bdkReadBlock OK!
>> read from 15 to 0x83FF0000  -> bdkReadBlock OK!
>> Version String is AB2110.100.0014.WWE.premium.   .100.0000
>>
>> RCSR = 0x00000001
>>
>> dwNK = EA0003FE
>>
>> memset(0x80040000, 0, 0x01EC0000);
>> memset(0x82000000, 0, 0x01F00000);
>> Launch OS image...
>> Launchà
>>
>>
>>
>> HaRET starting kernel:
>> x<x.ØxüxüØx<ÿØxx..x<Øxü.xü.x<.Øx.Øxü.x..x<.Øx.Øx<xx.x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x5 
>>
>> CPU: XScale-PXA255 [69052d06] revision 6 (ARMv5TE)
>>
>> CPU0: D VIVT undefined 5 cache
>> CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
>> CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
>> Machine: E-ten P700
>> Memory policy: ECC disabled, Data cache writethrough
>> Memory clock: 99.53MHz (*27)
>> Run Mode clock: 199.07MHz (*2)
>> Turbo Mode clock: 398.13MHz (*2.0, active)
>> Built 1 zonelists
>> Kernel command line: noinitrd console=ttyS1,38400n8 root=/dev/nfs 
>> init=/linuxrc ip=192.168.131.201:192.168.131.102::::: 
>> nfsroot=192.168.131.102:/mnt/nfsrootd
>> PID hash table entries: 256 (order: 8, 4096 bytes)
>>
>> Console: colour dummy device 80x30
>> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
>> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
>> Memory: 56MB = 56MB total
>> Memory: 54820KB available (1487K code, 330K data, 84K init)
>> Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
>> CPU: Testing write buffer coherency: ok
>> NET: Registered protocol family 16
>> NetWinder Floating Point Emulator V0.97 (double precision)
>> devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
>> devfs: boot_options: 0x1
>> ttyS0 at MMIO 0x40100000 (irq = 15) is a FFUART
>> ttyS1 at MMIO 0x40200000 (irq = 14) is a BTUART
>> ttyS2 at MMIO 0x40700000 (irq = 13) is a STUART
>> io scheduler noop registered
>> io scheduler anticipatory registered
>> io scheduler deadline registered
>> io scheduler cfq registered
>> loop: loaded (max 8 devices)
>> pxa2xx_udc: version 14-Dec-2003
>> usb0: Ethernet Gadget, version: Equinox 2004
>> usb0: using pxa2xx_udc, OUT ep2out-bulk IN ep1in-bulk
>> usb0: MAC 52:b1:32:84:10:2f
>> mice: PS/2 mouse device common for all mice
>> NET: Registered protocol family 2
>> IP: routing cache hash table of 512 buckets, 4Kbytes
>> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
>> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
>> TCP: Hash tables configured (established 2048 bind 2048)
>> NET: Registered protocol family 1
>> IP-Config: Guessing netmask 255.255.255.0
>> IP-Config: Complete:
>>       device=usb0, addr=192.168.131.201, mask=255.255.255.0, 
>> gw=255.255.255.255,
>>      host=192.168.131.201, domain=, nis-domain=(none),
>>      bootserver=192.168.131.102, rootserver=192.168.131.102, rootpath=
>> Looking up port of RPC 100003/2 on 192.168.131.102
>> udc: USB reset
>> usb0: full speed config #1: 100 mA, Ethernet Gadget, using CDC 
>> Ethernet Subset
>> Looking up port of RPC 100005/1 on 192.168.131.102
>> VFS: Mounted root (nfs filesystem).
>> Mounted devfs on /dev
>> Freeing init memory: 84K
>> BusyBox v1.00-rc3 (2005.02.25-09:50+0000) Built-in shell (ash)
>> Enter 'help' for a list of built-in commands.
>> / # modprobe -v doc2001plus
>> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtdcore.ko
>> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtdpart.ko
>> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docecc.ko
>> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/nand/nand_ids.ko
>> insmod    
>> /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/doc2001plus.ko
>>
>>
>>
>> Try address 0x1000:
>> / # modprobe -v docprobe doc_config_location=0x1000
>> insmod    
>> /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko 
>> doc_config_location=0x1000
>> Using configured DiskOnChip probe address 0x1000
>> drivers/mtd/devices/docprobe.c:142 (doccheck) 0x40
>> drivers/mtd/devices/docprobe.c:194 (doccheck) 0x40
>> drivers/mtd/devices/docprobe.c:255 (DoC_Probe) 0x40
>> DiskOnChip Millennium Plus found at address 0x1000
>> _DoC_WaitReady called for out-of-line wait
>> drivers/mtd/devices/doc2001plus.c:83 (_DoC_WaitReady) 65534 ReadDOC's
>> _DoC_WaitReady timed out.
>> _DoC_WaitReady called for out-of-line wait
>> drivers/mtd/devices/doc2001plus.c:83 (_DoC_WaitReady) 65534 ReadDOC's
>> _DoC_WaitReady timed out.
>> drivers/mtd/devices/doc2001plus.c:316 (DoC_IdentChip) mfr = 0x40
>> drivers/mtd/devices/doc2001plus.c:321 (DoC_IdentChip) id = 0x40
>> No flash chips recognised.
>> insmod: cannot insert 
>> `/lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko': 
>> Resource temporarily unavailable (-1): Resource temporarily unavailae
>> modprobe: failed to load module docprobe
>>
>>
>>
>> Try address 0xA4000000:
>> / # modprobe -v docprobe doc_config_location=0xA4000000
>> insmod    
>> /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko 
>> doc_config_location=0xA4000000
>> drivers/mtd/devices/docprobe.c:254 (DoC_Probe) physadr=0xa4000000 
>> docptr=0xc4000000
>> drivers/mtd/devices/docprobe.c:144 (doccheck) physadr=0xa4000000 
>> ChipID=0x85
>> No recognised DiskOnChip devices found
>> insmod: cannot insert 
>> `/lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko': 
>> Resource temporarily unavailable (-1): Resource temporarily unavailae
>> modprobe: failed to load module docprobe
>>
>> -------------------------------------------------------------------
>> Subscription options: 
>> http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
>> FAQ:       http://www.arm.linux.org.uk/armlinux/mlfaq.php
>> Etiquette: http://www.arm.linux.org.uk/armlinux/mletiquette.php
>>
> 
