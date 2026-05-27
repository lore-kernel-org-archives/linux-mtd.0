Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA36CD5BD0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DD5GnqTezpeQpz8MJ5auaggHL948WSrwZsanORTZec=; b=HXDy/8vbx+CbbCMPG2jc6YeY5O
	p2kEVE0U8IdNYWc1SDwNaGHj3q3wZC6xhzGQw4bf3QYGKM6th+lwRo0XXOrpOtMa3ogO56WMUV11R
	XH2o6yBusvBf7QQTL83sfNtiu9kphyK2obkl5mvIpFoS8r6+DjrukCmDcbwWko1cYTF77v3EmaZg3
	gcJWzGSXSRVolaWWTgJjX4777JIJcpyahft5KCQLQiqY1oYpl1teXWG11gGhqFk26C+7qB1oCd1Gs
	4YLk9xbIic2SPzE3ZuKlLpo21BBHe6G6l68h5zbZq9V0yJ210zQEZ/CBxCRh7xFB/qmf87c1allV4
	SXqp93dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDuU-000000049C1-2bcF;
	Wed, 27 May 2026 13:02:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDuS-000000049Bc-3gyd
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 13:02:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 312D343558;
	Wed, 27 May 2026 13:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 87B1E1F000E9;
	Wed, 27 May 2026 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779886976;
	bh=E1jxI8tTzqktadCjLzF4moaT/MinNtSN0WSsv3YjWYM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=g+kiaaWmzv2RpsBGpjk74ewa6TXWlv08NNZGM/4WUzUd7fZDPk6sX3XXrIjbKmpEn
	 BbbBRylfmDZRzKEi6WieiDTdFwHny79gPKwEBrM54CVW2Znzr3cIa9Aejdre7UVAom
	 8AwL6iPfpcw9mobSNdG7L3a0B4PbKQ8x/wU3B0ahDVR6nDsTIWbsDfPhIOJLaCljpX
	 /CRF9OiRIz0PH8AU70gLxt/cZ9KhmKkNkv28uj5JcI+eBCezF0o6Ut4RKkPa6IOwU5
	 BWjUotZMiyhSwGA02iiMKP90YvvarLxjfZKQ4SB01Oz/39DxGkIXTLDrS21NBQ0i/z
	 AshtkIuh9QL4g==
Mime-Version: 1.0
Date: Wed, 27 May 2026 15:02:51 +0200
Message-Id: <DITH9ULJ3A8X.1Y9MP83UY2MHB@kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: spansion: add die erase support in
 s28hx-t
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <tkuw584924@gmail.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <cover.1779872008.git.takahiro.kuwano@infineon.com>
 <36045be168c5e9525f9c649986b0f1a54dcb2be1.1779872008.git.takahiro.kuwano@infineon.com>
In-Reply-To: <36045be168c5e9525f9c649986b0f1a54dcb2be1.1779872008.git.takahiro.kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_060256_939234_7F901F99 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: multipart/mixed; boundary="===============1912533705448664712=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1912533705448664712==
Content-Type: multipart/signed;
 boundary=ea913eb2bebc50e230e6c2e938d90e8ccba46ba56ec65308be6fef02085f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ea913eb2bebc50e230e6c2e938d90e8ccba46ba56ec65308be6fef02085f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 27, 2026 at 11:05 AM CEST, tkuw584924 wrote:
> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>
> S28Hx-T family has multi-die devices that support die erase opcode.
> Update die erase opcode when the device is multi-die.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansio=
n.c
> index b6023076903a..65227d989de1 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -762,6 +762,9 @@ static int s28hx_t_late_init(struct spi_nor *nor)
>  	params->ready =3D cypress_nor_sr_ready_and_clear;
>  	cypress_nor_ecc_init(nor);
> =20
> +	if (params->n_dice > 1)
> +		params->die_erase_opcode =3D SPINOR_OP_CYPRESS_DIE_ERASE;
> +

So this seems to be a common theme for the spansion/cypress flashes.
Does it make sense to have a .mfr_flag USE_DIE_ERASE or
SUPPORTS_DIE_ERASE that can be set in the flash entry instead of
having many different fixups?

-michael

--ea913eb2bebc50e230e6c2e938d90e8ccba46ba56ec65308be6fef02085f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCahbrexIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iqTwGAhk4gnkzIxcLLW2JLayDRAlIaV4HjYIdy
MESLSGwJy3HWG2PKalgZkIZ63srs/b57AX9Kgj+mR5p09gOtZMssDfMi+4MnloXu
Di42q4X/kvC8yy2gnG3ejVPvgjN99WaykrI=
=6XWl
-----END PGP SIGNATURE-----

--ea913eb2bebc50e230e6c2e938d90e8ccba46ba56ec65308be6fef02085f--


--===============1912533705448664712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1912533705448664712==--

