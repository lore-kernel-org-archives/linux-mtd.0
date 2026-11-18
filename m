Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7D0606A33E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PH5iXhAq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Um9umf8c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7gX2uKai0vZdin/Ref+pxDoigVoSII6b2hav+BrvRHQ=; b=PH5iXhAqkHHpLm/bH7wtu1iOvV
	69HESUy5UpOQlAcz8bBca9lbyD4Az5c95bgRwyyj4mqGT6+pkXp5mUyMdRhFFtba8H49SgFWHMU+f
	jtyxN2/Ou5wdAOQvLoBUayPdyXOSyFxkY46J+5NYDWmqtxwg+i+sksqGwrNC+K/X9002eymwgnfea
	kJ7wlhTrlwrCkoYimuohVpCcGWObzDEHOyAInNE8IlDl7R7NuJ4EIQ7MRgCiyTx4qbhwr+WL+S+10
	CTPHc9s8Jr3krohhLbTlV+s6P5RKSZKMw3xOxyiofgqjy0kaMhmkMF8FdWr5Jg0nfGxtjpK26J8nQ
	L2N54wHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeiw-00000008q5I-1wwy;
	Wed, 18 Nov 2026 12:25:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeiv-00000008q59-3Z5f
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 12:25:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 8CD3661F5D;
	Wed, 18 Nov 2026 12:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C586F1F000C4;
	Wed, 18 Nov 2026 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004712;
	bh=UqBe9rvEXQu8cq61sMILpeZS3JInEFCdIpRs0c3PbVs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Um9umf8caZmr0sWI2i1c9ItTyZ3fGqEZvi4ArPJh6GoN/IrxgP9T2qW9yBzQSHXDA
	 qNObrFxSzzd0p+Xf+sS0ZYD21jJkajNQbYSEjIIFcYGflltqlGtlffabkj2/TVkaCa
	 X6NYPEPF52S4qmqjXKgsNtVRoSvqOBTRBQcZSKU1VVJzqKhAAgxYzeuOoNjaRUrwK+
	 EIY16/mLkgNb8fhE0SzF695IB8JS0516KkFer1yRCbSYD5p1r3GuRqDde8Hfae1e/K
	 /r0aUDGeRN4bOySxXv9/i7d/EYDM16fCWuM6o5Rfmcw407xGABHkZNmbrbh+PSeYgv
	 5r6UcooytoBBQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 13:25:08 +0100
Message-Id: <DMYC2B7I8C13.2UQIDHJKGBSP6@kernel.org>
Subject: Re: [PATCH v3 10/17] mtd: spi-nor: Fix SWP for octal DTR chips
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com> <20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3967644365590236305=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3967644365590236305==
Content-Type: multipart/signed;
 boundary=c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Oct 13, 2026 at 6:34 PM CEST, Miquel Raynal wrote:
> During the recent rework of status registers handling, we mostly focused
> on quad capable devices, partially skipping ODTR devices in our mental
> model. It seems that many (if not all?) ODTR devices have no SR2 read
> opcode and have other control mechanisms. Because of that, the current
> support in swp.c is broken, because reading back the written value may
> or may not lead to the expected result.

Is this still the case with the recent fix for the .read_sr2 opcode
from  Haibo Chen [1]?

-michael

[1] https://lore.kernel.org./r/20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.c=
om

> Let's extend the _careful() suffix to the helper reading back the values
> and comparing them. Maybe this "carfulness" will have to be moved back
> to the core, it is a bit early to state it. For now, let's just make
> sure that we read back 0s without errors when virtually accessing SR2 on
> those chips.

--c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav2ZJBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ib0AGAuNEnTdAj/E1hC1K0HhKJkXWeo4+/dOre
l6nq4CMCDj2WrTV8lZgLAfEXpvDwCV5RAXwNxMDvhIWoKI5UVJbpVZl95QEE7SVd
pL56jc8dH4ZJXcypQZo1K2q3mbU4psfea+U=
=U1Fz
-----END PGP SIGNATURE-----

--c88bb83bfa15e2212b685b47a227f655f5fd51de48afcf41ae2165c1a43e--


--===============3967644365590236305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3967644365590236305==--

