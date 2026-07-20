Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E851CC44524
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cawWizDLGLi+UALtijQiWAwhikfsj0CcL+ORKzPsBJw=; b=xLkrsuQZMrnWYT+/k8TLsgVuTx
	ONi8lRdJMVEgxPrpYb/nO10lLChlR3nsQhj7FbyizXcsUXMDZiiowJ7vmuq6ZdEY8tC/mX4Q41cX3
	yO8BRAV9qECnufc/VqH131/CmVXElCU7a8QPkUQFAMleVEcpCGrNYf6OOmy7Zk9Q21AZtDd9rM6mM
	/C1oOPmusYL0hXH/+rwqVoKiNbkiHor3ab5Lnt9tirgfhpyfnI2HayeC0Wf0jE/OmQ/yxu+BeTfLc
	23UMHmLJP5Nma6jg6i2njwN9rtSJXtGMPZqnEdHlpES2f4xG1MkSbrSSLnA4kXkOWfWq2CMo1SU4c
	HoofPC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicx-000000067Tq-3oc3;
	Mon, 20 Jul 2026 07:41:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicu-000000067Rl-31Fl
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 5097240E4E;
	Mon, 20 Jul 2026 07:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AFC241F00A3F;
	Mon, 20 Jul 2026 07:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784533284;
	bh=ZOshmT8m8ng2w1EYl4xq/wCbBE5tJcPpzFLCQTM7OzQ=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=cU3C3ydcREBX8BwistJbOjEUMn1iXyxjMValaq7ufnj/WuiMfodFERqDo8ryebj14
	 YDIIb8NWHlKx9Dh1JPoAw5c3la3mE6qd3Dmc1Q6wI0lFZOm8yD4IsQuWiS16ZawwyO
	 OzS4RiMTodkYEOScuXFEzQo7WRlNtkwSQ8zSuwdhYvg/PApo1jz0IQZFe24ANIL74a
	 BIWIE/Olcu6bb/4aIN6/gOSmrF0yvZqlZOFaoXSmQWmDVTitdTkYiua1OatLXB1cBv
	 VTHUzt1b4eeUzMCJ8re/BcrjrHbPVdlZsQGhnlQwicI5VRcMMv2agRWJBHRQYPrsGu
	 nuVOvPVHqqCOQ==
Mime-Version: 1.0
Date: Mon, 20 Jul 2026 09:41:20 +0200
Message-Id: <DK3893GFV1ZQ.3QF1WIWYGH5NH@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "HyeongJun An" <sammiee5311@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: check the length of the xSPI
 Profile 1.0 table
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260719010820.1924739-1-sammiee5311@gmail.com>
 <20260719010820.1924739-2-sammiee5311@gmail.com>
In-Reply-To: <20260719010820.1924739-2-sammiee5311@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2938192887629674818=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2938192887629674818==
Content-Type: multipart/signed;
 boundary=35aa284dd0a71060e6f12b8119b28dc504607f41144a320547328c0aae31;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--35aa284dd0a71060e6f12b8119b28dc504607f41144a320547328c0aae31
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Jul 19, 2026 at 3:08 AM CEST, HyeongJun An wrote:
> spi_nor_parse_profile1() sizes its bounce buffer from the length the
> flash reports in the SFDP parameter header, then indexes that buffer at
> fixed offsets:
>
>     len =3D profile1_header->length * sizeof(*dwords);
>     dwords =3D kmalloc(len, GFP_KERNEL);
>     ...
>     dummy =3D FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[SFDP_DWORD(5=
)]);
>
> The parser reads up to DWORD5, but never checks that the table is that
> long.  The length is a u8 the flash supplies, so a device advertising
> the table with a shorter length makes the read run past the allocation:
> with a length of one the buffer is four bytes and dwords[SFDP_DWORD(5)]
> reads sixteen bytes beyond it.  A length of zero is worse, as kmalloc()
> then returns ZERO_SIZE_PTR rather than an error and the first access
> dereferences it.
>
> The bytes read out of bounds are not just discarded either, they end up
> as the dummy cycle count programmed for 8D-8D-8D fast reads.
>
> SFDP tables that do not match what the flash actually implements are
> common enough that this file already carries fixup hooks for them, and
> malformed SFDP has caused memory-safety bugs here before.  See
> commit f0f0cfdc3a02 ("mtd: spi-nor: Fix shift-out-of-bounds in
> spi_nor_set_erase_type").
>
> Reject a table shorter than the highest DWORD the parser reads, the way
> spi_nor_parse_4bait() already does with SFDP_4BAIT_DWORD_MAX.  Failing
> an optional parameter table is not fatal: spi_nor_parse_sfdp() warns and
> carries on with the data gathered so far.

Please be more precise. Best would be to describe the issue in your
own words.

> Fixes: fb27f198971a ("mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 4600983cb579..d3d85b5d1b4a 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1175,6 +1175,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  #define PROFILE1_DWORD5_DUMMY_166MHZ		GENMASK(31, 27)
>  #define PROFILE1_DWORD5_DUMMY_133MHZ		GENMASK(21, 17)
>  #define PROFILE1_DWORD5_DUMMY_100MHZ		GENMASK(11, 7)
> +#define SFDP_PROFILE1_DWORD_MAX			5
> =20
>  /**
>   * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> @@ -1192,6 +1193,9 @@ static int spi_nor_parse_profile1(struct spi_nor *n=
or,
>  	int ret;
>  	u8 dummy, opcode;
> =20
> +	if (profile1_header->length < SFDP_PROFILE1_DWORD_MAX)
> +		return -EINVAL;
> +

I see that it's also use in the 4bait parsing, but I find it very
confusing to read. IMHO it should be SFDP_PROFILE1_DWORD_MIN.

-michael

>  	len =3D profile1_header->length * sizeof(*dwords);
>  	dwords =3D kmalloc(len, GFP_KERNEL);
>  	if (!dwords)


--35aa284dd0a71060e6f12b8119b28dc504607f41144a320547328c0aae31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCal3RIBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ihLwGAskQamNNqs8zqOttDv2dDfbtaIgcmdOF9
RV1F0QDolPKalWR6BR4gMwX4WteVmOHZAYCReyvB1a4zLHphxsH3PZ6UtJjv99/4
Co6YGx30EVb8fDhPZjcyaXEhD9bFiGXnEuM=
=qB5J
-----END PGP SIGNATURE-----

--35aa284dd0a71060e6f12b8119b28dc504607f41144a320547328c0aae31--


--===============2938192887629674818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2938192887629674818==--

