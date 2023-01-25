Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80F7C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 11:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQMERO6mGSm6//NuqzZ6Nu3/85TtirLzzhRLn7c+5y0=; b=iLBW5u11KQZYXJ5/vzA1ELLFhm
	wk5vqQYPAfAZ23rMEy+Qs811KVU2fIgo7lmjzXguSFhrpSUdxUK6ICSwVGUv8t57+zTzJ2IcqVe+L
	zNTLSuq9uw8Ckidkhc6rW5DKh3dCzJGw7QI1ynzZIh7z+HYBWevVQAplyz4oKI1hP3ihg8jkZjv44
	zIceWoezFGFksQIVIYDuO0jQ5Rvxc5fBqLR75TTM9UF7eCTVPsFXbwJIku+9soxKZ7lJke+VuSBZQ
	7M34hfw395Q1Zv8oQ9QE4rjSIRHWd1LrpXHBdCOqYj0dQu/X8+N7Vz3PIrgCY/T1Rixq1zqvDzZd0
	O2aIPxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKeAE-007CTB-0B; Wed, 25 Jan 2023 11:42:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKeA1-007CMj-CE; Wed, 25 Jan 2023 11:41:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E166C614D4;
	Wed, 25 Jan 2023 11:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1CFC4339B;
	Wed, 25 Jan 2023 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674646908;
	bh=ezg2eabCWSVB4l7XhnzfHs+x1Vn9MQYl2SLTazGntOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU/+AR2CwjeymulismW9BMOZiWHGFUxIhzBe/aKJI2+1c1gGId0ABjLtUTu03obBG
	 0TFOLM7sjKuh6JqE19PasKUw/fvnXB7YE0xCaFg5WiyMAIKVkKtlhBM5bqlPOX0vF2
	 jqOIv4Lzg2mbrHyFDTB/sT/C2DMoFJbEIIYrevZ3CAW7a2KiT9E0Re7km+4HgBgIOT
	 zZP2aSxEMoUywBiSAljmGYeT2e7Ev0v8lhU58lq5FU2XR7xxT3c3QzPrbzSP8csD9I
	 Q2YYEKrr+65C+KSNc3vZRbtDtiQJKw0dwU6Ei7YFxw7oqI2CdfL95Y8MAebk/UDJgf
	 Dh8XnNgakkOTQ==
Date: Wed, 25 Jan 2023 11:41:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Reichel <sre@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <Y9EVexQ3yAN1n1NF@sirena.org.uk>
References: <20230124230228.372305-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_034149_474334_EE32F887 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Type: multipart/mixed; boundary="===============2548840753244481897=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2548840753244481897==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0ZYRAV1FZ0iGu90"
Content-Disposition: inline


--j0ZYRAV1FZ0iGu90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 05:02:28PM -0600, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.

Acked-by: Mark Brown <broonie@kernel.org>

--j0ZYRAV1FZ0iGu90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRFXoACgkQJNaLcl1U
h9DUcAf7Btv4DlmnSpwnSwLLZLZjLHnfTWVpZJ81qaPCs4SvmkBNiQxX1s9Vld21
8O/QaZxTRJp7+kru4tljDPFtPWIPRvcqVwgCtUoOJ2AIEKapcFBMVIh7nidnnNjs
+LXDzG2e4va5huH2/ghU9TQwULN6X3M3UY8y/sq604qT0koHoN9zoZo5idZF7BSQ
/GVeXQzXzB3UgOLv0hHuuQ9sD8QDIHfNn7ThUEPWhDwvinpB7VqkiIOD8nrr9mhr
AdbkpaWOi2iv3A5BgxyGFDMufybabjkqztUT54muSHZDxbCjU7vUe/fyyK1NEQGa
sgZbeoPjsTAlgN0ytBYi1aQSUR2wLw==
=DSza
-----END PGP SIGNATURE-----

--j0ZYRAV1FZ0iGu90--


--===============2548840753244481897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2548840753244481897==--

