Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E07C0219D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWbvYNVBloV29Ur6j4YliRGXxtSUBIqdPOeht9ivEoo=; b=JpM6ootkFOg4bfUBE63b6+QoYn
	Jrw5Y4k0e3gOrzLeP1nJrfiKbCsk1RiEfN0RNN247vA1Jz0E17CtKl7St+urdmkLlvOnmkggAAZkY
	HShcaoUxshW48FlNFR27N4kNrL/cpMgPDwAqlYkcd+Ym8rkavJdsJ5KeAfWdSyzbVYbbUuhvZOsCL
	d2E4LSqGpm5olOLTtWhMnVGuDq5osbYvDQdUZhbcfF6nTKR7gWizf9NXvj+Ot3odrFa0n+twkA2kR
	Yfag1q/3Q9eVpj6NdCwhtNaQddws9kAB0Hi8chmlcl5n/C9yq2CroklzojJbF/VPKj/h8VsQNL9Kc
	sj8Eb+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWDO-0000000BIYn-0st7;
	Fri, 07 Feb 2025 21:48:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgW3E-0000000BGUa-2X1K
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FC385C06C0;
	Fri,  7 Feb 2025 21:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DF4C4CED1;
	Fri,  7 Feb 2025 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738964295;
	bh=7xVwhwDjoai8YSxFqqwGSBjxwD2KZy4EIiDqNHKYu+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfyiv5cuS/GU2byBNx1/HS6vFu4XgUVKiwxJxFKa4f3ofnDnF5InCMn2/xpuWS58N
	 4QtqPZCaUgmr79HJ9xmM78pXb89BQLwgxXvc33Lh+3EQeafVlBrVppNrK8XOQUw5H8
	 UJR9X0noZ/1FbX4W1ZBZAMhUYy9BgxOGEd9MwMZFlu4BmJKNV6MQRgPREDIoJFchfh
	 vkIpTE9C01BimsoJ3MqyEWHAtinnUWxUS8B374bKNWOXDU9Asd0dSh8FiOORDf92iW
	 aQPWNpap/IIavA7B9QLaDyt/3GM8gUFwZBNJqf8kGVt3NewUlFLL83a8JTzoH0ByF2
	 gYO4ujWIo0Hvw==
Date: Fri, 7 Feb 2025 21:38:05 +0000
From: Mark Brown <broonie@kernel.org>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
MIME-Version: 1.0
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133816_728413_1FE490BB 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Type: multipart/mixed; boundary="===============0030599281002962781=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0030599281002962781==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yv3YhmJAoxj+QMAv"
Content-Disposition: inline


--Yv3YhmJAoxj+QMAv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:30:17PM +0100, J. Neusch=E4fer via B4 Relay wrot=
e:

> This is a spin-off of the series titled
> "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".

> During the development of that series, it became clear that many
> devicetree bindings for Freescale MPC8xxx platforms are still in the old
> plain-text format, or don't exist at all, and in any case don't mention
> all valid compatible strings.

What's the story with dependencies here - why is all this stuff in one
series?  Normally I'd expect bindings conversions to be standalone.

--Yv3YhmJAoxj+QMAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemfT0ACgkQJNaLcl1U
h9Dq1Af/eChCpyVx52hhPj2Ppke4XqgRYwHfMx1ZD4zg9Fv5cLy+pNBr/CAHHckC
zFU84oMRCqn0Y8VcKQo6h/qnhsFnmdYxFgRmYg1kXZIm+jfrFUtTHfRH4I/8b95Z
G2JrWA/AN9rNXn2n7I0gL2mBLfXBlTl2GlESRinIHR9eESMM/hJAQmkkw2xpgeCM
lc0xNSEPmuS3M0+rYNtypbnc1bbGXU6zVOEz+5Ennz6bHPi6q6Amjz6HBLyoln3X
3F9zfSERvGPIA442jE6Qm6cFH4S7Vv/L4urjeIvSe7le626ajH99YJZl1BSFaPLR
qcOQY87d6Kjx7kPP+wMJG/Lfhrmprg==
=9fhs
-----END PGP SIGNATURE-----

--Yv3YhmJAoxj+QMAv--


--===============0030599281002962781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0030599281002962781==--

