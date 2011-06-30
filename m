From: Huang Shijie-B32955 <B32955@freescale.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: reply: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
Date: Thu, 30 Jun 2011 15:21:21 +0000
Message-ID: <14C4E31473AF7E4B98176CB73615181C19FB3C@039-SN1MPN1-006.039d.mgd.msft.net>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	"LW@KARO-electronics.de" <LW@KARO-electronics.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=
Hi Wolfram:=0A=
=0A=
> +static int mil_ecc_write_oob(struct mtd_info *mtd,=0A=
> +                             struct nand_chip *nand, int page)=0A=
> +{=0A=
> +     struct gpmi_nfc_data *this =3D nand->priv;=0A=
> +     struct device *dev =3D this->dev;=0A=
> +     struct mil *mil =3D &this->mil;=0A=
> +     uint8_t *block_mark;=0A=
> +     int block_mark_column;=0A=
> +     int status;=0A=
> +     int error =3D 0;=0A=
> +=0A=
> +     /* Only marking a block bad is permitted to write the OOB. */=0A=
> +     if (!mil->marking_a_bad_block) {=0A=
> +             dev_emerg(dev, "This driver doesn't support writing the OOB=
\n");=0A=
> +             WARN_ON(1);=0A=
> +             error =3D -EIO;=0A=
> +             goto exit;=0A=
> +     }=0A=
=0A=
Huh? Why is that? This will break JFFS2, for example.=0A=
=0A=
-----------------------------------------------------------------=0A=
The GPMI-NFC driver will use the OOB(BCH will use the OOB for a special lay=
out), so we forbid any others to use the OOB.=0A=
But marking a block bad is permitted.=0A=
=0A=
If the JFFS2 use the OOB, we have to disable it=0A=
We use UBIFS by default.=0A=
=0A=
Thanks.=0A=
=0A=
Best Regards=0A=
Huang Shijie=0A=
=0A=
=0A=
=0A=
=0A=
-----------------------------------------------------------------=0A=
=0A=
--=0A=
Pengutronix e.K.                           | Wolfram Sang                |=
=0A=
Industrial Linux Solutions                 | http://www.pengutronix.de/  |=
=0A=
