Received: from mailout-de.gmx.net ([213.165.64.22])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwWsZ-0007ih-6o
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 10:09:44 +0000
Message-ID: <4E561F4E.8080301@gmx.de>
Date: Thu, 25 Aug 2011 12:09:18 +0200
From: Ingo van Lil <inguin@gmx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Kernel bug when mounting corrupt JFFS2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

while hacking the CFI flash driver I managed to corrupt my JFFS2 image 
in a way that it triggers the following kernel bug when trying to mount it:

JFFS2 error: (7668) jffs2_link_node_ref: Adding new ref c90eb408 at 
(0x001639ec-0x00163a58) not immediately after previous 
(0x001639ec-0x001639ec)

The mount process will be killed with a segmentation fault, and there is 
no way to recover from this situation except by rebooting: The MTD 
device appears to remain locked, and a subsequent mount attempt will 
simply block.

The kernel version is 2.6.40.3 (which is the Fedora 15 alias for 3.0.3), 
but I can reproduce the same crash on 2.6.38.8 on ARM. You can download 
the image from http://dl.dropbox.com/u/24416392/jffs2-corrupt.bin (2MiB, 
128kiB erase size).

Regards,
Ingo


Full backtrace:

[10768.303463] JFFS2 error: (7668) jffs2_link_node_ref: Adding new ref 
c90eb408 at (0x001639ec-0x00163a58) not immediately after previous 
(0x001639ec-0x001639ec)
[10768.303489] ------------[ cut here ]------------
[10768.303493] kernel BUG at fs/jffs2/nodelist.c:644!
[10768.303497] invalid opcode: 0000 [#1] SMP
[10768.303502] Modules linked in: mtdblock block2mtd mtd_blkdevs jffs2 
zlib_deflate mtdchar mtd tun cdc_acm nfs tcp_lp fuse bnep bluetooth 
rfkill openafs(P) ppdev parport_pc lp parport nfsd lockd nfs_acl 
auth_rpcgss sunrpc cpufreq_ondemand acpi_cpufreq mperf des_generic md4 
nls_utf8 cifs fscache nvidia(P) snd_hda_codec_realtek snd_hda_intel 
snd_hda_codec snd_hwdep snd_seq snd_seq_device ftdi_sio snd_pcm 
snd_timer snd iTCO_wdt i7core_edac microcode e1000e edac_core i2c_i801 
iTCO_vendor_support soundcore i2c_core snd_page_alloc virtio_net 
kvm_intel kvm ipv6 firewire_ohci firewire_core crc_itu_t [last unloaded: 
block2mtd]
[10768.303570]
[10768.303575] Pid: 7668, comm: mount Tainted: P        W   
2.6.40.3-0.fc15.i686.PAE #1                  /DP55WB
[10768.303583] EIP: 0060:[<f13a03a3>] EFLAGS: 00010292 CPU: 5
[10768.303596] EIP is at jffs2_link_node_ref+0xc9/0x115 [jffs2]
[10768.303600] EAX: 000000a8 EBX: c31c25e0 ECX: 00000046 EDX: 00000000
[10768.303605] ESI: c90eb408 EDI: 00163a58 EBP: cbcd7cf0 ESP: cbcd7cbc
[10768.303609]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[10768.303613] Process mount (pid: 7668, ti=cbcd6000 task=c31c25e0 
task.ti=cbcd6000)
[10768.303617] Stack:
[10768.303619]  f13af124 00001df4 f13ae990 c90eb408 001639ec 00163a58 
001639ec 001639ec
[10768.303630]  c9113c00 001639ec c9113a3c c9113c00 000039ec cbcd7d14 
f13ad600 0000006c
[10768.303640]  e662ab80 000039ec c9113c00 c9020a78 00000000 c9020000 
cbcd7d68 f13add88
[10768.303651] Call Trace:
[10768.303667]  [<f13ad600>] sum_link_node_ref+0x54/0x5c [jffs2]
[10768.303681]  [<f13add88>] jffs2_sum_scan_sumnode+0x1c0/0x57d [jffs2]
[10768.303695]  [<f13a433e>] jffs2_scan_medium+0x2dc/0x117e [jffs2]
[10768.303704]  [<c04e5e68>] ? kmalloc_order_trace+0x40/0x4a
[10768.303719]  [<f13ad682>] ? jffs2_sum_init+0x7a/0xc7 [jffs2]
[10768.303732]  [<f13a6d62>] jffs2_do_mount_fs+0x19f/0x43d [jffs2]
[10768.303738]  [<c04e77e3>] ? __kmalloc+0x103/0x110
[10768.303751]  [<f13a8a67>] ? jffs2_do_fill_super+0x109/0x212 [jffs2]
[10768.303764]  [<f13a8a83>] jffs2_do_fill_super+0x125/0x212 [jffs2]
[10768.303777]  [<f13a8f85>] jffs2_fill_super+0xdb/0xe1 [jffs2]
[10768.303786]  [<f1354abf>] mount_mtd_aux+0x46/0x8d [mtd]
[10768.303799]  [<f13a8eaa>] ? jffs2_alloc_inode+0x25/0x25 [jffs2]
[10768.303808]  [<f1354bd1>] mount_mtd+0xcb/0x132 [mtd]
[10768.303821]  [<f13a8eaa>] ? jffs2_alloc_inode+0x25/0x25 [jffs2]
[10768.303834]  [<f13a8cf4>] jffs2_mount+0x1f/0x24 [jffs2]
[10768.303847]  [<f13a8eaa>] ? jffs2_alloc_inode+0x25/0x25 [jffs2]
[10768.303854]  [<c04f6c33>] mount_fs+0x5c/0x13d
[10768.303862]  [<c0507aef>] ? alloc_vfsmnt+0x9b/0x116
[10768.303868]  [<c0507d80>] vfs_kern_mount+0x52/0x7f
[10768.303875]  [<c05085a5>] do_kern_mount+0x39/0xb5
[10768.303880]  [<c05098e1>] do_mount+0x5b7/0x601
[10768.303886]  [<c04ca1e1>] ? strndup_user+0x2e/0x3f
[10768.303891]  [<c0509b52>] sys_mount+0x6d/0x99
[10768.303898]  [<c08026df>] sysenter_do_call+0x12/0x28
[10768.303901] Code: fc 01 c8 01 d7 89 4c 24 18 89 7c 24 14 89 54 24 10 
89 44 24 1c 8b 83 08 02 00 00 c7 04 24 24 f1 3a f1 89 44 24 04 e8 8a 4c 
45 cf <0f> 0b 85 d2 89 73 2c 74 0a 8b 4a 04 89 0e 89 72 04 eb 06 c7 06
[10768.303949] EIP: [<f13a03a3>] jffs2_link_node_ref+0xc9/0x115 [jffs2] 
SS:ESP 0068:cbcd7cbc
[10768.303980] ---[ end trace 53ff1149b45b61dc ]---
