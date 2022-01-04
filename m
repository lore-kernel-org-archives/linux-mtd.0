Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04579C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RUSha86kD72t74/uE6LD4G3lp91e1AdficIWOiYZGQ=; b=LGasAqPVSMkeu3zL9KE/CNabVk
	dBi8UXPgaD6JtPuRJMF9OxBCoYo5gtkOqGhavaDT+qgNT5BKIny6nW2w9CJ7y7YvcihjUy3+nl3gM
	9lv9CRHhtUN7OSEzIs2aIrAHKoGialPePCedSbdjMl5e51V62hhAtEo9yNe8jGoPTXajOG6JZ6fH9
	TruL8O4oFyixdqSDmhYXxYdSxNBWiHvYsepsxTYO4Ob4cfYbnpGKOuATtRE6uqcRhAn/d1M/uu9MT
	m19dP8B3Nw+CiqWBjBIjDj2bUJFTGlNeLqBTSQ0fzQ4mwO2TsekD1olK1zn1YZigyZ2WRC2xiaI12
	NxZKTQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4lBi-00Bn2N-39; Tue, 04 Jan 2022 14:53:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4lAz-00BmkF-Qu
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 14:52:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC8761481;
 Tue,  4 Jan 2022 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9950CC36AE9;
 Tue,  4 Jan 2022 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641307957;
 bh=ZCPX5ZuwUTQCHJSWO8jxjREVpLRUwnoOPoTIL6oh1Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QDDg/rh15NWsflL344WkBl/vH2+x6dFITHfnMnLw0reJhKtLUdXniloiqNFFGrBQ8
 R02UhkvbVl5m0lKELjocVNaHkBWj7LF2zyo2JsvJSVmL8XY2WdKMPKSF8mWuEULMaM
 Esl1NsEacXU0x8Ye1obEGrWIdMivJsauDEhkgO4p8fKO5FdbouEt46tlXoLyfEXpAf
 3XvuYRIT+4uVQYkt/oXBZg/p3padUccdXyN5Oci6jYBkEOmjsnrX81tKKkq2x85P2E
 GRmhat4aT4estD/nwibBG7UTWNwsF391/244gtd+XVdpJjX3R1PxCemtiacaaKwMmO
 C3zLl6ZKjzirA==
Date: Tue, 4 Jan 2022 14:52:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Palmer <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, p.yadav@ti.com
Subject: Re: [PATCH v3 01/17] spi: spi-mem: Add DTR templates for cmd,
 address, dummy and data phase
Message-ID: <YdRfL4gC6LimCmRq@sirena.org.uk>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-2-a-nandan@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220101074250.14443-2-a-nandan@ti.com>
X-Cookie: The horror... the horror!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_065237_933764_66F64B75 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============0337440014048850105=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0337440014048850105==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ddlCfAFjpBbRrVn8"
Content-Disposition: inline


--ddlCfAFjpBbRrVn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 01, 2022 at 01:12:34PM +0530, Apurva Nandan wrote:
> Setting dtr field of spi_mem_op is useful when creating templates
> for DTR ops in spinand.h. Also, 2 bytes cmd phases are required when
> operating in Octal DTR SPI mode.

Are people OK with this?  It looks fine to me, if nobody objects I can
send it in the next merge window so it's there for the MTD bits.

--ddlCfAFjpBbRrVn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHUXy4ACgkQJNaLcl1U
h9C9RAgAhWTy/5TFqW6cERJG0k6uFOv5Ys++XJ2F4/EKvq8z9xDI1GaDv89IqJZi
w/5sjP9gHrJyfzSEKBWj3ZV8JhEVXOo2Bd4wv8N0jN7kZ3qZ8AMJ/whh70k7OAXw
oepi9u/d/5R5CmUZji6fFR6hPx4wjbUw9i4cUcoMYDuLY9gz73xWKykD0mJi2Md/
bGj+mddou0YC1me9ldcoonez8mgHJjMYenu609JjyUFNICxRIomisOZ9ccBlKZ/a
pxFwMJBzyZc6uApEf9iJhsqaAZ5a9GyK73Nmb1iHeJmZhN/uDB7E/0ncA6oqGz8X
pG2kyoz8SYexBv11/CtScht6TjwAnA==
=93ql
-----END PGP SIGNATURE-----

--ddlCfAFjpBbRrVn8--


--===============0337440014048850105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0337440014048850105==--

