Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A86C04AA7
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CNGbRf8EEqeIkGgZWFzaUpNoCIyWxIxU0RvwGqKcqw=; b=lk85lsYvYJX54TKzqIEGfln41a
	Jnl7mAx93OcWJqdECk1189yEelFUKyx2ibZG6J5ElxASAZOV7PEyxVc0VfWFL2xcUiju9tl8TrxU8
	kidAqU9GNKbnjdaDNiYwHaRJWR8v+p2+O84xntQ7KQjjvdFxjc2Tl5OgmYa9WZLor/hBkwxuoscwh
	5dfbqgCyZfFo7rr59D2lXCazfD//ShJUSs8tgpPmWcerV29ElSm7/snWsdpqND5SQobB/qz2fKgsz
	pNcl2UF3ltDw4couS9ruj6ZLX8kIRLWURytKEthhhpE70JTdQ4zVGxmhcYBENR0mpcoOKlFx1h7oz
	DzdMtvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizXO-003Z0C-0v;
	Wed, 20 Sep 2023 15:54:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizXL-003YxV-00
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 15:54:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C4108CE1B88;
	Wed, 20 Sep 2023 15:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820D5C433CA;
	Wed, 20 Sep 2023 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695225271;
	bh=Un0FVDI+pR+zb834Z9EX7gYghzxvVrZStdbLa2Osbuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ys46WLJBGUnm/y7RAH9tLK6IpJC5KOCHm1tvYoV6rWypLiUX6gtwYL+/kRoD03t2X
	 G3IyDR/q8lYQshWtf2gcClk2EgKeiEzZnOIHoy5HIqtYH8htf/k8gXutXxytxZOPwO
	 qPevV3+UKU+i2zho1lohdpsqCnbvdm2ObKf8FKdrLgm37UAZQ0/5FbNgBpBRWAhru0
	 taCY5RfN0e/52pNRjaIhFRws5dGDYo1fTW14hmyTD2OMS8oG9995hVuDucCj70sSgM
	 H/MNKB6XoIgb1u8cAgxOWzKIIZCJFE2NU4DWPLwhok0+NdoKInS/84J+YhZRwkv/H2
	 AR/YFUb6vFitg==
Date: Wed, 20 Sep 2023 16:54:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"Lubart, Vitaly" <vitaly.lubart@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Message-ID: <1b93fffe-5aac-42f3-9bbe-a307758673cf@sirena.org.uk>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
 <20230911094233.326fd936@xps-13>
 <CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <0d60a78b-0305-4cb3-babe-4eefe5001b29@sirena.org.uk>
 <CY5PR11MB63667AB9958A23970B4B0D3EEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <20230912152102.0dfe7558@xps-13>
 <ee4a85be-aa87-4c40-916c-0a796688ad6f@sirena.org.uk>
 <CY5PR11MB6366427A8DD52D9B8B54F25DEDF9A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY5PR11MB6366427A8DD52D9B8B54F25DEDF9A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-Cookie: Even a hawk is an eagle among crows.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_085447_411239_011F69EA 
X-CRM114-Status: GOOD (  14.64  )
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
Content-Type: multipart/mixed; boundary="===============4666694884048107704=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4666694884048107704==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S5LRfe/7bXumGJ72"
Content-Disposition: inline


--S5LRfe/7bXumGJ72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 20, 2023 at 01:52:07PM +0000, Usyskin, Alexander wrote:

> I've tried to register spi controller with a spi-mem ops, but I can't find a way to connect to mtd subsystem.
> I took spi-intel as example, which connects to spi-nor but it relies on JDEC ID of flash to configure itself.

You should use the normal SPI device registration interfaces to register
whatever devices are connected to the SPI controller.  What in concrete
terms have you tried to do here and in what way did it not work?

> We have predefined set of operations unrelated to flash behind the controller.

This sounds like there's some sort of MFD rather than or as well as a
flash chip, or possibly multiple SPI devices?

--S5LRfe/7bXumGJ72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmULFa8ACgkQJNaLcl1U
h9Ajuwf9FgmMqJxORVwccT0TdWZIXUkQ+yPI1Nk3vA22gKIqtlEa6vj6YaVuGUTR
LLFmvUSM3R/t/chkXl4i1uZu3bj9Vz6Pdvbxs4PKsR60F1UnDaqVduo86pygsV/0
rDpApJLpQM6GjRUUcX1EtYinSfIKp0GquXFPiPQA/hk4+zxCqSLsvkHECeYVwLon
QSKRy++dCliGQnNOKtSWwNk5LBCe7izGHMvcvjXhgbUGKRyFNgMWBEt3NDEQSN5b
QIVDTUvwiii1Ld1k7RS/XW2JtsOOyur+D7zEp15aSpNLfFu/KDWtWyNfML0/RNDg
cwuyRhv2LYsvj4MPCQWsExVCT1sO5w==
=j5mK
-----END PGP SIGNATURE-----

--S5LRfe/7bXumGJ72--


--===============4666694884048107704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4666694884048107704==--

