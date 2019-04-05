Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44740C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1400F21738
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gz9vcfV7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1400F21738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uKLPLEr9H5p2N7biE8268YoH8el5l4sgnO1qW2AVAAo=; b=Gz9vcfV7UJ/PPA2FwDzjtzd5U
	7dM/5rN3X/Cg4ukzb17vJJ2y4TUQsfQ84QXE3vP+TiBNwSRBJG60Ofe2QwC/IwifXj/XYgrcwLJcQ
	OTzuSiivOtEHltfbz819vbY1EdrIkMnWGYIrmLIa30G88d0JDvgGPSpLraZACZ7FX1wN1k2uS7bEV
	2/km1MyXfyrPF5qcKt1xw52vivpJRxrIked6Eei1HCqBq6YQ8Q389D6ChTtgXtsp4MDPwZGzZQ6XC
	IqzvHMF2k7tlZ/P+7GeqlG7rcu0vLR1E9xZZyb4yLlHNxt9NAlMjS0zyCPTP6iigJFqJ/dwjxa3Lb
	HOA5XzwwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLIX-0004fT-FP; Fri, 05 Apr 2019 09:38:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLIH-0004H4-29; Fri, 05 Apr 2019 09:37:57 +0000
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 094DF20017;
 Fri,  5 Apr 2019 09:37:48 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:37:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190405113742.184234ca@xps13>
In-Reply-To: <20190405091607.2dzckvyqibs7xmew@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190405091607.2dzckvyqibs7xmew@flea>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_023753_706543_C774A39F 
X-CRM114-Status: GOOD (  24.28  )
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
Content-Type: multipart/mixed; boundary="===============6800523696318162491=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6800523696318162491==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/vd++0sxM_TLpDiWu=l8Dxew"; protocol="application/pgp-signature"

--Sig_/vd++0sxM_TLpDiWu=l8Dxew
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
11:16:07 +0200:

> On Thu, Apr 04, 2019 at 06:21:10PM +0200, Miquel Raynal wrote:
> > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > is a bit different than with the older SoCs, hence the introduction of
> > a new compatible to handle:
> > * the differences between register offsets,
> > * the burst length change from 4 to minimum 8,
> > * drive SRAM accesses through the AHB bus instead of the MBUS.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++++++++++++++++++++++++---
> >  1 file changed, 68 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/s=
unxi_nand.c
> > index 4282bc477761..49cd5067adaa 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -42,7 +42,8 @@
> >  #define NFC_REG_CMD		0x0024
> >  #define NFC_REG_RCMD_SET	0x0028
> >  #define NFC_REG_WCMD_SET	0x002C
> > -#define NFC_REG_IO_DATA		0x0030
> > +#define NFC_REG_A10_IO_DATA	0x0030
> > +#define NFC_REG_A33_IO_DATA	0x0300
> >  #define NFC_REG_ECC_CTL		0x0034
> >  #define NFC_REG_ECC_ST		0x0038
> >  #define NFC_REG_DEBUG		0x003C
> > @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi_nan=
d(struct nand_chip *nand)
> >  	return container_of(nand, struct sunxi_nand_chip, nand);
> >  }
> >
> > +/*
> > + * NAND Controller capabilities structure: stores NAND controller capa=
bilities
> > + * for distinction between compatible strings.
> > + *
> > + * @sram_through_ahb:	On A33, we choose to access the internal RAM thr=
ough AHB
> > + *                      instead of MBUS (less configuration). A10+ use=
 the MBUS =20
>=20
> What do you mean by A10+ ?

I meant A1x, A2x SoCs. Not sure it matches a product line for you, so
please suggest something to mean "SoCs which are not A33" (so far I
think all worked without this).

>=20
> > + *                      but no extra configuration is needed.
> > + * @reg_io_data:	I/O data register
> > + * @dma_maxburst:	DMA maxburst
> > + */
> > +struct sunxi_nfc_caps {
> > +	bool sram_through_ahb;
> > +	unsigned int reg_io_data;
> > +	unsigned int dma_maxburst;
> > +}; =20
>=20
> Ideally, the introduction of that structure and the introduction of
> the A33 support should be separate patches.

Sure, I can split it up.

>=20
> >  /**
> >   * struct sunxi_nfc - stores sunxi NAND controller information
> >   *
> > @@ -228,6 +245,7 @@ struct sunxi_nfc {
> >  	struct list_head chips;
> >  	struct completion complete;
> >  	struct dma_chan *dmac;
> > +	const struct sunxi_nfc_caps *caps;
> >  };
> >
> >  static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *c=
trl)
> > @@ -350,10 +368,29 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_=
nfc *nfc, const void *buf,
> >  		goto err_unmap_buf;
> >  	}
> >
> > -	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> > -	       nfc->regs + NFC_REG_CTL);
> > +	/*
> > +	 * On A33, we suppose the "internal RAM" (p.12 of the user manual) =20
>=20
> Which user manual? It certainly isn't the A33 user manual :)

You are right it is the A33 NAND flash controller spec.


Thanks,
Miqu=C3=A8l

--Sig_/vd++0sxM_TLpDiWu=l8Dxew
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynIeYACgkQJWrqGEe9
VoT7JQgAnbw20yLfhshSpFrv+WX4hRMTD6hkwgSeuQQqjet8FEBQ8n03wLHS19cr
Pv3V3rrMuWVXw2BAjgs1i4hSn6oRxCZHAuKh2JAnSmMsHOCcliZ07w+kYuxtFncv
lLmWdrotkw/z6QdT0LSNevJCfmlFCe5Jy3XlxaTXgooREkuatOQCawU3q6bLFt4m
cRLBE6WXHuySpXmlj0p0MqkFOmIQz1EeSP+pYAgXK+557BnRrmY68wBUuS/zNY48
0RFytZsNvYHMgqLpqZxao23Lmv2Rg3S0b5DsEovVsvsbxVR6Nlcc96jMeSKTYxnF
qXs0fdqNNHBSXI6poDHlJA3Y4IJR/g==
=ph20
-----END PGP SIGNATURE-----

--Sig_/vd++0sxM_TLpDiWu=l8Dxew--


--===============6800523696318162491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6800523696318162491==--

