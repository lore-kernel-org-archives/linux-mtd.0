Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C82C282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B5720880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyu/gNEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B5720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uga+i3k0q5sPCZjY3C/EUQcFKbRt7IBBKW1QlUyo0xI=; b=uyu/gNExCeoacVo3RyW3rZQWy
	EveqG6C8DuId9keXnPglXZN9tftEH3XlMeKuSp+ZxRa2xPNbnxr6qWFg+fx0JNbZPAH07Vi0Fxf5S
	4l8qLt7FT9k52Das64F+8QyEI1pmEcjW2MMG1cx3UQMxBfsaGZE1q+fThSfbd+G5bMrZNlmO+1y8n
	HQ17G+MdbcvjVdlWdL+XG8ksu0F5cFucJORjSv+xSshq4AQnLX2huaOjHdVmJ6PphsEejG3OoFYZr
	stYv0d8mEx/IIDljmKNMRPBposV9MzJPSqPBqd7BoseoIQiUry07Ev0Gdb1YfpL2GNsgx3uxxRB4r
	nsIN0+ioQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPtC-0004UL-Pb; Mon, 08 Apr 2019 08:44:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPt1-0004JB-3b; Mon, 08 Apr 2019 08:44:17 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7E84260003;
 Mon,  8 Apr 2019 08:44:07 +0000 (UTC)
Date: Mon, 8 Apr 2019 10:44:07 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: sunxi: Improve A33 NAND transfers by
 using DMA
Message-ID: <20190408084407.7wauneg3wzjsqg4l@flea>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
 <20190408074147.26797-4-miquel.raynal@bootlin.com>
 <20190408084015.6iw74ub5ay6q73v2@flea>
MIME-Version: 1.0
In-Reply-To: <20190408084015.6iw74ub5ay6q73v2@flea>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_014415_377031_77189980 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Type: multipart/mixed; boundary="===============7760004539364420641=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7760004539364420641==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nrzlspwk2lkrapo4"
Content-Disposition: inline


--nrzlspwk2lkrapo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2019 at 10:40:15AM +0200, Maxime Ripard wrote:
> On Mon, Apr 08, 2019 at 09:41:47AM +0200, Miquel Raynal wrote:
> > In the current state, A33 NAND controllers use PIO during
> > transfers. Throughput can be increased thanks to the use of DMA
> > (mostly during reads, because of the ECC pipelining feature).
> >
> > Besides the usual addition of DMA DT properties, because the A33
> > NAND DMA handling is different than for older SoCs, we must also
> > update the compatible which has recently been introduced for this
> > purpose.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Applied, thanks!
>
> The rest is
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Actually, the A23 was introduced before the A33, so we want to use
that in the compatible.

I've updated the patch while applying it, you might want to do the
same.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nrzlspwk2lkrapo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsJ1gAKCRDj7w1vZxhR
xb6tAQCFytNO1wQYB2mMklz+JlqcgAGC0MQGJZNsg63QE75RUAD/WI8SmGt2IZbh
N9SXJSTVexPP7u9sovNL6dP9D3/BLAA=
=whwQ
-----END PGP SIGNATURE-----

--nrzlspwk2lkrapo4--


--===============7760004539364420641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7760004539364420641==--

