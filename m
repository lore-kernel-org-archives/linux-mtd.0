Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A3C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYPs58bsLxiD2HsUwf20IMAwfx2XzDBtiiBJFzX05Sg=; b=TzzkgWzats9GEIKkeu54ZRPSAK
	AKFds5gj70Li7xw9eOrs+LGS9WklJFKM3H+t4IZtvucr73s0EV8cjV0ws+t+qherhx3vMFQIJxpBY
	p69flQ3J2Zvoh8jkFcWjpqawsGn+bx/5HDVD6CnclewRD96tsceRqHjLjxhEQwVkJSVwsAeFPo1Yo
	RLXt9hiBd124vk0dhgcrg0N4ec2RlyZkpWeiwBFutu06NallPJ/yEQcuWmIhHVDGkNScwkR0mDKCk
	fLiXFgrSwEyct35e7s5s3L8xqKV6+ZV1Tlro2fPU91NzJjn9Fz3OIy4p4sH8QLO+Q2F2uaonvHfL1
	oBM4JoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchxJ-000000003ld-4A9P;
	Wed, 21 Feb 2024 08:27:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchxH-000000003gF-0jQI
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 08:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E236DCE1C78;
	Wed, 21 Feb 2024 08:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB85C433F1;
	Wed, 21 Feb 2024 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708504068;
	bh=qRF4WCJKc+7S2gxfQOFzn1ROveekqZHEyCJTKXwAiaY=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=ic0r5xFINXXfSYwtRByHBDYCIIEXVlDmlX9u6RJOne05/VJXk1+j1q4mdnEyZbF1a
	 iZiYbRsL9AhR1xtRq6ANz1L0DT5qwP6O5G+W/u2xnOPBhTlQfVrixsef+SCg0d3N0N
	 H+RjDX4noEDX4FRHv4ABXGiM3p+Fuxzb7Or8ks41/f/Vd1CUZ2kSlBXDtM10Da2gMR
	 JeyZ6UJpoWxoLudFXiX4MhLn0kl9TYprLFkdJRmlZ9G5iGiz+BanzJemu7i1F36Dcz
	 UngXbqZljgCe/pFnRIeTeUYGtcW0ZERtpHbHRPyQwrg15OlK9/O4LmOisfIh855emV
	 JaVcjoQEc27zw==
Date: Wed, 21 Feb 2024 09:27:38 +0100
Message-Id: <CZAM553H2H56.2TDN36QEL90XX@kernel.org>
To: "Josua Mayer" <josua@solid-run.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts
 property
Cc: "Yazan Shhady" <yazan.shhady@solid-run.com>, "Rob Herring"
 <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
In-Reply-To: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_002751_445083_13694A5A 
X-CRM114-Status: UNSURE (   6.62  )
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
Content-Type: multipart/mixed; boundary="===============7754711718494525681=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7754711718494525681==
Content-Type: multipart/signed;
 boundary=42ada7a77eafabbea00286cefa9886bdf49729263a69fbabf35bf5d7c998;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--42ada7a77eafabbea00286cefa9886bdf49729263a69fbabf35bf5d7c998
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Feb 19, 2024 at 3:41 PM CET, Josua Mayer wrote:
> Some spi flash memories have an interrupt signal which can be used for
> signalling on-chip events such as busy status or ecc errors to the host.

Do you have an example? Maybe one with a public datasheet?

-michael

--42ada7a77eafabbea00286cefa9886bdf49729263a69fbabf35bf5d7c998
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdWz+hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvt0fgD/RoTM/WunYCUK3dUGUG8NLVQCFB4h26Bo
4czKnwqDcDwBALS7CgrZHUZ7QKgh1ApV8U0F99kDhl/Li96dj981Ta4J
=+hWC
-----END PGP SIGNATURE-----

--42ada7a77eafabbea00286cefa9886bdf49729263a69fbabf35bf5d7c998--


--===============7754711718494525681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7754711718494525681==--

