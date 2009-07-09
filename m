Received: from mail.de.keymile.com ([195.8.104.1])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MOvPB-0000kH-D1
	for linux-mtd@lists.infradead.org; Thu, 09 Jul 2009 15:19:31 +0000
Received: from srvdehan1003.de.keymile.net (srvdehan1003.de.keymile.net
	[10.9.1.108]) by mailrelay.de.keymile.net (8.12.2/8.12.2)
	with ESMTP id n69FG7jp029498 for <linux-mtd@lists.infradead.org>;
	Thu, 9 Jul 2009 17:16:07 +0200 (MEST)
Subject: gluebi problems on 2.6.28 backport
From: Holger Brunck <holger.brunck@keymile.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 09 Jul 2009 17:19:22 +0200
Message-Id: <1247152762.10521.71.camel@pc005093.de.keymile.net>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all, 
we are working on a powerpc (ppc 8xx) based system and we use ubi/ubifs
on a NOR flash device. Our kernel version is 2.6.28.

I have tried to integrate the newest UBI patches from the backport for
2.6.28 from:  
http://git.infradead.org/users/dedekind/ubifs-v2.6.28.git

Now ubi crashes if I try to write into a mtdblock device. Via "git
bisect" I have seen that the rework of the gluebi patch causes the
problem: 
	UBI: make gluebi a separate module
or
        UBI: remove built-in gluebi

Unfortunately the second patch did not compile standalone for that, both
patches can cause the problem. 

I have formated a ubi device, attached and then created three ubi
volumes. ubinfo seems to be ok afterwards. 

If I try to copy something in a volume: 
cp /usr/local/bin/testfile /dev/mtdblock5
the kernel crashes. 

The error message is: 
-bash-3.2# cp /usr/local/bin/testfile /dev/mtdblock5
Unable to handle kernel paging request for data at address 0x00000000
Faulting instruction address: 0xc0197cec
Oops: Kernel access of bad area, sig: 11 [#1]
PREEMPT MGSUVD
Modules linked in:
NIP: c0197cec LR: c019e154 CTR: c019e084
REGS: c38f3e60 TRAP: 0300   Not tainted  (2.6.28-b001-dev-3.1.3)
MSR: 00009032 <EE,ME,IR,DR>  CR: 33555899  XER: c0000000
DAR: 00000000, DSISR: c0000000
TASK = c3846800[126] 'mtdblockd' THREAD: c38f2000
GPR00: c019e154 c38f3f10 c3846800 00000000 00000001 c3a83800 0000a880
00000200 
GPR08: 00000000 00015700 00000000 0001ff80 0000a880 04110900 03e7ab00
00000000 
GPR16: 03e6fa28 03e747f0 00000000 00000000 00000000 c00409b8 c02c5ff0
c38f3f78 
GPR24: 00000200 c3a83800 c3954d90 00000001 c3a83800 c3954d90 00000200
00000200 
NIP [c0197cec] ubi_leb_read+0x18/0x138
LR [c019e154] gluebi_read+0xd0/0x120
Call Trace:
[c38f3f10] [00001032] 0x1032 (unreliable)
[c38f3f30] [c019e154] gluebi_read+0xd0/0x120
[c38f3f70] [c01869cc] mtdblock_readsect+0xdc/0x120
[c38f3fb0] [c0185d2c] mtd_blktrans_thread+0x198/0x2a4
[c38f3fe0] [c0040a04] kthread+0x4c/0x88
[c38f3ff0] [c000d530] kernel_thread+0x4c/0x68
Instruction dump:
3860ffe2 80010014 83e1000c 7c0803a6 38210010 4e800020 7c0802a6 9421ffe0 
7ccc3378 bf810010 90010024 7cbc2b78 <83e30000> 7cea3b78 83bf0170
7d094378 
---[ end trace 5690d91bc0c9bd48 ]---

Do I miss something or is there anybody who has a idea whats going
wrong? 

Regards 
Holger Brunck
