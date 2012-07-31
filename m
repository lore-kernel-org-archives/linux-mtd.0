Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwCyn-0002ob-Hh
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 13:59:43 +0000
From: Marek Vasut <marex@denx.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
Date: Tue, 31 Jul 2012 15:59:15 +0200
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <201207311520.17450.marex@denx.de> <5017DD72.4000607@parrot.com>
In-Reply-To: <5017DD72.4000607@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201207311559.15483.marex@denx.de>
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

> Hi Marek,
>=20
> Marek Vasut a =E9crit :
> > Dear Matthieu CASTET,
> >=20
> >> Hi,
> >>=20
> >> for ONFI flash (like this micron one) the information should be
> >> extracted form the ONFI table (programs_per_page IIRC)
> >>=20
> >> This should be better than relying on the SOC driver for setting this
> >> flags.
> >>=20
> >> Does the gpmi driver set this flag because it do not support partial
> >> write ?
> >=20
> > Yes
> >=20
> >> In this case why it doesn't set  chip->ecc.steps to 1 ?
> >=20
> > Can you elabore how exactly will that help please?
>=20
> If you look at the nand_base.c, you will see that mtd->subpage_sft =3D 0 =
if
> NAND_NO_SUBPAGE_WRITE flags is set or chip->ecc.steps =3D=3D 1 [1].

Ok, this is what I saw coming ... this is yet another hole in the design an=
d I=20
see only undefined behavior. So if default: branch started returning an err=
or,=20
this whole code will break again.


> [1]
>     /* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
>     if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
>         !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
>         switch (chip->ecc.steps) {
>         case 2:
>             mtd->subpage_sft =3D 1;
>             break;
>         case 4:
>         case 8:
>         case 16:
>             mtd->subpage_sft =3D 2;
>             break;
>         }
>     }
>     chip->subpagesize =3D mtd->writesize >> mtd->subpage_sft;

Best regards,
Marek Vasut
