Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48796C001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5R7MrCixnjIOihf8cut1EP2GdxjKy0KrvUnGq8HCTY=; b=otR/eG07uGD/2UyHRySXnBjpQH
	oYSDQv3MT8Od56VLbhnCZwIGyyCn6raR7momRRqcAElpdwlmlWehpv8M4BoFS6pTVL5PcN+/vPuyr
	ypyKIXktBvwpZSICounac0JxLX7lcwXzT4dauuSnYik8xE624cYlfi43cEh6/n3xluCZPB13NtU03
	SL2zsC1/8BtLEnPBoMLPMXqDBZw9wohSWkJogeoGxfjimojx/QvdTzsxx6zW6oPe0avq0w0JWTgH3
	41zKABZMaKzrrwNA9GUH+Da6VezjtIzKden+mZ6GhmVQIHqRvM1uJMVlWWZzISA3pyh24stE0bj4L
	T3fBVkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPjo-003ubJ-3B;
	Fri, 28 Jul 2023 15:50:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPjl-003uZc-00;
	Fri, 28 Jul 2023 15:50:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8AB462184;
	Fri, 28 Jul 2023 15:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C90EC433C9;
	Fri, 28 Jul 2023 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690559439;
	bh=FnMFqj/s49TzaM6yfmyNpQSSy8bKQ5ugm5trajmOYB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P35iWrPTULn82aCR/saWbIvbhgW9FBRWLcm7T6831r1mxA0XYv+wihRnJ+bpe/h3j
	 SQI3nQMltLvs9348RcuJx3yB58okKZtFAr67/yunNdLCTQ2ZAlpKy0CNnGvyQUq65x
	 UrAO5Epy3B3om7fYqnjZtzYBwh45VSZ631NEvGXKAPrDQSjTxJAjUh1rN7eW+yXxHJ
	 eLRbo5WOQNZFnIGkYWrKLd8HdNhtbK4c/sT60Vc/9pvTSwX0j9KuCzgDlonRK7extE
	 8tHwl7EsCsHE8lDYNbtsAppmrzbvldMf2em+uOSVDgypVZkFhhh5VSQPOOlCZKdviU
	 v1FgZjXrTMz3A==
Date: Fri, 28 Jul 2023 16:50:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org,
	lee@kernel.org, ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linus.walleij@linaro.org, sre@kernel.org, p.zabel@pengutronix.de,
	olivia@selenic.com, a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
	richard.genoud@gmail.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net, linux@armlinux.org.uk,
	durai.manickamkr@microchip.com, andrew@lunn.ch,
	jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
	alexandre.torgue@st.com, gregory.clement@bootlin.com, arnd@arndb.de,
	rientjes@google.com, deller@gmx.de, 42.hyeyoo@gmail.com,
	vbabka@suse.cz, mripard@kernel.org, mihai.sain@microchip.com,
	codrin.ciubotariu@microchip.com, eugen.hristev@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Message-ID: <20230728-floss-stark-889158f968ea@spud>
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
 <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_085041_140617_AFF9E1CB 
X-CRM114-Status: GOOD (  17.81  )
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
Content-Type: multipart/mixed; boundary="===============6219732721262536138=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6219732721262536138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Z+IvU8OCRbt7H1L"
Content-Disposition: inline


--1Z+IvU8OCRbt7H1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 01:32:12PM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2023 12:22, Varshini Rajendran wrote:
> > This patch series adds support for the new SoC family - sam9x7.
> >  - The device tree, configs and drivers are added
> >  - Clock driver for sam9x7 is added
> >  - Support for basic peripherals is added
> >  - Target board SAM9X75 Curiosity is added
> >=20
>=20
> Your threading is absolutely broken making it difficult to review and app=
ly.

I had a chat with Varshini today, they were trying to avoid sending the
patches to a massive CC list, but didn't set any in-reply-to header.
For the next submission whole series could be sent to the binding &
platform maintainers and the individual patches additionally to their
respective lists/maintainers. Does that sound okay to you, or do you
think it should be broken up?

Cheers,
Conor.


--1Z+IvU8OCRbt7H1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMPjwAAKCRB4tDGHoIJi
0t3wAQDbx8dLxPQPnIoDByHTBcuDjvFBZTpWUg4bhE01/+BpfQEArGia1WutY/7n
UhhVDqMheWjj/xZNVFl/ZTTiVbw1vwI=
=NVNa
-----END PGP SIGNATURE-----

--1Z+IvU8OCRbt7H1L--


--===============6219732721262536138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6219732721262536138==--

