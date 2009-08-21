Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeMVG-0006CQ-JL
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 05:17:34 +0000
Received: by qw-out-1920.google.com with SMTP id 5so920494qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Aug 2009 22:17:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090820153644.631dbd7b@lappy.seanm.ca>
References: <19081.57584.173693.798535@cargo.ozlabs.ibm.com>
	<4A8C87E6.6070702@amcc.com> <20090820003851.1a532444@lappy.seanm.ca>
	<200908200701.21076.sr@denx.de>
	<20090820153644.631dbd7b@lappy.seanm.ca>
From: vimal singh <vimal.newwork@gmail.com>
Date: Fri, 21 Aug 2009 10:47:09 +0530
Message-ID: <ce9ab5790908202217t2430646co5059f308a23d7397@mail.gmail.com>
Subject: Re: [U-Boot] NAND ECC Error with wrong SMC ording bug
To: Sean MacLennan <smaclennan@pikatech.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: u-boot@lists.denx.de, Stefan Roese <sr@denx.de>, Feng Kan <fkan@amcc.com>,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

<snip>

> With the current ndfc code, the error correction gets the bits wrong.
> Switching it back to the original way and the correction is correct.
>
> diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
> index 89bf85a..497e175 100644
> --- a/drivers/mtd/nand/ndfc.c
> +++ b/drivers/mtd/nand/ndfc.c
> @@ -101,9 +101,8 @@ static int ndfc_calculate_ecc(struct mtd_info *mtd,
>
> =A0 =A0 =A0 =A0wmb();
> =A0 =A0 =A0 =A0ecc =3D in_be32(ndfc->ndfcbase + NDFC_ECC);
> - =A0 =A0 =A0 /* The NDFC uses Smart Media (SMC) bytes order */
> - =A0 =A0 =A0 ecc_code[0] =3D p[2];
> - =A0 =A0 =A0 ecc_code[1] =3D p[1];
> + =A0 =A0 =A0 ecc_code[0] =3D p[1];
> + =A0 =A0 =A0 ecc_code[1] =3D p[2];
> =A0 =A0 =A0 =A0ecc_code[2] =3D p[3];
>
> =A0 =A0 =A0 =A0return 0;
>
> Does anybody see a problem with my method of reproducing the bug? This
> bug is deadly for our customers. I don't want to make the change unless
> it is absolutely necessary..

Just one question: did you enabled MTD_NAND_ECC_SMC in configs?

-vimal

>
> Cheers,
> =A0 Sean
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
