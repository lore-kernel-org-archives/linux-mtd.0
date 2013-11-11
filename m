From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 10/12] mtd: nand: davinci: don't set timings if AEMIF is used
Date: Mon, 11 Nov 2013 17:10:53 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D53@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-11-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-11-git-send-email-ivan.khoronzhuk@ti.com>
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

If Davinci AEMIF is used we don't need to set timings and bus width.=0A=
It is done by AEMIF driver (drivers/memory/davinci-aemfi.c).=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 drivers/mtd/nand/davinci_nand.c |   22 +++++++++++++++-------=0A=
 1 file changed, 15 insertions(+), 7 deletions(-)=0A=
=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index 4705214..879e915 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -742,27 +742,35 @@ static int __init nand_davinci_probe(struct platform_=
device *pdev)=0A=
                goto err_clk_enable;=0A=
        }=0A=
=0A=
+#if !IS_ENABLED(CONFIG_TI_DAVINCI_AEMIF)=0A=
        /*=0A=
-        * Setup Async configuration register in case we did not boot from=
=0A=
-        * NAND and so bootloader did not bother to set it up.=0A=
+        * Setup Async configuration register in case we did not boot=0A=
+        * from NAND and so bootloader did not bother to set it up.=0A=
         */=0A=
-       val =3D davinci_nand_readl(info, A1CR_OFFSET + info->core_chipsel *=
 4);=0A=
+       val =3D davinci_nand_readl(info, A1CR_OFFSET +=0A=
+                                info->core_chipsel * 4);=0A=
=0A=
-       /* Extended Wait is not valid and Select Strobe mode is not used */=
=0A=
+       /*=0A=
+        * Extended Wait is not valid and Select Strobe mode is not=0A=
+        * used=0A=
+        */=0A=
        val &=3D ~(ACR_ASIZE_MASK | ACR_EW_MASK | ACR_SS_MASK);=0A=
        if (info->chip.options & NAND_BUSWIDTH_16)=0A=
                val |=3D 0x1;=0A=
=0A=
-       davinci_nand_writel(info, A1CR_OFFSET + info->core_chipsel * 4, val=
);=0A=
+       davinci_nand_writel(info, A1CR_OFFSET +=0A=
+                           info->core_chipsel * 4, val);=0A=
=0A=
        ret =3D 0;=0A=
        if (info->timing)=0A=
-               ret =3D davinci_aemif_setup_timing(info->timing, info->base=
,=0A=
-                                                       info->core_chipsel)=
;=0A=
+               ret =3D davinci_aemif_setup_timing(info->timing,=0A=
+                                                info->base,=0A=
+                                                info->core_chipsel);=0A=
        if (ret < 0) {=0A=
                dev_dbg(&pdev->dev, "NAND timing values setup fail\n");=0A=
                goto err;=0A=
        }=0A=
+#endif=0A=
=0A=
        spin_lock_irq(&davinci_nand_lock);=0A=
=0A=
--=0A=
1.7.9.5=0A=
=0A=
