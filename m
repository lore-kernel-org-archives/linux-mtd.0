Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E44E7E0C2
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PySi8HPXxzD1p43wVzPBNxkxPvD+bIMP9RB15oH8Zuo=; b=tBNn4xdBtnJEfaDOKV1XC4I9OI
	Wby78yYN4zqehrkoT4QQWN6ZzQCUDhSvfZssc0D6f/L1tOLJE9fuoZFFYrPQGkNfQQeCuMxdqM2mg
	OUKuneRMuZBP7nK82se69QUXmLf8jVx64u3f5xgwivDg5n4WbkpfMcTcVy9BpWPnEXz6a2zF3QBbi
	lG1zY3pFosoPNAp4UC3xFTX1NpiD627+Kvpvl1ihKa+qg2ACfrnQc7iU7UcYfBDy3xb1hQl60jyYz
	lfSB76xRCRJ/s8mMLwPvewLQHqu89CGwX3ennkaAGdFqwhexOY8c0WoVKL4jUjGETmxh4NMMN7IhP
	a2v79TvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOfr-0000000FFR3-3RIc;
	Mon, 09 Feb 2026 10:39:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOfq-0000000FFQT-2tMu
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 10:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B93C8600B0;
	Mon,  9 Feb 2026 10:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C358C16AAE;
	Mon,  9 Feb 2026 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770633561;
	bh=QckGuiHf5eAEnsjLGsS2f0CZr/2Y189C6hZIA1Tgrp0=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=JiSv5bsLmSl/Ax7EpXpe75tymHT/zmBXD8HMZzWQqiabEtC3FxKw8j2cWHAYMM5FE
	 R6zJG9UVgSh/v9KgD+qIiPQLXeXwVjlUy1ldvvmp3ZypOBoI5zMvgWO7ZOOu+WvKr5
	 GyWZhX6q1080jajNlAtzkQ/tlSSu8gCJatAH7sEeGBvcpYl3UAfvc9I4BDP4GnNkTb
	 Y4HefdLurocwfGMYtaidaHhDT3XkCcpXJUNmAYME4Ji8YGCAdHs+6/9E0BEgKkCRsX
	 IhW4LnPhCBUGeBey6UQTDrpYxO7TFY1uNcfPajqatgO9qXDkjORKSYs4iDIA3YIvr/
	 iWmK36KvSWO4Q==
Mime-Version: 1.0
Date: Mon, 09 Feb 2026 11:39:17 +0100
Message-Id: <DGAD7N254PVR.1PEPJM24A6679@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH v2 03/27] mtd: spi-nor: swp: Improve locking user
 experience
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <stable@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com> <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-3-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-3-c462ef806130@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============4212151280995263465=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4212151280995263465==
Content-Type: multipart/signed;
 boundary=fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jan 8, 2026 at 5:57 PM CET, Miquel Raynal wrote:
> In the case of the first block being locked (or the few first blocks),
> if the user want to fully unlock the device it has two possibilities:
> - either it asks to unlock the entire device, and this works;
> - or it asks to unlock just the block(s) that are currently locked,
>   which fails.
>
> It fails because the conditions "can_be_top" and "can_be_bottom" are
> true. Indeed, in this case, we unlock everything, so the TB bit does not
> matter. However in the current implementation, use_top would be true (as
> this is the favourite option) and lock_len, which in practice should be
> reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
> a positive number. This is wrong.
>
> An easy way is to simply add an extra condition. In the unlock() path,
> if we can achieve the same result from both sides, it means we unlock
> everything and lock_len must simply be 0. A comment is added to clarify
> that logic.
>
> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
> Cc: stable@kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYm5VRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ie7gF9HkvAipLEiYXKYpbEN8gOe5rzC9J9sA5D
bXDfCyYWwp6OMUqqaF4dZukYfPT4XQy1AYDKmE3lOwc8yYggE7O0F9gt6DFFrwHF
7oqhu03w1FHfo1yTfFH8MxD32BoctQB+K9k=
=LCKA
-----END PGP SIGNATURE-----

--fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44--


--===============4212151280995263465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4212151280995263465==--

