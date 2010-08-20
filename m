Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmLyp-00049D-Ky
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 07:25:37 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH 3/4 v2] lib: add crc16_le helper
Date: Fri, 20 Aug 2010 09:24:17 +0200
References: <201008181401.15328.florian@openwrt.org>
	<4C6CE079.7040002@parrot.com>
	<OF0B6D7B9E.AB4F71B7-ONC1257784.0033173C-C1257784.003536A4@transmode.se>
In-Reply-To: <OF0B6D7B9E.AB4F71B7-ONC1257784.0033173C-C1257784.003536A4@transmode.se>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008200924.17691.ffainelli@freebox.fr>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joakim,

On Thursday 19 August 2010 11:41:13 Joakim Tjernlund wrote:
> Matthieu CASTET <matthieu.castet@parrot.com> wrote on 2010/08/19 09:42:49:
> > Hi,
> >=20
> > Joakim Tjernlund a =E9crit :
> > > Matthieu CASTET <matthieu.castet@parrot.com> wrote on 2010/08/18=20
18:10:11:
> > >>> if so, 0x8005 looks
> > >>> wrong too. see CRCPOLY_LE resp. CRCPOLY_BE for an idea.
> > >>=20
> > >> Why ?
> > >=20
> > > Because changing endian of crc also require the POLY
> > >=20
> > > to be bit reversed as well. See:
> > >  #define CRCPOLY_LE 0xedb88320
> > >  #define CRCPOLY_BE 0x04c11db7
> > >=20
> > > So I assume you need to do that as well for crc16_be, otherwise it
> > > won't be a BE version of the standard crc16 LE
> >=20
> > Well it match the crc provided in onfi nand [1]. But it may be not a
> > real BE version.
> >=20
> > >>> What is this crc sum used for?
> > >>=20
> > >> Onfi flash parsing in mtd.
> > >=20
> > > And this is a one time operation of fairly small amount of
> > > data? I ask because you impl. is really slow.
> >=20
> > Yes it checks only 253 bytes at startup time (one time only). So it is
> > not speed critical.
>=20
> OK.
>=20
> > > Why can't you use the crc16 LE version?
> >=20
> > Because it doesn't compute the crc provided by onfi spec. Or is there
> > some magic maths to convert LE version to our version ?
>=20
> I suspect the onfi spec got it wrong and isn't computing a real
> crc16_be. I suggest you rename this to onfi_crc16_be and move it
> inside the onfi subsystem. I supposed you are stuck with
> the onfi version?

I thought we could somehow genericize this version of the crc16, but you ar=
e=20
right, we cannot, so let's put it back to the mtd subsystem where it is use=
d.

Thanks for your comments.

> Just for the record, I think the crc16_be should be like this:
>=20
> u16 crc16_le(u16 crc, u8 const *p, size_t len)
> {
>    int i;
>    while (len--) {
>       crc ^=3D *p++ << 8;
>       i =3D 8;
>       do {
>          crc =3D (crc << 1) ^ ((crc & 0x8000) ? 0xa001 : 0);
>       } while(--i);
>    }
>    return crc;
> }
>=20
> Don't know of an easy way to go between LE and BE versions but
> have a look at lib/crc32.c, there is a unit test in there
> that suggests that on can byte reverse the data to go between
> LE and BE.

Ok, I will give it a try.
=2D-
=46lorian
