Received: from du-253-35.nat.adsl.claranet.fr ([212.43.253.35]
	helo=synergie-inf.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19dBua-0008TM-Pf
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jul 2003 17:47:20 +0100
Received: from archie.gsi.synergie-inf.com ([10.53.2.1])
	by gateway.synergie-inf.com (gateway.synergie-inf.com [127.0.0.1])
	(MDaemon.PRO.v6.8.4.R)
	with ESMTP id 50-md50000000091.tmp
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jul 2003 18:47:22 +0200
Message-ID: <515CABE7496FD111AA3300201829FCBE2FFECA@archie.gsi.synergie-inf.com>
From: Marc Neiger <m.neiger@synergie-inf.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 17 Jul 2003 18:47:20 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: jffs2 garbage collector crash
Reply-To: m.neiger@synergie-inf.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a Au1000 based board, with JFFS2 on NAND, and the root file system is
in NAND.

An application program is launched by initd and accesses the filesystem.
If I run a few ls from the shell right after booting I get the following
error which I do not understand.
Is it rather some driver problem or an error building the jffs2 filesystem ?
I use the mtd code from 2003.07.03
The system seems not to take some real offense from the crash but I'd like
to solve it !

# Checked all inodes but still 0x123824 bytes of unchecked space?
kernel BUG at gc.c:140!
Unable to handle kernel paging request at virtual address 00000000, epc ==
80193
6e8, ra == 801936e8
Oops in fault.c:do_page_fault, line 205:
$0 : 00000000 1000fc00 00000018 00000001 8028eca0 00000001 00000001 00000000
$8 : 00000001 ffffd573 00001573 00000000 fffffff9 ffffffff 0000000a 00000002
$16: 8117a3cc 810834d0 80196cbc 80253ccc 80253cb4 00000001 81083508 00000000
$24: 8117bd92 00000002                   8117a000 8117bec8 bf800000 801936e8
Hi : 00000000
Lo : 00000092
epc  : 801936e8    Not tainted
Status: 1000fc03
Cause : 0080000c
Process jffs2_gcd_mtd6 (pid: 7, stackpage=8117a000)
Stack: 80253cb4 80253ccc 0000008c 00000000 811ff000 8024b390 00000000
8117a000
       810835b8 810835b8 8117a3cc 810834d0 80196cbc 810834d0 00000000
00000001
       811ff000 8024b390 bf800000 80196f3c afb50038 80255190 00000006
00000000
       802e5f08 afb40034 00000700 810834d0 802e5e38 802f3430 00000000
01ffc040
       00000000 811f8300 00000000 810834fc 00000700 810834d0 802e5e38
00000000
       00000000 ...
Call Trace: [<80253cb4>] [<80253ccc>] [<8024b390>] [<80196cbc>] [<8024b390>]
[<8
0196f3c>]
 [<80255190>] [<80196cbc>] [<8024b390>] [<80196cbc>] [<80100de0>]
[<80196ba8>]
 [<80100dd0>]

Code: 02802021  0c043d4b  2406008c <ac000000> 08064d42  8e250008  124000a1
0000
0000  8e420014

Marc Neiger
 
Groupe Synergie Informatique
14 rue Saint Papoul
31000 Toulouse
Tel 05 34 41 38 42 Fax: 05 34 41 38 39
