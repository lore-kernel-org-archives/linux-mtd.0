Received: from cnxtsmtp9.conexant.com ([198.62.9.206] helo=nbmime1.bbnet.ad)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcKzv-0006XY-UP
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2005 10:58:41 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Nov 2005 16:05:28 +0530
Message-ID: <4D6E93075B31154298572E6B73CA849D02DBCC11@noida-mail.bbnet.ad>
From: "Achin Gupta" <achin.gupta@conexant.com>
To: "MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Crash while accessing Intel 28F128 flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20
I am consistently getting a crash in the "mtd_close" routine whenever I
try performing any read/write operation on an Intel NOR flash chip on my
harwdare. I have been trying to run utilities like "flash_info",
"mtd_debug", "flash_erase" & all of them crash with the following stack
backtrace :-

>>>>>>>>>
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd =3D c09e8000
[00000000] *pgd=3D00029031, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 17 [#3]
Modules linked in:
CPU: 0
PC is at __wake_up_common+0x28/0x7c
LR is at 0x0
pc : [<c003c3f4>]    lr : [<00000000>]    Not tainted
sp : c03dbef4  ip : c03dbf20  fp : c03dbf1c
r10: 00000003  r9 : 00000000  r8 : 00000000
r7 : c01be288  r6 : c0953794  r5 : 00000000  r4 : 00000001
r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c0953794
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 5397F  Table: 009E8000  DAC: 00000015
Process mtd_debug (pid: 182, stack limit =3D 0xc03da194)
Stack: (0xc03dbef4 to 0xc03dc000)
bee0:                                              60000013 00000000
c0953740
bf00: c01be288 c002b984 c03da000 00000000 c03dbf34 c03dbf20 c003c474
c003c3d8
bf20: 00000000 c0953740 c03dbf54 c03dbf38 c0111574 c003c454 c0955c00
c1b930ac
bf40: c09c52a0 c1b192ac c03dbf68 c03dbf58 c0109b30 c01114d8 c09e4d00
c03dbf88
bf60: c03dbf6c c0077d7c c0109b08 c09e4d00 00000000 c09d11e0 00000006
c03dbfa4
bf80: c03dbf8c c007661c c0077d30 00000000 00000003 beffff67 00000000
c03dbfa8
bfa0: c002b800 c00765a4 00000000 c0031d30 00000003 40074117 00000002
00000001
bfc0: 00000000 00000003 beffff67 befffea4 00000001 00000003 00000000
00009258
bfe0: 4005cdd4 befffdf8 000093ac 4005cddc 20000010 00000003 00000000
00000000
Backtrace:
[<c003c3cc>] (__wake_up_common+0x0/0x7c) from [<c003c474>]
(__wake_up+0x2c/0x34)
[<c003c448>] (__wake_up+0x0/0x34) from [<c0111574>]
(cfi_intelext_sync+0xa8/0xb8)
 r4 =3D C0953740
[<c01114cc>] (cfi_intelext_sync+0x0/0xb8) from [<c0109b30>]
(mtd_close+0x34/0x48)
 r7 =3D C1B192AC  r6 =3D C09C52A0  r5 =3D C1B930AC  r4 =3D C0955C00
[<c0109afc>] (mtd_close+0x0/0x48) from [<c0077d7c>] (__fput+0x58/0xf8)
 r4 =3D C09E4D00
[<c0077d24>] (__fput+0x0/0xf8) from [<c007661c>] (filp_close+0x84/0x90)
 r7 =3D 00000006  r6 =3D C09D11E0  r5 =3D 00000000  r4 =3D C09E4D00
[<c0076598>] (filp_close+0x0/0x90) from [<c002b800>]
(ret_fast_syscall+0x0/0x2c)
 r6 =3D BEFFFF67  r5 =3D 00000003  r4 =3D 00000000
>>>>>>>>>>

Can someone please help me with this?

Regards,
Achin

____________________________________
Achin Gupta
Software Engineer
Conexant India
Tel.: +91 120 2512833-36=20
Fax.: +91 120 2516047
Email: achin.gupta@conexant.com
Web: www.conexant.com
____________________________________




********************** Legal Disclaimer ****************************
"This email may contain confidential and privileged material for the sole u=
se of the intended recipient.  Any unauthorized review, use or distribution=
 by others is strictly prohibited.  If you have received the message in err=
or, please advise the sender by reply email and delete the message. Thank y=
ou."
**********************************************************************
