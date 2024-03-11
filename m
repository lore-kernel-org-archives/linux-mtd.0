Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5665CC5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HKer9xE6YRbwKto08PnE9yNOqfx4h0KV6Qe3KlwvlM=; b=gJpw51OT4jGP2P4apDv1tqUW68
	gLmrA2nr/p9JXrefuLe1Ps9zrQXSee62B+QA3D+9Hu4bcg6mzNK29nG7sTEoXWrESBUCydF8evzKU
	zlH4YHQK9GvEmb+jXgDpM1l8GT5r6OAw0tqEBNKG82mRfNITYX34ZIlNpCK/0mFjHZWX50eHl41b8
	lugO3nnFaR3hFLAv3Bxz3t47+Ft8oZ8qooSpDV50hz+2s1nnl8icWyxHYy9ZoMZZG0Mz+HPyb3yaO
	eY/5VRttn2v0EZMOMREgMioFrH6g4LPjF9VxpmGDheL43EZuTA3hTEz5R2qc6bs4psE8eAkZpFAj5
	YrX1Fmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgnN-00000001pnR-1rHE;
	Mon, 11 Mar 2024 14:38:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgnK-00000001pmx-2l9m
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 14:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06FE660DD7;
	Mon, 11 Mar 2024 14:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5702EC433C7;
	Mon, 11 Mar 2024 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710167905;
	bh=ikG1QQ6Ft/EuPBNRvKuFA2EUFI7GLaO5HRAitUly3CQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=N4cR6e9QRDrGNAQ621FMoQQTlT4j45Gs0eckfvY/M7lYe3RJPP9cqw4gTdvhWrIQs
	 YgUCH/ufRSS7UTVj75iR4J3usZFQg/+ihEAuav2/1GsLYx/p15WkJlphSKT+VyvlaL
	 88Rw7kepSg7vzTJmrgPWImKZNbroOxc02gA3vxwviR3YU+nYvoS/R6CyS3pe95P9m7
	 ee0zJ4OEDuZ14nW+8bmQyAOYz4vC7+FDykLmGphbSUTaePAdSv9EPCyh1vUizWXpjj
	 PaQhqCO7jRz4QSozttnWsSz9U/Twjt/+zx/nn67Xk/L6T56U+rCqZZqqUVUdxsFh6j
	 f/7lKfBY4EZsg==
Date: Mon, 11 Mar 2024 15:38:17 +0100
Message-Id: <CZQZXAB2GOCY.12YVJ6CRGG26B@kernel.org>
Subject: Re: [PATCH 2/2] mtd: core: Don't fail mtd_device_parse_register()
 if OTP is unsupported
Cc: "Mika Westerberg" <mika.westerberg@linux.intel.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Aapo Vienamo" <aapo.vienamo@linux.intel.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
 <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
In-Reply-To: <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_073826_809779_0C1367E2 
X-CRM114-Status: GOOD (  22.65  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7551523045994920233=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7551523045994920233==
Content-Type: multipart/signed;
 boundary=45ed013812313c157f704b5e662bd3e921269c7d51848b7e818b5055826c;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--45ed013812313c157f704b5e662bd3e921269c7d51848b7e818b5055826c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Mar 7, 2024 at 2:04 PM CET, Aapo Vienamo wrote:
> Handle the case where -EOPNOTSUPP is returned from OTP driver.
>
> This addresses an issue that occurs with the Intel SPI flash controller,
> which has a limited supported opcode set. Whilst the OTP functionality
> is not available due to this restriction, other parts of the MTD
> functionality of the device are intact. This change allows the driver
> to gracefully handle the restriction by allowing the supported
> functionality to remain available instead of failing the probe
> altogether.
>
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> ---
>  drivers/mtd/mtdcore.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c365c97e7232..1cfc8bb5187d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1054,8 +1054,14 @@ int mtd_device_parse_register(struct mtd_info *mtd=
, const char * const *types,
> =20
>  	mtd_set_dev_defaults(mtd);
> =20
> +	/*
> +	 * Don't abort MTD init if OTP functionality is unsupported. The
> +	 * cleanup of the OTP init is contained within mtd_otp_nvmem_add().
> +	 * Omitting goto out here is safe since the cleanup code there
> +	 * should be no-ops.
> +	 */

Only if that's true for both the factory and user OTP area.
Also, you'll print an error message for EOPNOTSUPP, although that is
not really an error. Is that intended?=20

>  	ret =3D mtd_otp_nvmem_add(mtd);
> -	if (ret)
> +	if (ret && ret !=3D -EOPNOTSUPP)

Maybe there is a better way to handle this, like controller
capabilities instead of putting these EOPNOTSUPP checks
everywhere? I'm not sure.

-michael
>  		goto out;
> =20
>  	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {


--45ed013812313c157f704b5e662bd3e921269c7d51848b7e818b5055826c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZe8XWRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvumBgD+Ne3GfSC1vSlxnEWI5Pw4YrWak8YHEpYq
E3KnfeyJR+wBALR/9/FAxfZci7xN2e0x1qQlGlpXIJeJiyCZctoKq7oO
=B1CF
-----END PGP SIGNATURE-----

--45ed013812313c157f704b5e662bd3e921269c7d51848b7e818b5055826c--


--===============7551523045994920233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7551523045994920233==--

