Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317B6C5475B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA/eweYcsrch41bQi6biUdC/XZEOykim82n4Yz66h5A=; b=hQmiUasaxIq4gKKoIjzZifenqr
	Pbx9DCL3/oH8W4dK282FSERVsR4O0dLzSjcq/T4MVWvToDEnPzBWAuZdymDb/VI+HEMMG39mZ8IHW
	uwvW2pq+vK86a9MPxrbgEZb+1erWANQayp495CzBKdH1ggTYhcfbGKZ9T0Lv1IcuXIc3Dqu7hwM84
	hQ14KVgtqt4FGTTRGkBPj8mnmY5P2Q42cdKne9FgyRbzQe9xIfwmPUCdcZZKPf6VKkNKBDn1FRGmM
	5xuW5kf+6vGKKNIdhLAAcq8ztPRflmdL49JbZc3zntC1ahnhFwLxPo7570WDswpU2Qu26VEr4Ygt/
	90cXBhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqox-00000000HnG-1KPp;
	Wed, 06 Mar 2024 12:56:31 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqot-00000000HiZ-0P1g
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 12:56:28 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 22E69388;
	Wed,  6 Mar 2024 13:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1709729740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=UP/4+AXPcHAM5/gNlpqoxc85tyPx6tucnSD5r/YpHwY=;
	b=S6g3syyM/MiL9iwvka5/XUdY0Tnw87AJlzm94DPamk6N3FDMgvn9mg6CJiki6dXcKAUVOO
	2UQv/wMaY9W+Xg7NbvQ/hO5/uvOiPqqA4tzMzsAlDlykvLPzZ7dBi413jCQOrAHcH2542k
	9NlXk3Ra1JoY2GjtbwbQ9+YSuP6ZESWBcui156oIbXXKcoFUPwY5Od1OJlUXFlswBx42DH
	UOHbuDjGX1zevvDiNn6p4iPCXpdfoshphAvRem80widurHYpou3sXOHF+PiWDxDCyxgD2L
	xVclATsKzge3BESyegOnhty0cxFw3tSrnq2BeYj0VjN5lKAAZS/a6ULZd6vmHw==
Date: Wed, 06 Mar 2024 13:55:34 +0100
Message-Id: <CZMOLX07WDHJ.36M7NNZK94F99@walle.cc>
To: "Marek Vasut" <marex@denx.de>, <u-boot@lists.denx.de>
Subject: Re: [PATCH] mtd: spi-nor: Clear Winbond SR3 WPS bit on boot
Cc: "Hai Pham" <hai.pham.ud@renesas.com>, "Heinrich Schuchardt"
 <xypron.glpk@gmx.de>, "Jagan Teki" <jagan@amarulasolutions.com>, "Johann
 Neuhauser" <jneuhauser@dh-electronics.com>, "Simon Glass"
 <sjg@chromium.org>, "Takahiro Kuwano" <Takahiro.Kuwano@infineon.com>,
 "Venkatesh Yadav Abbarapu" <venkatesh.abbarapu@amd.com>, "Vignesh R"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
References: <20240304161607.82759-1-marex@denx.de>
 <CZLOVK212G8L.2ISEL1IIWU1YE@walle.cc>
 <7c0e2496-4338-497d-96cf-41d75e2fc52b@denx.de>
 <CZLTVKVR3AG1.BZIQQU2PYSU6@walle.cc>
 <a28b0543-67ee-4e33-91c1-86ae36eb44d5@denx.de>
 <CZLXRLFU5YKU.1S5D9EZ3GUTH4@walle.cc>
 <faa78709-6b7c-4394-8048-3c1f09b65a04@denx.de>
 <CZLZ391C9O5F.38A18T9S51BNT@walle.cc>
 <d522ac8e-8664-4798-9069-947691c6cd43@denx.de>
 <CZM55T7YDKCR.3AIA4OQT2VG0S@walle.cc>
 <ba2831d1-9ba1-4cd3-89c5-f4b9e8a4b94f@denx.de>
In-Reply-To: <ba2831d1-9ba1-4cd3-89c5-f4b9e8a4b94f@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_045627_320994_4E4C051C 
X-CRM114-Status: GOOD (  11.53  )
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
Content-Type: multipart/mixed; boundary="===============8443124151051523620=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8443124151051523620==
Content-Type: multipart/signed;
 boundary=628dd0f2262d98db81a5a3b4102f9eb2bd50b702375f351cd3de550bd1f2;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--628dd0f2262d98db81a5a3b4102f9eb2bd50b702375f351cd3de550bd1f2
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Mar 6, 2024 at 3:56 AM CET, Marek Vasut wrote:
> > I'd argue if one wants to use the locking at all, you have to set
> > UNLOCK_ALL=3Dn. Otherwise, the bootloader might come alone and just
> > clear your locking bits again. Clearing the WPS bit there is just
> > one more thing which IMHO doesn't make much sense.
>
> On the other hand, if UNLOCK_ALL=3Dy is supposed to work and reset=20
> locking, then the SR3 WPS bit has to be configured to select the=20
> standard SPI NOR locking scheme, so the locking can actually be reset=20
> using that scheme.

Yes, that's what I've meant with "the unlock all works as
advertised" and your patch is fine.

-michael

--628dd0f2262d98db81a5a3b4102f9eb2bd50b702375f351cd3de550bd1f2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYIAC8WIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZehnxhEcbWljaGFlbEB3
YWxsZS5jYwAKCRDNyh2jtWxG+9OYAP48lD5V4W6ZtS2VXwQW7z7loSQYE0VyFTr8
OIQOJjuvMwD/fHszb9szqtF5DUI02DVnWMoBIsZNbjvzWwMAwucgoAc=
=Qsij
-----END PGP SIGNATURE-----

--628dd0f2262d98db81a5a3b4102f9eb2bd50b702375f351cd3de550bd1f2--


--===============8443124151051523620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8443124151051523620==--

