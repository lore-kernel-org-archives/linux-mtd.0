Received: from web13608.mail.yahoo.com ([216.136.175.119])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15t8oH-0005Wp-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2001 15:33:41 +0100
Message-ID: <20011015144252.54361.qmail@web13608.mail.yahoo.com>
Date: Mon, 15 Oct 2001 07:42:52 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: Serious flash problems - bad inodes?
To: linux-mtd@lists.infradead.org, jffs-dev@axis.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I have been successfully using (or so I thought) MTD/JFFS2 (cvs from around 15 Sep 01) on my flash
device on my embedded system (ZFMicro cpu, kernel 2.4.8-ac21) but had a fatal error last night.  I
have only been using the mounted flash device as a backup for some particular data files that are
in my tmpfs filesystem so it hasn't had a lot of use.  My guess is that I have copied and deleted
say 100 files from flash all of which were around 128kBytes of size.  I have had no problems until
yesterday when I tried to copy a file over to flash.  So, here is some copied test from my system
that says it all.  I begin with the relevant lines from dmesg concerning mtd/jffs2.

from dmesg:

physmap flash device: 800000 at 10000000
Physically mapped flash: Found 1 x8 devices at 0x0 in 8-bit mode
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
ftl_cs: FTL header not found.
RAMDISK: Compressed image found at block 0
Uncompressing.................................................................done.
Freeing initrd memory: 1159k freed
VFS: Mounted root (ext2 filesystem).
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0000: 0x079d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0004: 0xbc00 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0008: 0x7b80 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f000c: 0xb780 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0010: 0xcc2f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0014: 0xc0fe instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0018: 0x14c7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f001c: 0xf069 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0020: 0x6bc2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0024: 0x040d instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x000f93c0
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x000f0000 is not formatted. It will be erased
Waiting for chip to read, status = 4
Newly-erased block contained word 0x580b079d at offset 0x000f0000

*************
This is a similar dmesg to the usual one for me. The only difference is on the lines ... Magic
bitmask 0x1985 not found at 0xblah: hexvalue in the past have had different hex values than above.
  I don't understand the warnings/errors but it has worked fine so I didn't look at the closer. 
Are these typical?
*************

I have the flash device mounted on /flash here is what happens....

# cd /flash
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963      3073       890  78% /
/dev/mtdblock0            8192       420      7772   5% /flash
tmpfs                    24576         0     24576   0% /sdram

Now my panic begins when I see the following:

#
# ls
Unknown INCOMPAT nodetype FFFF at 0076CC3C
Unknown INCOMPAT nodetype FFFF at 0076CAC0
Unknown INCOMPAT nodetype FFFF at 0076C9BC
Unknown INCOMPAT nodetype FFFF at 0076C8F4
Unknown INCOMPAT nodetype FFFF at 0076C830
Unknown INCOMPAT nodetype FFFF at 0076C778
Unknown INCOMPAT nodetype FFFF at 0076C6C8
Unknown INCOMPAT nodetype FFFF at 0076C5F0
Unknown INCOMPAT nodetype FFFF at 0076C524
Unknown INCOMPAT nodetype FFFF at 0076C460
Unknown INCOMPAT nodetype FFFF at 0076C3A8
Unknown INCOMPAT nodetype FFFF at 0076C2F8
Unknown INCOMPAT nodetype FFFF at 0076C228
Unknown INCOMPAT nodetype FFFF at 0076C160
Unknown INCOMPAT nodetype FFFF at 0076C07C
Unknown INCOMPAT nodetype FFFF at 0076BF88
Unknown INCOMPAT nodetype FFFF at 0076BE0C
Unknown INCOMPAT nodetype FFFF at 0076BCE4
Unknown INCOMPAT nodetype FFFF at 0076BC2C
Unknown INCOMPAT nodetype FFFF at 0076BB44
Unknown INCOMPAT nodetype FFFF at 0076BA8C
Unknown INCOMPAT nodetype FFFF at 0076B9DC
Unknown INCOMPAT nodetype FFFF at 0076B92C
Unknown INCOMPAT nodetype FFFF at 0076B870
Unknown INCOMPAT nodetype FFFF at 0076B7CC
Unknown INCOMPAT nodetype FFFF at 0076B6FC
Unknown INCOMPAT nodetype FFFF at 0076B590
Unknown INCOMPAT nodetype FFFF at 0076B3B8
Unknown INCOMPAT nodetype FFFF at 0076B1C0
Unknown INCOMPAT nodetype FFFF at 0076AFD8
Unknown INCOMPAT nodetype FFFF at 0076AE50
Unknown INCOMPAT nodetype FFFF at 0076AD24
jffs2_read_inode(): No data nodes found for ino #53
ls: ./runGenerator.rbf: Input/outputUnknown INCOMPAT nodetype FFFF at 007FE350
 error                                                                        
Unknown INCOMPAT nodetype FFFF at 007FDCA4
Unknown INCOMPAT nodetype FFFF at 007FD60C
Unknown INCOMPAT nodetype FFFF at 007FCDD0
jffs2_read_inode(): No data nodes found for ino #6
ls: ./FPGAconfigurator: Input/outputUnknown INCOMPAT nodetype FFFF at 007FFD44
 error                                                                        
Unknown INCOMPAT nodetype FFFF at 007FF688
Unknown INCOMPAT nodetype FFFF at 007FF02C
Unknown INCOMPAT nodetype FFFF at 007FE838
Unknown INCOMPAT nodetype FFFF at 007E000C
jffs2_read_inode(): No data nodes found for ino #2
ls: ./fpgaCron: Input/output error                
fpga.log  fpga.rbf
#
#
#

I seem to have lost the files FPGAconfigurator,fpgaCron, and runGenerator.rbf??

I then try to copy something (namely /etc/issue) over to flash):

# 
# cp /etc/issue .
Last[2] is ff, datum is 85
Write of 68 bytes at 0x0076ecec failed. returned 0, retlen 0
Not marking the space at 0x0076ecec as dirty because the flash driver returned retlen zero
cp: unable to open `./issue': Input/output error

Is the flash dead at this moment?

# cd
# umount -a
VFS: Busy inodes after unmount. Self-destruct in 5 seconds.  Have a nice day...
#  
# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963      3073       890  78% /
#
#
# mount -a
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
JFFS2: Erase block at 0x00030000 is not formatted. It will be erased
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
JFFS2: Erase block at 0x00050000 is not formatted. It will be erased
JFFS2: Erase block at 0x00060000 is not formatted. It will be erased
JFFS2: Erase block at 0x00070000 is not formatted. It will be erased
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
JFFS2: Erase block at 0x00090000 is not formatted. It will be erased
JFFS2: Erase block at 0x000a0000 is not formatted. It will be erased
JFFS2: Erase block at 0x000b0000 is not formatted. It will be erased
JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
JFFS2: Erase block at 0x000d0000 is not formatted. It will be erased
JFFS2: Erase block at 0x000e0000 is not formatted. It will be erased
JFFS2: Erase block at 0x000f0000 is not formatted. It will be erased
JFFS2: Erase block at 0x00100000 is not formatted. It will be erased
JFFS2: Erase block at 0x00110000 is not formatted. It will be erased

[....  STUFF DELETED FOR SAKE OF REDUNDANCY  ....]

JFFS2: Erase block at 0x00720000 is not formatted. It will be erased
JFFS2: Erase block at 0x00730000 is not formatted. It will be erased
JFFS2: Erase block at 0x00740000 is not formatted. It will be erased
JFFS2: Erase block at 0x00750000 is not formatted. It will be erased
JFFS2: Erase block at 0x00760000 is not formatted. It will be erased
JFFS2: Erase block at 0x00770000 is not formatted. It will be erased
JFFS2: Erase block at 0x00780000 is not formatted. It will be erased
JFFS2: Erase block at 0x00790000 is not formatted. It will be erased
JFFS2: Erase block at 0x007a0000 is not formatted. It will be erased
JFFS2: Erase block at 0x007b0000 is not formatted. It will be erased
JFFS2: Erase block at 0x007c0000 is not formatted. It will be erased
JFFS2: Erase block at 0x007d0000 is not formatted. It will be erased
JFFS2: Erase block at 0x007e0000 is not formatted. It will be erased
JFFS2: Erase block at 0x007f0000 is not formatted. It will be erased
Last[2] is ff, datum is 85                                          
Write clean marker to block at 0x007f0000 failed: -5
# Last[2] is ff, datum is 85                        
Write clean marker to block at 0x007e0000 failed: -5

#
# cd /flash
# ls

(nothing)


so if I unmount and mount it reformats.... Yikes.

Any suggestions on something to try would be greatly appreciated!

Thanks,
Luke

ps.

The flash chip is a Am29LV065D:
    - 64 Megabit (8M x 8-bit)
    - uniform sector flash memory
    - 128 64 Kbyte sectors
    - CFI compliant
    


__________________________________________________
Do You Yahoo!?
Make a great connection at Yahoo! Personals.
http://personals.yahoo.com
