Received: from inet-tsb5.toshiba.co.jp ([202.33.96.24] helo=imx2.toshiba.co.jp)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8m2P-0005ay-3p
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2013 06:23:19 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <matthieu.castet@parrot.com>
Subject: Re: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Fri, 22 Feb 2013 06:23:09 +0000
Message-ID: <F3B6523425E7914AA6214ED358D820AF2674F613@TGXML341.toshiba.local>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <5125EDD7.40202@parrot.com>
In-Reply-To: <5125EDD7.40202@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <4A5D2B3D67B19547B6174CB44AC5DFD6@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: vikram186@gmail.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > +       case NAND_ECC_BENAND:
> > +               if (!IS_ENABLED(CONFIG_MTD_NAND_BENAND)) {
> > +                       pr_warn("CONFIG_MTD_BENAND not enabled\n");
> > +                       BUG();
> > +               }
> > +
> > +               chip->ecc.read_page =3D nand_read_page_benand;
> > +               chip->ecc.write_page =3D nand_write_page_raw;
> > +               chip->ecc.read_page_raw =3D nand_read_page_raw;
> > +               chip->ecc.write_page_raw =3D nand_write_page_raw;
> > +               chip->ecc.read_oob =3D nand_read_oob_std;
> > +               chip->ecc.write_oob =3D nand_write_oob_std;
> > +
> Do you have a way to disable internal ecc ?

Does "internal ecc" mean the BENAND's ECC function? If so, we cannot disabl=
e it.
This means that we cannot read the raw data, which is not corrected,=20
unless there are too many bitflips for BENAND to correct.

> If not read_page_raw and write_page_raw won't do what is expected :
> - read without ecc correction
> - write without writing ecc or write custom ecc
>=20
> I don't know if it could cause some problem.

I think that "writing ecc/ecc correction" would be just waste
and any other problems do not happen as long as these functions
do not destroy the OOB for BENAND ECC.=20
--=20
UWATOKO Katsuki=
