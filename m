Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B144EC5AD49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bspwC+Lu6CFbM2HEb091Se9yFngf0FtaVRCBFaxkYg=; b=sHW2BjE+hWMaO2+d7H9mL8NP6T
	zrdj1s/CuaeXl1srlcVZzg35jYELvJaiqhDv0ZR4wGmm3KxXYc3ez/Oui5uGvJ5UaXfp0HKSXnZeq
	OM48UNlOwXlFxVXCu9yLhe4SKv6V1mITC/G1jBVpiAKwQyaaw3vv0HQP3RGOBnDcACgNtRpYhLJlD
	ppDwZafAfr1xj0N6TfRGpM1ayfUMlgL1d940ATXtX17qiuRxkpM/brxN+mhBOoJ9n8boIhTnr697H
	NtqvGlxe8De53TXF59npRXTLaXLCHo2z6esWYvwarOVKAY//2rHV+1zcn7rLFZ1A101IXXOpIoGFK
	6RMZpzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZXb-000000097FN-1iAo;
	Mon, 26 May 2025 15:15:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZXY-000000097EK-22Ph;
	Mon, 26 May 2025 15:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DEAD5C41F9;
	Mon, 26 May 2025 15:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2BBC4CEE9;
	Mon, 26 May 2025 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748272498;
	bh=hFGRcfD0Y2n8tquVud5hBr54D9H+RrZF/YlhNIB3mp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d11PDPZwjxXYqjOAS0hpdMCtQMffOYc96Z0AX5n2fka3qyWh35Qs6jXhlgTe7Sh3s
	 QEp6vRfFQbqv0L0CTkR3ujXn6IrNJVCwnZMju/6qUoTlKr+1Lb7oX+8Xw45Eh4LlsX
	 SP4TN5/frytZ2tl9d68YmZIWJkkJnrcGCr3uhm0RwJsZiDVnQzfbvon272Z3ILDM9Q
	 4RgMjjyeMZ9Fdg4CJ4Ag3ivVHKARNjrJvvWJMAKnjL7vSzRSuKV5XcOUrIy05zizkr
	 876DBdToY1mKDKetGx0LQwJMh6eBTzn5zpLatzX++1t+5o+qCBrX+KgKksbIHPtPGj
	 iGd7Td8r1h2jA==
Date: Mon, 26 May 2025 16:14:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: spi-sg2044-nor: Add SOPHGO
 SG2042
Message-ID: <20250526-celery-penniless-adeed760308b@spud>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
 <20250525-sfg-spifmc-v2-1-a3732b6f5ab4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250525-sfg-spifmc-v2-1-a3732b6f5ab4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_081500_569224_D875A42D 
X-CRM114-Status: UNSURE (   9.15  )
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
Content-Type: multipart/mixed; boundary="===============1232097983373341158=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1232097983373341158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3cRYTBgHkSKip73E"
Content-Disposition: inline


--3cRYTBgHkSKip73E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 10:58:41PM +0800, Zixian Zeng wrote:
> Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
> which is compatible with SOPHGO SG2044.
>=20
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3cRYTBgHkSKip73E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSFbAAKCRB4tDGHoIJi
0vvRAQC1yxztI2Z6owktYW9zecEyYKO6H2lY5nM7yjC9X9ZNsQEAjHE9q523CcF7
ugJZyD6pN+G7L/lRxhr81CKvhalv5wA=
=aYhi
-----END PGP SIGNATURE-----

--3cRYTBgHkSKip73E--


--===============1232097983373341158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1232097983373341158==--

