Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85046C5AC82
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9aXx/0sMHuAU6SFa3adH1jspG63v3ROhYVzvUg+LIQ=; b=UicblTcZuCJzxLtw1D59/FVeZu
	Og0BZ7LYFvOT7+dEtu3hB+rDCHOcj2tT7O6KCZfNk8MiFDWebKX/8JTWMglCRoqCSPPS4xRWHrg/F
	sycWNPDZGn9hZLDkF7Z36L3/7jAQrjmpwFrrmDPSIsNeCdRSs5yoIKlakx1JW5v6IYLEgVTkxDH4G
	ZsnFjT2/eT1GtNI58LyzoL48uxT4fCvPNTjs4GgbVmHuZT+q7E9yrfSWdOAb982RuZCfd1ljueHg4
	hgH+bqN8SGpZ6l/vpVJ+tKI84crEqMhO1P3k0kf1TNboeh6DuRVkjbOjg4H1SQClHVixmg5xANv6C
	J7zQNmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLK9-0000000BHXJ-1VHv;
	Mon, 10 Aug 2026 08:25:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLK8-0000000BHXD-1Cxp
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 08:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E8B5040734;
	Mon, 10 Aug 2026 08:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 529FB1F000E9;
	Mon, 10 Aug 2026 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786350331;
	bh=C2KZh8MLQ/aOgrMaNoHpKoAfAoY2VLfamQaMJSU87yk=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=XviqKGfNPfm7Qer6+2P1NYk0t8MzZS37lhaaINtkKjzYaqqLLrWqtdu4Bj2Ee4qXE
	 F02ZwcJBKEOHxr3pYVZT7J1xHWbIMJagymStlq2u0kNr/V3Yl09ZOpVjcHjOhqwy6L
	 4YsYncCxc7Xc4WkNX2I3SoNChdoOnRZucFwbeyh/XGKQtLMFd203N3MX/kWmFEo9Ds
	 Eg5nDHlCa+MVbwD0emlXUKzjdhx/Y4/dDWMTa1V5OpPnycv+8d7Z6iy2zuP/BlNQBO
	 BgdX8uR3tm/4SRpTkjEF/FRIu2avZRmGdg+t7cxPupnSUp5X/q8xvt1EbjU6jNgdOM
	 jcE+upt+VkniA==
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 10:25:28 +0200
Message-Id: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>, <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: scope the exclusive RWW lock
Cc: <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <jianhao.xu@seu.edu.cn>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
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
Content-Type: multipart/mixed; boundary="===============4131293160045580764=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4131293160045580764==
Content-Type: multipart/signed;
 boundary=21f07eccd79721a84a7dde8db6b46a9390e37f79785d731da48d2cee5dad;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--21f07eccd79721a84a7dde8db6b46a9390e37f79785d731da48d2cee5dad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Aug 9, 2026 at 10:42 AM CEST, Runyu Xiao wrote:
> spi_nor_rww_start_exclusive() is used as a wait_event_killable()
> condition. The raw mutex_lock() leaves nor->lock held when the busy
> condition returns false, so the waiter can block the active operation tha=
t
> must clear the RWW state.
>
> Use the same scoped mutex guard as the other RWW start helpers so the
> mutex is released on both the busy and successful condition paths. The
> state flags remain the handoff to the caller, while
> spi_nor_rww_end_exclusive() continues
> to acquire the mutex when clearing them.
>
> The change was checked by comparing the original and patched source.

What do you mean? Was this AI assisted?

> A source-level check of the original wait condition found that it takes
> `nor->lock` and returns false while an RWW operation is still active. The
> patched source was checked for a scoped mutex guard that releases
> `nor->lock` before the wait condition returns. A user-space pthread model
> held `nor->lock` on the false-condition path and showed that the
> operation-ending path then blocks when it needs the same mutex. No live
> SPI-NOR test was run.

What do you mean by "user-space pthread model"? Ported this into
user-space and tried it there? Please keep the commit message
precise and don't use any AI gibberish. Please, explain what's going
on with your own sentences. That way, it shows at least some
understanding what you are trying to change here.

That being said, there is something odd about that commit. Tudor, do
you know why you've omitted the guard() in spi_nor_rww_start_exclusive()?

-michael

> Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..8bc117b46e02 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_=
nor *nor)
>  {
>  	struct spi_nor_rww *rww =3D &nor->rww;
> =20
> -	mutex_lock(&nor->lock);
> +	guard(mutex)(&nor->lock);
> =20
>  	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
>  		return false;


--21f07eccd79721a84a7dde8db6b46a9390e37f79785d731da48d2cee5dad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCanmK+BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h98gGAgzRVKT7YydU2Ap86SZdq4kL1YHee8oiH
DukMY7ja3eIL8iGSZO/dqSZvORbENsmKAYCSOOx268ogFrjUgCZJOYEH/rt9Pe9r
8L49MubPKoYyR4tGnFPaONgUF7n7mQvlhUg=
=0O61
-----END PGP SIGNATURE-----

--21f07eccd79721a84a7dde8db6b46a9390e37f79785d731da48d2cee5dad--


--===============4131293160045580764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4131293160045580764==--

