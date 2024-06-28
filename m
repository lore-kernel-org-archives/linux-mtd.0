Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2462C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY+TFVKD1h27wWMEkiXMDErRLoq2cyr4hIqtGOT8IXg=; b=IG1yCECOZQXpuF5+1th4TZgQS2
	59ckRf1EyQ5Ztz8CiEm8MlF9qQvdfwIfVkXqNpqBHj1FW7bPfnAy0VljqZ6jdx3hvkobS/njrsDS4
	6JQgfDVGm2Re29YpOWTjzgvBuwmXn8ZyfEW8axX5TsC/5tP0DiRKjbtylwI3JZLjH/ioCMjeKq54Z
	hDlMU6Bs6hztY2WkMSAAcc/lXcLp+A9LDlXpAEC3uta0Rg3yIrqr0/B8lNjq+vW85GaMc1AGt9yle
	FGlFnWcgHnyojhYkdyar6A3l2BJE/N8+02P9XzMJS5QLUzCU7AUIvNO5gnJV3QaFkKDVhFHBbw04/
	JiFRetKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDyS-0000000EH5l-3Rfm;
	Fri, 28 Jun 2024 15:57:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDyP-0000000EH5F-2tfZ
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 15:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C68EA621C5;
	Fri, 28 Jun 2024 15:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA2BC116B1;
	Fri, 28 Jun 2024 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719590236;
	bh=Fwcx8N2twodbUgIyfQuM7OlPy3OCdPpkHIpMOid9mkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts4ibjZhSPLnzk+UVMaAyTjVwkPqYx9r8myrs9O+26A2uMSTyhS9u30KLYtCGVHbG
	 91//uyYCyTdNh5ftgka+2lmYGSLjhzHipP4l3fzpo4rXL2jqzSwMMv4DS3b8h23f5N
	 yJAVxkXOaGR3gi0E2MZPMNVAS7T0oqYQOGvS+ArHHSwy1znsRWoCCVBopqXJ+Er0Y8
	 5qeHi90V4SwTnyd3/eFMHHiNuKZ66LSLBWnsJ4UZq8fiJ5R2d8oeHdswx7RTIq2dAf
	 qtmsukba2SkO1jM4O+l/s1s/OnV8RmC2BtnCdPRTKy8QMmA/mTjIZ6pFxjnJMcA2N5
	 p3921p0g+VBCA==
Date: Fri, 28 Jun 2024 16:57:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Erez Geva <erezgeva@nwtime.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Erez Geva <ErezGeva2@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR
 chip
Message-ID: <20240628-refuse-actress-b76985aa020c@spud>
References: <20240628140328.279792-1-erezgeva@nwtime.org>
 <20240628140328.279792-4-erezgeva@nwtime.org>
MIME-Version: 1.0
In-Reply-To: <20240628140328.279792-4-erezgeva@nwtime.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_085717_833900_4AAD0D69 
X-CRM114-Status: UNSURE (   8.28  )
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
Content-Type: multipart/mixed; boundary="===============8605219372346487312=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8605219372346487312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5LTHOB9fioTcbYBQ"
Content-Disposition: inline


--5LTHOB9fioTcbYBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 04:03:27PM +0200, Erez Geva wrote:
> From: Erez Geva <ErezGeva2@gmail.com>
>=20
> Add Macronix SPI-NOR mx25l12833f.
>=20
> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>

Should the email in here and in the From: field be your nwtime one?
Otherwise
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--5LTHOB9fioTcbYBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn7dVwAKCRB4tDGHoIJi
0sedAP9JZrmerATwFRELEAhhUdHLl4Rfe8TYzKPkiD4ynhuIzAD/ST3zt9wyrtPf
Dxbdg7MhOD6RltHzbstZSXDo4oHqegc=
=f7xJ
-----END PGP SIGNATURE-----

--5LTHOB9fioTcbYBQ--


--===============8605219372346487312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8605219372346487312==--

