Received: from web14903.mail.yahoo.com ([216.136.225.55])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17k4NO-0004fh-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 16:04:59 +0100
Message-ID: <20020828150035.16625.qmail@web14903.mail.yahoo.com>
Date: Wed, 28 Aug 2002 08:00:35 -0700 (PDT)
From: Sriram Neelakandan Iyer <sriramneelakandan@yahoo.com>
Reply-To: sriramneelakandan@yahoo.com
Subject: cramfs gives decompression error on my flash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have 3 partitions on my flash..
1 tiny bootloader
2 big cramfs which i use for binaries & libs
3 and a tiny jffs2 used for storing config.

The kernel mounts only second(cramfs) & third(jffs2)
partions.

i hit upon errors as shown in snip below...not very
consistent..should rather say very rare.

Scanning thru the kernel code i found that these are
from fs/cramfs/uncompress.c 

Has anybody seen such errors before?
any clues ?? suggestions welcome.
i am stranded.

TIA
sriram

--snip--

Error -5 while decompressing!
821c7b26(1618)->82fe2000(4096)
Error -5 while decompressing!
821ca0d2(2451)->82fdd000(4096)
Error -3 while decompressing!
821cba65(2119)->82fdc000(4096)
udp:Done
Error -3 while decompressing!ddress 3894657708x
e823c2ac(-1711732818)->82fdb000(4096)
Err96)
Unable to handle kernel paging request at virtual
address f601c08a, epc 
== 82072
f7c, ra == 8207100c
Oops in fault.c:do_page_fault, line 192:
$0 : 00000000 821c0000 f601c08a 00000001 821d9f60
821d9f60 00000000 
8c1b06fd
$8 : 00000044 00000001 82190d44 00000000 00000000
821bfc86 fffffff8 
ffffffff
$16: 821cecc0 fffffffb fffffffb 8c1b06fd f601c08a
821a4180 0000001d 
82fe7210
$24: 00000000 00000000                   823ee000
823ef8f8 823f7efc 
8207100c
Status: 10004304
Cause : 00000008
Process init (pid: 1, stackpage=823ee000)
Stack: 82072d2c 821a4180 0000001d 82fe7210 821cecc0
00001000 82fd9000 
8207100c
       823ee000 823ef948 8c1b06fd 822de5c8 822fbe00
73ea73ea 8c1b06fd 
822de5c8
       822fbe00 73ea73ea 00000000 82070e48 00000005
00000001 00000000 
82fef120
       822de5c8 82fef120 0000001b 00000004 823f7ef8
8202caa4 50020000 
00000003
       821cfed0 821d00d0 00000000 82fe7210 0000001c
00000001 821a4180 
82fef120
       0000001d ...
Call Trace: [<82072d2c>] [<8207100c>] [<82070e48>]
[<8202caa4>] 
[<8202e6f8>] [<8
203a898>] [<820290e4>] [<8201067c>] [<82029334>]
[<820292b4>] 
[<820113a8>] [<820
71f28>] [<82071c18>] [<8204573c>] [<8200f0c0>]
[<8202debc>] 
[<82065738>] [<82141
a14>] [<82065db8>] [<82065ca4>] [<82029c24>]
[<82029aec>] 
[<82066970><82065fd8>]
 [<820513c4>] [<820517f4>] [<8209da38>] [<8200dda0>]
[<8216729c>] 
[<8200e7c4>] [
<8216729c>] [<8216729c>] [<820179d4>] [<8218088c>]
[<82167346>] 
[<820080e4>] [<8
200824c>] [<82008150>] [<8216721c>] [<82007f78>] ...
Code: 8e04001c  24630001  ae030008 <90430000> 24420001
 ac830004  
ae020000  3063
000f  24020008




__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com
