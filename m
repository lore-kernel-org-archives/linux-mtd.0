Received: from c-24-91-108-216.hsd1.ma.comcast.net ([24.91.108.216]
	helo=ahgu.homeunix.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8Hjs-0002zl-BW
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 09:25:58 -0400
Message-ID: <10af01c5a978$c336df10$1f1a12ac@atitech.com>
From: "ahgu" <ahgu@ahgu.homeunix.com>
To: "ahgu" <ahgu@ahgu.homeunix.com>, <linux-mtd@lists.infradead.org>
Date: Thu, 25 Aug 2005 09:27:32 -0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"; reply-type=original
Content-Transfer-Encoding: 7bit
Cc: 
Subject: simulate a bad NAND block cause kernel hang
Reply-To: ahgu <ahgu@ahgu.homeunix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I forced the flash_erase function to fail. I expect the jffs2 will pick up 
the return error and mark the block bad and put the bad block in a bad_block 
list. But what I get is kernel failure:
I get similar error when I simulate a write error.
Am I doing the bad block simulation correctly? Is this a correct response? 
What is supposed to happen when the NAND flash grow a bad block?


-ahgu

erasing 615
Erase at 0x0001c000 failed immediately: errno 7
jffs2_erase_failedScheduling in interrupt
kernel BUG at sched.c:676!
Unable to handle kernel paging request at virtual address 00000000, epc == 
80112220, ra == 80112220
Oops in fault.c:do_page_fault, line 225:
$0 : 00000000 1000f800 0000001b 00000001 816ee000 00000000 00000001 00001893
$8 : 00001893 00000000 00000000 00000000 802a9459 fffffff9 0000000a 802edd0a
$16: 8028e260 802ec000 00000000 802ad928 818cbe2c 818cbe28 80106000 802ad924
$24: ffffffff 00000002                   802ec000 802ede38 802ede38 80112220
Hi : 000247ff
Lo : befc0000
epc  : 80112220    Not tainted
Status: 1000f803
Cause : 1080000c
Process kupdated (pid: 6, stackpage=802ec000)
Stack: 80245460 80245538 000002a4 00001875 802fe504 009a0000 818cbd10 
802ad928
       818cbe2c 818cbe28 802fe4b0 8029ae8c 00000000 801db1f8 00000010 
802edeb8
       802edea8 1000f801 00000000 802ec000 802fe508 802fe508 0000000a 
00000266
       8107c720 818cbd10 818cbd10 816af120 818cbe2c 818cbe28 00000001 
8029ae8c
       00000000 801d29b0 802fe400 8107c720 818cbd10 816af120 801852a0 
801851fc
       80253518 ...
Call Trace: [<80245460>] [<80245538>] [<801db1f8>] [<801d29b0>] [<801852a0>] 
[<801851fc>]
 [<80253518>] [<801854ac>] [<801853f8>] [<80186738>] [<80186730>] 
[<8014004c>]
 [<8013f11c>] [<8013f610>] [<8013f3d8>] [<8013f3d8>] [<801089e8>] 
[<80140eb4>]
 [<801089d8>]

Code: 24a55538  0c0458b5  240602a4 <ac000000> 0012a940  3c0a8029  254a2040 
01555021  40016000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
 * 
