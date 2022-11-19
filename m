Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A04C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgpK4s/fu4LD20UfaxSC5F8eBrSPrAyTLJehIohwHeA=; b=h/AVGpjZBp3VbKgvWcPGPdSzE3
	IYcny3zs5kaR8nrrckHxcU4GbLv5/IbDeGjPArbZM06IDpW3YkGlYmXF7F9afIdDiuylECgZk51w0
	43j6kysbqJaL9fje+cq6itu8MsWp3HdqHBVl4OWysnWNFSbGvoSYAzHNV2nb0789gCUtxTpNW/BaX
	Rt02pOIKPDGVo9KTtkfHLUBnaLpYVI4n61PgEQf+ZhrbdgYAW1+Dmv5sfiXfRHBb8ggzK+mq+dWEL
	9NC9HMoNBuO0k7rtPOr5rXf64LO2DVdom9aPgnn/o3c74y4+Pu9lb3gCVX9icLr4ZduAndsDNro7r
	35CWithA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owLk4-00DE1Z-Vf; Sat, 19 Nov 2022 11:10:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owLjr-00DDyN-L6; Sat, 19 Nov 2022 11:10:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B4D3B802C0;
	Sat, 19 Nov 2022 11:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763BCC433C1;
	Sat, 19 Nov 2022 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668856217;
	bh=ene1SzTvsJEbW7r9yE4HzkF6rHfAR+aLIm+4UV/wgpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwWwg8hTEvU1lRotHevSh1bppQ+LWfLwM9aU/yyuaFSoeFCmSwjJ4hNXPYNKPqyxF
	 RwoQt69tGMzjEml+0YwDwVnLfETtKSINebD6ZDDIjJG2YZ26iP67zsjgz4cgG6uGnz
	 NeH6bx6FUo9hgiiy06aaBkM2k9pRw5peXY9fXGbpIdefsltNF4FVq05z66zkCjnicj
	 f/YnghTN3aq/ykMs6EmMfO5tnMvkQz4JaZBC1pmyIfU8l5HPFc7Qkk3nYySibldc2a
	 4zm4rXtEkUSkKLdGBy0DoGhHf7XI5Gph/tChnTnqwzMKjNhd3aisTxqnB1pP+2RhuX
	 Z5WZrjjMLqJaQ==
Date: Sat, 19 Nov 2022 12:10:11 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>, linux-i2c@vger.kernel.org,
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
Message-ID: <Y3i5kz6IL7tFbVwX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>, linux-i2c@vger.kernel.org,
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
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_031024_037343_15575F94 
X-CRM114-Status: GOOD (  12.77  )
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
Content-Type: multipart/mixed; boundary="===============4950680259862679576=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4950680259862679576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xRatB1/o2GNYTDWD"
Content-Disposition: inline


--xRatB1/o2GNYTDWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uwe,

> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.

Thanks for this work, really, but oh my poor inbox...

> I don't think it's feasable to apply this series in one go, so I ask the
> maintainers of the changed files to apply via their tree.

This seems reasonable. It would have made sense to send "patch series
per subsystem" then. So people only see the subset they are interested
in. I know filename-to-subsys mapping is hardly ever perfect. But in my
experience, even imperfect, it is more convenient than such a huge patch
series.

Happy hacking,

   Wolfram


--xRatB1/o2GNYTDWD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN4uY8ACgkQFA3kzBSg
KbYEfw/+L6nVN4bUDqiN6AeU0yv+Wq/oAFkIUgM8TLT/4gzeEwPsCcTwHBaHQFEF
sO9yZWukjVYlt2YlcEZglBVIAl7Ha17oQfv2HbWzZXl4cv8PEMfodh6PuOpcPuna
P+RjiB40nPPxUt5hZ7EjiOpqML0Xy9G8X9Uzs5rA4Yt2OSXcGSYhCZb+U/Vygwlo
VmLhSQhUnluCyhMZlbTn+bnmVCSHW8Bk5YBKOWygj8K7/LRYKfcNKXjMV35OsBix
3rezawgwT9KZlZ6ABJZ6U/o5Lp91OP/XeUfhMp76fmAOBcrh25HhWcunmbfRNto7
gsYho2Ov6yLtz3/Gq4gsDB2HULSajZW1behtfyfufpmkyGd8+C5+/uUjfltWtpqm
qaAL4YC+kjzarFDRKtIINCqlixjh0VUUKCkf6c4IDCNoLD4HW5KGevjvMvG0kJ9S
ftPKDwBpZ+cMZtpTcYgRQRiEb30VekQVyWM8SL+350sLO2dVhy7tjAX1jTnWZ843
4L3c6tSTioFtNmuIREzKl4EX2xkZUq6ajI4QeAcleHXAsBKHB5kvDpfKYIfGZ49X
mvIEEWRaUXGZAyqx2tMBXvuSA2aL+Gk9hrW3cvCHoBh6EkGfa6R4flw7yN0RkYHR
Fzq+Jpg1jOHfQhNDoZ8yqFo2xQZQpp1oDdVAjW70IRrE5KPvV0k=
=eSNj
-----END PGP SIGNATURE-----

--xRatB1/o2GNYTDWD--


--===============4950680259862679576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4950680259862679576==--

