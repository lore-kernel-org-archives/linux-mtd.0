From: samoutin@hotbox.ru (Alex Samoutin)
Date: Tue, 11 Feb 2003 09:51:30 -0800
Subject: kernel BUG at wbuf.c
Message-ID: <005f01c2d1f6$3848cb90$1a00a8c0@itc.intrinsyc.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I have a problem with JFFS2 at raw NAND chip when disk is full.
When disk is full and I try to delete files I got kernel BUG at wbuf.c (see
log below).
If disk not full - all works normally.
Can it be connected with endian problems? (I am using IBM 405ep board)?
And is it correct to create empty JFFS partition as I did? (see next few
lines)

Thank you.

------------------------------------------------
NAND device: Manufacture ID: 0x98, Chip ID: 0x75 (Toshiba NAND 32MB 3,3V)
Creating 3 MTD partitions on "NAND 32MB 3,3V":
0x00000000-0x00200000 : "NAND flash partition 1"
0x00200000-0x00800000 : "NAND flash partition 2"
0x00800000-0x00a00000 : "NAND flash partition 3"

debian:/home# ./eraseall /dev/mtd0
......

debian:/home# mount -t jffs2 /dev/mtdblock0 /mnt/nand

.......

debian:/home# cp /usr/bin/* /mnt/nand

nand_read_ecc: from = 0x001f8000, len = 16
nand_read_ecc: from = 0x001f8044, len = 16
nand_read_ecc: from = 0x001f8070, len = 16
nand_write_ecc: to = 0x001f8000, len = 512
nand_writev: to = 0x001f8200, len = 1536, count = 1
nand_read_ecc: from = 0x001f88b8, len = 16
nand_write_ecc: to = 0x001f8800, len = 512
nand_writev: to = 0x001f8a00, len = 1024, count = 1

. . . . . . .

nand_read_ecc: from = 0x0001332c, len = 16
nand_write_ecc: to = 0x00013200, len = 512
nand_writev: to = 0x00013400, len = 2048, count = 1
nand_read_ecc: from = 0x00013c5c, len = 16
nand_write_ecc: to = 0x00013c00, len = 512
nand_write_ecc: to = 0x00013e00, len = 512
nand_read_ecc: from = 0x0000c000, len = 16
nand_writev: to = 0x0000c000, len = 1536, count = 2
cp: writing `/mnt/nand/nex': No space left on device
cp: cannot create regular file `/mnt/nand/yes': No space left on device
cp: cannot create regular file `/mnt/nand/zdump': No space left on device

debian:/home#

nand_write_ecc: to = 0x0000c600, len = 512

debian:/home# rm a* /mnt/nand/a*
nand_read_ecc: from = 0x0000c800, len = 16
nand_read_ecc: from = 0x0000c834, len = 16
nand_read_ecc: from = 0x0000c868, len = 16
nand_read_ecc: from = 0x0000c89c, len = 16
nand_read_ecc: from = 0x0000c8d8, len = 16
nand_read_ecc: from = 0x00198000, len = 1052
nand_write_ecc: to = 0x0000c910, len = 1052
Write of 1052 bytes at 0x0000c910 failed. returned 0, retlen 1264
nand_read_ecc: from = 0x0000cd2c, len = 16
ARGH. About to write node to 0x0000cd2c on flash, but there are data already
there:
0x0000cd2c: 5f 86 68 82 f2 65 58 ad 37 37 6b 97 1a ea aa b6
jffs2_flash_writev(): Non-contiguous write to 0000cd2c
wbuf was previously 0000c800-0000c90e
kernel BUG at wbuf.c:280!
Oops: Exception in kernel mode, sig: 4
NIP: C0089340 XER: 00000000 LR: C0089340 SP: C0A3FDA0 REGS: c0a3fcf0 TRAP:
0700    Not tainted
MSR: 00009030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c0a3e000[125] 'rm' Last syscall: 10
last math 00000000 last altivec 00000000
PLB0: bear= 0x00000000 acr=   0x00000000 besr=  0x00000000
PLB0 to OPB: bear= 0x00000000 besr0= 0x00000000 besr1= 0x00000000

GPR00: C0089340 C0A3FDA0 C0A3E000 0000001A 00001030 00000001 00000020
C0180000
GPR08: 00609588 C015ACE0 00000000 C0A3FCC0 0000C910 1001EE7C 00000000
00000000
GPR16: 00000000 00000000 C0A3FE38 0000CD2C 00000000 00000000 FFFFFFFF
00000000
GPR24: C0A3FE28 00000002 C0C8A4C4 00000007 C0A3AA1C C0C8A4C4 00000000
0000CD2C
Call backtrace:
C0089340 C0081A84 C0082528 C007A4B0 C0047328 C0047448 C000475C
10001CE8 10002B90 100012FC 0FECAC30 00000000

[jffs2_flash_writev() - jffs2_write_dirent() - jffs2_do_unlink() -
jffs2_unlink()
vfs_unlinc() - sys_unlink() - ...]

Illegal instructjffs2_garbage_collect_thread(): pass
ion
debian:/home# jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem already occupied
