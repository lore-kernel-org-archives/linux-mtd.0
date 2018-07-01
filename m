Received: from mail.bugwerft.de ([46.23.86.59])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZZRB-0000Rj-TM
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 10:18:35 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Daniel Mack <daniel@zonque.org>
Subject: marvell_nand driver fails to suspend
Message-ID: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
Date: Sun, 1 Jul 2018 12:18:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

I'm seeing the below error when trying to suspend and resume a PXA3xx 
machine booted from devicetree with the new nand driver. This used to 
work fine with the old driver, but admittedly, the only kernel I 
currently have for reference testing is very old (3.0.4), and many other 
things regarding nand/mtd have also changed since then.

The suspend/resume implementation in the old driver used to call into 
the ->suspend() and ->resume() functions of its mtd_info children 
directly, but looking at other drivers, it seems this is no longer 
needed or wanted. It also cleared all interrupts during resume, but that 
alone doesn't fix it in my tests.

I haven't followed the development in that area, so I'd appreciate any 
hint on how to fix this regression. I'm happy to test patches.


Thanks,
Daniel


$ [   43.576363] PM: suspend entry (deep)
[   43.579960] PM: Syncing filesystems ...
[   44.660162] marvell-nfc 43100000.nand-controller: Timeout waiting for 
RB signal
[   44.671492] ubi0 error: ubi_io_write: error -110 while writing 2048 
bytes to PEB 102:38912, written 0 bytes
[   44.682887] CPU: 0 PID: 1417 Comm: remote-control Not tainted 
4.18.0-rc2+ #344
[   44.691197] Hardware name: Marvell PXA3xx (Device Tree Support)
[   44.697111] Backtrace:
[   44.699593] [<c0106458>] (dump_backtrace) from [<c0106718>] 
(show_stack+0x18/0x1c)
[   44.708931]  r7:00000800 r6:00009800 r5:00000066 r4:c6139000
[   44.715833] [<c0106700>] (show_stack) from [<c0678a60>] 
(dump_stack+0x20/0x28)
[   44.724206] [<c0678a40>] (dump_stack) from [<c0456cbc>] 
(ubi_io_write+0x3d4/0x630)
[   44.732925] [<c04568e8>] (ubi_io_write) from [<c0454428>] 
(ubi_eba_write_leb+0x690/0x6fc)
[   44.742295]  r10:c67b1044 r9:c6b75dd8 r8:00000800 r7:c614bc00 
r6:00000080 r5:00008800
[   44.751220]  r4:c6139000
[   44.753817] [<c0453d98>] (ubi_eba_write_leb) from [<c04526d8>] 
(ubi_leb_write+0xc4/0xdc)
[   44.763406]  r10:c67b1044 r9:c6b75dd8 r8:00000800 r7:00008800 
r6:00000080 r5:00008800
[   44.772329]  r4:00000001
[   44.774921] [<c0452614>] (ubi_leb_write) from [<c02d2ad4>] 
(ubifs_leb_write+0xa0/0x110)
[   44.784405]  r6:00000218 r5:c66a6800 r4:c602a000
[   44.789224] [<c02d2a34>] (ubifs_leb_write) from [<c02d3680>] 
(ubifs_wbuf_sync_nolock+0x244/0x334)
[   44.799451]  r8:c01ee478 r7:00000760 r6:00000800 r5:c602a000 r4:c67a1880
[   44.807311] [<c02d343c>] (ubifs_wbuf_sync_nolock) from [<c02ce54c>] 
(ubifs_sync_fs+0x40/0x84)
[   44.817024]  r7:c67a18a4 r6:00000001 r5:c602a000 r4:c67a1880
[   44.828758] [<c02ce50c>] (ubifs_sync_fs) from [<c01ee4a8>] 
(sync_fs_one_sb+0x30/0x34)
[   44.837861]  r7:c0a179f0 r6:ffffe000 r5:c61fc000 r4:c67b1000
[   44.844927] [<c01ee478>] (sync_fs_one_sb) from [<c01c29d8>] 
(iterate_supers+0xf8/0x138)
[   44.854161] [<c01c28e0>] (iterate_supers) from [<c01ee5b4>] 
(ksys_sync+0x58/0xb8)
[   44.862839]  r10:00000051 r9:c0a3f108 r8:c07bcdac r7:00000003 
r6:c0a03008 r5:00000000
[   44.871763]  r4:c0a03008 r3:00000000
[   44.875404] [<c01ee55c>] (ksys_sync) from [<c014480c>] 
(pm_suspend+0xa0/0x2a4)
[   44.884096]  r5:c0a8f30c r4:00000003
[   44.887729] [<c014476c>] (pm_suspend) from [<c0143260>] 
(state_store+0xa4/0xd4)
[   44.896435]  r8:c07ba962 r7:c69ebf00 r6:00000004 r5:00000003 r4:00000003
[   44.904304] [<c01431bc>] (state_store) from [<c067d14c>] 
(kobj_attr_store+0x1c/0x28)
[   44.913242]  r9:00146be8 r8:c6b75f60 r7:c6bd1a90 r6:c6bd1a80 
r5:c69ebf00 r4:c01431bc
[   44.922127] [<c067d130>] (kobj_attr_store) from [<c022c12c>] 
(sysfs_kf_write+0x40/0x4c)
[   44.931227]  r5:c69ebf00 r4:c067d130
[   44.934848] [<c022c0ec>] (sysfs_kf_write) from [<c022b504>] 
(kernfs_fop_write+0x140/0x1b0)
[   44.944487]  r5:c69ebf00 r4:00000004
[   44.948109] [<c022b3c4>] (kernfs_fop_write) from [<c01bf47c>] 
(__vfs_write+0x40/0x154)
[   44.957419]  r10:00020000 r9:00000004 r8:c6b75f60 r7:c0a03008 
r6:00146be8 r5:c022b3c4
[   44.966352]  r4:c6945500
[   44.968935] [<c01bf43c>] (__vfs_write) from [<c01bf750>] 
(vfs_write+0xc4/0x150)
[   44.977656]  r9:00000004 r8:00000000 r7:c6b75f60 r6:00146be8 
r5:00000004 r4:c6945500
[   44.986529] [<c01bf68c>] (vfs_write) from [<c01bf954>] 
(ksys_write+0x54/0xa4)
[   44.994776]  r9:00000004 r8:00146be8 r7:c0a03008 r6:c6945503 
r5:001978b8 r4:c6945500
[   45.003650] [<c01bf900>] (ksys_write) from [<c01bf9b4>] 
(sys_write+0x10/0x14)
[   45.011893]  r9:c6b74000 r8:c01011e4 r7:00000004 r6:00000000 
r5:001978b8 r4:0000000e
[   45.019647] [<c01bf9a4>] (sys_write) from [<c0101000>] 
(ret_fast_syscall+0x0/0x50)
[   45.028608] Exception stack(0xc6b75fa8 to 0xc6b75ff0)
[   45.034782] 5fa0:                   0000000e 001978b8 0000000e 
00146be8 00000004 0000000e
[   45.044155] 5fc0: 0000000e 001978b8 00000000 00000004 001910d8 
b6594794 00000000 b64cfd14
[   45.053431] 5fe0: 00000000 befccb60 b62ed95c b62ee064
[   45.058924] ubi0: dumping 2048 bytes of data from PEB 102, offset 38912
