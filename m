From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 02/12] mtd: nand: davinci: check required
 ti,davinci-chipselect property
Date: Mon, 11 Nov 2013 16:53:17 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8CEF@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-3-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-3-git-send-email-ivan.khoronzhuk@ti.com>
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

The property "ti,davinci-chipselect" is required. So we have to check=0A=
if it is set.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 drivers/mtd/nand/davinci_nand.c |   10 +++++++++-=0A=
 1 file changed, 9 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index d87213f..8e1c88e 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -541,10 +541,14 @@ static struct davinci_nand_pdata=0A=
                                GFP_KERNEL);=0A=
                pdev->dev.platform_data =3D pdata;=0A=
                if (!pdata)=0A=
-                       return NULL;=0A=
+                       return ERR_PTR(-ENOMEM);=0A=
+=0A=
                if (!of_property_read_u32(pdev->dev.of_node,=0A=
                        "ti,davinci-chipselect", &prop))=0A=
                        pdev->id =3D prop;=0A=
+               else=0A=
+                       return ERR_PTR(-EINVAL);=0A=
+=0A=
                if (!of_property_read_u32(pdev->dev.of_node,=0A=
                        "ti,davinci-mask-ale", &prop))=0A=
                        pdata->mask_ale =3D prop;=0A=
@@ -598,6 +602,10 @@ static int __init nand_davinci_probe(struct platform_d=
evice *pdev)=0A=
        nand_ecc_modes_t                ecc_mode;=0A=
=0A=
        pdata =3D nand_davinci_get_pdata(pdev);=0A=
+       if (IS_ERR(pdata)) {=0A=
+               return PTR_ERR(pdata);=0A=
+       }=0A=
+=0A=
        /* insist on board-specific configuration */=0A=
        if (!pdata)=0A=
                return -ENODEV;=0A=
--=0A=
1.7.9.5=0A=
=0A=
