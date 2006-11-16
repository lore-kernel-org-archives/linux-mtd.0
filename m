Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GknPZ-0007Vw-85
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 15:00:44 -0500
Message-ID: <455CC35B.5080705@valcom.com>
Date: Thu, 16 Nov 2006 15:00:27 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: 2.6 Kernel not mounting JFFS2 partition
Content-Type: text/plain; charset=windows-1252
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

 Artem Bityutskiy wrote:
> Hello Glen,
>
> On Wed, 2006-11-15 at 10:55 -0500, Glen Johnson wrote:
>   
>> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
>> 0x9b9a instead
>>     
>
> Your problem is quite common so you inspired me to add a FAQ entry about
> it. Please, read
>
> http://www.linux-mtd.infradead.org/faq/jffs2.html#L_magicnfound
>
>   
Mr. Bityutskiy,
Thank you for your reply. Your FAQ answered a variety of questions for
me. I went back through the process one more time following your
directions and ended up with a Kernel panic. I will walk through exactly
what I did and then at the bottom of this message I will include my
capture log.
After I read your FAQ I looked into which flash type I am using
(AM29LV3200B-90E1) which is a NOR type flash. I then powered up my
target system did the following:
1. "eraseall /dev/mtd2" which ended with "Erased 2048 Kibyte @ 0 -- 100%
complete."
2. cd /var/tmp
3. mkdir jffs2
4. echo 'Hello world' > jffs2/hi.txt
5. mkfs.jffs2 -d jffs2 -o jffs2.img
6. cp jffs2.img /dev/mtd2

As a step of verification I briefly read back the contents of /dev/mtd2.
7. dd if=/dev/mtd2 this produced some weird text, the filename hi.txt,
some more weird text, Hello world!, and finally
a MESS of "ÿÿ". I hit ^C to cut it short. Seeing the hi.txt and Hello
world! gave me the verification that I did
indeed create the jffs2 partition.
8. mount -t jffs2 mtd2 /mnt/ Once again many error messages/info
messages. Finally it died with these last lines:
You cannot use older JFFS2 filesystems with newer kernels
JFFS2 notice: (31) read_unknown: node header CRC failed at 0x18f070. But
it must have been OK earlier.
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000030)
# BUG: failure at fs/jffs2/readinode.c:353/read_unknown()!
Kernel panic - not syncing: BUG!

I keep seeing "You cannot use older JFFS2 filesystems with newer kernel"
however, I am using uClinux's most up to date kernel 2.6.17-uc1. Am I
using an oudated fs/jffs2/readinode.c? My fs/jffs2/readinode.c claims to
be at * $Id: readinode.c,v 1.143 2005/11/07 11:14:41 gleixner Exp $. Any
further thoughts or recommendations would be greatly appreciated.

Capture log listed below :
=================

U-Boot 1.1.2 (Jul 11 2005 - 11:28:55)

CPU: MOTOROLA MCF5272 (Mask:1)
Board: Valcom VIP8XX
DRAM: 16 MB
FLASH: 4 MB
In: serial
Out: serial
Err: serial
Enter password to stop autoboot: 2 1 0

TFTP from server 192.168.11.111; our IP address is 192.168.11.112
Filename 'vcisc-1.03.pkg'.
Load address: 0x200000
Loading: #################################################################
#################################################################
###################################################
done
Bytes transferred = 922096 (e11f0 hex)
Automatic boot of image at addr 0x00200000 ...
## Booting image at 00200000 ...
Image Name:
Image Type: M68K Linux Kernel Image (gzip compressed)
Data Size: 922032 Bytes = 900.4 kB
Load Address: 00020000
Entry Point: 00020000
Verifying Checksum ... OK
Uncompressing Kernel Image ... OK

Starting kernel ...

Linux version 2.6.17-uc1 (glen@ekul) (gcc version 4.1.1) #8 Tue Nov 14
12:08:38 EST 2006


uClinux/COLDFIRE(m5272)
COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
Built 1 zonelists
Kernel command line: rootfstype=romfs
PID hash table entries: 64 (order: 6, 256 bytes)
Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory available: 6036k/8192k RAM, (1011k kernel code, 148k data)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
io scheduler noop registered
io scheduler cfq registered (default)
ColdFire internal UART serial driver version 1.00
ttyS0 at 0x10000100 (irq = 73) is a builtin ColdFire UART
ttyS1 at 0x10000140 (irq = 74) is a builtin ColdFire UART
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
FEC ENET Version 0.2
fec: PHY @ 0x0, ID 0x001378e2 -- LXT971
eth0: ethernet 00:00:00:00:00:00
SnapGear flash probe(0xffc00000,4194304,1): 400000 at ffc00000
Flash: Found 1 x16 devices at 0x0 in 8-bit bank
Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 3 MTD partitions on "Flash":
0x00000000-0x00080000 : "Das U-Boot"
0x00080000-0x00200000 : "Kernel"
0x00200000-0x00400000 : "JFFS2"
SnapGear ram probe(0x141fac,798720,4): c3000 at 141fac
Creating 1 MTD partitions on "RAM":
0x00000000-0x000c3000 : "Romfs"
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
VFS: Mounted root (romfs filesystem) readonly.
Freeing unused kernel memory: 48k freed (0x127000 - 0x132000)
init: Failed to open /etc/inittab.# eraseall /dev/mtd2
Erasing 64 Kibyte @ 0 -- 0 % complete.
---------8<------------------8<---------
Cut out lots of the same.
---------8<------------------8<---------
Erased 2048 Kibyte @ 0 -- 100% complete.
# cd /var/tmp
# mkdir jffs2
# echo 'Hello world!' > jffs2/hi.txt
# mkfs.jffs2 -d jffs2 -o jffs2.img
# cp jffs2.img /dev/mtd2
# dd -if=/dev/mtd2
…à^A^@^@^@.N(D^@^@^@^A^@^@^@^@^@^@^@^B8C^SA^F^H^@^XAA^E"O^^ÆQhi.txtÿÿa^B^@^@^@^QE2AO^@^@^@^B^@^@^@^A^@^@^@^^@^@^@^^@^@^@^½Ý¢Ãö¥©kHello
world!
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ^C
# mount -t jffs2 mtd2 /mnt/
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x007c instead
Further such events for this erase block will not be printed
---------8<------------------8<---------
Cut out lots of the same.
---------8<------------------8<---------
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0024:
0x4a10 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x001fa1ec
You cannot use older JFFS2 filesystems with newer kernels
Old JFFS2 bitmask found at 0x001fda6c
You cannot use older JFFS2 filesystems with newer kernels
JFFS2 notice: (31) read_unknown: node header CRC failed at 0x18f070. But
it must have been OK earlier.
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000030)
# BUG: failure at fs/jffs2/readinode.c:353/read_unknown()!
Kernel panic - not syncing: BUG!

Thank you,
Glen Johnson
