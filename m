Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aSVd-0002XH-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 03:49:45 +0100
Message-ID: <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <tglx@linutronix.de>, "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw>
Subject: error when writing to jffs2
Date: Fri, 2 Aug 2002 10:50:05 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

dear all,

error when writing to jffs2
any idea?

thanks in advanced!:)

--------- following message log -----------------------------
# cp -a bin bin2
ARGH. About to write node to 0x0004c020 on flash, but there's data already
there
:
0x0004c020: 85 19 01 e0 2d 00 00 00 3a 31 4d 58 04 00 00 00
argh. node added in wrong place
ARGH. About to write node to 0x0004c064 on flash, but there's data already
there
:
0x0004c064: 80 21 00 00 00 00 00 00 00 00 00 00 7d 7c 76 3a
argh. node added in wrong place
nand_read_ecc: Failed ECC read, page 0x00001260
ARGH. About to write node to 0x0004c020 on flash, but there's data already
there
:
0x0004c020: 85 19 00 e0 04 00 00 00 18 31 45 18 00 00 00 00
argh. node added in wrong place
Calculated used size 00003fc8 != stored used size 00003f84
kernel BUG at nodemgmt.c:320!
Unable to handle kernel paging request at virtual address 00000000, epc ==
80086
154, ra == 80086154
Oops in fault.c:do_page_fault, line 204:
$0 : 00000000 1000fc00 0000001e 00000001 8019d7d0 00000001 00000001 0005540e
$8 : 809f8af8 801a172c 0000001e fffffee0 0000000d 809f8af8 0000000a 809f8af8
$16: 81e302f8 81e450e8 00000013 00000000 81e4c3b0 00000000 00000044 81e73ec0
$24: 00001028 81e73c92                   81e72000 81e73de0 81e450e8 80086154
Hi : 00000020
Lo : 00000013
epc  : 80086154    Not tainted
Status: 1000fc04
Cause : 3000000c
Process cp (pid: 83, stackpage=81e72000)
Stack: 8015d7f0 8015d9fc 00000140 000553ed 81e73e08 81e45128 81e2c100
00000044
       00000000 00000000 00000044 00000044 00000046 81e2c100 81c6b740
81e2c100
       81d31640 81d31770 81c6b750 00000000 00000044 8008323c 00406a18
00000000
       00000000 80051e58 0004c020 00000000 81c05084 0004c020 ffffffe0
81d31640
       3b28008d 81d31640 81e73ec0 00000046 81d2fac0 00000000 00406a18
00000000
       00000000 ...
Call Trace: [<8015d7f0>] [<8015d9fc>] [<8008323c>] [<80051e58>] [<80062c6c>]
[<8
0041df8>]
 [<800543ed>] [<80041ec0>] [<80010a8c>]

Code: 24a5d9fc  0c006415  24060140 <ac000000> 8e220084  00000000  12020014
0000
0000  8e220088
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
