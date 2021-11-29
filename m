Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B53C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrJv8yX1ck741qc6BsMoljEd/7KvQsokZZC+w36ylHE=; b=XjpdNzCjfSGLbQLrJ8d++3i/+c
	q9z4q8K4BCRkoVlzOeHQYJEBsV21ma7i7ORX8mME8jC056wqSInrSnFvzZHwhL0a9MedjuRgiqOw4
	i7fOjI7tOGE0pxbPXJ8+5dM3WRi2WQ9Kfb56ORTSHAhJS4jw6hGs/SWEhVmBrf7jZoLTQDeSwm5Ld
	nbCVMv8AsHUrBBPVtlhPSBq4FGglM3uvO2XV2K/6LZ9W2Clb4/V7WTqOzpROCGqkQAER0Xsny4DzI
	mhS71WAvXKy9+PVVkwesaDx2xjxtUcR4GakF7j4xTgecpVEKWoPgPIsR8k4sS/okatzXGwAeIiT1j
	HhvNTm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrlC5-001jZt-6k; Mon, 29 Nov 2021 18:16:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrlC2-001jZJ-Fa
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 18:15:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2890AB815B1;
 Mon, 29 Nov 2021 18:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6452EC53FAD;
 Mon, 29 Nov 2021 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638209755;
 bh=4ZvxN/3yB6BIkS5mjsWCkybDGiWY3Py98ZFJY+s6Vj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3PEpP+W+hDsvuPyeAajJimQVmbwxj2vGUyUBwsK5ThTOCuv+YHmnBNMyLUG7G8rF
 5o01BTshaoBe4BVtxyMikV3YpDda7S2O7n4eJe7DEADKrRJkrc8hg8g9lx+h5AYnRp
 JtJNrW2SfymVAqN0xI4bM+fie8mRqdne78USgugV5E5JwVWJT5abjwphwrAcmT+OwE
 ZL4CZ2ydWXwx6fSODO6V6qeQ5ytH7zXy7etv/RfSxAqg3b2nnPSHcxLwwyF2ldGQPJ
 0pgUSn0IkJKU1xSBqlha2PjmY6Uigr9n+kpysW/wNU5DBimNjt+01icl/evZTh+Ifd
 D9pEACPTwiJdg==
Date: Mon, 29 Nov 2021 18:15:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add bindings for peripheral-specific SPI
 controller properties
Message-ID: <YaUY1gKnyoOEvo/M@sirena.org.uk>
References: <20211109181911.2251-1-p.yadav@ti.com>
 <20211129180935.nmymboy336hllly7@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211129180935.nmymboy336hllly7@ti.com>
X-Cookie: Thank god!! ... It's HENNY YOUNGMAN!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_101558_685450_10469C56 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Type: multipart/mixed; boundary="===============2167108403903160768=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2167108403903160768==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qhLQH2s+5hgBKos4"
Content-Disposition: inline


--qhLQH2s+5hgBKos4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 11:39:35PM +0530, Pratyush Yadav wrote:
> On 09/11/21 11:49PM, Pratyush Yadav wrote:

> > This is the best approach that I came up with with my limited knowledge
> > of JSON schema. It has some limitations that are mentioned in patch 1. I
> > don't know of any better ways to model this. Suggestions are welcome!

> Do you plan to take this series through your tree or should I poke Mark=
=20
> about it?

I'd expect to take it through my tree but please allow a reasonable time
for reviews...

--qhLQH2s+5hgBKos4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGlGNUACgkQJNaLcl1U
h9BdUAf8CPx2aYIuPUWc4Ka8OhpPDQXy+JJkgrtPsqFeOqDqSk2dwAUHat/zea2+
GJatBwnEcSdBPtjJ9Lhu7MOI+Lj4255qllxHtem4dr4HtKUhFPFzxrlfaHpZ7b6g
g3ilAzVvilA/svq+UldUzrI2X0x4eJx9vfb5DU57IJV55iYzKokCLUfcUxXPwGWi
LXNwGOX8Gd8I+o9bnEUeAakeac+UEl0jwfyzea9wQb7+9QovJAFt0EfxnZ5aXXSL
9Mg90x6V6YzzL06tntkPs4FNF7N5QrS+Lnb3temdqn21Wr3ezdCuf9wHwizXzyCz
SA+x9BeNFM4Z6o72ym0004LMiYmb9w==
=4TaM
-----END PGP SIGNATURE-----

--qhLQH2s+5hgBKos4--


--===============2167108403903160768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2167108403903160768==--

