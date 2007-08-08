Received: from smtpauth05.prod.mesa1.secureserver.net ([64.202.165.99])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIoLf-0005ue-60
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 12:25:37 -0400
Message-ID: <46B9EE9B.7060805@techmoninc.com>
Date: Wed, 08 Aug 2007 11:26:03 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 (DOC 2000) woes.
References: <46B76F31.6020507@techmoninc.com>
In-Reply-To: <46B76F31.6020507@techmoninc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy Kennedy wrote:
> I have been tasked to install Linux on a DOC 2000 on a SBC by 
> Winsystems.  Since the DOC has reached EOL (July 1, 2007 -- for those 
> that didn't know this) Winsystems won't assist me in this task -- and he 
> got rid of all his work towards this end a few weeks ago, so I'm out of 
> luck there.
>
> What I have done:
> Made a all-in-one kernel with BusyBox as the init for the initrd.
> Included MTD support in the kernel -- including NFTL.
>     I do get a /dev/mtd0 that I can access rw.
>     I also get the following message at boot:
>         NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c 
> $Revision: 1.41 $
>         DiskOnChip found at 0xd8000
>         DiskOnChip 2000 responds to DWORD access
>         NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 
> 32MiB 3,3V 8-bit)
>         Found DiskOnChip ANAND Media Header at 0x0
>         Found DiskOnChip ANAND Media Header at 0x4000
>             DataOrgID        = ANAND
>             NumEraseUnits    = 2048
>             FirstPhysicalEUN = 0
>             FormattedSize    = 32849920
>             UnitSizeFactor   = 255
>         mtd: Giving out device 0 to DiskOnChip 2000 (NFTL Model)
>         NFTL: add_mtd for DiskOnChip 2000 (NFTL Model)
>         nand_read_oob: from = 0x00000200, len = 8
>         nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 
> 0x02                                                                   
> <snip> ...
>         nand_isbad_bbt(): bbt info for offs 0x01ff8000: (block 2046) 0x00
>         nand_isbad_bbt(): bbt info for offs 0x01ffc000: (block 2047) 0x00
>         nand_read_oob: from = 0x00004200, len = 8
>         nand_read_oob: from = 0x0000c200, len = 8
>         NFTL Media Headers at 0x0 and 0xc000 disagree.
>         nand_read_oob: from = 0x00010200, len = 8
>         NFTL Media Headers at 0x0 and 0x10000 disagree.
>         nand_read_oob: from = 0x00008000, len = 8
> <snip> ...
>         nand_read_oob: from = 0x01fffe00, len = 16
>         nand_write_oob: to = 0x01ffc200, len = 8
>         NFTL: cannot calculate a geometry to match size of 0xfaa0.
>         NFTL: using C:1002 H:16 S:4 (== 0xfa80 sects)
>          nftla: unknown partition table
> I didn't start getting this error at first - other than the nftla: 
> unknown partition table - until I attempted to nftl-format the DOC.  
> After reading through the archive (which I have done extensively) I 
> found that I may have needed to load the nftl driver AFTER the 
> nftl-format took place.  The first boot, however, it looked like the 
> NFTL driver itself formated the DOC -- Is this correct?
>
> I've looked all over for a *good* and recent howto for the DOC, however, 
> I cannot locate one.  Searching through the list hasn't helped me much 
> either.  Other questions I have are as follows:
>
> Can I build Ext3 onto DOC using the NFTL driver in Kernel 2.6.22.1?
> Can I use lilo on the DOC using the NFTL driver?
> Will I be able to boot from the DOC with the NFTL replacement firmware 
> if the Caldera DOS with the M-systems drivers do?
>
> My next task in attempting to make this work is to reformat the system 
> with DOS and ensure that the DOS drivers can load everything.  I was 
> also thinking of grabbing one of the newer systems that I have to make 
> sure I have a good firmware version -- I don't think I have the 
> latest/greatest firmware loaded at this moment, and the dformat command 
> that I found online somewhere (as it appears that all of the DOS utils 
> are removed from the Sandisk website) is version .  Is this the latest 
> and does anyone have a copy of newer utils/images?  Do I need these 
> utilities to get a bootable Linux onto the DOC?
>
> Thanks for any assistance you can offer,
> Andy
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>   
What I have done now:
I have installed Slackware 12.0 onto a USB hard drive with a boot disk
via floppy using kernel 2.6.22.1.  I attempted to first get partitions
of the nftl via fdisk, next I attempted to create an ext3 fs on the
unit. . . this is the result:

root@winsys:~# fdisk -l /dev/nftla

Disk /dev/nftla: 32 MB, 32768000 bytes
16 heads, 4 sectors/track, 1000 cylinders
Units = cylinders of 64 * 512 = 32768 bytes

Disk /dev/nftla doesn't contain a valid partition table
root@winsys:~# mke2fs -j /dev/nftla
mke2fs 1.39 (29-May-2006)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
8000 inodes, 32000 blocks
1600 blocks (5.00%) reserved for the super user
First data block=1
Maximum filesystem blocks=32768000
4 block groups
8192 blocks per group, 8192 fragments per group
2000 inodes per group
Superblock backups stored on blocks:
         8193, 24577

Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: general
protection fault: 0000 [#1]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c01b5e88>]    Not tainted VLI
EFLAGS: 00010097   (2.6.22.1 #3)
EIP is at blk_recount_segments+0x78/0x1b2
eax: c11c83f8   ebx: c1139260   ecx: 00000000   edx: c1000000
esi: c1139260   edi: ffffffff   ebp: c11c83f8   esp: c0ce7f00
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process nftld (pid: 1380, ti=c0ce6000 task=c19380d0 task.ti=c0ce6000)
Stack: c10befe0 c11c83f8 00000000 c1000000 00000000 00000000 00000000
00000000
        00000000 00000001 00000000 00000001 00000000 00000000 c1139260
c3ac51d4
        c11392a0 c11c83f8 c015bc59 c1139260 c01b6a5a 00000000 00000001
c01bc12e
Call Trace:
  [<c015bc59>] bio_phys_segments+0xe/0x14
  [<c01b6a5a>] __end_that_request_first+0x277/0x366
  [<c01bc12e>] as_dispatch_request+0x2d9/0x30f
  [<c01b6f46>] end_request+0xe/0x32
  [<c48034f5>] mtd_blktrans_thread+0x138/0x150 [mtd_blkdevs]
  [<c48033bd>] mtd_blktrans_thread+0x0/0x150 [mtd_blkdevs]
  [<c011ee9c>] kthread+0x36/0x5a
  [<c011ee66>] kthread+0x0/0x5a
  [<c0103d37>] kernel_thread_helper+0x7/0x10
  =======================
Code: c7 44 24 20 00 00 00 00 c7 44 24 2c 01 00 00 00 c7 44 24 30 00 00
00 00 e9 f9 00 00 00 8b 15 e0 39 3d c0 8b 44 24 04 89 54
EIP: [<c01b5e88>] blk_recount_segments+0x78/0x1b2 SS:ESP 0068:c0ce7f00
attempt to access beyond end of device
sda1: rw=32, want=4294967296, limit=156296322

Message from sBUG: unable to handle kernel NULL pointer
dereferenceyslogd@winsys at at virtual address 00000007
  Wed Aug  8 10:2 printing eip:
1:46 2007 ...
c016505a
*pde = 00000000
Oops: 0000 [#2]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c016505a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22.1 #3)
EIP is at dnotify_flush+0xa/0x55
eax: ffffffff   ebx: c1131480   ecx: 00000000   edx: c10cc740
esi: c1131480   edi: c10cc740   ebp: c10cc748   esp: c36adf40
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process syslogd (pid: 1395, ti=c36ac000 task=c19380d0 task.ti=c36ac000)
Stack: c1131480 c10cc740 00000000 c013f5e8 c0136afe c10cc740 00000014
0000000f
        c01134ff 00000000 00000000 00000000 c19380d0 00000001 00000000
c01143f0
        c36adfb8 c38fc5b4 c38fc580 00000000 c36adfb8 c02edea4 00000004
00000000
Call Trace:
  [<c013f5e8>] filp_close+0x41/0x58
  [<c0136afe>] exit_mmap+0xb2/0xc9
  [<c01134ff>] put_files_struct+0x5e/0xa6
  [<c01143f0>] do_exit+0x1c0/0x5f2
  [<c0114873>] sys_exit_group+0x0/0xd
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 90 f0 00 00 00 74 18 83 3b 00 75 04 0f 0b eb fe ff 03 e8 67 ff ff
ff 89 d8 5b e9 26 8f fe ff 5b c3 57 56 53 89 c6 8b 40 0c
EIP: [<c016505a>] dnotify_flush+0xa/0x55 SS:ESP 0068:c36adf40
winsys kernel: EFixing recursive fault but reboot is needed!
IP:    0060:[<c01b5e88>]    Not tainted VLI
BUG: unable to handle kernel NULL pointer dereference
                                                      Message from s at
virtual address 00000007
yslogd@winsys at printing eip:
c016505a
*pde = 00000000
  Wed Aug  8 10:2Oops: 0000 [#3]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c016505a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22.1 #3)
EIP is at dnotify_flush+0xa/0x55
eax: ffffffff   ebx: c1131480   ecx: 00000000   edx: c10cc800
esi: c1131480   edi: c10cc800   ebp: c10cc808   esp: c3709f40
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process syslogd (pid: 1393, ti=c3708000 task=c10efab0 task.ti=c3708000)
Stack: c1131480 c10cc800 00000000 c013f5e8 c0136afe c10cc800 00000014
0000000f
        c01134ff 00000000 00000000 00000000 c10efab0 00000001 00000000
c01143f0
        c3709fb8 c38fcdd4 c38fcda0 00000000 c3709fb8 c02edea4 00000004
00000000
Call Trace:
  [<c013f5e8>] filp_close+0x41/0x58
  [<c0136afe>] exit_mmap+0xb2/0xc9
  [<c01134ff>] put_files_struct+0x5e/0xa6
  [<c01143f0>] do_exit+0x1c0/0x5f2
  [<c0114873>] sys_exit_group+0x0/0xd
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 90 f0 00 00 00 74 18 83 3b 00 75 04 0f 0b eb fe ff 03 e8 67 ff ff
ff 89 d8 5b e9 26 8f fe ff 5b c3 57 56 53 89 c6 8b 40 0c
EIP: [<c016505a>] dnotify_flush+0xa/0x55 SS:ESP 0068:c3709f40
1:46 2007 ...
Fixing recursive fault but reboot is needed!
winsys kernel: EEXT3-fs error (device sda1): ext3_get_inode_loc: IP:
0060:[<c0unable to read inode block - inode=1376261, bloc
tainted VLI
BUG: unable to handle kernel NULL pointer dereference at virtual address
00000093
  printing eip:
c0210d19
*pde = 00000000
Oops: 0000 [#4]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c0210d19>]    Not tainted VLI
EFLAGS: 00010046   (2.6.22.1 #3)
EIP is at scsi_prep_fn+0x1af/0x222
eax: c11d5840   ebx: c11d5840   ecx: 00000000   edx: ffffffff
esi: c11d4400   edi: 00000000   ebp: c3ac5334   esp: c3705c28
ds: 007b   es: 007b   fs: 0000  gs: 0033  ss: 0068
Process syslogd (pid: 1394, ti=c3704000 task=c19385d0 task.ti=c3704000)
Stack: c0117e33 c0123d09 00000001 c11c8080 c3ac5334 c11c8080 c11d4c00
c11c8080
        c01b5381 c366bda0 c11c8080 000000f0 c3ac5334 c11c8080 c11d4400
c11d4c00
        c0211518 00000082 c11c8080 c01b796e 00000186 c11c8080 00000000
c3705ccc
Call Trace:
  [<c0117e33>] run_timer_softirq+0x11/0x12f
  [<c0123d09>] tick_handle_periodic+0xf/0x5e
  [<c01b5381>] elv_next_request+0x67/0x114
  [<c0211518>] scsi_request_fn+0x59/0x273
  [<c01b796e>] blk_remove_plug+0x4e/0x5a
  [<c01b7997>] __generic_unplug_device+0x1d/0x1f
  [<c01b8281>] generic_unplug_device+0x6/0x8
  [<c01b5c7c>] blk_backing_dev_unplug+0xc/0xd
  [<c01594d5>] sync_buffer+0x26/0x2e
  [<c02a9388>] __wait_on_bit+0x33/0x58
  [<c01594af>] sync_buffer+0x0/0x2e
  [<c01594af>] sync_buffer+0x0/0x2e
  [<c02a940f>] out_of_line_wait_on_bit+0x62/0x6a
  [<c011f026>] wake_bit_function+0x0/0x3c
  [<c0159466>] __wait_on_buffer+0x24/0x27
  [<c0159e60>] sync_dirty_buffer+0x86/0xba
  [<c017c648>] ext3_commit_super+0x3a/0x4e
  [<c017ce39>] ext3_handle_error+0x72/0x99
  [<c01127d8>] printk+0x1b/0x1f
  [<c017cf0f>] ext3_error+0x55/0x5a
  [<c0176527>] __ext3_get_inode_loc+0x2af/0x2cf
  [<c0176571>] ext3_reserve_inode_write+0x19/0x5d
  [<c01765cf>] ext3_mark_inode_dirty+0x1a/0x30
  [<c0178def>] ext3_dirty_inode+0x55/0x6c
  [<c013048c>] blockable_page_cache_readahead+0x4c/0x9f
  [<c0156131>] __mark_inode_dirty+0x28/0x148
  [<c01155a3>] current_fs_time+0x37/0x3c
  [<c012bf26>] do_generic_mapping_read+0x3ee/0x43b
  [<c012d7aa>] generic_file_aio_read+0x130/0x156
  [<c012b3a0>] file_read_actor+0x0/0xd1
  [<c0140a7f>] do_sync_read+0xc6/0x109
  [<c011eff1>] autoremove_wake_function+0x0/0x35
  [<c01409b9>] do_sync_read+0x0/0x109
  [<c01411f5>] vfs_read+0x88/0x110
  [<c0141520>] sys_read+0x41/0x67
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 00 75 04 0f 0b eb fe 89 ea 89 f0 e8 ad f7 ff ff 89 c3 85 c0 74 73
e8 96 fd ff ff 89 c7 85 c0 75 32 8b 45 58 8b 40 3c 8b 10
EIP: [<c0210d19>] scsi_prep_fn+0x1af/0x222 SS:ESP 0068:c3705c28

Message from syslogd@winsys at Wed Aug  8 10:21:46 2007 ...
winsys kernel: general protection fault: 0000 [#1]

Message from syslogd@wiBUG: unable to handle kernel NULL pointer
dereferencensys at Wed Aug  at virtual address 00000007
  8 10:21:46 2007 printing eip:
  ...
winsys kec016505a
*pde = 00000000
rnel: general prOops: 0000 [#5]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c016505a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22.1 #3)
EIP is at dnotify_flush+0xa/0x55
eax: ffffffff   ebx: c1131480   ecx: 00000000   edx: c10ccec0
esi: c1131480   edi: c10ccec0   ebp: c10ccec8   esp: c3595f40
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process syslogd (pid: 1397, ti=c3594000 task=c3703a70 task.ti=c3594000)
Stack: c1131480 c10ccec0 00000000 c013f5e8 c0136afe c10ccec0 00000014
0000000f
        c01134ff 00000000 00000000 00000000 c3703a70 00000001 00000000
c01143f0
        c3595fb8 c38fcdd4 c38fcda0 00000000 c3595fb8 c02edea4 00000004
00000000
Call Trace:
  [<c013f5e8>] filp_close+0x41/0x58
  [<c0136afe>] exit_mmap+0xb2/0xc9
  [<c01134ff>] put_files_struct+0x5e/0xa6
  [<c01143f0>] do_exit+0x1c0/0x5f2
  [<c0114873>] sys_exit_group+0x0/0xd
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 90 f0 00 00 00 74 18 83 3b 00 75 04 0f 0b eb fe ff 03 e8 67 ff ff
ff 89 d8 5b e9 26 8f fe ff 5b c3 57 56 53 89 c6 8b 40 0c
EIP: [<c016505a>] dnotify_flush+0xa/0x55 SS:ESP 0068:c3595f40
otection fault: Fixing recursive fault but reboot is needed!
0000 [#1]

Message from syslogd@winsys at Wed Aug  8 10:21:BUG: unable to handle
kernel NULL pointer dereference46 2007 ...
wi at virtual address 00000007
nsys kernel: EIP printing eip:
c016505a
  is at blk_recou*pde = 00000000
nt_segments+0x78Oops: 0000 [#6]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c016505a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22.1 #3)
EIP is at dnotify_flush+0xa/0x55
eax: ffffffff   ebx: c1131480   ecx: 00000000   edx: c10cc680
esi: c1131480   edi: c10cc680   ebp: c10cc688   esp: c3653f40
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process syslogd (pid: 1398, ti=c3652000 task=c3703570 task.ti=c3652000)
Stack: c1131480 c10cc680 00000000 c013f5e8 c0136afe c10cc680 00000014
0000000f
        c01134ff 00000000 00000000 00000000 c3703570 00000001 00000000
c01143f0
        c3653fb8 c38fcdd4 c38fcda0 00000000 c3653fb8 c02edea4 00000004
00000000
Call Trace:
  [<c013f5e8>] filp_close+0x41/0x58
  [<c0136afe>] exit_mmap+0xb2/0xc9
  [<c01134ff>] put_files_struct+0x5e/0xa6
  [<c01143f0>] do_exit+0x1c0/0x5f2
  [<c0114873>] sys_exit_group+0x0/0xd
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 90 f0 00 00 00 74 18 83 3b 00 75 04 0f 0b eb fe ff 03 e8 67 ff ff
ff 89 d8 5b e9 26 8f fe ff 5b c3 57 56 53 89 c6 8b 40 0c
EIP: [<c016505a>] dnotify_flush+0xa/0x55 SS:ESP 0068:c3653f40
/0x1b2

MesFixing recursive fault but reboot is needed!
sage from syslogd@winsys at Wed Aug  8 10:21:46 2007 ...
winsyBUG: unable to handle kernel NULL pointer dereferences kernel: EIP
is at virtual address 00000007
  at blk_recount_ printing eip:
segments+0x78/0xc016505a
*pde = 00000000
1b2

MessagOops: 0000 [#7]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c016505a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22.1 #3)
EIP is at dnotify_flush+0xa/0x55
eax: ffffffff   ebx: c1131480   ecx: 00000000   edx: c10cc140
esi: c1131480   edi: c10cc140   ebp: c10cc148   esp: c366ff40
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process syslogd (pid: 1399, ti=c366e000 task=c3703070 task.ti=c366e000)
Stack: c1131480 c10cc140 00000000 c013f5e8 c0136afe c10cc140 00000014
0000000f
        c01134ff 00000000 00000000 00000000 c3703070 00000001 00000000
c01143f0
        c366ffb8 c38fcdd4 c38fcda0 00000000 c366ffb8 c02edea4 00000004
00000000
Call Trace:
  [<c013f5e8>] filp_close+0x41/0x58
  [<c0136afe>] exit_mmap+0xb2/0xc9
  [<c01134ff>] put_files_struct+0x5e/0xa6
  [<c01143f0>] do_exit+0x1c0/0x5f2
  [<c0114873>] sys_exit_group+0x0/0xd
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 90 f0 00 00 00 74 18 83 3b 00 75 04 0f 0b eb fe ff 03 e8 67 ff ff
ff 89 d8 5b e9 26 8f fe ff 5b c3 57 56 53 89 c6 8b 40 0c
EIP: [<c016505a>] dnotify_flush+0xa/0x55 SS:ESP 0068:c366ff40
e from syslogd@wFixing recursive fault but reboot is needed!
insys at Wed Augattempt to access beyond end of device
   8 10:21:46 200sda1: rw=0, want=4294967296, limit=156296322
7 ...
winsys kEXT3-fs error (device sda1): read_block_bitmap: ernel: eax:
c11cCannot read block bitmap - block_group = 84, block_bitmap3
9260   ecx: 0000BUG: unable to handle kernel NULL pointer
dereference0000   edx: c100 at virtual address 00000007
0000

Messa printing eip:
c016505a
*pde = 00000000
ge from syslogd@Oops: 0000 [#8]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c016505a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22.1 #3)
EIP is at dnotify_flush+0xa/0x55
eax: ffffffff   ebx: c1131480   ecx: 00000000   edx: c10ccc80
esi: c1131480   edi: c10ccc80   ebp: c10ccc88   esp: c3705b14
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process syslogd (pid: 1394, ti=c3704000 task=c19385d0 task.ti=c3704000)
Stack: c1131480 c10ccc80 00000000 c013f5e8 c0136afe c10ccc80 00000014
0000000f
        c01134ff 00000000 00000000 c3705bf0 c19385d0 00000001 0000000b
c01143f0
        c3704000 00000002 c01ddb06 c3705bf0 c3705c28 00000006 c02e0068
c3705bf0
Call Trace:
  [<c013f5e8>] filp_close+0x41/0x58
  [<c0136afe>] exit_mmap+0xb2/0xc9
  [<c01134ff>] put_files_struct+0x5e/0xa6
  [<c01143f0>] do_exit+0x1c0/0x5f2
  [<c01ddb06>] do_unblank_screen+0x1b/0x110
  [<c01044ed>] die+0x185/0x18d
  [<c010e22e>] do_page_fault+0x45f/0x541
  [<c010ddcf>] do_page_fault+0x0/0x541
  [<c02a9e8a>] error_code+0x6a/0x70
  [<c0210d19>] scsi_prep_fn+0x1af/0x222
  [<c0117e33>] run_timer_softirq+0x11/0x12f
  [<c0123d09>] tick_handle_periodic+0xf/0x5e
  [<c01b5381>] elv_next_request+0x67/0x114
  [<c0211518>] scsi_request_fn+0x59/0x273
  [<c01b796e>] blk_remove_plug+0x4e/0x5a
  [<c01b7997>] __generic_unplug_device+0x1d/0x1f
  [<c01b8281>] generic_unplug_device+0x6/0x8
  [<c01b5c7c>] blk_backing_dev_unplug+0xc/0xd
  [<c01594d5>] sync_buffer+0x26/0x2e
  [<c02a9388>] __wait_on_bit+0x33/0x58
  [<c01594af>] sync_buffer+0x0/0x2e
  [<c01594af>] sync_buffer+0x0/0x2e
  [<c02a940f>] out_of_line_wait_on_bit+0x62/0x6a
  [<c011f026>] wake_bit_function+0x0/0x3c
  [<c0159466>] __wait_on_buffer+0x24/0x27
  [<c0159e60>] sync_dirty_buffer+0x86/0xba
  [<c017c648>] ext3_commit_super+0x3a/0x4e
  [<c017ce39>] ext3_handle_error+0x72/0x99
  [<c01127d8>] printk+0x1b/0x1f
  [<c017cf0f>] ext3_error+0x55/0x5a
  [<c0176527>] __ext3_get_inode_loc+0x2af/0x2cf
  [<c0176571>] ext3_reserve_inode_write+0x19/0x5d
  [<c01765cf>] ext3_mark_inode_dirty+0x1a/0x30
  [<c0178def>] ext3_dirty_inode+0x55/0x6c
  [<c013048c>] blockable_page_cache_readahead+0x4c/0x9f
  [<c0156131>] __mark_inode_dirty+0x28/0x148
  [<c01155a3>] current_fs_time+0x37/0x3c
  [<c012bf26>] do_generic_mapping_read+0x3ee/0x43b
  [<c012d7aa>] generic_file_aio_read+0x130/0x156
  [<c012b3a0>] file_read_actor+0x0/0xd1
  [<c0140a7f>] do_sync_read+0xc6/0x109
  [<c011eff1>] autoremove_wake_function+0x0/0x35
  [<c01409b9>] do_sync_read+0x0/0x109
  [<c01411f5>] vfs_read+0x88/0x110
  [<c0141520>] sys_read+0x41/0x67
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 90 f0 00 00 00 74 18 83 3b 00 75 04 0f 0b eb fe ff 03 e8 67 ff ff
ff 89 d8 5b e9 26 8f fe ff 5b c3 57 56 53 89 c6 8b 40 0c
EIP: [<c016505a>] dnotify_flush+0xa/0x55 SS:ESP 0068:c3705b14
winsys at Wed AuFixing recursive fault but reboot is needed!
g  8 10:21:46 20attempt to access beyond end of device
07 ...
winsys sda1: rw=32, want=4294967296, limit=156296322
kernel: eax: c11EXT3-fs error (device sda1): ext3_get_inode_loc: c83f8
ebx: c11unable to read inode block - inode=1376261, bloc0
00000   edx: c1000000

Message from syslogd@winsys at Wed Aug  8 10:21:46 2007 ...
winsys kernel: esi: c1139260   edi: ffffffff   ebp: c11c83f8   esp: c0ce7f00

Message from syslogd@winsys at Wed Aug  8 10:21:46 2007 ...
winsys kernel: esi: c1139260   edi: ffffffff   ebp: c11c83f8   esp: c0ce7f00
Clocksource tsc unstable (delta = 1160005963 ns)
Time: pit clocksource has been installed.
general protection fault: 0000 [#9]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c013e0e7>]    Not tainted VLI
EFLAGS: 00010286   (2.6.22.1 #3)
EIP is at drain_array+0x13/0x83
eax: 00000000   ebx: c117b260   ecx: ffffffff   edx: c117b260
esi: c1111680   edi: ffffffff   ebp: c1111680   esp: c10d5f6c
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process events/0 (pid: 4, ti=c10d4000 task=c10d1a50 task.ti=c10d4000)
Stack: 00000046 c117b260 c1111680 c03d3a60 00000000 c013ed0e 00000000
00000000
        c10be9e0 c03d3a60 c013eccc c011c7a9 00000092 c38fc3e0 c038a138
c10be9e0
        c10be9e0 c011cd2e c10be9e8 c011cdb8 00000000 c10d1a50 c011eff1
c10d5fc8
Call Trace:
  [<c013ed0e>] cache_reap+0x42/0xde
  [<c013eccc>] cache_reap+0x0/0xde
  [<c011c7a9>] run_workqueue+0x6b/0xdf
  [<c011cd2e>] worker_thread+0x0/0x96
  [<c011cdb8>] worker_thread+0x8a/0x96
  [<c011eff1>] autoremove_wake_function+0x0/0x35
  [<c011ee9c>] kthread+0x36/0x5a
  [<c011ee66>] kthread+0x0/0x5a
  [<c0103d37>] kernel_thread_helper+0x7/0x10
  =======================
Code: 10 04 8b 54 24 08 39 54 24 0c 0f 8c 2b ff ff ff 83 c4 14 5b 5e 5f
5d c3 55 57 56 53 83 ec 04 89 c5 89 cf 85 c9 8b 44 24 18
EIP: [<c013e0e7>] drain_array+0x13/0x83 SS:ESP 0068:c10d5f6c
BUG: unable to handle kernel NULL pointer dereference at virtual address
00000027
  printing eip:
c014788e
*pde = 00000000
Oops: 0000 [#10]
Modules linked in: nftl mtd_blkdevs
CPU:    0
EIP:    0060:[<c014788e>]    Not tainted VLI
EFLAGS: 00010286   (2.6.22.1 #3)
EIP is at __link_path_walk+0x654/0xa08
eax: c3e60cf4   ebx: c10cbf04   ecx: 00000000   edx: ffffffff
esi: c113580c   edi: c11350a0   ebp: c0d75005   esp: c10cbe18
ds: 007b   es: 007b   fs: 0000  gs: 0033  ss: 0068
Process init (pid: 1, ti=c10ca000 task=c10c9a30 task.ti=c10ca000)
Stack: c0d7500c 00000001 00000000 00000004 c10cbe4c c10cbe4c c10cbe58
c014a77d
        00000000 72c2ee54 00000007 c0d75005 c10b4da0 c3e60cf4 c032f980
c10cbf04
        c11a2a88 c10b4f20 c0147c84 c0d75000 c11a2a88 c10b4f20 00000000
00000000
Call Trace:
  [<c014a77d>] core_sys_select+0x1a3/0x2ca
  [<c0147c84>] link_path_walk+0x42/0xaf
  [<c0147f25>] do_path_lookup+0x131/0x14c
  [<c0146fcc>] getname+0x59/0x8f
  [<c01486dc>] __user_walk_fd+0x2f/0x45
  [<c014324b>] vfs_stat_fd+0x19/0x40
  [<c01432ff>] sys_stat64+0xf/0x23
  [<c01c176d>] copy_to_user+0x25/0x3c
  [<c014ad32>] sys_select+0x160/0x186
  [<c01218aa>] do_gettimeofday+0x2c/0xc2
  [<c011552b>] sys_time+0xa/0x2d
  [<c0102c02>] syscall_call+0x7/0xb
  =======================
Code: 03 00 00 8b 44 24 34 f6 44 24 04 01 8b 70 08 0f 84 7f 02 00 00 85
f6 0f 84 77 02 00 00 8b 96 80 00 00 00 85 d2 0f 84 69 02
EIP: [<c014788e>] __link_path_walk+0x654/0xa08 SS:ESP 0068:c10cbe18
Kernel panic - not syncing: Attempted to kill init!


Please help me if you can.

Andy
