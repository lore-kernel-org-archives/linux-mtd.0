Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC296CC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucV8/u+nhfYPt71qhEFEOFSmC7Lp0MOeKWFaMtNP/wc=; b=k5OwT03Mw7vUfAJMhenJ3Z19lo
	ufgs3Q162I6rqOwrpsbj9g3tF1LF/0nmJILLLjKpG1tzN73YFersY59rLGnSCvc/fxw6sbOL7gr4b
	ubxv2Vlnq47f1yq0ttlzGh6e3Yjd8q0dwLUsv2b3q7dsml5leZg3cEAdFB/HP5gMtq1SgJn6f+GAd
	bVl6ACSbWCVpoJWZYUJ9sPT8lZfD8dPKAcnvH1Ro+C2UguDwdiOqy+jUXi2CUSWaOJ4DlYClqW226
	BrVpPXc5iNjc2yFldTr1/aHyQATinLv0udf+2wBVcUF+7slwcufewbxdLNuPsKuoe+89jNk+fJMeT
	b4eoi0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGevQ-0000000DRyl-0OTM;
	Tue, 13 Oct 2026 16:00:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGevP-0000000DRyc-1GTt
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:00:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B4F74041C;
	Tue, 13 Oct 2026 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375D41F00893;
	Tue, 13 Oct 2026 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907222;
	bh=GT89SdLYKcTPHyTDdQVaS2OrKEugrdzMOrAYxnP+pdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dynWNo77WCapOS3d4Muc2GmGRAiZXjf/klQyxZC82XR2jCeu3vQF83IgCSMOMP1Bt
	 M5ReyTfuZGFwy3BV3bwb0pVs2HObt8xIMESOmh0CZLIXiUG/86ngNw013lm36KtXhf
	 11tsosQOYekiundjXO6y4Tbm4eYDurGMtM87+hj3AjHlca2mR9MRPUm+N7LRGBxURk
	 8fzPKAJQWEIJjB99BLerxagY66cB7iQbY9fv7jDQgLtWoDBZHK81fazfrFXhe7VT44
	 VJSFaA36jEWjUVdGUZ8j7dOMfYMQL2tPIQm7KyTe9xynJFQce4hqg3XUDvRwONB1v9
	 qF5e6QFvh9cUA==
Date: Tue, 13 Oct 2026 17:00:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH 1/5] spi: spi-mem: Add support for panic mem writes
Message-ID: <629a4f32-2efe-4212-ac1f-f64c487caa63@sirena.org.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-2-paul.cercueil@bootlin.com>
 <asdVM883VTQy7WvH@sirena.co.uk>
 <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
 <eb16cf0a-6b7e-4ea3-89c5-61ba0729492d@sirena.org.uk>
 <0d2f1d4149cd136ace8c1f08dc48ea7f25c5975c.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <0d2f1d4149cd136ace8c1f08dc48ea7f25c5975c.camel@bootlin.com>
X-Cookie: Some equipment shown is optional.
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
Content-Type: multipart/mixed; boundary="===============6386674528085888308=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6386674528085888308==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxDT0fBTa5S2qbeB"
Content-Disposition: inline


--sxDT0fBTa5S2qbeB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 01:00:50PM +0200, Paul Cercueil wrote:
> Le mardi 13 octobre 2026 =E0 11:42 +0100, Mark Brown a =E9crit=A0:

> > Do the other CPUs know they're panicing yet, and what state is the
> > hardware in?=A0 I'm a bit nervous about assuming panic got things into a
> > good state.

> The other CPUs are stopped, yes. At that point there's no SMP, no preempt=
ion, no
> IRQs, no time accounting.

My worry is what happens if we didn't actually manage to stop the other
CPUs - in theory we've shut everything down, but I've been burned by the
bug being IPIs breaking.  Perhaps it's just not worth worrying about.

--sxDT0fBTa5S2qbeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOVY0ACgkQJNaLcl1U
h9BziQf/c8UlsinjekCah8xPvRCat29/XPK8zPS7EEi/EpEDrFQLSCQYdseWqzXI
Ip3mmVz2jGtau0YX//XwQHmdCtgeby1srK/P2PnIQSjfx6l0M5NmCmUGWbVXyMFW
c43NDxwrMridL+TSEPDRNdGeT3400X381QTtnd4F/noddb7bI5RQVEDwk4Cz8v0g
ZN+YIuy//4eBmJBKjzrCNqJh5xHXVoObn2gbGCl3p9VzGI+oBVyTxwdDJtyZA6UP
4CJqQZZMEkYRcNHzhaDdk7vHh4o4jyEUGEKWcOLOXSpqQS81S6Vdgq6Hro1zjeIo
CyxRReQYqaUh6uV+NO267z586riDIQ==
=03eD
-----END PGP SIGNATURE-----

--sxDT0fBTa5S2qbeB--


--===============6386674528085888308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6386674528085888308==--

