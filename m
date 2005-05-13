Received: from xrelay05.mail2web.com ([168.144.1.61])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWS3d-0007eV-7o
	for linux-mtd@lists.infradead.org; Fri, 13 May 2005 00:45:54 -0400
Received: from [168.144.251.211] (helo=M2W098.mail2web.com)
	by xrelay05.mail2web.com with smtp (Exim 4.34) id 1DWRAr-000274-Fr
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 23:49:19 -0400
Message-ID: <7680-22005551335028622@M2W098.mail2web.com>
From: "brent@ajr-industrial.com" <brent@ajr-industrial.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 12 May 2005 23:50:28 -0400
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Compilng GRUB with DOC patch
Reply-To: brent@ajr-industrial.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all=2E  I have been attempting to patch grub sources with DOC pathce=
s
to get a grub_fireware file=2E  Althrough one patch patches cleanly (the
grub-0=2E92-doc=2Epatch on the GRUB 0=2E92 sources), NONE of them have pro=
duced a
grub-firmware file in the stage1 directory=2E

I do the following:

patch -p0 < name_of_patch=2Epatch

At this point most of them complain about "hunks" failing, with exception
of the grub-0=2E92-doc=2Epatch with grub sources, version 0=2E92=2E

aclocal && automake && autoconf

=2E/conifgure --enable-diskonchip-2000 --enable-ext2fs --disable-ffs
--disable-xfs --disable-jfs --disable-vstafs --disable-reiserfs
--disable-minix --disable-fat

make

I have tried the above with grub sources versions 0=2E92, 0=2E93, 0=2E94, =
and
0=2E97 and have tried the patch I mentioned above as well as
grub-2002-10-08=2Epatch and grub-2003-01-08-doc=2Epatch=2E

The example which I am following uses the grub-2002-02-19-doc=2Epatch, and=
 it
is reported to function properly=2E  Does anyone know where I could obtain=

this patch?  I am using an x86 board, I wonder if I could just get a
grub_fireware image?  If so, could someone send me one?  Or does anyone
know of a good combinatioin of sources/patch or a way to tweak one or the
other to get them to play nice together? =20

Thanks in advance=2E

-Brent Roberts


--------------------------------------------------------------------
mail2web - Check your email from the web at
http://mail2web=2Ecom/ =2E
