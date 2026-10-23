Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA65606C906
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1075v4B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIPlh+81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ot7ODTtuedaXz993Oy0Q5luX7NdatQRPPmxOSHmpG4k=; b=h1075v4Bz/uytEprvRbuDFOHVe
	Em0t1wssUtgeEgccenNBQsUBvh3DQXBoIU56u7kaBRjB1PWqWobyImI6kQLJQXfYohW+FVG2eOHNc
	NfmzTG91QUmLwN6lSKDrLXj/Kw+jE8OnGZ7N7CYITFzZwEUaPSGpLWASkXMnZ1CeWLN6y8kxiqgKR
	eefm0uzJbP3nr6pXcmFL977I0bzz0q+nOY6N8So+DSfpm+FpHSGDyRJ8fzdtwCme/HfLHgPtilIin
	h6eu14uGPyhlgFSIF0Eyp4ByvprHxQJp70tV+TcJO2JuAYkNuBQzwDXVXWZzZvIzkX0+qa5ZGL4O3
	LJoEy8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcI-0000000G2rA-2Sdh;
	Fri, 23 Oct 2026 09:31:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBc1-0000000G2ce-0aF2
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 95D7243C3A;
	Fri, 23 Oct 2026 09:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F346E1F01201;
	Fri, 23 Oct 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747856;
	bh=tCYx7L2FNRpKZU6qBFW+ZmUHPGXqSze/QEf3XRwSkfs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=eIPlh+81Vo0shpmUy36iplQPH7JbhU3dQhpgZsXogTA1MbB8IsyVrcGAWLwJmjryi
	 uEtRBEVZRLP2HT+Q5xgEjpMhkeKBiVkH8nKxaU29o/ztHqNA3Pkl+wQpaXUs5YDQKS
	 ncnp6BMm+lDeiuIJBle54xbxSBEx3nOov/HTnV5QsWOLIyq6eIhr4eUaf3z/Z5bGRW
	 BrhuVzUPVWUZCPQCQxVWpiEr8So+h2FOYWzEFsnhxzE2YQw5SCS4/nf7Dc+j+t58ko
	 0x2FpmryQlKHa3m4bTFZTpFcHg8hZHNlZc1cMRulkN9NepWqhpXZVBxuocMh5C8Gao
	 YIakbUbvSmn9A==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 23 Oct 2026 11:30:52 +0200
Message-Id: <DMC42PZGE0L9.25VCSYHXHMN9L@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix missing space after comma in legacy
 flash names
Cc: <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Shuai Liu" <847807867@qq.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <tencent_760494FBADB4184B967C5A93312EB198F506@qq.com>
In-Reply-To: <tencent_760494FBADB4184B967C5A93312EB198F506@qq.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3690435065201257052=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3690435065201257052==
Content-Type: multipart/signed;
 boundary=9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 23, 2026 at 11:24 AM CEST, Shuai Liu wrote:
> Add the missing space between string literals in the legacy
> flash_info entries. Cosmetic only, no functional change; silences
> checkpatch ERRORs on these lines.
>
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46..31cba60bd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3898,11 +3898,11 @@ static const struct spi_device_id spi_nor_dev_ids=
[] =3D {
>  	 */
>  	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
>  	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
> -	{"mx25l25635e"},{"mx66l51235l"},
> +	{"mx25l25635e"}, {"mx66l51235l"},
>  	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
>  	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
>  	{"s25fl064k"},
> -	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
> +	{"sst25vf040b"}, {"sst25vf016b"}, {"sst25vf032b"}, {"sst25wf040"},
>  	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
>  	{"m25p64"},	{"m25p128"},
>  	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},

Well, that is because they are aligned with all the other entries.
IMHO this is just unneeded code churn.

-michael

--9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatspTRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jxuQF+MPmLCsn/qD564wFCQ3yZO71xLqbE2u5n
kAu9LlAOmbkkKL+klaIOxRQbzKDPOUkCAYCmijTAryi287lsr1FFvdc9T8Pdbywq
Weh6udZPUd2TK24yTspztZ00E4JDeCiNW3A=
=rj7B
-----END PGP SIGNATURE-----

--9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f--


--===============3690435065201257052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3690435065201257052==--

