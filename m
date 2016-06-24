Date: Fri, 24 Jun 2016 06:16:45 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 "wens@csie.org" <wens@csie.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-sunxi@googlegroups.com"
 <linux-sunxi@googlegroups.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: sunxi: add reset line support
Message-ID: <20160624061645.20af1888@bbrezillon>
In-Reply-To: <1284641466724038@web7h.yandex.ru>
References: <20160620044838.56904-1-icenowy@aosc.xyz>
 <20160620044838.56904-2-icenowy@aosc.xyz>
 <20160623180108.382bbaae@bbrezillon>
 <1284641466724038@web7h.yandex.ru>
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

On Fri, 24 Jun 2016 07:20:38 +0800
Icenowy Zheng <icenowy@aosc.xyz> wrote:

> In my opinion, return directly PTR_ERR(nfc->reset) is OK here.
> If devm_reset_control_get_optional() return -EPROBE_DEFER, the code here =
will also return it. However, if we get other error, why should it return -=
EPROBE_DEFER again?

Sorry, I just had a brainfart :-). Your implementation is correct.
BTW, can you avoid top-posting and reply inline?

>=20
> 24.06.2016, 00:01, "Boris Brezillon" <boris.brezillon@free-electrons.com>:
> > On Mon, 20 Jun 2016 12:48:38 +0800
> > Icenowy Zheng <icenowy@aosc.xyz> wrote:
> > =20
> >> =C2=A0The NAND controller on some sun8i chips needs its reset line to =
be
> >> =C2=A0deasserted before they can enter working state.
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> =C2=A0---
> >> =C2=A0=C2=A0=C2=A0Changes in v2:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Corrected the error checking code of r=
eset line.
> >>
> >> =C2=A0=C2=A0=C2=A0Changes in v3:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Corrected a more serious error brought=
 in the "fix" of v2.
> >>
> >> =C2=A0=C2=A0=C2=A0Changes in v4:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Removed unneeded code block after "els=
e".
> >>
> >> =C2=A0=C2=A0=C2=A0Changes in v5:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Added reassertion code in case of init=
ialization error and device
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remove.
> >>
> >> =C2=A0=C2=A0=C2=A0Changes in v6:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Fixed a resource leak by not using got=
o to exit in case of error.
> >>
> >> =C2=A0=C2=A0drivers/mtd/nand/sunxi_nand.c | 28 +++++++++++++++++++++++=
++---
> >> =C2=A0=C2=A01 file changed, 25 insertions(+), 3 deletions(-)
> >>
> >> =C2=A0diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/su=
nxi_nand.c
> >> =C2=A0index a83a690..08d5e88 100644
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
> >> =C2=A0@@ -1871,26 +1873,42 @@ static int sunxi_nfc_probe(struct platfo=
rm_device *pdev)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out_ahb_clk_unprepare;
> >>
> >> =C2=A0+ nfc->reset =3D devm_reset_control_get_optional(dev, "ahb");
> >> =C2=A0+
> >> =C2=A0+ if (!IS_ERR(nfc->reset)) {
> >> =C2=A0+ ret =3D reset_control_deassert(nfc->reset);
> >> =C2=A0+ if (ret) {
> >> =C2=A0+ dev_err(dev, "reset err %d\n", ret);
> >> =C2=A0+ goto out_mod_clk_unprepare;
> >> =C2=A0+ }
> >> =C2=A0+ } else if (PTR_ERR(nfc->reset) !=3D -ENOENT) {
> >> =C2=A0+ ret =3D PTR_ERR(nfc->reset); =20
> >
> > You should return -EDEFER_PROBE here.
> >
> > And can you please rebase this series on top of nand/next [1]?
> >
> > [1]https://github.com/linux-nand/linux/tree/nand/next =20
