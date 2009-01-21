Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPa88-0002B6-G0
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 10:16:19 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1592238yxi.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jan 2009 02:16:15 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 21 Jan 2009 18:16:15 +0800
Message-ID: <a0e7fce50901210216r664058b8t7b65202429e9de18@mail.gmail.com>
Subject: [BUG] block erase error: (status timeout)
From: yi li <liyi.dev@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am running Linux-2.6.28 on Blackfin BF548-EZKIT with on board
Parallel NOR flash.
When running bonnie++ test on JFFS2 on the flash, it triggers error:
"block erase error: (status timeout) ".
I am wondering, what is the possible cause for this error.

Details bellow:

Kernel boot message:
"physmap platform flash device: 02000000 at 20000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
physmap-flash.0: Found an alias at 0x1000000 for the chip at 0x0
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x20000,blocks=127
erase region 1: offset=0xfe0000,size=0x8000,blocks=4
RedBoot partition parsing not available
Using physmap partition information
Creating 3 MTD partitions on "physmap-flash.0":
0x00000000-0x00040000 : "bootloader(nor)"
0x00040000-0x00440000 : "linux kernel(nor)"
0x00440000-0x01000000 : "file system(nor)"
"

root:/> flash_eraseall -j /dev/mtd2
Erasing 128 Kibyte @ bc0000 -- 100 % complete.Cleanmarker written at ba0000.
root:/>
root:/> mount -t jffs2 /dev/mtdblock2 /mnt/
root:/> bonnie++ -u root -d /mnt
Using uid:0, gid:0.
Writing a byte at a time...physmap-flash.0: block erase error: (status
timeout)
Erase at 0x00b60000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x00ae0000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x00aa0000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x00a80000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x00a00000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x009c0000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x00980000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x00920000 failed immediately: errno -62
physmap-flash.0: block erase error: (status timeout)
Erase at 0x008e0000 failed immediately: errno -62
[snip]

There is not such error if disabling the per character I/O test, i,e. running
bonnie++ as:
root:/> bonnie++ -u root -d /mnt -f
This would works fine.

root:/> cat /proc/cpuinfo
processor       : 0
vendor_id       : Analog Devices
cpu family      : 0x27de
model name      : ADSP-BF548 525(MHz CCLK) 131(MHz SCLK) (mpu off)
stepping        : 1
cpu MHz         : 525.000/131.250000
bogomips        : 1044.48
Calibration     : 522240000 loops
cache size      : 16 KB(L1 icache) 32 KB(L1 dcache-wt) 0 KB(L2 cache)
dbank-A/B       : cache/cache
icache setup    : 4 Sub-banks/4 Ways, 32 Lines/Way
dcache setup    : 2 Super-banks/4 Sub-banks/2 Ways, 64 Lines/Way
L2 SRAM         : 128KB
board name      : ADI BF548-EZKIT
board memory    : 65536 kB (0x00000000 -> 0x04000000)
kernel memory   : 63480 kB (0x00001000 -> 0x03dff000)

Best Regards,

-Li Yi
