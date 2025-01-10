Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20365E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+EyI/kRRu/miUTEd3EHys/t7blcbbsEeUkq5yKbf6I=; b=E68Cs/RELGnlS0ZEV59YMtwrFo
	T8a6v/PCjVOeJHRtQtiObO81NEig3V210wCqfDhnLZjg4id9uK1xU/jvXPZ+HXhLspXR01oaNK6iD
	R1Ul5pyGszwsNXbbq1qY+ru8z+0U/eH6iCavs8fOGR7GA5729jzZhgSjMQx4lENZINkidtCN+74Pd
	rOBwt43Xhe5PdbxGsQ37QgKtanXaI0sGSs7Fl7Dyjpx888yXdZQox3/LOmyEI90i+GB7iRJpAv3ZQ
	TeMJvcoPMCZMlvQjEDTaRkx6JnxXw/39ml/SkIKzGd+msnki5k/KBVirHiA8FxKi9mK4lSTrH5gcJ
	sz55RtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJlm-0000000GZEi-34AZ;
	Fri, 10 Jan 2025 18:30:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJkV-0000000GZ6p-43oN;
	Fri, 10 Jan 2025 18:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 676215C3C1E;
	Fri, 10 Jan 2025 18:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDCCC4CED6;
	Fri, 10 Jan 2025 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736533727;
	bh=TYFMjwc9ILvsgk5FB1BS5YUEXb8oE3r6UYK7GHBXgNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osZYI5oI6hiesP0M2Esd1STQqJmI7el5YkceNLFM8+HrQ/N2LQ8QTOTxZQFbuU/TY
	 mb3OAUD+pNkKWyCcseCgaHiJSt4FishYXpULU2ninbOFjEnRJlcapsxfg3DZz8i4Of
	 tkdk7LEhgpT8osyxWzN5JpmIqOOXS6W6OC/juy2NlF2K7KWPPLlY3bjx7AMzPrpV6Y
	 2GhR+hvM7dBbWgY8OjfvS3qbehrIbT0IfxOUrmtMh599zDqoGF/GCwPQaOlME3sXY8
	 YtjnwrhhcHqQnehnF7ZjP0xVIPNfEVa6U4oSmg8nIzGiD72G2oEddP9wLtHkAoyqIx
	 cYQrRwOTXmSDg==
Date: Fri, 10 Jan 2025 18:28:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
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
	linux-stm32@st-md-mailman.stormreply.com,
	Pratyush Yadav <pratyush@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v3 00/27] spi-nand/spi-mem DTR support
Message-ID: <b40af2ab-8b0a-4099-a636-13ed2a5151ea@sirena.org.uk>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
X-Cookie: RELATIVES!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_102848_093120_FB820B61 
X-CRM114-Status: GOOD (  16.94  )
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
Content-Type: multipart/mixed; boundary="===============4912603738606591818=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4912603738606591818==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aYdj4KKHQJTEiuns"
Content-Disposition: inline


--aYdj4KKHQJTEiuns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 03:45:02PM +0100, Miquel Raynal wrote:
> Hello Mark, hello MTD folks,
>=20
> Here is a (big) series supposed to bring DTR support in SPI-NAND.
>=20
> I could have split this into two but I eventually preferred showing the
> big picture. Once v1 will be over, I can make it two. However when we'll
> discuss merging, we'll have to share an immutable tag among the two
> subsystems.

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-=
nand-dtr

for you to fetch changes up to 226d6cb3cb799aae46d0dd19a521133997d9db11:

  spi: spi-mem: Estimate the time taken by operations (2025-01-10 15:20:04 =
+0000)

----------------------------------------------------------------
spi: Add spi-nand DTR support

This series adds support for DTR in the SPI subsystem's NAND support,
allowing it to be used by the MTD framework.

----------------------------------------------------------------
Miquel Raynal (20):
      spi: spi-mem: Extend spi-mem operations with a per-operation maximum =
frequency
      spi: spi-mem: Add a new controller capability
      spi: amd: Support per spi-mem operation frequency switches
      spi: amd: Drop redundant check
      spi: amlogic-spifc-a1: Support per spi-mem operation frequency switch=
es
      spi: cadence-qspi: Support per spi-mem operation frequency switches
      spi: dw: Support per spi-mem operation frequency switches
      spi: fsl-qspi: Support per spi-mem operation frequency switches
      spi: microchip-core-qspi: Support per spi-mem operation frequency swi=
tches
      spi: mt65xx: Support per spi-mem operation frequency switches
      spi: mxic: Support per spi-mem operation frequency switches
      spi: nxp-fspi: Support per spi-mem operation frequency switches
      spi: rockchip-sfc: Support per spi-mem operation frequency switches
      spi: spi-sn-f-ospi: Support per spi-mem operation frequency switches
      spi: spi-ti-qspi: Support per spi-mem operation frequency switches
      spi: zynq-qspi: Support per spi-mem operation frequency switches
      spi: zynqmp-gqspi: Support per spi-mem operation frequency switches
      spi: spi-mem: Reorder spi-mem macro assignments
      spi: spi-mem: Create macros for DTR operation
      spi: spi-mem: Estimate the time taken by operations

 drivers/mtd/nand/spi/core.c           |  2 ++
 drivers/spi/spi-amd.c                 | 21 ++++++------
 drivers/spi/spi-amlogic-spifc-a1.c    |  7 +++-
 drivers/spi/spi-cadence-quadspi.c     |  3 +-
 drivers/spi/spi-dw-core.c             | 10 ++++--
 drivers/spi/spi-fsl-qspi.c            | 12 +++++--
 drivers/spi/spi-mem.c                 | 64 +++++++++++++++++++++++++++++++=
++++
 drivers/spi/spi-microchip-core-qspi.c | 26 +++++++++++---
 drivers/spi/spi-mt65xx.c              |  7 +++-
 drivers/spi/spi-mxic.c                |  3 +-
 drivers/spi/spi-nxp-fspi.c            | 12 +++++--
 drivers/spi/spi-rockchip-sfc.c        | 11 ++++--
 drivers/spi/spi-sn-f-ospi.c           |  8 +++--
 drivers/spi/spi-ti-qspi.c             |  7 +++-
 drivers/spi/spi-zynq-qspi.c           | 13 +++++--
 drivers/spi/spi-zynqmp-gqspi.c        | 13 ++++---
 include/linux/spi/spi-mem.h           | 56 +++++++++++++++++++++++++++++-
 17 files changed, 235 insertions(+), 40 deletions(-)

--aYdj4KKHQJTEiuns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBZtMACgkQJNaLcl1U
h9C2zQgAgu3h0M+rMbhCSl4Ax1wuwWzdK82xuQKhEOqQKPe4KB4vTzh1sfMWcvDX
8SFJrtxYI819QKXozGjqkxGXmY25Bk5rPF08p4qZ3pGBRfKalLOrfNgc36Duv4g5
W3ClxWr1pkFaw8XfEqrYoYqNT9lA1LzW7Ddqu0IxmHQDW66BfVxU4pHVlQsntB3H
qaWW/ZntqizjTUbrIfbDuvoNwCmRCZByjvjAMgDX3q0K1DTqbPL+UNoRUNs6lBek
PBRAiB+Mc0gd6XVtsVTnhimLpsP9Y5BVdXCEd0V3Z+gj+n/FRB1qEvp4WnSndtZ8
Fm9HJmek861NtHjuBt7awHizmBwvkQ==
=1HVr
-----END PGP SIGNATURE-----

--aYdj4KKHQJTEiuns--


--===============4912603738606591818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4912603738606591818==--

