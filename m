Received: from web53606.mail.yahoo.com ([206.190.37.39])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E6lgk-0008Ai-Ra
	for linux-mtd@lists.infradead.org; Sun, 21 Aug 2005 05:00:29 -0400
Message-ID: <20050821085340.52982.qmail@web53606.mail.yahoo.com>
Date: Sun, 21 Aug 2005 01:53:40 -0700 (PDT)
From: Komal Shah <komal_shah802003@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: [omap2420 NOR] mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have added the nor flash support for omap2420. I am using the
omap_nor.c as mapping driver. [note: disabled set_vpp function..as it
too specifc to omap1].

o Flash is getting detected, but unable to mount the jffs2 filesystem.
o Right now I am flashing it through u-boot. [Will try flashing from
ramdisk..as my jffs2 fs size is ~1.9M]

Kernel output: (filesystem is flashed at 0x04240000 location)

Linux version 2.6.13-rc6-omap1 (komal@everest) (gcc version 3.4.3
(release) (Co
deSourcery ARM Q1B 2005)) #5 Thu Aug 18 22:06:50 IST 2005
CPU: Some Random V6 Processor [4107b362] revision 2 (ARMv6TEJ)
Machine: OMAP2420 H4 board
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIPT write-back cache
CPU0: I cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
CPU0: D cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
Built 1 zonelists
Kernel command line: console=ttyS0,115200n8 noinitrd
root=/dev/mtdblock3 rootfstype=jffs2 rw
IRQ: Found an INTC at 0x480fe000 (revision 1.0) with 96 interrupts
Total of 96 interrupts on 1 active controller
OMAP24xx GPIO hardware version 1.5
PID hash table entries: 1024 (order: 10, 16384 bytes)
OMAP2 GP timer (HW version 1.2)
Console: colour dummy device 80x30
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 128MB 0MB = 128MB total
Memory: 128256KB available (1186K code, 271K data, 68K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
Linux NoNET1.0 for Linux 2.6
Initializing OMAP McBSP system
mcbsp: could not acquire dsp_ck handle.
omapdsp: unsupported omap architecture.
USB: No board-specific platform config found
Checking V6 block cache operations:
           Prefetch data range: supported
   Clean+Invalidate data range: supported
              Clean data range: supported
         Invalidate data range: supported
        Invalidate instr range: supported
 --> Using harvard block cache invalidate
 --> Using block cache clean
 --> Using block cache clean+invalidate
NetWinder Floating Point Emulator V0.97 (double precision)
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Serial: 8250/16550 driver $Revision: 1.90 $ 32 ports, IRQ sharing
enabled
ttyS0 at MMIO 0x4806a000 (irq = 72) is a ST16654
ttyS1 at MMIO 0x4806c000 (irq = 73) is a ST16654
ttyS2 at MMIO 0x4806e000 (irq = 74) is a ST16654
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
loop: loaded (max 8 devices)
omapflash.0: Found 1 x16 devices at 0x0 in 16-bit bank
omapflash.0: Found 1 x16 devices at 0x2000000 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Creating 4 MTD partitions on "omapflash.0":
0x00000000-0x00020000 : "bootloader"
mtd: Giving out device 0 to bootloader
0x00020000-0x00040000 : "params"
mtd: Giving out device 1 to params
0x00040000-0x00240000 : "kernel"
mtd: Giving out device 2 to kernel
0x00240000-0x04000000 : "filesystem"
mtd: Giving out device 3 to filesystem
Child dir "kernel" (ino #132) of dir ino #130 appears to be a hard link
Child dir "lib" (ino #79) of dir ino #4 appears to be a hard link
Child dir "tslib" (ino #86) of dir ino #4 appears to be a hard link
Child dir "drivers" (ino #143) of dir ino #132 appears to be a hard
link
Child dir "mmc" (ino #147) of dir ino #6 appears to be a hard link
Child dir "bin" (ino #172) of dir ino #11 appears to be a hard link
Child dir "sbin" (ino #173) of dir ino #11 appears to be a hard link
Child dir "share" (ino #174) of dir ino #11 appears to be a hard link
Child dir "usb" (ino #144) of dir ino #143 appears to be a hard link
Child dir "misc" (ino #145) of dir ino #144 appears to be a hard link
Child dir "man" (ino #211) of dir ino #174 appears to be a hard link
Child dir "lib" (ino #90) of dir ino #79 appears to be a hard link
Child dir "man8" (ino #212) of dir ino #211 appears to be a hard link
Child dir "bin" (ino #114) of dir ino #86 appears to be a hard link
Child dir "etc" (ino #115) of dir ino #86 appears to be a hard link
Child dir "lib" (ino #116) of dir ino #86 appears to be a hard link
Child dir "if-up.d" (ino #107) of dir ino #97 appears to be a hard link
Child dir "if-pre-up.d" (ino #106) of dir ino #97 appears to be a hard
link
Child dir "rules.d" (ino #108) of dir ino #101 appears to be a hard
link
Child dir "ts" (ino #129) of dir ino #116 appears to be a hard link
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 68K
Write error in obliterating obsoleted node at 0x02490954: -30
Argh. Special inode #112 with mode 0xa1ff had more than one node
Unable to handle kernel paging request at virtual address 332e3332
pgd = c0004000
[332e3332] *pgd=00000000
Internal error: Oops: 1 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_do_clear_inode+0xdc/0x14c
LR is at jffs2_free_full_dirent+0x10/0x14
pc : [<c00b9d10>]    lr : [<c00b61f8>]    Not tainted
sp : c02fdb5c  ip : c02fdb4c  fp : c02fdb74
r10: c0017ae4  r9 : c7c6a800  r8 : c7cc631c
r7 : c02fdc5c  r6 : c7c6a800  r5 : c7cc631c  r4 : 332e332e
r3 : 00000015  r2 : 00000014  r1 : c02c3800  r0 : 332e332e
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C5387F  Table: 80004000  DAC: 00000015
Process swapper (pid: 1, stack limit = 0xc02fc194)
Stack: (0xc02fdb5c to 0xc02fe000)
db40:                                                               
00000000
db60: 00000000 c02fdb88 c02fdbcc c02fdb78 c00ba554 c00b9c40 c02fdb88
c7c77b40
db80: c02fdb8c 00000000 0000000b 00000000 c7c272ac 00000000 c0018394
00000070
dba0: c02fdbbc c7cc631c 00000001 c7c85f35 c02fc000 c02fdbd8 c7c6a800
00000070
dbc0: c02fdc28 c02fdbd0 c00ba8b4 c00b9d8c c7c6a8e8 c02fdc5c c00324e0
c0032224
dbe0: c7cc6344 c7c6a600 c7c85f35 c7c272ac c7c85f20 c7cc6344 00000070
c02fdc18
dc00: c7cc6344 c7c6a600 c7c85f35 c7c272ac c7c85f20 c7cc6344 c7cc631c
c02fdcc8
dc20: c02fdc2c c00c4cb8 c00ba6e8 c0178746 00000015 c02fdca8 c02fdc44
c0032480
dc40: c0032028 c7cc64ec 000001f8 000001f8 00000000 c7c6a800 c02fdd20
e0021985
dc60: 0000004f 4ff67c1c 00000070 00000001 0000a1ff 01f801f8 0000000b
42711185
dc80: 42711185 42711185 00000000 0000000b 0000000b 00000000 5c5b5dff
9c5a5f74
dca0: c7cc6344 c7c6a600 c7c85f35 c7c272ac c7c85f20 c7cc64b0 00000070
c02fdcf8
dcc0: c02fdccc c00b2d58 c00c4c64 00000000 fffffff4 c7c272ac c7cc6520
c7cc64b0
dce0: c02fddf0 c02fdd38 c02fdd30 c02fdd28 c02fdcfc c0079350 c00b2c28
c02c82a0
dd00: 00000000 c02fddf0 c7cc64b0 c02fc000 00000000 c02fdd30 00000002
c02fdd6c
dd20: c02fdd2c c0079f00 c0079288 00000101 c02c82a0 c7c274cc e25dbf22
0000000d
dd40: c7c77aa5 c02fddf0 c02fdd70 00000000 c7c77aa0 00000000 00000000
00000002
dd60: c02fddcc c02fdd70 c007a4d8 c00795c0 c7c23cc4 c02c82a0 c02fde04
c006b884
dd80: c0092208 00000101 00000001 00000000 fffffff4 00000000 00000002
c02fde4c
dda0: c02fde2c c007628c 00000001 00000107 c02fddf0 c02fc000 00000000
c7c77aa0
ddc0: c02fddec c02fddd0 c007a760 c007a444 00000001 c02e0ee0 c0176894
c02fddf0
dde0: c02fde4c c02fddf0 c0076184 c007a5d0 c7c274cc c02c82a0 c02fde04
c006b884
de00: c0092208 00000101 00000001 00000000 fffffff4 00000000 00000002
c02fde4c
de20: c02fde2c c007628c 00000001 00000107 c02fc000 c02e0ee0 c0176894
fffffff8
de40: c02fdf0c c02fde50 c0095fb0 c0076168 c02fdf20 c02fde9c c02fde64
c0052ba0
de60: c00526b0 00000000 00000000 000000d2 00000000 c0147cec 00000000
000000d2
de80: c0148090 c02e0ec0 c02e0080 00000000 00000000 00000000 00000000
ffffffff
dea0: 00000000 00000003 00000000 00000000 00000000 c7c77aa0 00000000
00000000
dec0: 00000000 c02fdf60 c7c6a200 00000000 0000000b 0000000b 0000000b
c0010fd4
dee0: 0000000b c01495e8 c7c6a200 c02fc000 fffffffe 00000000 00000000
c02fdf60
df00: c02fdf34 c02fdf10 c0076d64 c0095c58 c7c6a200 c02fc000 c0144cfc
00000000
df20: c0144d88 c02fdf60 c02fdf5c c02fdf38 c0077028 c0076cd8 c0120cd0
c0144d88
df40: c0144cfc c02fdf60 00000000 00000000 c02fdfc4 c02fdf60 c001e328
c0076f00
df60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
df80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
dfa0: 00000000 00000000 c0120ce0 c02fc000 00000000 c0017c4c c02fdfd4
c02fdfc8
dfc0: c001904c c001e2f4 c02fdff4 c02fdfd8 c00191b4 c0019038 00000000
00000000
dfe0: 00000000 00000000 00000000 c02fdff8 c00339b8 c0019064 00000000
00000000
Backtrace:
[<c00b9c34>] (jffs2_do_clear_inode+0x0/0x14c) from [<c00ba554>]
(jffs2_do_read_i
node_internal+0x7d4/0x898)
 r6 = C02FDB88  r5 = 00000000  r4 = 00000000
[<c00b9d80>] (jffs2_do_read_inode_internal+0x0/0x898) from [<c00ba8b4>]
(jffs2_d
o_read_inode+0x1d8/0x200)
[<c00ba6dc>] (jffs2_do_read_inode+0x0/0x200) from [<c00c4cb8>]
(jffs2_read_inode
+0x60/0x360)
[<c00c4c58>] (jffs2_read_inode+0x0/0x360) from [<c00b2d58>]
(jffs2_lookup+0x13c/
0x188)
[<c00b2c1c>] (jffs2_lookup+0x0/0x188) from [<c0079350>]
(do_lookup+0xd4/0x1b0)
[<c007927c>] (do_lookup+0x0/0x1b0) from [<c0079f00>]
(__link_path_walk+0x94c/0xe
84)
[<c00795b4>] (__link_path_walk+0x0/0xe84) from [<c007a4d8>]
(link_path_walk+0xa0
/0x18c)
[<c007a438>] (link_path_walk+0x0/0x18c) from [<c007a760>]
(path_lookup+0x19c/0x1
a8)
 r7 = C7C77AA0  r6 = 00000000  r5 = C02FC000  r4 = C02FDDF0
[<c007a5c4>] (path_lookup+0x0/0x1a8) from [<c0076184>]
(open_exec+0x28/0xdc)
 r7 = C02FDDF0  r6 = C0176894  r5 = C02E0EE0  r4 = 00000001
[<c007615c>] (open_exec+0x0/0xdc) from [<c0095fb0>]
(load_elf_binary+0x364/0x168
4)
 r7 = FFFFFFF8  r6 = C0176894  r5 = C02E0EE0  r4 = C02FC000
[<c0095c4c>] (load_elf_binary+0x0/0x1684) from [<c0076d64>]
(search_binary_handl
er+0x98/0x228)
[<c0076ccc>] (search_binary_handler+0x0/0x228) from [<c0077028>]
(do_execve+0x13
4/0x1f0)
[<c0076ef4>] (do_execve+0x0/0x1f0) from [<c001e328>] (execve+0x40/0x88)
[<c001e2e8>] (execve+0x0/0x88) from [<c001904c>]
(run_init_process+0x20/0x2c)
 r7 = C0017C4C  r6 = 00000000  r5 = C02FC000  r4 = C0120CE0
[<c001902c>] (run_init_process+0x0/0x2c) from [<c00191b4>]
(init+0x15c/0x1cc)
[<c0019058>] (init+0x0/0x1cc) from [<c00339b8>] (do_exit+0x0/0xaf4)
 r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: ea000006 e2504000 0a000004 e1a00004 (e5944004)
 <0>Kernel panic - not syncing: Attempted to kill init!

---Komal Shah
http://www.livejournal.com/users/komal_shah/

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
