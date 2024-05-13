Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F0C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrr0H8/9M3UsiuRylI/D3rf6eEWXOqtaAabPAmgSYow=; b=pXhtpy+kYTIznsJzyig1KBY4eg
	X9waeL6jizZvgEMte+gYnO7Y0G+0oFrRffk5swF9mtpq24B8jkXuHHILZ3/e6OcLQxsRTKxKPPOUp
	ITMB4GCicg1qgTetTLyfxoCKG0EPMaE4K6o39ePVKVm0pbOOKLPj0BGcFPZiXTuC4JNOYShocj6Li
	DvMRkFo0CYyf2RxBXG4GaMQWx31eMhRM6ITyMX+FAEsCTkk09qrtdn5sAY0BHJdqXGxT81KOv91Rv
	qLmwimClMrIuWtUp7/o9CKSby5aTh29vxA5g/VOtEusIODjxtRB2VNVjQ/8ayEntcrNSvoBtNSTXj
	nELnat9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qb9-0000000C8Z3-39zv;
	Mon, 13 May 2024 07:59:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qb3-0000000C8W5-2XKT;
	Mon, 13 May 2024 07:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DE4060C58;
	Mon, 13 May 2024 07:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86DDC32783;
	Mon, 13 May 2024 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715587182;
	bh=wvFY5C7KnIUWngjEubPKtJkMfV486jqserq7eRMaVVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4WPjdpAVW+TxaxkAz6L/Rbf+aQyR+EQ5zHzk1w8QwUnm7ekYI9C5ISCzVfuekf20
	 vGgRqORbQhiZvXcbiU72Hp/LNaSoiw2wTtoQUxdMqzY/pvRD52C4H+HO1sCk/ix5m6
	 FGz23YHCLqmSxXfIDVdlAE4Ksi7xDBuq6UiTG3C+0Z5RFQwWU8NyPCAPCLq5E5AODj
	 eNcff4Vb4JCZ97cyR47OM+vUQDReH/l7eA3teXH9JGMV4TKEf7bO33TtO55hgN4vnT
	 krtYmP06detrmO9S/gKudLrWXS5TCKrTlEoyQkyuiu6AIPgkSchWjYW1RQClsYOdFX
	 ZtxW1NSBxIptQ==
Date: Mon, 13 May 2024 08:59:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240513-timing-snippet-38983a6b3e2f@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
 <20240513095504.37776289@xps-13>
MIME-Version: 1.0
In-Reply-To: <20240513095504.37776289@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_005945_778233_F0C603D9 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============7973170199248336538=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7973170199248336538==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ejuqGmZ1Bh+Fj8SZ"
Content-Disposition: inline


--ejuqGmZ1Bh+Fj8SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 09:55:04AM +0200, Miquel Raynal wrote:
> Hi Rob,
>=20
> robh@kernel.org wrote on Fri, 10 May 2024 07:30:14 -0500:
>=20
> > Add another batch of various "simple" syscon compatibles which were
> > undocumented or still documented with old text bindings. Remove the old
> > text binding docs for the ones which were documented.
>=20
> ...
>=20
> >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
>=20
> I don't know how useful are these compatibles, but if I take the case
> of atmel,sama5d3-nfc-io, it is only described in this file, while
> several DTSI reference it. After this change they will no longer be
> referenced at all but still in use. Is this intended? Shall these
> compatibles be totally dropped from the device trees as well?
>=20
> $ git grep -c atmel,sama5d3-nfc-io arch/
> arch/arm/boot/dts/microchip/sama5d2.dtsi:1
> arch/arm/boot/dts/microchip/sama5d3.dtsi:1
> arch/arm/boot/dts/microchip/sama5d4.dtsi:1
> arch/arm/boot/dts/microchip/sama7g5.dtsi:1

atmel,sama5d3-nfc-io is added to the syscon yaml binding in this patch,
so it's a move not a removal, no?

--ejuqGmZ1Bh+Fj8SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkHIYQAKCRB4tDGHoIJi
0kjhAQCywBkItTLslLEIC/Q3Nmz+t/xZFgyPQcDxhpgIFVh/xwD+L7u6ZYa12INM
yYuvsouRgrYM7F0I+RsI2qBAfMNdDAw=
=HwQ9
-----END PGP SIGNATURE-----

--ejuqGmZ1Bh+Fj8SZ--


--===============7973170199248336538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7973170199248336538==--

