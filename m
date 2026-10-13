Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB33CC6B03
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3EM+fh8IPUDMZhc3DR62CXtlSbdc5UjnNE5FZT3q3g=; b=wdzqsDs8IGT4gldX/BdBw3UuOT
	F8f0kvEZYscCzPPXRhUGdY3xWYOnHLjIRKZNzQCJyss6wisPx0ojbpilesOMN1gprMgRrhs2c/1/4
	Pmnz0t8Rbz2CZguvCbI3eVdXN/0ld13nRBo3H4GIbRyt9EHOVTmFJbC+IQWJAxldbDposoGMj9lVy
	BzmO2XEEBxYbH9WDL0Rm9P/qgBoEM7tpVe9S20Yy9ViAPVBt3e3eyBL1qCzakF2ZlkBaMXvEtBv33
	eEUiNNSWoQy0/cm7o3Nuy5gimsO4ARL7SQKrW6Mfc5wz5Qac0MpvvkfuYzesk37t/02Ql7V1SOaAd
	ILMCQJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZy3-0000000Cc65-1HKx;
	Tue, 13 Oct 2026 10:42:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZy2-0000000Cc5z-30KW
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 10:42:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 792F2406D1;
	Tue, 13 Oct 2026 10:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A621F000FF;
	Tue, 13 Oct 2026 10:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888166;
	bh=FLoSrQhPeG9d2sAUZV2WghRPf9g8Vd0+KKpGYtfoJ8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNXfKFA0ehUZk2802jnLM7KmyXkqxYpf4ZkwhwrvnJOYdPqWUzBVh3OsCGtS0d/Lr
	 +tO72X2EnCthHmkKMEZiEhpgjjzT0tfaBI438ud3mNswBO7y92IBi5DyDZe7w9dpwM
	 dN145mmeBSs1TOYXa5wKT416dCZDCV4H6gOEf/N5m+ZfxWaEs6+945LYlearv6jfTB
	 aELnkmOWh1XRC1liALSQ1YOU22eM+Z5Yjflplxjj4cNfewO6koVLQ6dMsRsmccSfYb
	 23fi+MH1/VdigrjOUktQRpVBYMLyEZjhpgZ3ldrdLeaiO2LtDQVdcIkyi/PC3XQ6sn
	 HCxdoNQEIPeqA==
Date: Tue, 13 Oct 2026 11:42:41 +0100
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
Message-ID: <eb16cf0a-6b7e-4ea3-89c5-61ba0729492d@sirena.org.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-2-paul.cercueil@bootlin.com>
 <asdVM883VTQy7WvH@sirena.co.uk>
 <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7499972241505358173=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7499972241505358173==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVYvEWtD/Zuy0eL6"
Content-Disposition: inline


--wVYvEWtD/Zuy0eL6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:25:07AM +0200, Paul Cercueil wrote:
> Le jeudi 08 octobre 2026 =E0 10:32 +0200, Mark Brown a =E9crit=A0:

> > This also needs to ensure that the queue is idle - we'll still execute
> > spi_mem_access_start() which flushes the queue, and we've got runtime PM
> > operations there which might be a bit challenging in a panic situation.

> Does it though? The kernel is panicking so the queue won't be processed a=
nymore,
> it should be fine to just ignore it.

Do the other CPUs know they're panicing yet, and what state is the
hardware in?  I'm a bit nervous about assuming panic got things into a
good state.

--wVYvEWtD/Zuy0eL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOCyAACgkQJNaLcl1U
h9BbGwf/fEtwrUNGtObi0G+lPINw3irgjq4aUPmA1lkFzhV/7zmAOBtXjCy4/pp/
mx3qbP/STKN47G8E/m1e7qhkOOXfEVt7ckY0ZNg4zUeRMi7w7ok1gQHm49bgy+eD
7Eq/n2UBWtgSIz+CGU0+RxW1BLmz2rnHnJd08g0LlGFsHn7rxmBBQOJ8nnIUqirj
2B019P3McvROJvYBGgWY9jHdqAQbiro5QE1qBVKZMYjXNTonO/9RrFvVATDOi+CK
m/TKGKWt3ynbkpCSrBBN3dwc7W1s7Mk/q3gPdXJymZXsOJOT0Zlrv1ByjTX1hwMw
sbsRiuv17q4Iae/oAdeCliHjjOmOJQ==
=RxOc
-----END PGP SIGNATURE-----

--wVYvEWtD/Zuy0eL6--


--===============7499972241505358173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7499972241505358173==--

