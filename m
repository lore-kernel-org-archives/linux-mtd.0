Received: from web13206.mail.yahoo.com ([216.136.174.191])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Qsom-0006kP-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 16:21:40 +0000
Message-ID: <20020116163239.99399.qmail@web13206.mail.yahoo.com>
Date: Wed, 16 Jan 2002 08:32:39 -0800 (PST)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: JFFS2 is crashing the kernel
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

Hi All,
I am using JFFS2 for AMD flash running on a MIPS processor 
and till now I had no problems. but suddenly while reading a file 
from Flash, the kernel crashed. I am using Linux 2.4.2
I got the following trace -

5>inflate returned -4
Unable to handle kernel paging request at virtual address 07c04800, epc == 8098c
2dc, ra == 8098c2a0
Oops in fault.c:do_page_fault, line 189:
$0 : 00000000 80ab0000 000006eb 00000000 000006eb 000006ea 07c04800 d7735738
$8 : 00000000 80a36aa0 000006eb 000223f4 000006eb 80b3a160 9393f884 07c04800
$16: 80d44000 80b53100 00000000 07c04800 80d44000 00001000 80b79c60 80d53b10
$24: 00000000 00000000                   80d52000 80d53af0 80b0ecb0 8098c2a0
epc  : 8098c2dc
Status: 10004304
Cause : 10000008
Process lash (pid: 145, stackpage=80d52000)
Stack: 00000001 80a71050 8091fbec 00000800 000006eb 80d53b10 07c04800 80aaaf18
       000006eb 8091d80c 00001000 80b5a3c4 80b4eef8 00011000 80d44000 00012000
       80af8630 fffffff7 80b0ecb0 8098a310 00000001 80a71068 00000008 00000000
       00001000 2a2b2c2d 80b4ede0 80af8630 80b4eef8 80af8630 00000000 00000000
       80b0bd30 00001000 80b4ede0 8098a4ec 80a78490 00000005 00000001 00001000
       80b4ede0 ...
Call Trace: [<8091fbec>] [<8091d80c>] [<8098a310>] [<8098a4ec>] [<8098a654>] [<8
092dbdc>] [<8092dc98>] [<80a51664>] [<80a51664>] [<80a51650>] [<80a51648>] [<809
2dfec>] [<8092df0c>] [<80952d54>] [<80968bb4>] [<809d8854>] [<809f5e98>] [<8090b
ba4>] [<809688d8>] [<80953754>] [<80953b84>] [<8092ce78>] [<80943524>] [<809103c
0>] [<80910de4>] [<8090b368>]
Code: 8e27003c  04a0000d  02603021 <90c20000> 24c60001  24a5ffff  00621026  3042
00ff  00021080

By the trace it seems that the kernel crashed when JFFS2 is calling the 
zlib_decompress() for reading the file.

Did anybody got this problem? Also can some one help me in understanding the 
problem.
Thanks,
Sanjay

__________________________________________________
Do You Yahoo!?
Send FREE video emails in Yahoo! Mail!
http://promo.yahoo.com/videomail/
