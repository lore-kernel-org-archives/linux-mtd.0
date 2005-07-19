Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DuwaP-0004aV-Of
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 14:13:01 -0400
Received: by wproxy.gmail.com with SMTP id 70so401384wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 11:12:53 -0700 (PDT)
Message-ID: <2db32b72050719111262109ae@mail.gmail.com>
Date: Tue, 19 Jul 2005 11:12:08 -0700
From: rolf liu <rolfliu@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: rolf liu <rolfliu@gmail.com>
Subject: kernel oops during "reboot" due to jffs2/mtd write
Reply-To: rolf liu <rolfliu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using mtdblock0 as the root with jffs2 f/s. It boots up. But when
I type "reboot",
the kernel gives me the oops information.

bash-2.05b# reboot

Broadcast message from root (ttyS0) (Fri Dec 31 19:01:54 1999):

The system is going down for reboot NOW!CPU 0 Unable to handle kernel
paging request at virtual address 00000000, epc =3D=3D 803b6a94, ra =3D=3D
80231014

Oops in arch/mips/mm/fault.c::do_page_fault, line 167[#1]:
Cpu 0
$ 0   : 00000000 1000fc00 8b781e78 00000000
$ 4   : 00000002 813a0714 804bfe80 ffff00fe
$ 8   : 8b781fe0 0000fc00 00000000 812e4000
$12   : 80706924 00000002 80706820 00000006
$16   : 8be4abf0 813a0710 813a062c 00000001
$20   : 80490000 00000001 00000000 00000000
$24   : 00000000 00000000                 =20
$28   : 8b780000 8b781e68 00000000 80231014
Hi    : 00000000
Lo    : 00000000
epc   : 803b6a94 __down_write+0xcc/0x164     Not tainted
ra    : 80231014 jffs2_flush_wbuf_pad+0x20/0x50
Status: 1000fc02    KERNEL EXL=20
Cause : 0080000c
BadVA : 00000000
PrId  : 03030200
Modules linked in:
Process shutdown (pid: 947, threadinfo=3D8b780000, task=3D8be4abf0)
Stack : 00000000 804bfe00 00000000 00000003 813a0714 00000001 8be4abf0 0000=
0002
        813a0600 813a0710 80231014 00000000 00000000 00000003 00000000 0000=
0002
        813a0600 80490000 8022f3a0 80400000 8018b2ac 00000000 8018b2ac 0000=
0000
        813a0400 80400000 80400000 8018b60c 801b51dc 801b51d4 d1c454da 0000=
0007
        00000001 00404554 00000000 00000003 7f8e4d94 801811f4 811c0520 0000=
0003
        ...
Call Trace:
 [<80231014>] jffs2_flush_wbuf_pad+0x20/0x50
 [<8022f3a0>] jffs2_sync_fs+0x60/0x180
 [<8018b2ac>] drop_super+0x18/0x2c
 [<8018b2ac>] drop_super+0x18/0x2c
 [<8018b60c>] sync_filesystems+0x148/0x288
 [<801b51dc>] sync_inodes+0x44/0xc0
 [<801b51d4>] sync_inodes+0x3c/0xc0
 [<801811f4>] do_sync+0x38/0x84
 [<80181250>] sys_sync+0x10/0x20
 [<8010d6e0>] stack_done+0x20/0x3c
 [<8010d6e0>] stack_done+0x20/0x3c


Code: 27a20010  afa50010  aca20004 <ac620000> afa30014  40016000=20
3421001f  3821001e  40816000
Segmentation fault

What could be wrong with the system?

thanks
