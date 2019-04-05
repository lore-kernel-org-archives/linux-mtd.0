Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40924C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:56:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F40217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GRGsQoS8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F40217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/3b45veFKV+w0vPrDCY8CQRGlH01biNk0Vax9dCI2Y=; b=GRGsQoS8UGJ8OVSRJ7LAa068q
	QzotiseQxCd2kEzQ0WbkjZ8uc3ibqVv++xmhRaRxwz+mYHi1DER5/TuY3Zqzi7BeDOXgRkm5xXIE0
	O80wM8/di429oIszWnWVTdiPeaSZS4sDAxuANXx+u25JAxFg7zLOlWTv/B2Qm+ArQidPLCvcCBhR6
	1TufJfF4wozIIGqidnUPVLNU3xupYroeBK38H7StrdCMvuJ2jK45A6a4EJ11hAWkqeAYWe5q7vM79
	IMDrg6zFp4rgeZkh3zLWUabxdGzHwwdvrIyTlg7GMrVtmBccWzaPk0/nSXsmdNxknoRsJF0c+0xEX
	TW/QeNoNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCMW9-0006Fz-V9; Fri, 05 Apr 2019 10:56:17 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCMW0-00067e-3j; Fri, 05 Apr 2019 10:56:10 +0000
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D0C1E10000A;
 Fri,  5 Apr 2019 10:55:59 +0000 (UTC)
Date: Fri, 5 Apr 2019 12:55:59 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190405105559.sqdhoa54ne7l4svj@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190405091607.2dzckvyqibs7xmew@flea>
 <20190405113742.184234ca@xps13>
MIME-Version: 1.0
In-Reply-To: <20190405113742.184234ca@xps13>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_035608_455443_305D2E3B 
X-CRM114-Status: GOOD (  22.98  )
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
Content-Type: multipart/mixed; boundary="===============4031375942314718214=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4031375942314718214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yfur7fxwepooyuj5"
Content-Disposition: inline


--yfur7fxwepooyuj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 05, 2019 at 11:37:42AM +0200, Miquel Raynal wrote:
> Hi Maxime,
>
> Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
> 11:16:07 +0200:
>
> > On Thu, Apr 04, 2019 at 06:21:10PM +0200, Miquel Raynal wrote:
> > > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > > is a bit different than with the older SoCs, hence the introduction of
> > > a new compatible to handle:
> > > * the differences between register offsets,
> > > * the burst length change from 4 to minimum 8,
> > > * drive SRAM accesses through the AHB bus instead of the MBUS.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++++++++++++++++++++++++---
> > >  1 file changed, 68 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> > > index 4282bc477761..49cd5067adaa 100644
> > > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > > @@ -42,7 +42,8 @@
> > >  #define NFC_REG_CMD		0x0024
> > >  #define NFC_REG_RCMD_SET	0x0028
> > >  #define NFC_REG_WCMD_SET	0x002C
> > > -#define NFC_REG_IO_DATA		0x0030
> > > +#define NFC_REG_A10_IO_DATA	0x0030
> > > +#define NFC_REG_A33_IO_DATA	0x0300
> > >  #define NFC_REG_ECC_CTL		0x0034
> > >  #define NFC_REG_ECC_ST		0x0038
> > >  #define NFC_REG_DEBUG		0x003C
> > > @@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
> > >  	return container_of(nand, struct sunxi_nand_chip, nand);
> > >  }
> > >
> > > +/*
> > > + * NAND Controller capabilities structure: stores NAND controller capabilities
> > > + * for distinction between compatible strings.
> > > + *
> > > + * @sram_through_ahb:	On A33, we choose to access the internal RAM through AHB
> > > + *                      instead of MBUS (less configuration). A10+ use the MBUS
> >
> > What do you mean by A10+ ?
>
> I meant A1x, A2x SoCs. Not sure it matches a product line for you, so
> please suggest something to mean "SoCs which are not A33" (so far I
> think all worked without this).

The list is pretty small, so we can just name them. That would be the
A10, A10s A13 and A20.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--yfur7fxwepooyuj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKc0PwAKCRDj7w1vZxhR
xUIkAPsHjjcpWcz3SEiKc81Acr2w9YZPgxUkjws0K+WDTYn6cgEA+x8itrphUkN9
VvATo4mA2v5yHHel0t3VX3zWHf2HUg4=
=HOQK
-----END PGP SIGNATURE-----

--yfur7fxwepooyuj5--


--===============4031375942314718214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4031375942314718214==--

