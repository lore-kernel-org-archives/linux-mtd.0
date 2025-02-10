Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF90C0219B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJRXWmEa+udVYREOFucrpBQmWyV9Hf417B0i388O+wU=; b=si2cglpnf6C3GlfJXXEsQDdu6t
	Ea4x2GPJV9Y44yFeW5DRrjY31gZxe/2MvD6AtjnCDrXOJWJXrM8t236WRnhZqmqTQICzX7MByO41L
	aB9JrfmtkiUecJNJR638ZUZYA32rdR0VMjaNTyWRksxUFPxJgFiTVMiSd44nVHs/sYuyV0JwVqgKq
	qwlQILwfya+MePlBKl3DDu1x3QqkNbgkIUA97hXRAG7KtSvrOgbYrAkE6qpbh4HLczjCH8qx073WI
	Ff1vDb8EgYqCApvKmv1hPOfrdsYuSJuZfGSa715C5/QS12ovhg5ek6OPod457dQLf3rafXko97IMb
	/R6bRBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWW2-00000000UIB-0IOa;
	Mon, 10 Feb 2025 16:20:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWVz-00000000UHY-1eWp
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 16:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B4BCA4194E;
	Mon, 10 Feb 2025 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E92C4CED1;
	Mon, 10 Feb 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204406;
	bh=NWngG/kFcyT8WtXP/QQ25Wit1MvMYs4YLqlxYuAuRm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9PX+r4//9gugSEWU7m1K8ZM3qhMdimRiJbSiYe86/w+9bR4X4/MhCjFvOn6jCtWl
	 vB28xXU/PEd8OdGhiVaNzDs/FBXWoLFRH4kptOE8xbXpq2qGI6a1OOZVnXI0ym83jq
	 LnGs4AcqzboBOb0532JVxtDrX12IZ6wn//naY2MVFJBPlNYsR41f8I13OeonC84QCk
	 69CbLAibibKHMCZuy3S8PjUceMx28EdXjIP8T0trrzPnKbKuzKWElzT2zR5LGP78Nt
	 r0Zexk9OTbCG39S9//bUNzD+y+hVdVaV0KhwIcQGWehOvV4XsKy2wNZZpg0KLnYd2E
	 5bjdCF+rvXDcw==
Date: Mon, 10 Feb 2025 16:19:56 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
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
Message-ID: <8087f0dc-8c79-48a2-abf4-f78636c23be6@sirena.org.uk>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
 <Z6a_f03Ct9aB7Bbn@probook>
 <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
 <Z6oh9t2QQzz17Yt6@probook>
MIME-Version: 1.0
In-Reply-To: <Z6oh9t2QQzz17Yt6@probook>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_082007_560568_E7FDD148 
X-CRM114-Status: GOOD (  15.79  )
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
Content-Type: multipart/mixed; boundary="===============4153011598110512701=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4153011598110512701==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dFkCMkVIcP+mIwAz"
Content-Disposition: inline


--dFkCMkVIcP+mIwAz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 03:57:42PM +0000, J. Neusch=E4fer wrote:
> On Mon, Feb 10, 2025 at 12:59:35PM +0000, Mark Brown wrote:

> > Please don't do this, it just makes it harder to merge things since it
> > makes it look like there's cross tree merges needed when that's not the
> > case, complicating merging, and puts the entire series in everyone's
> > inbox which makes things more noisy.

> How should I proceed with this series, in your opinion?
> I see potential advantages (less of the issues you describe) and
> disadvantages (somewhat harder to track patches) of splitting it up
> before sending v3.

I'd rather that at least the SPI stuff were sent separately (well,
ideally what you've done already is fine and it doesn't need a resend at
all).

--dFkCMkVIcP+mIwAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqJysACgkQJNaLcl1U
h9DNKQf/fZPJSroWubfTO8FLkUiOu5OAUNqM92OSlaM82yLjpcppqTwDH2c/TMS7
uzik6Kqwe9iL95z0VpO/SEQh2gEiVVotP2LwUfc0VHm6Mj0CYUhJVu5CFspP2PTu
H7A2qsXCPw2ASwOg8ZA+oH0PpNAI2mBdDeb7Dii4r186WNPit5Xunpx8I+9DoEyr
Zr6lOUeCFVfJVy6oNc7ZCQUhRljOVtlyRzPVMTpsyaMzgT22K+F+CHvQR/XatQQF
/2ywiEFKi5u2DSNtEgro0CF6bJ4U/ZtRMGcnEq9r6RmhpAINqFJhS0dysaqOIJfS
37TAqV/OvijdnS0RGY+GC+jyvnaoJA==
=DC91
-----END PGP SIGNATURE-----

--dFkCMkVIcP+mIwAz--


--===============4153011598110512701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4153011598110512701==--

