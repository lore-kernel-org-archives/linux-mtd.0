Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9989C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg7qIIT6jGrmAIKCvfgai2IfDbyhLnaYUDknwsxKETw=; b=FFulBIzre1XwKXaLuP+U4KaJ72
	7tWyiiihM6z6JCdqdGW1yzGT+1qAmew6Uawfm2t65jfCQbP/buOk4ZbYfgxdj5iY56cQdFNf540WI
	7VzcrUBNGvJW2MZP+A03M9p4+hL/ac5ZObCtGJUiMlbf+CI22CY41FQt1VRU+7m21Wvf98/y8Ey/D
	82ng3gg3Xpvhckg/8q9nhjiLf8PeWV9jGB9YcD59bqI/Ks1bXvHG7fjWKTZjfNxWweIXwGYgWPJFM
	I0sL9IQrilLIUm6EEVMKqzE6/FS88hiqjj27ymaB7gUSbNlZVzxgcPZu1+JtnepqnZsHL9z5mcy9k
	rQTYxpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrvJ-000Z1K-Di; Wed, 23 Nov 2022 15:44:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxruq-000Yv4-D4; Wed, 23 Nov 2022 15:44:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5BA2B8208E;
	Wed, 23 Nov 2022 15:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA89C433D6;
	Wed, 23 Nov 2022 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669218237;
	bh=StrD+dB5u8Vcvhdu1J0yzbIhWxVUSSaCEXA8q6qXH6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAcsGtHkQu0j8o/AsR1zQOSAMoHzYiGZzCNI192tK8toJkZFTEA0nHjzpVwOAki5W
	 56d4OXjCoFbrdSL8iyRal3OFHPP6pg859dn4/blZFzsZ6+n1KVl5o3AsCJIWfZV2WB
	 0UuOOMxX8k4XhCC8Uzw9P+V2Yzdj1gNie77riZ9riRgrYBVXGr9A0EDSKOaaprmppk
	 7BLFa/SUfGSrFTlEPOo0uHvvkIwmA3T0OE15sUzNsZ61/FJlN7P0k3CAIVwEsbYToo
	 H8WF/ULVWxmqPNEXqVK7PgU/gneXdXSopvxoaSudnfnHrqh31pfiNuZrpyXxqLhuXI
	 dfGICcT33p5AQ==
Date: Wed, 23 Nov 2022 15:43:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: drop redundant part of title (end,
 part three)
Message-ID: <Y34/sh0TQqyNOrZi@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_074400_605986_71F21731 
X-CRM114-Status: GOOD (  12.41  )
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
Content-Type: multipart/mixed; boundary="===============6017919090564413435=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6017919090564413435==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M0yaUN06E1HOYGuo"
Content-Disposition: inline


--M0yaUN06E1HOYGuo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:12PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--M0yaUN06E1HOYGuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+P7IACgkQJNaLcl1U
h9BvLwf+MbWgPhuuE/RNAOPtXpIBFmNsCUxYdu0csUjyJgNENFj+zdwqH6yI3/v5
sVYRJF6Ze/c9y1Pokpk0G+MobI3H0JfEA6zRId+Uxnf65RT46OZWAqStaZipWhR+
MqQJeau+/Wkq9EliMzXIY+Z1abRsNxFpOmxQfU6Kr85gGzubG6jqMBBQHSKS9a/3
Deso3bTySefdyuzX9lZss2JUAvomH8WP1F3J7w/FFiBXs4r+04kkd5sboUbL40Xk
9faUc2iAuQOUXtZ1O9P/qbpUmy+LhEMICPgGMN6SeU8G1af87tErxqa0p9c34Y35
t/bDc74sRhfEPZZhpmCN+J7XV65OAQ==
=yi41
-----END PGP SIGNATURE-----

--M0yaUN06E1HOYGuo--


--===============6017919090564413435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6017919090564413435==--

