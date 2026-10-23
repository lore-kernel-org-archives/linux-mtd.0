Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B9606A324
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGYSEajz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3PW+9+L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E1lOvTL7VmhMkOitM1iVGKuWpPR/QxjLFxyl/pkHuGc=; b=lGYSEajzZH80Zww/M+ui+OPcfA
	YvmLC3kkZh/2xNEN42GQXWmjf2CkzA9VhGb8TFdDcIDDZJ2U4yy08BRstTEAVn58vBnrl3vrytkfE
	sq7Ft9RMB7YAiXggwv97kyT9/w8QKqixWRboLU/pDjQ7rG7Y/h5u7MvvZIGOUPp80VLcU3Qf/iOEm
	Xi+nO363KFbpEe7dmIUszpbhXuUaqleh9blhOh+TQXGdUGiZ/WcIJ5f3/EfHmQH0GD5hbQAbNsck9
	kqbE1wld78wJGOIpSP0kpt5/AJ6/9BfcWHeKyzTLiDjQ0G2Mq6Sdrjumgp0qzchmxlhF/k5MSh/VO
	4qGgbqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBaL-0000000G24d-1nmE;
	Fri, 23 Oct 2026 09:29:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBaK-0000000G244-0VOb
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:29:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 9C73E43AC3;
	Fri, 23 Oct 2026 09:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 069B91F031E5;
	Fri, 23 Oct 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747751;
	bh=ApUOemm/+wB176QXWNQqZzhMXHryTGIJ+8y1XhrUjak=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=H3PW+9+L1G8I9O/jkz5r503Dc8BTCAHY97Rdo5IlGYc/DZuI/owoBGy5iWrHlQIjn
	 HdfHj4q04tYXhomkndPLOmAH24Vtn8hYrvF656dds+0Nn8TcSAY86hwl3kmG8YDP2r
	 dLhGEgdueHR+mgX3v5Z4tapFRbPy9yV8m06GvSBksxBFF7Vzx3HKGZ5yKspcLTdIYe
	 BLq21DZWus/UZA8Iki+1fj+zJNy4SMgrUWEXOJTEJoYDHV2tGdNokVBTogoQIaXST0
	 01zuESmCre2hI65O71t6sGLApsQZESZwRlzayu8SOq/mZi/z+LSOiO7dB/11l6WUCS
	 I9+jrqQDKPTVQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 23 Oct 2026 11:29:07 +0200
Message-Id: <DMC41DHV2V37.12QR2S7OFTWW6@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: swp: remove unnecessary else after return
Cc: <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Shuai Liu" <847807867@qq.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <tencent_25C57E270CDC01A4CB5894E4EF9B80708509@qq.com>
In-Reply-To: <tencent_25C57E270CDC01A4CB5894E4EF9B80708509@qq.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2804157673741226755=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2804157673741226755==
Content-Type: multipart/signed;
 boundary=d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 23, 2026 at 11:24 AM CEST, Shuai Liu wrote:
> Drop the else branch following an if that always returns, and move
> the trailing comment onto the fall-through path. Cosmetic only, no
> functional change; silences a checkpatch WARNING.

So what is the checkpatch warning? IMHO that change make the
readability worse.

-michael

>
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 235070b21..3b8176b9d 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -135,9 +135,9 @@ static bool spi_nor_check_lock_status_sr(struct spi_n=
or *nor, loff_t ofs,
>  	if (locked)
>  		/* Requested range is a sub-range of locked range */
>  		return (offs_max <=3D lock_offs_max) && (ofs >=3D lock_offs);
> -	else
> -		/* Requested range does not overlap with locked range */
> -		return (ofs >=3D lock_offs_max) || (offs_max <=3D lock_offs);
> +
> +	/* Requested range does not overlap with locked range */
> +	return (ofs >=3D lock_offs_max) || (offs_max <=3D lock_offs);
>  }
> =20
>  bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, cons=
t u8 *sr)


--d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatso4xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/geXAGAtmA1bXnVFLtWXOCoVlNCz/JjY81JBKrX
HuSNRkg/SpVTWIGYXXqCmmUF62/MMvgNAX965Xq+msnzoy+l5lKPcS/aLyLzEGid
4pWC+BcJ6IFEEdkXFPWpDt58aiFiWmMF+po=
=QF+o
-----END PGP SIGNATURE-----

--d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692--


--===============2804157673741226755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2804157673741226755==--

