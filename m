Received: from moutng.kundenserver.de ([212.227.17.8])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGAbP-0003TR-Ss
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 15:29:44 +0000
Message-ID: <50607C5F.3000501@corscience.de>
Date: Mon, 24 Sep 2012 17:29:35 +0200
From: =?ISO-8859-1?Q?Andreas_Bie=DFmann?= <biessmann@corscience.de>
MIME-Version: 1.0
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: Per-partition NAND ECC?
References: <50607688.6090601@gmail.com>
In-Reply-To: <50607688.6090601@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24.09.2012 17:04, Peter Barada wrote:
> On the OMAP3 parts the bootrom has a hard requirement of using 1-bit
> Hamming ECC to read the 2nd stage bootloader(x-loader / SPL) out of the
> first four blocks of NAND.  The Micron MT29C4G48MAZAPAKQ5 PoP part we'r=
e
> using requires 4-bit ECC for all the other NAND blocks to maintain an
> acceptable UBER.
>=20
> Currently this wasn't a problem since I could use u-boot to update the
> 2nd stage bootloader. I now have a need to be able to update the 2nd
> stage bootloader from Linux only so I need the ability to write/read
> pages in a NAND partition with a different ECC method than that
> specified over the device.  I think it would be more elegant to solve
> this by allowing partition entry/mtdparts to specify its ECC
> methodology, track that as part of the MTD device down into the nand
> driver, and switch ECC methods/entrypoints as it changes.
>=20
> Does anyone have suggestions on how to best approach this?

We have the same problem here. We modified the omap2 nand driver to have
the ecc type configurable as module parameter.
In our upgrade scenario we can unload the omap2 module cause we are
running from initrd and so we can switch the ecc type by module
parameter quite easy.
Your suggestion to switch ecc per mtd sound way better, but sorry I have
currently no insights how to implement this in a proper way. I don't
know if there is an generic way to bind the ecc information to an mtd.
You can find our solution attached (is added by c'n'p thus may have
wrong line wraps). If anybody is interested in this solution, I can
provide a proper patch.
And beware, you will need [1] and [2] for safe unloading of omap2 nand
driver.

Best regards

Andreas Bie=DFmann

[1]
http://git.infradead.org/users/dedekind/l2-mtd.git/commit/44552d26885a25b=
423c6606fd5f203aa95dc953f
[2]
http://git.infradead.org/users/dedekind/l2-mtd.git/commit/14178ea6dd8a657=
5616ce439389a8dd45e149aa8

---
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c2b0bba..7f2ca2e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -95,6 +95,10 @@
 #define P4e_s(a)	(TF(a & NAND_Ecc_P4e)		<< 0)
 #define P4o_s(a)	(TF(a & NAND_Ecc_P4o)		<< 1)

+static int eccmode =3D -1;
+module_param(eccmode, int, 0);
+MODULE_PARM_DESC(eccmode, "ECC mode (-1=3Dplatform data, 0=3Dsw, 1=3Dhw,
2=3Dhwrom)");
+
 /* oob info generated runtime depending on ecc algorithm and layout
selected */
 static struct nand_ecclayout omap_oobinfo;
 /* Define some generic bad / good block scan pattern which are used
@@ -931,6 +935,7 @@ static int __devinit omap_nand_probe(struct
platform_device *pdev)
 	struct omap_nand_platform_data	*pdata;
 	int				err;
 	int				i, offset;
+	enum omap_ecc			ecc_opt;

 	pdata =3D pdev->dev.platform_data;
 	if (pdata =3D=3D NULL) {
@@ -1052,10 +1057,13 @@ static int __devinit omap_nand_probe(struct
platform_device *pdev)
 	info->nand.verify_buf =3D omap_verify_buf;

 	/* selsect the ecc type */
-	if (pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_DEFAULT)
+	ecc_opt =3D (eccmode =3D=3D -1) ? pdata->ecc_opt : eccmode;
+	dev_info(&pdev->dev, "Using ECC mode %d\n", ecc_opt);
+
+	if (ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_DEFAULT)
 		info->nand.ecc.mode =3D NAND_ECC_SOFT;
-	else if ((pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW) ||
-		(pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMCODE)) {
+	else if ((ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW) ||
+		(ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMCODE)) {
 		info->nand.ecc.bytes            =3D 3;
 		info->nand.ecc.size             =3D 512;
 		info->nand.ecc.strength         =3D 1;
@@ -1077,7 +1085,7 @@ static int __devinit omap_nand_probe(struct
platform_device *pdev)
 	}

 	/* rom code layout */
-	if (pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMCODE) {
+	if (ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMCODE) {

 		if (info->nand.options & NAND_BUSWIDTH_16)
 			offset =3D 2;
