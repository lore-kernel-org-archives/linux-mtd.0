Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7758AC44500
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzKCezKKMCIr7dMUdeaEVyuq9eo0ASWai1GBw+Rtw8s=; b=1kad0i77wZc9WlGmvmzKzKuu3y
	le4n6FXdCZB2+MaihnPvXY5/S6l9NxzyDfBZggl/PEhSMea+k6RD4RJvMlunHyY+ynO1NKDH/RGbj
	O1XDLHx+rMja1YSHT2ApskaW7qRtL3FCAs2m9SAFOiAs38s6nJIgXujKMdrk0ejCbEAYzNKtIQDe6
	SXgzABfh9baQMa9W98D38Qesf9GJfw3JpkY61VRV4Zvr7MiLWi5lgnXwQlQAHk+nztQeSkmBBhcXC
	prABwPyjdieFpWbAeIwJ9Ye4QemtEJd2VW4M6cBhIJrhQCalv8/0AnXeP8o9FuQhPvhbahqu2aVfq
	Q9neFkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjoy-0000000CfqC-4C0K;
	Mon, 06 Jul 2026 13:57:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjox-0000000Cfpw-3gh5
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 13:57:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 3C08A600AE;
	Mon,  6 Jul 2026 13:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 06FDF1F000E9;
	Mon,  6 Jul 2026 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783346234;
	bh=IJ84ZFLfnxbMa5FiyT2FzT5TRgxXzvFAljXuuYYn2eA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=VvonFYDC4V9ijYgZpxijEBHEwT4BFX2UWaY/JtUZ+RollDmJj/q3yCvK7841vCsgM
	 zPmXAnLWCr2csS2mePAG6YruaTnNqmvp33bnWqo2NMIXzTjN1d4yGm0J2n7JHmTzP8
	 THkbdnVodCI6a0AxbMzauS7SVbgk07oGzEcldBV69B5EvSYKC98pxGno6KwyWapO5K
	 cHgG3rj5BB2bBzYyLlBvu7zE9gKcCtOWbCv6xgr/dnNcaci24A8zzaZHRchv/+vXPx
	 F1q+4AA6V8ik+Y11MeZcPsOkGaOHXa/8Z8HF7kpaRx9EmIjdCa8ScItqyA4kOqU/WS
	 RqcV3rRlbZzoA==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 15:57:10 +0200
Message-Id: <DJRJH8H54BBB.9ZNM5OJBFG47@kernel.org>
Subject: Re: [PATCH 02/30] mtd: spi-nor: winbond: Normalize names
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-2-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-2-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3937800320212622319=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3937800320212622319==
Content-Type: multipart/signed;
 boundary=145109b60d41ab18fdbd06d0258c84cbfc263ab09b2fa0ed310d2c243b85;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--145109b60d41ab18fdbd06d0258c84cbfc263ab09b2fa0ed310d2c243b85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> Winbond chips cannot just be named eg. "W25Q02JV". There are always more
> letters after that name, some of them matter.
>
> - W is the Winbond prefix
> - 25Q is the type of device
>   -> 25Q indicates a quad capable SPI NOR
>   -> 25H indicates an automotive grade chip
> - 02J is the density
>   -> in this case 2Gib
> - V is the voltage
>   -> V means 3.3V
>   -> W means 1.8V
> - The next letters (either 2 or 3 letters) are completely irrelevant for
>   the software and purely indicate the hardware package.
> - The penultimate letter is the temperature grade
>   -> I for Industrial grade
>   -> J means "above" industrial
> - Q, N or M indicate factory states (like QE=3D1) and also the DTR
>   capability.
>   -> Q and N typically have the same IDs
>   -> M chips typically have a different ID
>
> As a result, W25Q01NWxxIQ is irrelevant and would better be named
> W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
> etc.

OTOH if you try to search for that name on the internet/datasheets
you don't find anything, while the xx somehow indicates that
something is missing here.

I haven't made my mind up on the naming. But I also don't care too
much.

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--145109b60d41ab18fdbd06d0258c84cbfc263ab09b2fa0ed310d2c243b85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku0NxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/heRQGAqZrtHCrl2OG1qB0kaxao9xYvgNLrG73Z
RQx45fYo4bHF9kYje7d94IvODPZRdppkAX0cOuOJCdRHzLTewX9469RTEPNSymhQ
y8N+39YiIpQe88u79AaQrcUPwiJ7V3ngNhw=
=1dym
-----END PGP SIGNATURE-----

--145109b60d41ab18fdbd06d0258c84cbfc263ab09b2fa0ed310d2c243b85--


--===============3937800320212622319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3937800320212622319==--

