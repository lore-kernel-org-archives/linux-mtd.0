Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85879C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:13:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6BF217D7
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDBdZy8l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6BF217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3LxJf78zXupOzi+7m+23ozk/+N4bMp4mRU9dMd9fuRM=; b=ZDBdZy8lRaSI/3Q+JQtIq+3WY
	VSnWbTtUIb7kKPAR3hMlREUocdedU0kQfkVOxTZevkBu+zzGXryGBwuNpIhnllaVUDjZrFHqNYUa+
	zRFa0KSUNv/tpumJBTOCOHD6h0+X0P43pFIJwMSgS2MRjQL6fCWj/NR1xTYv1Oo+nFEN29uec9Nj7
	dxVcAckvzNMDQZJSCpBv6015Peojnqhush1zDUggtl3W6V1qFtkLzDmwxup+XL9pZ2SdgW5BP1k4H
	lB97rQV+ASikQPITghQWqgtDJvLRR0FHNnlZl+OBmqy8y1unjR2Km6D+ac9zqml8YZXKFgjIIjpkx
	844ZYm6Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCKuS-0007yt-Fc; Fri, 05 Apr 2019 09:13:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCKuJ-0007qm-Az; Fri, 05 Apr 2019 09:13:09 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DBE1A20006;
 Fri,  5 Apr 2019 09:13:02 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:13:02 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: sunxi: Add new compatible
Message-ID: <20190405091302.mz3gox5jvoy3ygjr@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190404162111.22618-2-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_021307_527782_DB87C66A 
X-CRM114-Status: GOOD (  20.85  )
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
Content-Type: multipart/mixed; boundary="===============1007753370519996950=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1007753370519996950==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n5ypdkjqsjaubm4k"
Content-Disposition: inline


--n5ypdkjqsjaubm4k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Apr 04, 2019 at 06:21:09PM +0200, Miquel Raynal wrote:
> The A33 NAND controller is slightly different than the A10+ ones,
> eg. DMA handling is a bit different and a few register offsets
> changed.
>
> Introduce a new compatible to represent this version of the IP.
>
> Also append '-controller' to the new compatible (which is required for
> new compatibles) as this is describing a NAND controller and not a
> NAND chip.

Out of curiosity, why are you requiring that suffix now?

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> index dcd5a5d80dc0..6128d41d8c59 100644
> --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> @@ -1,7 +1,12 @@
>  Allwinner NAND Flash Controller (NFC)
>
>  Required properties:
> -- compatible : "allwinner,sun4i-a10-nand".
> +- compatible : Must be one of:
> +	       - "allwinner,sun4i-a10-nand"
> +	       - "allwinner,sun8i-a33-nand-controller"
> +	       The former may be used by all IPs, however sun8i family
> +	       will need the second one in order to make use of the
> +	       internal DMA capabilities.

I'm not sure we should have that statement. We have no idea whether or
not this can be used by all IPs *today*, and we surely don't know
about the one that are going to come out.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--n5ypdkjqsjaubm4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKccHgAKCRDj7w1vZxhR
xa80AQCcHxhF219b8x6s7hM0Ssg6zRuiugU4hDaSXzomyl/k1gD9EAt1ela1CmX7
bglrHBGB+HKxRtLtyx5bUWp7SecAoA4=
=c303
-----END PGP SIGNATURE-----

--n5ypdkjqsjaubm4k--


--===============1007753370519996950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1007753370519996950==--

