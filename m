Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD962C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 22:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4Sjcmgqdy2mVLG22FxB6X4uJ9EC8+9a5k8bIVMlyW4=; b=MmTu58XN79VxW8R5lc90ewYfYj
	tCJtQPf4GUywgr+sAktG8NN+irt7Yxo0JL9F5HWN6UO0tIkD3pcxY5lPgF1ZcvF/l+XSm8GPzgQd7
	1XpKydUnuUBzvYIHjmGP1W8VqipI90h5eWSRZL0jKTjUfUsocsC8fQKh8wmMWxZr/wiOGfV1/OQLU
	KlPKXDeBnrO8XsduB45Cga0rE/320ib4VIlTHFagaYhP+HnM2Dh6J7sY00CGoCcMT/v5Pp+uFU7MN
	EhHKzB+xD9cqwPKca+Nfz/vkaMNHcBtzFRR/6GUno6/gJq2x017Uph05aFOYaCoHK3DDJR6U0kra7
	jBOaE2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDZpe-003hST-JL; Fri, 28 Jan 2022 22:35:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDZpb-003hRl-U8
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 22:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5786561EF0;
 Fri, 28 Jan 2022 22:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E69BC340E7;
 Fri, 28 Jan 2022 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643409298;
 bh=Yq+NKmglCcJf6VxEKFIQ3uZi517ZRefZwBxdT7JtlIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4NFg/R0I4hO4OnN0XXhGYU6nnk1z9BgxojWESsJ1w7T/WnGmxGEI4LGtruaRYasP
 xxWVImUb87rY0l+GFIZambMoknvTBNIAzy2WOLNWBuF3t4vVf2PpwT+sF7IDx7jnIa
 cjxmpIeqMqqLcrbSCW4xzxFwGlwW7t/trDuJTuNaY5D5CHu/VupA2D/YDZT8mMiSCk
 y5nYnUAYFWI24ucgg5Rerk+rCSCGDh2kH/Dc6giMi+meIa7D5nWt+GCPmc1ucW2+fc
 yfTWaiskcpLhSVKAGlv4iZCj3QsybEwbqbwysvXhm4iz2rTp9jmAnCjCLwFLatUfNF
 l7jm15gmXd8fA==
Date: Fri, 28 Jan 2022 22:34:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 00/13] External ECC engines & Macronix support
Message-ID: <YfRvjJf+6Db89RRg@sirena.org.uk>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
 <YfL5ApsG7c619+R0@sirena.org.uk> <20220128090812.5b7a5982@xps13>
MIME-Version: 1.0
In-Reply-To: <20220128090812.5b7a5982@xps13>
X-Cookie: Torque is cheap.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_143500_034408_C830CD63 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Type: multipart/mixed; boundary="===============6617007012829619442=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6617007012829619442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LgYrcwW1A+i1Y5Re"
Content-Disposition: inline


--LgYrcwW1A+i1Y5Re
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 28, 2022 at 09:08:12AM +0100, Miquel Raynal wrote:

> As three patches in this series were new/reworked I dropped your tag
> there. I should have asked you again. Shall I add them (back) to the
> following patches?

> 	spi: cadence-quadspi: Provide a capability structure
> 	spi: mxic: Provide a capability structure
> 	spi: spi-mem: Introduce a capability structure

Yes, please.

--LgYrcwW1A+i1Y5Re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH0b4sACgkQJNaLcl1U
h9BXuQf/etoMdbvPgWgonTU6b8NUIY3ajlpqCNxICnnzCehv4KQf96azCUjthZ3S
HCksv3/bC2PAkfNPeMM3+mfZD0MPdHmkh6++c/GhFT8RzMvaXJBUEW7fCtLnaanG
v9DSaKA1ROaPjUnVy3dDbcE/sf9eY/O+tfWMNboEmuaWLnVIlzP83lrIqWBg9x+u
pKeD7jAOAqMHw4z1yVu75GXBMgMQ+exMEAshMc/dqsxvBczAbbS1ncNltI4bB3sT
6BYVFRFnqw5vxh+SX+l/kJKJocKQN2+dLrIEmykY/MhbKdfExgjwm/CsPzVzHhPR
7bQsA2YZjwj9idg9IQLWF6ZRuyeT+Q==
=dGGL
-----END PGP SIGNATURE-----

--LgYrcwW1A+i1Y5Re--


--===============6617007012829619442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6617007012829619442==--

