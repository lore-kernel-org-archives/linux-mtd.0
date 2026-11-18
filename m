Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168BC606A32F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvN9lGRM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHekCrgf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uO6mtEKU8466mYdFY6rZvuuTXnb4niUjsR3qnPc7FrA=; b=uvN9lGRM6MXTUswOLM3Bv8kCC5
	DK0YKxG70bcMQaw+oRm3X441wC2t/VtQQRpDwiSKXhO53c50uy0jrDjEIxKchrYRHSQDLPPDxll9K
	z9kNVqvZh+CUgU9c6bp722dfwvsKtD77TbItfJ8AFfcs5gTvADDzu+gwagj5PCMyN4CGqFnoQ4VrM
	u3r2ptdxdJs2L9FRrkWdmgmENwslKoghHlRKGpUTk4TZ3YWLjjWcnjMF1ISqPJ9rLzZA41rm+q1KY
	BbxwzX6PYhijWlil+AdakqpiMxOo0m07tg2hPo1Z4VlUloeO0TfqD6nfMr1cvtX/kz0kX/jpoMKUp
	ksIEYdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc5b-00000008P0D-0JdG;
	Wed, 18 Nov 2026 09:36:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc5Z-00000008Ozw-1hvV
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 09:36:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E050541A3C;
	Wed, 18 Nov 2026 09:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 447D41F000C4;
	Wed, 18 Nov 2026 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994584;
	bh=RGL8gtqo67zTaXOPPcJjQ1x3D5OhGNepSQNuVWxQWm0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=LHekCrgf/uYJO3LPG7xLt18b/p7B9KxNCL7SEjfewM8b+tAYXceEObHFQSGia+xmi
	 24zubLpcNTAt3fE+NwDvCp70HPOqJYfX1JKvn0/uEyNn/7ZDTad+luV/CQJ7LTLEAx
	 QGzkrut9+8qt5lnI95WrR+C3ygciG83rBNUM+KsaB6WHuH4zhIR9qlOX9qSaHDvbdL
	 wOr+HpKB0r3+GUsJjNdKifRTHy3arV8nlGLjoWQUZnxs1rvqEhM3PToR7TBnx0qfvM
	 9H/PfwINM9eKEE6Th4vx2IOLd0SsnzO1CeizOxdO1tmRjKk36x8DvpfNnHx5kr2dUJ
	 /BPI+G4JLS6aQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 10:36:20 +0100
Message-Id: <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tze Yee Ng" <tze.yee.ng@altera.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
X-Mailer: aerc 0.20.0
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com>
In-Reply-To: <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2000763741890358842=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2000763741890358842==
Content-Type: multipart/signed;
 boundary=ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Nov 18, 2026 at 9:07 AM CET, Tze Yee Ng wrote:
> Gentle ping on this patch. Any chance for a review when you have time?

I had a quick glance, and honestly, I really don't like all the
reference and resource handling splattered all over the place. Also
do we really need the low level kref_ handling? And what about
spi-nand and all the other MTD subsystems? They have the same
problem, no?

-michael

--ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav1xlBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hj5AF+OKgSgkq6WET6CBLgx/AdEEayduamVoe1
/TfBTHQgaMFp/Jb3hF5z8YsmfWV+MAr/AYDJBsytNjwZljGpB3nTSsG8QFy1Yh5j
n3WbpoB9HCkdTSKVagkiMJvn4Stc3fWW9nY=
=K07H
-----END PGP SIGNATURE-----

--ea5a356e3b57aa04ecf55e748656dca03721c85a98af16b5e7724dfd2ac3--


--===============2000763741890358842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2000763741890358842==--

