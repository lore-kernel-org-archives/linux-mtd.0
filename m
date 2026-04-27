Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CE3FF8864
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2lC72DLyYmQGS6SDXcukhB0A5c5ThzbWNCdoQD7fcQ=; b=Hjbxn2r8NG0DUFLg8cAV7abJ38
	UDQy0SVVRxLVsDTCLT5EosG9uPPQ16mJ/Ju5zRo3zLJSVC17EfCI8uhybG+aX9VAG9OOKVaGSrTM0
	yO8itzZCcEHwMif1Co8uFzsknslsSFoTA4pVCcU6a2f2GGu3862RlqRzyRzMxCZrLTtkjqzXTo3q3
	tN6VeqNLjGXPSkkeCf0L3OnSyznqfyMSKVYj5+vLPDgz9CBdB9SpwlwlPR3pMMEAH//e3T5F4+bVc
	JNIje+XcjFLmrr92Iim+NHAsPM1Rxh5NFKPIkNZYSVA2jKWPinLRbBF3ByyX59xSP76wqGoyclcwb
	cBzgBpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVed-00000000ItE-2Hon;
	Mon, 27 Apr 2026 23:46:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVec-00000000It4-1phU
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 23:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81D9160121;
	Mon, 27 Apr 2026 23:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19068C19425;
	Mon, 27 Apr 2026 23:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777333577;
	bh=BgEV4tScGyGHrq38KvfpxGCI/GQPCZMnKeGZFjpJUd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgHifR4Rvnjqb9z7IthLInTB89y0CZToWtLA+msb2q5aVkuHPeTOXnSFMYRvMi/EH
	 t9ifFWo5zqWv/uI5PbkdFFR4Pg8ncKlclB//6j4sjcLOU0aCZym6aapU4EWmT9Vbon
	 Pq0Y7v5vUFpA4Hzneu96riKjms9HFOcha4GerbLH4pJUulK2vO25lFFL0f5eNHWN8X
	 utr6DqD4b714STNxJGPVmiXKCzlr0PEDwaO5ZBbX8z0EEYEF31iegkVGILNHUvuJ7l
	 koOyIwHFXWbP1li7lPwjghaxpKhxWOwkM228/dVEK7xQw40sZIkMWMHteQ2HipUl4h
	 YZ2bXdJy6eJZg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 123371AC583E; Tue, 28 Apr 2026 00:46:15 +0100 (BST)
Date: Tue, 28 Apr 2026 08:46:15 +0900
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [PATCH 1/4] spi: spi-mem: Add a no_cs_assertion capability
Message-ID: <ae_1R6LlSnhgGzYl@sirena.co.uk>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
 <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-1-0d626e1dfb2b@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-1-0d626e1dfb2b@bootlin.com>
X-Cookie: Victory uber allies!
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
Content-Type: multipart/mixed; boundary="===============3340740676484046744=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3340740676484046744==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gapjDoiyjve5Jhwd"
Content-Disposition: inline


--gapjDoiyjve5Jhwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 05:47:15PM +0100, Miquel Raynal wrote:
> Some controllers are 'smart', and that's a problem.
>=20
> For instance, the Cadence quadspi controller is capable of deasserting
> the CS automatically whenever a too long period of time without any data
> to transfer elapses.

Reviewed-by: Mark Brown <broonie@kernel.org>

--gapjDoiyjve5Jhwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv9UYACgkQJNaLcl1U
h9CxEQf+JTupzIZPpOC3vt2CLtwH52cHBtR+Q5PL1C2kVVBeAUK0PmcZm2BHp7xo
c44XrRhx384EXICy7h6poW/3D+NvFqoSreJKnVe+yyXs6U90L7KrjqpA69Oql1dm
6E+XDXd+iix4uE3jV30tYrtF74lDw8is37UxB7t2Vw5jrl4zbE6YYEPSXnikvFlz
B/IhxR4Z/yLBIoup3bDE2Ddr7zvqtpsTxHU56i5huQEiTy2QWq2sZ6HSdRSkkrAV
mNY0l5Gx91m+o3eDaNafPdNZ1UNBvYxVd7v7SbYbDzIpN/AAKHhzuepn3S0QJCc4
axs/msqQpRCbLkrRNOZowGPL0FZxjQ==
=PPcc
-----END PGP SIGNATURE-----

--gapjDoiyjve5Jhwd--


--===============3340740676484046744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3340740676484046744==--

