Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eDxuJ-0004sp-Px
 for linux-mtd@lists.infradead.org; Sun, 12 Nov 2017 19:27:06 +0000
Received: by mail-wm0-x233.google.com with SMTP id z3so11312910wme.5
 for <linux-mtd@lists.infradead.org>; Sun, 12 Nov 2017 11:26:41 -0800 (PST)
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
From: Manfred Spraul <manfred@colorfullife.com>
Subject: UBIFS does not mount after powerfail
Message-ID: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
Date: Sun, 12 Nov 2017 20:26:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello together,

in a power fail stress test with ubifs, I ran into 5 images that do not 
mount:

3x ubifs_check_node() fails, called by ubifs_garbage_collect_leb()
2x UBIFS assert failed in ubifs_rcvry_gc_commit at 1219 (pid 9570)
(and ~550 images with just asserts, the mount was successful)

The test was done using kernel 4.14.0-rc5+ #105 SMP PREEMPT.
The test involves create/rename/remove, using ecryptfs with xattr.

Are these known issues?
Are there any patches that I should apply?
What would you need to analyze them?

If you need the image (~32 MB), I'll try to find a suitable server.
Below is the dmesg output from mounting the first bad image.

For me, it appears as if ubifs_check_node() tries to access a node that 
is only partially written:

(from image hexdump):

> 00D61780   6C 00 00 00  09 00 00 00  04 00 00 00  E8 00 00 00  20 7B 
> 00 00  A0 00 00 00  67 9A 00 00  00 00 00 00  l............... 
> {......g.......
> 00D617A0   0C 00 00 00  10 AB 01 00  46 00 00 00  67 9A 00 00 0E 8D D5 
> 7B  E8 00 00 00  C0 7B 00 00  A0 00 00 00 ........F...g......{.....{......
> 00D617C0   68 9A 00 00  00 00 00 00  0C 00 00 00  00 B0 01 00 46 00 00 
> 00  68 9A 00 00  0E 8D D5 7B  00 00 00 00 h...............F...h......{....
> 00D617E0   31 18 10 06  FB 80 A3 3C  2A 1F 0C 00  00 00 00 00 6C 00 00 
> 00  09 00 00 00  04 00 01 00  55 00 00 00 1......<*.......l...........U...
> 00D61800   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF FF FF FF 
> FF  FF FF FF FF  FF FF FF FF  FF FF FF FF ................................
> 00D61820   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF FF FF FF 
> FF  FF FF FF FF  FF FF FF FF  FF FF FF FF ................................
The next write operation would have written this to 0xD16800:

> 00D617E0   31 18 10 06  FB 80 A3 3C  2A 1F 0C 00  00 00 00 00  6C 00 
> 00 00  09 00 00 00  04 00 01 00  55 00 00 00  
> 1......<*.......l...........U...
> 00D61800   20 06 00 00  6C 00 00 00  5F 9A 00 00  00 00 00 00 55 00 00 
> 00  90 06 00 00  6C 00 00 00  61 9A 00 00 ...l..._.......U.......l...a...
> 00D61820   00 00 00 00  55 00 00 00  00 07 00 00  6C 00 00 00 64 9A 00 
> 00  00 00 00 00  55 00 00 00  70 07 00 00 ....U.......l...d.......U...p...
> 00D61840   6C 00 00 00  67 9A 00 00  00 00 00 00  90 99 00 00 31 18 10 
> 06  A2 02 94 35  2B 1F 0C 00  00 00 00 00 l...g...........1......5+.......
> 00D61860   6C 00 00 00  09 00 00 00  04 00 02 00  55 00 00 00 50 01 00 
> 00  6C 00 00 00  3F 9A 00 00  00 00 00 00 l...........U...P...l...?.......
> 00D61880   55 00 00 00  80 03 00 00  6C 00 00 00  49 9A 00 00 00 00 00 
> 00  55 00 00 00  B0 05 00 00  6C 00 00 00 U.......l...I.......U.......l...
> 00D618A0   54 9A 00 00  00 00 00 00  55 00 00 00  E0 07 00 00 6C 00 00 
> 00  5F 9A 00 00  00 00 00 00  01 01 00 00 T.......U.......l..._...........
> 00D618C0   31 18 10 06  2C 7B AB 32  2C 1F 0C 00  00 00 00 00 6C 00 00 
> 00  09 00 00 00  04 00 00 00  0C 00 00 00 1...,{.2,.......l...............

Note:

The test was done with a modified mtdram device that creates a log of 
all write and erase operations, so the issues are not caused by HW issues.
The log contains checksum for everything, so the tool can't be the 
reason for the mount failure.
(and after 5 images, mount is again successful.)

168166: FUNC_WRITE_CHK(addr=0xd60800, len=0x800, chk=0x3335956be2). <<< 
last ok image
168167: FUNC_WRITE_CHK(addr=0xd61000, len=0x800, chk=0x34dad52f0e). <<< 
garbage_collect_leb
168168: FUNC_WRITE_CHK(addr=0xd61800, len=0x800, chk=0x350a12238d). <<< -"-
168169: FUNC_WRITE_CHK(addr=0xd62000, len=0x800, chk=0x3573a0893b). <<< -"-
168170: FUNC_WRITE_CHK(addr=0xd62800, len=0x800, chk=0x356a0366c2). <<< 
assert line 1219
168171: FUNC_WRITE_CHK(addr=0x1b34000, len=0x800, chk=0x3ca1e19062). <<< 
-"-
168172: FUNC_WRITE_CHK(addr=0xc35800, len=0x800, chk=0x334dc94b1f). <<< 
first ok image.

--

     Manfred

<<<<<<<<<<

[61821.708507] ubi0: attaching mtd0
[61821.710142] ubi0: scanning is finished
[61821.712212] ubi0: attached mtd0 (name "mtdram test device", size 32 MiB)
[61821.713285] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 
bytes
[61821.714336] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[61821.715394] ubi0: VID header offset: 2048 (aligned 2048), data 
offset: 4096
[61821.716425] ubi0: good PEBs: 256, bad PEBs: 0, corrupted PEBs: 0
[61821.717447] ubi0: user volume: 1, internal volumes: 1, max. volumes 
count: 128
[61821.718481] ubi0: max/mean erase counter: 85/32, WL threshold: 4096, 
image sequence number: 18852820
[61821.719566] ubi0: available PEBs: 4, total reserved PEBs: 252, PEBs 
reserved for bad PEB handling: 0
[61821.720694] ubi0: background thread "ubi_bgt0d" started, PID 9421
[61821.725737] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, 
PID 9428
[61821.725913] UBIFS (ubi0:0): recovery needed
[61821.743777] UBIFS error (ubi0:0 pid 9426): ubifs_check_node: bad CRC: 
calculated 0xbe6fe258, read 0x3ca380fb
[61821.744917] UBIFS error (ubi0:0 pid 9426): ubifs_check_node: bad node 
at LEB 85:2016
[61821.746174]  magic          0x6101831
[61821.747274]  crc            0x3ca380fb
[61821.748334]  node_type      9 (indexing node)
[61821.749379]  group_type     0 (no node group)
[61821.750404]  sqnum          794410
[61821.751401]  len            108
[61821.752379]  child_cnt      4
[61821.753341]  level          1
[61821.754288]  Branches:
[61821.755212]  0: LEB 85:-1 len -1 key (bad key type: 0xffffffff, 
0xffffffff)
[61821.756166]  1: LEB -1:-1 len -1 key (bad key type: 0xffffffff, 
0xffffffff)
[61821.757091]  2: LEB -1:-1 len -1 key (bad key type: 0xffffffff, 
0xffffffff)
[61821.758027]  3: LEB -1:-1 len -1 key (bad key type: 0xffffffff, 
0xffffffff)
[61821.758939] CPU: 1 PID: 9426 Comm: mount Not tainted 4.14.0-rc5+ #105
[61821.759848] Hardware name: Hewlett-Packard HP 350 G2/803A, BIOS F.13 
06/10/2015
[61821.760777] Call Trace:
[61821.761690]  ? dump_stack+0x67/0x8e
[61821.762610]  ? ubifs_check_node+0x1b1/0x1be
[61821.763539]  ? ubifs_scan_a_node+0x153/0x223
[61821.764466]  ? ubifs_scan+0xab/0x23a
[61821.765387]  ? ubifs_garbage_collect_leb+0x1dd/0x735
[61821.766323]  ? ubifs_rcvry_gc_commit+0x1bc/0x27b
[61821.767254]  ? ubifs_mount+0x1050/0x1ad4
[61821.768177]  ? sb_set+0x13/0x13
[61821.769086]  ? mount_fs+0x6a/0x109
[61821.769975]  ? vfs_kern_mount+0x6b/0x151
[61821.770851]  ? do_mount+0x914/0xb60
[61821.771701]  ? memdup_user+0x3e/0x5a
[61821.772523]  ? SyS_mount+0x72/0x98
[61821.773317]  ? entry_SYSCALL_64_fastpath+0x1c/0xb1
[61821.774138] UBIFS error (ubi0:0 pid 9426): ubifs_scan: bad node
[61821.774974] UBIFS error (ubi0:0 pid 9426): ubifs_scanned_corruption: 
corruption at LEB 85:2016
[61821.775820] UBIFS error (ubi0:0 pid 9426): ubifs_scanned_corruption: 
first 8192 bytes from LEB 85:2016
[61821.776679] 00000000: 06101831 3ca380fb 000c1f2a 00000000 0000006c 
00000009 00010004 00000055 1......<*.......l...........U...
[61821.776683] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff ffffffff ffffffff ................................
[61821.776687] 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff ffffffff ffffffff ................................
[... all 0xff 0xff]
[61821.777645] UBIFS error (ubi0:0 pid 9426): ubifs_scan: LEB 85 
scanning failed
[61821.778501] UBIFS error (ubi0:0 pid 9426): ubifs_rcvry_gc_commit: GC 
failed, error -117
[61821.779948] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
<<<<<<<<<<
