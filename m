Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A777E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyxqrGdaJPlsonbT87v5oPAgdltjz+fxwUEXrRMRoUk=; b=Rzc4AtHhePoKHMTy1Rf/6YEPAu
	ftt6ntQU3Oh693ry0K53sJ2vSToubB1QR9EXVyYk/dRe8JYbXmYGe6Y755tKaBkLD7gg6Mj/wja0N
	zZxA0l60i5p2rxWNXbSaWfuYdgtz9oeJMeXpsbh78tMuu5I0fWaKgLuaWoulbevac/C+T3ScrcuTp
	6kG+oRH2yG+2mrltOW+rX9uYnigWrB9XokxOG/4h5nYVfmWdPGynnEIwRgDsrHzUPmvUjeetc95nd
	Ine2lhQI9/+YJaBdgifY3Cc/UNnKZD3hMr62HavhgMwy1dh4HDSfIEZUwwLYkyFdYCp4DJ9uwhzeF
	TmNZMULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEpj-0000000FQbf-1jBu;
	Fri, 10 Jan 2025 13:13:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWELq-0000000FK8V-20wh;
	Fri, 10 Jan 2025 12:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCE6B5C10C3;
	Fri, 10 Jan 2025 12:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0816AC4CEDD;
	Fri, 10 Jan 2025 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736512977;
	bh=jQisMlTjYfeo02yHCaf8/3pDTMXN8QMfrZ/MAhEXiCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpD0sW7UIABuucxd/Qx8pWVveKRBTPjoee4MF0KjKw8i5YDBoDzL5JYvu4BaELO0t
	 M/U8H/SXs0PIabw+VP/Wmcv2zkse9maGzd/9rSoZgJ6hC/Lu3TEGJ9VrLXjmmeRFg1
	 vFZp71KV7rVxbfsUrwau0sxqutt53V+fSRgOWgFQTeVLDgWzOazdvg68BZ9FapN4Et
	 JWbE4PuKzWFwlzYvCA+Uzkc1/eq5V73FfErBUEePlT0QeeVOCwHPXy/saY0DV/C3w1
	 EubDaTDdWlxizzmd69Sr4YfE+GSogwgowB31K0GFRmk2/goQYinjInn1BjN5IFfOdI
	 Cy3tqd/O7Qjaw==
Date: Fri, 10 Jan 2025 12:42:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,
	Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
Message-ID: <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
 <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
X-Cookie: Many are cold, but few are frozen.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_044258_594828_7BB985FD 
X-CRM114-Status: GOOD (  13.35  )
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
Content-Type: multipart/mixed; boundary="===============6644308067393850258=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6644308067393850258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RVMhmV/ewGAzdaKp"
Content-Disposition: inline


--RVMhmV/ewGAzdaKp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 06:06:05PM +0100, Miquel Raynal wrote:
> In the SPI-NAND layer, we currently make list of operation variants from
> the fastest one to the slowest and there is a bit of logic in the core
> to go over them and pick the first one that is supported by the
> controller, ie. the fastest one among the supported ops.

This breaks the build:

/build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting types fo=
r =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct spi_=
mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_op *=
)=E2=80=99}
  580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/drivers/spi/spi-mem.c:12:
/build/stage/linux/include/linux/spi/spi-mem.h:427:5: note: previous declar=
ation of =E2=80=98spi_mem_calc_op_duration=E2=80=99 with type =E2=80=98u64(=
struct spi_mem *, struct spi_mem_op *)=E2=80=99 {aka =E2=80=98long long uns=
igned int(struct spi_mem *, struct spi_mem_op *)=E2=80=99}
  427 | u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op=
 *op);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/linux/linkage.h:7,
                 from /build/stage/linux/arch/arm/include/asm/bug.h:5,
                 from /build/stage/linux/include/linux/bug.h:5,
                 from /build/stage/linux/include/linux/thread_info.h:13,
                 from /build/stage/linux/include/linux/sched.h:14,
                 from /build/stage/linux/include/linux/ratelimit.h:6,
                 from /build/stage/linux/include/linux/dev_printk.h:16,
                 from /build/stage/linux/include/linux/device.h:15,
                 from /build/stage/linux/include/linux/dmaengine.h:8,
                 from /build/stage/linux/drivers/spi/spi-mem.c:8:
/build/stage/linux/drivers/spi/spi-mem.c:593:19: error: conflicting types f=
or =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct spi=
_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_op =
*)=E2=80=99}
  593 | EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/linux/export.h:56:28: note: in definition of mac=
ro =E2=80=98__EXPORT_SYMBOL=E2=80=99
   56 |         extern typeof(sym) sym;                                 \
      |                            ^~~
/build/stage/linux/include/linux/export.h:69:41: note: in expansion of macr=
o =E2=80=98_EXPORT_SYMBOL=E2=80=99
   69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
      |                                         ^~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-mem.c:593:1: note: in expansion of macro=
 =E2=80=98EXPORT_SYMBOL_GPL=E2=80=99
  593 | EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
      | ^~~~~~~~~~~~~~~~~
/build/stage/linux/include/linux/spi/spi-mem.h:427:5: note: previous declar=
ation of =E2=80=98spi_mem_calc_op_duration=E2=80=99 with type =E2=80=98u64(=
struct spi_mem *, struct spi_mem_op *)=E2=80=99 {aka =E2=80=98long long uns=
igned int(struct spi_mem *, struct spi_mem_op *)=E2=80=99}
  427 | u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op=
 *op);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~

--RVMhmV/ewGAzdaKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBFcYACgkQJNaLcl1U
h9BhIgf+KXE1JExJo+WBN7mYcyQ4HitVxI+rVexdbI+QMmjPpB2umRebJU2u0F2O
zJlk5R6eGXdOn3H83H0CacUm11VVNZmqP1yUSytO4sjiyHdh7Zp70UkidrhA0O9F
pRM9l9bBbWV3FzLgZCYjZ03y6A+A9CrIsGRVAuX/rAUHENGshIN+Wa1j4ZwRkI+u
Nid4YWfQkB1UjSFhcx6d9iDq65hTlrHDn5ThFmIDGZCTS8NRcUAevtkdwoU9thC7
1xTCkJ92ejUGQ3TTzVrlg6qsnSJTAARPhDZ8WasEfN+L/LWyRI181QAMRKG4oOOi
swVXAClyqCX9avFjDoBP8aArkjRb4A==
=qXZ3
-----END PGP SIGNATURE-----

--RVMhmV/ewGAzdaKp--


--===============6644308067393850258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6644308067393850258==--

