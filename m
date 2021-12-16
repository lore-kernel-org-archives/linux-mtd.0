Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B03C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhVt8elmRpgdKUNaopwv5h2AcIwQAt29EjwpDnDBi8s=; b=b8vWfX5qUWnKUK3PXRBxBPHfq3
	B4XbXiw5h8ccaJK6Ioy2dCY+UTSvU1PnfsMxCtOx11is4pt7t8PuqsldohgESMY2mQ/8wjft3/qLm
	8jVo7i7vZjFamyEKWa48lCKh9U580BJyBv0D04Pqzio/WzZFnH2Ob6722PgFbCOm8Y3kYwi5DjrVR
	W5vAlhRLsdY8hbi0ejPEZplnGkw81gAgDK9GHS03OGI/UvnAAwdf5cSbdWaFQJpPMH30dAkZIlLfl
	lRhkYU40MT+VH4CPYBSPes9P+3oUH/tPJJlugwxm8j8xWNc6AcXY8P7RtW9s8mBzZW3iTULyZuSKB
	/r07jGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrOH-0062V3-NY; Thu, 16 Dec 2021 14:05:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrN2-00624z-Gj
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 14:04:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27FE8B82460;
 Thu, 16 Dec 2021 14:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2096CC36AE0;
 Thu, 16 Dec 2021 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639663469;
 bh=Luhq9Qub5yOdRpagbotKjMjuKOEuUYM1ukB/Tmmo5RA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qsa9sVPzdQq/HkMY6vGodXXyY/gHr3/pknTbXrKYwcb1l5xOvT78eU6utH9phJsfv
 0FCz/+WrII3lvmZqv1sBAIS4ySRdJw+g4WhSC4oaf6BP6b0wTU/qD7rKzlMGLgOI7D
 2r9ntikOZ0M1pb42NrlTzCrMv20nW0lxdMUaqRs7XXHfjd3bVxBSIj0nIlK94Jo8+X
 l2YWsYNmaLCmK59txBpeLmQVqRh8uFcf1JBC/jFCsIiB08eeD/1fZMycpXKCB/1jUO
 8+oInW62gyn2wNz15oIUDTUpOAKzonLW9Ri0oqCVDrwm+9gg9X9qdgC25zLY31cGcR
 4vLi+teuXwAuQ==
Date: Thu, 16 Dec 2021 14:04:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <YbtHYtcYsyrl5HaR@sirena.org.uk>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215200548.75630b61@collabora.com>
 <Ybo/r8neydqTxN6N@sirena.org.uk> <20211216100147.46c307ff@xps13>
 <20211216105739.395a174d@xps13>
MIME-Version: 1.0
In-Reply-To: <20211216105739.395a174d@xps13>
X-Cookie: No solicitors.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_060432_738615_32F1AEFA 
X-CRM114-Status: GOOD (  11.49  )
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
Content-Type: multipart/mixed; boundary="===============2800435432359603979=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2800435432359603979==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5fSdzfmMYl/ZYorm"
Content-Disposition: inline


--5fSdzfmMYl/ZYorm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2021 at 10:57:39AM +0100, Miquel Raynal wrote:

> Actually as the spi-mem.h header is not included in spi.h, it makes
> defining a static mem_caps entry harder. I'll go for another approach.
> Maybe putting the capabilities within the spi_controller_mem_ops
> structure, as these are highly related.

Yeah, or putting a pointer to a static declaration of the caps in there
rather than the caps directly.

--5fSdzfmMYl/ZYorm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG7R2IACgkQJNaLcl1U
h9B2PAf+K0NVwjqkRGd2gFYHI+j38MwOND2szrpxpvuAzaheD/m0XGUf3IyHHo4B
XOMkGUJRHfPXDBubovb7Qi2bfk27wPGtwPYrPGY8M44n8+1qThOZ8d+5jb+0WqXV
DR15kfAO6BtfrQfp4f7oQwB0N/8G0h3zccEUGtJEDKY4r2MFapQ3qthwtovqWNCV
8wMKvhQ7h+KJS6HSF/NJLGDJ+Dg19eBxKQeG9BQnZ/akhfUIIr7/83+nkH5tkrWK
VD8ezK+frReFgvu/bAgR4EoUhhLCXGi8r5Qimwhci2Dfn91LVLjpmIjgoO5SbVYO
vrqcZFQD+C4cnI2SCjWT5Si31cLpdQ==
=VVs0
-----END PGP SIGNATURE-----

--5fSdzfmMYl/ZYorm--


--===============2800435432359603979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2800435432359603979==--

