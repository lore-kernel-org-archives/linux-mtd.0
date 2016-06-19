Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEcEA-0003IQ-13
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:53:27 +0000
Date: Sun, 19 Jun 2016 14:53:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: icenowy@aosc.xyz
Cc: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 "wens@csie.org" <wens@csie.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-sunxi@googlegroups.com"
 <linux-sunxi@googlegroups.com>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] mtd: nand: sunxi: add reset line support
Message-ID: <20160619145303.0bdf59ea@bbrezillon>
In-Reply-To: <2686901466340069@web27g.yandex.ru>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
 <20160619113739.30362-2-icenowy@aosc.xyz>
 <20160619140652.07ab03c9@bbrezillon>
 <2686901466340069@web27g.yandex.ru>
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

On Sun, 19 Jun 2016 20:41:09 +0800
icenowy@aosc.xyz wrote:

> To be honest, I copied them from sunxi-mmc.c.
>=20
> What function should be chosen better?

You did the right thing (except for the error detection part). My
question was addressed to Philipp (the reset subsystem maintainer).

>=20
>=20
> 19.06.2016, 20:06, "Boris Brezillon" <boris.brezillon@free-electrons.com>:
> > +Philipp
> >
> > On Sun, 19 Jun 2016 19:37:39 +0800
> > Icenowy Zheng <icenowy@aosc.xyz> wrote:
> > =20
> >> =C2=A0The NAND controller on some sun8i chips needs its reset line to =
be deasserted
> >> =C2=A0before they can enter working state. This commit added the reset=
 line process
> >> =C2=A0to the driver.
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> =C2=A0---
> >> =C2=A0=C2=A0drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
> >> =C2=A0=C2=A01 file changed, 14 insertions(+)
> >>
> >> =C2=A0diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/su=
nxi_nand.c
> >> =C2=A0index a83a690..1502748 100644
> >> =C2=A0--- a/drivers/mtd/nand/sunxi_nand.c
> >> =C2=A0+++ b/drivers/mtd/nand/sunxi_nand.c
> >> =C2=A0@@ -39,6 +39,7 @@
> >> =C2=A0=C2=A0#include <linux/gpio.h>
> >> =C2=A0=C2=A0#include <linux/interrupt.h>
> >> =C2=A0=C2=A0#include <linux/iopoll.h>
> >> =C2=A0+#include <linux/reset.h>
> >>
> >> =C2=A0=C2=A0#define NFC_REG_CTL 0x0000
> >> =C2=A0=C2=A0#define NFC_REG_ST 0x0004
> >> =C2=A0@@ -269,6 +270,7 @@ struct sunxi_nfc {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iom=
em *regs;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk=
 *ahb_clk;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk=
 *mod_clk;
> >> =C2=A0+ struct reset_control *reset;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned l=
ong assigned_cs;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned l=
ong clk_rate;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct lis=
t_head chips;
> >> =C2=A0@@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struct platfor=
m_device *pdev)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out_ahb_clk_unprepare;
> >>
> >> =C2=A0+ nfc->reset =3D devm_reset_control_get_optional(dev, "ahb");
> >> =C2=A0+ if (PTR_ERR(nfc->reset) =3D=3D -EPROBE_DEFER)
> >> =C2=A0+ return PTR_ERR(nfc->reset); =20
> >
> > Actually you should test for !=3D -ENOENT, because all error codes exce=
pt
> > this one should stop the ->probe().
> >
> > BTW, this devm_reset_control_get_optional() is really weird. While most
> > _optional() methods return NULL when the element is not defined in the
> > DT, this one returns -ENOTENT, which makes it impossible to
> > differentiate a real error from a undefined reset line (which is a
> > valid case for _optional()).
> >
> > Philipp, is there a good reason for doing that?
> > =20
> >> =C2=A0+
> >> =C2=A0+ if (!IS_ERR(nfc->reset)) {
> >> =C2=A0+ ret =3D reset_control_deassert(nfc->reset);
> >> =C2=A0+ if (ret) {
> >> =C2=A0+ dev_err(dev, "reset err %d\n", ret);
> >> =C2=A0+ goto out_mod_clk_unprepare;
> >> =C2=A0+ }
> >> =C2=A0+ }
> >> =C2=A0+ =20
