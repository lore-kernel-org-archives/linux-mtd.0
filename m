Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FC5C3DA59
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MLg4BltRrk4IIQD41iJpdAO/yitwR+bmbl2490I+tI=; b=1/5tqjz6YYuQ+OWSAPHvZrTKYe
	i3lKh3egrEeHXHBYhPuDlwd2kKL8EcTfVgWhZ3N02XP11KccN2qrxYLdJSqinyut8+RfyRDeIwjFC
	9iNaj8tl9tNmkdMvvkM3+11u+9dIb3xlbkZ46R6rylj2csOfF0gUaBl6j/05rOUOpzXflU0UfXDkp
	ULnZ+khUIfb6ux72/S6NMviq1PiXS7OgYy0trId7DnvV57GyaGrj0w6GwAFcws/FY/YZ74ZNJ29Zx
	rhzj6sskW3b6bp+KvmYyQrCUov/xMNPvs9wqlBqDRsxW9QNm0cmw9y+I68hLZJ+5hsL0thaeJME6F
	uUDzhk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn2q-00000008dEE-08zB;
	Mon, 22 Jul 2024 07:01:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn2m-00000008dCg-3voH
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 07:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0594CE0AC8;
	Mon, 22 Jul 2024 07:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CD9C32782;
	Mon, 22 Jul 2024 07:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721631670;
	bh=leuPpGiqOfrJf60CNoIBnX9WfHQpps/3Pu235DgCdcQ=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=n3lGhCJu0agX39bWygdp/WFfUno2MdzchtvHjchVpCRPAD9yaxjdwK5XBWjak5xu0
	 9xzF4O8VNZ/LBBnZbNFJ/mOpRje5YizORumaoSlz6W09/wCuCewPkZPTJw1T0KA8E2
	 wjqLz3um1L+mLI9f0dwtsN0iG8OAadBhTgE0m/U8bMtbBpYVaGRkPnW6hAfOCIA+NJ
	 heeryolEWDGv0RTfsRowttg1CeOxTmXku/vx/xB86LiHsY8POZgypIsb+0CN5mXpy3
	 +Aww5Ydy5vGyHc3MVFhBAiJr4jjQMQsWi99g57JrTaDhQtHMC0NPyVKBzwtFn3Tqxq
	 LMt1VxNNl2Mpg==
Date: Mon, 22 Jul 2024 09:01:02 +0200
Message-Id: <D2VVHMYC8IJ0.FSRXHH7HTH2O@kernel.org>
Cc: <leoyu@mxic.com.tw>, <alvinzhou@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add support for Macronix serial NOR flash
X-Mailer: aerc 0.16.0
References: <20240722064922.606172-1-linchengming884@gmail.com>
In-Reply-To: <20240722064922.606172-1-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_000113_208090_75B33FC6 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7463956663451999049=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7463956663451999049==
Content-Type: multipart/signed;
 boundary=61a37f4b0793f854f1fc5fc70386d52121ee25dcf8f7bb8b2f28a4a8105a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--61a37f4b0793f854f1fc5fc70386d52121ee25dcf8f7bb8b2f28a4a8105a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jul 22, 2024 at 8:49 AM CEST, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> Add support for Macronix serial NOR flash.

There was already a v9 of this series. Please provide a changelog
and resend with the correct version.

Also please provide a more elaborated cover letter as this seems to
be a split off the original series. Note that, the last submission
from Macronix was almost half a year ago. So please help jog our
memories.

-michael

>
> Cheng Ming Lin (3):
>   mtd: spi-nor: macronix: Add support for serial NOR flash
>   mtd: spi-nor: macronix: Add support for Macronix Octal flash MX25
>     series with RWW feature
>   mtd: spi-nor: macronix: Add support for Macronix Octal flash MX66
>     series with RWW feature
>
>  drivers/mtd/spi-nor/macronix.c | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)


--61a37f4b0793f854f1fc5fc70386d52121ee25dcf8f7bb8b2f28a4a8105a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZp4DrhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iCHgF/fPRq5N0qKV+7TBQ3MCrDzJ2rAnqy5CwJ
3aeeBlyS8sordJqIZJJozvunoD+CP9HIAYDf1Abxg/c0DtCnHhS5bFhRAnVZva/E
m0AvPOTs9wKA+GdcWTsXMWJzDJKKq4oUCP0=
=kX0+
-----END PGP SIGNATURE-----

--61a37f4b0793f854f1fc5fc70386d52121ee25dcf8f7bb8b2f28a4a8105a--


--===============7463956663451999049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7463956663451999049==--

