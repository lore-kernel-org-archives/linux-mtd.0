From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 03/12] mtd: nand: davinci: simplify error handling
Date: Mon, 11 Nov 2013 16:54:23 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8CFB@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-4-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-4-git-send-email-ivan.khoronzhuk@ti.com>
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

There is not needed to use a lot of names for err handling.=0A=
It complicates code support and reading.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 drivers/mtd/nand/davinci_nand.c |   46 +++++++++++++++--------------------=
----=0A=
 1 file changed, 17 insertions(+), 29 deletions(-)=0A=
=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index 8e1c88e..9bcbaa9 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -617,8 +617,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
        info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);=0A=
        if (!info) {=0A=
                dev_err(&pdev->dev, "unable to allocate memory\n");=0A=
-               ret =3D -ENOMEM;=0A=
-               goto err_nomem;=0A=
+               return -ENOMEM;=0A=
        }=0A=
=0A=
        platform_set_drvdata(pdev, info);=0A=
@@ -627,20 +626,16 @@ static int __init nand_davinci_probe(struct platform_=
device *pdev)=0A=
        res2 =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);=0A=
        if (!res1 || !res2) {=0A=
                dev_err(&pdev->dev, "resource missing\n");=0A=
-               ret =3D -EINVAL;=0A=
-               goto err_nomem;=0A=
+               return -EINVAL;=0A=
        }=0A=
=0A=
        vaddr =3D devm_ioremap_resource(&pdev->dev, res1);=0A=
-       if (IS_ERR(vaddr)) {=0A=
-               ret =3D PTR_ERR(vaddr);=0A=
-               goto err_ioremap;=0A=
-       }=0A=
+       if (IS_ERR(vaddr))=0A=
+               return PTR_ERR(vaddr);=0A=
+=0A=
        base =3D devm_ioremap_resource(&pdev->dev, res2);=0A=
-       if (IS_ERR(base)) {=0A=
-               ret =3D PTR_ERR(base);=0A=
-               goto err_ioremap;=0A=
-       }=0A=
+       if (IS_ERR(base))=0A=
+               return PTR_ERR(base);=0A=
=0A=
        info->dev               =3D &pdev->dev;=0A=
        info->base              =3D base;=0A=
@@ -707,7 +702,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
                        spin_unlock_irq(&davinci_nand_lock);=0A=
=0A=
                        if (ret =3D=3D -EBUSY)=0A=
-                               goto err_ecc;=0A=
+                               return ret;=0A=
=0A=
                        info->chip.ecc.calculate =3D nand_davinci_calculate=
_4bit;=0A=
                        info->chip.ecc.correct =3D nand_davinci_correct_4bi=
t;=0A=
@@ -723,8 +718,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
                info->chip.ecc.strength =3D pdata->ecc_bits;=0A=
                break;=0A=
        default:=0A=
-               ret =3D -EINVAL;=0A=
-               goto err_ecc;=0A=
+               return -EINVAL;=0A=
        }=0A=
        info->chip.ecc.mode =3D ecc_mode;=0A=
=0A=
@@ -732,7 +726,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
        if (IS_ERR(info->clk)) {=0A=
                ret =3D PTR_ERR(info->clk);=0A=
                dev_dbg(&pdev->dev, "unable to get AEMIF clock, err %d\n", =
ret);=0A=
-               goto err_clk;=0A=
+               return ret;=0A=
        }=0A=
=0A=
        ret =3D clk_prepare_enable(info->clk);=0A=
@@ -761,7 +755,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
                                                        info->core_chipsel)=
;=0A=
        if (ret < 0) {=0A=
                dev_dbg(&pdev->dev, "NAND timing values setup fail\n");=0A=
-               goto err_timing;=0A=
+               goto err;=0A=
        }=0A=
=0A=
        spin_lock_irq(&davinci_nand_lock);=0A=
@@ -777,7 +771,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
        ret =3D nand_scan_ident(&info->mtd, pdata->mask_chipsel ? 2 : 1, NU=
LL);=0A=
        if (ret < 0) {=0A=
                dev_dbg(&pdev->dev, "no NAND chip(s) found\n");=0A=
-               goto err_scan;=0A=
+               goto err;=0A=
        }=0A=
=0A=
        /* Update ECC layout if needed ... for 1-bit HW ECC, the default=0A=
@@ -791,7 +785,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
                if (!chunks || info->mtd.oobsize < 16) {=0A=
                        dev_dbg(&pdev->dev, "too small\n");=0A=
                        ret =3D -EINVAL;=0A=
-                       goto err_scan;=0A=
+                       goto err;=0A=
                }=0A=
=0A=
                /* For small page chips, preserve the manufacturer's=0A=
@@ -822,7 +816,7 @@ static int __init nand_davinci_probe(struct platform_de=
vice *pdev)=0A=
                dev_warn(&pdev->dev, "no 4-bit ECC support yet "=0A=
                                "for 4KiB-page NAND\n");=0A=
                ret =3D -EIO;=0A=
-               goto err_scan;=0A=
+               goto err;=0A=
=0A=
 syndrome_done:=0A=
                info->chip.ecc.layout =3D &info->ecclayout;=0A=
@@ -830,7 +824,7 @@ syndrome_done:=0A=
=0A=
        ret =3D nand_scan_tail(&info->mtd);=0A=
        if (ret < 0)=0A=
-               goto err_scan;=0A=
+               goto err;=0A=
=0A=
        if (pdata->parts)=0A=
                ret =3D mtd_device_parse_register(&info->mtd, NULL, NULL,=
=0A=
@@ -843,7 +837,7 @@ syndrome_done:=0A=
                                                NULL, 0);=0A=
        }=0A=
        if (ret < 0)=0A=
-               goto err_scan;=0A=
+               goto err;=0A=
=0A=
        val =3D davinci_nand_readl(info, NRCSR_OFFSET);=0A=
        dev_info(&pdev->dev, "controller rev. %d.%d\n",=0A=
@@ -851,8 +845,7 @@ syndrome_done:=0A=
=0A=
        return 0;=0A=
=0A=
-err_scan:=0A=
-err_timing:=0A=
+err:=0A=
        clk_disable_unprepare(info->clk);=0A=
=0A=
 err_clk_enable:=0A=
@@ -860,11 +853,6 @@ err_clk_enable:=0A=
        if (ecc_mode =3D=3D NAND_ECC_HW_SYNDROME)=0A=
                ecc4_busy =3D false;=0A=
        spin_unlock_irq(&davinci_nand_lock);=0A=
-=0A=
-err_ecc:=0A=
-err_clk:=0A=
-err_ioremap:=0A=
-err_nomem:=0A=
        return ret;=0A=
 }=0A=
=0A=
--=0A=
1.7.9.5=0A=
=0A=
