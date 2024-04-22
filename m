Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF476C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhGhTY0RAej6JdupuQdZpCNx0AFWCwBRhNNruSi7ik4=; b=vkKNHciXhLI1RbBG7XoAv44L48
	Fw+5lZEAOqSOHP4s/aRnNtgFNKArouT3AdD3KoyVQLrS2oxYyL7aU1sthNqhto/9LYhGoWpw8cqcC
	toZPW97wjaDdPLjJafoAR/cmdkAg6OnAGewMQDysE4aTUnoyweSJeblO0UNXEGAdV+kCwEKJsWtjc
	eKvp2i0Aj+CuQxlt85GOgxE7CFPskpuCtRhAHPrzlaU3DzNEczD+hAZK2WVXz/L0b0mh80Yy/4Oxh
	g0mypEMZI/s9HnLRqaVW/Gfp3GWqXdzGBegud59HKYyrsqh1mT2TI5Qyt7UNYeRRST9EgAWBYZAja
	C8E20WCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqT2-0000000D449-0nba;
	Mon, 22 Apr 2024 10:00:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqT0-0000000D43f-1CPY
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 10:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD3C860C09;
	Mon, 22 Apr 2024 10:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9921C113CC;
	Mon, 22 Apr 2024 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713780005;
	bh=Zz/hGe+QiU8k8EUivQl4fsqSnza4y+Np7gXjWyF5sL0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=lkGNxy30oFrdBHx326ueMX/KPsk5ZGjrzc54bdbFslzEJHhYfSAI0NBGKrI3EsE2e
	 Ru/NN6hZrBqic18XaOhRzj69YKOC5bHLrzLkIN33/W4GnjjiIRsEb+YNfncu6pg58r
	 PP/pQr3SoUtL8xV5+LBhmxS4jbA3ZQzjSm9lRIpsveJMCr8SksKMj+mJ/SyUmahYzI
	 guD+SYu15yKNRgB1IvvaRj4dk0bvBvJMGgYVCI7uTM0D9rwktKJ5yEK9iCa5+9FPQw
	 8eqpfuUstbxkUMr85n8BONZhVd3GUIB+HKHxqX/gS3kZDzkWp4wsH+tzwCvZgyi2BK
	 TcKAuyaYeemkg==
Date: Mon, 22 Apr 2024 12:00:01 +0200
Message-Id: <D0QKB3VQRULU.3OGYN3AFBK3V7@kernel.org>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: introduce support for displaying
 deprecation message
Cc: "Ricardo Ribalda" <ribalda@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-7-mwalle@kernel.org>
 <33e23cbb-4e52-471c-929f-65316e668ae9@linaro.org>
In-Reply-To: <33e23cbb-4e52-471c-929f-65316e668ae9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_030006_489949_1B0BFC19 
X-CRM114-Status: GOOD (  12.09  )
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
Content-Type: multipart/mixed; boundary="===============3239819776106943199=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3239819776106943199==
Content-Type: multipart/signed;
 boundary=2335d7d0e3efe6f9e8292475c35fd961a93700a4c057916999c70d64c53b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2335d7d0e3efe6f9e8292475c35fd961a93700a4c057916999c70d64c53b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Apr 22, 2024 at 8:06 AM CEST, Tudor Ambarus wrote:
> On 4/19/24 15:12, Michael Walle wrote:
> > SPI-NOR will automatically detect the attached flash device most of the
>
> SPI NOR. Looks good. Please follow up with a patch in the same patch set
> to use deprecation_version, otherwise we introduce code that's not used
> and we risk to get patches removing it.

I missed the RFC tag this time. My plan was actually to have this
patch already reviewed and then repost it with a deprecation of
some flashes.

But apart from that, it's the nature of this flag that it might be
unused from time to time.

> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!

-michael

--2335d7d0e3efe6f9e8292475c35fd961a93700a4c057916999c70d64c53b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZiY1IRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jUZQF/QkEs+ceCCZfRNLRIhtQw+ku1Bv4OwoR9
Y32gBAHnPVrPwkjizFLe7yqDaDjuXUFcAYDtG9RqyAMc0LzI+KmbOiO1z4K10pbj
c0TUjZbjlcHKtxkVYwp60hAXuFh4psFko2U=
=E/IP
-----END PGP SIGNATURE-----

--2335d7d0e3efe6f9e8292475c35fd961a93700a4c057916999c70d64c53b--


--===============3239819776106943199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3239819776106943199==--

