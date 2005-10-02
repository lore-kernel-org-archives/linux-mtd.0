Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EM9eG-000267-FY
	for linux-mtd@lists.infradead.org; Sun, 02 Oct 2005 15:37:41 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org,
	=?utf-8?q?=EC=B5=9C=EC=98=81=EC=9D=BC?= <yichoi@moimstone.com>
Date: Mon, 3 Oct 2005 07:43:04 +1300
References: <000901c5c356$101c96c0$b400a8c0@LocalHost>
	<1127822225.5380.4.camel@sauron.oktetlabs.ru>
In-Reply-To: <1127822225.5380.4.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200510030743.04998.manningc2@actrix.gen.nz>
Cc: 
Subject: Re: large-nand flash mount ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 September 2005 23:57, Artem B. Bityutskiy wrote:
> On Tue, 2005-09-27 at 20:24 +0900, =EC=B5=9C=EC=98=81=EC=9D=BC wrote:
> > Hi
> > I am developing system with cpu au1550 and 2G nand flash?
> > I want root filesystem by 2G nand flash.
> > for test, I can mount nand flash and read, write to flash.
> > so, I make jffs2 filesystem and write to flash.
> > then, I make to boot with boot argument(root=3D/dev/mtdblock0), but fail
> > the message follows
> > ----------------------------
> > mtdblock_open
> > ok
> > mtdblock: read on "Db1550 NAND FS 0" at 0x400, size 0x200
> > nand_read_ecc: from =3D 0x00000400, len =3D 512
> > mtdblock: read on "Db1550 NAND FS 0" at 0x600, size 0x200
> > nand_read_ecc: from =3D 0x00000600, len =3D 512
> > mtdblock_release
> > nand_sync: called
> > ok
>
> Even if you have healed your problems with MTD, JFFS2 is anyway unusable
> on large flashes. Hmm, MTD archive seems broken, so I just insert here
> my recent reply to similar questions.

You might want to try looking at YAFFS.

YAFFS has been used successfully with quite large NAND arrays (at least as=
=20
large as 1.5G bytes). 2GB should be very achievable.

=2D- Charles
