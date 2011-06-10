Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVLVt-00018u-2A
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 10:34:02 +0000
Received: by wwb39 with SMTP id 39so2676499wwb.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 03:33:52 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 10 Jun 2011 18:12:09 +0530
Message-ID: <BANLkTino6S_ih8ULoqc6Pk1H51XtkAnuvg@mail.gmail.com>
Subject: logfs on nandsim, umount crash
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I compiled 2.6.35 kernel with CONFIG_MTD=y and i am using the SMP i686
machine with Ubuntu 10.04 Lucid operating system.  The steps i
followed and the dmesg tail output are as follows:

1. sudo modprobe logfs
2. sudo modprobe mtd
3. sudo modprobe mtdblock
4. sudo modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa
third_id_byte=0x00 fourth_id_byte=0x25
5. sudo flash_eraseall /dev/mtd0
6. sudo logfsprogs/mklogfs /dev/mtd0
I downloaded logfsprogs from "http://logfs-tools.sourcearchive.com/"
7. sudo mount -t logfs /dev/mtdblock0 /mnt/flash_drive/
8. df -h
9. sudo cp file.txt /mnt/flash_drive/
10. cat /mnt/flash_drive/file.txt
11. sudo umount /mnt/flash_drive/

Segmentation fault.

tail of the dmesg:

[  143.155682] NAND device: Manufacturer ID: 0x20, Chip ID: 0xaa (ST
Micro NAND 256MiB 1,8V 8-bit)
[  143.155691] flash size: 256 MiB
[  143.155696] page size: 2048 bytes
[  143.155700] OOB area size: 64 bytes
[  143.155703] sector size: 256 KiB
[  143.155707] pages number: 131072
[  143.155710] pages per sector: 128
[  143.155713] bus width: 8
[  143.155717] bits in sector size: 18
[  143.155720] bits in page size: 11
[  143.155724] bits in OOB size: 6
[  143.155728] flash size with OOB: 270336 KiB
[  143.155733] page address bytes: 5
[  143.155737] sector address bytes: 3
[  143.155740] options: 0x8
[  143.159059] Scanning device for bad blocks
[  143.160749] Creating 1 MTD partitions on "NAND 256MiB 1,8V 8-bit":
[  143.160755] 0x000000000000-0x000010000000 : "NAND simulator partition 0"
[  247.650884] LogFS: Start mount 0
[  247.657105] LogFS: Finished mounting
[  306.735432] LogFS: Start unmounting
[  306.748837] LogFS: Now in shutdown
[  306.748998] ------------[ cut here ]------------
[  306.749007] kernel BUG at fs/logfs/readwrite.c:1986!
[  306.749013] invalid opcode: 0000 [#1] SMP
[  306.749021] last sysfs file: /sys/devices/virtual/mtd/mtd0/size
[  306.749027] Modules linked in: mtdchar nandsim nand nand_ids
nand_ecc mtdblock mtd_blkdevs logfs zlib_deflate binfmt_misc
vboxnetadp vboxnetflt vboxdrv nfsd exportfs nfs lockd nfs_acl
auth_rpcgss sunrpc fbcon tileblit font snd_intel8x0 snd_ac97_codec
bitblit softcursor ac97_bus i915 snd_pcm_oss snd_mixer_oss snd_pcm
snd_seq_dummy drm_kms_helper snd_seq_oss ppdev parport_pc drm lp
snd_seq_midi snd_rawmidi parport snd_seq_midi_event snd_seq snd_timer
psmouse snd_seq_device snd i2c_algo_bit e1000 intel_agp joydev floppy
usbhid agpgart video output serio_raw hid shpchp soundcore
snd_page_alloc
[  306.749123]
[  306.749128] Pid: 1672, comm: umount Not tainted 2.6.35 #7 D865GBF
                     /
[  306.749133] EIP: 0060:[<f84867a2>] EFLAGS: 00010202 CPU: 1
[  306.749143] EIP is at logfs_clear_inode+0x62/0x70 [logfs]
[  306.749146] EAX: f4066840 EBX: f5e04e00 ECX: 00000000 EDX: 00000000
[  306.749150] ESI: f52a9ed4 EDI: 00000000 EBP: f52a9e98 ESP: f52a9e94
[  306.749154]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[  306.749158] Process umount (pid: 1672, ti=f52a8000 task=f5fb0cb0
task.ti=f52a8000)
[  306.749162] Stack:
[  306.749164]  f4066840 f52a9ea8 c021d27c ffffffff f4066840 f52a9ec0
c021d327 f5e04e70
[  306.749177] <0> f4066840 f4066850 f5e04e70 f52a9ee8 c021d774
f5e04e70 00000000 00000001
[  306.749190] <0> f52a9ed4 f52a9ed4 f5e04e00 f848c1a0 c07b7cfc
f52a9f00 c020ac22 f52a9f00
[  306.749205] Call Trace:
[  306.749216]  [<c021d27c>] ? clear_inode+0x7c/0x100
[  306.749221]  [<c021d327>] ? dispose_list+0x27/0x100
[  306.749226]  [<c021d774>] ? invalidate_inodes+0xf4/0x120
[  306.749232]  [<c020ac22>] ? generic_shutdown_super+0x42/0xd0
[  306.749239]  [<c0596aa2>] ? printk+0x1d/0x23
[  306.749247]  [<f848a0e6>] ? logfs_kill_sb+0x46/0xd0 [logfs]
[  306.749252]  [<c020b65d>] ? deactivate_locked_super+0x3d/0x60
[  306.749257]  [<c020be90>] ? deactivate_super+0x50/0x70
[  306.749263]  [<c02206ff>] ? mntput_no_expire+0x8f/0xd0
[  306.749269]  [<c0220a15>] ? sys_umount+0x65/0x340
[  306.749274]  [<c0220d0e>] ? sys_oldumount+0x1e/0x20
[  306.749280]  [<c0102fe3>] ? sysenter_do_call+0x12/0x28
[  306.749283] Code: ff ff 85 c0 74 29 8d 76 00 e8 2b e0 ff ff 5b 5d
c3 8b 4a 74 89 d8 8d 76 00 ff 51 04 5b 5d c3 0f 0b eb fe 83 78 28 00
66 90 74 bc <0f> 0b eb fe 0f 0b eb fe 8d b6 00 00 00 00 55 89 e5 57 56
53 83
[  306.749362] EIP: [<f84867a2>] logfs_clear_inode+0x62/0x70 [logfs]
SS:ESP 0068:f52a9e94
[  306.749404] ---[ end trace df7ecb1adf27c946 ]---
[  306.749410] ------------[ cut here ]------------
[  306.749418] WARNING: at kernel/exit.c:896 do_exit+0x64a/0x730()
[  306.749423] Hardware name:
[  306.749427] Modules linked in: mtdchar nandsim nand nand_ids
nand_ecc mtdblock mtd_blkdevs logfs zlib_deflate binfmt_misc
vboxnetadp vboxnetflt vboxdrv nfsd exportfs nfs lockd nfs_acl
auth_rpcgss sunrpc fbcon tileblit font snd_intel8x0 snd_ac97_codec
bitblit softcursor ac97_bus i915 snd_pcm_oss snd_mixer_oss snd_pcm
snd_seq_dummy drm_kms_helper snd_seq_oss ppdev parport_pc drm lp
snd_seq_midi snd_rawmidi parport snd_seq_midi_event snd_seq snd_timer
psmouse snd_seq_device snd i2c_algo_bit e1000 intel_agp joydev floppy
usbhid agpgart video output serio_raw hid shpchp soundcore
snd_page_alloc
[  306.749577] Pid: 1672, comm: umount Tainted: G      D     2.6.35 #7
[  306.749582] Call Trace:
[  306.749592]  [<c0149b62>] warn_slowpath_common+0x72/0xa0
[  306.749599]  [<c014deaa>] ? do_exit+0x64a/0x730
[  306.749606]  [<c014deaa>] ? do_exit+0x64a/0x730
[  306.749613]  [<c0149bb2>] warn_slowpath_null+0x22/0x30
[  306.749620]  [<c014deaa>] do_exit+0x64a/0x730
[  306.749628]  [<c014ab21>] ? kmsg_dump+0x121/0x130
[  306.749635]  [<c0596aa2>] ? printk+0x1d/0x23
[  306.749643]  [<c059ab35>] oops_end+0x95/0xd0
[  306.749652]  [<c0105ce4>] die+0x54/0x80
[  306.749659]  [<c059a246>] do_trap+0x96/0xc0
[  306.749666]  [<c0103d10>] ? do_invalid_op+0x0/0xa0
[  306.749673]  [<c0103d9b>] do_invalid_op+0x8b/0xa0
[  306.749685]  [<f84867a2>] ? logfs_clear_inode+0x62/0x70 [logfs]
[  306.749694]  [<c01cb6ce>] ? find_get_pages+0x2e/0xf0
[  306.749702]  [<c01d42e0>] ? pagevec_lookup+0x20/0x30
[  306.749710]  [<c01d5581>] ? truncate_inode_pages_range+0x141/0x2d0
[  306.749718]  [<c0599fc3>] error_code+0x73/0x80
[  306.749728]  [<f848007b>] ? logfs_rename_target+0x3b/0x3a0 [logfs]
[  306.749739]  [<f84867a2>] ? logfs_clear_inode+0x62/0x70 [logfs]
[  306.749747]  [<c021d27c>] clear_inode+0x7c/0x100
[  306.749755]  [<c021d327>] dispose_list+0x27/0x100
[  306.749762]  [<c021d774>] invalidate_inodes+0xf4/0x120
[  306.749769]  [<c020ac22>] generic_shutdown_super+0x42/0xd0
[  306.749777]  [<c0596aa2>] ? printk+0x1d/0x23
[  306.749787]  [<f848a0e6>] logfs_kill_sb+0x46/0xd0 [logfs]
[  306.749795]  [<c020b65d>] deactivate_locked_super+0x3d/0x60
[  306.749802]  [<c020be90>] deactivate_super+0x50/0x70
[  306.749811]  [<c02206ff>] mntput_no_expire+0x8f/0xd0
[  306.749818]  [<c0220a15>] sys_umount+0x65/0x340
[  306.749826]  [<c0220d0e>] sys_oldumount+0x1e/0x20
[  306.749833]  [<c0102fe3>] sysenter_do_call+0x12/0x28
[  306.749839] ---[ end trace df7ecb1adf27c947 ]---

Please let me know if i am missing anything.
Thanks,
Mugunthan
