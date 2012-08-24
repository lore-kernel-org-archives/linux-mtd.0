Received: from cdptpa-bc-oedgelb.mail.rr.com ([75.180.133.32])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4y4I-0003LK-Kf
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 17:53:15 +0000
Message-ID: <5037BFFA.1020208@cincinnatitechnologies.com>
Date: Fri, 24 Aug 2012 13:55:06 -0400
From: Russell Zuck <rzuck@cincinnatitechnologies.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS corruption after software upgrade
References: <500F0D81.8050902@cincinnatitechnologies.com>
 <501923A9.7030002@cincinnatitechnologies.com>
 <1345641529.2848.185.camel@sauron.fi.intel.com>
In-Reply-To: <1345641529.2848.185.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/22/2012 9:18 AM, Artem Bityutskiy wrote:
> Do you have a kernel which worked for you? One strategy would be to
> bisect or look at the differences.
I don't have a kernel configuration for which my upgrade scenario has 
not eventually produced files system errors.

> WRT power-cut testing. Could you try your kernel + nandsim. Just do the
> following:
>
> $ modprobe nandsim first_id_byte=0x20 second_id_byte=0xac third_id_byte=0x00 fourth_id_byte=0x15
> $ modprobe ubi mtd=0
> $ ubimkvol /dev/ubi0 --lebs 4064 -N test_fs
> $ mount -t ubifs /dev/ubi0_0 /mnt/ubifs
>
> You should end up with something close to your system.
>
> Please, then try to do:
>
> $ echo 1 > /sys/kernel/debug/ubifs/tst_recovery
> $ cd $HOME/git/mtd-utils/tests/fs-tests/integrity
> $ ./integck -p /mnt/ubifs
>
> This should start recovery testing. Does it work?
I've made sure to apply the latest patches from the 2.6.35 backport repo 
and am using the latest from the mtd-utils repo.

$ ./integck -p /mnt/ubifs

..fails soon after I run the test.  There is a ton of logged data.  I've 
attempted to snip out the first error.

=============== snip =====================
[  375.323163] UBIFS warning (pid 2103): power_cut_emulated: failing 
after 2877 calls
[  375.331523] UBIFS: un-mount UBI device 1, volume 0
[  375.336416] UBIFS DBG (pid 2070): ubifs_bg_thread: background thread 
"ubifs_bgt1_0" stops
[  375.352677] UBIFS: mounted UBI device 1, volume 0, name "test_fs"
[  375.358919] UBIFS: mounted read-only
[  375.362523] UBIFS: file system size:   520740864 bytes (508536 KiB, 
496 MiB, 4036 LEBs)
[  375.370590] UBIFS: journal size:       26062848 bytes (25452 KiB, 24 
MiB, 202 LEBs)
[  375.378299] UBIFS: media format:       w4/r0 (latest is w4/r0)
[  375.384174] UBIFS: default compressor: lzo
[  375.388293] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[  375.394257] UBIFS DBG (pid 2103): mount_ubifs: compiled on: 
Aug 23 2012 at 11:30:24
[  375.402652] UBIFS DBG (pid 2103): mount_ubifs: min. I/O unit size: 
2048 bytes
[  375.409925] UBIFS DBG (pid 2103): mount_ubifs: max. write size: 
2048 bytes
[  375.417202] UBIFS DBG (pid 2103): mount_ubifs: LEB size: 
129024 bytes (126 KiB)
[  375.425521] UBIFS DBG (pid 2103): mount_ubifs: data journal heads:  1
[  375.431999] UBIFS DBG (pid 2103): mount_ubifs: UUID: 
83D4BFF8-5B39-40B1-9A86-430C0E45852A
[  375.441539] UBIFS DBG (pid 2103): mount_ubifs: big_lpt              0
[  375.448027] UBIFS DBG (pid 2103): mount_ubifs: log LEBs:            9 
(3 - 11)
[  375.455303] UBIFS DBG (pid 2103): mount_ubifs: LPT area LEBs:       2 
(12 - 13)
[  375.462652] UBIFS DBG (pid 2103): mount_ubifs: orphan area LEBs:    2 
(14 - 15)
[  375.470014] UBIFS DBG (pid 2103): mount_ubifs: main area LEBs: 
4036 (16 - 4051)
[  375.477811] UBIFS DBG (pid 2103): mount_ubifs: index LEBs:          1
[  375.484299] UBIFS DBG (pid 2103): mount_ubifs: total index bytes: 
48 (0 KiB, 0 MiB)
[  375.492169] UBIFS DBG (pid 2103): mount_ubifs: key hash type:       0
[  375.498655] UBIFS DBG (pid 2103): mount_ubifs: tree fanout:         8
[  375.505141] UBIFS DBG (pid 2103): mount_ubifs: reserved GC LEB:     18
[  375.511701] UBIFS DBG (pid 2103): mount_ubifs: first main LEB:      16
[  375.518273] UBIFS DBG (pid 2103): mount_ubifs: max. znode size      240
[  375.524938] UBIFS DBG (pid 2103): mount_ubifs: max. index node size 192
[  375.531587] UBIFS DBG (pid 2103): mount_ubifs: node sizes: 
data 48, inode 160, dentry 56
[  375.540518] UBIFS DBG (pid 2103): mount_ubifs: node sizes: 
trun 56, sb 4096, master 512
[  375.549363] UBIFS DBG (pid 2103): mount_ubifs: node sizes: 
ref 64, cmt. start 32, orph 32
[  375.558382] UBIFS DBG (pid 2103): mount_ubifs: max. node sizes: 
data 4144, inode 4256 dentry 312, idx 188
[  375.568358] UBIFS DBG (pid 2103): mount_ubifs: dead watermark:      2048
[  375.575106] UBIFS DBG (pid 2103): mount_ubifs: dark watermark:      6144
[  375.581840] UBIFS DBG (pid 2103): mount_ubifs: LEB overhead:        560
[  375.588502] UBIFS DBG (pid 2103): mount_ubifs: max. dark space: 
24797184 (24216 KiB, 23 MiB)
[  375.597347] UBIFS DBG (pid 2103): mount_ubifs: maximum bud bytes: 
24901632 (24318 KiB, 23 MiB)
[  375.606193] UBIFS DBG (pid 2103): mount_ubifs: BG commit bud bytes: 
20232576 (19758 KiB, 19 MiB)
[  375.615036] UBIFS DBG (pid 2103): mount_ubifs: current bud bytes    0 
(0 KiB, 0 MiB)
[  375.622820] UBIFS DBG (pid 2103): mount_ubifs: max. seq. number:    11
[  375.629394] UBIFS DBG (pid 2103): mount_ubifs: commit number:       1
[  375.644554] UBIFS DBG (pid 2107): ubifs_bg_thread: background thread 
"ubifs_bgt1_0" started, PID 2107
[  375.663774] UBIFS DBG (pid 2107): ubifs_bg_thread: background thread 
"ubifs_bgt1_0" stops
[  375.672118] UBIFS warning (pid 2103): power_cut_emulated: failing in 
master LEB 2
[  375.679752] UBIFS warning (pid 2103): power_cut_emulated: ========== 
Power cut emulated ==========
[  375.688780] Backtrace:
[  375.691294] [<8002b4ec>] (dump_backtrace+0x0/0x10c) from [<8034a738>] 
(dump_stack+0x18/0x1c)
[  375.699811]  r7:00000001 r6:8972a000 r5:896d6000 r4:00000001
[  375.705600] [<8034a720>] (dump_stack+0x0/0x1c) from [<8017dae0>] 
(power_cut_emulated+0x488/0x508)
[  375.714548] [<8017d658>] (power_cut_emulated+0x0/0x508) from 
[<8017dce8>] (dbg_leb_write+0x3c/0x158)
[  375.723822] [<8017dcac>] (dbg_leb_write+0x0/0x158) from [<8015970c>] 
(ubifs_leb_write+0xa0/0x120)
[  375.732769] [<8015966c>] (ubifs_leb_write+0x0/0x120) from 
[<80159928>] (ubifs_write_node+0x19c/0x1f8)
[  375.742071]  r8:00000200 r7:00003000 r6:896c0800 r5:00000002 r4:8972a000
[  375.748929] [<8015978c>] (ubifs_write_node+0x0/0x1f8) from 
[<80160580>] (ubifs_write_master+0x11c/0x12c)
[  375.758477] [<80160464>] (ubifs_write_master+0x0/0x12c) from 
[<80153b5c>] (ubifs_remount_fs+0x68c/0x81c)
[  375.768015]  r7:00000003 r6:000001b0 r5:8972a7ac r4:8972a000
[  375.773782] [<801534d0>] (ubifs_remount_fs+0x0/0x81c) from 
[<800b7d44>] (do_remount_sb+0xc4/0x120)
[  375.782799] [<800b7c80>] (do_remount_sb+0x0/0x120) from [<800cff18>] 
(do_mount+0x224/0x7dc)
[  375.791217]  r6:00200021 r5:00000000 r4:00000060
[  375.795925] [<800cfcf4>] (do_mount+0x0/0x7dc) from [<800d055c>] 
(sys_mount+0x8c/0xcc)
[  375.803816] [<800d04d0>] (sys_mount+0x0/0xcc) from [<80027fc0>] 
(ret_fast_syscall+0x0/0x30)
[  375.812208]  r7:00000015 r6:00000001 r5:00022140 r4:00023048
[  375.817971] UBIFS warning (pid 2103): cut_data: filled bytes 52-1290 
with 0xFFs
[  375.825422] UBIFS error (pid 2103): ubifs_leb_write: writing 2048 
bytes to LEB 2:12288 failed, error -30
[  375.834969] UBIFS warning (pid 2103): ubifs_ro_mode: switched to 
read-only mode, error -30
[  375.843285] Backtrace:
[  375.845773] [<8002b4ec>] (dump_backtrace+0x0/0x10c) from [<8034a738>] 
(dump_stack+0x18/0x1c)
[  375.854267]  r7:00003000 r6:00000002 r5:8972a000 r4:00000004
[  375.860020] [<8034a720>] (dump_stack+0x0/0x1c) from [<801587e4>] 
(ubifs_ro_mode+0x6c/0x78)
[  375.868349] [<80158778>] (ubifs_ro_mode+0x0/0x78) from [<80159750>] 
(ubifs_leb_write+0xe4/0x120)
[  375.877190]  r5:8972a000 r4:ffffffe2
[  375.880822] [<8015966c>] (ubifs_leb_write+0x0/0x120) from 
[<80159928>] (ubifs_write_node+0x19c/0x1f8)
[  375.890098]  r8:00000200 r7:00003000 r6:896c0800 r5:00000002 r4:8972a000
[  375.896925] [<8015978c>] (ubifs_write_node+0x0/0x1f8) from 
[<80160580>] (ubifs_write_master+0x11c/0x12c)
[  375.906470] [<80160464>] (ubifs_write_master+0x0/0x12c) from 
[<80153b5c>] (ubifs_remount_fs+0x68c/0x81c)
[  375.916007]  r7:00000003 r6:000001b0 r5:8972a7ac r4:8972a000
[  375.921759] [<801534d0>] (ubifs_remount_fs+0x0/0x81c) from 
[<800b7d44>] (do_remount_sb+0xc4/0x120)
[  375.930782] [<800b7c80>] (do_remount_sb+0x0/0x120) from [<800cff18>] 
(do_mount+0x224/0x7dc)
[  375.939186]  r6:00200021 r5:00000000 r4:00000060
[  375.943891] [<800cfcf4>] (do_mount+0x0/0x7dc) from [<800d055c>] 
(sys_mount+0x8c/0xcc)
[  375.951767] [<800d04d0>] (sys_mount+0x0/0xcc) from [<80027fc0>] 
(ret_fast_syscall+0x0/0x30)
[  375.960170]  r7:00000015 r6:00000001 r5:00022140 r4:00023048
[  375.965924] Backtrace:
[  375.968409] [<8002b4ec>] (dump_backtrace+0x0/0x10c) from [<8034a738>] 
(dump_stack+0x18/0x1c)
[  375.976900]  r7:00003000 r6:00000002 r5:8972a000 r4:ffffffe2
[  375.982654] [<8034a720>] (dump_stack+0x0/0x1c) from [<80159754>] 
(ubifs_leb_write+0xe8/0x120)
[  375.991242] [<8015966c>] (ubifs_leb_write+0x0/0x120) from 
[<80159928>] (ubifs_write_node+0x19c/0x1f8)
[  376.000518]  r8:00000200 r7:00003000 r6:896c0800 r5:00000002 r4:8972a000
[  376.007343] [<8015978c>] (ubifs_write_node+0x0/0x1f8) from 
[<80160580>] (ubifs_write_master+0x11c/0x12c)
[  376.016888] [<80160464>] (ubifs_write_master+0x0/0x12c) from 
[<80153b5c>] (ubifs_remount_fs+0x68c/0x81c)
[  376.026425]  r7:00000003 r6:000001b0 r5:8972a7ac r4:8972a000
[  376.032175] [<801534d0>] (ubifs_remount_fs+0x0/0x81c) from 
[<800b7d44>] (do_remount_sb+0xc4/0x120)
[  376.041196] [<800b7c80>] (do_remount_sb+0x0/0x120) from [<800cff18>] 
(do_mount+0x224/0x7dc)
[  376.049600]  r6:00200021 r5:00000000 r4:00000060
[  376.054305] [<800cfcf4>] (do_mount+0x0/0x7dc) from [<800d055c>] 
(sys_mount+0x8c/0xcc)
[  376.062180] [<800d04d0>] (sys_mount+0x0/0xcc) from [<80027fc0>] 
(ret_fast_syscall+0x0/0x30)
[  376.070584]  r7:00000015 r6:00000001 r5:00022140 r4:00023048
[  376.076585] UBIFS: cannot re-mount R/W due to prior errors
[  376.082748] UBIFS: un-mount UBI device 1, volume 0
[  376.095799] UBIFS error (pid 2103): ubifs_scan: bad node
[  376.105554] UBIFS: recovered master node from LEB 1
============= end snip ========================

Does anything in this output suggest a direction to start digging?  I 
would really appreciate any direction you could provide.

> But from your description it looks like something related to your
> system, not UBIFS.
In spite of this, I appreciate your efforts to assist me.

Best regards,

Russell Zuck
