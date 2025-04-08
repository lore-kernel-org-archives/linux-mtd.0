Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04154C3600C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d8HSk4ZV23Msg1dkzvhDPWm/PB9PI5ELdPkVKt+jSA=; b=T7D2YeqGobQA2++QF2mXzEIVFQ
	3qVFXlxbSW9KfZ6wZGto9lIPGN194EikXw7wtRjX6UqZEZTvxDdVkG7/YIECq/mWTfIZUbuMJXpjR
	PZevVvBD6xHqffR02p+o1Suj3tdA9WZIzTA+oLGI5aKmT4kKKYSQuymkTEWX6isFXKI0K93fCbxQR
	HkJB4UZS5BFqfRXWjT5ABc7s2HcGMwrYeMImuhiEi0iPaU5j9uGByoG2rJ4EPVg/HJt+37z6wfvV5
	KY7fkXubvtoqkRkQEIkKpjkV3jNEB5NF9w8RBC7+hYKBRLGqqpq8Di1/t0K5pvaQ8UvPUxCkwptof
	OU15uICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24Za-00000003INW-2TQG;
	Tue, 08 Apr 2025 08:44:46 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24QS-00000003GxN-0G5V
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 08:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1744101277; x=1744706077; i=christian@heusel.eu;
	bh=zqzlA9n1r9CR6wuCNl1kJxLJLTIDkxwhE6SgiF36x5s=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=W4tRbtG0GuqWi/6oGm2kF58Zm6nJV0644xpVu8bKRubTxWXYkZ6/EaHZtaGwyHpW
	 Nf8OgJhqQD+YwJuW0HSfFxQHSCAh+XOZz4V0dP64fBpwY9TDM9FgUTo0b+Dx7mfIW
	 HjXN7zjrmmZ92U55SbJV8audJsWyz8v/+KbEe0GoTXoQYprzSdQAotIZZVELottQq
	 hmOnbcIb16VQDk1rsbzaq5Mes7dhj/J5tD+1SQZxf8Hd3Xvn15OUAmlbEEtCNS6gO
	 xYDb4vj8PzqhwAv6qdmaDZB2Rlns0bOMmR+byFTq7k6l8MpojyGog1Btf979QK9wa
	 MkszsKdy2iD49rQZFw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.49]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MXH3Y-1tYr7T10AQ-00Japt; Tue, 08 Apr 2025 10:34:37 +0200
Date: Tue, 8 Apr 2025 10:34:34 +0200
From: Christian Heusel <christian@heusel.eu>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, 
	linux-mtd <linux-mtd@lists.infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
Message-ID: <5bba59ac-005e-4994-aa22-c2565b8cdbbd@heusel.eu>
References: <20250408082018.GA23886@francesco-nb>
MIME-Version: 1.0
In-Reply-To: <20250408082018.GA23886@francesco-nb>
X-Provags-ID: V03:K1:qonpYrkuTDJlp5WFS+b383LvsXrAX+asOUbtT8PWMUg3L4yHDZ2
 sL3ShWIKXJeOAeXZbimyWpIl/S/tDjssqsmlsYyal5wBD5fnbpzWciFEE53fmLg4vGFx2Wn
 I2qjSCk2fQUO6oDVpj1e369gA+RKI4Rx6OxQaivcGqibHm22bScGmaSxt6rMs8rktAypru9
 x2UNhHZFTLBcZKQ/s+gnQ==
UI-OutboundReport: notjunk:1;M01:P0:rBnYq5Cu3jU=;aYI0jTGF6wzgVNNvaMEQJM4Q/Ao
 mJ/vKrPC1Z8SURx8M3m1VemAdd9ar4lQeYmsq9xaulaAkvtvUygYdusAZZgbfAhDMmj82Sm2y
 fp151d4fA5s7DV1mmwGc5BJfxjC1ImhrTXVAv59K13e78IwiG0tEAsn+BjXxxYrmVdoQgIGVq
 Za/uGqOKhuK5Z7HeUHdqIJy2fLc8P3SxEoxLqpb2S+xsWJx0+yLKP0QhfVt4XnBe/PeQU6x6K
 UUClsruBrrgWQuHc6rWT7PJz62SWtQKTaY1ScPeZAHnBseBAhGzlHfjUplTZ5cipdUsiMQQm/
 1AOF5cuTjhA10dNDETLU3VdAJUZPY4FmCS/8qRooUs1rsrLZoVCtKJeLQE/vyl7Go9evXeUYh
 WLMUhoXlPcjQcdMQO6KjVsjNFkPnp2Q1yWjI83X2MXyQcSdMBeAYpDeDnxvidXpwhi5HFHud8
 QgX1zQOFcb/N7923jlz0FMfD+5nuqgErY6etc+HjRhtf/bhX8b624+D21nh70/KFSvbd+CIRL
 rgo678XVkXEYVe/RYl7yuNYV6dXdFXRhRPnIYIBVznxwqxqfLk5l7wH2cSoBDor2ITE6fxt52
 JyBmIdYDLMb5nV5XUCQgePhE7IzruQ08wEc6rLsODVAX3iViWgA4tFAlwK+Lj15+x73E5Yz08
 zMOi9Kjc4Hf9kRcv8LpclfCyyaOPV5wK2BAg48uEShU1WfxseE539QGenqPBKIBR6aufdnseZ
 N0xnt51vC5cLxjSXvPBolmkkk8fxyeNLL8fr2zKsFShFE4RScswmKZCozd8Tc401SKHrGvqbA
 36IpAYZP//v0/4J9JBd+K2UnMcAdLAXVC7YHZQTNKuQyL0mAqMq+Y+rauCtPg7EHxRH8ehoDv
 01Fqt32ulOaCS3EHtuDci+jYyGsewqIeeMD1Bp1szog/6X6B8l0j4FwvlIJBWwVKX4EQOO4dX
 mZUAHHtVQ3n2Kj4MqLamX7vY7G+DqxFlpFgyAvUf0CJ5NRqkfHulz71VgSIWN8eYzGVt2JRci
 cG8PYtIdshXzhiKoLPESXqxpUrHgjr7G6UbDfGDWN0Fw6Iql7nrV7ET706WUxBZ/bvEAPQpQ3
 GY1grzUonELfdCGCAwasKgCFMKEUvKzby2Eb2WMMRv1A0pVUxKfRDUoeip8J15R9kQVmfbzAj
 5u+OF/ZVwy8ULYk/q6EJ5KtD8sFe4CLwPUYeIWc3PBDCKkuHOwzDNfDUxUQ3ynZ/AczNaXKSv
 GhfVkpOv3vm7+Wm1NjfQFjpAYZub3VHOb8b1bI993Oh5B+FYQuVCahwwdoBo5cjcnAYn+qNFV
 CpZR/IgngiDYWjWqm9vi1sr+sxo+jpBI0fc/uxMbniMML67dpMHEOTUrD8ohSI1WpqsJAVfy3
 ZTr1w4Z/1mfYNXH1C9YLJgrzHF7svA9pcXWc0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013520_392127_F5B9F32B 
X-CRM114-Status: GOOD (  12.35  )
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
Content-Type: multipart/mixed; boundary="===============7123794571536278160=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7123794571536278160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yjhj4l62urfzefuc"
Content-Disposition: inline


--yjhj4l62urfzefuc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
MIME-Version: 1.0

On 25/04/08 10:20AM, Francesco Dolcini wrote:
> Hello all,

Hey Francesco,

> I do have the following regression on single core system using UBIFS,
> dual core seems not affected, any idea?

could you try to bisect which change has caused this problem?
This usually the best way to pinpoint the commit that causes the issue
and either get a fix or a revert on the way =F0=9F=A4=97

You can find the relevant docs here:
https://docs.kernel.org/admin-guide/bug-bisect.html

> Francesco

Cheers,
Chris

--yjhj4l62urfzefuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmf035oACgkQwEfU8yi1
JYWgOxAAvhglW0Uz4Z/ODifFww4icGEshUUXIPnNmmCDdBhKgySaOyAOY+UMErNQ
pN8bHEWr1EDpLX7aIze88pLQalCs48wKfFoVZch7Q87Wde9MZqti5ls75VGCTwvP
+bDtUm64VRsLOShejWodpdDO0M8I37K/8jMA5E3qujXmqaxXtGtZEvnmHZA3hJAQ
b5k6of/UxRJySe31B8DHQR36FOX9y4Fq3fp37MOZk5ROGC2C3xv2SNF/iWDEiRFB
4+hcfoqW25n73v819Balrrv9Zr5g45a7eoS4PXuF0Ugy08vKaWGfB+Cl+FODRtqs
EPMuXmJJgLiNzldX68GZ31L1So7e6ze3z3IJC2PZuaN+EqAxXTtFT+IKuKxvvRHj
KI0oviYlE3h2sPX3UD+PK/7lKOcMkUo8CkOvvpLuXMbUstkMXz2xm8M7a/JxQdz6
KUpddMAdDCe1eTS6N2QVVJ3RG6j6AZD54/1+9N4+HibYlH6mnnPeLccJP1Y11b9p
7WrYzCjn3uIuK+haw7JYaMZjcWAzwTQlbKWBn3j6FDziqtCQ3h0zX5Vs+1PPFv3/
x1tqNw6atqQhNgtUayk6vft37XDonDtkgTsKhLP2lom3lCepS5TNo6T3wfANCSey
uOdLYUphC04ChRKsNFMkwiBz1ommmgM5xUUaXwgrBkL/lj6Z9Xo=
=UHYC
-----END PGP SIGNATURE-----

--yjhj4l62urfzefuc--


--===============7123794571536278160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7123794571536278160==--

