Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 158kk1-0001b0-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Jun 2001 16:33:34 +0100
Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 158J8B-000071-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jun 2001 11:04:40 +0100
Date: Fri, 8 Jun 2001 12:04:38 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: partitioning bug
Message-ID: <20010608120438.A9491@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
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

--NMuMz9nt05w80d4+
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Damn, this is embarrassing. I just can't nail this one.

I've written a chip driver which works great until I use partitioning
support. If I do that, and I do a MEMGETINFO ioctl() on the first partition
(/dev/mtd0) I get the following fault as soon as I try and access the
returned mtd_info_user structure:

------------< snip <------< snip <------< snip <------------
root@tinystor:~# ./debug info
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type =3D MTMTD_close
D_NORFLASInternal error: branch through zero: 0
CPU: 0
pc : [<00000004>]    lr : [<020011c8>]
sp : bffffdfc  ip : c9673f44  fp : c9673f40
r10: 400fed50  r9 : 00000006  r8 : c95700e0
r7 : 00000000  r6 : c06a90e0  r5 : c011bd40  r4 : c807c960
r3 : ca008378  r2 : 00000001  r1 : c00d4838  r0 : ca008378
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C966D17F  Table: C966D17F  DAC: 00000015
Process debug (pid: 109, stackpage=3Dc9673000)
Code: bad PC value.
Stack:
c9673f20:          020011c8 00000004 a0000013  ca008378 c9673f54 c9673f44
ca0022e8
c9673f40: ca005398 c9762600 c9673f78 c9673f58  c0040894 ca0022c0 c9762600
00000000
c9673f60: c07e71e0 00000000 c0012804 c9673f94  c9673f7c c003f748 c0040820
c07e71e0
c9673f80: c9762600 20000010 c9673fac c9673f98  c003f7e0 c003f6d4 00000002
bffffe5c
c9673fa0: 00000000 c9673fb0 c0012680 c003f760  00000002 c0012ec0 00000003
020015fd
c9673fc0: 00000000 00000000 00000002 bffffe5c  00000003 00000000 00000001
400fe248
c9673fe0: 400fed50 bffffe1c 400aba80 bffffdfc  020011c8 400aba84 20000010
00000003
Backtrace:
Function entered at [<ca00538c>] from [<ca0022e8>]
Function entered at [<ca0022b4>] from [<c0040894>]
 r4 =3D C9762600
Function entered at [<c0040814>] from [<c003f748>]
 r8 =3D C0012804  r7 =3D 00000000  r6 =3D C07E71E0  r5 =3D 00000000
 r4 =3D C9762600
Function entered at [<c003f6c8>] from [<c003f7e0>]
 r6 =3D 20000010  r5 =3D C9762600  r4 =3D C07E71E0
Function entered at [<c003f754>] from [<c0012680>]
 r5 =3D BFFFFE5C  r4 =3D 00000002
H
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 131072 (128K)
mtd.erasesize =3D 16384 (16K)
mtd.oobblock =3D 0
mtd.oobsize =3D 0
mtd.ecctype =3D MTD_ECC_NONE
Segmentation fault
root@tinystor:~#
------------< snip <------< snip <------< snip <------------

I'm attaching the source for the program that caused this.

My debugging info during initialization shows the partitions is initialized
fine:

------------< snip <------< snip <------< snip <------------
Creating 3 MTD partitions on "lart":
0x00000000-0x00020000 : "blob"
slave->mtd.size =3D 0x00020000 (128K)
slave->mtd.erasesize =3D 0x00004000 (16K)
slave->mtd.numeraseregions =3D 0
mtd: Giving out device 0 to blob
0x00020000-0x00100000 : "kernel"
slave->mtd.size =3D 0x000e0000 (896K)
slave->mtd.erasesize =3D 0x00020000 (128K)
slave->mtd.numeraseregions =3D 0
mtd: Giving out device 1 to kernel
0x00100000-0x00400000 : "initial ramdisk"
slave->mtd.size =3D 0x00300000 (3072K)
slave->mtd.erasesize =3D 0x00020000 (128K)
slave->mtd.numeraseregions =3D 0
mtd: Giving out device 2 to initial ramdisk
------------< snip <------< snip <------< snip <------------

So what I don't get is why it crashes. I mean, all that happens during that
ioctl() is the mtd_info structure gets sent to the user process - no magic
there that can cause the process to crash.

any ideas?

--=20

Regards
 Abraham

Fraud is the homage that force pays to reason.
		-- Charles Curtis, "A Commonplace Book"

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--XsQoSWH+UP9D9v3l
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="mtd_debug.tar.gz"
Content-Transfer-Encoding: base64

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
pI6P/92Hc7i7zLzsBelycpyzD7RUmX0MhpM9G71f4zjHBsx9hTkSjnXJvwvk3/s53Fln76dW
6tOSOh6Wv8WaI+909ng+K/VsSZuAqL/lSN96pdtxG8OxLiF6/8t5ryXCb5Ut4dgGyPmJq+z3
0vFH9gvkGbYhcoDCcr9EudziVk84tjmIboshyZ8T7jWJn22abZ6cmkWefDjv/aYnnPQXzYvz
hqMc9ITjPiC5Ix/MnRzfEU849jGI7if+cMeU2w64D1IkvCZ/uE4JxzrRe3/obF7+rRPuJ55w
nO81LsreH3PC/cwTrgnhmqYId9YTjn2+BeFafOEo5ySvDKf3HheZfcc5nnCM/9fK3efkGqh9
scpyTpH3Kpc77oQL1U9On5/rzXBeHu9U3OyZOHf/H7O11D6MRg8Q2RRuuvNfksm4Of+lNpGo
SfD8h6pEojLY/38ULrZC175MQhLRmqheAb2+s6OtsHAppk76r0KAOzWWOx4V8KrUtfd8oROH
mZdUVlXGaxPRlZW11fFkdhzVdSt31GXHUUsvNwo9c5IYqmoSK6sT0dc37sE0qyIRS8aqKjr2
fC1Rsbe9sqJ1W0cqltrTfr8vMPmc6Rv+58czPXTnP//lWw/hHdOe/5JMTPB/EjVV/P2X2trg
/KdH4oLzX4LzX4LzX4LzX4LzX4LzX4LzX4LzX4LzX7y9MDj/JTj/JTj/JTj/JTj/JcdvtAcH
vgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvgQHvvy/Hvjic5P5Px8/
A2Ba/k+Nw/+JV1dX69//SFbWBPv/j8LF3N99eUAOkBvPA/GA3GgeIhfIn+eADxS4wAUucIEL
XOACF7jHw/0XO/7tAwCgAAA=

--XsQoSWH+UP9D9v3l--

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7IKM2zNXhP0RCUqMRAiD4AJ0Y5T6rrsCYXoDaX0v8cWn06SPliQCeJqSn
bY7iw58vh6SJ6zyWh5p50jU=
=pKsV
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
