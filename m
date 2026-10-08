Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06171CA600A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2026 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrB9OwKYpyaEpCoGsXpSHByk7u1vQK9qB1ByJjPmyWU=; b=G0TqQPfHlEL7wvCMDvdhUlhNkE
	/PhFGACq9xuhTfTTBC0ULCz0fZVLkC9Fo4FKqqfYox6DThOwmKy8cQBcjnvTIMb3yGM2ioJzuxSJw
	xWXzVLmwjZxAcT0vgbONvifff8nVUK2NmFXPV6CtweRWmS6mKTESDD4GCm51VFZgOrR/0VQxZMOss
	nffwjNgRRddzd8rbnVNFCwyBPxvGOMon9Y45QGs7uuNBBxAoIv8fiadQg4Cx8NgygB1/WGh9w+h0B
	hSsFkRu9ITNkeTsjuVWTws+C4PWZWmSBAN+a+xqXdJKJ0wcy8BsxUXiCvRMUOv43vbv0SonzxNCma
	4ffoQa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjYe-00000003ste-3k1P;
	Thu, 08 Oct 2026 08:32:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjYd-00000003st2-3Exk
	for linux-mtd@lists.infradead.org;
	Thu, 08 Oct 2026 08:32:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43C6240D9C;
	Thu,  8 Oct 2026 08:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9721F000FF;
	Thu,  8 Oct 2026 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448375;
	bh=iq8eBcxmqilWyg1kTRJXBDPilNdAqHLw9tPVm6xBm54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FSZIqI+5eN0OMTa541Ep/XXXvSzF3IIQIATRhamU5oibL1crSqXKwKFrGpYWONH8j
	 F8h0Xe2GmdfJ36ZXH9/H4qD/VTcjLPXcwB0nwYTGJ87eoyGSL1AuMjnBY6S2elYgIO
	 V6rr503qHea0rKntXmQryPaxQgPDt0CsxXAEmgTZHehJsYsJQQtVp76tuTSTX+BgS1
	 8rbvyzhmWbnKbKJO0cg7zWz5HfHrGXCMhrt777q3ZVeGGFU6ycSQ5Sp8h7evcdKyh1
	 ewj27Y2hyFNO1WGjIrPG6NIgERQ1z4y7oSg7357M9rXsHGYFB/uDb9HGjHmtvhdBiU
	 5dsxYTxd4IQGQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EEB5D1AC57CE; Thu, 08 Oct 2026 09:32:51 +0100 (BST)
Date: Thu, 8 Oct 2026 10:32:51 +0200
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
Message-ID: <asdVM883VTQy7WvH@sirena.co.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-2-paul.cercueil@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20261005081141.33688-2-paul.cercueil@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============1749746704702160556=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1749746704702160556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bMjej1itY0YpvJ9w"
Content-Disposition: inline


--bMjej1itY0YpvJ9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 10:11:36AM +0200, Paul Cercueil wrote:
> From: Tanmay Jagdale <tanmay@marvell.com>
>=20
> Add a 'panic_write' flag to the controller's capabilities struct.
> When set, the SPI controller indicates that it will be able to send
> commands to a connected NOR or NAND memory in the context of a kernel
> panic, which means without sleeping and without relying on IRQs.

> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -398,6 +398,31 @@ int spi_mem_exec_op(struct spi_mem *mem, const struc=
t spi_mem_op *op)
>  	u8 *tmpbuf;
>  	int ret;
> =20
> +	if (op->panic_write) {
> +		if (!spi_mem_controller_is_capable(ctlr, panic_write))
> +			return -EOPNOTSUPP;
> +		/*
> +		 * Only support panic writes if we'll go through .exec_op().
> +		 * The regular SPI path (spi_sync(), etc.) explicitly mentions
> +		 * that it can only be used from a context that may sleep, which
> +		 * is not the case on a kernel panic.
> +		 * If this changes in the future, this could be reworked, but
> +		 * for now this will have to do.
> +		 */

This also needs to ensure that the queue is idle - we'll still execute
spi_mem_access_start() which flushes the queue, and we've got runtime PM
operations there which might be a bit challenging in a panic situation.

--bMjej1itY0YpvJ9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdVMwAKCRAv73Ows9A4
ia6sAP9XLIb7WVrrhIXZAUfVLxJFlp3a1hqrTX9kyDiYkzJdLAD+JP92HbWPevEy
jt/66JC+BVhdm8A4lcLFxUo7eAT0dgQ=
=YF7K
-----END PGP SIGNATURE-----

--bMjej1itY0YpvJ9w--


--===============1749746704702160556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1749746704702160556==--

