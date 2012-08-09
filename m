Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzcOT-0006rH-N7
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 23:43:58 +0000
Received: by obbta17 with SMTP id ta17so1362743obb.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2012 16:43:54 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 9 Aug 2012 20:43:54 -0300
Message-ID: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
Subject: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
From: Fabio Estevam <festevam@gmail.com>
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Huang Shijie <b32955@freescale.com>, Subodh Nijsure <snijsure@grid-net.com>,
 computersforpeace@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When enabling CONFIG_MTD_NAND_VERIFY_WRITE=y on a mx28evk board
running 3.6-rc1  I get the following crash:

root@freescale /$ dd if=/dev/zero of=/dev/mtd0 bs=128k count=1
[   41.070000] Unable to handle kernel NULL pointer dereference at virtual addr0
[   41.080000] pgd = c77ac000
[   41.080000] [00000000] *pgd=4773c831, *pte=00000000, *ppte=00000000
[   41.090000] Internal error: Oops: 17 [#1] ARM
[   41.090000] Modules linked in:
[   41.090000] CPU: 0    Not tainted  (3.6.0-rc1-next-20120809-00002-ga25d017-d)
[   41.090000] PC is at nand_verify_buf+0x18/0x5c
[   41.090000] LR is at nand_write_page+0xc0/0x140
[   41.090000] pc : [<c023e7d4>]    lr : [<c023fcfc>]    psr: 20000013
[   41.090000] sp : c7779de4  ip : 00000000  fp : c6e60000
[   41.090000] r10: 00000000  r9 : 00020000  r8 : 00000000
[   41.090000] r7 : 00000000  r6 : c6e60000  r5 : c762cb10  r4 : 00000000
[   41.090000] r3 : c762c8a8  r2 : 00000800  r1 : c6e60000  r0 : 00000000
[   41.090000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   41.090000] Control: 0005317f  Table: 477ac000  DAC: 00000015
[   41.090000] Process dd (pid: 427, stack limit = 0xc7778270)
[   41.090000] Stack: (0xc7779de4 to 0xc777a000)
[   41.090000] 9de0:          c762c8a8 c762c8a8 c0246ba8 00000800 c762cb10 c7620
[   41.090000] 9e00: 00000001 c0240c98 00000000 00000001 00000000 00000007 c7620
[   41.090000] 9e20: 00000000 c6e60000 00000000 ffffffff 00000000 00020000 00000
[   41.090000] 9e40: 0000007f 00000000 c77cc400 c004a934 00000000 c762cb10 c7620
[   41.090000] 9e60: 00000000 80000000 00000000 80000000 00000000 c0241010 c7775
[   41.090000] 9e80: 00000000 00020000 00000000 00020000 00000000 00000000 c6e60
[   41.090000] 9ea0: 00020000 00000400 00000000 c0238368 00020000 c7779f28 c6e60
[   41.090000] 9ec0: 00020000 c7779f80 c77c7ae0 b6dde008 c7778000 c7779f28 c6e68
[   41.090000] 9ee0: 00020000 c7779f28 c6e60000 00000005 c04f46dc 00000000 c7770
[   41.090000] 9f00: b6dde008 c6e60000 00000000 c00085a0 c7778000 c7688cc8 00000
[   41.090000] 9f20: 00000000 00000000 00000000 00020000 00000000 c77b7f00 00028
[   41.090000] 9f40: c7779f80 c7778000 00000000 00000000 00000000 c00cc054 00000
[   41.090000] 9f60: c000f298 c77b7f00 b6dde008 00020000 00000004 00000000 0000c
[   41.090000] 9f80: 00000000 00000000 b6f4d4d0 00000000 00020000 b6dde008 b6f48
[   41.090000] 9fa0: c7778000 c000f1a0 00020000 b6dde008 00000001 b6dde008 0002c
[   41.090000] 9fc0: 00020000 b6dde008 b6f4d4d0 00000004 00098a30 b6dde008 00000
[   41.090000] 9fe0: 00000001 bebc5b68 0000f338 b6eb60bc 60000010 00000001 00000
[   41.090000] [<c023e7d4>] (nand_verify_buf+0x18/0x5c) from [<c762c8a8>] (0xc7)
[   41.090000] Code: e59030dc da00000d e5934000 e5d10000 (e5d43000)
[   41.320000] ---[ end trace 92fce7df493d29ed ]---

The same write command works if CONFIG_MTD_NAND_VERIFY_WRITE is unselected.

Any ideas?

Thanks,

Fabio Estevam
