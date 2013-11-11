From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 06/12] mtd: nand: davinci: adjust DT properties to MTD generic
Date: Mon, 11 Nov 2013 17:01:03 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D20@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-7-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-7-git-send-email-ivan.khoronzhuk@ti.com>
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

The properties davinci-ecc-mode, davinci-nand-use-bbt, davinci-nand-buswidt=
h=0A=
are MTD generic. Correct names for them are: nand-ecc-mode, nand-on-flash-b=
bt,=0A=
nand-bus-width accordingly. So rename them in dts and documentation.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 .../devicetree/bindings/mtd/davinci-nand.txt       |   25 ++++++++++++++++=
----=0A=
 drivers/mtd/nand/davinci_nand.c                    |   11 ++++++---=0A=
 2 files changed, 28 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Docum=
entation/devicetree/bindings/mtd/davinci-nand.txt=0A=
index d2a3fc0..befaa5b 100644=0A=
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
@@ -37,7 +37,7 @@ Recommended properties :=0A=
 - ti,davinci-mask-chipsel:     mask for chipselect address. Needed to mask=
=0A=
                                addresses for given chipselect.=0A=
=0A=
-- ti,davinci-ecc-mode:         operation mode of the NAND ecc mode. ECC mo=
de=0A=
+- nand-ecc-mode:               operation mode of the NAND ecc mode. ECC mo=
de=0A=
                                valid values for davinci driver:=0A=
                                - "none"=0A=
                                - "soft"=0A=
@@ -45,10 +45,25 @@ Recommended properties :=0A=
=0A=
 - ti,davinci-ecc-bits:         used ECC bits, currently supported 1 or 4.=
=0A=
=0A=
-- ti,davinci-nand-buswidth:    buswidth 8 or 16.=0A=
+- nand-bus-width:              buswidth 8 or 16. If not present 8.=0A=
+=0A=
+- nand-on-flash-bbt:           use flash based bad block table support. OO=
B=0A=
+                               identifier is saved in OOB area. If not pre=
sent=0A=
+                               false.=0A=
+=0A=
+Deprecated properties:=0A=
+=0A=
+- ti,davinci-ecc-mode:         operation mode of the NAND ecc mode. ECC mo=
de=0A=
+                               valid values for davinci driver:=0A=
+                               - "none"=0A=
+                               - "soft"=0A=
+                               - "hw"=0A=
+=0A=
+- ti,davinci-nand-buswidth:    buswidth 8 or 16. If not present 8.=0A=
=0A=
 - ti,davinci-nand-use-bbt:     use flash based bad block table support. OO=
B=0A=
-                               identifier is saved in OOB area.=0A=
+                               identifier is saved in OOB area. If not pre=
sent=0A=
+                               false.=0A=
=0A=
 Nand device bindings may contain additional sub-nodes describing partition=
s of=0A=
 the address space. See partition.txt for more detail. The NAND Flash timin=
g=0A=
@@ -66,9 +81,9 @@ nand_cs3@62000000 {=0A=
        ti,davinci-mask-ale =3D <0>;=0A=
        ti,davinci-mask-cle =3D <0>;=0A=
        ti,davinci-mask-chipsel =3D <0>;=0A=
-       ti,davinci-ecc-mode =3D "hw";=0A=
+       nand-ecc-mode =3D "hw";=0A=
        ti,davinci-ecc-bits =3D <4>;=0A=
-       ti,davinci-nand-use-bbt;=0A=
+       nand-on-flash-bbt;=0A=
=0A=
        partition@180000 {=0A=
                label =3D "ubifs";=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index 9bcbaa9..78b8d66 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -534,7 +534,6 @@ static struct davinci_nand_pdata=0A=
                struct davinci_nand_pdata *pdata;=0A=
                const char *mode;=0A=
                u32 prop;=0A=
-               int len;=0A=
=0A=
                pdata =3D  devm_kzalloc(&pdev->dev,=0A=
                                sizeof(struct davinci_nand_pdata),=0A=
@@ -559,6 +558,8 @@ static struct davinci_nand_pdata=0A=
                        "ti,davinci-mask-chipsel", &prop))=0A=
                        pdata->mask_chipsel =3D prop;=0A=
                if (!of_property_read_string(pdev->dev.of_node,=0A=
+                       "nand-ecc-mode", &mode) ||=0A=
+                   !of_property_read_string(pdev->dev.of_node,=0A=
                        "ti,davinci-ecc-mode", &mode)) {=0A=
                        if (!strncmp("none", mode, 4))=0A=
                                pdata->ecc_mode =3D NAND_ECC_NONE;=0A=
@@ -571,11 +572,15 @@ static struct davinci_nand_pdata=0A=
                        "ti,davinci-ecc-bits", &prop))=0A=
                        pdata->ecc_bits =3D prop;=0A=
                if (!of_property_read_u32(pdev->dev.of_node,=0A=
+                       "nand-bus-width", &prop) ||=0A=
+                   !of_property_read_u32(pdev->dev.of_node,=0A=
                        "ti,davinci-nand-buswidth", &prop))=0A=
                        if (prop =3D=3D 16)=0A=
                                pdata->options |=3D NAND_BUSWIDTH_16;=0A=
-               if (of_find_property(pdev->dev.of_node,=0A=
-                       "ti,davinci-nand-use-bbt", &len))=0A=
+               if (of_property_read_bool(pdev->dev.of_node,=0A=
+                       "nand-on-flash-bbt") ||=0A=
+                   of_property_read_bool(pdev->dev.of_node,=0A=
+                       "ti,davinci-nand-use-bbt"))=0A=
                        pdata->bbt_options =3D NAND_BBT_USE_FLASH;=0A=
        }=0A=
=0A=
--=0A=
1.7.9.5=0A=
=0A=
