Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3281CC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 18:16:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E511564E24
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 18:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E511564E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KlWyopzgl45J0194EZs+Dd8PsKi+8koGdj7wuBSqmG8=; b=F5GfEa44g7ilp79QJkaepDN9D
	84NT8M97y1qFmuK9aokThH3/rx1p+sejJULMr1IiFqR4peSl4TtixehgqO3bCFxx6FpV3Rj/aSMR+
	Ddofg87eEJ/E9S5c4Cf2eq1Tt9LqAUPqYl1IAz15QlRhIxL2oq+siYY24L6okRl4M+WV8mftfr450
	jNsMbsU/OZm/zxhKSVezo/lJ3soNDFIR70nv8PioDI/FkQ02/27Hs8S38era4iz3f/YQkOdONbDHR
	QrPFB45DcZtPcrNYhkV3LoR0WDAiNF2+p5fpxTk436Us9PxbNOudP/adXKcUKnOFkAQBzKSnvEscs
	pFVXfl/ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEcDZ-0004vK-GM; Tue, 23 Feb 2021 18:15:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEcDX-0004ul-64
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 18:15:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9BC664E7A;
 Tue, 23 Feb 2021 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614104126;
 bh=mQU4Br63J2BOUGthrBwhXAnfS4h7IIh12XPwgj5+I3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4O/tfdzgyeQqqxC4kOzeMZ83RSqsKmFgZ/+Ltd8apHxa+NCNMbXzR/MX2Pftamzb
 WbiLBjbWAJuT2yXptuqnfaoca1rx4teegyXNO3G1gjhtvS4RS8Kghf/h9wxXNoBV/d
 Vh/LlmXZfygUxA8U9njMACIuTBUxfoafzdId9bbKjGCpr79SycnERhQW8IvOypfLUc
 884B7IVkgTOq67qA4CgTdOB58H2Lt0PzDqEtw36Gblsv10sH7NFqRxVUYOVER2w+8u
 QWsHSuUpwxsXWUva7BAWCFpBbL40F3RqzvNcaqKwIgkafoTt+5H/LZEJkC8xoR4oEH
 9qNjTgIgaE1ww==
Date: Tue, 23 Feb 2021 18:14:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Message-ID: <20210223181424.GJ5116@sirena.org.uk>
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
 <1612517808-10010-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210205104736.2771074c@xps13>
 <20210205133404.esqqeokhlp4askpq@ti.com>
 <20210223141344.7ad25831@xps13>
 <20210223133649.GD5116@sirena.org.uk>
 <20210223152504.jtq4uxfepz7bdxhl@ti.com>
 <CAMuHMdVQUCaiBwdU=KdFOu=D71kYbGqoqp9V3pLsXXE0AAdCog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVQUCaiBwdU=KdFOu=D71kYbGqoqp9V3pLsXXE0AAdCog@mail.gmail.com>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_131527_297000_C21D60CC 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: "R, Vignesh" <vigneshr@ti.com>, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-spi <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 zhengxunli <zhengxunli@mxic.com.tw>
Content-Type: multipart/mixed; boundary="===============4563207089793387966=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4563207089793387966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rmm1Stw9KgbdL9/H"
Content-Disposition: inline


--Rmm1Stw9KgbdL9/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 23, 2021 at 07:07:37PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 23, 2021 at 4:25 PM Pratyush Yadav <p.yadav@ti.com> wrote:

> > To select the optimal number of dummy cycles we need to know what speed
> > the controller is running at, not the other way around. The flash would
> > always set the top speed to its maximum (say 200 MHz). But if the
> > controller is only capable of running at 50 MHz, you will end up wasting
> > dummy cycles. I don't see any API to communicate speed from controller
> > to flash.

> spi_transfer.effective_speed_hz?

> If the driver has filled this in (after the first transfer), you can optimize
> dummy cycles before doing the next transfer.  Note that effective_speed_hz
> might not always be the same, if e.g. the SPI controller shares its parent
> clock with another component.

Yes, that's what that's for, or just go with the speed set by the client
on the basis that it should be safe even if potentially wasteful.  You'd
need to fall back to that anyway in the cases where the controller
doesn't or can't report the effective speed.

--Rmm1Stw9KgbdL9/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1Rf8ACgkQJNaLcl1U
h9AotAgAgu7zrgF6PvPVwZZ3i4SuicE9EJ+mDfYe6EInpy/JuglPDAsXllpIh6vD
RCWCQlct36+Q/sXY3apGjSF0r4xUKAVv85VaXhNXEAO0m18j4vyZjjqJgS5veeNn
Sjh3/CML2DBK+dsH94tFD09axQRKIG1Cn9yUlOwI0lHBs7swVJ9fjacQivUho1te
GHNf/cuuVL8ebCzA/i9RGZjJ2HpTuInuv1cjgruyZrtrb+edMa5FnWg+PYjJpZQZ
+krYjh8vQUrYfeU4PMApzuFqOywoLRR+2MwDkC+dI7NHyfsyRKmppWLbQUCNw3hV
rKhWCGqS6KQsJ6M7nwc2e8W5q/7dog==
=eX44
-----END PGP SIGNATURE-----

--Rmm1Stw9KgbdL9/H--


--===============4563207089793387966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4563207089793387966==--

