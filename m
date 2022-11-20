Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D98C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epBCODGxzZHrElPffa6K5/U15E6+C8fKDVzWA2/APcs=; b=uHpPzGMT+MCQMvV6+BYfnMK5hz
	ZbN3zMgVrvgU8/cNil82xXWb/1DEUnlyKzwOrpRp8ronqIa9QK90E75+VfMl377h/Tw0285XuK+QC
	h8fzzkHAOl2qEProHSJH0NulrdxgsSlYAh7/t7LEz5nvJ1ymnIfSE77p72WkwSYIjWw0VAINN3Qsn
	wpROoKfgnHSqbrNG2tk1Dx4PK1DfR9e0tjtt+tUR5gzowzebeO0tlXh0FCUypgWZDtzVOg5GkSaBV
	0+KGd4FYH409w5k7CLZYhl//cVIA1u3o51II8AKbhbnA8D7Ep3ZQD0jHlkhNvTC0XPT34exfDcudB
	C7/r0lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owqEW-006S2b-Bg; Sun, 20 Nov 2022 19:44:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owqEJ-006S0Q-9j; Sun, 20 Nov 2022 19:43:53 +0000
Received: from mercury (unknown [185.209.196.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 981D16602381;
	Sun, 20 Nov 2022 19:43:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668973425;
	bh=T3nU7r4TDRBfUE21qBPtx6/vbbqNd5aTZrUhEKVEpe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTDOl2wCVRsu/tyZH+YPJZtqzX+lTk+zyDWIOt7B5OERtVQXV05JqgkECzvZaxhvq
	 GWHynwzbAdTGjQc4EiizPb4JzuNJErOOA6MGMcIE1OOBJsR2nJxdyKqik4rZXW8I8S
	 YL9hLYJH9B0qYNlv0ofE25pkedfO3Zr0ukRr6nTWoiYIF0ElBn0uG1ehB/KKpnJkB6
	 LmHZCe95IKsjPugXIHsbUyR3TPbe/Uz/FTgEe5YV5fHfIiRZ+dwYB8lU4/MgAmu4vM
	 BZjO4bgM9A0wAKu6Ub+wy7zE/lgrgtzyeA/1iFwakjmg/vd8UL0auYvToqpQCZqsxv
	 +Bmg67/Ow+Rwg==
Received: by mercury (Postfix, from userid 1000)
	id 1C1D2106F223; Sun, 20 Nov 2022 20:43:43 +0100 (CET)
Date: Sun, 20 Nov 2022 20:43:43 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-media@vger.kernel.org, patches@opensource.cirrus.com,
	linux-actions@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <20221120194343.nnpzhgjapep7iwqk@mercury.elektranox.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_114351_723441_100BDE05 
X-CRM114-Status: GOOD (  18.95  )
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
Content-Type: multipart/mixed; boundary="===============0937421818757153461=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0937421818757153461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wvm2z6appxwdd5fa"
Content-Disposition: inline


--wvm2z6appxwdd5fa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 18, 2022 at 11:35:34PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
>=20
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch t=
hat
> you can pull into your tree to get it:
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client=
_device_id_helper-immutable
>=20
> I don't think it's feasable to apply this series in one go, so I ask the
> maintainers of the changed files to apply via their tree. I guess it
> will take a few kernel release iterations until all patch are in, but I
> think a single tree creates too much conflicts.
>=20
> The last patch changes i2c_driver::probe, all non-converted drivers will
> fail to compile then. So I hope the build bots will tell me about any
> driver I missed to convert. This patch is obviously not for application
> now.
>=20
> I dropped most individuals from the recipents of this mail to not
> challenge the mail servers and mailing list filters too much. Sorry if
> you had extra efforts to find this mail.
>=20
> Best regards
> Uwe

=2E..

>   power: supply: adp5061: Convert to i2c's .probe_new()
>   power: supply: bq2415x: Convert to i2c's .probe_new()
>   power: supply: bq24190: Convert to i2c's .probe_new()
>   power: supply: bq24257: Convert to i2c's .probe_new()
>   power: supply: bq24735: Convert to i2c's .probe_new()
>   power: supply: bq2515x: Convert to i2c's .probe_new()
>   power: supply: bq256xx: Convert to i2c's .probe_new()
>   power: supply: bq25890: Convert to i2c's .probe_new()
>   power: supply: bq25980: Convert to i2c's .probe_new()
>   power: supply: bq27xxx: Convert to i2c's .probe_new()
>   power: supply: ds2782: Convert to i2c's .probe_new()
>   power: supply: lp8727: Convert to i2c's .probe_new()
>   power: supply: ltc2941: Convert to i2c's .probe_new()
>   power: supply: ltc4162-l: Convert to i2c's .probe_new()
>   power: supply: max14656: Convert to i2c's .probe_new()
>   power: supply: max17040: Convert to i2c's .probe_new()
>   power: supply: max17042_battery: Convert to i2c's .probe_new()
>   power: supply: rt5033_battery: Convert to i2c's .probe_new()
>   power: supply: rt9455: Convert to i2c's .probe_new()
>   power: supply: sbs: Convert to i2c's .probe_new()
>   power: supply: sbs-manager: Convert to i2c's .probe_new()
>   power: supply: smb347: Convert to i2c's .probe_new()
>   power: supply: ucs1002: Convert to i2c's .probe_new()
>   power: supply: z2_battery: Convert to i2c's .probe_new()
>   [...]

Thanks, I queued patches 513-536 to the power-supply subsystem.

-- Sebastian

--wvm2z6appxwdd5fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmN6g2YACgkQ2O7X88g7
+pocPA/+MG7rp45xJuAH0zlIFTM8ovBviXnLvra0hpvK+vMB8SVdh4K8vRCAoeoT
lxML9oRVfhraHzo/3X6+7V87cw+QzEx3GZbYsIasGqic46MoFYkbA2i3Q8s8hS5y
qpAcKn/efXJaBtdIxWQnOc0xU0YCiteiIik8Idb9MjHFupUspLxtIjCzTAmvKQ0k
hJ5u5cqv3d/MP6VpsOCUYPDet9nS9ByPeg8Kr9Ux1a0WEldPYUO+dU0ObqRdhliZ
agftaEtCvFYkfO9k8ubBL/x00gTn002xOB7gp+5s0V0D3wKfT5EPVYOoUZbeYMIu
QOZaLHkNkBtV85kGm18h7IFdQZQY9ahcaGTYZplyz/YzHlK/AlfjA2umKS1+rs5m
A+DDqnAkuWw9fLg0MJ4dLSPwOSPX3VfgmVS3By3Do2gotQkCqXsRdhrG1cIoE1aL
AZYpSwLTn2rAYF59poL3rgSqx/MhgrLwmKQOH3fjwZ3R7PIAWFhYP1We2UtKdCEM
Gjpr7QfAUiOuXDKi5OrBbWr4m2eX26A4uifwR62OyldwH8pUWAq3umgkw3rotQAA
hdwOOPM+cHTyLbtP8kaP1XSR6u0ybuTbw8OQE/XPDNVceoMqR4XxUSYbs0Q0UzY6
fwljGfbakuGbaNlb7s2LBsy0ESZuiz64Za/0gfJhI5rP1eNRR1U=
=Dh+o
-----END PGP SIGNATURE-----

--wvm2z6appxwdd5fa--


--===============0937421818757153461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0937421818757153461==--

