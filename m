Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901D7C7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 11:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F36C22BE8
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 11:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EU8uX7zD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="xDuN5S0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F36C22BE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3JJ6TX8ctNm78Re7Da7YeqK6ImWsV41Q5LLnd95XmGE=; b=EU8uX7zDjLZv1MQIMaiGVMPnb
	wQ701cuRA9Da/NnzbGg3FUoZ8lnuGf1n18cISaUOaqO5Uj9EbNvwjEwOlOd40BshJp8AuV74hSJQM
	DVNRuZpACxqoGCMiwnX+UcbK+Ynd96ZPdgIVDV7Wj/7a51l8OWJxgY1aE7+sF7PYEExVUOUYe8A16
	t9/sXhm2yegvFQWG+oOJPNWrOchFyDqN12f/SEDn3MxjN3OVME+xhq0Z3W6QDOJH1nG1NpU5HNbpt
	aKkcOAaq+TmCklqPrC7+5T09DDCYIwdpeb99USGncLAmKKNuSUwD3Gt1NupKSd/d6pA9DI42gBM+5
	wKM+zlOKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqyTs-0006WA-Ac; Fri, 26 Jul 2019 11:33:48 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqyTn-0006SA-G3
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 11:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Gf3w/MVbMZMYK8bIC4gRWxvIqP0knReDLN6eNPEqKM=; b=xDuN5S0H1Z90uPzdw6R64amMy
 gnMBiADJuFYD7QblFkqSVwB6tn/WF7BGvvo30k/J0aPMmA1HEiUnpoQWAzka7PaHDQ4Joyhpn28yE
 EF2CUDXHQO0sCka8C6a7kNpPIaO1hAAThEsGBgsnR0u9wX9Txm8yC32A/rlHacR2+gL5o=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqyTc-0001Mp-Sb; Fri, 26 Jul 2019 11:33:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2EC622742B63; Fri, 26 Jul 2019 12:33:32 +0100 (BST)
Date: Fri, 26 Jul 2019 12:33:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
Message-ID: <20190726113332.GD4902@sirena.org.uk>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-5-paul@crapouillou.net>
MIME-Version: 1.0
In-Reply-To: <20190725220215.460-5-paul@crapouillou.net>
X-Cookie: List at least two alternate dates.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_043343_562049_EDC585FF 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Artur Rojek <contact@artur-rojek.eu>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2606098861722823590=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2606098861722823590==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 06:02:08PM -0400, Paul Cercueil wrote:
> The board now uses the simple-audio-card driver.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Acked-by: Mark Brown <broonie@kernel.org>

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl065QsACgkQJNaLcl1U
h9AE2wf7BtVnDND6hd0UergsxXl5U3RJXvpiGgm/0yVLxuFEWPiM0EFqLGMWqoxE
3l20EeSRpPmuyPH/GyBi4VYbtfk/QkickfZgmRTnK53CZURHGm15Dr9Prj6WJ5Vp
H8QHogCOvGkoZGZh0E7Upp1Ofw05EC/ZStES9Ptw0TRNRENeP6SIRNDZJSBp7A5/
TpEw+fvcu9R2andSKgKYEsZJhppM9oSRB6H4XRNM1Zxu6FTNfkmMG0ycTRjwJPvz
ZXt6d0bq7TrYHkNajY1Wk1JwfM/wPlcW3xATpeBcp6RgazsL+i2T3fe2J541EGzJ
KSs0o9NZufIfr1QaVv4L9HrMAsSE0A==
=jJYl
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--


--===============2606098861722823590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2606098861722823590==--

