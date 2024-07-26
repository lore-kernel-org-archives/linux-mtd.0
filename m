Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494DAC3DA49
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2024 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkOk+vx5th4zyucZ/96rJT/jyGXAJp6Q8qKmzibqSLg=; b=gTuQHp0bx61pfvhAI13t+P1WgX
	T0PEASRCZGSEdnaakrzwbiQUIhXhbqo6LAdL1zSV4AIyLyF1IUnHAywnezZf/kKJ/r9Rl5K8+8bSJ
	9v1upCUaBZIyViEQ7ufAbL1eLgtwyOIeyu5lzPlDlC5FoGfhXQ5R1i0dHQoZO/5+lFYJcHjikI3jN
	ouU4mRTuQGMfF/RkCY5reLMnXMa5T7GQl97yo8/5KVAt9MsR2pcoRFl7fsKk0O0DdgdYH3PGdoAfc
	+1H1TWvXf2kyf4oW0knJiexAbKqTzZ61L8Thr7M0mG70qwAm1DAj5/8L8DNr5sEivtwHX84KMnFWM
	2fihuXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKUS-00000003w40-1702;
	Fri, 26 Jul 2024 12:56:08 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKU1-00000003vuo-25VP;
	Fri, 26 Jul 2024 12:55:43 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A8D4D3C3;
	Fri, 26 Jul 2024 14:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1721998530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=yzOx6oM1nG1syyzmhuVhnMa728h4vx7kNlsuELDiy+4=;
	b=YZdNMN0dE0uA7FnFXFdQTZc+gmQ70zEsvC94v1Q86rzibdNqDnJL5nrE5j8IB/b+AFTBzz
	Dt4IzhB9GH0pF8coLguAkhMykHFlDxsb7IQC+qSUYMRZcp5e5A77Zwq5byUEB5RusCBMwr
	7nlQc4/EIUzYkfbtqzGPcbrGikt6KKZioI14gpIIONVciaCFyrxrt33p0iZf5x4gZyx7YU
	U9OhZkBEgbYpE+W5LeXEPVV77ZZltUaVXsCYdDgDQq2CdX7+I45vXmnPFxI0vBpvf2FPAa
	fZ6T9AmMoYOvGazPddd7C7Lge7dhToJFuw15hwDu68RIEENxFamVE+FGrITgFg==
Date: Fri, 26 Jul 2024 14:55:28 +0200
Message-Id: <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>, "Simek, Michal"
 <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
From: "Michael Walle" <michael@walle.cc>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
X-Mailer: aerc 0.16.0
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com> <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org> <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com> <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org> <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com> <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org> <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org> <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org> <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com> <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org> <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com> <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org> <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
 <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com> <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
In-Reply-To: <
 <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_055541_778187_753D0D9C 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============9146428180485296060=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============9146428180485296060==
Content-Type: multipart/signed;
 boundary=3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Based on the inputs/suggestions from Tudor, i am planning to add a new=20
> layer between the SPI-NOR and MTD layers to support stacked and parallel=
=20
> configurations. This new layer will be part of the spi-nor and located in=
=20
> mtd/spi-nor/

Will AMD submit to maintain this layer? What happens if the
maintainer will leave AMD? TBH, personally, I don't like to
maintain such a niche feature.
I'd really like to see some use cases and performance reports for
this, like actual boards (and no evaluation boards don't count). Why
wouldn't someone just use an octal flash?

And as already mentioned there is also mtdcat, which seems to
duplicate some features?

-michael

--3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqOcwREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+OcUAX9IjhR2BCZQ3HqidzuFStguMrN9iUIuss1D
/ACvRq7kf2Zbxhm0mck1AjUfrnZR1eABf0SfkJW5GxxyiY5HbWtKSnCVoTuXKQTM
LqmzqtPHKs+pr9bhbYutKEnQZiOlOyW93g==
=jfd2
-----END PGP SIGNATURE-----

--3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc--


--===============9146428180485296060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9146428180485296060==--

