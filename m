Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636DFC43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkb5yFhQU4UsV4kgYQH9iW5kQTgOvHuRxbbNWqYPr0o=; b=vKvIKlfN8O6ha9xvcay2I3KqiT
	8y69u2abFhqtj8sdIDe7jOhE23FS/kRs6+XOey9wRg2+0etr0vLUJojWZBthuJvx8aqNHsnllmUV6
	sH1qxdXD6dbkIDd2EJO0lflAFQt3ROTk53A8zQiZbcCG9JAFiH5akIoIBFJJUtrpzc3wfAPRspM94
	A/92vJZPflehFp4rjEWgyZ0RMzU53COC67c/k5fruFAK56PLr2jSalg2Mo/QZUZymTG6Bt2OKFvLJ
	9qI+dGTSArKVNoX79t3cowJKYheeHGgwRqKXxL0Lg5TqgZWzGXxTDnYAolvXgtMOCJnWao0pwBQ8h
	uE/JqvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0K-00000003ko3-2ahX;
	Thu, 02 Jul 2026 07:38:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0J-00000003knt-2o9D
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 07:38:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 66F8A6001D;
	Thu,  2 Jul 2026 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F36151F00A3A;
	Thu,  2 Jul 2026 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977914;
	bh=SVYy/kAB71zO9r41iE0OF5XPAjDAV0RY4A3rcH+m2XM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=SZi/lw3ymY5+oH4pIVknJkew5GLxNj0DZOG/qXudljPARMR6rxk4gDYYXRFDdy236
	 SCnQlOGu7jiKJP1VqWKOxZFngL1iAjM2vYUc9Uq+UCagfgTqgs5JkJ6WSwn010IsIl
	 wXRCTJp7Y3rmOzj72BwD9w1IvxLcmQn94i4xi1b2SClM6WOvHxFLK/PD6qd+m5BZDm
	 fFFkwhlwA6iHY+t/4F0EagYoJzkqOn21uP4Rf38VQukyodxOXYE8YFmteVSBNNO8wd
	 s039fiQlXcvMpLENrj7p6JcOdOE1/Ajt2uSJXy5tG0Cqu2GKqDUiDOjVTniXkdPkjg
	 psACam98JsMDA==
Mime-Version: 1.0
Date: Thu, 02 Jul 2026 09:38:27 +0200
Message-Id: <DJNWX330PGHM.3IXKZ7556X5FP@kernel.org>
Subject: Re: [PATCH 6.6.y] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
Cc: "Sasha Levin" <sashal@kernel.org>, <stable@vger.kernel.org>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <alvinzhou@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260701023619.2730136-1-linchengming884@gmail.com>
 <stable-reply-mtd-macronix-66-20260701193800@kernel.org>
 <CAAyq3SY48RRSO1nN-uRH7HVnXbnvQ1_K823Lc_hRsCyVuf9L3g@mail.gmail.com>
 <DJNVRMSG4C6K.34EGBE463IOCZ@kernel.org>
 <CAAyq3Sb6d4xtp-wEwM9EhMo5OSzjvsh450JcwyeEOh2NeLrA8Q@mail.gmail.com>
In-Reply-To: <CAAyq3Sb6d4xtp-wEwM9EhMo5OSzjvsh450JcwyeEOh2NeLrA8Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0459415919124442001=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0459415919124442001==
Content-Type: multipart/signed;
 boundary=4ec6414e26803d0253bc75a898ab2f13722c7d6a6b9e2a84d35a14bfb691;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4ec6414e26803d0253bc75a898ab2f13722c7d6a6b9e2a84d35a14bfb691
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> To follow your guidance, I will prepare a v3 series.
> My plan is to:
>
> 1. Backport commit ac5bfa968b60 ("mtd: spi-nor: fix flash probing") as th=
e
> first patch in the v3 series to resolve the NULL pointer dereference issu=
e
> in 6.6.y.
>
> 2. Send my flash addition patches (without the .name field, using comment=
s
> instead) as the subsequent patches in the series.
>
> Does this structure for the v3 series look good to you?

Sounds good to me.

-michael

--4ec6414e26803d0253bc75a898ab2f13722c7d6a6b9e2a84d35a14bfb691
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakYVcxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iZzAGAnNKF7MipXCXc9iWKoLeTIJ7+Y3nkq7sD
6JWd+NhoRF5/JsZ6ZxP256g6Qbx3LSOfAX0TPAtt2NKeg0GkjshagxLbx8lyumdu
jN6fSgNckkwss3Noi7n/RsZ4KKPf/4HubwI=
=K1qx
-----END PGP SIGNATURE-----

--4ec6414e26803d0253bc75a898ab2f13722c7d6a6b9e2a84d35a14bfb691--


--===============0459415919124442001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0459415919124442001==--

