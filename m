Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E51C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQHgSwYgDQgMBhdKN+1C9gledAMJLqhkYN709Uv4jG0=; b=j/5iuHHwtFI+OGgOAp9kMjBEaD
	zg3Uh+Hu7utebs8PM+a6KOj3xgWQu1LBPv0gjKERnk4/eu/s7PTwr9bHSX5BuVGCxObgWgM9K0qYT
	qf8jRB3YYSN3g1cpzjJelWJzwvG65UFZ2ijMX+koPW+C8p0JVKBBiMNxZ6Jp+ndOJVwcll1ysIV5a
	kXJxucRx6XPApolk1o51FSvResutha4cGUKNL3ft4RqJA3Zh+QSTxT6j3oBy81zGka9LmohZlSzA+
	X9euNOoOpPqM0N7gnQqwTbGYcnEG317MjgRY5PHtaLcb27eYhTnkmkCMglXuxF0AHtmD49ZpqObDr
	Yoa2h2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFV3b-0000000D8vj-1KCo;
	Fri, 07 Jun 2024 08:34:43 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFV3Y-0000000D8tm-3dBF
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 08:34:42 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E359B5E6;
	Fri,  7 Jun 2024 10:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1717749267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=Aq9ENGwAgtIvHuY04IfZDdpkWPsuMWl/UTyeHA/6IKY=;
	b=ZCfh/mezjfqJo1bJX7AWGq5hnnazWZ4dVSY4vYQWkUNG19Jl75KULGy+d5pi3GowifynCw
	tVnQKQU5q+vMZqhK4epbHutxGfnqlvCILlrNby501L3yNQHSbTSzcUEYK0QjHqTLnVStqV
	LnHwWxRlcKfe6y8yyeDo5aGQd6SeePYVMAcaqGPb0lBIL9eHogMM3euFTQ2Y11bgWyTXhR
	XD1CsDSA7j1ZTWD1Jiuw/XynJKFPgLwtMsuOdjaQRvKvX1cm+k/lJp/gbccHJXf9qf136l
	r0DBJO/A02WjVu1qVBmJsR9CayJbzqVdiC80gSbJimNHCtnQNYQHAHYJdS2P5g==
Date: Fri, 07 Jun 2024 10:34:24 +0200
Message-Id: <D1TNAMAIIHAF.1QD3BI5DZTZBF@walle.cc>
To: "e9hack" <e9hack@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: Definition for flash w25q128 is wrong
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Esben Haabendal" <esben@geanix.com>, "Linus
 Walleij" <linus.walleij@linaro.org>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
References: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com>
In-Reply-To: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_013441_100651_69BFA9F1 
X-CRM114-Status: GOOD (  19.23  )
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
Content-Type: multipart/mixed; boundary="===============4058911893476346596=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4058911893476346596==
Content-Type: multipart/signed;
 boundary=459efd42eca339e08d81ca6fa10d4d78e0dab814c87990a07090f00f1221;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--459efd42eca339e08d81ca6fa10d4d78e0dab814c87990a07090f00f1221
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jun 6, 2024 at 9:50 PM CEST, e9hack wrote:
> I'm using a TP-LINK WDR3600 with a bigger flash. Since some time the
> router hangs in an endless boot loop. I see the following message:
>
> ...
> [    0.402716] spi-nor spi0.0: BFPT parsing failed. Please consider
> using SPI_NOR_SKIP_SFDP when declaring the flash

Looks like your flash doesn't support SFDP. Relevant threads are:
https://lore.kernel.org/r/d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org/
https://lore.kernel.org/r/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26=
835c@geanix.com/

> [    0.413217] spi-nor: probe of spi0.0 failed with error -22
> ...
> [    0.926180] /dev/root: Can't open blockdev
> [    0.930427] VFS: Cannot open root device "(null)" or
> unknown-block(0,0): error -6
> [    0.938037] Please append a correct "root=3D" boot option; here are
> the available partitions:
> [    0.946520] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    0.954914] Rebooting in 1 seconds..
>
> It looks like the definition for the flash is wrong:
>
> --- a/drivers/mtd/spi-nor/winbond.
> c     2024-03-15 19:27:50.000000000 +0100
> +++ b/drivers/mtd/spi-nor/winbond.c     2024-04-01 05:59:17.166780732 +02=
00
> @@ -120,8 +120,8 @@ static const struct flash_info winbond_n
>                 NO_SFDP_FLAGS(SECT_4K) },
>         { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>                 NO_SFDP_FLAGS(SECT_4K) },
> -       { "w25q128", INFO(0xef4018, 0, 0, 0)
> -               PARSE_SFDP
> +       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_=
READ)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>         { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_=
READ)
>
> With these changes, the flash will be detected properly. The chip is
> marked with:
> The chip (SOIC8) is marked with:
> winbond
> 25Q128FVSG
> 1327
>
> I use another TP-LINK router. This is an Archer C7 v2. It has the same
> flash chip with date code 1528. This router doesn't have this issue.

Looks like some of these flashes support SFDP and some don't :/

-michael

--459efd42eca339e08d81ca6fa10d4d78e0dab814c87990a07090f00f1221
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZmLGEREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+LWeAX9FjdgvTdg8YiArKOMoGa4+eCPP6eBmoB4k
UejJUrIJ3bek7fi68QXf2CEFBgKO2tsBf0/zX+NoK89/LMmpXY+mDFHatR/xvosj
3b+I6yJ4wpXQnoR5qEmMMLkuLbG/BPhqng==
=ocYr
-----END PGP SIGNATURE-----

--459efd42eca339e08d81ca6fa10d4d78e0dab814c87990a07090f00f1221--


--===============4058911893476346596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4058911893476346596==--

