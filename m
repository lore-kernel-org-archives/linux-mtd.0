From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 12/12] arm: dts: keystone: add AEMIF/NAND device entry
Date: Mon, 11 Nov 2013 17:13:01 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D71@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-13-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-13-git-send-email-ivan.khoronzhuk@ti.com>
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

Add AEMIF/NAND device entry.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 arch/arm/boot/dts/keystone.dts |   63 ++++++++++++++++++++++++++++++++++++=
++++=0A=
 1 file changed, 63 insertions(+)=0A=
=0A=
diff --git a/arch/arm/boot/dts/keystone.dts b/arch/arm/boot/dts/keystone.dt=
s=0A=
index 100bdf5..998da98 100644=0A=
--- a/arch/arm/boot/dts/keystone.dts=0A=
+++ b/arch/arm/boot/dts/keystone.dts=0A=
@@ -179,5 +179,68 @@=0A=
                        interrupts =3D <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;=
=0A=
                        clocks =3D <&clkspi>;=0A=
                };=0A=
+=0A=
+               aemif@021000A00 {=0A=
+                       compatible =3D "ti,keystone-aemif";=0A=
+                       #address-cells =3D <2>;=0A=
+                       #size-cells =3D <1>;=0A=
+                       clocks =3D <&clkaemif>;=0A=
+                       clock-names =3D "aemif";=0A=
+                       clock-ranges;=0A=
+=0A=
+                       reg =3D <0x2100A00 0x00000100>;=0A=
+                       ranges =3D <0 0 0x30000000 0x10000000=0A=
+                                 1 0 0x21000A00 0x00000100>;=0A=
+=0A=
+                       nand:cs0 {=0A=
+                               compatible =3D "ti,davinci-cs";=0A=
+                               #address-cells =3D <2>;=0A=
+                               #size-cells =3D <1>;=0A=
+                               clock-ranges;=0A=
+                               ranges;=0A=
+=0A=
+                               /* all timings in nanoseconds */=0A=
+                               ti,davinci-cs-ta =3D <12>;=0A=
+                               ti,davinci-cs-rhold =3D <6>;=0A=
+                               ti,davinci-cs-rstrobe =3D <23>;=0A=
+                               ti,davinci-cs-rsetup =3D <9>;=0A=
+                               ti,davinci-cs-whold =3D <8>;=0A=
+                               ti,davinci-cs-wstrobe =3D <23>;=0A=
+                               ti,davinci-cs-wsetup =3D <8>;=0A=
+=0A=
+                               nand@0,0 {=0A=
+                                       compatible =3D "ti,keystone-nand";=
=0A=
+                                       #address-cells =3D <1>;=0A=
+                                       #size-cells =3D <1>;=0A=
+                                       reg =3D <0 0 0x4000000=0A=
+                                              1 0 0x0000100>;=0A=
+=0A=
+                                       ti,davinci-chipselect =3D <0>;=0A=
+                                       ti,davinci-mask-ale =3D <0x2000>;=
=0A=
+                                       ti,davinci-mask-cle =3D <0x4000>;=
=0A=
+                                       ti,davinci-mask-chipsel =3D <0>;=0A=
+                                       nand-ecc-mode =3D "hw";=0A=
+                                       ti,davinci-ecc-bits =3D <4>;=0A=
+                                       nand-on-flash-bbt;=0A=
+=0A=
+                                       partition@0 {=0A=
+                                               label =3D "u-boot";=0A=
+                                               reg =3D <0x0 0x100000>;=0A=
+                                               read-only;=0A=
+                                       };=0A=
+=0A=
+                                       partition@100000 {=0A=
+                                               label =3D "params";=0A=
+                                               reg =3D <0x100000 0x80000>;=
=0A=
+                                               read-only;=0A=
+                                       };=0A=
+=0A=
+                                       partition@180000 {=0A=
+                                               label =3D "ubifs";=0A=
+                                               reg =3D <0x180000 0x7E80000=
>;=0A=
+                                       };=0A=
+                               };=0A=
+                       };=0A=
+               };=0A=
        };=0A=
 };=0A=
--=0A=
1.7.9.5=0A=
=0A=
