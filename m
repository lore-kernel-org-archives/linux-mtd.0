Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30162C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wmMX15b80Ss0OXNF2FXaRiIB/J+xHQmpNIV4K1ztus=; b=XmEUVZAYv5VSGCoWYQu8wfreGj
	/xOyMnHUATfi9ci88E64y65ArvVdC5AxEARufb+ddePd8dAqY9Xh/03nzBYDKesOHN3/YTwNAJ6hU
	T0/zqlwj9FHBrH2OZ6LYRyHiAeuvXRPVwozpR0bSlBSM2NJpA7Mc5UTuHNPccLoE1s05w8mAGOsGy
	tBS6BIhXhBOl7zfVvS1MSRB2SFSy98gQK9+JgCMS8BPkWguJwEifhJAnQpB6TPdJGgiCLIrt5qwS+
	zhy00xKqZQbzHGXL0aRRJFAp8Ha1n4u29yst/ktVadp4+1qydcuCYIlNXkt06L4vYDYmDRllwc3GU
	BFA23m3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sassY-0000000F5T4-2dkA;
	Mon, 05 Aug 2024 08:15:42 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sass1-0000000F5K8-36cb;
	Mon, 05 Aug 2024 08:15:11 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B62FE112;
	Mon,  5 Aug 2024 10:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1722845698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=5BjVyMLlxUNN9B+c+TnMQJMAi/0kH47F+XpZ7pZB+aY=;
	b=gGs8eCs06i5Bm0tao3zgmqnXZxRLfAVT9HCBeDdXP8vkxsjJE4j5FvUAbG369KAyjIHMT8
	BYZmNMlnsOqH+DonAHT8TCoFTn+Ra08pncLMz1OTv1uLPM7iP8q58ioWfZS7UpuTGeQ3T3
	dYTsDbzQzDlyjGGm4sqcAKDvGrsDWKnxE07Cje6GwTMwkYLQSieOKz9CWFpbT/+triyUps
	rcIAWsgWxg2rUaNBaNq+9zJgga+ZnL/xnA9jBKiHW/EbNNCUl4MiK99L+TOkg1Xaf7KGlq
	tm6wsSKL4cmLtNuXDq1VL+0txgqm/iXXj0O1yC1hOz5JTu7pYr9KsdAJli+GQg==
Date: Mon, 05 Aug 2024 10:14:55 +0200
Message-Id: <D37TTUBLTRVT.9J44JZ1DP06A@walle.cc>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
From: "Michael Walle" <michael@walle.cc>
To: "Frager, Neal" <neal.frager@amd.com>, "Simek, Michal"
 <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
 <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "pratyush@kernel.org"
 <pratyush@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
X-Mailer: aerc 0.16.0
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org> <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org> <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com> <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org> <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org> <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com> <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com> <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc> <e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com> <D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc> <9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com> <D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc> <c01d048f-ad8b-417e-8ff0-96f9252c87f2@amd.com> <CH2PR12MB50044242FE253D7B0E3425ABF0B22@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <
 <CH2PR12MB50044242FE253D7B0E3425ABF0B22@CH2PR12MB5004.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_011510_110618_3EFC8A12 
X-CRM114-Status: GOOD (  22.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1307649774989625442=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1307649774989625442==
Content-Type: multipart/signed;
 boundary=7dd7e4000aaf39ea05868ee56141ae02e60c588dac0a5b0688b30f1b385e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7dd7e4000aaf39ea05868ee56141ae02e60c588dac0a5b0688b30f1b385e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > You get twice more capacity based on that configuration. I can't answer=
 the=20
> > second question because not working with field. But both of that config=
urations=20
> > are used by customers. Adding Neal if he wants to add something more to=
 it.
>
> Just to add a comment as I work directly with our customers.  The main re=
ason
> this support is important is for our older SoCs, zynq and zynqmp.
>
> Most of our customers are using QSPI flash as the first boot memory to ge=
t
> from the boot ROM to u-boot.  They then typically use other memories, suc=
h as
> eMMC for the Linux kernel, OS and file system.

Agreed and that's probably the most prominent use case for NOR
flashes anyway.

> The issue we have on the zynq and zynqmp SoCs is that the boot ROM (code =
that
> cannot be changed) will not boot from an OSPI flash.  It will only boot f=
rom a
> QSPI flash.  This is what is forcing many of our customers down the QSPI =
path.
> Since many of these customers are interested in additional speed and memo=
ry
> size, they then end up using a parallel or stacked configuration because =
they
> cannot use an OSPI with zynq or zynqmp.

Above you've said, the bootloader is stored on the NOR flash and the
bulk storage is eMMC. So why do you need bigger NOR flashes (where
even the biggest NOR flash isn't enough)?

I also don't understand "the boot ROM will just boot from QSPI".
First, you cannot connect an octal flash anyway, because you only
have an QSPI controller, right? Secondly, normally the bootrom will
(at least) boot the first stage using normal (single line) SPI
commands. Is that not the case for zynq and zynqmp?

> All of our newer SoCs can boot from OSPI.  I agree with you that if someo=
ne
> could choose OSPI for performance, they would, so I do not expect paralle=
l or
> stacked configurations with our newer SoCs.

Ok, but then the argument with bigger flashes are void, because you
are back to be bound to one OSPI flash.

> I get why you see this configuration as a niche, but for us, it is a very
> large niche because zynq and zynqmp are two of our most successful SoC
> families.

Fair enough. But please find a way to support it without butchering
the whole core.

-michael

--7dd7e4000aaf39ea05868ee56141ae02e60c588dac0a5b0688b30f1b385e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrCKABEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+FYNAX9NIWR38ce9qJn6zNk09ma1XmS8x6pEwlyq
B9zfpWmszaRp5K+VrBhJPhG/hsHdCEYBgJOO6eD7uzRx54DCJJvPk/PtcUpV9fHS
uITq20JdXO5/9F2UNXphqdnMQ0F8FW7hjg==
=jmIb
-----END PGP SIGNATURE-----

--7dd7e4000aaf39ea05868ee56141ae02e60c588dac0a5b0688b30f1b385e--


--===============1307649774989625442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1307649774989625442==--

