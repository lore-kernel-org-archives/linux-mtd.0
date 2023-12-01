Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68BC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG0l6b6BulKYbUyOcFRzX0RDAEzmm3Qr9tr4kTECxtc=; b=vnY3OLbwBieDKcgpy11miMOFLf
	Ot4YiqN4lo0lFpHl2mBioKV6zzfR3u4FNJRIIvu9E707BK4AKTzIvvJPaEDC3yWJty+G1emPC8/5k
	4PhVL6Y8w0JmxCRM4v5gEsQ8hN8nFAjQDpqO3/mEK5ceypD2vt73XjiZrm56Jvazj0YKmJySjWQDF
	8Ouc0TlogYMV5MM6X0ZqREsXo6LF7Mk4Spvmq743AFEFbXEFNh1pBzFuc5W8Egwlc736PWjzc6yma
	ZYEbzP/kmGJFk0zLt87R/T+fY/k7jpyKeCP8zciugWskfOaitAVbzbKg+0kL96oNtG8kizZY2w5xl
	ev7wkSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r98av-00ESsa-13;
	Fri, 01 Dec 2023 18:50:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r98as-00ESrj-15;
	Fri, 01 Dec 2023 18:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0035BCE275D;
	Fri,  1 Dec 2023 18:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A377C433C7;
	Fri,  1 Dec 2023 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701456626;
	bh=nlNo7xM9XoRlNYHh2JQaIekxrQZHPuEHEh20xUWik9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eix0RHOryZ9fBUgKkiP3QDCZYWkQfGj0qw7PH2nt9Ij/gX120ikLc9r3jpDtMy6sf
	 rgmZGHvqQNVhKOxcLmZ161yUAiZn4s78Y23brUdPGdPhTAhFC+i6FJz3XugCzxHlRp
	 Ig+ududz0DuZtxihAgmEp4sXjkOSrBRJ2O122FhozAoQ+kb7GVueZW2LgPNs0rW5Bf
	 YXy8lQVXxIuYYtN19fcnKuN4Ec5bSzGzd23rAds2gzKmFGQo1LsE0NIgp0s2eRVuGk
	 VkpLlgLZlFsGR+b2Yk+9FKc8ZtqR2/HbOqP+o8Mbd+pizyhKM6IIQ+t/Dcj9TftAw6
	 NXhpQFInUQ95w==
Date: Fri, 1 Dec 2023 18:50:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
	tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: (subset) [PATCH v11 01/10] mfd: tps6594: Use set/get APIs to
 access spi->chip_select
Message-ID: <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
MIME-Version: 1.0
In-Reply-To: <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
X-Cookie: The early worm gets the late bird.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_105030_562647_5C6EE3E3 
X-CRM114-Status: GOOD (  10.99  )
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
Content-Type: multipart/mixed; boundary="===============6586504537998453085=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6586504537998453085==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uaQ9X2fe+EqjZHC4"
Content-Disposition: inline


--uaQ9X2fe+EqjZHC4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 01, 2023 at 09:57:36AM +0000, Lee Jones wrote:
> On Sat, 25 Nov 2023 14:51:28 +0530, Amit Kumar Mahapatra wrote:
> > In preparation for adding multiple CS support for a device, set/get
> > functions were introduces accessing spi->chip_select in
> > 'commit 303feb3cc06a ("spi: Add APIs in spi core to set/get
> > spi->chip_select and spi->cs_gpiod")'.
> > Replace spi->chip_select with spi_get_chipselect() API.

> Applied, thanks!

> [01/10] mfd: tps6594: Use set/get APIs to access spi->chip_select
>         commit: dd636638446c87c95c5beddcd367d95ac6764c6c

Is there a signed tag available for this - without this change the
subsequent SPI changes introduce a build breakage.

--uaQ9X2fe+EqjZHC4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVqKuYACgkQJNaLcl1U
h9APAwf+KLPqe9oVMKPnVoC0/RKtAWqn22qR/OisWnbE+SjMxYnOliwWr1Uy1gfO
VQpQx3O/7kKmZ5aYGt82J0rykYY+6IFwHvgwUu67iYpCzQgmhVbnbh1B94YeZIkV
SUkOiN7HUoTbbExTLVa5Jn+5+LKRmMkbjYXVdpb41Jz/fyGNAidXizOnpqct/Qp1
dMNggC1eWI/kqsOjSr9obsJHhIcyM7u1pwaicJzWGG7SwNM0PSramv3lCHpaKH5W
UbyLbyZ+G0Z2JIwwnq1hFEyklQ1RVInt+3p4rfYhIInMDF+5cQPUjBTcS4k8ho1J
FDPG03/Neeonh9yIf8+TSmQ4tVxszQ==
=/wO/
-----END PGP SIGNATURE-----

--uaQ9X2fe+EqjZHC4--


--===============6586504537998453085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6586504537998453085==--

