From: RobertS@visi.com (RobertS)
Date: Mon, 10 Mar 2003 17:56:33 -0500
Subject: 2.4.19 rmk4 Jffs2 Performance problems, Upgrade diffulculty.
Message-ID: <3E6D1821.3060002@visi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello,

    I have been a content user of the kernel version 2.4.19 rmk4 for 
several months. Everything has been working quite well.
    My configuration is a Arm720t processor, 8 meg of 32 bit wide NOR 
Flash, 16 meg of ram ( 4 meg ramdisk).

    Half of the Flash is reserved for a JFFS2 file system.

    The problem that I have encountered has been the time it takes to 
write a single large file into the JFFS2 file system. It takes 
approximately 4 minutes to write a single 1 meg file into the file 
system. Writing a second file of the same size takes approximately 8 
minutes.  Each time I add another large file, it takes progressively 
longer. I am seeing about a 60% compression on those files.

    I thought that this performance may have been improved with the 
current version of the jffs2 files so I got the tar files, 
mtd-snapshot-20030305.tar, and updated my configuration. Now I am not 
able to copy any large files.
    I am running an almost pristine copy of 2.4.19 rmk4.

    I have applied the patch, linux-2.4.19-pre10-shared-zlib.

    I have updated to mtd-snapshot-20030305.tar.

    Using the latest mkfs.jffs2. 
This is the sequence of events
# mount -t jffs2 /dev/mtdblock0 /home
# cp test_file home
Unable to handle kernel paging request at virtual address e5962018
pgd = c06e4000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c0136ac8>]    lr : [<c0136794>]    Not tainted
sp : c06e9d88  ip : 00000000  fp : 00000000
r10: c07c7ba5  r9 : 00000009  r8 : 00000015
r7 : 00000005  r6 : c01749bc  r5 : c186401c  r4 : e5962008
r3 : c1865240  r2 : c1864a40  r1 : 00000005  r0 : 00000008
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 217F  Table: C06E4015  DAC: 00000015
Process cp (pid: 23, stack limit = 0xc06e8368)
Stack: (0xc06e9d88 to 0xc06ea000)
Stack: (0xc06e9d88 to 0xc06ea000)
9d80:                   00000000 c0136794 c01749bc c06e9db0 c06e9dac 
c1864a40
9da0: c01749bc c1867740 000000a3 c1865240 c1864a40 00000005 00000008 
00000000
9dc0: 000acc48 c0015b5c 000000e8 c01749bc fffffffb 00000005 00000000 
c07c7b60
9de0: 00000000 00000000 c0d54b60 c0137a20 c07c7b60 000000e8 fffffff1 
c00a0428
9e00: 000000e8 c07c7a60 c06a1100 c009f778 c00a451c 00000100 c07c7b60 
00000100
9e20: c069d000 000000e8 c06d85f0 c0d54b60 00001000 00000000 c06efe7c 
c069d000
9e40: c07b04bc 00002000 c01a2318 c00a475c 00000000 c01a2318 c01a2330 
c06a4ab0
9e60: c07b04bc 00000000 00001000 c06a49a0 c00a2884 00001000 00000100 
00000000
9e80: c06a4ab0 c06a49a0 c00a2d6c c017c84c 0000075a c00c40e0 c06a49e4 
00001000
9ea0: 00000000 00000100 00000000 00000002 00000000 00000400 c00c2800 
c06e9f04
9ec0: 00000000 00000001 00000004 c0063890 000003ec c008568c c0d27b00 
20000013
9ee0: c0160228 00000041 00000000 c015fff4 000001d2 00000100 c0160224 
00000100
9f00: c0162c64 c01a2318 00001000 00000000 c069d000 00000100 c06a49a0 
00000100
9f20: c00553c0 c0053604 c06e9f5c 00000100 c01a2330 c001d0ec 00000000 
c06a4a08
9f40: fffffff4 00000000 c06a4a44 c07b25c0 bffffc2c c07b25a0 00000000 
1a000100
9f60: c07b25c0 c07b25a0 ffffffea 00000000 00000100 c06e8000 bffffc2c 
00000000
9f80: c0060638 c0170860 c00453dc 00000100 00000100 00080f80 00000004 
c0036724
9fa0: 00080000 c00365a0 00000100 c00363e8 00000004 bffffc2c 00000100 
0004a618
9fc0: 00000100 00000100 00080f80 bffffc2c 00000100 bffffc2c 00080000 
00000000
9fe0: 00006050 bffffbd4 0004a310 00053c84 20000010 00000004 00000000 
00000000
Backtrace: no frame pointer
Code: e92d4010 e59d4004 e5944020 e3a0c000 (e5c40010)
Segmentation fault
#
Piece of my Ssytem.map
    c0135f70 T zlib_inflate_blocks_reset
    c0135fe8 T zlib_inflate_blocks_new
    c0136034 T zlib_inflate_blocks
    c0136a68 T zlib_inflate_blocks_free
    c0136a7c T zlib_inflate_set_dictionary
    c0136aa4 T zlib_inflate_blocks_sync_point
    c0136ab8 T zlib_inflate_codes_new
    c0136ae4 T zlib_inflate_codes
    c013717c T zlib_inflate_codes_free

When I reboot I get this error.
# mount -t jffs2 /dev/mtdblock0 /home
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0000: 
0x2003 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0004: 
0x000c id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0008: 
0xdc6d id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0000: 
0x2003 id
....
# // at this time, I cannot write anything to the jffs2 filesystem.

The oops error seems to be consistently at zlib_inflate_codes_new + 0x10.

Have I missed something? Before I updated, I could very reliably write 
files, albeit very slow for the large file (>1 meg.). Now I am unable to 
write reliably at all.

Thanks,
RobertS
