Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ollbm-0007e7-FY
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 16:35:23 +0000
In-Reply-To: <4C6C05E3.3090204@parrot.com>
References: <201008181401.15328.florian@openwrt.org>
	<OF455F8776.C288C2AE-ONC1257783.0055D496-C1257783.00566B4E@transmode.se>
	<4C6C05E3.3090204@parrot.com>
Subject: Re: [PATCH 3/4 v2] lib: add crc16_le helper
To: Matthieu CASTET <matthieu.castet@parrot.com>
Message-ID: <OF8F15EED9.913A4211-ONC1257783.005A5474-C1257783.005B148E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 18 Aug 2010 18:34:50 +0200
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

Matthieu CASTET <matthieu.castet@parrot.com> wrote on 2010/08/18 18:10:=
11:
>
> Hi,
>
> thanks for the review.
>
> Joakim Tjernlund a =E9crit :
> >> This patch adds a crc16_le helper function to lib/crc16.c
> >>
> >> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> >> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> >> --
> >> diff --git a/include/linux/crc16.h b/include/linux/crc16.h
> >> index 9443c08..6c1c61f 100644
> >> --- a/include/linux/crc16.h
> >> +++ b/include/linux/crc16.h
> >> @@ -26,5 +26,7 @@ static inline u16 crc16_byte(u16 crc, const u8 d=
ata)
> >>     return (crc >> 8) ^ crc16_table[(crc ^ data) & 0xff];
> >>  }
> >>
> >> +extern u16 crc16_le(u16 crc, const u8 *buffer, size_t len);
> >> +
> >>  #endif /* __CRC16_H */
> >>
> >> diff --git a/lib/crc16.c b/lib/crc16.c
> >> index 8737b08..ec4a95c 100644
> >> --- a/lib/crc16.c
> >> +++ b/lib/crc16.c
> >> @@ -62,6 +62,18 @@ u16 crc16(u16 crc, u8 const *buffer, size_t len=
)
> >>  }
> >>  EXPORT_SYMBOL(crc16);
> >>
> >> +u16 crc16_le(u16 crc, u8 const *p, size_t len)
> >> +{
> >> +   int i;
> >> +   while (len--) {
> >> +      crc ^=3D *p++ << 8;
> >> +      for (i =3D 0; i < 8; i++)
> >> +         crc =3D (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
> >> +   }
> >> +   return crc;
> >> +}
> >> +EXPORT_SYMBOL(crc16_le);
> >> +
> >>  MODULE_DESCRIPTION("CRC16 calculations");
> >>  MODULE_LICENSE("GPL");
> >
> > Don't recall much of my earlier crc32 work but the above looks wron=
g.
> > crc & 0x8000 suggests this is a big endian crc.
> yes it is a be crc while crc16 is a le one. So we should rename it to=

> crc16_be.
>
>
> >if so, 0x8005 looks
> > wrong too. see CRCPOLY_LE resp. CRCPOLY_BE for an idea.
> Why ?

Because changing endian of crc also require the POLY
to be bit reversed as well. See:
 #define CRCPOLY_LE 0xedb88320
 #define CRCPOLY_BE 0x04c11db7
So I assume you need to do that as well for crc16_be, otherwise it
won't be a BE version of the standard crc16 LE

>
> > What is this crc sum used for?
> Onfi flash parsing in mtd.

And this is a one time operation of fairly small amount of
data? I ask because you impl. is really slow.
Why can't you use the crc16 LE version?=
