Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzehB-0001IN-Kx
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2012 02:11:26 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
Date: Fri, 10 Aug 2012 04:11:21 +0200
References: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
 <CAOMZO5DeXp65H2vgtp5qGhV+tXVMuR8sXESc1CzJcJZ2WcmW-A@mail.gmail.com>
 <50246D36.1050405@freescale.com>
In-Reply-To: <50246D36.1050405@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201208100411.22085.marex@denx.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Subodh Nijsure <snijsure@grid-net.com>,
 linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 computersforpeace@gmail.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B408=E6=9C=8810=E6=97=A5 09:49, Fabio Estevam =E5=86=
=99=E9=81=93:
> > On Thu, Aug 9, 2012 at 10:41 PM, Marek Vasut<marex@denx.de>  wrote:
> >> NAK! This is only a workaround, proper implementation is needed. If it=
's
> >> not implemented now, I'm pretty sure such workaround will be there
> >> forever.
> >=20
> > I know, please see below.
> >=20
> >>>   /*
> >>>  =20
> >>>    * Handles block mark swapping.
> >>>    * It can be called in swapping the block mark, or swapping it back,
> >>>=20
> >>> @@ -1568,6 +1577,7 @@ static int __devinit gpmi_nfc_init(struct
> >>> gpmi_nand_data *this)
> >>>=20
> >>>          chip->ecc.size          =3D 1;
> >>>          chip->ecc.strength      =3D 8;
> >>>          chip->ecc.layout        =3D&gpmi_hw_ecclayout;
> >>>=20
> >>> +       chip->verify_buf        =3D gpmi_verify_buf;
> >>>=20
> >>>          if (of_get_nand_on_flash_bbt(this->dev->of_node))
> >>>         =20
> >>>                  chip->bbt_options |=3D NAND_BBT_USE_FLASH |
> >>>                  NAND_BBT_NO_OOB;
> >>>=20
> >>> Now we need to come up with a real  gpmi_verify_buf function ;-)
>=20
> I does have a real gpmi_verify_buf function in our BSP code.
>=20
> I will send it out as soon as possible.

I believe you should roll it out ASAP and also CC stable!

> thanks
> Huang Shijie
>=20
> > As I mentioned, I understand that a proper function needs to be created.
> >=20
> > Regards,
> >=20
> > Fabio Estevam

Best regards,
Marek Vasut
