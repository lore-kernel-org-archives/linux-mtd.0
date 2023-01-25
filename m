Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D2CC27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5F8RMDqbNP0hmumjO9wZU4a2ZjF6XGMaXd7JF/pOUk=; b=wgdrODzzJhO5VdghnvWji/PocO
	nAktuJyHk7pR/WvV4bZKSSIjH0Nz5nOffajZOz1vdS1atkHNCOjxtdH+EVoK3tPTTp3SDM0HhrUol
	k3eVT4CAa6eaR4B8HjFdB+HOfo1Fh51UOtTa4hdTAI6SE261OAsNnS18cX8LKDp9PQ+O/uzVDAJYH
	vtFx9LP48lovDhmlbta3JRyf8hUptZGpstTa2Tmkt9/MXDHErx0jiZ7iL0Jf2I19bknx37Z6KUeXD
	Pki4PMrAsVCnlm/a6tmpC3X52Hs6toyqznR8ChqH9TS1efXBEBR4ygzzknGeaYvXWXX4Cm9XDoBLV
	S0Cx49eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKe9t-007CKe-An; Wed, 25 Jan 2023 11:41:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKe9h-007CGl-Hv; Wed, 25 Jan 2023 11:41:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5C7B614C7;
	Wed, 25 Jan 2023 11:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E044DC433D2;
	Wed, 25 Jan 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674646887;
	bh=BSf4VdDu/Cipkbp8RNs0rNyAzPjqHzof5Fj9ZYA48xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GfilqO/eKu/QoPePHTTuTn8J1r0Gfr8WyYnJTWSK83NPY89Lt3LaqRMiaWnnxEdz1
	 5GfmqGH8yJFKJlrPMbcp84JgDUzRLc2uldIX4k89jTMcPIFXHFbL6PPgMyEPoohaU3
	 uAQ2xL2z2Rjhzaa8w1lCI5+i1z2YED4iJtXXyaxZ0XqaEafwrnSL76HnHSEhWrfZh2
	 BSVoMTAFP3PkmPkb7Kyti1fKVYFgPbZvpPHr2csZ0HOGM4Do6P0nTDzzOAj/HPpgzU
	 RU4p1z0AJO7YjLO6ciSZmTplImSf9p4ZS2V0k6wbLHUb3lAFakk5haqH41gWo/0kO1
	 OKWEJLNDmmlsQ==
Date: Wed, 25 Jan 2023 11:41:25 +0000
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
Message-ID: <Y9EVZQJEV8i5vdgp@sirena.org.uk>
References: <20230124230048.371144-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_034129_644161_E87B84D3 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Type: multipart/mixed; boundary="===============2340859999289062057=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2340859999289062057==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YLw58GmZKH9QcKuc"
Content-Disposition: inline


--YLw58GmZKH9QcKuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 05:00:48PM -0600, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.

Acked-by: Mark Brown <broonie@kernel.org>

--YLw58GmZKH9QcKuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRFWIACgkQJNaLcl1U
h9C5IQf9Gj9QI/FW6Xw+gMpDw41zL45NSAa01ZJ7G8XkRAaJNWXTMWR1sZKiK4XJ
5rjn6QJUusYQuPpRmgG2DjO115ttDY8PNNWUlbpHxdQ+0dQI/dzilsrEFOrFXH1S
PcEA3qn6o7eU3ICxhOnhcJzf1auMMUeq0hHtfjHxHLhgxeJZ13yZA61DnR9uShhF
DT2ZXj0DrflrKoX2haOnuhvLc0Rx5qV+O3LfPBcO53OdCgjkAkmW2Jll2UrtTUIc
9+G5v1R2fy/qBGUUQSzfPcTESH8bAwxpdP3i61xeoUYzaRNM/K4F/00nXADmY71w
uWdFdQq7y1nxrTCAKIbIk2i8KCJlTg==
=IpOI
-----END PGP SIGNATURE-----

--YLw58GmZKH9QcKuc--


--===============2340859999289062057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2340859999289062057==--

