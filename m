Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2E606A32C
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07Hev7zt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcKns4C3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PE0RKl9abu5RzQoVu0utyU5UrjO3qc+Q5M6cZB2/d5s=; b=07Hev7ztwFVxsu8sCTG2yFIttw
	witisLRhs/+v2OPeesTX3VSa8dod1VmSCEKVU7xu4n1NxxEFxiPPVnXrxmYIR7rxBFDh3ZWMIOSnY
	B0etJLdUqgpKgDpilQYKLJMlGcyIHRDx2LST2sWBGlvpvmw/XEF3ghmlumrVpTlODprIWl8k2UdrS
	o6M+s+eWiRBR6YYeddBI286hL2ZBiXn5qWyyHoRWGYNXETPdsdUDaaFXwZ/YitukdKSMeIrpvAjxF
	kqckHPcYe59KIPxQ9YqlY0SXg/bXs2cCXaftvDWN+jaiP5TdNtBERoak8Xzbf74WvyqKuJtkFOzbQ
	Unqak3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqpv-00000006gAp-22Bs;
	Tue, 24 Nov 2026 13:45:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqpt-00000006gAO-3ape
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 13:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03FCF61D41;
	Tue, 24 Nov 2026 13:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A551F000E0;
	Tue, 24 Nov 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795527928;
	bh=hveWDX3wRu+9ZTN3oYj1ZM1AyoIHQ/8kekmLbhh+wKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KcKns4C37cDcZREkdVNnQEb8IQFMLSj4V1neI8M9mN6W5wzQUPtiytsIW5fttWDSD
	 s/slDHx2X60gCjhMGGx+JuhS3edwdlkzy6ThNKo9izuLasqbKzGndgNfqtVMoBsiJY
	 IVOC6iZ0mHunboaLEW31VMHA+cgWA1jiff+A0GUCLKbLmmiUQxuqVSdamn8dC22Qtp
	 3I2dC9YX0TIbR4TQJOyJtKT++iFDlsxmHkJ0EXl2SonlJhczMD3CqbiOMJNCeV/8vY
	 58eswUfYjmvSRWuaHZFFqyTVdrzBSq/TGz8sWZvdgkCnyUFWOF0Usd6+51+J73SM3R
	 hIsYqVV+350tA==
Date: Tue, 24 Nov 2026 13:45:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 00/11] mtd/spi-mem: Enable DQS control
Message-ID: <73680b0b-2c98-4ebc-bcb8-4ca144b469f7@sirena.org.uk>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
 <164905f5-2857-4b8e-8d99-26939b45cde4@sirena.org.uk>
 <875wxmttj7.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <875wxmttj7.fsf@bootlin.com>
X-Cookie: Real Users never use the Help key.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5395938241023533822=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============5395938241023533822==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mS7vwsVuRtIn6CIJ"
Content-Disposition: inline


--mS7vwsVuRtIn6CIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2026 at 11:26:04AM +0100, Miquel Raynal wrote:

> What is your plan with Santhosh's series? If his series will make it
> this round I will respin once applied. Otherwise I can just respin the
> independent spi-mem bits.

I had review comments that he hasn't responded to.

--mS7vwsVuRtIn6CIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFlPEACgkQJNaLcl1U
h9A7Wwf9G5jpVxn4bfkt4gltGtnYP3Jbkb/TG05RkTtbEqfImQDwFegYXJ2dJF/E
eg4ewl0Fn8lpXuz42oKqc9x21PJ7sAU/+KWWFI+/6SALErsRfVKOKjofa11tZfRy
z7Ly2hOHSCyVebl+djzEYzvadmrAF2VEz901fTdeSorM8rfWBX7jqkcJERi9gwYm
YtDVPa/5N58DSJpjqWBtgToYSJoj0W2BiUgFNyY6uyYPQQywy0xGFJ31qB1nZxxD
CsB5zVY9w/1Vm1n5mXAOAZE6sqwTQHdRfxrYDzoQGpDnJWQQbkA375Sq3BwR1mcT
hlN8KyZcJ6B8wH34HmOFGVqpjktcRA==
=dhJf
-----END PGP SIGNATURE-----

--mS7vwsVuRtIn6CIJ--


--===============5395938241023533822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5395938241023533822==--

