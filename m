Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbB68-0008SL-SD
	for linux-mtd@lists.infradead.org; Sun, 22 Feb 2009 09:58:13 +0000
In-Reply-To: <OFDD270E72.0FBCB59B-ONC125753D.00527F99-C125753D.0053F8B1@LocalDomain>
References: <OFB0D82DEF.AEFFD688-ONC125753D.0045FF81-C125753D.004A3AF2@transmode.se>
	<496CA6FB.1030806@users.sourceforge.net>
	<OFDD270E72.0FBCB59B-ONC125753D.00527F99-C125753D.0053F8B1@LocalDomain>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: Re: BUG in JFFS2 kernel 2.6.27
Message-ID: <OF586E490B.15F6113E-ONC1257565.00368952-C1257565.0036C182@transmode.se>
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Sun, 22 Feb 2009 10:57:48 +0100
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund/Transmode wrote on 13/01/2009 16:16:42:
>=20
> Anders Grafstr=F6m <grfstrm@users.sourceforge.net> wrote on 13/01/2009=20
15:36:43:
>=20
> >=20
> > joakim.tjernlund@transmode.se wrote:
> > > Just got this BUG:
> > >=20
> > > Data CRC 22c90447 !=3D calculated CRC cbf47f8b for node at 07d2aadc
> > > ------------[ cut here ]------------
> > > kernel               BUG               at fs/jffs2/file.c:251!
> > > Oops:      Exception      in      kernel      mode,     sig:     5 =20
[#1]
> > > TMCUTU
> > > NIP:        c00eb5d0        LR:        c004ab34        CTR: c00eb57c
> > > REGS:      ce217bf0      TRAP:     0700       Not     tainted=20
(2.6.27)
> > > MSR:     00029032    <EE,ME,IR,DR>     CR:    24022422     XER:=20
00000000
> > > TASK       =3D       ce1d6800[424]      'ne=5Fswumd'      THREAD:=20
ce216000
> > > GPR00:  00000001  ce217ca0  ce1d6800  ce296520  cf51b708  00000000=20
002a6000
> > > 00001000
> > > GPR08:  00001000  00000000  c016bac4  cf86f600  00400000  10069018=20
10060000
> > > 00000000
> > > GPR16:  002a6000  00000000  00000000  c021010c  00000000  ce296520=20
cf86f400
> > > cf51b648
> > > GPR24:  00000000  00001000  00000000  002a6000  00000000  cf51b670=20
ce216000
> > > c0441820
> > > NIP                  [c00eb5d0] jffs2=5Fwrite=5Fend+0x54/0x228
> > > LR            [c004ab34] generic=5Ffile=5Fbuffered=5Fwrite+0x178/0x634
> > > Call Trace:
> > > [ce217ca0]       [c016aa94]       release=5Fsock+0x94/0xa8=20
(unreliable)
> > > [ce217ce0]        [c004ab34] generic=5Ffile=5Fbuffered=5Fwrite+0x178/=
0x634
> > > [ce217d70]      [c004b394]=20
=5F=5Fgeneric=5Ffile=5Faio=5Fwrite=5Fnolock+0x3a4/0x568
> > > [ce217df0]           [c004b6b0] generic=5Ffile=5Faio=5Fwrite+0x68/0x1=
20
> > > [ce217e20]                [c006a1a4] do=5Fsync=5Fwrite+0xc8/0x13c
> > > [ce217ef0]                  [c006a2b4] vfs=5Fwrite+0x9c/0x174
> > > [ce217f10]                  [c006a468] sys=5Fwrite+0x4c/0x90
> > > [ce217f40]               [c000f3ec] ret=5Ffrom=5Fsyscall+0x0/0x38
> > > --- Exception: c01 at 0xf9c1744
> > >     LR =3D 0x1003ce20
> > > Instruction dump:
> > > 83a40000 7f384214 54dc053a 817d008c 82cb019c 92e10008 3afdffd8=20
80090000
> > > 70090008  41820004  7c000026 54001ffe <0f000000> 6b291000 7d2bfe70=20
7d604a78
> > > ---[ end trace 79c27f7a1b03cf81 ]---
> > >=20
> > > Anyone seen something similar?
> >=20
> > I think it's this one again:
> > http://lists.infradead.org/pipermail/linux-mtd/2008-April/021473.html
> >=20
> > The patch in the above post avoids this BUG=5FON by aborting early=20
> > when the dnode
> > read fails and propagates an error code back to userspace and thus=20
> > avoids this path to be taken.
>=20
> This seems like the right thing to do. Why test the return value from=20
jffs2=5Fdo=5Freadpage=5Fnolock()
> if it always returns 0? If this is enough though is unclear to me.
>=20
> David?
>=20
> >=20
> > I didn't pursue it since I was unsure whether it would remove some
> > self-healing properties of the design in non-debug builds.
> >

Just a reminder

 Jocke=20
