Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KEHDM-0000rL-Be
	for linux-mtd@lists.infradead.org; Thu, 03 Jul 2008 05:18:40 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m635IdPH007634
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jul 2008 22:18:39 -0700
To: linux-mtd@lists.infradead.org
Subject: Problem mounting a UBIFS volume
MIME-Version: 1.0
Message-ID: <OF565C42CF.2A35DC45-ON8825747B.001B2100-8825747B.001D1F69@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 2 Jul 2008 22:18:14 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

I'm trying to wrap up my changes to support >8GiB MTD devices so it can be 
tested while I'm on vacation.  For the most part things run okay (I think 
:-\  ).  I can load UBI and UBIFS.  ubimkvol/ubirmvol seem to work okay 
and I can mount/read/write/umount volumes created with ubimkvol.  But I 
have a problem when using mkfs.ubifs and I'm not sure if the problme is in 
mkfs.ubifs or in the kernel.  mkfs.ubifs runs fine and finishes without 
complaining.  ubiupdatevol seems to have no problems writing the image to 
the device.  When I try to mount the volume, though, it fails to mount and 
gives the following error:

UBIFS error (pid 842): check_lpt_crc:invalid crc in LPT node: crc 2bbb 
calc a5a5
UBIFS error (pid 842): ubifs_read_nnode: error -22 reading nnode at 8:6150
mount: wrong fs type, bad option, bad superblock on ubi0:bob,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

dmesg gives the following:

UBIFS DBG (pid 824): ubifs_get_sb: name ubi0:bob, flags 0x0
UBIFS DBG (pid 824): ubifs_get_sb: opened ubi0_0
UBIFS DBG (pid 824): ubifs_read_node: LEB 0:0, superblock node, length 
4096
UBIFS DBG (pid 824): ubifs_start_scan: scan LEB 1:0
UBIFS DBG (pid 824): ubifs_scan: look at LEB 1:0 (129024 bytes left)
UBIFS: background thread "ubifs_bgt0_0" started, PID 825
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 824): ubifs_scan: look at LEB 1:512 (128512 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 824): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
UBIFS DBG (pid 824): ubifs_scan: look at LEB 1:2048 (126976 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 824): ubifs_scan: look at LEB 1:2560 (126464 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 824): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
UBIFS DBG (pid 824): ubifs_scan: look at LEB 1:4096 (124928 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 824): ubifs_end_scan: stop scanning LEB 1 at offset 4096
UBIFS DBG (pid 824): ubifs_start_scan: scan LEB 2:0
UBIFS DBG (pid 824): ubifs_scan: look at LEB 2:0 (129024 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 824): ubifs_scan: look at LEB 2:512 (128512 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 824): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
UBIFS DBG (pid 824): ubifs_scan: look at LEB 2:2048 (126976 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 824): ubifs_scan: look at LEB 2:2560 (126464 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 824): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
UBIFS DBG (pid 824): ubifs_scan: look at LEB 2:4096 (124928 bytes left)
UBIFS DBG (pid 824): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 824): ubifs_end_scan: stop scanning LEB 2 at offset 4096
UBIFS DBG (pid 824): ubifs_read_node: LEB 1039:117456, indexing node, 
length 88
UBIFS: recovery needed
UBIFS DBG (pid 824): ubifs_recover_inl_heads: checking index head at 
1039:118784
UBIFS DBG (pid 824): ubifs_recover_inl_heads: checking LPT head at 8:8192
UBIFS DBG (pid 824): lpt_init_rd: space_bits 14
UBIFS DBG (pid 824): lpt_init_rd: lpt_lnum_bits 4
UBIFS DBG (pid 824): lpt_init_rd: lpt_offs_bits 17
UBIFS DBG (pid 824): lpt_init_rd: lpt_spc_bits 17
UBIFS DBG (pid 824): lpt_init_rd: pcnt_bits 14
UBIFS DBG (pid 824): lpt_init_rd: lnum_bits 16
UBIFS DBG (pid 824): lpt_init_rd: pnode_sz 17
UBIFS DBG (pid 824): lpt_init_rd: nnode_sz 13
UBIFS DBG (pid 824): lpt_init_rd: ltab_sz 58
UBIFS DBG (pid 824): lpt_init_rd: lsave_sz 515
UBIFS DBG (pid 824): lpt_init_rd: lsave_cnt 256
UBIFS DBG (pid 824): lpt_init_rd: lpt_hght 7
UBIFS DBG (pid 824): lpt_init_rd: big_lpt 0
UBIFS DBG (pid 824): lpt_init_rd: LPT root is at 8:6150
UBIFS DBG (pid 824): lpt_init_rd: LPT head is at 8:8192
UBIFS DBG (pid 824): lpt_init_rd: LPT ltab is at 8:6680
UBIFS error (pid 824): check_lpt_crc:invalid crc in LPT node: crc 2bbb 
calc a5a5
Call Trace:
[dfa57bd0] [c0007ef0] show_stack+0x54/0x174 (unreliable)
[dfa57c00] [e10800e4] check_lpt_crc+0x94/0xb0 [ubifs]
[dfa57c30] [e1080370] unpack_nnode+0xdc/0xf0 [ubifs]
[dfa57c60] [e1081bd8] ubifs_read_nnode+0xc4/0x188 [ubifs]
[dfa57c90] [e1081f1c] ubifs_lpt_lookup_dirty+0x30/0x2d0 [ubifs]
[dfa57cb0] [e1074dc8] ubifs_replay_journal+0x28/0x113c [ubifs]
[dfa57d50] [e106a644] ubifs_fill_super+0xb24/0x1324 [ubifs]
[dfa57dc0] [e106b0b0] ubifs_get_sb+0x26c/0x2d0 [ubifs]
[dfa57e40] [c0062b30] vfs_kern_mount+0x5c/0xb4
[dfa57e60] [c0062bd8] do_kern_mount+0x40/0xf4
[dfa57e80] [c0079ef4] do_new_mount+0x6c/0xb8
[dfa57ea0] [c007a0cc] do_mount+0x18c/0x1b8
[dfa57f10] [c007a188] sys_mount+0x90/0xe4
[dfa57f40] [c000f220] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xff784f4
    LR = 0x10002cb8
UBIFS error (pid 824): ubifs_read_nnode: error -22 reading nnode at 8:6150
UBIFS DBG (pid 825): ubifs_bg_thread: background thread "ubifs_bgt0_0" 
stops


Now obviously there's a CRC mismatch between what was written to the flash 
and what UBIFS calculated.  At first I thought it might be an endian issue 
(my system is an MPC8347E running the tip of the UBIFS tree and the latest 
UBI tools and mkfs.ubifs), but I don't think so since the stored CRC is 
clearly different from the calculated.  I'm digging trying to find the 
problem but I'm into things I've never seen before and don't yet 
understand.  I now suspect that it's probably another one of those 64-bit 
promotions I've been fighting, but I'm not sure.  Any guidence you can 
give would be appreciated.

Thanks.

Bruce
