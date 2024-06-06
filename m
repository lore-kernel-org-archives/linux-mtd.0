Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA89CC25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB6uEmSKsHNQkCRd/CvKh+aJiaa3fbGy90EtCAIRT1A=; b=36hYH1+K4zFT9CE7ImAcR61cIE
	R+4IWWUUlm8hc7ooBurZah3LH4Yhx/KyFdWNoK5ZQlqaMdTssQy+XHrBPf8DYhwlxFIfnTwUhRTD9
	Q2ibiMUsmndz/WUVmSGotq6LiHNI7oO0QQcKpW8Rw//Qva0+ztnX7k3evPegi89U5JnNvMM3bpDZo
	bYZ2EKcULAFm4JZmos8NGTXPz3W18KY/x9V1pc0Ru4MrCZn1gCdStywLuMgX8iCSbPPl7qN8esPJg
	j4BfRmqieAcbfLtHqBg1YWsZLmFpzCcqZMscTaS3e/jZ5O/kLpkTrxABYXA79JyYJ5wFuInE0YCo6
	8Efr75Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDQm-00000009xGh-1509;
	Thu, 06 Jun 2024 13:45:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDQj-00000009xFz-4A8H
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 13:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CDCE61DDB;
	Thu,  6 Jun 2024 13:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B083C2BD10;
	Thu,  6 Jun 2024 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717681524;
	bh=RabUCoQbg8d0SmOaAZkfQWlRTkdI/BRDQ5JH4zGLsU8=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=sM/kYm/UmKCqEWhz9SVw/B4ILwiXoakHZuJL59GXp8JmSio7E9b5ZY582HXeXkbi6
	 1pUuryZorn3aNFdkqCF12ZsRDE5FHpZN6xiPAeFYakUirFHYehesJdjFq+e2Rs2bJG
	 Bd4xM1qw43tq3Jtk2Tt9cXVxfr4KRcvCp0Xo2uodQqiJzVyzPXO1WHiIYSmVOZrCKJ
	 cYBq3/A1hObLhwJl0mRny+cvj9Pps6nhNmxq6O2mcbXyl/ZNWtwdT34m75XXEqFM2k
	 e9FOpXNU1EzQA0paWTizjxGe1GJk7tKdCI9WwVMxKmYzDQm7xoIdH87L16Z7fSSnZz
	 X69FGa83YklTQ==
Date: Thu, 06 Jun 2024 15:45:20 +0200
Message-Id: <D1SZA4ZDM06P.CJC0EQ9ULA04@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Esben Haabendal"
 <esben@geanix.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: workaround for device id re-use
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rasmus
 Villemoes" <rasmus.villemoes@prevas.dk>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com> <D1Q7BU6PJ356.1CTXPUZE8U6XX@kernel.org> <8513a828-6669-4bf3-91d3-799771866f32@linaro.org>
In-Reply-To: <8513a828-6669-4bf3-91d3-799771866f32@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_064526_215881_E06FB450 
X-CRM114-Status: GOOD (  25.64  )
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
Content-Type: multipart/mixed; boundary="===============8819558251878151352=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8819558251878151352==
Content-Type: multipart/signed;
 boundary=479d9d31d50b1e2e2050036af42fee8ce0912e5ec1a0f68f2ab9c35385aa;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--479d9d31d50b1e2e2050036af42fee8ce0912e5ec1a0f68f2ab9c35385aa
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> >> + */
> >> +static int
> >> +mx25l3205d_late_init(struct spi_nor *nor)
> >> +{
> >> +	struct spi_nor_flash_parameter *params =3D nor->params;
> >> +
> >> +	/*                          DREAD  2READ  QREAD  4READ
> >> +	 *                          1-1-2  1-2-2  1-1-4  1-4-4
> >> +	 * Before SFDP parse          1      0      1      0
> >> +	 * 3206e after SFDP parse     1      0      0      0
> >> +	 * 3233f after SFDP parse     1      1      1      1
> >> +	 * 3205d after this func      0      1      0      0
> >> +	 */
> >> +	if ((params->hwcaps.mask & SNOR_HWCAPS_READ_1_1_4) &&
> >> +	    !(params->hwcaps.mask & SNOR_HWCAPS_READ_1_4_4)) {
> >> +		/* Should be MX25L3205D */
> >> +		params->hwcaps.mask &=3D ~SNOR_HWCAPS_READ_1_1_2;
> >> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
> >> +					  0, 0, 0, 0);
> >> +		params->hwcaps.mask &=3D ~SNOR_HWCAPS_READ_1_1_4;
> >> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
> >> +					  0, 0, 0, 0);
> >> +		params->hwcaps.mask |=3D SNOR_HWCAPS_READ_1_2_2;
> >> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
> >> +					  0, 4, SPINOR_OP_READ_1_2_2,
> >> +					  SNOR_PROTO_1_2_2);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct spi_nor_fixups mx25l3205d_fixups =3D {
> >> +	.late_init =3D mx25l3205d_late_init,
> >> +};
> >> +
> >>  static int
> >>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
> >>  			    const struct sfdp_parameter_header *bfpt_header,
> >> @@ -61,7 +118,8 @@ static const struct flash_info macronix_nor_parts[]=
 =3D {
> >>  		.id =3D SNOR_ID(0xc2, 0x20, 0x16),
> >>  		.name =3D "mx25l3205d",
> >>  		.size =3D SZ_4M,
> >> -		.no_sfdp_flags =3D SECT_4K,
> >> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> >> +		.fixups =3D &mx25l3205d_fixups
> >>  	}, {
> >>  		.id =3D SNOR_ID(0xc2, 0x20, 0x17),
> >>  		.name =3D "mx25l6405d",
> >>
>
> If all support 1-1-2, (seems MX25L3205D doesn't), then we may have a
> change to don't update the core.
>
> Frankly I don't care too much about what happens in the manufacturer
> drivers, but I do care about the core and to not extend it with . This
> patch is not too heavy to be unmaintainable and shows clear where the
> problem is, we can keep this as well.

It's a horrible hack. For example I'm working on a patch to clean up
the spi_nor_set_read_settings() handling. So just throwing any code
into vendor drivers doesn't make it any better in terms of
maintainability. I'd need to touch all the code anyway. In fact it
makes it even worse, because it looks like the manufacturer drivers
are just a dumping ground for bad things. Thus, I'd really have it
handled in a correct way inside the core.

Also, this is not device specific. Let there be two different
flashes with the same ID, but one support SFDP and one doesn't.
Right now, you have to have any of the magic flags (dual, quad,
etc) set to trigger an SFDP parsing. If the flash without SFDP
doesn't support any of these, like in this case, we are screwed.
Hence we might need such a flag also for other flashes.

> Other option that I'd like you to consider is whether we just remove
> support for MX25L3205D, thus the entry altogether, and instead rely on
> SFDP to set everything.

Well, this will break boards with this flash :) And we don't know if
there are any.

-michael

--479d9d31d50b1e2e2050036af42fee8ce0912e5ec1a0f68f2ab9c35385aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZmG9cRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/grRgF+Ju8AIIr0YhhI6wK7vFUrv1TIIvNnMZRo
2eP5r1ZrYb43Tt9ShCcjpqMu98HIjwPVAXwOYh+E6vTynjxye7akY9WaDu1x6oDk
+qvFE+kgUdpUFnzjF0Kg3Csc3MUnvLogIS4=
=5qOF
-----END PGP SIGNATURE-----

--479d9d31d50b1e2e2050036af42fee8ce0912e5ec1a0f68f2ab9c35385aa--


--===============8819558251878151352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8819558251878151352==--

