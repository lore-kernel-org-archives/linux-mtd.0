Received: from mail1.bemta7.messagelabs.com ([216.82.254.108])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtVPA-0002tf-8e
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 04:40:13 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 19 Dec 2013 15:39:42 +1100
Subject: UBI VID header corruption, offset data
Message-ID: <EACD232272DA4849B060F0828564D13B0A777136FD@ntcex01.corp.netcomm.com.au>
Content-Language: en-AU
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,


I'm encountering a rather surprising VID header corruption. Kernel
version is derived from 3.5.0-preempt, with a bunch of probably
unrelated vendor patches.

After the system has operated normally for a while (=3Ddays), the initial
UBI block scan at boot time reports this:

[    2.390000] UBI error: check_corruption: PEB 402 contains corrupted VID=
 header, and the data does not contain all 0xFF, this may be a non-UBI PEB=
 or a severe VID header corruption which requires manual inspection
[    3.860000] UBI error: check_corruption: PEB 1176 contains corrupted VI=
D header, and the data does not contain all 0xFF, this may be a non-UBI PE=
B or a severe VID header corruption which requires manual inspection
[    4.040000] UBI error: check_corruption: PEB 1177 contains corrupted VI=
D header, and the data does not contain all 0xFF, this may be a non-UBI PE=
B or a severe VID header corruption which requires manual inspection
[    5.430000] UBI error: late_analysis: 3 PEBs are corrupted and preserve=
d

All three header pages (2K) are corrupted the same way (see below).

The page starts with 29 0-bytes, followed by 11 0xff-bytes. An
otherwise normal looking header starts at an offset of 40 bytes
from its normal position. Finally, there is an unexpected 0xFF
byte at the end of the page.

Has anyone encountered such a thing before?


Best regards,

Iwo

=3D=3D=3D=3D

Here is a good VID page example for reference:

PEB257
00000000  55 42 49 21 01 01 01 00  00 00 00 00 00 00 02 45  |UBI!.........=
..E|
00000010  00 00 00 00 00 01 80 00  00 00 00 00 00 00 00 00  |.............=
...|
00000020  00 83 72 fa 00 00 00 00  00 00 00 00 00 00 03 cb  |..r=FA.......=
....=CB|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 d4 08 5a bd  |............=D4=
.Z=BD|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
*
00000800

These are the bad header pages:

PEB402
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 ff ff ff  |.............=
=FF=FF=FF|
00000020  ff ff ff ff ff ff ff ff  55 42 49 21 01 01 01 00  |=FF=FF=FF=FF=FF=
=FF=FF=FFUBI!....|
00000030  00 00 00 01 00 00 02 20  00 00 00 00 00 01 70 00  |....... .....=
.p.|
00000040  00 00 00 00 00 00 00 00  de 85 51 17 00 00 00 00  |........=DE.Q=
.....|
00000050  00 00 00 00 00 00 13 4a  00 00 00 00 00 00 00 00  |.......J.....=
...|
00000060  00 00 00 00 36 d4 f2 89  00 00 00 00 00 00 00 00  |....6=D4=F2..=
.......|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
*
000007f0  00 00 00 00 00 00 00 ff  00 00 00 00 00 00 00 00  |.......=FF...=
.....|
00000800

PEB1176
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 ff ff ff  |.............=
=FF=FF=FF|
00000020  ff ff ff ff ff ff ff ff  55 42 49 21 01 01 01 00  |=FF=FF=FF=FF=FF=
=FF=FF=FFUBI!....|
00000030  00 00 00 01 00 00 01 bc  00 00 00 00 00 00 d0 00  |.......=BC...=
...=D0.|
00000040  00 00 00 00 00 00 00 00  ff ec 1f a6 00 00 00 00  |........=FF=EC=
.=A6....|
00000050  00 00 00 00 00 00 13 4b  00 00 00 00 00 00 00 00  |.......K.....=
...|
00000060  00 00 00 00 20 4b 90 e7  00 00 00 00 00 00 00 00  |.... K.=E7...=
.....|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
*
000007f0  00 00 00 00 00 00 00 ff  00 00 00 00 00 00 00 00  |.......=FF...=
.....|
00000800

PEB1177
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 ff ff ff  |.............=
=FF=FF=FF|
00000020  ff ff ff ff ff ff ff ff  55 42 49 21 01 01 00 00  |=FF=FF=FF=FF=FF=
=FF=FF=FFUBI!....|
00000030  00 00 00 01 00 00 00 07  00 00 00 00 00 00 00 00  |.............=
...|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
00000050  00 00 00 00 00 00 13 4c  00 00 00 00 00 00 00 00  |.......L.....=
...|
00000060  00 00 00 00 1d 0d 60 c5  00 00 00 00 00 00 00 00  |......`=C5...=
.....|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
*
000007f0  00 00 00 00 00 00 00 ff  00 00 00 00 00 00 00 00  |.......=FF...=
.....|
00000800

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
