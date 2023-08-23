Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2D9C3DA66
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mIRpJrkHSARF6SssRKW+vWxVloLjH5xtZAp4x7zLAo=; b=j+60YX+5BA1sPnd7VRDkpAn6B/
	CP6YIsKNYyCkKTM9ytlhakPnae5IMOUEEg/1fYZtSzSyGVoNSBKGZ35WgXtxqMM4wS5QolhbLME0u
	rSUZpaYS5C4PBMfCQ1QmBX70CZ+X2B4iCgtMDC2k/neuPWiqHpiqkqhFSja0mLdwCd7QAV7T/RZ11
	Voo5MbHigNdk41dTGtLbPLuVfabIuQejdpHab4xjbpcFdVBxkjcHkfhRE7UvkU4obr1KyDpT16o5X
	YFOLl5hn+IsoN8zm7Ffx1nh5m9JuwIV2TV7zy4wkVb+xJZw/Xm9JrZgiVGQ6exKOyRMWeGb/HAe9z
	YgkyTmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsle-001LRf-35;
	Wed, 23 Aug 2023 18:39:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYslb-001LQ0-1n;
	Wed, 23 Aug 2023 18:39:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09A4065660;
	Wed, 23 Aug 2023 18:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBC4C433C7;
	Wed, 23 Aug 2023 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692815982;
	bh=asxMeG59goJrKZqpcF2iRdaVp/sUaPD7C4KvDd1RyOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKFlXytsPC4AZKRXJ+Qa3aZloUnUGFQL+LYIK0C0yNJLrYaq3eMPpbo80zLpu4qto
	 lpY+ICEHYrhqIDisEmDc8i+CTUU5M6YevwUcK+BBYB19uVE8LN3egnOYMfOK0BeJ4F
	 WHWajKhvsx+/4coIQQsTBVHEQvqI+3hnbY9PdA2ra0NgL2OMcMm2cRGzFDJtKECskO
	 uglY+LaDK2LlsoKxLflOIfuLU1v/oxQO7/zXj53GgYBIIYPaI5/qedFjKx1XEw5pTB
	 IhIylskgfH1wBcxjjaptNhyC6vUYR254sjOYfyiHND++Dd24P9E0EGw1IaBu859/sW
	 ksi0bflQh4y+g==
Date: Wed, 23 Aug 2023 19:39:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <603cf881-b423-40cc-8bbf-b09d929a8597@sirena.org.uk>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-Cookie: Some optional equipment shown.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_113943_685638_60F88253 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: multipart/mixed; boundary="===============4073020041857621804=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4073020041857621804==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hFdtHq9Mievm7JEW"
Content-Disposition: inline


--hFdtHq9Mievm7JEW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.

Acked-by: Mark Brown <broonie@kernel.org>

--hFdtHq9Mievm7JEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmUmEACgkQJNaLcl1U
h9C17Qf+LbbaWfPVYoNHCKOts2RLh6E9FZYojlWRsJWrOhMsIwoY8wMxMPxpOUUY
XP0Hy/LRxo4Khds4zZcNYO05Pkpx0eBSWvzrKSppmA6Pvn9Tu8NkUz7kDmjc7Kwx
7x9ZJKzezKxMkDc8yM45Kc+WC91fV84eflnTL8pAv54aLIuOXqWjh8rTfwT5no7m
59U8ovuRPz477vFNoOu3dqqxSk9mpvY4bLXFGfKZPXGVAoTiNhqt0XML2chc/qr0
tr8971bllC0KXR3Y/8NdZBPwgeHAADvHOIjIGMHVrF+ZbPLaP1b3f9Abc+yd0VBF
Z/wO8E7iZJaNTg95zGWIiXzaYmurpQ==
=kJ5/
-----END PGP SIGNATURE-----

--hFdtHq9Mievm7JEW--


--===============4073020041857621804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4073020041857621804==--

