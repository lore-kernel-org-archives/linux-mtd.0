Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwDBj-000602-0a
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 14:12:44 +0000
From: Marek Vasut <marex@denx.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
Date: Tue, 31 Jul 2012 16:12:27 +0200
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <201207311559.15483.marex@denx.de> <5017E737.403@parrot.com>
In-Reply-To: <5017E737.403@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201207311612.28066.marex@denx.de>
Cc: Scott Wood <scottwood@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Matthieu CASTET,

> Marek Vasut a =E9crit :
> > Dear Matthieu CASTET,
> >=20
> >> Hi Marek,
> >>=20
> >> Marek Vasut a =E9crit :
> >>> Dear Matthieu CASTET,
> >>>=20
> >>>> Hi,
> >>>>=20
> >>>> for ONFI flash (like this micron one) the information should be
> >>>> extracted form the ONFI table (programs_per_page IIRC)
> >>>>=20
> >>>> This should be better than relying on the SOC driver for setting this
> >>>> flags.
> >>>>=20
> >>>> Does the gpmi driver set this flag because it do not support partial
> >>>> write ?
> >>>=20
> >>> Yes
> >>>=20
> >>>> In this case why it doesn't set  chip->ecc.steps to 1 ?
> >>>=20
> >>> Can you elabore how exactly will that help please?
> >>=20
> >> If you look at the nand_base.c, you will see that mtd->subpage_sft =3D=
 0
> >> if NAND_NO_SUBPAGE_WRITE flags is set or chip->ecc.steps =3D=3D 1 [1].
> >=20
> > Ok, this is what I saw coming ... this is yet another hole in the design
> > and I see only undefined behavior. So if default: branch started
> > returning an error, this whole code will break again.
>=20
> Do you see any reason why chip->ecc.steps =3D=3D 1 will return an error ?
> This will break drivers.

It'd be enough if mtd->subpage_sft was inited to some other value. So eithe=
r add=20
"case 1: mtd->subpage_sft =3D 0; break;" or go with this patch. Either way =
is fine=20
by me.

> The behavior match the comment : "Allow subpage writes up to ecc.steps"
>=20
> Matthieu
>=20
> >> [1]
> >>=20
> >>     /* Allow subpage writes up to ecc.steps. Not possible for MLC flash
> >>     */ if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
> >>    =20
> >>         !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
> >>         switch (chip->ecc.steps) {
> >>        =20
> >>         case 2:
> >>             mtd->subpage_sft =3D 1;
> >>             break;
> >>        =20
> >>         case 4:
> >>         case 8:
> >>        =20
> >>         case 16:
> >>             mtd->subpage_sft =3D 2;
> >>             break;
> >>        =20
> >>         }
> >>    =20
> >>     }
> >>     chip->subpagesize =3D mtd->writesize >> mtd->subpage_sft;

Best regards,
Marek Vasut
