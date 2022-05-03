Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25B3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROJRRshv+5/+YyRRPDXuVikfOYIkaeN/aerf5Ut3BXc=; b=xR6DD4yRftHx2CQS/5V0Je3qg9
	24cWmCJa95Wy71LzYkwPOhWo4YfjNxJsiIsGgsEsEQ8GFNL818PykaPJov8hCJqMFfYVG+HLhJmbN
	RXgdJgzw6rmZ0PilWOBAneUGSW8BG6Dp9kKB5yH36pcRVppg6ljGikqGaC9do197NYYRnG4qjAjOO
	0JvlG8e8gUCxsWqoNzBZZqpge75Dt5Cg+VjiZQ7VALi4m3IZ/hVgezWbLpCw1/YaFZvGxqc9qlvo5
	0v+gu0H6lC0CckJLVS10Vb5LQAegT6QFPK1qdjKfOYKx9iPG/I7LCN8VIlZd+AG9+qtGrmZlzHyBC
	99fx87WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlvbb-006mye-UC; Tue, 03 May 2022 16:42:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlvbZ-006mwl-Q4; Tue, 03 May 2022 16:42:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9812561772;
 Tue,  3 May 2022 16:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCEFC385AF;
 Tue,  3 May 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651596146;
 bh=RdmnwE+iucpL+/8qT85xaKQLpnn8IQBlp7A0PPpBkjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MBuAO2xSVQR0Es2Khy87In4R8Y100/OP9420inSPVtGjNodMGqIXGDeoQHgu0zdtp
 ZSMtkeQgwnC2B29WSRQCYL/O4jCHnME+f80aw4Fo5XWoHHVCVGx/BOqioVIUben+m7
 dAMycifIRkxwmDNlXwHi1GwZNR0O1uzfUUGAcwMMFdw8KhKSWf9AkZmD379wvLv9fh
 Uaih7P0/38fdDXOhFQTx4yM432rKEcsSGfyxP2ivUAyVZhwEsQe0HLwzNoIPwQXGpI
 dxuPOzqD0QB+YJpXI7AwZY3EEZfQI0H8Fxh83x1xt1dkQXlECEzWDKnz//DiA0KIY/
 DnUedifNgT+/g==
Date: Tue, 3 May 2022 17:42:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Anson Huang <Anson.Huang@nxp.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Han Xu <han.xu@nxp.com>, Dario Binacchi <dariobin@libero.it>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <YnFbZaARRe13BqEU@sirena.org.uk>
References: <20220503162738.3827041-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
X-Cookie: Drop that pickle!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_094229_958641_B3E3E864 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Type: multipart/mixed; boundary="===============1402886367647464035=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1402886367647464035==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ie5Q9u0aDDvYlHNh"
Content-Disposition: inline


--Ie5Q9u0aDDvYlHNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 11:27:38AM -0500, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems when 'items' list is
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.

Acked-by: Mark Brown <broonie@kernel.org>

--Ie5Q9u0aDDvYlHNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJxW2QACgkQJNaLcl1U
h9AhOwgAgCQAzTimr9tUAEV2YxMIwidmRC9yH7j14TLxr45y9aG5gyGDcabEWvNT
1G+vE5DtD9PAsO0tkipn9eZam4zgKttaLGOTql3iSuyYP4IJZLz5B0UQdfH/Rblq
lwN3vZgGQIDC0Bq4GZFntPO4DgtMJRUjLYBkqZ9VRrAc0BtdLx0s2eLXna86GqsS
JRPrW4CqJ9evXkLhz4oWrns5IFYbbkZQBRDahnYbYEShXBVarN07FHDyJR7e563l
wHOqrXEThke2dA9JPWeaBTp7h9SiE6UhFUpzyFAd9YF+0t0k3slgr1oj89o28M6t
855bZNK3+42p+Ytiewlr25+J4xL31Q==
=Z4ML
-----END PGP SIGNATURE-----

--Ie5Q9u0aDDvYlHNh--


--===============1402886367647464035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1402886367647464035==--

