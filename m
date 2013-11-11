From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 11/12] mtd: nand: davinci: don't request AEMIF address range
Date: Mon, 11 Nov 2013 17:12:24 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D64@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-12-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-12-git-send-email-ivan.khoronzhuk@ti.com>
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

The AEMIF driver registers are used to setup timings for each chip=0A=
select. The same registers range is used to setup NAND settings.=0A=
The AEMIF and NAND drivers not use the same registers in this range.=0A=
=0A=
In case with AEMIF driver, the memory address range is requested=0A=
already by AEMIF, so we cannot request it twice, just ioremap.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 drivers/mtd/nand/davinci_nand.c |    8 +++++---=0A=
 1 file changed, 5 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nan=
d.c=0A=
index 879e915..bb6b7e5 100644=0A=
--- a/drivers/mtd/nand/davinci_nand.c=0A=
+++ b/drivers/mtd/nand/davinci_nand.c=0A=
@@ -639,9 +639,11 @@ static int __init nand_davinci_probe(struct platform_d=
evice *pdev)=0A=
        if (IS_ERR(vaddr))=0A=
                return PTR_ERR(vaddr);=0A=
=0A=
-       base =3D devm_ioremap_resource(&pdev->dev, res2);=0A=
-       if (IS_ERR(base))=0A=
-               return PTR_ERR(base);=0A=
+       base =3D devm_ioremap(&pdev->dev, res2->start, resource_size(res2))=
;=0A=
+       if (!base) {=0A=
+               dev_err(&pdev->dev, "ioremap failed for resource %pR\n", re=
s2);=0A=
+               return -EADDRNOTAVAIL;=0A=
+       }=0A=
=0A=
        info->dev               =3D &pdev->dev;=0A=
        info->base              =3D base;=0A=
--=0A=
1.7.9.5=0A=
=0A=
