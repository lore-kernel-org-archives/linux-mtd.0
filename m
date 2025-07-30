Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD01C87FC9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I52W/ZyySPA0ksYocoGcof43omF60xT+jbZZ6otWrA8=; b=jTk/8mC6F+J8tAu1yRWhBmWPfX
	2dffQ/CjKg8jCi1wzyv6xS4OiDwCa4yWnxmeppVd3bj9rmKYdg6e0LPkTMSuAiIRBSP2QVjRYeMTN
	pv9yeMkd/uVpQbVHkxPuW471dttjFaQJCzl8x/KnqRVuZHatBTnRJZZBKLEUX/OFX1McFY//xn4AJ
	kwqGqT7yz30se1nUuj+Dr8oC2X6wde0oJu1k/7/Z6Z2OYN2zMb/wXcam6/O90e9s/OPdKOAUGWmwW
	/gN3WPcD8k6p8Yhqx9lD0m2pwYP2k4+x09DusDoRcLX3w+8pIoOb2NmH9DsN29Rb12sGC2LWhXFqY
	BykPAByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1hU-00000000vsv-2Qmr;
	Wed, 30 Jul 2025 07:58:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Zk-00000000v9o-2vVA
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 07:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03B50A551D5;
	Wed, 30 Jul 2025 07:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550ECC4CEE7;
	Wed, 30 Jul 2025 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753861811;
	bh=llkTTSSb1pWC5NKP4Fk4+twpg7noYOtrZveBau2sYNQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=uvA8XYOVgvraogn6iuTtQ+6zAdxA5lbpselzkNOxtvuqbDK5/afAKiLJ2bGpI8gqH
	 EpNoTInmr89AYqeQN8bxneifsB4W/9uv+AmW89COXBwNL7QInejhkX++VclD82l5Vi
	 BYqzKKnm9j1L/1Sgjh/OHoaBdPlbtPRQ9gIlODi5k60SJaXmwTxpzj1sJ4pdsb9w63
	 kQ5GHxgkmjJtEMAO01x1v1tVrAelnW7HcwR1O/uvHXarYbO/QXIia0sKccMGY9CIGn
	 2dc/EQIYDyUXkWxFHUkBh4O8zPjrvup5SZsAKpZMIL9csbCF0wWGsP9pOc4cs+RGcb
	 yTzOi+DIrDSpg==
Date: Wed, 30 Jul 2025 09:50:07 +0200
Message-Id: <DBP84FIUUQO7.369TFNTJFELMW@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@altera.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Gerlach, Matthew"
 <matthew.gerlach@altera.com>
Subject: Re: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
X-Mailer: aerc 0.16.0
References: <cover.1753839339.git.khairul.anuar.romli@altera.com>
 <566fc1168db723672ab0bc6482ec7b72b4b8fe2b.1753839339.git.khairul.anuar.romli@altera.com> <DBP7P3RWX17B.14Q27IBS3T3FL@kernel.org> <MN2PR03MB49271E2D022D305BC149BA4FC624A@MN2PR03MB4927.namprd03.prod.outlook.com>
In-Reply-To: <
 <MN2PR03MB49271E2D022D305BC149BA4FC624A@MN2PR03MB4927.namprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_005012_811563_781F23FE 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: multipart/mixed; boundary="===============7106450478559064389=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7106450478559064389==
Content-Type: multipart/signed;
 boundary=99fb83cfe9f1b040616eee98db2a26457cc9abe94febc53acebc3946379d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--99fb83cfe9f1b040616eee98db2a26457cc9abe94febc53acebc3946379d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > On Wed Jul 30, 2025 at 3:39 AM CEST, Khairul Anuar Romli wrote:
> > > From: kromli <khairul.anuar.romli@altera.com>
> > >
> > > Ensure that the pointer passed to module_put() in spi_nor_put_device(=
)
> > > is not NULL before use. This change adds a guard clause to return
> > > early, preventing the kernel crash below when the cadence-qspi driver
> > > is removed during a dd operation:
> >=20
> > As already asked in v2. This needs a (more detailed) description what i=
s going
> > on and what is going wrong.
> >=20
> > -michael
>
> Hi,
>
> We just run the following test we observe the crash.=20
>
> time dd if=3D/dev/mtd1 of=3Dout.img bs=3D1MB count=3D1000 &
> echo spi0.0 > /sys/bus/spi/drivers/spi-nor/unbind
> echo spi0.0 > /sys/bus/spi/drivers/spi-nor/bind
>
> From the observation, the dd is not entirely terminated when the unbind t=
ook place.
> Maybe there is other changes require to ensure the dd operation gets term=
inated=20
> when driver unbind/remove.

I'd expect an analysis what's going wrong in the kernel to judge the
correctness of the patch.

Thanks,
-michael

--99fb83cfe9f1b040616eee98db2a26457cc9abe94febc53acebc3946379d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaInOsBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hjHwF5ARhAj8UFrx75UjliawDdPaSRz+IQCzNC
dDPlqt4bsUdb7YgPK+Z2tyqlyrgKntO3AYDNBrB3RaFAs1UEjL+oTF8aE6oTwySK
VEOM+Gy0gAwWaJXKTfc9ODW3mqg+epBJ8xM=
=3sUL
-----END PGP SIGNATURE-----

--99fb83cfe9f1b040616eee98db2a26457cc9abe94febc53acebc3946379d--


--===============7106450478559064389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7106450478559064389==--

