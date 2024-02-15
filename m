Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF99C48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGmGSve3A3sm2Y7heBr5Jb6RGwZCtrV4BgkvWCfNHhs=; b=aH2D8HtVo2dsG3fa2YMTOSJrl8
	TH/iCkhg6GO0aouTyqud754d/Px0n1vuFtQOuGIsBjR8SanKBPq4RtV+IyyDL2ZK0ihH4Lw0H4KLl
	h0IkGEyhzSIlV6/Mctcbx9viLq1xoD5yRG584Q5HpblR2/SGR2kY35JFMXoMNFs5nAcD0jEZwxjxD
	PHMNtu/UzvEVln5HkhjA8YeYL0fvVqP5ZXHjtnSWGGSbjqGP0oUjUworJKkS6EnaZexhPt9JPYOg9
	+w3YfaOHsmeUOV4Of1H3kEInn5qeT+gSsAGbi7dcJNMrpx5gTTp2Yhpulr1xBZsdJndvH1KCq4IsE
	qopWk4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafIF-0000000H84s-26GS;
	Thu, 15 Feb 2024 17:13:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafIB-0000000H840-0c2b;
	Thu, 15 Feb 2024 17:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3694BCE27B2;
	Thu, 15 Feb 2024 17:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9E1C433F1;
	Thu, 15 Feb 2024 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708017176;
	bh=pk5Mt+RImQXUgBvMKAZepH41L3RMj9FKexYkzEU54nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRi71hB4J37HDQh3t1ZfohcSCokTMBTIWFlXk8unUCZGAcnbgcFAYuiLZDhQSHFXj
	 hxT+sMSSa2T7IKUkyx7sMVbr5h3zjN/ggkblR69V4kg7xZzVEX0XWnHoIpww+EM64f
	 A/IKw8J0A4lekCriXehJQD7MMFAJLD5unYXKPBQw7v1i5jMUSFLktChLwDH/olDmr6
	 CSUZZqPuqBvJ7A4Wk6rpL/Vmhtlp2D1ikj2A+r1ja3TPU7uhZn0ER6svRLkWUeWRSX
	 tp1lzO4k5PRCYHeyCQPLN1SV82Rn1Ywh92tYhNObqXrzSMmHq0Ei9DTSfRNleeWcss
	 5jDYkHp02pV+Q==
Date: Thu, 15 Feb 2024 17:12:50 +0000
From: Conor Dooley <conor@kernel.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"zev@bewilderbeest.net" <zev@bewilderbeest.net>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH] Add eSPI device
 driver (flash channel)
Message-ID: <20240215-probable-gimmick-83d5dcbc4729@spud>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
 <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
 <20240214-yoyo-platinum-dcd0e7e16a22@spud>
 <TYZPR06MB6640F82C539F0B17BCDCC55E914D2@TYZPR06MB6640.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYZPR06MB6640F82C539F0B17BCDCC55E914D2@TYZPR06MB6640.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_091259_561112_319282AD 
X-CRM114-Status: GOOD (  21.10  )
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
Content-Type: multipart/mixed; boundary="===============3494119693595254560=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3494119693595254560==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jYXpxHj7B0OPYCKZ"
Content-Disposition: inline


--jYXpxHj7B0OPYCKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 01:56:00AM +0000, ChiaWei Wang wrote:
> >=20
> > On Wed, Feb 14, 2024 at 11:34:31AM +0000, ChiaWei Wang wrote:
> > > We appreciate that you are willing to help on the open source contrib=
ution.
> > > However, please co-work with Aspeed before submitting drivers of Aspe=
ed
> > HW.
> > > Otherwise, a misleading driver on the community are going to bring to=
ns of
> > customer issues to Aspeed.
> >=20
> > It may not apply in this particular case as Aspeed did write the origin=
al driver
> > and it is polite to work with previous authors when respinning a patchs=
et, but in
> > general there is no need to work with a hardware vendor before writing =
drivers
> > for their hardware.
> >=20
> > Blocking a driver because that company might receive more support reque=
sts
> > is not the kernel's problem.
>=20
> I agree with that and Aspeed will not refuse to support.
>=20
> However, in this case, the authors, IBM, and Aspeed already have discussi=
on (at least 4 times) before and foresee "issues" on practical eSPI SAFS us=
e.
> If there is already a known issue of the driver, why ignoring the previou=
s discussion and push it?
> A compromise is to ask for driver renaming to espi-mafs to avoid confusio=
n.
> Otherwise we need to explain, again, why the driver does not fulfill the =
SAFS expectation.

To be clear, in case you misunderstood, I was making a general point and
not about this particular patchset.

--jYXpxHj7B0OPYCKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5GEgAKCRB4tDGHoIJi
0q6qAQCwK7ClX6/ipMYZ/2VmkvC0xZdaAiUrt57wlJ0DcnoxoAD+OADevy96or/y
yayrHHRwjY2W37V1/RxOp8h0jhl17QU=
=71+s
-----END PGP SIGNATURE-----

--jYXpxHj7B0OPYCKZ--


--===============3494119693595254560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3494119693595254560==--

