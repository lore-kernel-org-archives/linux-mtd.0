Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RsA8g-0000SD-H3
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 09:36:35 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] MTD: atmel_nand: Update driver to support Programmable HW
 ECC controller
Date: Tue, 31 Jan 2012 17:35:54 +0800
Message-ID: <4C79549CB6F772498162A641D92D5328042F2032@penmb01.corp.atmel.com>
In-Reply-To: <20120131090520.GA4993@parrot.com>
References: <1327979470-11522-1-git-send-email-hong.xu@atmel.com>
 <20120131090520.GA4993@parrot.com>
From: "Xu, Hong" <Hong.Xu@atmel.com>
To: "Ivan Djelic" <ivan.djelic@parrot.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

> -----Original Message-----
> From: Ivan Djelic [mailto:ivan.djelic@parrot.com]
> Sent: Tuesday, January 31, 2012 5:05 PM
> To: Xu, Hong
> Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org;
dwmw2@infradead.org
> Subject: Re: [PATCH] MTD: atmel_nand: Update driver to support
Programmable
> HW ECC controller
>=20
[...]
> > +       while (err_nbr) {
> > +               byte_pos =3D (pmerrloc_readl_el(host->pmerrloc_base,
i) - 1)
> / 8;
> > +               bit_pos =3D (pmerrloc_readl_el(host->pmerrloc_base, =
i)
- 1)
> % 8;
>=20
> Hello,
> do you really need to read this register twice?
>=20

Not needed actually. It'll be fixed in next version.

> > +               dev_info(host->dev, "PMECC correction, byte_pos: %d
"
> > +                       "bit_pos: %d\n", byte_pos, bit_pos);
> > +
> > +               if (byte_pos < (sector_size + extra_bytes)) {
> > +                       tmp =3D sector_size + pmecc_readl(host->ecc,
SADDR);
> > +                       if (byte_pos < tmp) {
>=20
> > +                               if (*(buf + byte_pos) & (1 <<
bit_pos))
> > +                                       *(buf + byte_pos) &=3D
> > +                                               (0xFF ^ (1 <<
bit_pos));
> > +                               else
> > +                                       *(buf + byte_pos) |=3D (1 <<
> bit_pos);
>=20
> why not replace the 5 lines above with:  *(buf + byte_pos) ^=3D 1 <<
bit_pos;

Thanks. It'll be modified in next version.

>=20
> > +                       } else {
> > +                               if (*(buf + byte_pos + ecc_size) &
> > +                                    (1 << bit_pos))
> > +                                       *(buf + byte_pos + ecc_size)
&=3D
> > +                                               (0xFF ^ (1 <<
bit_pos));
> > +                               else
> > +                                       *(buf + byte_pos + ecc_size)
|=3D
> > +                                               (1 << bit_pos);
>=20
> same idea:   *(buf + byte_pos + ecc_size) ^=3D 1 << bit_pos;
>=20

Ditto.

BR,
Eric

[...]
> BR,
> --
> Ivan
