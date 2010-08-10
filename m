Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OilZE-0000oK-Ik
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 09:56:23 +0000
Message-ID: <4C61223F.30100@parrot.com>
Date: Tue, 10 Aug 2010 11:56:15 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
	Bityutskiy <dedekind@infradead.org>
Subject: ubi : kernel panic on erroneous block
Content-Type: multipart/mixed; boundary="------------050203000303020708090704"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------050203000303020708090704
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


when running test with ubifs I found the following crash.
One block is instable (some read fails with ecc error correctable or 
not) after a power cut. This is due to interrupted write or erase.

Our test do first a read of the ubi volume (cat /dev/ubi3_0 > /dev/null) 
to force complete read of it.

In this case ecc correctable is detected, and scrubbing is scheduled
But ubi_eba_copy_leb: the block become uncorrectable and added to 
erroneous list.
When mounting ubifs read doesn't check that it is erroneous and return data.
It is added again for scrubbing, but prot_queue_del crash because we 
already remove it in the first scrubbing try.

Here an attempt to fix the problem. This is ugly. I didn't try it yet. I 
  erased my corrupted flash by accident.

One other solution could be to add the test in ubi_wl_scrub_peb, but I 
don't think it is ok to return data on erroneous block.

An other solution could be to unmap the block (read will return 0xff), 
but this may break upper layer ?

Matthieu


[    6.613769] UBI DBG (pid 266): ubi_scan: scanning is finished
[    6.627283] UBI: attached mtd3 to ubi3
[    6.630876] UBI: MTD device name:            "P6system"
[    6.636130] UBI: MTD device size:            32 MiB
[    6.640948] UBI: number of good PEBs:        256
[    6.645567] UBI: number of bad PEBs:         0
[    6.649979] UBI: max. allowed volumes:       128
[    6.654591] UBI: wear-leveling threshold:    4096
[    6.659274] UBI: number of internal volumes: 1
[    6.663701] UBI: number of user volumes:     1
[    6.668138] UBI: available PEBs:             0
[    6.672559] UBI: total number of reserved PEBs: 256
[    6.677433] UBI: number of PEBs reserved for bad PEB handling: 2
[    6.683416] UBI: max/mean erase counter: 3717/3558
[    6.688201] UBI: image sequence number: 1403635655
[    6.693008] UBI: background thread "ubi_bgt3d" started, PID 269
UBI device number 3, total 256 LEBs (32505856 bytes, 31.0 MiB), 
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)

----> cat /dev/ubi3_0 > /dev/null

[    6.908524] BA315_STATUS_DEC_ERR : 0 4 on 24525
[    6.912907] ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    6.931062] UBI DBG (pid 272): ubi_io_read: fixable bit-flip detected 
at PEB 189
[    6.938448] UBI DBG (pid 272): ubi_wl_scrub_peb: schedule PEB 189 for 
scrubbing
[    6.947677] BA315_STATUS_DEC_ERR : 512 4 on 24525
[    6.952226] ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[    6.976651] UBI error: ubi_io_read: error -74 while reading 126976 
bytes from PEB 189:4096, read 126976 bytes
[    6.986429] [<c00279f0>] (dump_stack+0x0/0x14) from [<c0160fa8>] 
(ubi_io_read+0xf0/0x258)
[    6.994594] [<c0160eb8>] (ubi_io_read+0x0/0x258) from [<c01607e8>] 
(ubi_eba_copy_leb+0x204/0x58c)
[    7.003434] [<c01605e4>] (ubi_eba_copy_leb+0x0/0x58c) from 
[<c01638e8>] (wear_leveling_worker+0x2e4/0x630)
[    7.013074] [<c0163604>] (wear_leveling_worker+0x0/0x630) from 
[<c0162b0c>] (do_work+0x94/0xe8)
[    7.021758] [<c0162a78>] (do_work+0x0/0xe8) from [<c0163cc4>] 
(ubi_thread+0x90/0x118)
[    7.029576]  r7:c789bc50 r6:00000000 r5:c7848000 r4:c789b800
[    7.035222] [<c0163c34>] (ubi_thread+0x0/0x118) from [<c0047204>] 
(kthread+0x50/0x7c)
[    7.043036] [<c00471b4>] (kthread+0x0/0x7c) from [<c00360e8>] 
(do_exit+0x0/0x6ac)
[    7.050505]  r5:00000000 r4:00000000
[    7.054071] UBI warning: ubi_eba_copy_leb: error -74 while reading 
data from PEB 189

echo sleeping 38
real	0m 3.52s
user	0m 0.01s
sys	0m 0.25s

----> mounting ubifs on /dev/ubi3_0


info.type      = 0x04
info.flags     = 0x00000400
info.size      = 0x02000000
info.erasesize = 0x00020000
info.writesize = 2048
info.oobsize   = 64
ecc.eccbytes   = 12
ecc.eccpos     = 2,3,4,5,6,7,8,9,10,11,12,13,

Please press Enter to activate this console. starting pid 277, tty '': 
'/bin/sh'


BusyBox v1.16.0 (2010-06-30 18:04:36 CEST) b[   10.423398] UBIFS: 
recovery needed
uilt-in shell (ash)
Enter 'help' for a list of built-in[   10.431750] BA315_STATUS_DEC_ERR : 
512 4 on 24525
  commands.

# echo sleepin[   10.438532] ff g 38
sleeping 38
# ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   10.467210] UBI error: ubi_io_read: error -74 while reading 126976 
bytes from PEB 189:4096, read 126976 bytes
[   10.477007] [<c00279f0>] (dump_stack+0x0/0x14) from [<c0160fa8>] 
(ubi_io_read+0xf0/0x258)
[   10.485144] [<c0160eb8>] (ubi_io_read+0x0/0x258) from [<c016035c>] 
(ubi_eba_read_leb+0x1a0/0x428)
[   10.494005] [<c01601bc>] (ubi_eba_read_leb+0x0/0x428) from 
[<c015e3c0>] (ubi_leb_read+0xe8/0x138)
[   10.502859] [<c015e2d8>] (ubi_leb_read+0x0/0x138) from [<c00d6918>] 
(ubifs_start_scan+0x7c/0xf4)
[   10.511633]  r7:c79f3000 r6:00000000 r5:c798b8e0 r4:00000000
[   10.517276] [<c00d689c>] (ubifs_start_scan+0x0/0xf4) from 
[<c00d6b4c>] (ubifs_scan+0x2c/0x298)
[   10.525878]  r8:00000003 r7:c79f3000 r6:00000000 r5:c8d01000 r4:0001f000
[   10.532560] [<c00d6b20>] (ubifs_scan+0x0/0x298) from [<c00d71dc>] 
(ubifs_replay_journal+0x14c/0x13a4)
[   10.541769] [<c00d7090>] (ubifs_replay_journal+0x0/0x13a4) from 
[<c00cdd68>] (ubifs_fill_super+0xb84/0x1054)
[   10.551580] [<c00cd1e4>] (ubifs_fill_super+0x0/0x1054) from 
[<c00ced04>] (ubifs_get_sb+0xc4/0x2ac)
[   10.560525] [<c00cec40>] (ubifs_get_sb+0x0/0x2ac) from [<c007f04c>] 
(vfs_kern_mount+0x58/0x94)
[   10.569124] [<c007eff4>] (vfs_kern_mount+0x0/0x94) from [<c007f0e8>] 
(do_kern_mount+0x40/0xe8)
[   10.577736]  r8:c79fa000 r7:c02253ec r6:00000000 r5:c78fb000 r4:00000000
[   10.584408] [<c007f0a8>] (do_kern_mount+0x0/0xe8) from [<c0095628>] 
(do_new_mount+0x68/0x8c)
[   10.592833]  r8:00000000 r7:0000000a r6:c784bef0 r5:00000000 r4:c79fa000
[   10.599519] [<c00955c0>] (do_new_mount+0x0/0x8c) from [<c00957a8>] 
(do_mount+0x15c/0x1b8)
[   10.607694]  r7:c79fa000 r6:c78fb000 r5:c78d9000 r4:00000404
[   10.613327] [<c009564c>] (do_mount+0x0/0x1b8) from [<c0095890>] 
(sys_mount+0x8c/0xd4)
[   10.621144] [<c0095804>] (sys_mount+0x0/0xd4) from [<c0023c00>] 
(ret_fast_syscall+0x0/0x2c)
[   10.629483]  r7:00000015 r6:00008840 r5:00000000 r4:00000000
[   10.638307] BA315_STATUS_DEC_ERR : 0 4 on 24525
[   10.642677] ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   10.667078] UBI DBG (pid 273): ubi_io_read: fixable bit-flip detected 
at PEB 189
[   10.674321] UBI DBG (pid 273): ubi_wl_scrub_peb: schedule PEB 189 for 
scrubbing
[   10.681652] Unable to handle kernel NULL pointer dereference at 
virtual address 00000000
[   10.689703] pgd = c79e4000
[   10.692381] [00000000] *pgd=47841031, *pte=00000000, *ppte=00000000
[   10.698639] Internal error: Oops: 817 [#1]
[   10.702713] Modules linked in:
[   10.705761] CPU: 0    Not tainted  (2.6.27.47-parrot-dirty #212)
[   10.711769] PC is at prot_queue_del+0x2c/0x50
[   10.716100] LR is at ubi_wl_scrub_peb+0xec/0x13c
[   10.720700] pc : [<c0162430>]    lr : [<c01635b4>]    psr: a0000013
[   10.720716] sp : c784ba70  ip : c78ff290  fp : c784ba7c
[   10.732157] r10: 00000000  r9 : 00000003  r8 : 000000bd
[   10.737371] r7 : c789bbcc  r6 : c789bbc0  r5 : c789b800  r4 : c78ff290
[   10.743883] r3 : 00100100  r2 : 00000001  r1 : 00000000  r0 : ffffffed
[   10.750398] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[   10.757519] Control: 0005317f  Table: 479e4000  DAC: 00000015
[   10.763249] Process endurance (pid: 273, stack limit = 0xc784a268)
[   10.769416] Stack: (0xc784ba70 to 0xc784c000)
[   10.773753] ba60:                                     c784baa4 
c784ba80 c01635b4 c0162414
[   10.782004] ba80: c8d01000 00000000 c8d01000 c789b800 c73fd000 
000000bd c784baec c784baa8
[   10.790254] baa0: c01603bc c01634d8 0001f000 00000001 c0236138 
c8d01000 00000001 00000000
[   10.798505] bac0: 00000000 c73fd000 c8d01000 00000000 0001f000 
00000003 ffffff8b 00000000
[   10.806755] bae0: c784bb1c c784baf0 c015e3c0 c01601cc 00000000 
0001f000 00000000 c0079a30
[   10.815005] bb00: 00000000 c798b8e0 00000000 c79f3000 c784bb54 
c784bb20 c00d6918 c015e2e8
[   10.823256] bb20: 0001f000 00000000 c0023874 c0023010 c79f3000 
c8d01000 c79f3000 c798b8e0
[   10.831506] bb40: c79f3000 00000003 c784bbac c784bb58 c00e3650 
c00d68ac 00000004 c784bbac
[   10.839757] bb60: c784bb78 c8d01000 c00d6d08 c00d6d14 00000000 
00000000 c8d01000 0001f000
[   10.848007] bb80: c784bbac 00000000 c79f3850 c798b8e0 c79f3000 
00000003 ffffff8b 00000000
[   10.856257] bba0: c784bbf4 c784bbb0 c00e444c c00e3624 00000000 
c784bbc0 c8d01000 c00d66b4
[   10.864508] bbc0: 00005800 00000001 c79f3870 00000000 c79f3850 
c79f3870 c79f3000 00000003
[   10.872758] bbe0: ffffff8b c79f3000 c784bd34 c784bbf8 c00d7c20 
c00e4394 00000001 00000000
[   10.881009] bc00: 00000000 c02305c0 c784a000 000000ef c784bc74 
c784bc20 c005ee14 c005de64
[   10.889259] bc20: 00000001 00000044 000200d2 00000000 c79f3850 
00000001 c0007228 c8be5000
[   10.897509] bc40: 00000000 00000000 c8d01000 c79f376c c784a000 
ffffff8b 00000000 00000000
[   10.905760] bc60: c789bbb0 c7972760 c784bcac c784bc78 c7972760 
c789b800 00000007 00000000
[   10.914010] bc80: 00000000 c784bd00 c7972760 c7972760 c789b800 
00000007 c784bcbc c784bca8
[   10.922261] bca0: c015edcc c00792bc c789b800 c73fd000 c784bce4 
c784bcc0 c015eea0 c015ed74
[   10.930511] bcc0: 0001f000 00000001 00000018 c79f3000 00000000 
00000007 c784bcf4 c784bce8
[   10.938761] bce0: c015e15c c015ee30 c784bd34 c784bcf8 c00e08d8 
c015e100 0000000b 00000000
[   10.947012] bd00: c891b00b 00000000 00000000 000000eb 00000000 
c79f3870 c79f3000 000000eb
[   10.955262] bd20: 00000000 00000000 c784bdec c784bd38 c00cdd68 
c00d70a0 00000000 c00fccdc
[   10.963513] bd40: c780c1a0 c780ff60 00000000 c784bdc0 00000001 
00000003 c784bef0 00000000
[   10.971763] bd60: 0001e5a0 00000000 00117000 00000000 c784bd94 
00000003 01d2f000 00000000
[   10.980014] bd80: 00000000 c79b8c00 c73ffd20 c79f3724 c79f3008 
c79f37f8 c79f36a4 c79f371c
[   10.988264] bda0: c00cbf10 c0225404 c784bdec 00000000 00000001 
00000000 0007c001 00000000
[   10.996514] bdc0: c780c1a0 c79b8c00 c73ffd20 c79b8c00 00000000 
c02253ec c784bef0 00000000
[   11.004765] bde0: c784be6c c784bdf0 c00ced04 c00cd1f4 00000000 
c023997c 00000003 00000000
[   11.013015] be00: 000000fa c784be10 01e46000 00000000 c78fb000 
00000003 00000000 00000000
[   11.021266] be20: 00000001 0001f000 00000006 c73fd18c 0fd00001 
c780cf20 c784be6c c784be48
[   11.029516] be40: c0093e4c 00000000 c78fb000 c780cf20 00000000 
c02253ec c784bef0 0000000a
[   11.037766] be60: c784be9c c784be70 c007f04c c00cec50 c780cf20 
c784be80 c00928b0 00000000
[   11.046017] be80: c78fb000 00000000 c02253ec c79fa000 c784bec4 
c784bea0 c007f0e8 c007f004
[   11.054267] bea0: c784bec4 c79fa000 00000000 c784bef0 0000000a 
00000000 c784bee4 c784bec8
[   11.062518] bec0: c0095628 c007f0b8 00000404 c78d9000 c78fb000 
c79fa000 c784bf6c c784bee8
[   11.070768] bee0: c00957a8 c00955d0 c78fb000 00000000 c780c3a0 
c74844b8 c784bf6c c784bf08
[   11.079018] bf00: c002382c 00000001 00000001 00000000 00000000 
00000000 0000038c c784bf7c
[   11.087269] bf20: 00001000 c78fb000 c0023d84 c784a000 40068008 
c784bf6c 000200d0 c784bf50
[   11.095519] bf40: 00000000 00000000 c78d9000 0000a38c 00000404 
c0023d84 c784a000 40068008
[   11.103770] bf60: c784bfa4 c784bf70 c0095890 c009565c 00000000 
c78d9000 beb41f78 c78fb000
[   11.112020] bf80: c79fa000 00000000 00000000 00000000 00008840 
00000015 00000000 c784bfa8
[   11.120270] bfa0: c0023c00 c0095814 00000000 00000000 0000a38c 
0000a384 0000a398 00000404
[   11.128521] bfc0: 00000000 00000000 00008840 00000015 000086cc 
00000001 40068008 00008e60
[   11.136771] bfe0: 4001b424 beb41d10 00008cd8 4001b438 20000010 
0000a38c 7d195ec9 5c1aa6a4
[   11.145022] Backtrace:
[   11.147455] [<c0162404>] (prot_queue_del+0x0/0x50) from [<c01635b4>] 
(ubi_wl_scrub_peb+0xec/0x13c)
[   11.156400] [<c01634c8>] (ubi_wl_scrub_peb+0x0/0x13c) from 
[<c01603bc>] (ubi_eba_read_leb+0x200/0x428)
[   11.165693]  r8:000000bd r7:c73fd000 r6:c789b800 r5:c8d01000 r4:00000000
[   11.172379] [<c01601bc>] (ubi_eba_read_leb+0x0/0x428) from 
[<c015e3c0>] (ubi_leb_read+0xe8/0x138)
[   11.181237] [<c015e2d8>] (ubi_leb_read+0x0/0x138) from [<c00d6918>] 
(ubifs_start_scan+0x7c/0xf4)
[   11.190010]  r7:c79f3000 r6:00000000 r5:c798b8e0 r4:00000000
[   11.195654] [<c00d689c>] (ubifs_start_scan+0x0/0xf4) from 
[<c00e3650>] (ubifs_recover_leb+0x3c/0x730)
[   11.204861]  r8:00000003 r7:c79f3000 r6:c798b8e0 r5:c79f3000 r4:c8d01000
[   11.211547] [<c00e3614>] (ubifs_recover_leb+0x0/0x730) from 
[<c00e444c>] (ubifs_recover_log_leb+0xc8/0x2dc)
[   11.221274] [<c00e4384>] (ubifs_recover_log_leb+0x0/0x2dc) from 
[<c00d7c20>] (ubifs_replay_journal+0xb90/0x13a4)
[   11.231435] [<c00d7090>] (ubifs_replay_journal+0x0/0x13a4) from 
[<c00cdd68>] (ubifs_fill_super+0xb84/0x1054)
[   11.241249] [<c00cd1e4>] (ubifs_fill_super+0x0/0x1054) from 
[<c00ced04>] (ubifs_get_sb+0xc4/0x2ac)
[   11.250194] [<c00cec40>] (ubifs_get_sb+0x0/0x2ac) from [<c007f04c>] 
(vfs_kern_mount+0x58/0x94)
[   11.258793] [<c007eff4>] (vfs_kern_mount+0x0/0x94) from [<c007f0e8>] 
(do_kern_mount+0x40/0xe8)
[   11.267390]  r8:c79fa000 r7:c02253ec r6:00000000 r5:c78fb000 r4:00000000
[   11.274077] [<c007f0a8>] (do_kern_mount+0x0/0xe8) from [<c0095628>] 
(do_new_mount+0x68/0x8c)
[   11.282501]  r8:00000000 r7:0000000a r6:c784bef0 r5:00000000 r4:c79fa000
[   11.289188] [<c00955c0>] (do_new_mount+0x0/0x8c) from [<c00957a8>] 
(do_mount+0x15c/0x1b8)
[   11.297352]  r7:c79fa000 r6:c78fb000 r5:c78d9000 r4:00000404
[   11.302997] [<c009564c>] (do_mount+0x0/0x1b8) from [<c0095890>] 
(sys_mount+0x8c/0xd4)
[   11.310813] [<c0095804>] (sys_mount+0x0/0xd4) from [<c0023c00>] 
(ret_fast_syscall+0x0/0x2c)
[   11.319151]  r7:00000015 r6:00008840 r5:00000000 r4:00000000
[   11.324794] Code: 089da800 e59c1004 e59c2000 e59f3018 (e5812000)
[   11.330924] Kernel panic - not syncing: Fatal exception

--------------050203000303020708090704
Content-Type: text/x-diff; name="ubifs.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="ubifs.diff"

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 7fbe0d7..289c003 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -367,6 +367,7 @@ out_unlock:
  * returned for any volume type if an ECC error was detected by the MTD device
  * driver. Other negative error cored may be returned in case of other errors.
  */
+int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root);
 int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		     void *buf, int offset, int len, int check)
 {
@@ -392,6 +393,19 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		memset(buf, 0xFF, len);
 		return 0;
 	}
+	{
+		struct ubi_wl_entry *e;
+		int bad;
+
+		spin_lock(&ubi->wl_lock);
+		e = ubi->lookuptbl[pnum];
+		bad = in_wl_tree(e, &ubi->erroneous);
+		spin_unlock(&ubi->wl_lock);
+		/* we should not append to read bad block */
+		if (bad) {
+			return -EBADMSG;
+		}
+	}
 
 	dbg_eba("read %d bytes from offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 10b6100..3c4c3ed 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -292,7 +292,7 @@ static int produce_free_peb(struct ubi_device *ubi)
  * This function returns non-zero if @e is in the @root RB-tree and zero if it
  * is not.
  */
-static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
+/*static */int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
 {
 	struct rb_node *p;
 

--------------050203000303020708090704--
