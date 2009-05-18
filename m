Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M64Ul-0002mz-33
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 15:11:21 +0000
Received: from bzq-79-182-80-231.red.bezeqint.net ([79.182.80.231]:50435
	helo=felix.lan) by vega.surpasshosting.com with esmtpa (Exim 4.69)
	(envelope-from <felix@embedded-sol.com>) id 1M63Mi-0006os-6E
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 09:58:52 -0400
Message-ID: <4A116996.70403@embedded-sol.com>
Date: Mon, 18 May 2009 16:58:46 +0300
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 BUG()
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've hit a BUG() in JFFS2 as described below. The JFSS2 partition
is 250MB on 1GB Samsung NAND flash.  My kernel is 2.6.27,
running on AMCC 405EXr CPU (powerpc). The problem is not
easily reproducible. It is possible that partition was rather full when
BUG() was hit. Very similar problem  was reported to the list a year
ago, but was not resolved, see

http://lists.infradead.org/pipermail/linux-mtd/2008-April/021454.html

Can the fix proposed by previous reporter solve the problem ?

I'm getting the following error message:

Data CRC 97eaebe7 != calculated CRC b76accbf for node at 07633a58
------------[ cut here ]------------
kernel BUG at fs/jffs2/file.c:251!
Oops: Exception in kernel mode, sig: 5 [#1]
Modules linked in: usbcore
NIP: c01086fc LR: c004ed24 CTR: c01086b0
REGS: df029c10 TRAP: 0700   Not tainted  (2.6.27)
MSR: 00029030 <EE,ME,IR,DR>  CR: 24442022  XER: 00000000
TASK = daafe490[5808] 'cp' THREAD: df028000
GPR00: 00000001 df029cc0 daafe490 dfb8cd00 c45ee4c8 00000000 00326000 
00001000
GPR08: 00001000 cd822a00 00000004 00000004 27bba2e8 100586a0 00000000 
00326000
GPR16: df029d0c df029d08 00000000 00000000 00001000 df029d10 dfb8cd00 
cd822000
GPR24: 00000000 00326000 00001000 00000000 00000000 c45ee430 c0412160 
00001000
NIP [c01086fc] jffs2_write_end+0x4c/0x2f4
LR [c004ed24] generic_file_buffered_write+0x190/0x650
Call Trace:
[df029cc0] [c01088d0] jffs2_write_end+0x220/0x2f4 (unreliable)
[df029d00] [c004ed24] generic_file_buffered_write+0x190/0x650
[df029d90] [c004f6e4] __generic_file_aio_write_nolock+0x23c/0x4a4
[df029e00] [c004f9b4] generic_file_aio_write+0x68/0xf8
[df029e30] [c00726cc] do_sync_write+0xc4/0x138
[df029ef0] [c0073134] vfs_write+0xb4/0x16c
[df029f10] [c0073664] sys_write+0x4c/0x90
[df029f40] [c000e11c] ret_from_syscall+0x0/0x3c
Instruction dump:
70090008 813d008c 54dc053e 38000000 82e9019c 7cd93378 7cb82b78 90010008
7f5c4214 41820004 7c000026 54001ffe <0f000000> 2f9a1000 3b600000 419e0008
---[ end trace 0b6b9614848c5573 ]---


Thanks a lot.

Felix.
