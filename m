Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23EEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xi2h/6Whvr74svcYx1nAZXmdRcV/jbKYnC1vvVjbDUo=; b=pOy8x70eSpkX9Rj81V+KOfc/7E
	7I9sv2RBqFBM4tZeDlxEBLGcThDYCFGneT7SPYYn35cTaul5T72h/rOOG0xtF/uFg01nzVU5Hal8c
	DOciWzDRmIEg+xSV/smzrkRQBGwqlXzidvTPcBi2VqH2qa3pcHsoo85aFm3Wrsr69tOhcWq2Wx1Wz
	Fx94IxDM0cQbTG/yGVE8bUhZN8OZv9Zul8iHjYrRQU96nPbIzMgPXQOlYKUHPu9bIg6E0f2rKKIGB
	1KvjRMoOTFmMx1m1y2BKXOoqjOwX3pKeXt5pNDwXHJ6tqZFe95iactVX4dLyolbK+NpYO/AUDl5/d
	qSi0mDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOoDN-00EGmp-I5; Mon, 28 Feb 2022 22:09:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOoDB-00EGip-1I; Mon, 28 Feb 2022 22:09:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F5AEB8169A;
 Mon, 28 Feb 2022 22:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D10FC340EE;
 Mon, 28 Feb 2022 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646086180;
 bh=C3m4pnnTAF+o+8Z+tsT22TMwOAoIvmDl7rQIHuiLdMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdRbVBZNF8SyrlpXKAsHjo1A6k3f944Uzsh5hy2UmK5ywn8cPtoiWatoTWpomjQzc
 x44Jv7/Wzxo8T+fSgsmyLRYgbKXOQkqEy86p/ln+HE5A679Zvs+XoyM7aJWc8wSHt6
 ACqagutJzp7I7JrJGyMxpDRREGY/HUyTANKgF4FJ/99jkm+o2X+/pda0xDuvY8MbdY
 Sv4Zfi/zQD1hFPf6GsOnP6lA5hiuplekt76UNCcR1YonNLI47HOJfCmRDkLAT1NcBE
 yuQHyRRcOkNLJGUq9zBF6RREf+bF8FScygNYfOz5OBENPb041Vfalb0bt696k7uf4U
 g+dDDXgOJFcHA==
Date: Mon, 28 Feb 2022 22:09:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Guenter Roeck <groeck@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh1IG9daOUOB52rf@sirena.org.uk>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-Cookie: Killing turkeys causes winter.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_140945_264493_12C8CCD7 
X-CRM114-Status: GOOD (  14.27  )
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
Content-Type: multipart/mixed; boundary="===============0798301222104188882=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0798301222104188882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xC2AwCckB4yHmCdp"
Content-Disposition: inline


--xC2AwCckB4yHmCdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 03:38:02PM -0600, Rob Herring wrote:
> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
>=20
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.

Acked-by: Mark Brown <broonie@kernel.org>

--xC2AwCckB4yHmCdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIdSBoACgkQJNaLcl1U
h9Brnwf9Gb7P9H3jku9OngoretGUxGN4DtDmr+0Bvk7ZZFkSIVQYVBROL0mmUfer
wPLiKHS48VJM6irhxRMqHLa1CrIeAmJHZpkg0R1JH1Iw36fWPZiBTfrDG8qubOti
l/cEx7Jmxoj2EtB8xcTpbYGqwOqSZtDkAz1smUIh3coKzArwCPjkAYE59GjQ28SS
F+P6ze1awYqRh/vkZC5ge03hrBhxOKU1iVyqv4iRfWtwCXRxYM3aPTs4aLB/T0NW
svINogVRgGsGVmY7gRufv1wI7bJle7+MP7byPwsqzx2AXthe0fYt3x457mV59wjc
Ej2pLNgE/IiOKyZ8gmWU8kkWHOh2hQ==
=Hxgn
-----END PGP SIGNATURE-----

--xC2AwCckB4yHmCdp--


--===============0798301222104188882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0798301222104188882==--

