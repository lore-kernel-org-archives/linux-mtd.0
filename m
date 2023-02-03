Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2AEC636D6
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQT0UVwwv+gB/I/CM3wW/d6I/FM31pwl1Flf6Dc2S3M=; b=gOiTk00Nl4U58ABhqA4z0ja4nb
	ErrRO7wBkRFsL2S2KpkSJGepBH+mexFn6Us1zrjOBF5NvyDAcSg/pOvI+dNrkPCSH5MIavD4w5qTO
	jieMsFUuMfSuBSblWnlHxZaFGDr4ppxMtz4v+ILKSAdf3iy/XvNjlwqKHKKO2dfbm1CydvcB7CNEc
	Mu5cgtS6riIa8TRhgNpkhbLvGYLBMlAXSfy0gssrBJ5pz6NuGPUdfs/OSt4kIRlPtjcN+5soSp2wx
	G5m/VqFtErTeKG3zeYJsD0y8f9QN+IZ4Ympa3ByOkKJ0ngtAvP2LUXPmbjm0D9CHdbRHqwe7x96MW
	sr8sk/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNuYF-001daL-FN; Fri, 03 Feb 2023 11:48:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNuY2-001dVS-Rp; Fri, 03 Feb 2023 11:48:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6030D61EDF;
	Fri,  3 Feb 2023 11:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89106C433EF;
	Fri,  3 Feb 2023 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675424885;
	bh=sXBX1FG6ndVGefT904bnksV8B+g4LxIK97sutzKIqNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQ5/MYRvKvLBYmD0dA3PJdZ7Epr40/BTH7nbSlK7+wFZPoEBj5EmO4JWqecjeRxR+
	 B/iSweeCvTGY3fjdke/bBXjQtVykCLPdFqqGU9ktxc0N70sghU8BNDNuaNjzfDMWhS
	 9xRmj7NUziC4xCvRKjHJVNZOLGyot+RdeudHWY7IRVy13TkKgaDOYBJU9t6ynd5wQy
	 8feOq45sLlq6jWd1OVq10ZXObB6hZ7Ishp7lMHgECKl5O5z5sPGynRTQhdAmFwGN6/
	 ydAbA0R/fQhWdcJFsjLIHKeABeGhliAhtNPY7Cop+P0ZgWlFp3i2xIHg8Lh04A7wPg
	 waLBdhfqtax9g==
Date: Fri, 3 Feb 2023 11:47:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, trivial@kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
Message-ID: <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
 <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
X-Cookie: Pay toll ahead.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_034806_996304_48AFA462 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: multipart/mixed; boundary="===============3889416626034853503=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3889416626034853503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SpLBoke9z0+WTDIl"
Content-Disposition: inline


--SpLBoke9z0+WTDIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 11:28:03AM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> > The deciding factor for when a/an should be used is the sound
> > that begins the word which follows these indefinite articles,
> > rather than the letter which does. Use "an SPI" (SPI begins
> > with the consonant letter S, but the S is pronounced with its
> > letter name, "es.").

> While I agree with your pronunciation, I believe the SPI maintainer
> (which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
> with "spy" ;-)

Yes, I do.  To the best of my knowledge most people just say "spy"
rather than pronouncing the letters or anything.

In any case as I said in reply to one of the individual patches English
isn't regular enough to go with hard and fast rules on anything, and the
letter rule is much more commonly used where something is needed.  Using
an here looks wrong to me, and the fact that a is so widely used does
suggest that usage has escaped whatever rule there is.

--SpLBoke9z0+WTDIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPc9GwACgkQJNaLcl1U
h9BWWgf7B2SbxlDCRQ/tXsgEj6IpmRoheV/Rc6V7cDJ3WW0RDwuKuwr+iYGYH4wI
JMhxrKQp0ohQOtyboaLZK7RSARZQtK65wRZ2Cnrc3ilSy9T0cwDCOwBQ8I14Rclq
/g2LhsTjAgrRpbQDo70vY9TV1fgGhwKHTNkGBfUAlfdPRz38Q/xX53UXHBy6cVqC
ZWmrmxiRWO0ERd1qkYXsmPVVrtor6skFKeuri+z1H/l/Rl+vj0R4zLIiek1nzhnm
W92b3oRnp6fRbyoiNsBO24Hrvd4POfaUHRf006dJ3jQnJpFKQwP8sFCMJD3BLpIU
flkBLxV/d8OAm+zvn+ZpbTQr/78vKQ==
=4YMj
-----END PGP SIGNATURE-----

--SpLBoke9z0+WTDIl--


--===============3889416626034853503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3889416626034853503==--

