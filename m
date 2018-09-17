Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1ruK-0003W2-6z
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 11:41:36 +0000
Date: Mon, 17 Sep 2018 13:41:12 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Yogesh Gaur <yogeshgaur.83@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, Marek Vasut <marex@denx.de>
Subject: Re: Query Regarding NOR flash page size calculation s25fl512s
Message-ID: <20180917134112.293e13d7@bbrezillon>
In-Reply-To: <VI1PR04MB10387E1BDEFE07D998EA53BB991E0@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <CAG6enPzUygjG5taj04g=zrmV-HooPp_kSADFgJkxFs3C2u07Rg@mail.gmail.com>
 <VI1PR04MB10387E1BDEFE07D998EA53BB991E0@VI1PR04MB1038.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yogesh,

On Mon, 17 Sep 2018 10:05:27 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi All,
>=20
> Please suggest how can we work for this flash, s25fl512s?
> Passing flag SPI_NOR_SKIP_SFDP would going to break functionality of 1-2-=
2/1-4-4 protocol mode, as only through SFDP parameter read we get informati=
on for the dummy cycles, mode bits etc for this flash.
>=20
> But, page_size value is getting populated wrongly for case when value of =
CR3V[4] is 0 for this flash.
>=20
> --
> Regards
> Yogesh Gaur
>=20
> > -----Original Message-----
> > From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behal=
f Of
> > Yogesh Gaur
> > Sent: Friday, August 31, 2018 10:28 AM
> > To: linux-mtd@lists.infradead.org
> > Subject: Query Regarding NOR flash page size calculation s25fl512s
> >=20
> > Hi All,
> >=20
> > I have query and concern regarding page_size calculation for the underl=
ying
> > NOR flashes.
> >=20
> > I have spansion, =E2=80=98s25fl512s=E2=80=99 flash connected on my targ=
et.
> >=20
> > With SFDP param reading, page_size for this flash is assigned as 0x200 =
using
> > below routine.
> >    /* Page size: this field specifies 'N' so the page size =3D 2^N byte=
s. */
> >    params->page_size =3D bfpt.dwords[BFPT_DWORD(11)];
> >    params->page_size &=3D BFPT_DWORD11_PAGE_SIZE_MASK;
> >    params->page_size >>=3D BFPT_DWORD11_PAGE_SIZE_SHIFT;
> >    params->page_size =3D 1U << params->page_size;
> >=20
> > As per the BG of S25FS512S_512_M flash and SFDP header info table above
> > calculation are correct.
> >=20
> > But final value of the page_size for this flash is depends on the confi=
guration
> > register CR3V[4], page buffer wrap, it can be either of
> > 256 byte (0) or 512 byte (1).
> >=20
> > For my case, this value is 0 and page_size becomes 0x100 bytes but with=
 SFDP
> > header read, value for this is being assigned as 0x200.
> > Due to this, I am getting data corruption.
> >=20
> > Please suggest, how can we check and proceed in these case. I guess thi=
s is
> > specific to spansion family of flashes.

I guess we need some kind of ->fixup() hook that the core would call
after SFDP has been parsed, so that vendors can adjust SPI NOR params.

Marek, Cyrille, any opinion on that?

Thanks,

Boris
