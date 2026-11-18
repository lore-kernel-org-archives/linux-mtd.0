Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073E606A325
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cTCl5eD2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP1asxug
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxKYgZHQvZateK5Uo8kMNl2px5vzDVD7G0R5IqwSMlw=; b=cTCl5eD2Q4udauoVZQ3MEYQvVy
	fklG49eTbsKemeNCzpC1x3AI8kRIWjyPSYOj9Kb9H2tE7RuTQT8/FxXhvkzKjnihp04yZ61UNEUKY
	OgTeD075bJVeLI/ElNsAtkEobNcIxlQ0ikzBfoZngHWWOPl5qoDp3x9Z8iC0lb0jEW2B5JzMr9z83
	T5IRqkTwdT1uVLuY2GsQfxuv6e/PKuBx3PArK1CpJVCW16jAdCNTCKLx0NtUtaK+ljHWDAOHny+2E
	lYEowbPFjoOscMCm6m+cRiTIdDIMWLmKFlshVajHv/aDfUGIZ73bxpylOa7zcxeSSdBzj+jBeQY6E
	GnLvbLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfvX-00000008z41-23Mr;
	Wed, 18 Nov 2026 13:42:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfvW-00000008z3a-0cLE
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 13:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 062C0621E1;
	Wed, 18 Nov 2026 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 37CC61F000C4;
	Wed, 18 Nov 2026 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009336;
	bh=Pdo9o/RZRwcXVuirKWXZb1r7laMUfwlqTIE6v9fJreg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=jP1asxugAZ70Ob8meTximYOcbzJUzYJBNmnnRp6yfHOtw0VFGwB4GsZCNqsN+6AJi
	 8ivB9Wxird0Yh3caLcwwSZdiwbWPj7/t6ztDGuE6T68obcfrctJjuNnVsvlrJb5dHs
	 hxLhZ2wgzBf2Rab/vx02BjYuDT7xQjZ/e/GuaK3ek6oh735fRTXNd9DL7kqgWSDn01
	 PZi3KZY7bVIZwGrseohgkQx3iaLGpzc/VRgE/tyiDtX951I95EassIunh8KeWKEjOf
	 2AH8WKTSdrGEprbCPOVMGeCf318VvEtCTlkcrtwUTsmD+FEnd5VN1FbaIpeKx6so0G
	 GgZlCY8/xU13A==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 14:42:13 +0100
Message-Id: <DMYDPBNBU7IY.3956HW6C59693@kernel.org>
Subject: Re: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
In-Reply-To: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5536691502884189478=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5536691502884189478==
Content-Type: multipart/signed;
 boundary=d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Nov 6, 2026 at 5:33 PM CET, Nuno S=C3=A1 wrote:
> Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
> The part is fully described by SFDP, so only the flash ID and small
> post_bfpt and post_sfdp fixups are needed.
>
> WRITE STATUS REGISTER (01h) takes a single data byte and only affects
> status register bits 7:2, so the default 16-bit Write Status assumption
> does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
> path is taken; write_sr1 is already set to 01h by the BFPT parsing.
>
> The flash also has no Status Register 2. Configuration registers are read
> with B5h/85h and written with B1h/81h, and the 35h Read Configuration
> Register command does not exist, so clear read_sr2 as well.
>
> Software write protection is done through the block protect bits in the
> status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit a=
t
> bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
> SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to ge=
t
> the generic locking support.
>
> The flash also supports 8D-8D-8D, but this could not be tested. Since the
> SFDP has no SCCR map, the core would select 8D-8D-8D on a capable
> controller but never switch the flash into it. Hence, drop the 8D-8D-8D
> capabilities in a post_sfdp fixup for now.

Could you please test if one (or maybe both) makes a difference
here and the fixups could possibly be dropped?

https://lore.kernel.org/r/20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com/
https://lore.kernel.org/r/20261013-winbond-master-spi-nor-w35t-v3-1-6dde1d5=
13df8@bootlin.com/

Thanks,
-michael

> Note that given that the Flag Status Register (FSR) handling is the same
> as in some micron devices, we're adding the issi chip directly on the
> micron-st driver.
>
> Link: https://www.issi.com/WW/pdf/25LX-WX01GB.pdf
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

--d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav2rNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gfUwGAmsWQCdxnZoffctTLEcL3xEJIAczCdXuW
1VqmTcfEGcITv7bnK3oc3q5ctSFlkQ/KAXoDRYSSQ/eAselPr9B9zdraAccV8Gjw
suygvLcggxobzzHZVXwNC1cc1xaALkqwUuE=
=SZ9S
-----END PGP SIGNATURE-----

--d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d--


--===============5536691502884189478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5536691502884189478==--

