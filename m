Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367E5C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQansDWEcfA0FBMBQkCir66O+jKNIXDccaxHeQJWUX8=; b=cMSmCBceHi1c7ux05xXp7jnZPC
	SkSvQopvQXR05rHHDJlTjhNU8l+8ogNvriYIrG//Fbja00hVXylMLcryho+dCRrNY2+SGp714v7zp
	7bN87qzRRrPWfNGSPB1FolJ9aI140pbUG5ARQUSidFQPlxE5z4PiHKxye0TABgo1sA52gVz0u1T+b
	59YBvrRiwp/2sjex0O3koz019/n9thlcMYSR90d4NrS1QFY62T1eqQXF1HUD/c8kIGH2fm7bhCOuZ
	63Q9xniKcNXhlFe1n1SuHQ5ZZO5+9slJXiN4sn186q8KdrL2I9IdkiZDTUjdUd7yki3X/tCiLkuJn
	w2x+pRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6oa-0000000GTy6-1YYr;
	Wed, 17 Apr 2024 15:03:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6oT-0000000GTx3-2ToZ
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 15:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5F46CE1287;
	Wed, 17 Apr 2024 15:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80107C3277B;
	Wed, 17 Apr 2024 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713366180;
	bh=/Bqkb7GldAoAOYMnYPa55hOe2NOFX26LJMHeeNgsJmE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=d+5/cF3yTQM4BYfA1SZFN7z0BhLJy35wEBz6cksna76/+Tpu+erwS4gPs5AVAzEzl
	 d2aAS+rpfMDyQZJFltNtyE6TxxWrWdGiWM+OdAyxsSyvTdq3Cniz0dIUP5Iet+3YYC
	 b+o/T0llDh3XLt6JdKtEks1iV9pAHzI3y3x3O9c8xVi0VedrDF0vblw97S4NUxgUgR
	 u6hhvpUBakvI5tFZLcb8SB+h74KLC3PkPYayuymtFMNoTJ41uD2R15Ss6RXK3DYgyK
	 4YrcWEOTdRu7J/DdUIo6yxJglZ7yj2tne99ZREI2nj+Vn+575fkMjhBobKXFoaGWij
	 wTd3C2LLfWgmA==
Date: Wed, 17 Apr 2024 17:02:57 +0200
Message-Id: <D0MHMBLVCCZ2.23XGMIORQYGDR@kernel.org>
Subject: Re: [PATCH v1 0/6] mtd: spi-nor: spring cleaning
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <f07afa83-1c37-49da-923f-2ea9550e7163@linaro.org>
In-Reply-To: <f07afa83-1c37-49da-923f-2ea9550e7163@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_080306_117956_C5AECCD7 
X-CRM114-Status: GOOD (  20.86  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5828270870691755028=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5828270870691755028==
Content-Type: multipart/signed;
 boundary=c423f377f76eebb1c0e9a87ea3b3550e31e5e58260f6d25ee91339b00ae2;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--c423f377f76eebb1c0e9a87ea3b3550e31e5e58260f6d25ee91339b00ae2
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Apr 16, 2024 at 6:57 AM CEST, Tudor Ambarus wrote:
> On 4/12/24 14:43, Michael Walle wrote:
> > It's time for some spring cleaning. Remove the oddball xilinx
> > flashes with non-power-of-2 page sizes.
> > Remove the .setup() callback, only the default callback is ever
> > used and it is unlikely there is need for a custom setup.
> >=20
> > Finally, the last patch is a proposal how to deprecate flashes,
> > which are just detected by their id. We cannot really find out if
> > there are boards out there which are using a particular flash. Thus,
> > as a first step, we can print a warning during kernel startup. As a
> > second step we might introduce a kernel config option to actually
> > disable the flashes which has the deprecated flag.
>
>
> How many FRAMs/MRAMs are in SPI NOR? Can you list them please? I don't
> remember anyone bringing topics about everspin and the cypress thingy
> was a mistake. I'd like to get an idea whether it's fine to remove the
> FRAM/MRAM from SPI NOR without doing these preparation steps and waiting
> for another year.

As far as I can tell it is just
  drivers/mtd/spi-nor/evervision.c:
   - mr25h128
   - mr25h256
   - mr25h10
   - mr25h40
and
  drivers/mtd/spi-nor/spansion.c
   - cy15x104q

Please keep in mind that the evervision also have dt bindings and
spi aliases. So we'd also have to deprecate these ones. Not sure
they can easily be moved over to another driver, esp. because the
kernel interface is different (mtd partitions vs nvmem/eeprom sysfs
file).

There are three in-tree kernel boards using the mr25h frams:
arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
No clue about that one.

arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
I've contacted Marek who introduced support for this board and he
said it can likely be removed altogether.

arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dts
This seem to be openwrt driven (?)

I was thinking about sending patches to migrate them over to the
at25 driver. But again, that also means they'll loose mtd
partitions. Not sure, that fram is used on these boards anyway.

In any case I'd like to start with deprecating the FRAMs in
spi-nor and the DT bindings.

Also, the cy15x104g is rather new...

-michael

--c423f377f76eebb1c0e9a87ea3b3550e31e5e58260f6d25ee91339b00ae2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZh/koRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hppgF/eysfe0XwOiW1dI8MpG8NU6Y7AGPTH1od
7JCUF8xW6WoUkGyZNfy9WwDoa1PhjO5rAYDyPS9TGbQ2HIvGO8GclixI+fqq9b04
UT2uLi0rfeoBXHUDGibDVLs5k7qonhxjeIc=
=3qxk
-----END PGP SIGNATURE-----

--c423f377f76eebb1c0e9a87ea3b3550e31e5e58260f6d25ee91339b00ae2--


--===============5828270870691755028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5828270870691755028==--

