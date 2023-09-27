Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA0E80AB8
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC3kP7kA/XnYyw+WHquuVS3LZtI28k4vgBHdnkcuPYE=; b=JyapENRKEBM//Btm4Lq5DKPuGZ
	mmxt+7PA1OTzL1HiVdIQpsFYEkDKVNpc9meQGh371UlmLnHU5e4+RgmvMLYKj79HzVSPI+QqQHcyb
	t0ciittR9DvRqGu8qZQURibDQXPJSdu9iy7hqUPSVOJFWxJxPJ8+FY2v7hkifZLPV/ZESo5Y53R1f
	N/si/UKuEpYryrFkwtLFAf+vr7bYWvlW24TZ6rwpOZ2IN6KPqc0Gh19gy5CnH4t/Az0hK3Jzdgs7g
	8Wfd+D23vJLQxiKQFSZTn9OcdOO8f0NPkk2M96cpPZWJWPCK722KpkRV77otqeJv3/Nt5iatYfbN6
	32Yy0/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVfa-0019FN-1I;
	Wed, 27 Sep 2023 14:37:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVfX-0019EQ-2x
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 14:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 933F961883;
	Wed, 27 Sep 2023 14:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2F5C433C8;
	Wed, 27 Sep 2023 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695825458;
	bh=qWF+NqYelJaQpG877EqA8MHQS8RmOQ1ooBg3CABBt3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASpyUfAFsBsIzxXjNqewgstlIRbwyJjkIJiEF7OUVKitEcngP9KaeVNwNY5gf5nhj
	 tkX8wRjXneezmd7BiMz2YQDOXZ5j2YeQx/E9nkkcwPn3Z1TZWxbj6j/WVkBAhbWOwI
	 VsutCdQHi4mbSjrfUxulmvA+/dIbycDiPqQ/sZgC/7qqq4SmfuWYs6wPQ9sLuHgUE1
	 AR4tEZm75LEaETW0KTsvKg6ik2z4WX0vK1Lf90MC6SA59zbXee+yKe4F9affzCol9+
	 n+4ZvVMMoTkpCMeERjAAzDKg62pIzRBlTzI/y0gTiRQzziqL2co+Ucw9+LfAR648qH
	 gHH6z2zXcwWBg==
Date: Wed, 27 Sep 2023 16:37:35 +0200
From: Mark Brown <broonie@kernel.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Winkler, Tomas" <tomas.winkler@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Message-ID: <ZRQ+LzIoD+J0BzVp@finisterre.sirena.org.uk>
References: <CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <0d60a78b-0305-4cb3-babe-4eefe5001b29@sirena.org.uk>
 <CY5PR11MB63667AB9958A23970B4B0D3EEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <20230912152102.0dfe7558@xps-13>
 <ee4a85be-aa87-4c40-916c-0a796688ad6f@sirena.org.uk>
 <CY5PR11MB6366427A8DD52D9B8B54F25DEDF9A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <1b93fffe-5aac-42f3-9bbe-a307758673cf@sirena.org.uk>
 <MN2PR11MB40938110726F81D8CE305FB8E5F9A@MN2PR11MB4093.namprd11.prod.outlook.com>
 <0682443d-5219-4aa2-a932-ee3e04c0760e@sirena.org.uk>
 <CY5PR11MB63661B36FFAE9455504DACD6EDC2A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY5PR11MB63661B36FFAE9455504DACD6EDC2A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-Cookie: Save energy:  Drive a smaller shell.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_073740_059451_2BD2A4CD 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Type: multipart/mixed; boundary="===============8546810985886968230=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8546810985886968230==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="frZJ4uuKAPwyznhl"
Content-Disposition: inline


--frZJ4uuKAPwyznhl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 02:11:47PM +0000, Usyskin, Alexander wrote:

> There is a Discreet Graphic device with embedded SPI (controller & flash).
> The embedded SPI is not visible to OS.
> There is another HW in the chip that gates access to the controller and
> exposes registers for:
> region select; read and write (4 and 8 bytes); erase (4K); error register=
;=20

So assuming that's flash region select it sounds like this is a MTD
controller and the fact that there's SPI isn't really relevant at all
=66rom a programming model point of view and it should probably be
described as a MTD controller of some kind.  Does that sound about
right?

--frZJ4uuKAPwyznhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUPigACgkQJNaLcl1U
h9Dztwf/dI2/2yh2ohlcjPRhimWVWsphQDwpbvDH73EC98Z0A1pqnhMEQNvjGP1z
XD16vP3s84PqWGtNhBdn9NNcK0+smsWDEUwQE+16+MQFhuAHvGl24h2WwsmBZ+8l
NtOcREhYq4nNrg0dQ70xDkb6pCecfEN79R6719yk8ryVOMBGa6LmSr3nKlcGeKCa
POiJS/5kcGr2rgi+2suhkSH56OEUsLbKFjOncZN0NPKCmlnf/kieirZTG9XfajjH
W988zzdRAe++RpgHFYFz2pZqGQ648IaexM2Weje2WGYKPKJslmyYaEf+Ru1hV8sE
VyA1NsixeALMQhIttr1yaAB8xzCTig==
=KXto
-----END PGP SIGNATURE-----

--frZJ4uuKAPwyznhl--


--===============8546810985886968230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8546810985886968230==--

