Received: from na3sys009aog108.obsmtp.com ([74.125.149.199])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NiKwr-0002hx-St
	for linux-mtd@lists.infradead.org; Fri, 19 Feb 2010 04:58:46 +0000
Received: by mail-pz0-f187.google.com with SMTP id 17so945027pzk.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Feb 2010 20:58:33 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 19 Feb 2010 15:58:33 +1100
Message-ID: <ed62801002182058r5cc3a715hcb62c7b9d9eb57a8@mail.gmail.com>
Subject: Oops in jffs2_garbage_collect_thread
From: Aras Vaichas <arasv@magellan-technology.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a Linux device, it's an AT91RM9200 system running a rootfs as
JFFS2 on NAND, Linux 2.6.26.3.

It has a directory which I can no longer list or remove. I know that
the person using this device was writing to this directory and
frequently power cycling the device so it's likely to have data
corruption in this area of the filing system.

Looking at dmesg, I see that the JFFS2 Garbage Collection process
causes an Oops some time after the rootfs is mounted; see end of
email.

Is this a problem which has since been fixed in a later version of the
kernel, or should I investigate further?

<1>Unable to handle kernel NULL pointer dereference at virtual address 0000001e
<1>pgd = c0004000
<1>[0000001e] *pgd=00000000
<4>Internal error: Oops: 17 [#1] PREEMPT
<4>Modules linked in: readerdrv g_ether vfat fat nls_base
<4>CPU: 0    Not tainted  (2.6.26.3-magarm #110)
<4>PC is at jffs2_get_inode_nodes+0x8ec/0xdf0
<4>LR is at jffs2_get_inode_nodes+0x900/0xdf0
<4>pc : [<c00fb138>]    lr : [<c00fb14c>]    psr: 60000013
<4>sp : c1d05dc8  ip : c1d05dc8  fp : c1d05e24
<4>r10: c1e1d800  r9 : 00000497  r8 : c1d1a040
<4>r7 : c1f03080  r6 : 00000e80  r5 : 000000e4  r4 : 00000000
<4>r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
<4>Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
<4>Control: c000317f  Table: 21f10000  DAC: 00000017
<4>Process jffs2_gcd_mtd5 (pid: 199, stack limit = 0xc1d04260)
<4>Stack: (0xc1d05dc8 to 0xc1d06000)
<4>5dc0:                   c1d05df0 c1e1d800 c0271fe8 c1d05e28 c1d1a038 c1d05e40
<4>5de0: c1efbc00 c1d02000 00000128 2e0a8e23 00000128 00000001 c02870a0 c1efbc00
<4>5e00: c1efbc00 c1d05e88 00000001 c1d02000 00000000 c1d0202c c1d05e84 c1d05e28
<4>5e20: c00fb774 c00fa85c 0000000a c0286e60 00000000 c0286eb4 0000000a c1d05e68
<4>5e40: c1f03420 c1f03160 000000a3 00000000 00000000 00000000 00000000 c1efbc00
<4>5e60: c1d19690 c1d02000 00000001 00000000 00000000 c1d0202c c1d05ee4 c1d05e88
<4>5e80: c00fbf6c c00fb74c 00000001 00000002 c1d05f54 c1d05ea0 c002371c c0023010
<4>5ea0: 00000000 000168bc 00000666 00000833 c1d04000 00000000 c1d02000 00000001
<4>5ec0: 00000000 00000000 c1d0202c c1d04000 c1d19690 c1d02000 c1d05f54 c1d05ee8
<4>5ee0: c00fffd8 c00fbf24 c0034980 c00344e0 c1d04000 c0282110 c1d05f30 c1d05f08
<4>5f00: c01ee6c0 c0034924 c1d04000 c1d04000 c1d02000 00000001 00000000 00000000
<4>5f20: c1d05f40 c1d05f30 c0044c24 40000013 c1d04000 c1d02000 00000001 00000000
<4>5f40: 00000000 00000000 c1d05ff4 c1d05f58 c0101d30 c00ffd9c 00000001 00000000
<4>5f60: 00000080 00000000 00000000 6f62203b 0a6d746f 00000000 c1d05f98 c1d05f88
<4>5f80: c01ee8e4 c01ee560 c1d04000 c1d05fac c1d05f9c c0035f70 c01ee8b8 00000000
<4>5fa0: 00000000 c1d05fb0 c0023b84 c0035f48 00000000 c1d02000 c0101bcc c003c894
<4>5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
<4>5fe0: 00000000 00000000 00000000 c1d05ff8 c003c894 c0101bdc 58e9822e 5d00f664
<4>Backtrace:
<4>[<c00fa84c>] (jffs2_get_inode_nodes+0x0/0xdf0) from [<c00fb774>]
(jffs2_do_read_inode_internal+0x38/0x7d8)
<4>[<c00fb73c>] (jffs2_do_read_inode_internal+0x0/0x7d8) from
[<c00fbf6c>] (jffs2_do_crccheck_inode+0x58/0x9c)
<4>[<c00fbf14>] (jffs2_do_crccheck_inode+0x0/0x9c) from [<c00fffd8>]
(jffs2_garbage_collect_pass+0x24c/0x8fc)
<4> r6:c1d02000 r5:c1d19690 r4:c1d04000
<4>[<c00ffd8c>] (jffs2_garbage_collect_pass+0x0/0x8fc) from
[<c0101d30>] (jffs2_garbage_collect_thread+0x164/0x1bc)
<4>[<c0101bcc>] (jffs2_garbage_collect_thread+0x0/0x1bc) from
[<c003c894>] (do_exit+0x0/0x65c)
<4> r7:00000000 r6:00000000 r5:00000000 r4:00000000
<4>Code: e3530000 eafffff6 e2524000 0a000063 (e1d431be)
<4>---[ end trace 6dd51bd0f7916cfe ]---


Aras
