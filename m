From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 09/12] mtd: nand: davinci: reuse driver for Keystone arch
Date: Mon, 11 Nov 2013 17:09:59 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D46@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-10-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-10-git-send-email-ivan.khoronzhuk@ti.com>
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

The Keystone arch has compatible nand device, so reuse it.=0A=
In case with Keystone it depends on TI_DAVINCI_AEMIF because AEMIF=0A=
driver is responsible to set timings.=0A=
=0A=
See http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 .../devicetree/bindings/mtd/davinci-nand.txt       |    8 +++++---=0A=
 drivers/mtd/nand/Kconfig                           |    6 +++---=0A=
 drivers/mtd/nand/davinci_nand.c                    |    1 +=0A=
 3 files changed, 9 insertions(+), 6 deletions(-)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Docum=
entation/devicetree/bindings/mtd/davinci-nand.txt=0A=
index befaa5b..cfb18ab 100644=0A=
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
@@ -1,14 +1,16 @@=0A=
-Device tree bindings for Texas instruments Davinci NAND controller=0A=
+Device tree bindings for Texas instruments Davinci/Keystone NAND controlle=
r=0A=
=0A=
-This file provides information, what the device node for the davinci NAND=
=0A=
-interface contains.=0A=
+This file provides information, what the device node for the davinci/keyst=
one=0A=
+NAND interface contains.=0A=
=0A=
 Documentation:=0A=
 Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf=0A=
+Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf=0A=
=0A=
 Required properties:=0A=
=0A=
 - compatible:                  "ti,davinci-nand"=0A=
+                               "ti,keystone-nand"=0A=
=0A=
 - reg:                         Contains 2 offset/length values:=0A=
                                - offset and length for the access window.=
=0A=
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig=0A=
index d885298..62dbcd5 100644=0A=
--- a/drivers/mtd/nand/Kconfig=0A=
+++ b/drivers/mtd/nand/Kconfig=0A=
@@ -492,11 +492,11 @@ config MTD_NAND_SH_FLCTL=0A=
          for NAND Flash using FLCTL.=0A=
=0A=
 config MTD_NAND_DAVINCI=0A=
-        tristate "Support NAND on DaVinci SoC"=0A=
-        depends on ARCH_DAVINCI=0A=
+        tristate "Support NAND on DaVinci/Keystone SoC"=0A=
+        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_DAVINCI_AEMIF)=0A=
         help=0A=
          Enable the driver for NAND flash chips on Texas Instruments=0A=
-         DaVinci processors.=0A=
+         DaVinci/Keystone processors.=0A=
=0A=
 config MTD_NAND_TXX9NDFMC=0A=
        tristate "NAND Flash support for TXx9 SoC"=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index 78b8d66..4705214 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -523,6 +523,7 @@ static struct nand_ecclayout hwecc4_2048 __initconst =
=3D {=0A=
 #if defined(CONFIG_OF)=0A=
 static const struct of_device_id davinci_nand_of_match[] =3D {=0A=
        {.compatible =3D "ti,davinci-nand", },=0A=
+       {.compatible =3D "ti,keystone-nand", },=0A=
        {},=0A=
 };=0A=
 MODULE_DEVICE_TABLE(of, davinci_nand_of_match);=0A=
--=0A=
1.7.9.5=0A=
=0A=
