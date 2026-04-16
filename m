Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129B1F8A14D
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4RBqPJCW1d3Gy6lg/VUayHBuJz4smr3gk7lOCr2anc=; b=sZOMR7N06OKw3DBmqLHXWY2bTn
	ljkiqZzUOBnrsKdHm9GXxuHYSvKJP7XkCCXeBMms28Kqn/8EnFYMcPrro1BfRl6hGYPQKtO4ZLGKF
	BOBC9VpyOaWdYL4uFf43eKpdYx/pYFBLNWIbtp7QBazdQCCCBJ3c3ZcMrpbdzNKNWlmn9CpU46M4r
	r+LtkhEoKwPPmtFUIjpCY85RatFlO9qb9Tb7/GRWjpTXPkWl7fgr1TmoACH76lEB6vkmFshRHabY/
	wZSiiHiWaS3UTYRL6bekRdsDXx7397q26GBIAetM/TSp/W6Txnkor7F2u6S10QXi8o4kVtrjwG0LI
	lz5aQNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKEg-00000002KAQ-3aK2;
	Thu, 16 Apr 2026 10:46:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKEe-00000002KAK-3ACV
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 10:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDA0060126;
	Thu, 16 Apr 2026 10:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2081BC2BCAF;
	Thu, 16 Apr 2026 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776336371;
	bh=0XA90+CDKIQOfyPdPgeY6a8Pxr+2GC0kjQSiuQutyW4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=dM/DZQT1QpLo2VqiOFuR4CBO+8mbnDiW1ZaT7VKol40Ey+sHUZk5eQTSK3hXzGr9w
	 WrdBJbxQx/0ilA3nkGxrtLOR4khdrKr/q74NMvDJGcY3MOXjNkJGIwY+8FsSQGpmyk
	 NG3VtRhq077EOobNCGsK9a2x9cNQ0civpzEnNPoysO0X8yvmG/LO7YJRcxx96zKGWQ
	 gkVHvA4h+3jFafSegjm2LPd7x3ljgSWB88s4cmpGnoJm/nXn7jnA2AvD1/0D8Q/9vk
	 jbjwsk5NCGlU8BIaqSFk9vDSK8mMt5B1mDMjTFMPEhzitbVhNJLb2QnEIxJ5eKaxlD
	 uMEA3f2Mc+gEg==
Mime-Version: 1.0
Date: Thu, 16 Apr 2026 12:46:07 +0200
Message-Id: <DHUIOTOESC19.117TN18W5AV86@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
In-Reply-To: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
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
Content-Type: multipart/mixed; boundary="===============7967825838618407996=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7967825838618407996==
Content-Type: multipart/signed;
 boundary=e94a267ab793ae527cbce6530bdfeaff9ccad361ddb5eada1cbc25358642;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--e94a267ab793ae527cbce6530bdfeaff9ccad361ddb5eada1cbc25358642
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Apr 16, 2026 at 11:03 AM CEST, tkuw584924 wrote:
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -124,23 +124,22 @@
>  /* Keep these in sync with the list in debugfs.c */
>  enum spi_nor_option_flags {
>  	SNOR_F_HAS_SR_TB	=3D BIT(0),
> -	SNOR_F_NO_OP_CHIP_ERASE	=3D BIT(1),

Can we just drop this line and leave the rest as is? It's already
hard to follow any development in spi-nor due to code churn. I don't
think one hole in the flags hurts. The next new flag can then just
reuse it.

-michael

> -	SNOR_F_BROKEN_RESET	=3D BIT(2),
> -	SNOR_F_4B_OPCODES	=3D BIT(3),
> -	SNOR_F_HAS_4BAIT	=3D BIT(4),
> -	SNOR_F_HAS_LOCK		=3D BIT(5),
> -	SNOR_F_HAS_16BIT_SR	=3D BIT(6),
> -	SNOR_F_NO_READ_CR	=3D BIT(7),
> -	SNOR_F_HAS_SR_TB_BIT6	=3D BIT(8),
> -	SNOR_F_HAS_4BIT_BP      =3D BIT(9),
> -	SNOR_F_HAS_SR_BP3_BIT6  =3D BIT(10),
> -	SNOR_F_IO_MODE_EN_VOLATILE =3D BIT(11),
> -	SNOR_F_SOFT_RESET	=3D BIT(12),
> -	SNOR_F_SWP_IS_VOLATILE	=3D BIT(13),
> -	SNOR_F_RWW		=3D BIT(14),
> -	SNOR_F_ECC		=3D BIT(15),
> -	SNOR_F_NO_WP		=3D BIT(16),
> -	SNOR_F_SWAP16		=3D BIT(17),
> +	SNOR_F_BROKEN_RESET	=3D BIT(1),
> +	SNOR_F_4B_OPCODES	=3D BIT(2),
> +	SNOR_F_HAS_4BAIT	=3D BIT(3),
> +	SNOR_F_HAS_LOCK		=3D BIT(4),
> +	SNOR_F_HAS_16BIT_SR	=3D BIT(5),
> +	SNOR_F_NO_READ_CR	=3D BIT(6),
> +	SNOR_F_HAS_SR_TB_BIT6	=3D BIT(7),
> +	SNOR_F_HAS_4BIT_BP      =3D BIT(8),
> +	SNOR_F_HAS_SR_BP3_BIT6  =3D BIT(9),
> +	SNOR_F_IO_MODE_EN_VOLATILE =3D BIT(10),
> +	SNOR_F_SOFT_RESET	=3D BIT(11),
> +	SNOR_F_SWP_IS_VOLATILE	=3D BIT(12),
> +	SNOR_F_RWW		=3D BIT(13),
> +	SNOR_F_ECC		=3D BIT(14),
> +	SNOR_F_NO_WP		=3D BIT(15),
> +	SNOR_F_SWAP16		=3D BIT(16),

--e94a267ab793ae527cbce6530bdfeaff9ccad361ddb5eada1cbc25358642
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeC97xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hY8gGAk/ya+dVJJR9j40Ht8RVARAIKm6QoXBgT
qc7Z7s+AyF9c6dQ4npbWUD6bv3NwMR5eAYDwHEm2U4WBDdyjR5pEQlwx7/MU3WcV
LHXCzurYbIOwnGhfVnKqHh8ABwqLDS/0RGA=
=1yiI
-----END PGP SIGNATURE-----

--e94a267ab793ae527cbce6530bdfeaff9ccad361ddb5eada1cbc25358642--


--===============7967825838618407996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7967825838618407996==--

