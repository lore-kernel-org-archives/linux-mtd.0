Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Om1d8-00087L-N7
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 09:41:51 +0000
In-Reply-To: <4C6CE079.7040002@parrot.com>
References: <201008181401.15328.florian@openwrt.org>
	<OF455F8776.C288C2AE-ONC1257783.0055D496-C1257783.00566B4E@transmode.se>
	<4C6C05E3.3090204@parrot.com>
	<OF8F15EED9.913A4211-ONC1257783.005A5474-C1257783.005B148E@transmode.se>
	<4C6CE079.7040002@parrot.com>
Subject: Re: [PATCH 3/4 v2] lib: add crc16_le helper
To: Matthieu CASTET <matthieu.castet@parrot.com>
Message-ID: <OF0B6D7B9E.AB4F71B7-ONC1257784.0033173C-C1257784.003536A4@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 19 Aug 2010 11:41:13 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <florian@openwrt.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET <matthieu.castet@parrot.com> wrote on 2010/08/19 09:42:=
49:
>
> Hi,
>
> Joakim Tjernlund a =E9crit :
> > Matthieu CASTET <matthieu.castet@parrot.com> wrote on 2010/08/18 18=
:10:11:
> >>> if so, 0x8005 looks
> >>> wrong too. see CRCPOLY_LE resp. CRCPOLY_BE for an idea.
> >> Why ?
> >
> > Because changing endian of crc also require the POLY
> > to be bit reversed as well. See:
> >  #define CRCPOLY_LE 0xedb88320
> >  #define CRCPOLY_BE 0x04c11db7
> > So I assume you need to do that as well for crc16_be, otherwise it
> > won't be a BE version of the standard crc16 LE
> Well it match the crc provided in onfi nand [1]. But it may be not a
> real BE version.
>
>
> >
> >>> What is this crc sum used for?
> >> Onfi flash parsing in mtd.
> >
> > And this is a one time operation of fairly small amount of
> > data? I ask because you impl. is really slow.
> Yes it checks only 253 bytes at startup time (one time only). So it i=
s
> not speed critical.

OK.

>
> > Why can't you use the crc16 LE version?
> >
> Because it doesn't compute the crc provided by onfi spec. Or is there=

> some magic maths to convert LE version to our version ?

I suspect the onfi spec got it wrong and isn't computing a real
crc16_be. I suggest you rename this to onfi_crc16_be and move it
inside the onfi subsystem. I supposed you are stuck with
the onfi version?
Just for the record, I think the crc16_be should be like this:

u16 crc16_le(u16 crc, u8 const *p, size_t len)
{
   int i;
   while (len--) {
      crc ^=3D *p++ << 8;
      i =3D 8;
      do {
         crc =3D (crc << 1) ^ ((crc & 0x8000) ? 0xa001 : 0);
      } while(--i);
   }
   return crc;
}

Don't know of an easy way to go between LE and BE versions but
have a look at lib/crc32.c, there is a unit test in there
that suggests that on can byte reverse the data to go between
LE and BE.

[Deleted ugly code]=
