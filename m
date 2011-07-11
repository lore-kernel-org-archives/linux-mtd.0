MIME-Version: 1.0
In-Reply-To: <20110711110024.GB11153@pengutronix.de>
References: <1310371266-10704-1-git-send-email-b32955@freescale.com>
	<20110711110024.GB11153@pengutronix.de>
Date: Mon, 11 Jul 2011 11:19:11 -0400
Message-ID: <CAMiH66G4T3y=JydxFCaDwBZwHBvayy1i+Ys5Hd2+f-_u7bPoGQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] add the GPMI-NAND support for imx23/imx28
From: Huang Shijie <shijie8@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, s.hauer@pengutronix.de, Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:

On Mon, Jul 11, 2011 at 7:00 AM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
> Hi,
>
> On Mon, Jul 11, 2011 at 04:01:02PM +0800, Huang Shijie wrote:
>
>> The general-purpose media interface(GPMI) controller is a flexible inter=
face
>> to up to several NAND flashs.
>>
>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC acceler=
ator.
>>
>> With the help of BCH, the GPMI controller can choose to do the hardware =
ECC or
>> not.
>>
>> v6 --> v7:
>> =C2=A0 =C2=A0 =C2=A0 [0] rename RES_SIZE to GPMI_NAND_RES_SIZE.
>> =C2=A0 =C2=A0 =C2=A0 [1] move gpmi-nand.h to `include/linux/mtd/` direct=
ory.
>> =C2=A0 =C2=A0 =C2=A0 [2] remove comment for new pad control.
>> =C2=A0 =C2=A0 =C2=A0 [3] others
>
> Could you also post a driver which is adapted to all these changes?
> The series looks good now; still I want to test it a little just to make
> sure...
ok.

I will sent out the GPMI driver as soon as possible.


Best Regards
Huang Shijie

>
> Thanks,
>
> =C2=A0 Wolfram
>
> --
> Pengutronix e.K. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Wolfram Sang =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> Industrial Linux Solutions =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | http://www.pengutronix.de/ =C2=A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEARECAAYFAk4a18gACgkQD27XaX1/VRsCUQCfeXzR64/uz3n97nbdrTGxH86+
> 3lUAmweRWjZlouL+9cdGiuu8gz4CzNhH
> =3DCQJw
> -----END PGP SIGNATURE-----
>
>
