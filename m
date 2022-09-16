Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99575ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 19:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0PAbZXHiM2Zm5r3V7b1s0ISXYR3crr3GiaWpz/W8i4=; b=FkH4VnaCGzfGgId2Z8isXpDgut
	qpHTuEIFJ6UJduL89CDhzL4Fp4mREcEblGBhIjdLKKXqcgg3c3aZ1PDevZ8pmvtUim97FY+7VThut
	TEBN66YgQDj0JN0X9cne6uIfm3CS3AC0qjlY1CVDUefL9BXwohvCjvMPw44UQBqoMHj+mJnF0HmQ3
	t+kVrYTRHcGF0a0CeR45cZYqYidQfipYqARcjwu0WPKNKzLILndw4vMQck1W6+L07AWwNsKsuZKSB
	eutwDE9Tn1XcBE4pXpTWzj/X5zMwb7/jSIKJi8BTZmvQ6TOW3fy4PITfR1x4mtMkErR5kBOwBxVfr
	F/Eeirhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHSy-00GU7D-KC; Fri, 16 Sep 2022 19:57:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHSk-00GU0f-Ea; Fri, 16 Sep 2022 19:57:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 590A5620F0;
	Fri, 16 Sep 2022 19:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2545C433D7;
	Fri, 16 Sep 2022 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663358240;
	bh=vCLtuY1TpVMliumE5DbT2WWZvJ7/teLjaPmFO/zeNJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOX0u1Ga5jI3fyqBR9wRY7ly+OLINlk+lX+/BsGejMs60jVRDL8sIKqdSt3XILF3S
	 3K8SPRau6FUTQjVtbE6TEJNBmBOBPcPVQXi8OX57u4C0HVoKJPkMEEJ00ksU2lEwGs
	 eneNMJ1+ZnjxnQkCh/cvuyCe2+sDYCEoDJMO2dCn8QTVKtHj5HclYZhNhoQ3rUjl8F
	 tLS/O8FsgwubYS4qOpznp7bdKsC95dfNfY+vQCoCjDHNxc5H6XhL91QFFlfKlKIRzu
	 6tQdmHN/uGcOz3u/YXt0EebKPWSOF1vo6zXrc1qJQEZh8QfmRKs6RTMPWgVqS4lGYT
	 5hmw0V5iFK+MA==
Date: Fri, 16 Sep 2022 20:57:18 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: kever.yang@rock-chips.com, sjg@chromium.org, philipp.tomsich@vrull.eu,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de, ulf.hansson@linaro.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	gregkh@linuxfoundation.org, broonie@kernel.org,
	wim@linux-watchdog.org, linux@roeck-us.net,
	zhangqing@rock-chips.com, jamie@jamieiles.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 02/11] dt-bindings: i2c: rockchip: add
 rockchip,rk3128-i2c
Message-ID: <YyTVHph1bCF/gfjL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com,
	sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
	ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	gregkh@linuxfoundation.org, broonie@kernel.org,
	wim@linux-watchdog.org, linux@roeck-us.net,
	zhangqing@rock-chips.com, jamie@jamieiles.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <405db21d-154e-fed0-7524-ace1cef0203c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_125722_585949_47D19B78 
X-CRM114-Status: UNSURE (   8.80  )
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
Content-Type: multipart/mixed; boundary="===============4504787011886048747=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4504787011886048747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vbp8ZsxZHEPG+tBR"
Content-Disposition: inline


--Vbp8ZsxZHEPG+tBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2022 at 12:02:30AM +0200, Johan Jonker wrote:
> Add rockchip,rk3128-i2c compatible string.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied to for-next, thanks!


--Vbp8ZsxZHEPG+tBR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk1R4ACgkQFA3kzBSg
KbY8YxAAqkmITIjJchmw2BH4eehoxFiSAW8VYh6gojn2S2RgQjSwZsHnR8E8FMIu
eUeROZH0Wd/Mihi8hLz9Fm3/aTSxUss5Zj2hzFr2RGOHqsicHtx622HwdTakfM08
6NFWuuBya9tGX4iujN+oQsnI1NA8mDPNEIE8tMEh1wBzOY5m/ijAJLIALJ/cB/qj
4MGIK9aKg9PfU3nSd0b+9Dn7iZDClo6CnBeKCAHhUeF+DoKzdLsl3FQzNtcIxS1+
+NL48AB8Kst01hfZHKpuUriTDT2lXfBeQi5NEKNRyc+1fEWBshPat1tYRlEfs9BA
WAHNZkh3q8qsSDPh2lufGmmOhuX3pUumWAwHfHgbZksNtPj5ldSTXhUciPPHeufb
Rf+Ne4WaMMX4JOJJ70wMKn+ycaJYRulfiOacroqTqTH7rSX+NuioTEtITA2KMa3q
4WfMmHrJe3qLPhEkLXabhrYwMcAWkHaPDJ6dJJbHfxRtR0F8y0DMpyJrCRsF9TcS
+8Hqcq+y5bxc9n/eDxSrSQXXoEQLBFjGeJfCz4D+n6oOWv/6dxMe8dZyU7vq/Ea8
0DApwW0esWTGZuuV5r2xmncP/4+spn2C2FCOI1ZqCPs2T3Kd7DPBEMPnp7UQRZFO
cVkNoe0c0N9yQjMEVi9+aqqDWefE6imYt3d3PXqcHEYoHYqHON4=
=t7C7
-----END PGP SIGNATURE-----

--Vbp8ZsxZHEPG+tBR--


--===============4504787011886048747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4504787011886048747==--

