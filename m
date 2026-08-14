Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD43C5CFC1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QjGjtbGNbyZ+soKhlMICRP664xCkTKPMT0HPEnynbo=; b=LOGyGcLkX++1FM2rQeHcHDRVfc
	jRzOkoPrglCikctwgrQlg4KcA1mFAAnAJv2CYKoMXZNpXJZvuGgeyj2X9E2cBQhMk3/qE+fdzmpiv
	gaUaX7MssD2dNe7ktUn25yzMhCuU222LGXKchZVwYitMe89mOdD5yNdW+X998j1Nd+OdLXFrLJuKf
	uRJ2CPOY3hE6+PZsmm3fopW39oyPA9MYRFAWBdYyInbZJEidS/q0Jd0KFZnnxg8X9UkQdgFDaUklc
	4xk3QoyvX89m58pSzlZsq/cx7ALSRbc1/teCMqAGiL/EzBfL5jFQcv0kVtDMSSmUmu8L52vULvZGM
	qQmMKFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoPr-00000002PmF-1VQQ;
	Fri, 14 Aug 2026 09:41:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoPq-00000002PlT-06cs;
	Fri, 14 Aug 2026 09:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 75FF2601E0;
	Fri, 14 Aug 2026 09:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A218E1F000E9;
	Fri, 14 Aug 2026 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700489;
	bh=Mouec021QwWhkbvOY0xKG8WDEVSG2UIkRZWo0+Zu9ws=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=XGoG2tUl6NlXa9/xnTaPSgJ4dGFq9SGZYiBfte/zOH9ZACYrjBDsEzE9FwgSCgXJh
	 deEJG/J5CnlzReGiM7eY4BhFybQeo1ldIBntGCiQa8ncYmW13qXbnOP2f9leRmyRHh
	 Zq0m1U2MUJLeoJUAhIOfuhYz0e/IhG8QozVTdaijix4kpgV3CyjgkgnGNM1joqRvGz
	 O/+QEJr/A1hB0+A0RGpMJckmFZm/h7SUosytF4s4BVQIovlLKjAKxRacnOANE0xGXl
	 Rm4x8XWhnQLWJ3zuR2xVUR80+4exO1YgUCEizZEJaPgMWt10eeTsA43AC6NbFLQgVr
	 Ze8XhUpt5aCXA==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:41:25 +0200
Message-Id: <DKOKGNRZQ63P.3E1LM63BEAQ5Z@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the
 part name
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3356085814375747680=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3356085814375747680==
Content-Type: multipart/signed;
 boundary=b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> We currently print through sysfs and debugfs the name of the part if the
> .name field, which is legacy, has been filled in the ID table (otherwise
> "(null)" is printed). These IDs had an interest until manufacturers
> started re-using more and more extensively the so called unique JEDEC
> IDs. At this stage, a name that was tailored for a chip sold in 2016 may
> no longer be relevant for a chip sold in 2026. Still showing this name
> through the various filesystems may confuse people, removing these names
> cannot be done since they are now part of the user ABI (because of
> sysfs).
>
> In order to allow overwriting the .name field (which is part of a
> read-only structure), let's create a spi-nor pointer which will by
> default point to that .name, but which can be cleared in fixup hooks to
> make sure the name is hidden on newer parts.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7ixRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gfkwGAn+E/Z3W8sOL6jUWx8OfIMeOInPNl3KQP
A0KLjLQEzYH4B7PTsNTZGIGh5Rve79nAAYCjnFw9/rBYumr2UMeVS0p8GuSvLHef
wxYQbofkSnJjUcKzPvSbO3QsWRzABFlFCDg=
=dYL5
-----END PGP SIGNATURE-----

--b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e--


--===============3356085814375747680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3356085814375747680==--

