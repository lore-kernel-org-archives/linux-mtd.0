Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F08AC761A6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPZON0TzfOfb4tBsSyI0CfsMaGuMhPy+u8VBwpjAtVA=; b=AGsKBFkPB7gGelNxsvFebXJoKS
	YwKL4ZwgAmTkKpTCYwd+myvnRHAHQPDfgW/V43tV3fOSYXSzNTIzRyKY8D/tLCBwkDy+mxmzqc7/0
	//0ouPOJLAmOovTqiIa+G3pmZfjI7miNlyUtoT/lE8IZWoN0rc812IltrbaUfylO0EmLyld0vEKcz
	OXZZkzbGoIM+Kg964Wqu5sWGU8vhHk7nUmt/ryF8I3MvdxIPqBrE2AsQUp2Ev/eY96FAUmmbX9kAO
	xqTO8cyBw98eMjrFSbxVV1uCsqZvOgeESBXIk20HvOkMEHrws6CSrbfI1KTbbppDepA2EbfvDEA36
	nb8FUZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk151-004DVr-1W;
	Wed, 05 Apr 2023 11:13:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk14z-004DUv-1o
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 11:13:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-4fa3c1a7a5aso308081a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680693207;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+mwwhpGAeK4xkTJChBqUCLo/HcDLqGyQxoPM1TmXN4=;
        b=ScnREK8qcGdhVR2w47vw+zNQYh00dm8nIS9q4KmxfJWTXbzyz08PIZghzf0c6GRmfm
         MJIjmOvwPan+P5Ysf8zoVXS7n85d7Iv/d1FxmginBwp0PjRysVERTYFmqoGlqPtiFIOD
         V5PVF+3pPJkazrA+Xg7fsoAT5WMbdtlvTEW4Mvt7P6XhCQntQ6hS6IJzex66WK4Z/ytq
         O2pwoHDVcZB+s9Mw99pgISsLPQR2BD9X0amVTWtLoPA818EgEeSX1rMGpvD4gW1cG5N4
         n8dvN+GAZo5cI+PI4bptOin2lKCvpJ2aFsUp+bPLnGb82y7RN9PobMC1GSOGfNvrlHrP
         JuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693207;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+mwwhpGAeK4xkTJChBqUCLo/HcDLqGyQxoPM1TmXN4=;
        b=rx8MPnn0H/nOwMrPOl7no+OlkAd6JuZxQY/uTAidaeLzascqwNmPuOoCXnEPvP+cOC
         Yc3Xmx33N2Sa/TSamLVKmAx2c1avvM4yaRPKdjwTPbx61tJJE9T15qbCNB0OyhGuIIlr
         5/z11uCM1vKQBKPWTnX/UjI3dtq8qWMm0UchTUwyUKz0R68sybPiL2Nx3WoOEWHHVpEZ
         08H1e4/bbfqESuzB3euRCv2pq6bP8PHtAvyy9Qkie1cHhxgJFSxBFzHHz3N1PTCHAshE
         kFllPK3m7sViYnQ0sD9Py5SbrlPR//gAh+QgM4NDkWabU/2i66CABIY/1lfRPd12mv6q
         mSSA==
X-Gm-Message-State: AAQBX9fkMYYqill2d4DTtTtIhsW+FeTii9l9lZ+5fqalaMwSKO+B2eug
	/XZszxZJoG/cA06PWsJow0o=
X-Google-Smtp-Source: AKy350Z67kMpXqhx1TonCX9wPt+T6Fl6NztyLAqxIijVdvfbYKvPe17H5f5YODHf9hI7DWTiYiBRgw==
X-Received: by 2002:aa7:c94f:0:b0:4fb:3ab9:fe81 with SMTP id h15-20020aa7c94f000000b004fb3ab9fe81mr1283712edt.30.1680693206811;
        Wed, 05 Apr 2023 04:13:26 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b005023aaf52desm7095669edc.95.2023.04.05.04.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:13:26 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:13:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	linux-tegra@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 47/49] mtd: rawnand: tegra: Convert to platform remove
 callback returning void
Message-ID: <ZC1X1IdDiaPvBXdg@orome>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-48-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230401161938.2503204-48-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_041329_604469_061099E3 
X-CRM114-Status: GOOD (  16.53  )
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
Content-Type: multipart/mixed; boundary="===============2019918690278807943=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2019918690278807943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wTshhJMdpC1E6eg/"
Content-Disposition: inline


--wTshhJMdpC1E6eg/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2023 at 06:19:36PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wTshhJMdpC1E6eg/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtV9QACgkQ3SOs138+
s6GI7Q/9FU7Nsf2vSUJquqmaSjNCxGyfEsC+VNBItIrQbm08CIZZm0Oh9hkQICF7
Be6XXMh1hSzrPshmMTouhY000kgHonDQSwV5uhI2tA1Y8UN+/FbHLksfr/W9SpLp
IgQZ3N2VesgojNDsjiIDmBSVI+FOw+DnLA7+RkHT+1CfJHTQIgjj5iO7Xmk8rIkd
cI2ZDNVFJvd70iBbV0ItBDrkkq3F4UulFWWfj/kupbzDjSt1O9ipxmmt301TG2+k
Ylv4r9YeM+Ap/syjR4SCZk67IVWRE5IolXimqJsmMzOlcVBjh0txOHBYr94HxrBf
fpHAEasjpmdzoBq+WAx2z1AMvppr3FPlma3n5DTBjWlrUGeNDzHEfSvX/JXuSRTa
gEPnBjHPrb2uD9K7RpppUvffw5ceIW3ti4Y8O2EEKNDOUTa79SwezYr5JESmYwfq
3fF1E8ERwRpFpvHLxRXF6Y1MeTvTPV10KW1edHtkHLXd8+KJKuQQ2faIph5vd461
kr1YNAalkTJSphPBkq1+pNqppPIf4MAXOFrOXgaZQNU+vCJJhsHRJz6DDZWJD3iZ
A3FPN6A+UcSt7sZlMt7wd1eN3kHmWr5XDVg4PqObwsUoRcjO2bi5/BYFYeCCR3vF
+8E7doOpJPhcsZ7AqtfjFPKFEeBFeeAofogECldPYlAek/yIHQQ=
=bmkJ
-----END PGP SIGNATURE-----

--wTshhJMdpC1E6eg/--


--===============2019918690278807943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2019918690278807943==--

