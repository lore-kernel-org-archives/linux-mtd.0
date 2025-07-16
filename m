Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE31C83F27
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Subject:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuBCocfqh5wW59GNbxv/umzFy/OjoqF3lA2OT5A/MzQ=; b=VKDtq3Yr+lfwxsM0AN0Kdh4D1D
	X+MvkLW7GRGYgD7VzS8Dmc9K1Hvr/X6SnNbL++jTFaJu8cRaIf7ZJ35/VHgDUn2PrlWf2bU8Wdpma
	VYZKGkI2UmTNv2KZt2JYy0zuC8aACKVr9E8gTL1lUx/R7HdbwuVtVryTChVwUT4Dzxnk2RULwjNuH
	hfdZRxdqlhgrU5I88Vc7yNYeR6zUiK5nVgGepG4NRKwJ6QYX1OzKCocf5/lPp9HzJPe2bDM60fpCG
	eXxR/PBpsW3JWRmAzlTabeIkUGIfOgsv/0KZix6aTm1atejreYsM+W0AmdU/Py1rrSwFiZzW9RBNV
	eY8GcSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubw9z-00000006xBn-0niK;
	Wed, 16 Jul 2025 07:02:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvu3-00000006uxw-2gfy
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 06:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9A08A573E0;
	Wed, 16 Jul 2025 06:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387F0C4CEF0;
	Wed, 16 Jul 2025 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752648366;
	bh=iKfK3+PzlLbOhq0cMRSj3biqoDLG7uZW/NNlE7tRa1U=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=B5U+yqJqWMjd0vIsc7sqEMn6ojST79WbIkA2mK0xPRQomhJ68mkFXQERMkVWGcNnu
	 KTDKGUXDEBYu9MmCJwDF7QLQ1gO9yfpLx+j5/SQbau4ynzDiDmILXNLI8v7Lw9VRCv
	 aTc+XLBGx6pELMNOPv3/1uZLQggDrGscJYWcnnvG4RG+5ynb4lwhheW6Jnp3TymY6T
	 V1dd3ZTQqkSjTVl6cjmiTvWtuqt9CZo3E3yvlkjpCT6Led5vEVgr1O5VpW9wCPYd1z
	 YKhXsnj4/d3abhlmInM96QdGxgDnZF/+r5AnoAkzW/Ekz7jb/YwbTZqDFwV2FD3qVJ
	 aTW/luntXY9PA==
Date: Wed, 16 Jul 2025 08:46:02 +0200
Message-Id: <DBD9ZQ7GV4YY.PLA885RZGBDV@kernel.org>
Subject: Re: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
From: "Michael Walle" <mwalle@kernel.org>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@altera.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Gerlach, Matthew"
 <matthew.gerlach@altera.com>
X-Mailer: aerc 0.16.0
References: <cover.1752024352.git.khairul.anuar.romli@altera.com>
 <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com> <DB7LJZF3AZQJ.2I5EWYORV6K33@kernel.org> <BY5PR03MB5299D68304D916F466837E6BC657A@BY5PR03MB5299.namprd03.prod.outlook.com>
In-Reply-To: <
 <BY5PR03MB5299D68304D916F466837E6BC657A@BY5PR03MB5299.namprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_234607_743588_7DB674DB 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: multipart/mixed; boundary="===============7356322256265424652=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7356322256265424652==
Content-Type: multipart/signed;
 boundary=aacedfba284be24d50cf86206b89b6cc0845da34b5ffa309b922fc4abfd4;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--aacedfba284be24d50cf86206b89b6cc0845da34b5ffa309b922fc4abfd4
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jul 15, 2025 at 9:53 AM CEST, Khairul Anuar Romli wrote:
> > > -     module_put(dev->driver->owner);
> > > +     if (dev && dev->driver && dev->driver->owner)
> > > +             module_put(dev->driver->owner);
> >=20
> > Why is dev->driver or dev->driver->owner NULL in the first place?
>
> When we remove/unbind the the spi node during busy, we will hit
> with dev->driver and dev->driver->owner NULL derefence.

Yes, but my question was why is this the case? I.e. why is
dev or dev->driver NULL?

-michael

--aacedfba284be24d50cf86206b89b6cc0845da34b5ffa309b922fc4abfd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHdKqhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jVTgF/UO2wa/lmVXWwv43pSVeadon8S3D55ftB
YDydFXlZvIlZ75h8RM350isKsxQoGuW7AYD1/m3cXykykltW6jeYuPIUAgRi70sH
FgzIbNteXSan9k1Lnds1T0algwwgjVymV9k=
=bbTo
-----END PGP SIGNATURE-----

--aacedfba284be24d50cf86206b89b6cc0845da34b5ffa309b922fc4abfd4--


--===============7356322256265424652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7356322256265424652==--

