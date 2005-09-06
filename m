Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECcp6-0004gc-Pj
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 08:45:17 -0400
Date: Tue, 6 Sep 2005 14:44:58 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050906124457.GA30427@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: XIP on 2.6.13 broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Sadly I can not reproduce one Oops I got once with this Problem.
This one is not 100% reliable:

>>EIP; bf062800 <__wake_up_common+28/7c>   <=====

Trace; bf0627d8 <__wake_up_common+0/7c>
Trace; bf062894 <__wake_up+40/64>
Trace; bf062854 <__wake_up+0/64>
Trace; bf128f20 <cfi_intelext_point+f8/11c>
Trace; bf128ddc <do_point_onechip+e4/130>
Trace; bf12947c <cfi_intelext_write_words+194/2ec>
Trace; bf1293b0 <cfi_intelext_write_words+c8/2ec>
Trace; bf123484 <part_write_oob+44/b4>
Trace; bf123450 <part_write_oob+10/b4>
Trace; bf0e2fe4 <jffs2_scan_eraseblock+328/b1c>
Trace; bf0e28ac <jffs2_scan_medium+3b0/770>
Trace; bf0e67f0 <jffs2_build_filesystem+3dc/438>
Trace; bf0e67c4 <jffs2_build_filesystem+3b0/438>
Trace; bf0e6f24 <jffs2_erase_pending_blocks+160/254>
Trace; bf0e6d68 <jffs2_erase_block+1a0/1fc>
Trace; bf0e8fcc <jffs2_flash_setup+1c/88>
Trace; bf0e8ea8 <jffs2_gc_fetch_inode+154/1b0>
Trace; bf0e9774 <jffs2_wbuf_pending_for_ino+14/70>
Trace; bf0e9698 <jffs2_put_super+44/cc>
Trace; bf0e9828 <jffs2_wbuf_dirties_inode+c/78>
Trace; bf0e97d4 <jffs2_clear_wbuf_ino_list+4/4c>
Trace; bf0e99c8 <jffs2_block_refile+134/1cc>
Trace; bf0e9834 <jffs2_wbuf_dirties_inode+18/78>
Trace; bf0a6b14 <sb_set_blocksize+40/50>
Trace; bf0a6ab8 <set_blocksize+88/a4>
Trace; bf0bead8 <mark_mounts_for_expiry+e8/210>
Trace; bf0bea5c <mark_mounts_for_expiry+6c/210>
Trace; bf0bf208 <sys_mount+38/f0>
Trace; bf0bf0b8 <copy_namespace+244/35c>
Trace; bf0bf628 <sys_pivot_root+34/360>
Trace; bf0bf580 <chroot_fs_refs+f0/164>
Trace; bf040b64 <do_mount_root+30/bc>

>>r8; c0027cc4 <vfsmount_lock+0/4>
>>r7; bf187ed0 <__func__.2+894/fab4>
Trace; bf040b34 <do_mount_root+0/bc>
Trace; bf040c48 <mount_block_root+58/124>
Trace; bf040bf0 <mount_block_root+0/124>
Trace; bf040d68 <mount_root+54/6c>

>>r5; bf187ed0 <__func__.2+894/fab4>

Trace; bf040d14 <mount_root+0/6c>
Trace; bf040e0c <prepare_namespace+8c/d0>

>>r5; c000a494 <root_device_name+0/4>
>>r4; c000a4e4 <root_delay+0/4>

Trace; bf040d80 <prepare_namespace+0/d0>
Trace; bf04fb58 <init+54/f8>

>>r4; bf187d80 <__func__.2+744/fab4>

Trace; bf04fb04 <init+0/f8>
Trace; bf068d30 <do_exit+e4/43c>

Code;  bf0627f0 <__wake_up_common+18/7c>
00000000 <_EIP>:
Code;  bf0627f0 <__wake_up_common+18/7c>
   0:   01 a0 a0 e1 02 40         add    %esp,0x4002e1a0(%eax)
Code;  bf0627f6 <__wake_up_common+1e/7c>
   6:   a0 e1 03 80 a0            mov    0xa08003e1,%al
Code;  bf0627fb <__wake_up_common+23/7c>
   b:   e1 04                     loope  11 <_EIP+0x11>
Code;  bf0627fd <__wake_up_common+25/7c>
   d:   90                        nop    
Code;  bf0627fe <__wake_up_common+26/7c>
   e:   9b                        fwait
Code;  bf0627ff <__wake_up_common+27/7c>   <=====
   f:   e5 00                     in     $0x0,%eax   <=====
Code;  bf062801 <__wake_up_common+29/7c>
  11:   70 9e                     jo     ffffffb1 <_EIP+0xffffffb1>
Code;  bf062803 <__wake_up_common+2b/7c>
  13:   e5 00                     in     $0x0,%eax

 <0>Kernel panic - not syncing: Attempted to kill init!


What I wonder is, has anything been change in timer related code in the 
arm9 arch? May be the XIP stuff does not care of such a change yet.

Otherwise... I am clueless why it is not working anymore...

Konsti
