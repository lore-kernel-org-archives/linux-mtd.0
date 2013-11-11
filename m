From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 01/12] mtd: nand: davinci: fix driver registration
Date: Mon, 11 Nov 2013 16:52:05 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8CE2@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-2-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-2-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=
When kernel is booted using DT, there is no guarantee that Davinci=0A=
NAND device has been created already at the time when driver init=0A=
function is executed. Therefore, platform_driver_probe() can't be used=0A=
because this may result the Davinci NAND driver will never be probed.=0A=
The driver probing has to be made with core mechanism.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 drivers/mtd/nand/davinci_nand.c |    3 ++-=0A=
 1 file changed, 2 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index b77a01e..d87213f 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -877,6 +877,7 @@ static int __exit nand_davinci_remove(struct platform_d=
evice *pdev)=0A=
 }=0A=
=0A=
 static struct platform_driver nand_davinci_driver =3D {=0A=
+       .probe          =3D nand_davinci_probe,=0A=
        .remove         =3D __exit_p(nand_davinci_remove),=0A=
        .driver         =3D {=0A=
                .name   =3D "davinci_nand",=0A=
@@ -886,7 +887,7 @@ static struct platform_driver nand_davinci_driver =3D {=
=0A=
 };=0A=
 MODULE_ALIAS("platform:davinci_nand");=0A=
=0A=
-module_platform_driver_probe(nand_davinci_driver, nand_davinci_probe);=0A=
+module_platform_driver(nand_davinci_driver);=0A=
=0A=
 MODULE_LICENSE("GPL");=0A=
 MODULE_AUTHOR("Texas Instruments");=0A=
--=0A=
1.7.9.5=0A=
=0A=
