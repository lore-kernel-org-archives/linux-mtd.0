Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E7AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 19:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Sy7G3HZ5zoapFTmKKhWsL9hs9vVPUAXz5pdWMq0Ppk=; b=XGYQr1Z5jn4xGCC1c5rliP7tDC
	wa2ap9o/ic2GqpoGf6y4aGESeiZzdYA14ATFHykQsfcfHWxd0b11dmW/tDlbYcfZg6/3sExxRWr+M
	YqlxhbZZWP1I2sHHJvxrkdBUJtsE1mj+EXqpuFBl133GlRYgSKjSzXGS/+9jbeCTL/dtrO+X1TRX2
	7VmVPFKsktQU0WlbInjr0E+dTEbqmB2y7cspWvZ+kM4f5XDytRSCxXq0AjHWl5rd6jNStKG5sJ1I6
	8kEkJCkwdmxJIZCkrR5Ozw6Dq/4CGmUIOhGK0ABQY3dF8golet2AC5SbLFfKcELyWOcTYxR25tcLl
	HWMIQA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZo9-002NRd-V0; Wed, 15 Dec 2021 19:19:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZo6-002NQ5-K5
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 19:19:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2772561A66;
 Wed, 15 Dec 2021 19:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E50C36AE4;
 Wed, 15 Dec 2021 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639595957;
 bh=5JU7ynWQzzR4euZy14PY1jKmBHmiP38yte9RLHc3U0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QI6cAF9XiyocUYPSIBT8YDYNpoQDscNgFvdpK1dVF2LIbp0O0uRwawUsa3i420Xlf
 F/1MMhDdJEFaTecRfrb3+AlYlm3UYPCwpOr/MZLIZTgERE/+64jR8KP7/H44VnoEGM
 dSYVZNqfRH4vuM0X+LNn2E2vGA0U1ocF6CeAQZVP5Na1nwXjlgHwgb3+SU8KXYlzfY
 3c2Rt9srtPTiTHmt5BhOeksIN2DKogqndMaGYFzS1ar2RVVOi36k7kI7SlV2Gjd9ez
 XZTlwdf4NtcsygZKRQ+iC2Zsnoioi/yh+APMSq13Bf/jXplNVM/wAgu9k7qP652BF0
 j1hKTw+qC+HlA==
Date: Wed, 15 Dec 2021 19:19:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <Ybo/r8neydqTxN6N@sirena.org.uk>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215200548.75630b61@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20211215200548.75630b61@collabora.com>
X-Cookie: No solicitors.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_111918_739142_903A39DD 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: multipart/mixed; boundary="===============4303695823419330830=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4303695823419330830==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x0lCV/3SpWhllQQZ"
Content-Disposition: inline


--x0lCV/3SpWhllQQZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 15, 2021 at 08:05:48PM +0100, Boris Brezillon wrote:

> There's also a second option that doesn't involve patching existing
> users: add a spi_mem_controller_caps to the spi_controller struct, and
> check this instance in your spi_mem_default_supports_op()
> implementation. Note that the buswidth check done in the generic
> helper is already based on caps exposed by the controller
> through spi_controller.mode_bits ({RX/TX}_{DUAL,QUAD,OCTAL} bits).

This approach is quite nice for things like this - having things as data
rather than code.  The only issue is if any of the caps end up varying
by operation and we need different capabilities but that doesn't look
too likely here I think?

--x0lCV/3SpWhllQQZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG6P64ACgkQJNaLcl1U
h9DQLQf9FKkMlv6u0xrj+isJyQzPPc8PCpMYhHnjjIR0DpEH+nlecLFLQqJCVtM8
w015gZThnnB0eHh+go1jistjbjkZ8bm4EPVCOHOP80BNTvMDwRXzO9+/SADjg/KQ
UebYewRoVLdpiITf+t/7xOOc7Pjei7o/lhQCLcMZBkDlTwzeubP3GGA/u9n/96Yk
5GGa++iBBk4KVMs78192QHYUsOlMewb+GBJPBz8P67xJPT6wnnQ+8tEmA3GmYGsL
DGUiSXp6EfGzk9l68+S1K3qhd9a0qHoK+4hZgZJFi5l9B1bWvFF68n84L0hG/3at
PUc84bNPkCPi12NwekBA+hR/wNBr3Q==
=SHzq
-----END PGP SIGNATURE-----

--x0lCV/3SpWhllQQZ--


--===============4303695823419330830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4303695823419330830==--

