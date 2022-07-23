Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CFDC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a22Lqsv7glIoS4VR0te4e9GTSu7giA+Z5UT/FTsWtJM=; b=3FRm2oUO3w9Onr2h7XjTUQto4u
	pf0Ddhoyw2n8XOwEhydL9n6arev60IYm8k6MRSCu88XEtDm/QpznC0CAs5v/+Cuv7i2EIrnTjXtjE
	vhUM++PAk0xuFT9pNVQ0IMWax3vNfXL05UMp+lKYi9VGzouVwNGmcPvI4fW6a9BcESuLGlkbbupZm
	xcP9fG9YYrVQUaw4ne+zQRd1i9MXma5uduOUDWdIlP5ZTwBN4ec4jacJurZHyWqQMdyT7+SmUsHX6
	iuK/uPVxA1tQcSiYzxxnR2hBkX1z6fZH3YL1P2VkHtc0QoIQqgR8FHshNgVGWEA0AaIOpjchkbmrp
	9EZPEA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFKmn-006iF8-R5; Sat, 23 Jul 2022 19:27:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFKml-006iDa-HA
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 19:27:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3608460EF1;
	Sat, 23 Jul 2022 19:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A7DC341C0;
	Sat, 23 Jul 2022 19:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658604452;
	bh=ZbgxQl+rg3lKvC7krfve+T2jrFIJNpWda+6LzKO5bVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYfTItcNNWxzBrd2FdZDyCAXbhBbBfRu6EzxX5X+STOAA/Y/i0EoAlW9TYLCmUhp5
	 j92DwmQLLnTL+z9beMk2cPqFaFWxw96Buz/TlW12WDm2X1c8xFEVhUqkLhA/hJ97qF
	 Sthq4TF8XMIIJrw99MSMgs2FYhcRhEAOa88kw+tufLbCE7Wvo6cWt/hG+F2ZH2jMeq
	 WAWi0Vhr4OgaV8diwe6XHa5F6gjUl5UebPE9nHjKzc6dAhfKafMiSUSDcMI5BGn31F
	 SHSB1SGr+T248fdxtS2BoLvAe1iW99KEgwswGV2wKRa7hSR5yQk7BEqQbt4JxdfvM6
	 onT5zTynAQeIw==
Date: Sat, 23 Jul 2022 20:27:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Yang <reimu@sudomaker.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Zhou Yanjie <zhouyanjie@wanyeetech.com>,
	tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
	tmn505@gmail.com, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
	aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
	jinghui.liu@ingenic.com, sernia.zhou@foxmail.com
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Message-ID: <YtxLoPOykLDTzTn9@sirena.org.uk>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
 <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
 <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
 <d1a0dd15-3621-14e9-b931-417cefaab017@linaro.org>
 <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
MIME-Version: 1.0
In-Reply-To: <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
X-Cookie: Necessity is a mother.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_122735_647456_1443AE3C 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============9171025987880141643=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9171025987880141643==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TbMQOSOuune2YTJx"
Content-Disposition: inline


--TbMQOSOuune2YTJx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 24, 2022 at 02:47:14AM +0800, Mike Yang wrote:
> On 7/24/22 01:43, Krzysztof Kozlowski wrote:
> > On 23/07/2022 18:50, Zhou Yanjie wrote:

> >> No offense, does it really need to be named that way?
> >> I can't seem to find documentation with instructions on this :(

...

> > All bindings are to follow this rule, so I don't understand why you
> > think it is an exception for you?

> Zhou didn't ask you to make an exception. They have a valid
> point and they're asking why.

> You may want to avoid further incidents of this kind by stop
> being bossy and actually writing a guideline of naming these
> .yaml files and publish it somewhere online.

Yeah, I do have to say that I was also completely unaware that
there was any enforced convention here.

--TbMQOSOuune2YTJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLcS6AACgkQJNaLcl1U
h9B16Af+OB537q2iAFHtuzDZyT8beLFm5e80sPm2/JK6DK39SDS56/LU25TuqiQo
JICSdChsFLOntnTc+3yLvssDYmtu+9niHfjBbG3zbA4IU7n2tH5zC8ks0BZnHG1y
Ca58/ofXK99lB5wPUVB7eH9ccEVPfQ03/Ezb7gD435htmmn4ZBV3idkJkhezOxG/
kgEJDtu7iJiaMNViADXs2AHGyCrAcgRSJKAtWByb1e8Cguh+CpuLKR6kzbs+IDGp
fnCzAS4YOJmZGAO0P7mc4789Bxy3+v4s2mJSaZWRD2UGIZllBcoLxyWDtgAKIGB0
FNxFe0cCP1mEKNoLaxf1rLh4gwlkZQ==
=bYHr
-----END PGP SIGNATURE-----

--TbMQOSOuune2YTJx--


--===============9171025987880141643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9171025987880141643==--

