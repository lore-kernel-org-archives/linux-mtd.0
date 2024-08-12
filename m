Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38600C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fzb5tcGls6nakiLbe8GxhmoG1Fwkv2YX1uoQ3RE3mPg=; b=wt4KJ3v7cFwjeP8J8DXgiiGC4U
	f5p3dmprYguiRANF8GqFwSrPrxAJwOHgA1g0qfOUjm1nlEHdlqsGj4abdahQnI6eOXgDq4RNAq1qp
	8RspXD9eXqbprEeCWeWroizZ9aFJU51Tsuc1tYG1fPhN4IlJd2+xBOv9tqTMFUlwd3ErzxY+Pb3ZU
	kv24GBJByRvTsZHecg2xQ3//LYC2DHyQAbKUPD3RYqcTlK8GlsbhBpbr/FReJWUobnuZkU0tJiOUc
	QWa01msQnOJywYBat+m20oZx68rhDmVRXgReKpc/0VVWyM8WG7v2RFF3l/JPDZQG+7N8zSR7JF98K
	YFMU6ivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdPcs-0000000HBEM-3sVK;
	Mon, 12 Aug 2024 07:37:58 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdPcG-0000000HB9t-2Tpr;
	Mon, 12 Aug 2024 07:37:22 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C68914E1;
	Mon, 12 Aug 2024 09:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1723448229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=Ht+N+M8B+B3kbQk5vj/Y5jdskCwHjTQjDHS8S8jMFoE=;
	b=AkzbjScU1M0U22mz4vNqG+wEZuZA/HnOzvtfYOhqtm+aoBv8UcPR5i8Jjo9f4pPNKLISN0
	cbD/rIQPlx3RlRIVHYJPIb02JPYmMWQmip92i8MaTaaXCDmDXPsUjZjh/sAUpkTjxZbMWP
	dbKftvKLPZ8qdGcu9TVUsqn/S3RCgj8nuMkWSLZhmQovHprJSJGJ9ciWKFEloMRldQ9O77
	f4JOQH5CB9/FvQm0DReuPOvHMF+bhOlVkuaZN1khj45m+vSoKgHe/Xo711WEHOQkuYw2oe
	y68AVBZ20jkEO8vgEMngqkWF5V1UAlfFo445YUFCNDdls+i1+3OO0Di5nMo93g==
Date: Mon, 12 Aug 2024 09:37:06 +0200
Message-Id: <D3DREP874QG7.2UOSZSBI3BRQY@walle.cc>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Cc: "Michal Simek" <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
 <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "pratyush@kernel.org"
 <pratyush@kernel.org>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com"
 <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
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
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.16.0
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org> <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org> <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com> <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org> <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org> <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com> <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com> <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc> <e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com> <D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc> <9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com> <D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc> <20240812092937.2bd5c85a@xps-13>
In-Reply-To: <20240812092937.2bd5c85a@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_003721_113008_54765F0F 
X-CRM114-Status: GOOD (  17.85  )
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
Content-Type: multipart/mixed; boundary="===============0453278750448477690=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0453278750448477690==
Content-Type: multipart/signed;
 boundary=223c054a831d10cf82c25ffa0250f24ef7d81ccf0ed949c366b87bf81bfa;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--223c054a831d10cf82c25ffa0250f24ef7d81ccf0ed949c366b87bf81bfa
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > > > The first round of patches were really invasive regarding the core
> > > > code. So if there is a clean layering approach which can be enabled
> > > > as a module and you are maintaining it I'm fine with that (even if
> > > > the core code needs some changes then like hooks or so, not sure). =
=20
> > >
> > > That discussion started with Miquel some years ago when he was trying=
 to to=20
> > > solve description in DT which is merged for a while in the kernel. =
=20
> >=20
> > What's your point here? From what I can tell the DT binding is wrong
> > and needs to be reworked anyway.
>
> I'm sorry I'm now catching up, can you point at the thread explaining
> what is wrong in the bindings? I didn't find where this was detailed. Or
> otherwise summarize quickly what needs to change?

Somewhere in this mega thread Tudor had some remarks about the
bindings. Amit also mentioned it here:

https://lore.kernel.org/r/IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7=
699.namprd12.prod.outlook.com/

-michael

--223c054a831d10cf82c25ffa0250f24ef7d81ccf0ed949c366b87bf81bfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrm7oxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+PctAYCbuUNxmdpx/X9rB1exzej6BdgcJkd3X4VZ
PwvBiJJJwfBXsF9QanNEeTL8VZQbzQUBgLkzbud/s0TfQrzHuMn9pAovYMF4/C2l
/lZ51bqyfaZad2v94+7DWWCbHWBW5f/7Yg==
=hWwd
-----END PGP SIGNATURE-----

--223c054a831d10cf82c25ffa0250f24ef7d81ccf0ed949c366b87bf81bfa--


--===============0453278750448477690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0453278750448477690==--

