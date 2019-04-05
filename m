Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D3AC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:38:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF8C21738
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDtBRRbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DF8C21738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sAev6CwUVu/SliQqnIFUCZBgpePHvwNU4V5o0S8EpsI=; b=PDtBRRbchndeFwOlrwfwR//Lo
	Ojb7Wqo3MKF6DdEVNRt/BRD1NASY3EBg4Roujn3rHw+5nBUWt9GUW2tZVYHIoVcU9r5FPwtVkk3Sw
	WUUCu1k3+4d/Op4/Bs2zxQ3y9hbt4eFgzcQFVfPH9a/TN5sqy+OvZ4vpEpqxbAfU/pDvZm0Wuq74q
	Cd5g1YbET2/5d8VDMmNDKPTbfihhT3/UglukQTjJAVbHSGlvBqYkytlX9R6ThJwPI5J5vg2mR2XP3
	Mj53j/IzkRnCWyVr7sUIwKyaQbDiaZ35nFTbRdGHnbSsLibhrW5mS4georC2qbbyistrB4+Bj78y4
	npRLuNEVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLJ8-0005Cv-Do; Fri, 05 Apr 2019 09:38:46 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLIt-000525-KQ; Fri, 05 Apr 2019 09:38:37 +0000
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 73BAB1C0006;
 Fri,  5 Apr 2019 09:38:24 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:38:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: Improve sun8i NAND transfers by
 using DMA
Message-ID: <20190405113818.4dd5206b@xps13>
In-Reply-To: <20190405091807.itjp5uvsoqdfbm2u@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-4-miquel.raynal@bootlin.com>
 <20190405091807.itjp5uvsoqdfbm2u@flea>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_023831_823024_7204574D 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Type: multipart/mixed; boundary="===============4028677370355772689=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4028677370355772689==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/fJprKWxm.XYVgpO+/RDR/f="; protocol="application/pgp-signature"

--Sig_/fJprKWxm.XYVgpO+/RDR/f=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
11:18:07 +0200:

> On Thu, Apr 04, 2019 at 06:21:11PM +0200, Miquel Raynal wrote:
> > In the current state, sun8i NAND controllers use PIO during
> > transfers. Throughput can be increased thanks to the use of DMA
> > (mostly during reads, because of the ECC pipelining feature).
> >
> > Besides the usual addition of DMA DT properties, because the sun8i =20
>=20
> The only thing that "sun8i" means for Allwinner is that the SoC has
> Cortex-A7 CPUs. You need to be more precise than that, why not just
> use A33?

I am always confused. I'll stick to A33 then.


Thanks,
Miqu=C3=A8l

--Sig_/fJprKWxm.XYVgpO+/RDR/f=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynIgoACgkQJWrqGEe9
VoQR5gf/V1zoo50dot4Qi7vWluGfiJibRWvqen8W/jVwORD89T6jAO68MsYl1efz
Zpu0GQe2LiFZPcfQONosKIItiN/ulebusz9A718S3l6tNsbBSj3CX/6IUg9yiDul
ZHV/+YQG47pRojdCLyaA7znyxP3ArobygCidOcf2gOcQdU9jzsUXRT4P2PH7cLlQ
iUrraiJf0pSvagTWRCBqlVbjdg8Dvzu/EUNOqBu/0jZaDFrjILRGsSNk9VhqOkAK
7SjLYqPfkkMUVbyL9wPbKPZEc+0EUPxkqB05zkZheo0nwTIkhRgkEWhHLhCwuVhu
NOsZUrKouHqrka6P+kDxNCbGTbq9BA==
=HoTh
-----END PGP SIGNATURE-----

--Sig_/fJprKWxm.XYVgpO+/RDR/f=--


--===============4028677370355772689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4028677370355772689==--

