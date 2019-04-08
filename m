Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D86C282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0BD20880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JW0tVlX0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC0BD20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6mBEEvb1isgyCG0ExhNN8nuGCFBi/qlhUPaNvTjsHgg=; b=JW0tVlX06xK5cbc7YM3sQGxnN
	MaXWGT+ZYkXm5V+OrbHK8WRLK+JGcyefYwskEvHUQHRYWkww1PF7mhRcRdu3ZOXfan9h2xRgy5nEv
	3vmFfj0NsxQn09m6GvdnAuuxA5ggLXmqMY+BunlLJBhRYXQnf1501wMLjaV51LdypDuNSDPHSHSmO
	/R0w3TvyIR1VL7tgWQFkcIWv3bya1yWLO8czyXCKrEI40zkQvjlNBLjN6GlwD/zrW6zfM4rVPuEvJ
	13/ZyxxoFODOlikk5V7K2QPa5Qu0s1EwkF0CRbIvPBX7glzmqGUyoQejTpdsvW43wkcAPoJcD2Bi4
	2hdpf7XKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPpZ-0002qt-Gi; Mon, 08 Apr 2019 08:40:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPpE-0002MM-UG; Mon, 08 Apr 2019 08:40:23 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 569F41BF216;
 Mon,  8 Apr 2019 08:40:16 +0000 (UTC)
Date: Mon, 8 Apr 2019 10:40:15 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: sunxi: Improve A33 NAND transfers by
 using DMA
Message-ID: <20190408084015.6iw74ub5ay6q73v2@flea>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
 <20190408074147.26797-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190408074147.26797-4-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_014021_577556_75AF5382 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Type: multipart/mixed; boundary="===============9194434035805216143=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9194434035805216143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4v334xptnbawb4e"
Content-Disposition: inline


--l4v334xptnbawb4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2019 at 09:41:47AM +0200, Miquel Raynal wrote:
> In the current state, A33 NAND controllers use PIO during
> transfers. Throughput can be increased thanks to the use of DMA
> (mostly during reads, because of the ECC pipelining feature).
>
> Besides the usual addition of DMA DT properties, because the A33
> NAND DMA handling is different than for older SoCs, we must also
> update the compatible which has recently been introduced for this
> purpose.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied, thanks!

The rest is
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--l4v334xptnbawb4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsI7wAKCRDj7w1vZxhR
xfJBAQCyiU4fGQ/u3wNkniYvCVQT9Nx6ofTiHrLhW8PTWWwr4wD9GdmqZLVM3/HK
tvkvK5R/x68kflFbe/dhdEoXf21s7Qk=
=QTXJ
-----END PGP SIGNATURE-----

--l4v334xptnbawb4e--


--===============9194434035805216143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9194434035805216143==--

