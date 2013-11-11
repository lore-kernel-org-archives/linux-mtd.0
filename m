From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 05/12] mtd: nand: davinci: extend description of bindings
Date: Mon, 11 Nov 2013 16:58:54 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D14@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-6-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-6-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
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

Extend bindings for davinci_nand driver to be more clear.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 .../devicetree/bindings/mtd/davinci-nand.txt       |   77 ++++++++++++++--=
----=0A=
 1 file changed, 54 insertions(+), 23 deletions(-)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Docum=
entation/devicetree/bindings/mtd/davinci-nand.txt=0A=
index 3545ea7..d2a3fc0 100644=0A=
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
@@ -1,36 +1,67 @@=0A=
-* Texas Instruments Davinci NAND=0A=
+Device tree bindings for Texas instruments Davinci NAND controller=0A=
=0A=
-This file provides information, what the device node for the=0A=
-davinci nand interface contain.=0A=
+This file provides information, what the device node for the davinci NAND=
=0A=
+interface contains.=0A=
+=0A=
+Documentation:=0A=
+Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf=0A=
=0A=
 Required properties:=0A=
-- compatible: "ti,davinci-nand";=0A=
-- reg : contain 2 offset/length values:=0A=
-        - offset and length for the access window=0A=
-        - offset and length for accessing the aemif control registers=0A=
-- ti,davinci-chipselect: Indicates on the davinci_nand driver which=0A=
-                         chipselect is used for accessing the nand.=0A=
+=0A=
+- compatible:                  "ti,davinci-nand"=0A=
+=0A=
+- reg:                         Contains 2 offset/length values:=0A=
+                               - offset and length for the access window.=
=0A=
+                               - offset and length for accessing the AEMIF=
=0A=
+                               control registers.=0A=
+=0A=
+- ti,davinci-chipselect:       number of chipselect. Indicates on the=0A=
+                               davinci_nand driver which chipselect is use=
d=0A=
+                               for accessing the nand.=0A=
+                               Can be in the range [0-3].=0A=
=0A=
 Recommended properties :=0A=
-- ti,davinci-mask-ale: mask for ale=0A=
-- ti,davinci-mask-cle: mask for cle=0A=
-- ti,davinci-mask-chipsel: mask for chipselect=0A=
-- ti,davinci-ecc-mode: ECC mode valid values for davinci driver:=0A=
-               - "none"=0A=
-               - "soft"=0A=
-               - "hw"=0A=
-- ti,davinci-ecc-bits: used ECC bits, currently supported 1 or 4.=0A=
-- ti,davinci-nand-buswidth: buswidth 8 or 16=0A=
-- ti,davinci-nand-use-bbt: use flash based bad block table support.=0A=
-=0A=
-nand device bindings may contain additional sub-nodes describing=0A=
-partitions of the address space. See partition.txt for more detail.=0A=
+=0A=
+- ti,davinci-mask-ale:         mask for ALE. Needed for executing address=
=0A=
+                               phase. These offset will be added to the ba=
se=0A=
+                               address for the chip select space the NAND =
Flash=0A=
+                               device is connected to.=0A=
+                               If not set equal to 0x08.=0A=
+=0A=
+- ti,davinci-mask-cle:         mask for CLE. Needed for executing command=
=0A=
+                               phase. These offset will be added to the ba=
se=0A=
+                               address for the chip select space the NAND =
Flash=0A=
+                               device is connected to.=0A=
+                               If not set equal to 0x10.=0A=
+=0A=
+- ti,davinci-mask-chipsel:     mask for chipselect address. Needed to mask=
=0A=
+                               addresses for given chipselect.=0A=
+=0A=
+- ti,davinci-ecc-mode:         operation mode of the NAND ecc mode. ECC mo=
de=0A=
+                               valid values for davinci driver:=0A=
+                               - "none"=0A=
+                               - "soft"=0A=
+                               - "hw"=0A=
+=0A=
+- ti,davinci-ecc-bits:         used ECC bits, currently supported 1 or 4.=
=0A=
+=0A=
+- ti,davinci-nand-buswidth:    buswidth 8 or 16.=0A=
+=0A=
+- ti,davinci-nand-use-bbt:     use flash based bad block table support. OO=
B=0A=
+                               identifier is saved in OOB area.=0A=
+=0A=
+Nand device bindings may contain additional sub-nodes describing partition=
s of=0A=
+the address space. See partition.txt for more detail. The NAND Flash timin=
g=0A=
+values must be programmed in the chip select=92s node of AEMIF=0A=
+memory-controller (see Documentation/devicetree/bindings/memory-controller=
s/=0A=
+davinci-aemif.txt).=0A=
=0A=
 Example(da850 EVM ):=0A=
+=0A=
 nand_cs3@62000000 {=0A=
        compatible =3D "ti,davinci-nand";=0A=
        reg =3D <0x62000000 0x807ff=0A=
-               0x68000000 0x8000>;=0A=
+              0x68000000 0x8000>;=0A=
        ti,davinci-chipselect =3D <1>;=0A=
        ti,davinci-mask-ale =3D <0>;=0A=
        ti,davinci-mask-cle =3D <0>;=0A=
--=0A=
1.7.9.5=0A=
=0A=
