Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B17FC3DA4D
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mum2P46EzVMpw18LhytEa3L3mckDUuyl3mMbnQ1IdI=; b=hdnXUdRbTkpw+f3ih4jXchgUXT
	I1/vEej7Q7gI639Tz+S5EpT/dmSdeexVaLe2WcDUVTZ7QhSx33D+h+/7Gp5AiaVs2fzl6UjxL02Cb
	msdNhxuA7Ywj2LBoaYrW5XrPxoz6mjD619YgMtR0ZIJUbtBKSxwlTYFByi2BNRnQUX4SkGLLNxqld
	sCsBb7APTst+XhOmEelwPO5a6Nyn6dJIKU4XeWgwtslTIfvrUl8p89eTIRTc9d2gTyB2sM0rROXjy
	Kn33Gl0Zw6anP62kntv9Z0TSnrxzhzC6BSQhvH0LRB+n8akY3kPVXw+IAEPxEJTkjc4jq+19gs94K
	+6mb3pwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSD03-0000000HCKw-3HuW;
	Fri, 12 Jul 2024 09:55:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCzk-0000000HCEp-0P8x;
	Fri, 12 Jul 2024 09:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77F63CE0B2D;
	Fri, 12 Jul 2024 09:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3E2C32786;
	Fri, 12 Jul 2024 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720778112;
	bh=VHgWyoWjIKaO1gLhmwyqxCG0NgL1aQmum5wsVrDPiiE=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=ZecFFwwtAOOh80u9qYekts6l8YtCdGU8XuUm+MNK8HHev1vlPyexWEISjh0+hvUBG
	 1ayBH6kTc2hC/9xkViVT/C1PqnzHi4riccGduaeyeSKvkwWNNyNK1vXVteWzbt1xzR
	 VeMkpwkv5WclR9EqxIEq7y2n9nPq+Xh43YnebkzySOHBlCgYKLuHkqvP2E749NDGXz
	 tq0rfl7Fx9l0cwnOpwuMqjdhzkozLhZrEtSB6L3qszO87Ax1ukfa1qPYxR5xtR3R2g
	 8bgkzOCE0NwnVv6RLOhJWzXfNLbJbLBUOLv/Rb3Obak1Miezs+gsvrjIzqsi7SrFvn
	 ahkJeQYZ4mzpA==
Date: Fri, 12 Jul 2024 11:55:08 +0200
Message-Id: <D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rasmus
 Villemoes" <rasmus.villemoes@prevas.dk>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Esben Haabendal" <esben@geanix.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device
 id re-use
X-Mailer: aerc 0.16.0
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_025516_498462_BBE20AB9 
X-CRM114-Status: GOOD (  13.99  )
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
Content-Type: multipart/mixed; boundary="===============2051658080261574462=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2051658080261574462==
Content-Type: multipart/signed;
 boundary=aee9b33c528211d8b06b0c46e19f7e654e98074c381b0b5a8e637c093686;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--aee9b33c528211d8b06b0c46e19f7e654e98074c381b0b5a8e637c093686
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jul 11, 2024 at 3:00 PM CEST, Esben Haabendal wrote:
> As a consequence, the SPI_NOR_SKIP_SFDP flag is no more, and all
> drivers that have been doing optional SFDP is now marked explicitly to
> do that using the SPI_NOR_TRY_SFDP.

First, I haven't looked at your patchset at the moment. But I'd like
to take the opportunity to discuss the following (and excuse me that
I didn't had this idea before all your work on this).

First, I'd like to see it the other way around, that is, doing SFDP
by default and let the driver opt-out instead of opt-in. This will
also align with the current "SFDP only driver", i.e. if a flash is
not known we try SFDP anyway. Going forward, I'd say this is also
the sane behavior and we don't have to add any flags if someone want
to add support for an (older) flash with the same ID but without
SFDP. With the current approach, we'd have to add the TRY_SFDP flag.

Now we might play it safe and add that SPI_NOR_SKIP_SFDP to any
flash which doesn't do the SFDP parsing (because it has size !=3D 0
and not any of the magic flags set) - or we might just go ahead and
do the probing first for *any* flashes. Yes we might issue an
unsupported opcode, but we already do that with the generic SFDP
flash driver. So no big deal maybe (?). Vendors where we know for a
fact that they don't have any SFDP (Everspin I'm looking at you),
would of course set the SKIP_SFDP flag.

-michael

--aee9b33c528211d8b06b0c46e19f7e654e98074c381b0b5a8e637c093686
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZpD9fRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gW0QF/aA10t5iors/5JcBokw9E47uTSzUvxCoi
NSOzc/Px3FUg1ZGuj0lS82ccJeCIbR69AX4gt2bRjp5TWDp7clxAH0mAE0UWreMw
ZHmZ6GClSkkuvrktzl8GLR5tFulIDA5Xabo=
=LhXX
-----END PGP SIGNATURE-----

--aee9b33c528211d8b06b0c46e19f7e654e98074c381b0b5a8e637c093686--


--===============2051658080261574462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2051658080261574462==--

