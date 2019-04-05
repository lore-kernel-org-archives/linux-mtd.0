Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C977C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC901217D7
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sSWNWJwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC901217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5t0QsgJdoYfWBemvGht9p6RnH1siPYYyPkNxAohrsk=; b=sSWNWJwjiZQqmMcBq6ne+OEaF
	RP+3d0n3go32rjd+K1kHKxi7iods7bUicM6Bj2JF7L3OmY2baGnaRMpYSP8MqqZIbMoxnV7Hc6klc
	eXyCCbvIvT64vspsnPJMOuWn2SZ4zyyW7ZYA/T5flRXzR8woAvtmASt2NHc4gPeHUbkv/8L6CvFOY
	PsNTikIO5vhK+mIq5vffjreE1doqffX8axj9V1+4IktuGStIPxZN4lmMeqg8C9SOnlLeahfjjkm2U
	BV7rr2wFlwqhDx6rwJNWbbf5KdJGdCjrnkmt8p2EH+Mawjjj7A4Jflb++cAs0qrHscFE0VooIkU4j
	MvG1vO57g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCKzR-0002NI-Pv; Fri, 05 Apr 2019 09:18:25 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCKzD-0002Ei-V3; Fri, 05 Apr 2019 09:18:13 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E14C92001B;
 Fri,  5 Apr 2019 09:18:07 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:18:07 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: Improve sun8i NAND transfers by
 using DMA
Message-ID: <20190405091807.itjp5uvsoqdfbm2u@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190404162111.22618-4-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_021812_150061_F716EA2F 
X-CRM114-Status: GOOD (  11.74  )
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
Content-Type: multipart/mixed; boundary="===============1934532333957232040=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1934532333957232040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zxt6af7sseqqtpzx"
Content-Disposition: inline


--zxt6af7sseqqtpzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2019 at 06:21:11PM +0200, Miquel Raynal wrote:
> In the current state, sun8i NAND controllers use PIO during
> transfers. Throughput can be increased thanks to the use of DMA
> (mostly during reads, because of the ECC pipelining feature).
>
> Besides the usual addition of DMA DT properties, because the sun8i

The only thing that "sun8i" means for Allwinner is that the SoC has
Cortex-A7 CPUs. You need to be more precise than that, why not just
use A33?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zxt6af7sseqqtpzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKcdTwAKCRDj7w1vZxhR
xUmzAQCKDC0g8ADDqtg9WA3GPGUGbhgce5qS43k7aWzTbWxHpAEAgjNT5JwA0RLl
xWiPemPjxbnMMuWdZpeP70lgk6jSCQ4=
=1KTO
-----END PGP SIGNATURE-----

--zxt6af7sseqqtpzx--


--===============1934532333957232040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1934532333957232040==--

