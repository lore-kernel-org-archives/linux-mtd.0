Date: Mon, 14 Apr 2008 17:09:33 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
In-Reply-To: <1208011719.2698.19.camel@pmac.infradead.org>
Message-ID: <Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<1208011719.2698.19.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David, 

> > The problem is related to introduction  of write_begin and write_end
> > functions instead of original prepare_write & commit_write. The kernel
> > panic has disappeared when we rolled back write_begin and write_end
> > changes in JFFS2. We tried to fix it - but it seems problem is bit
> > tough for us.
> 
> Hm, that's very strange. Are you 100% sure it's related to the
> write_begin/write_end changes? How long did you run the test for without
> a failure, after reverting those changes? And what was the maximum
> length of time you could run it without failure beforehand?
> 
Yes. I am 100% sure that the problem is related to
write_begin/write_end. We have quite extensive test suite.  Bug did
not appear if we roll back the changes. 
The failure reproduction depens on different option. In case of disbled
compression and volume size of 32MB we reproduce the issue within 10min
stabily. 
In case of write_begin/write_end disabled we do not catch the problem
after 2 hours of testing. 
> Can you show some of the different panic messages you saw? Was there any
> kind of pattern to them at all? I suspect memory corruption of some kind
> -- can you enable slab debugging?
> 
Sure. 
==========================================
fname=/mnt/mtd9/file.591 writeofft=0 writelen=24991
after write
write file_num:602
stb.st_size=0
fname=/mnt/mtd9/file.602 writeofft=0 writelen=97627
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3f00000
[00000000] *pgd=a3e83031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.24.2-pxa27x #2)
PC is at cache_alloc_refill+0x18c/0x5b8
LR is at 0xc0cdd000
pc : [<c0075d3c>]    lr : [<c0cdd000>]    psr: 80000093
sp : c3d91c08  ip : 00200200  fp : c3d91c40
r10: ffffffff  r9 : c3c915f0  r8 : c3c904e0
r7 : c3c915e8  r6 : c3c3a000  r5 : c3c915e0  r4 : c0cdd01c
r3 : 00000000  r2 : 00000000  r1 : 0000003c  r0 : 00000000
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a3f00000  DAC: 00000015
Process rndops (pid: 775, stack limit = 0xc3d90268)
Stack: (0xc3d91c08 to 0xc3d92000)
1c00:                   000000d0 000000d0 00000000 000000d0 20000013 00012000
1c20: c3c904e0 000000d0 c3858a4c c3ef9e00 c3fb4c48 c3d91c60 c3d91c44 c0075b78
1c40: c0075bbc c3fb4c48 00012000 00001000 c3fb4c48 c3d91c70 c3d91c64 c00c15cc
1c60: c0075b34 c3d91c90 c3d91c74 c00c0eb8 c00c15bc c3fb4c48 00000000 00000006
1c80: c3c354f8 c3d91cbc c3d91c94 c00c0f28 c00c0ea8 c3fb4c48 00000000 00000006
1ca0: c3c354f8 c3858a4c c3ef9e00 c3fb4c48 c3d91d10 c3d91cc0 c00c546c c00c0f04
1cc0: 00000031 00000003 00001000 c041e000 00000000 00000000 00000031 00001000
1ce0: 00003540 c3ee4000 00000000 c3c354f8 c3858a78 c02433c0 00000000 00000000
1d00: 00000000 c3d91d60 c3d91d14 c00c0068 c00c5254 00012000 00001000 c3d91d34
1d20: 00001000 00012000 00000000 c3ef9e00 00001000 00000000 00001000 00012000
1d40: 00000000 c3d90000 00001000 c3d91dac 00000000 c3d91dec c3d91d64 c0059420
1d60: c00bff58 00001000 00001000 c02433c0 c3858a78 c3858b0c c3d91ea8 c3eddea0
1d80: c3858b0c c01a5218 c3858a78 00012000 00001000 00000000 c01a5218 c00962f4
1da0: c00ca770 c3d91db0 c00379d0 c3d91f30 00000001 00012000 00005d5b c3858a78
1dc0: c02433c0 00000000 c3858a78 00000000 00000000 c3858a78 00000001 00017d5b
1de0: c3d91e60 c3d91df4 c0059ce8 c0059298 00000000 00000000 c3d91ef0 00017d5b
1e00: 00000000 c3d91ef0 c3d91f30 c3d91ea8 c3eddea0 c3858b0c 00000000 00000001
1e20: c3eddea0 c3c262c0 00000001 c3d91f0c 00000001 00017d5b c3858ae0 c3858a78
1e40: c3d91ea8 00000000 00000000 00000001 c3d91f30 c3d91e9c c3d91e64 c0059db8
1e60: c00598c8 00000001 00000000 c3eddea0 c3858b0c 00000000 c3d91ea8 c3eddea0
1e80: c3d91f30 c3d91f80 c3d90000 fffffdee c3d91f5c c3d91ea4 c0078d84 c0059d48
1ea0: 00000000 00000000 c3d91ec8 c3d91eb8 00000000 00000001 ffffffff c3eddea0
1ec0: 00000000 00000000 00000000 00000000 c3c41100 00000000 00000000 c3d91f00
1ee0: c3c41100 c0046d9c c3d91ee8 c3d91ee8 00000000 00000000 c3d91f04 c0102d88
1f00: c002e498 00000000 c3808180 00017d5b c3d91f1c c01031d8 c0102d30 c3c270a0
1f20: c0106058 00000034 c3d3a80c 00000054 00011c08 00017d5b 00017d5b c3eddea0
1f40: 00011c08 c3d91f80 c001e004 40138ff0 c3d91f7c c3d91f60 c00795f0 c0078cc4
1f60: 00000000 00000000 c3eddea0 00000004 c3d91fa4 c3d91f80 c0079b58 c0079548
1f80: 00000000 00000000 00000000 00000000 7d7a5202 00000002 00000000 c3d91fa8
1fa0: c001de60 c0079b18 00000000 7d7a5202 00000003 00011c08 00017d5b 00017d5b
1fc0: 00000000 7d7a5202 00000002 000097d8 00008d48 00000000 40138ff0 bee21de0
1fe0: 00000000 bee21c3c 00005264 400deb00 60000010 00000003 e468e5b3 101e974f
Backtrace:
[<c0075bb0>] (cache_alloc_refill+0x0/0x5b8) from [<c0075b78>] (kmem_cache_alloc+
0x50/0x88)
[<c0075b28>] (kmem_cache_alloc+0x0/0x88) from [<c00c15cc>] (jffs2_alloc_node_fra
g+0x1c/0x24)
 r7:c3fb4c48 r6:00001000 r5:00012000 r4:c3fb4c48
[<c00c15b0>] (jffs2_alloc_node_frag+0x0/0x24) from [<c00c0eb8>] (new_fragment+0x
1c/0x5c)
[<c00c0e9c>] (new_fragment+0x0/0x5c) from [<c00c0f28>] (jffs2_add_full_dnode_to_
inode+0x30/0x3f0)
 r7:c3c354f8 r6:00000006 r5:00000000 r4:c3fb4c48
[<c00c0ef8>] (jffs2_add_full_dnode_to_inode+0x0/0x3f0) from [<c00c546c>] (jffs2_
write_inode_range+0x224/0x344)
[<c00c5248>] (jffs2_write_inode_range+0x0/0x344) from [<c00c0068>] (jffs2_write_
end+0x11c/0x268)
[<c00bff4c>] (jffs2_write_end+0x0/0x268) from [<c0059420>] (generic_file_buffere
d_write+0x198/0x634)
[<c005928c>] (generic_file_buffered_write+0x4/0x634) from [<c0059ce8>] (__generi
c_file_aio_write_nolock+0x42c/0x47c)
[<c00598bc>] (__generic_file_aio_write_nolock+0x0/0x47c) from [<c0059db8>] (gene
ric_file_aio_write+0x80/0xfc)
[<c0059d3c>] (generic_file_aio_write+0x4/0xfc) from [<c0078d84>] (do_sync_write+
0xcc/0x11c)
[<c0078cb8>] (do_sync_write+0x0/0x11c) from [<c00795f0>] (vfs_write+0xb4/0xf4)
[<c007953c>] (vfs_write+0x0/0xf4) from [<c0079b58>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c3eddea0 r5:00000000 r4:00000000
[<c0079b0c>] (sys_write+0x0/0x80) from [<c001de60>] (ret_fast_syscall+0x0/0x2c)
 r6:00000002 r5:7d7a5202 r4:00000000
Code: e25aa001 2affffea e89e000c e59fc3fc (e5832000)
---[ end trace 0b8c0fce588b6607 ]---
Segmentation fault
===========================================================================================

fname=/mnt/mtd9/file.126 writeofft=432278 writelen=114785
after write
write file_num:903
stb.st_size=395371Unable to handle kernel NULL pointer dereference at virtual ad
dress 00000004

fname=/mnt/mtd9/file.903 writeofft=496167 writelen=68119
pgd = c3ef4000
[00000004] *pgd=a3ef8031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.24.2-pxa27x #2)
PC is at jffs2_read_dnode+0x3c/0x2f8
LR is at jffs2_alloc_raw_inode+0x1c/0x24
pc : [<c00c1858>]    lr : [<c00c16e4>]    psr: a0000013
sp : c3d4fc4c  ip : c3c3a600  fp : c3d4fc88
r10: c2375000  r9 : c3d90e00  r8 : 00000dd9
r7 : c2375000  r6 : c08e2a58  r5 : c09873f8  r4 : c3d644f8
r3 : 00000000  r2 : 00000001  r1 : fffffffc  r0 : c3d90e00
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a3ef4000  DAC: 00000015
Process rndops (pid: 775, stack limit = 0xc3d4e268)
Stack: (0xc3d4fc4c to 0xc3d50000)
fc40:                            c3c40080 c0281ea0 c09029f4 c0902934 00000000
fc60: 00001000 00079000 c08e2a58 c2375000 00000dd9 c0902934 0007a000 c3d4fcc0
fc80: c3d4fc8c c00c1c24 c00c1828 00079000 00001000 c3d90e00 c0281ea0 00000000
fca0: c0902960 c0902934 00000dd9 00000227 00000227 c3d4fcd8 c3d4fcc4 c00bfe68
fcc0: c00c1b20 00001000 c0281ea0 c3d4fd60 c3d4fcdc c00c0508 c00bfe0c 000008f7
fce0: 00004a80 00000227 00000000 c0281ea0 c3d4fd10 c3d4fd00 c0057f20 c0046d44
fd00: 00000000 c3d4fd60 c3d4fd34 c3d4fd18 c0089df0 c00e2ccc c3d4fda0 c09014f4
fd20: c3d4fd58 c3d4fd30 c008a804 c00e73e4 c0901500 00000107 c3d4fdac 00079227
fd40: 00000000 c3d4e000 00000dd9 c3d4fdac 00000227 c3d4fdec c3d4fd64 c00593ac
fd60: c00c0230 00000dd9 00000000 c3d4fdc0 c3d4fdbc c09029f4 c3d4fea8 c3e5a4a0
fd80: c09029f4 c01a5218 c0902960 00000000 00000dd9 00000000 c01a5218 00000000
fda0: c3d4fdcc c3d4fdb0 c00379d0 c3d4ff30 00000001 00000000 00010a17 c0902960
fdc0: c0281ea0 00000000 c0902960 00079227 00000000 c0902960 00000001 00010a17
fde0: c3d4fe60 c3d4fdf4 c0059ce8 c0059298 00079227 00000000 c3d4fef0 00010a17
fe00: 00000000 c3d4fef0 c3d4ff30 c3d4fea8 c3e5a4a0 c09029f4 00000000 00000001
fe20: c00380e4 00000016 c0212554 00000000 00000001 00010a17 c09029c8 c0902960
fe40: c3d4fea8 00079227 00000000 00000001 c3d4ff30 c3d4fe9c c3d4fe64 c0059db8
fe60: c00598c8 c0220ab4 c3c400b0 c3e5a4a0 c09029f4 00000000 c3d4fea8 c3e5a4a0
fe80: c3d4ff30 c3d4ff80 c3d4e000 fffffdee c3d4ff5c c3d4fea4 c0078d84 c0059d48
fea0: 00079227 00000000 c3d4fec8 c3d4feb8 00000000 00000001 ffffffff c3e5a4a0
fec0: 00000000 00000000 00000000 00000000 c3c40080 00000000 00000000 c3d4ff00
fee0: c3c40080 c0046d9c c3d4fee8 c3d4fee8 00079227 00000000 c3d4ff04 c0102d88
ff00: c002e498 00000000 c3808180 00010a17 c3d4ff1c c01031d8 c0102d30 c3c55540
ff20: c0106058 00000039 c3d3a80c 00000063 00011c08 00010a17 00010a17 c3e5a4a0
ff40: 00011c08 c3d4ff80 c001e004 40138ff0 c3d4ff7c c3d4ff60 c00795f0 c0078cc4
ff60: 00079227 00000000 c3e5a4a0 00000004 c3d4ffa4 c3d4ff80 c0079b58 c0079548
ff80: 00079227 00000000 00000000 00000000 000e086b 00000000 00000000 c3d4ffa8
ffa0: c001de60 c0079b18 00000000 000e086b 00000003 00011c08 00010a17 00010a17
ffc0: 00000000 000e086b 00000000 000097d8 00008d48 00000000 40138ff0 bec44de0
ffe0: 00000000 bec44c3c 00005264 400deb00 60000010 00000003 00000000 00000000
Backtrace:
[<c00c181c>] (jffs2_read_dnode+0x0/0x2f8) from [<c00c1c24>] (jffs2_read_inode_ra
nge+0x110/0x15c)
[<c00c1b14>] (jffs2_read_inode_range+0x0/0x15c) from [<c00bfe68>] (jffs2_do_read
page_nolock+0x68/0xfc)
[<c00bfe00>] (jffs2_do_readpage_nolock+0x0/0xfc) from [<c00c0508>] (jffs2_write_
begin+0x2e4/0x338)
 r4:c0281ea0
[<c00c0224>] (jffs2_write_begin+0x0/0x338) from [<c00593ac>] (generic_file_buffe
red_write+0x124/0x634)
[<c005928c>] (generic_file_buffered_write+0x4/0x634) from [<c0059ce8>] (__generi
c_file_aio_write_nolock+0x42c/0x47c)
[<c00598bc>] (__generic_file_aio_write_nolock+0x0/0x47c) from [<c0059db8>] (gene
ric_file_aio_write+0x80/0xfc)
[<c0059d3c>] (generic_file_aio_write+0x4/0xfc) from [<c0078d84>] (do_sync_write+
0xcc/0x11c)
[<c0078cb8>] (do_sync_write+0x0/0x11c) from [<c00795f0>] (vfs_write+0xb4/0xf4)
[<c007953c>] (vfs_write+0x0/0xf4) from [<c0079b58>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c3e5a4a0 r5:00000000 r4:00079227
[<c0079b0c>] (sys_write+0x0/0x80) from [<c001de60>] (ret_fast_syscall+0x0/0x2c)
 r6:00000000 r5:000e086b r4:00000000
Code: 0a0000a9 e5953000 e3e01003 e1a00009 (e593c004)
---[ end trace 8f0e605e2cdf29a9 ]---
==============================================================================

fname=/mnt/mtd9/file.92 writeofft=175629 writelen=93922
after write
trunc file_num:275
fname=/mnt/mtd9/file.275 truncofUnable to handle kernel NULL pointer dereference
 at virtual address 00000004
ft=301959
write file_num:719
stb.st_size=20361
fname=/mnt/mtdpgd = c3efc000
9/file.719 writeofft=110950 writelen=115736
[00000004] *pgd=a3ef6031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.24.2-pxa27x #2)
PC is at jffs2_read_dnode+0x3c/0x2f8
LR is at jffs2_alloc_raw_inode+0x1c/0x24
pc : [<c00c1858>]    lr : [<c00c16e4>]    psr: a0000013
sp : c3d91c4c  ip : c3c3a600  fp : c3d91c88
r10: c0447000  r9 : c3ef9e00  r8 : 00000e9a
r7 : c0447000  r6 : c0ec1518  r5 : c0cc2a68  r4 : c3c8c4f8
r3 : 00000000  r2 : 00000001  r1 : fffffffc  r0 : c3ef9e00
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a3efc000  DAC: 00000015
Process rndops (pid: 776, stack limit = 0xc3d90268)
Stack: (0xc3d91c4c to 0xc3d92000)
1c40:                            0000001b 00000014 00000000 c3867e34 c3d91c68
1c60: 00001000 0001b000 c0ec1518 c0447000 00000e9a c3867e34 0001c000 c3d91cc0
1c80: c3d91c8c c00c1c24 c00c1828 0001b000 00001000 c3ef9e00 c02438e0 00000000
1ca0: c3867e60 c3867e34 00000e9a 00000166 00000166 c3d91cd8 c3d91cc4 c00bfe68
1cc0: c00c1b20 00001000 c02438e0 c3d91d60 c3d91cdc c00c0508 c00bfe0c 00000cef
1ce0: 0001fc40 00000166 00000000 c02438e0 c3d91d10 c3d91d00 c0057f20 c0046d44
1d00: 00000000 c3d91d60 c3d91d34 c3d91d18 c0089df0 c00e2ccc c3d91da0 c3866e48
1d20: c3d91d58 c3d91d30 c008a804 c00e73e4 c3866e54 00000107 c3d91dac 0001b166
1d40: 00000000 c3d90000 00000e9a c3d91dac 00000166 c3d91dec c3d91d64 c00593ac
1d60: c00c0230 00000e9a 00000000 c3d91dc0 c3d91dbc c3867ef4 c3d91ea8 c3ec38c0
1d80: c3867ef4 c01a5218 c3867e60 00000000 00000e9a 00000000 c01a5218 c00962f4
1da0: c00ca770 c3d91db0 c00379d0 c3d91f30 00000001 00000000 0001c418 c3867e60
1dc0: c02438e0 00000000 c3867e60 0001b166 00000000 c3867e60 00000001 0001c418
1de0: c3d91e60 c3d91df4 c0059ce8 c0059298 0001b166 00000000 c3d91ef0 0001c418
1e00: 00000000 c3d91ef0 c3d91f30 c3d91ea8 c3ec38c0 c3867ef4 00000000 00000001
1e20: c3ec38c0 c3c262e0 00000001 c3d91f0c 00000001 0001c418 c3867ec8 c3867e60
1e40: c3d91ea8 0001b166 00000000 00000001 c3d91f30 c3d91e9c c3d91e64 c0059db8
1e60: c00598c8 00000001 00000000 c3ec38c0 c3867ef4 00000000 c3d91ea8 c3ec38c0
1e80: c3d91f30 c3d91f80 c3d90000 fffffdee c3d91f5c c3d91ea4 c0078d84 c0059d48
1ea0: 0001b166 00000000 c3d91ec8 c3d91eb8 00000000 00000001 ffffffff c3ec38c0
1ec0: 00000000 00000000 00000000 00000000 c3d67180 00000000 00000000 c3d91f00
1ee0: c3d67180 c0046d9c c3d91ee8 c3d91ee8 0001b166 00000000 c3d91f04 c0102d88
1f00: c002e498 00000000 c3808180 0001c418 c3d91f1c c01031d8 c0102d30 c3c27120
1f20: c0106058 0000003a c3d3a80c 00000054 00011c08 0001c418 0001c418 c3ec38c0
1f40: 00011c08 c3d91f80 c001e004 40138ff0 c3d91f7c c3d91f60 c00795f0 c0078cc4
1f60: 0001b166 00000000 c3ec38c0 00000004 c3d91fa4 c3d91f80 c0079b58 c0079548
1f80: 0001b166 00000000 00000000 00000000 00084f89 00000000 00000000 c3d91fa8
1fa0: c001de60 c0079b18 00000000 00084f89 00000003 00011c08 0001c418 0001c418
1fc0: 00000000 00084f89 00000000 000097d8 00008d48 00000000 40138ff0 be86bde0
1fe0: 00000000 be86bc3c 00005264 400deb00 60000010 00000003 e468e5b3 101e974f
Backtrace:
[<c00c181c>] (jffs2_read_dnode+0x0/0x2f8) from [<c00c1c24>] (jffs2_read_inode_ra
nge+0x110/0x15c)
[<c00c1b14>] (jffs2_read_inode_range+0x0/0x15c) from [<c00bfe68>] (jffs2_do_read
page_nolock+0x68/0xfc)
[<c00bfe00>] (jffs2_do_readpage_nolock+0x0/0xfc) from [<c00c0508>] (jffs2_write_
begin+0x2e4/0x338)
 r4:c02438e0
[<c00c0224>] (jffs2_write_begin+0x0/0x338) from [<c00593ac>] (generic_file_buffe
red_write+0x124/0x634)
[<c005928c>] (generic_file_buffered_write+0x4/0x634) from [<c0059ce8>] (__generi
c_file_aio_write_nolock+0x42c/0x47c)
[<c00598bc>] (__generic_file_aio_write_nolock+0x0/0x47c) from [<c0059db8>] (gene
ric_file_aio_write+0x80/0xfc)
[<c0059d3c>] (generic_file_aio_write+0x4/0xfc) from [<c0078d84>] (do_sync_write+
0xcc/0x11c)
[<c0078cb8>] (do_sync_write+0x0/0x11c) from [<c00795f0>] (vfs_write+0xb4/0xf4)
[<c007953c>] (vfs_write+0x0/0xf4) from [<c0079b58>] (sys_write+0x4c/0x80)
 r7:00000004 r6:c3ec38c0 r5:00000000 r4:0001b166
[<c0079b0c>] (sys_write+0x0/0x80) from [<c001de60>] (ret_fast_syscall+0x0/0x2c)
 r6:00000000 r5:00084f89 r4:00000000
Code: 0a0000a9 e5953000 e3e01003 e1a00009 (e593c004)



> The output you show includes strings such as 'readlink - no filename'.
> Can you explain those? They don't seem to come from your test program.
> 
Oh you are quite onservant. I have several panic logs from different
applications. By mistake I sent bug message which was cathed by another application(it is required more time to cacth the
problem in case of using it ). 

Thanks,
Alexey
