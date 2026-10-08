Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8D0CA6007
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2026 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEVmY5aIN6J0bvUHqJNoUkizS1x5Hm4HThpG1I9H6ls=; b=WT5/Q1WkpSW1TeggPAMwncKwJf
	O18iRXchEzR5da33GcLG0yQbZB1mTt1rFg5tgsoTh62s3Ai2KBk/8VkglMFXrKz7REsYr9872l6eX
	TUtP6DCQYrxtUXR0yE2RpiKfF10OQMhsrmvFbaC27lBDnYzb1NyLNhchQZFXpVxk90pSH5CPnHXtp
	yU4/WQVAtjXAky5qQrbiD3T/2C0jP9aNTiiY6b16KiTfDzkzSpltrtGSyz32cUhWbAeOH1+ZWCgV6
	7rWFacETCJ566SId+uXjocIiv2QzdjN4z+vspI+OqSmyrZzMOIlHM+Pwr7Y89JY2lxBe6CjSPAlMI
	is0edwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjcQ-00000003toE-0li5;
	Thu, 08 Oct 2026 08:36:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjcO-00000003tnW-3TtH
	for linux-mtd@lists.infradead.org;
	Thu, 08 Oct 2026 08:36:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01B4A601DB;
	Thu,  8 Oct 2026 08:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E871F000FF;
	Thu,  8 Oct 2026 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448607;
	bh=2CnL9zUWhVoDK+CrhOc4XAGFdTLKxKk4z4dtrk7xVJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hl9HS+hYhcUaWZQ+m2rEEM+ITObU/vWUZx1BDy/OoEKXA3sZ+PhMmaWMATUSBxoKv
	 W1DdoJdfwS3W653HZNJfR1197VkjVc6ojEBzR8ZKG5FTibA20i0ZjdcBJEMHwBBFeY
	 ZKuTtXtRHAcdJvb96vgeBV9W7frxYHWslkBYQJXCVplu+mNW1SUyQr7DHlK96M1p/B
	 5ih7PtYZL+gWPzUW9WV+mSbsby2DqzHXMNfB7nf02XU8/HahcuDdRWM7Ezdeq9vPH9
	 5yx81leof3+gjaE9tcuV/Hfk12dOlvOsJYvJCaCKEp0KYFTKy0t1LQy+uv//7rVNmi
	 XwaoyCADJY86g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3F9531AC57CE; Thu, 08 Oct 2026 09:36:45 +0100 (BST)
Date: Thu, 8 Oct 2026 10:36:45 +0200
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
Subject: Re: [PATCH 3/5] spi: cadence-xspi: Add irq-less support
Message-ID: <asdWHQGNfEeGop2M@sirena.co.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-4-paul.cercueil@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20261005081141.33688-4-paul.cercueil@bootlin.com>
X-Cookie: You will forget that you ever knew me.
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
Content-Type: multipart/mixed; boundary="===============4972965289549077073=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4972965289549077073==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wJo3xw8ck7BgNLyf"
Content-Disposition: inline


--wJo3xw8ck7BgNLyf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 10:11:38AM +0200, Paul Cercueil wrote:
> From: Tanmay Jagdale <tanmay@marvell.com>
>=20
> Make the interrupt line optional. If not provided, the driver will
> instead resort to polling registers.

This needs a binding update to make the interrupts property optional.

--wJo3xw8ck7BgNLyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdWHQAKCRAv73Ows9A4
iWUOAQDv4d3so/X+bhkXiwXbiv6FktJQd3kLoft2zuG5ZbHvWQEAmrSz/6cIYlHX
JE35pttFWPJJ0Vqr4e5t5xZuFSZ4sws=
=sI7R
-----END PGP SIGNATURE-----

--wJo3xw8ck7BgNLyf--


--===============4972965289549077073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4972965289549077073==--

