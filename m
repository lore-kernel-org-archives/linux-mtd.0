Received: from law14-oe55.law14.hotmail.com ([64.4.20.63] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Moht-0003Pd-M8
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 13:46:33 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Jun 2003 18:17:44 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE55Hc4cAIypD0002e17e@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: uclinux-dev@uclinux.org
Subject: Error after putting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people ..
Once upon a time in a happy happy land  I had a kernel which worked nicely.

Then I set upon myself the task to put jffs2 support
After much difficulty ( and dangers) i did finally build a kernel.

But it doenot boot now
The error I get is

ZEUS:dragonix_map.map_priv_1=10c00000
*** RESET PC ***   FORMAT=0
Current process id is 1
BAD KERNEL TRAP: 00000000
PC: [<10c6c784>]
SR: 2000  SP: 000f5d14  a2: 00048558
d0: 0000003e    d1: 00000098    d2: 000000af    d3: 00000002
d4: 00000001    d5: 00000002    a0: 10c00000    a1: 000000aa
Process swapper (pid: 1, stackpage=000f5000)
Frame format=0
Stack from 000f5d48:
        85580000 00980000 00aa000f 5f4c0001 0f00007f ffec0000 001b0000
00020000
        0000000f 5f4c0004 85580004 84c40001 ffbe000f 5f860001 00000000
00037714
        10c1b2d0 00000001 00002004 00000000 ffff10c7 0bec0004 85580000
00000000
        0000000f 5f4c0004 855810c1 7e400004 84c410c7 0a140004 85580004
84c4000f
        5f4c000f 5f4c0000 00000000 003a0004 e2580001 0f000004 858810c1
7e400004
        85582704 00054fac 0003771c 00037714 00037a94 10c1b0ea 00000001
00000000
Call Trace:
        [<10c1b2d0>] [<10c1b0ea>] [<10c1b2d0>] [<10c1b0ea>]
        [<10c1b2d0>] [<10c1b0ea>] [<10c1b2d0>] [<10c1b662>]
        [<10c19e76>] [<10c19d9a>] [<10c19b6c>] [<10c13dae>]
Code: 4e90 0280 0000 00ff 508f 6030 7a02 ba81 6614 2f00
Kernel panic: Attempted to kill init!

ZEUS:dragonix_map.map_priv_1=10c00000 is the first line in phymap.c I init
function made

What is wrong here
Vikram
