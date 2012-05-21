From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/4] GPMI-NAND: Define ecc.strength
Date: Mon, 21 May 2012 05:48:00 +0200
References: <1337562140-5739-1-git-send-email-marex@denx.de>
 <201205210440.09310.marex@denx.de> <4FB9B19B.2080309@freescale.com>
In-Reply-To: <4FB9B19B.2080309@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201205210548.00536.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B405=E6=9C=8821=E6=97=A5 10:40, Marek Vasut =E5=86=
=99=E9=81=93:
> > I doubt so ... but noone ever could test it without DT bindings as you
> > NAKed/stalled every single attempt to add the platform binding code. So
> > this code was rotting in the tree, who knows how many bugs are still in
> > it. Now I guess it's about time to start squashing the bugs.
>=20
> I checked the latest l2-mtd code. The bug does exit if the gpmi-nand
> driver can works(actually it can not).

There's also the bug where you need to put gpmi@8000c000 into the DTS file=
=20
instead of gpmi-nand@8000c000 ... maybe you should fix it?

Also, there's still the bug with subpage write size, "GPMI-NAND: Wrong ECC =
size=20
in driver" thread in linux-mtd. That thread kind of died, but gpmi-nand is =
still=20
broken in that way, it's depending on loose end of the mtd stack there. Won=
't=20
hurt fixing that too, there was even a fix proposed.

>=20
> I will test your patch.
> Anyway, this patch should be sent to Artem, not the arm-soc.

Resent, fixed, sorry for the inconvenience.

>=20
> thanks
> Huang Shijie

Best regards,
Marek Vasut
