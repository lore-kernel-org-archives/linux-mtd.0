Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA16DC5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJl0NDSWmY0OrGEyXxm+icLbpZXygr7dTwXqiDAsS1o=; b=2bOSl2yGjN+5++uAB6yscn+ta0
	yGXEKvOgj439McNu/yKfNWoUVuK04/R7qWTWVE0/0Eap02O5zti+O88js9/9W30TBCHUv0xxuDtpb
	epAYxBbnDQLpIsIK4qQM0gJrWz3bNDD78ohzeryiKUOa6vbTBFrFxzm+u9wnE+bmpp7aauP2ZIZn4
	jSYQHrZC20XzPSsd3E8kUhchsITzjs7P34Hoo/OYnWTc7ySG6AaMBaPzCDlQNT6qrkHBvn0+lfGhR
	m0w52oGHhCdNMkcwFr1YFKAWutRxaVOxETwWzjXr1qK3Oo7FPqfKVMCZFfTSug8yeMmJWulwBv3NN
	BxhOYwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZ6-00000002S1a-25Ri;
	Fri, 14 Aug 2026 09:51:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZ4-00000002S0R-1UmF;
	Fri, 14 Aug 2026 09:51:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id B1DA6600C3;
	Fri, 14 Aug 2026 09:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E38DB1F00A3A;
	Fri, 14 Aug 2026 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701061;
	bh=pQa8E3J70a58uouK5ZkY1naDcDQ5smvxZfhEol9rE9M=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=KzLugo4WAv7+Ac2UEJewO50+TB/otxAhNWeAR2k4F8XKL3cfgh53jEp6cMidQBGb3
	 XU/5vDLJDNZH5xxlCLPS/xozSlQEDPcao43BfsNIt9r1gjRxIKLDiEd3HAEGMrgE6Z
	 4iVQt9qXIasTBT/QlA4zylocy9Bb8ueh/uDiJOy9ZPPx8AibfDva1mKgCfDsCWmVq9
	 TZZl5Hg3wuaMvI44y1ZM4yoqyOmryZv23K04WDg3IvF02V5zIuAFToDMe4rfu+O8I5
	 A4i6kb9edJ9As4kEW/D5fhYUMs4cG5cQWG27uo6sD0MrUcfWmrVuibXK6nNmDlvEjg
	 XJWOJ8FAsP51g==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:50:57 +0200
Message-Id: <DKOKNYMTF9LY.3OHC0QB0DW0BP@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 16/23] mtd: spi-nor: winbond: Add support for
 W25Q32RV-M
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-16-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-16-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============1155259135694888972=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1155259135694888972==
Content-Type: multipart/signed;
 boundary=4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lARIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gKGgGA6n+bSsT0/0zeF/p8j6ZbNmEKMg8Yl0qP
t/adABc19/jvP7zCgdB/x/0qm5VLEqljAX4tZnakfmhHSuGxuT1qKMgbUTCcAYfU
0LbteIWgxV8++yeaVEviAaWigpICJoLRPTI=
=XqCC
-----END PGP SIGNATURE-----

--4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72--


--===============1155259135694888972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1155259135694888972==--

