Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5B1C3DA64
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwilaGKBNAijU/INd3unK1toS3oMFqVREAWhJLDllNE=; b=xRinFFJzrF64Dqpop6wZgY9QO6
	v0mu5i99NN1iB6J45ZIsm/N2iOm5RsKR+wpA+Y36fxkWiQH/QMNVqcQx+xC8a9sGKSiQ3aDXuksvf
	smugOywIz14JCWYaCsEtyJUlURNCEPrutd5axz8OxtYZZE15g/pFTWSTVO7SZCjCyXf+nmkQEZEXY
	PgPr0taUhsh2oCbLO//Ip8gch6XW0EAtrPdZhGezRDZWsOhhlCEBl8gomNaPkbAa+7hLeb0paHjzT
	2zUZ2n4GbJ0SwvPOo5vue38t47fq5s1xschMX7KMHSKi2hghKUKes2I56Z99t4Ol5ctYQiguh6dOE
	fOnAVeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5Ux-00000000T90-14yD;
	Wed, 31 Jul 2024 09:19:55 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5UI-00000000Sty-4AZN;
	Wed, 31 Jul 2024 09:19:17 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 254664090;
	Wed, 31 Jul 2024 11:19:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1722417543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=HprpdnPTmMpjlLpYTx/G5QGJKkhmU8L+PeKIYH3jtBs=;
	b=GF+4IjxB2TIt42gTk4Pq7iBvhsew8XFF/tg3hs4xxBp2l4el+lQQsXPhZvZFqqB+B/yaW6
	pzeQ2eS8abDXh6pdv1yxwcvJORltW5gNWTIW0M24ZEJ7ykvuKYGpIuVnXI7NGUsssc7EbO
	zsO0EbswGGZ3xx8mYRyGCm+PvftxCaOhhWWI18zvToFcWjLI3dI8n0hmd6FN0UblTS4N3g
	4KjFaPK/srzD4zY+qjD0495XF/PXdGoT4ddnA/+P/Ur9npBDCLkIoX8f6Yg1ZcNXm0ks7m
	tSJ6zIh9C1UpyhD0IJCKiR+s+z5RScfmnR3LiHAR8TWRFiVWsf33B8zZU3w3mA==
Date: Wed, 31 Jul 2024 11:19:01 +0200
Message-Id: <D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "Michal Simek" <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
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
X-Mailer: aerc 0.16.0
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com> <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org> <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org> <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org> <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org> <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com> <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org> <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org> <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com> <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com> <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc> <e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
In-Reply-To: <e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_021915_547117_399D006D 
X-CRM114-Status: GOOD (  22.73  )
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
Content-Type: multipart/mixed; boundary="===============7234976829108823714=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7234976829108823714==
Content-Type: multipart/signed;
 boundary=ca39702cffd96d931aee706a09ce1aa2ba1611296eda65bd78f72e98793e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ca39702cffd96d931aee706a09ce1aa2ba1611296eda65bd78f72e98793e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Michal,

> >> Based on the inputs/suggestions from Tudor, i am planning to add a new
> >> layer between the SPI-NOR and MTD layers to support stacked and parall=
el
> >> configurations. This new layer will be part of the spi-nor and located=
 in
> >> mtd/spi-nor/
> >=20
> > Will AMD submit to maintain this layer? What happens if the
> > maintainer will leave AMD? TBH, personally, I don't like to
> > maintain such a niche feature.
> > I'd really like to see some use cases and performance reports for
> > this, like actual boards (and no evaluation boards don't count). Why
> > wouldn't someone just use an octal flash?
>
> AMD/Xilinx is not creating products that's why we don't have data on actu=
al=20
> boards but I don't really understand why evaluation boards don't count.

Because on an eval board the vendor just puts everything possible on
the board.

> A lot of=20
> customers are taking schematics from us and removing parts which they don=
't need=20
> and add their custom part.
>
> But one product for parallel configuration which is publicly saying that =
it is=20
> using it is for example this SOM.
> https://shop.trenz-electronic.de/en/TE0820-05-2AI21MA-MPSoC-Module-with-A=
MD-Zynq-UltraScale-ZU2CG-1I-2-GByte-DDR4-SDRAM-4-x-5-cm
>
> I am not marketing guy to tell if there is any other which publicly sayin=
g we=20
> are using this feature but we can only develop/support/maintain support f=
or=20
> these configurations on our evaluation boards because that's what we have=
 access=20
> to and what we know how it is done.
>
> Also performance numbers from us can be only provided against our evaluat=
ion boards.

Which is good enough.

All I'm saying is that you shouldn't put burden on us (the SPI NOR
maintainers) for what seems to me at least as a niche. Thus I was
asking for performance numbers and users. Convince me that I'm
wrong and that is worth our time.

The first round of patches were really invasive regarding the core
code. So if there is a clean layering approach which can be enabled
as a module and you are maintaining it I'm fine with that (even if
the core code needs some changes then like hooks or so, not sure).

-michael

--ca39702cffd96d931aee706a09ce1aa2ba1611296eda65bd78f72e98793e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqoBhREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+FjVAYC5j+67h/KcneaPcQzec/oCTc8m829x/Zf8
EK35rLhdUySt8hQX8KGtzw5kcHwOdKEBgPjKd9pncip/3XoPQTsDQcLTz0R/NsXm
914ogzDCj82ep11eIYUq1UjdDpsyJWJMFA==
=QrXm
-----END PGP SIGNATURE-----

--ca39702cffd96d931aee706a09ce1aa2ba1611296eda65bd78f72e98793e--


--===============7234976829108823714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7234976829108823714==--

