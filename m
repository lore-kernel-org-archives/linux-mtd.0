Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUpFt-0005tv-Tm
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 11:35:37 -0500
Date: Thu, 18 Nov 2004 17:35:29 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20041118163528.GA9471@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well I tried out the jffs2 which is in 2.6.10-rc2 vanilla and
experienced the same:

>>EIP; c00b55a0 <jffs2_garbage_collect_metadata+2a4/2e0>   <=====

>>r3; c0179f24 <init_thread_union+1f24/2000>

Trace; c00b5570 <jffs2_garbage_collect_metadata+274/2e0>
Trace; c00b53c8 <jffs2_garbage_collect_metadata+cc/2e0>
Trace; c00b51e4 <jffs2_garbage_collect_pristine+4c4/5dc>
Trace; c00b5904 <jffs2_garbage_collect_hole+d0/478>
Trace; c00b56dc <jffs2_garbage_collect_dirent+100/1cc>
Trace; c00b78ac <jffs2_do_setattr+38/780>
Trace; c00b777c <jffs2_garbage_collect_thread+cc/1c4>
Trace; c00b7ee4 <jffs2_do_setattr+670/780>
Trace; c00b7e4c <jffs2_do_setattr+5d8/780>
Trace; c00b8130 <jffs2_read_inode+58/2f8>

>>r8; c017e040 <def_chr_fops+1c/64>

Trace; c00b7f9c <jffs2_do_setattr+728/780>
Trace; c00789f4 <generic_shutdown_super+70/178>
Trace; c0078998 <generic_shutdown_super+14/178>
Trace; c008fe8c <__mntput+2c/30>
Trace; c008fe08 <clone_mnt+94/ec>
Trace; c0090610 <copy_tree+24/174>
Trace; c00904c0 <do_umount+1bc/1c0>
Trace; c0090a5c <do_loopback+160/1c0>
Trace; c00909b4 <do_loopback+b8/1c0>
Trace; c0008f18 <do_mount_root+30/bc>

>>r8; c0190600 <uidhash_table+7c8/800>
>>r7; c015a8e8 <border+28/4c>

Trace; c0008ee8 <do_mount_root+0/bc>
Trace; c0008ffc <mount_block_root+58/124>
Trace; c0008fa4 <mount_block_root+0/124>
Trace; c0009194 <prepare_namespace+60/a0>

>>r4; c0016628 <tmp_cmdline.1+3a8/400>

Trace; c0009134 <prepare_namespace+0/a0>
Trace; c0017258 <thash_entries+204/fac>

>>r4; c015a700 <__lock_text_end+42c/5ec>

Trace; c0017204 <thash_entries+1b0/fac>
Trace; c00359cc <__set_special_pids+54/8c>

Code;  c00b5590 <jffs2_garbage_collect_metadata+294/2e0>
00000000 <_EIP>:
Code;  c00b5590 <jffs2_garbage_collect_metadata+294/2e0>
   0:   05 00 00 0a 04            add    $0x40a0000,%eax
Code;  c00b5595 <jffs2_garbage_collect_metadata+299/2e0>
   5:   10 a0 e1 07 00 a0         adc    %ah,0xa00007e1(%eax)
Code;  c00b559b <jffs2_garbage_collect_metadata+29f/2e0>
   b:   e1 d1                     loope  ffffffde <_EIP+0xffffffde>
Code;  c00b559d <jffs2_garbage_collect_metadata+2a1/2e0>
   d:   e3 ff                     jecxz  e <_EIP+0xe>
Code;  c00b559f <jffs2_garbage_collect_metadata+2a3/2e0>   <=====
   f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
Code;  c00b55a1 <jffs2_garbage_collect_metadata+2a5/2e0>
  11:   40                        inc    %eax
Code;  c00b55a2 <jffs2_garbage_collect_metadata+2a6/2e0>
  12:   94                        xchg   %eax,%esp
Code;  c00b55a3 <jffs2_garbage_collect_metadata+2a7/2e0>
  13:   e5 00                     in     $0x0,%eax

 <0>Kernel panic - not syncing: Attempted to kill init!

1 error issued.  Results may not be reliable.

I just wanted to inform you to guide to direction where to search.
Also "fixing" with booting 2.6.9 once helps here :)

I haven't found out yet how to test with emulation driver on host PC.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
