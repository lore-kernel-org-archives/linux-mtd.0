Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D131C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 12:26:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D8BB2186A
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 12:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZSqEytNA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DsXZIsKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D8BB2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LQNpZLrXU2lDSCk9/cxuSEQtRYpMzjPMwy23nzxAjcM=; b=ZSqEytNAy/fbsqDB4YHZoZ1HV
	jJfj7VtPmWt9FthIkKtatSwdn1GszzXF+OJ68+PmcE+ZFl2blTbtS1moPCJJ+T1Anz6I4bEP0Kz40
	xTzAr7jESoS0/Gpmh0dEJRiIdDuRu9cgRqvyM+Bw9P3j/2U85pDlASDCxtw/zyMSfW61FmmS0myN0
	U4tYJ+4ixf6ncqmk7NpjIBB59bkJJbXovTXYWE+jxuLO+vf12MWMnynPtNlYA4m3emIqwt+VNPQrk
	QHf474QU0OmMSlwiQpweyClZ4BBBsiYcULFF9iII1KlWh9X8imJvVVd5vJo+JPQd64Jv/1n7SHOxR
	Fur0PzANw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCNvk-0007IF-Qn; Fri, 05 Apr 2019 12:26:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCNvc-0007A9-Eb; Fri, 05 Apr 2019 12:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbvPTScEU4xPAEBcqNzITu4ov29F9xEOKIndaJSi4iU=; b=DsXZIsKDQEn7SS0xz6Hx94631
 zSyjKu0BmWrhLmA8hM1ZAZwujRQv1M7vlOTatDFshIQxr7ggmuwtoSoLHEdhz+wgbCV3KV63NPc6w
 hEVT7sk9xs0Hg01/MXA4FLrb51XzSGIjSz/V+iNwETOfCy2nQwd3B/aF1GEVsUgqESvGoom/Ky1LP
 m1fPqF4Ko+pDivdpbCDV2Gp14H+Ab8MvMtS9gruIJT7mlYcelkwljrcqy5pJBrI5DV05O9oif1A+m
 0Ij3i/jKziS89UYJ1aEXvlNQ+eegAU6wOfN7TbJd79yNHIfmB8f+8/Uxy6+8D4ewqqY01Y1W94Llh
 Ov+uHoXeA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCNvY-0004Hv-Sv; Fri, 05 Apr 2019 12:26:38 +0000
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 14BEB240018;
 Fri,  5 Apr 2019 12:26:00 +0000 (UTC)
Date: Fri, 5 Apr 2019 14:25:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190405142554.44e3da68@xps13>
In-Reply-To: <20190405105559.sqdhoa54ne7l4svj@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190405091607.2dzckvyqibs7xmew@flea>
 <20190405113742.184234ca@xps13>
 <20190405105559.sqdhoa54ne7l4svj@flea>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_132637_177308_9254FC5F 
X-CRM114-Status: GOOD (  33.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3865775545888556330=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3865775545888556330==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/eM8p=f+D3Tz8vTQ38onfZvM"; protocol="application/pgp-signature"

--Sig_/eM8p=f+D3Tz8vTQ38onfZvM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
12:55:59 +0200:

> On Fri, Apr 05, 2019 at 11:37:42AM +0200, Miquel Raynal wrote:
> > Hi Maxime,
> >
> > Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
> > 11:16:07 +0200:
> > =20
> > > On Thu, Apr 04, 2019 at 06:21:10PM +0200, Miquel Raynal wrote: =20
> > > > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > > > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > > > is a bit different than with the older SoCs, hence the introduction=
 of
> > > > a new compatible to handle:
> > > > * the differences between register offsets,
> > > > * the burst length change from 4 to minimum 8,
> > > > * drive SRAM accesses through the AHB bus instead of the MBUS.
> > > >
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > > >  drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++++=
+---
> > > >  1 file changed, 68 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/r=
aw/sunxi_nand.c
> > > > index 4282bc477761..49cd5067adaa 100644
> > > > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > > > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > > > @@ -42,7 +42,8 @@
> > > >  #define NFC_REG_CMD		0x0024
> > > >  #define NFC_REG_RCMD_SET	0x0028
> > > >  #define NFC_REG_WCMD_SET	0x002C
> > > > -#define NFC_REG_IO_DATA		0x0030
> > > > +#define NFC_REG_A10_IO_DATA	0x0030
> > > > +#define NFC_REG_A33_IO_DATA	0x0300
> > > >  #define NFC_REG_ECC_CTL		0x0034
> > > >  #define NFC_REG_ECC_ST		0x0038
> > > >  #define NFC_REG_DEBUG		0x003C
> > > > @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi=
_nand(struct nand_chip *nand)
> > > >  	return container_of(nand, struct sunxi_nand_chip, nand);
> > > >  }
> > > >
> > > > +/*
> > > > + * NAND Controller capabilities structure: stores NAND controller =
capabilities
> > > > + * for distinction between compatible strings.
> > > > + *
> > > > + * @sram_through_ahb:	On A33, we choose to access the internal RAM=
 through AHB
> > > > + *                      instead of MBUS (less configuration). A10+=
 use the MBUS =20
> > >
> > > What do you mean by A10+ ? =20
> >
> > I meant A1x, A2x SoCs. Not sure it matches a product line for you, so
> > please suggest something to mean "SoCs which are not A33" (so far I
> > think all worked without this). =20
>=20
> The list is pretty small, so we can just name them. That would be the
> A10, A10s A13 and A20.

You really need a "A10+"-like acronym for these ;)

Ok, I'll add the list.


Thanks,
Miqu=C3=A8l

--Sig_/eM8p=f+D3Tz8vTQ38onfZvM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynSVIACgkQJWrqGEe9
VoTNfQf+OcDAHhqTlVVq3Rt+ffEn2mse0C7xKxVlfQemxrbjWif9v2zQwfBLNRBn
V0oE2Nlr6AiKOeeUtJO/XQIoCNLdZkTV+OKqxW2Z32ocBcK4j9nKr05o56KpJK4b
96tQl60ewX7dNDFyXon0mElcgD6SuCVscdXkkV8ldxXMafqBvttTrO/DM3ibVy8Q
rNaIG+aTiV73ePkdRcuoIV/vvU4HFIRBp8RG8hJaxBoECg2IOsYylsFHQXeymMS/
siLznMzphIsRxojTdTYWv8/Q44l1NgNZoBrm13MSxMW5W13PH1Tsh7VL7+Y3q7p9
z1pYT/mM2m8vbb/7z/+DGOjFWIevhg==
=2DlK
-----END PGP SIGNATURE-----

--Sig_/eM8p=f+D3Tz8vTQ38onfZvM--


--===============3865775545888556330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3865775545888556330==--

