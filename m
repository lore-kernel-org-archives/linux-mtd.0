Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC3606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YcqB80ht;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpTfO23o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o0P0JWH0Jf7PRAC3SbJdyMVm9r5c72ebtMxdFtkZoKA=; b=YcqB80htR4r+to9SFrOeSlFLLj
	wRKiWaHys29QWZ0afLKW6oW+Z9fL24Yy96mobBkqRxiNnqPVTxBPR2iDz4bKSfjnLO+QrUUzm4WM3
	6sbsv3esNVpPuV5U9uqSc9S11hVdanacj/4LfK3FGZJ0ESiBEYMVMvSHxXCfuagO+h1Dyfd4Sy7UH
	8wZwH85bA5QTvLl+qdBUTQhvn2MMDVdJTH1H48BPZK2QFVs5thaqsR0sxlF2NzE000Gi3dedfky3t
	p7IbBaiouXyNM/1Iv3xg8t4er+dMrEGqzUVSsXvu2L4nXV+bcsaJdjN62LB+/+7uksI+xq/pNat2e
	7/OBSdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrpT-0000000E4CB-2ykX;
	Thu, 22 Oct 2026 12:23:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrpS-0000000E4Bt-3z6X
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 12:23:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 098D760235;
	Thu, 22 Oct 2026 12:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 387CE1F000C4;
	Thu, 22 Oct 2026 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792671809;
	bh=akLxImTf0y0bbfRVy+rx+txPUMIriMcoQnnq8uHmVmU=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=WpTfO23oU7nvT4dJXJVvqX4MnSqsi4TxRw32Bjls2eTe1EifZXQ7a5MbMsIBxKxu4
	 D8r/fX/VNZdAz/SD8R+4gT9HxJjqUir7fZEcA+SA0YfjVU9cwJGB8T9yvDiF6+jpDY
	 vyfNeKa1QFGM3RsxxR7Ryk4ACS+ucGk4yD+2E14JFqPDWRsqYKFKLxTj9UKuhPogYp
	 W7h2BBFqkaK1e3jOLdEOIRZu+RNbo0rEL3BcRHB6/Wje58Gn7n4Botg5kpW6NJeoR1
	 OeDpyz6SE29VCBZEGRXAHw/Hehs2fXVpM4OnWnFS3a7VxXHOkXuiJEWaG1egB08vXM
	 lNaKuhIzcO4Wg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 22 Oct 2026 14:23:26 +0200
Message-Id: <DMBD4AK6UXKX.23K3797G1OUS0@kernel.org>
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Mark Brown" <broonie@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v1 4/4] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
Cc: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
 <20261022102614.75696-5-changhuang.liang@starfivetech.com>
In-Reply-To: <20261022102614.75696-5-changhuang.liang@starfivetech.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1243476819611566534=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1243476819611566534==
Content-Type: multipart/signed;
 boundary=1abe0f32d48531c87fdcbb594fab47308a170e73b30effc29e3ae893b303;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1abe0f32d48531c87fdcbb594fab47308a170e73b30effc29e3ae893b303
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Oct 22, 2026 at 12:26 PM CEST, Changhuang Liang wrote:
> The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
> dummy cycles by default in 1-4-4 DTR mode, but the kernel's SFDP
> parser does not derive any SNOR_HWCAPS_READ_1_4_4_DTR capability from
> the BFPT table

So why don't you fix that?

> , and 4BAIT only filters already-known capabilities.
> The exact number of dummy cycles is also not directly given in the
> SFDP tables.

What is BFPT 3rd DWORD bits 4:0 then?

Could you please dump the SFDP for this part? See [1].

-michael

[1] https://docs.kernel.org/6.2/driver-api/mtd/spi-nor.html

--1abe0f32d48531c87fdcbb594fab47308a170e73b30effc29e3ae893b303
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatoAPhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hYEAF/R5VryoZY5m+84ealf3tkGJWe5jEehB4J
3pt7F6qQO6SxZ7KGL9ighYRTdlvkwQWaAX9xhYxaTr2ler0r5fTVSZyj/2QGT23K
1twtzXZn7XH6aGWEe1N0rXtPcPuZsV9owu4=
=2E3m
-----END PGP SIGNATURE-----

--1abe0f32d48531c87fdcbb594fab47308a170e73b30effc29e3ae893b303--


--===============1243476819611566534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1243476819611566534==--

